<#
.SYNOPSIS
Create the Authentication object that is required in each call within the module 

.DESCRIPTION
Create the authentication object that is required in each call within the module. Recommended to create a variable to call with the Authentication object.  

.PARAMETER Server
Specifies the server where CrushFTP is located. You could either provide a IP address or a DNS record (54.10.1.20 or http://ftp.contoso.com)

.PARAMETER Port
Specifies the port used and opened for the CrushFTP server (typical FTP ports: 8080,21,9090,443,2222)

.PARAMETER Username
Specifies the user with enought permissions to do an authentication call

.PARAMETER Password
Specifies the password for the user account with enough permissions to do an authentication call

.EXAMPLE
New-CrushAuthenticationObject -Server "120.20.32.10" -Port "8080" -Username "crushadmin" -Password "passwd123"

Recieve an Authentication object by providing IP address and port for HTTP

.EXAMPLE
New-CrushAuthenticationObject -Server "http://ftp.contoso.com" -Port "21" -Username "crushadmin" -Password "passwd123"

Recieve an Authentication object by providing DNS address and port for FTP

.EXAMPLE
$AuthObject = New-CrushAuthenticationObject -Server "http://ftp.contoso.com" -Port "21" -Username "crushadmin" -Password "passwd123"

Recieve an Authentication object by providing DNS address and port for FTP and save it to a variable named AuthObject

.INPUTS
AuthenticationObject
The AuthenticationObject is generated with the function New-CurshAuthenticationObject and referenced into this function under the parameter -AuthenticationObject

.OUTPUTS
The output contains authentication information as well as the default endpoint. 

Endpoint                                         PSRestMethodAuthorization                              AuthorizationToken                               AuthorizationType
--------                                         -------------------------                              ------------------                               -----------------
http://ftp.contoso.com:21/WebInterface/function  Basic kwE3fS46SASa5nbGV0sdf33dzb2Z0d2Fysje23jDERka30   kwE3fS46SASa5nbGV0sdf33dzb2Z0d2Fysje23jDERka30   Basic            

#>

function New-CrushAuthenticationObject {
Param(
    [Parameter(Mandatory=$true)][string]$Server,
    [Parameter(Mandatory=$false)][int]$Port,
    [Parameter(Mandatory=$true)][string]$Username,
    [Parameter(Mandatory=$true)][string]$Password
)

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$BasicAuthentication = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $Username,$Password)))


    if($Server -match "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$") {
        Write-Verbose "Server parameter is an IP"
        if(![string]::IsNullOrEmpty($Port)) {
            $Endpoint = "http://$($Server):$($Port.toString())/WebInterface/function"
        } else {
            $Endpoint = "http://$($Server)/WebInterface/function"
        } 
    } elseif ($Server -match "https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)") {
        Write-Verbose "Server parameter is an URL"
        if(![string]::IsNullOrEmpty($Port)) {
            $Endpoint = "$($Server):$($Port.toString())/WebInterface/function"
        } else {
            $Endpoint = "$($Server)/WebInterface/function"
        } 
    } else {
        Throw "Unable to verify the Server parameter, IP (10.1.1.0) or URL (http://contoso.com) is required" 
    }

    $AutheticationObject = New-Object PSObject -Property @{
        Endpoint = $Endpoint
        AuthorizationType = "Basic"
        AuthorizationToken = $BasicAuthentication
        PSRestMethodAuthorization = "Basic $BasicAuthentication"
    }

return $AutheticationObject

}