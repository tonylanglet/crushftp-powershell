function New-CrushVFSPermission {
Param(
    [Parameter(Mandatory=$false)]
    [string]$Path = "/",

    [Parameter(Mandatory=$false)]
    [switch]$Read = $true,

    [Parameter(Mandatory=$false)]
    [switch]$Write,

    [Parameter(Mandatory=$false)]
    [switch]$View = $true,

    [Parameter(Mandatory=$false)]
    [switch]$Delete,

    [Parameter(Mandatory=$false)]
    [switch]$DeleteDirectory,

    [Parameter(Mandatory=$false)]
    [switch]$MakeDirectory,

    [Parameter(Mandatory=$false)]
    [switch]$Rename,

    [Parameter(Mandatory=$false)]
    [switch]$Resume = $true,

    [Parameter(Mandatory=$false)]
    [switch]$Share,
    
    [Parameter(Mandatory=$false)]
    [ValidateSet(“Normal”, "Async")]
    [string]$Replicate
)

$Permissions = ""

    if($Read) { $Permissions += "(read)" }
    if($Write) { $Permissions += "(write)" }
    if($View) { $Permissions += "(view)" }
    if($Delete) { $Permissions += "(delete)" }
    if($DeleteDirectory) { $Permissions += "(deletedir)" }
    if($MakeDirectory) { $Permissions += "(makedir)" }
    if($Rename) { $Permissions += "(rename)" }
    if($Resume) { $Permissions += "(resume)" }
    if($Share) { $Permissions += "(share)" }
    if(![string]::IsNullOrEmpty($Replicate)) {
        if($Replicate -eq "Async") {
            $Permissions += "(replicate_async)"
        } else {
            $Permissions += "(replicate)"
        }
    }

    if($Path -eq "/") {
        #No changes
    } else {
        if($Path.Contains("/")) {
            $Path = $Path.TrimStart("/").TrimEnd("/")
            $Path = "/$Path/"
        } else {
            $Path = "/$Path/"
        } 
    }

$PermissionXMLObject = @"
<item name="$Path">$Permissions</item>
"@

return $PermissionXMLObject

}