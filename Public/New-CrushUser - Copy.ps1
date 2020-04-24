function New-CrushftpUser {
Param(
    [Parameter(Mandatory=$true)][string]$Username,
    [Parameter(Mandatory=$true)][string]$Password,
    [Parameter(Mandatory=$false)][string]$ServerGroup = "MainUsers",
    [Parameter(Mandatory=$false)][string]$CreatedByUsername,
    [Parameter(Mandatory=$false)][string]$CreatedByEmail,
    [Parameter(Mandatory=$false)][int]$MaxLogins = 0,
    [Parameter(Mandatory=$false)][string]$RootDir = "/",
    [Parameter(Mandatory=$false)][string[]]$Permissions,
    [Parameter(Mandatory=$false)][string[]]$VFSItems,
    [Parameter(Mandatory=$true)][psobject]$AuthenticationObject
)

    $Body = "command=setUserItem&data_action=new&serverGroup=$ServerGroup&username=$Username&xmlItem=user"

    ### User Parameters
    $CreatedTime = Get-Date -Format MMddyyyyhhmmss
    $UserParameters = "<?xml version=""1.0"" encoding=""UTF-8""?><user type=""properties""><created_by_username>$CreatedByUsername</created_by_username><created_by_email>$CreatedByEmail</created_by_email><created_time>$CreatedTime</created_time><username>$Username</username><password>$Password</password><max_logins>$MaxLogins</max_logins><root_dir>$RootDir</root_dir></user>"

    $Body += "&user=$(([uri]::EscapeUriString($UserParameters)).Replace("?","%3F").Replace("=","%3D"))"

    ### VFS_Item Parameters
    $regexVFSItems = '^<\?xml version="1\.0" encoding="UTF-8"\?><vfs_items type="vector">i?.*<\/vfs_items>$'

    if($VFSItems) {  
        if($VFSItems.Count -gt 1) { 
        Write-Verbose "VFS Items: Found multiple VFS items" 
            $MultipleVFSItems = ""
            foreach($item in $VFSItems) {
                if($item -match $regexVFSItems) {
                    $item = $item -replace '<\/vfs_items>$', '' # TrimEnd
                    $item = $item -replace '^<\?xml version="1\.0" encoding="UTF-8"\?><vfs_items type="properties">i?', '' #TrimStart
                    $MultipleVFSItems += $item
                } else {
                    $MultipleVFSItems += $item
                }
            }

            $VFSItemsParmeters = "<?xml version=""1.0"" encoding=""UTF-8""?><vfs_items type=""vector"">$MultipleVFSItems</vfs_items>"

        } else {
        Write-Verbose "VFS Items: Found single VFS item"
            if($VFSItems -match $regexVFSItems) {
                $VFSItemsParmeters = $VFSItems
            } else {
                $VFSItemsParmeters = "<?xml version=""1.0"" encoding=""UTF-8""?><vfs_items type=""vector"">$VFSItems</vfs_items>"
            }
        }

    $Body += "&vfs_items=$(([uri]::EscapeUriString($VFSItemsParmeters)).Replace("?","%3F").Replace("=","%3D"))"
    }


    ### Permissions Parameters
    $regexPermissions = '^<\?xml version="1\.0" encoding="UTF-8"\?><VFS type="properties">i?.*<\/VFS>$'

    if($Permissions) {  
        if($Permissions.Count -gt 1) { 
        Write-Verbose "VFS Permission: Found multiple permissions" 
            $MultiplePermissions = ""
            foreach($item in $Permissions) {
                if($item -match $regexPermissions) {
                    $item = $item -replace '<\/VFS>$', '' # TrimEnd
                    $item = $item -replace '^<\?xml version="1\.0" encoding="UTF-8"\?><permissions type="properties">i?', '' #TrimStart
                    $MultiplePermissions += $item
                } else {
                    $MultiplePermissions += $item
                }
            }

            $PermissionParmeters = "<?xml version=""1.0"" encoding=""UTF-8""?><permissions type=""properties"">$MultiplePermissions</permissions>"

        } else {
        Write-Verbose "VFS Permission: Found single permission"
            if($Permissions -match $regexPermissions) {
                $PermissionParmeters = $Permissions
            } else {
                $PermissionParmeters = "<?xml version=""1.0"" encoding=""UTF-8""?><permissions type=""properties"">$Permissions</permissions>"
            }
        }

    $Body += "&permissions=$(([uri]::EscapeUriString($PermissionParmeters)).Replace("?","%3F").Replace("=","%3D"))"
    }

    $RequestObject = @{
        Uri = $AuthenticationObject.EndPoint
        Method = "POST"
        Header = @{
            "Authorization" = $AuthenticationObject.PSRestMethodAuthorization
            "Content-Type" = "application/x-www-form-urlencoded"
            "Accept" = "application/x-www-form-urlencoded"
        }
        Body = $Body
    }

    try {
        $response = Invoke-RestMethod @RequestObject
        Write-Host "Successfully created used $response"
    } catch { 
        $response = $_.Exception.Response.GetResponseStream()
        $reader = New-Object System.IO.StreamReader($response)
        $reader.BaseStream.Position = 0
        $reader.DiscardBufferedData()
        $responseBody = $reader.ReadToEnd()
        Write-Verbose "Unable to Invoke RestMethod, Exception: $_"
    }

    if($response.result.response_status -eq "OK") {
        return $response.result.response_data
    } else {
        return $response.result.response_status
    }

}