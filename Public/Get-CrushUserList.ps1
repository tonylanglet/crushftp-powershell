<#
.SYNOPSIS
Display all usernames in the specific server group 

.DESCRIPTION
Display the username of all users in the specific user group, the default group is MainUsers which could be translated to all users. 

.PARAMETER ServerGroup
Specifies the server group to list all users from, "MainUser" is default

.PARAMETER AuthenticationObject
The Authentication object used to authenticate to the CrushFTP service, if any functions requiring admin rights in the system so do the calls from here

.EXAMPLE
Get-CrushUserList -AuthenticationObject (New-CrushAuthenticationObject -Server '50.40.30.20' -Port '8080' -Username 'crushadmin' -Password '1234')

List all users from the MainUser group (global all list) 

.EXAMPLE
Get-CrushUserList -ServerGroup "Admins" -AuthenticationObject $CrushAuthenticationObject

List all users from the specified server group with the name of Admin, -AuthenticationObject is using a Parameter created from the function New-CrushAuthenticationObject

.INPUTS
AuthenticationObject
The AuthenticationObject is generated with the function New-CurshAuthenticationObject and referenced into this function under the parameter -AuthenticationObject

.OUTPUTS
The output is a list of all users in the specified server group, default MainUsers.

#>

function Get-CrushUserList {
Param(
    [Parameter(Mandatory=$false)]   
    [string]$ServerGroup = "MainUsers",

    [Parameter(Mandatory=$true)]
    [psobject]$AuthenticationObject
)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    $Body = "command=getUserList&serverGroup=$ServerGroup"

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
        Write-Host "Got a response..."
    } catch { 
        $response = $_.Exception.Response.GetResponseStream()
        $reader = New-Object System.IO.StreamReader($response)
        $reader.BaseStream.Position = 0
        $reader.DiscardBufferedData()
        $responseBody = $reader.ReadToEnd()
        Write-Verbose "Unable to Invoke RestMethod, Exception: $_"
    }

    if($response.result.response_status -eq "OK") {
        return $response.result.response_data.user_list.user_list.user_list_subitem
    } else {
        return $response.result.response_status
    }

}