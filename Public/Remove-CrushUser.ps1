<#
.SYNOPSIS
Remove a user account in CrushFTP 

.DESCRIPTION
Removes a user object in your CrushFTP isntance.

.PARAMETER Username
Specify the name of the user account to be removed

.PARAMETER ServerGroup
Specifies the server group where the user account is located, "MainUser" is default

.PARAMETER AuthenticationObject
The Authentication object used to authenticate to the CrushFTP service, if any functions requiring admin rights in the system so do the calls from here

.EXAMPLE
Remove-CrushUser -Username "john.doe"  -AuthenticationObject (New-CrushAuthenticationObject -Server '50.40.30.20' -Port '8080' -Username 'crushadmin' -Password '1234')

Removes the user account with the username john.doe 

.EXAMPLE
New-CrushUser -Username "john.doe@contoso.com" -ServerGroup "Admins" -AuthenticationObject $CrushAuthenticationObject

Removes the user account with the username john.doe located in the Admin server group

.INPUTS
AuthenticationObject
The AuthenticationObject is generated with the function New-CurshAuthenticationObject and referenced into this function under the parameter -AuthenticationObject

.OUTPUTS
The output is an XML object directly from CrushFTP with information regarding the status and data

#>

function Remove-CrushUser {
Param(
    [Parameter(Mandatory=$true)][string]$Username,
    [Parameter(Mandatory=$true)][string]$ServerGroup = "MainUsers",
    [Parameter(Mandatory=$true)][psobject]$AuthenticationObject
)

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    # Initial Body buildup
    $Body = "command=setUserItem&data_action=delete&serverGroup=$ServerGroup&username=$Username&xmlItem=user"

    ## Clearing Settings
    $VFSSettings = "<?xml version=""1.0"" encoding=""UTF-8""?><vfs type=""vector""></vfs>"
    $Body += "&vfs_items=$(([uri]::EscapeUriString($VFSSettings)).Replace("?","%3F").Replace("=","%3D"))"
    
    $PermissionSettings = "<?xml version=""1.0"" encoding=""UTF-8""?><permissions type=""vector""></permissions>"
    $Body += "&permissions=$(([uri]::EscapeUriString($PermissionSettings)).Replace("?","%3F").Replace("=","%3D"))"

    $UserSettings = "<?xml version=""1.0"" encoding=""UTF-8""?>"
    $Body += "&user=$(([uri]::EscapeUriString($UserSettings)).Replace("?","%3F").Replace("=","%3D"))"

    ## Request
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
        Write-Host "Successfully removed user [$Username]"
    } catch { 
        Write-Error "Unable to Invoke RestMethod, Exception: $_"
    }

    if($response.result.response_status -eq "OK") {
        return $response.result.response_status
    } else {
        return $response.result.response_status
    }

}