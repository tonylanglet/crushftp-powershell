<#
.SYNOPSIS
Recieve detailed information about the server setup

.DESCRIPTION
Get the current open/closed connections of the server and the lookup IPs and ports.
Within the product CrushFTP the server info is being updated each second to be able to monitor the usage and connections of the different IP's...

.PARAMETER AuthenticationObject
The Authentication object used to authenticate to the CrushFTP service, if any functions requiring admin rights in the system so do the calls from here

.EXAMPLE
Get-CrushServerInfo -AuthenticationObject (New-CrushAuthenticationObject -Server '50.40.30.20' -Port '8080' -Username 'crushadmin' -Password '1234')

Get the server item setup information

.INPUTS
AuthenticationObject
The AuthenticationObject is generated with the function New-CurshAuthenticationObject and referenced into this function under the parameter -AuthenticationObject

.OUTPUTS
The output is detailed information regarding the FTP lookup IP's and ports and server information of setup

type               : properties
linkedServer       : MainUsers
proxy_header       : false
port               : 21
pasv_ports         : 1025-65535
connected_users    : 0
server_ip          : auto
explicit_ssl       : true
ip_restrictions    : ip_restrictions
require_encryption : false
connection_number  : 80
running            : true
ftp_aware_router   : true
ip                 : lookup
display            : ftp://120.10.1.54/ ( SSL TLS ) is running, 0 users connected. Connections Processed : 80
explicit_tls       : true
serverType         : FTP
busyMessage        : 
....
#>

function Get-CrushServerInfo {
Param(
    [psobject]$AuthenticationObject
)

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    if($AuthenticationObject) {
        $Body = "command=getServerItem&key=server_info/server_list"

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
            return $response.result.response_data.result_value.result_value_subitem
        } else {
            return $response.result.response_status
        }
    }
}