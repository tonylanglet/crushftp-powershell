<#
.SYNOPSIS
Recieve information regarding a specific user account

.DESCRIPTION
Recieve information regarding a specific user account and the user settings as well as permissions and VFS items 

.PARAMETER Username
Specifies the username of the account to recieve information about

.PARAMETER ServerGroup
Specifies the server group to list all users from, "MainUser" is default

.PARAMETER AuthenticationObject
The Authentication object used to authenticate to the CrushFTP service, if any functions requiring admin rights in the system so do the calls from here

.EXAMPLE
Get-CrushUserList -Username "john.doe" -AuthenticationObject (New-CrushAuthenticationObject -Server '50.40.30.20' -Port '8080' -Username 'crushadmin' -Password '1234')

Display information regarding the user account named john.doe

.EXAMPLE
Get-CrushUserList -Username "john.doe" -ServerGroup "Admins" -AuthenticationObject $CrushAuthenticationObject

List the user account with name john.doe in the specified server group with the name Admin, -AuthenticationObject is using a Parameter created from the function New-CrushAuthenticationObject

.INPUTS
AuthenticationObject
The AuthenticationObject is generated with the function New-CurshAuthenticationObject and referenced into this function under the parameter -AuthenticationObject

.OUTPUTS
The output is detailed information about a user account in a XML object directly from CurshFTP.

#>

function Get-CrushUser {
Param(
    [Parameter(Mandatory=$true)]
    [string]$Username, 
    
    [Parameter(Mandatory=$false)]   
    [string]$ServerGroup = "MainUsers",

    [Parameter(Mandatory=$true)]
    [psobject]$AuthenticationObject
)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    $Body = "command=getUser&serverGroup=$ServerGroup&username=$Username"

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
        Write-Error "Unable to Invoke RestMethod, Exception: $_"
    }

    if($response.result.response_status -eq "OK") {
        return $response.result.response_data.user_items
    } else {
        return $response.result.response_status
    }

}