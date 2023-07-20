<#
.SYNOPSIS
Creates a new user object in your CrushFTP instance 

.DESCRIPTION
Creates a new user object in your CrushFTP isntance.
You could create a simple user by just adding a username. You also have the opportunity to create a well custom made user account,
There's Admin settings, User settings, Misc settings that could be added to the creation of a new user object. 

.PARAMETER Username
Specify the name of the user account

.PARAMETER Password
Password used for the user account

.PARAMETER ServerGroup
Specifies the server group, "MainUser" is default

.PARAMETER CreatedByUsername
Specifies the account creating the new user object by username

.PARAMETER CreatedByEmail
Specifies the account creating the new user object by email

.PARAMETER MaxLogins
Specifies the amount of maximum logins allowed, "0" (unlimited) default 

.PARAMETER RootDir
Specifies the Root directory, "/" (root) is default

.PARAMETER Permissions
Specifies the permissions on a Virtual File Storage (VFS), Preferably use the New-CrushVFSPermission to create a Permission object. Multiple permissions can be added with comma{,} separation

.PARAMETER VFSItems
Specifies a Virtual File Storage (VFS), Preferably use the New-CrushVFSItem to create a VFS object. Multiple VFS items can be added with comma{,} separation

.PARAMETER AuthenticationObject
The Authentication object used to authenticate to the CrushFTP service, if any functions requiring admin rights in the system so do the calls from here

.PARAMETER Email
Specifies the email of the user account

.PARAMETER FirstName
Specifies the first name of the user account

.PARAMETER LastName
Specifies the last name of the user account

.PARAMETER Salt
Password object

.PARAMETER Phonenumber
Specifies the phone number of the user account

.PARAMETER AutoSetPassword
Automatically set a password on the next login

.PARAMETER LinkedVFS
Link a specific accounts VFS settings to the user account

.PARAMETER LoginMaxTime
Specifies the time until the login session expires and a new login is required

.PARAMETER IdleMaxTime
Specifies the amount of time allowed to idle before being kicked out of the session

.PARAMETER UploadMaxSpeed
Specifies the speed (K/sec, 0=unlimited)

.PARAMETER UploadMinSpeed
Specifies the speed (K/sec, 0=unlimited)

.PARAMETER DownloadMaxSpeed
Specifies the speed (K/sec, 0=unlimited)

.PARAMETER DownloadMinSpeed
Specifies the speed (K/sec, 0=unlimited)

.PARAMETER DownloadToUploadRatio
Specifies the upload ratio of X to 1 (0=unlimited)

.PARAMETER DownloadToUploadRatioPermanent
Permanent Ratio

.PARAMETER UploadMaxFileSize
Maximum upload individual file size (in K, 0=unlimited)

.PARAMETER UploadMaxAmountPerSession
Specifies the maximum upload amount per session (in K, 0=unlimited)

.PARAMETER UploadMaxAmountPerDay
Specifies the maximum upload amount per day (in K, 0=unlimited)

.PARAMETER UploadMaxAmountPerMonth
Specifies the maximum upload amount per month (in K, 0=unlimited)

.PARAMETER DownloadMaxAmountPerSession
Specifies the maximum download amount per session (in K, 0=unlimited)

.PARAMETER DownloadMaxAmountPerDay
Specifies the maximum download amount per day (in K, 0=unlimited)

.PARAMETER DownloadMaxAmountPerMonth
Specifies the maximum download amount per month (in K, 0=unlimited)

.PARAMETER UploadMaxCountPerSession
Specifies the maximum upload amount files per session (0=unlimited)

.PARAMETER UploadMaxCountPerDay
Specifies the maximum upload amount files per day (0=unlimited)

.PARAMETER UploadMaxCountPerMonth
Specifies the maximum upload amount files per month (0=unlimited)

.PARAMETER DownloadMaxCountPerSession
Specifies the maximum download amount files per session (0=unlimited)

.PARAMETER DownloadMaxCountPerDay
Specifies the maximum download amount files per day (0=unlimited)

.PARAMETER DownloadMaxCountPerMonth
Specifies the maximum download amount files per month (0=unlimited)

.PARAMETER PartialDownloadDisabled
Specifies if partial download is allowed

.PARAMETER DirectoryCalculationDepth
Specifies if directory size calculation should be enabled and the which level of depth, default is 1

.PARAMETER DirectoryCountCalculationsEnabled
Specfies if directory count calculation should be enabled

.PARAMETER AS2EncryptKeystorePath
Specifies the path to the Keystore on the server

.PARAMETER AS2EncryptKeystoreFormat
Specifies the keystore format (JKS,PKCS12)

.PARAMETER AS2EncryptKeystorePassword
Specifies the keystore password

.PARAMETER AS2EncryptKeyAlias
Specifies the key name (alias)

.PARAMETER AS2EncryptKeyPassword
Specifies the key password

.PARAMETER AS2SignatureKeystorePath
Specifies the signature verification keystore path

.PARAMETER AS2SignatureKeystoreFormat
Specifies the signature verification keystore format (JKS, PKSC12)

.PARAMETER AS2SignatureKeystorePassword
Specifies the signature verification keystore password

.PARAMETER AS2SignatureKeyAlias
Specifies the signature verification keystore name (alias)

.PARAMETER AS3Allowed
Specifies if to process As3 files

.PARAMETER ParentQuotaDirectory
Specifies which directory to use for quota, leave blank or use '../', be cautious...

.PARAMETER ZipstreamAllowed
Specifies if to allow '.zipsteam' extension

.PARAMETER ZipstreamDMZAllow
Specifies if to allow '.zipsteam' extension on DMZ

.PARAMETER AccountExpireDate
Specifies the account expiration date (MM/dd/yyyy hh:mm:ss AM/PM), leve blank for no expiration

.PARAMETER AccountExpireTask
Specifies a task to run on account expire

.PARAMETER AccountExpireRollingDays
Specifies if to extend expiration if used every x days

.PARAMETER AccountExpireDelete
Specifies if the account should be removed on expiration, works together with AccountExpireDate

.PARAMETER ExpirePassword
Specifies if to expire the password instantly

.PARAMETER ExpirePasswordDays
Specifies how many days until the password expires

.PARAMETER ExpirePasswordDate
Specifies what date the password expires (MM/dd/yyyy hh:mm:ss AM/PM), leve blank for no expiration

.PARAMETER SimultaneousMaxLogins
Specifies the maximum amount of simultaneous logins are allowed, -1=disable, 0=unlimited

.PARAMETER LoginsMaxPerIP
Specifies the maximum amount of logins from the same IP

.PARAMETER LoginsMaxPerIPAutoKick
Specifies if the oldest session should be automatically kicked if the maximum logins are exceded

.PARAMETER LoginMaxFailures
Specifies the maximum login failures that are allowed before the account is disabled

.PARAMETER DisableAccountTask
Specifies what task to be run on disable account

.PARAMETER LogonHours
Specifies the logon hours for the account, 
Input example: "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23"

.PARAMETER LogonDays
Specifies which days the account is allowed to logon, (1234567) starts with sunday

.PARAMETER UserSharesEnabled
ENTERPRISE LICENSE ONLY, Allow receiving of shared items from other users

.PARAMETER IPRestrictions
Specifies which IP range should be restricted to allow/deny
Input example: @{start='1.1.1.1',stop='1.1.1.2',type='Allow'}

.PARAMETER OtpAuthFTP

.PARAMETER OtpAuthFTPS

.PARAMETER OtpAuthHTTP

.PARAMETER OtpAuthSFTP

.PARAMETER OtpAuthWEBDAV

.PARAMETER RequireEncryption
Specifies if encryption is required (Reference CrushFTP: Only applies to FTPS since FTPS can change from clear text to encryption... the connection has been made. You may allow some accounts like anon... to be clear, while making the other account require encryption)

.PARAMETER SSHPublicKeys
Specifies a list of paths to trusted public SSH key files (Reference CrushFTP: This user is allowed to login using any of these keys)

.PARAMETER RequirePublicKeyForAuthentication
Specifies if the public key and password is required for authentication

.PARAMETER ProtocolsAllowed
Specifies the protocols that are allowed and the maximum connections per protocol
Input example: @{ftp=1;ftps=0;sftp=0;http=0;https=0;webdav=0}

.PARAMETER ContentRestrictions
Specifies if there are any file extensions that would be forbidden, there are two types (byte_1 and aeszip_2)
Input example: @{Type = "byte_1"; Path = "/"; Extension = "*.exe"},@{Type = "aeszip_2"; Path = "/"; Extension = "*.zip"}

.PARAMETER AdminSitePermissions
Specifies the Admin site permissions for the account, (SITE_VERSION)(SITE_USERS)(SITE_KICK)(SITE_KICKBAN)(SITE_PASS)(SITE_ZIP)(SITE_DOT)(SITE_QUIT)(SITE_CHMOD)(SITE_CHOWN)(SITE_CHGRP)(SITE_PLUGIN)(SITE_EMAILPASSWORD)(SITE_WEBFTPPROXY)(SITE_ADHOCWEBFTPPROXY)(CONNECT)
Input example: "(SITE_VERSION)(SITE_USERS)(SITE_KICK)(SITE_KICKBAN)"

.PARAMETER AdminGroupName
Specifies the group which the user could administrate

.PARAMETER PasswordUnsafeChars
Specifies which characters that would not be allowed in passwords

.PARAMETER PasswordRandomLength
Specifies the length of the random generation of passwords

.PARAMETER PasswordMinLength
Specifies the minimum length of the password

.PARAMETER PasswordMinNumbers
Specifeis the minimum amount of numbers required in the password

.PARAMETER PasswordMinLowercase
Specifeis the minimum amount of lower case letters required in the password

.PARAMETER PasswordMinUppercase
Specifeis the minimum amount of upper case letters required in the password

.PARAMETER PasswordMinSpecials
Specifeis the minimum amount of special characters required in the password

.PARAMETER PasswordHistoryCount
Specifies the amount of historic password that is disallowed

.PARAMETER WelcomeMessage
Specifies the SFTP/FTP welcome message

.PARAMETER CharacterEncoding
Specifies the default Character encoding(FTP)

.PARAMETER UnixDefaultOwner

.PARAMETER UnixDefaultGroup

.PARAMETER UnixDefaultFilePrivs

.PARAMETER UnixDefaultFolderPrivs

.PARAMETER TimeZoneOffset
Specifies the time zone offset, eg. 2.5, 5.5, -5.5

.PARAMETER TemporaryFileExtension
Specifies the file extension to add to uploads that are in progress

.PARAMETER ExtraTextReferences
Specifies text references, variables that could be used within CrushFTP

Reference CrushFTP: 
These items can be referenced throughout CrushFTP for extra customization. They are referenced with a {user_x_itemName}. 
So if you had an item named firstName you would reference it with {user_x_firstName}.

.EXAMPLE
New-CrushUser -Username "john.doe" -Password "12345" -AuthenticationObject (New-CrushAuthenticationObject -Server '50.40.30.20' -Port '8080' -Username 'crushadmin' -Password '1234')

Create a user account with the username john.doe 

.EXAMPLE
New-CrushUser -Username "john.doe@contoso.com" -Password "12345" -AuthenticationObject $CrushAuthenticationObject -LogonHours '8,9,10,11,12,13,14,15,16,17' -LogonDays '23456'

Creates a user account with the username john.doe@contoso.com and limits the account to only login during working hours and weekdays

.INPUTS
AuthenticationObject
The AuthenticationObject is generated with the function New-CurshAuthenticationObject and referenced into this function under the parameter -AuthenticationObject

VFSPermissions
A VFS Permission could be generated with the function New-CrushVFSPermission and referenced into this function under the parameter -Permissions

VFSItems
A VFS Item could be generated with the function New-CrushVFSItem and referenced into this function under the parameter -VFSItems

.OUTPUTS
The output is an XML object directly from CrushFTP with information regarding the status and data

Successful request: 

response_status response_type response_data
--------------- ------------- -------------
OK              text 

#>

function New-CrushUser {
Param(
    [Parameter(Mandatory=$true)][string]$Username,
    [Parameter(Mandatory=$true)][string]$Password,
    [Parameter(Mandatory=$false)][string]$ServerGroup = "MainUsers",
    [Parameter(Mandatory=$false)][string]$CreatedByUsername,
    [Parameter(Mandatory=$false)][string]$CreatedByEmail,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$MaxLogins = 0,
    [Parameter(Mandatory=$false)][string]$RootDir = "/",
    [Parameter(Mandatory=$false)][string[]]$Permissions,
    [Parameter(Mandatory=$false)][string[]]$VFSItems,
    [Parameter(Mandatory=$true)][psobject]$AuthenticationObject,
    # Optional (Extension Settings)
    [Parameter(Mandatory=$false)][string]$Email,
    [Parameter(Mandatory=$false)][string]$FirstName,
    [Parameter(Mandatory=$false)][string]$LastName,
    [Parameter(Mandatory=$false)][string]$Salt,
    [Parameter(Mandatory=$false)][string]$Phonenumber,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$AutoSetPassword,
    [Parameter(Mandatory=$false)][string[]]$LinkedVFS,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$LoginMaxTime,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$IdleMaxTime,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$UploadMaxSpeed,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$UploadMinSpeed,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$DownloadMaxSpeed,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$DownloadMinSpeed,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$DownloadToUploadRatio,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$DownloadToUploadRatioPermanent,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$UploadMaxFileSize,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$UploadMaxAmountPerSession,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$UploadMaxAmountPerDay,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$UploadMaxAmountPerMonth,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$DownloadMaxAmountPerSession,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$DownloadMaxAmountPerDay,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$DownloadMaxAmountPerMonth,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$UploadMaxCountPerSession,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$UploadMaxCountPerDay,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$UploadMaxCountPerMonth,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$DownloadMaxCountPerSession,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$DownloadMaxCountPerDay,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$DownloadMaxCountPerMonth,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$PartialDownloadDisabled,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$DirectoryCalculationDepth,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$DirectoryCountCalculationsEnabled,
    [Parameter(Mandatory=$false)][string]$AS2EncryptKeystorePath,
    [Parameter(Mandatory=$false)][string]$AS2EncryptKeystoreFormat,
    [Parameter(Mandatory=$false)][string]$AS2EncryptKeystorePassword,
    [Parameter(Mandatory=$false)][string]$AS2EncryptKeyAlias,
    [Parameter(Mandatory=$false)][string]$AS2EncryptKeyPassword,
    [Parameter(Mandatory=$false)][string]$AS2SignatureKeystorePath,
    [Parameter(Mandatory=$false)][string]$AS2SignatureKeystoreFormat,
    [Parameter(Mandatory=$false)][string]$AS2SignatureKeystorePassword,
    [Parameter(Mandatory=$false)][string]$AS2SignatureKeyAlias,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$AS3Allowed,
    [Parameter(Mandatory=$false)][string]$ParentQuotaDirectory,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$ZipstreamAllowed,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$ZipstreamDMZAllow,
    [Parameter(Mandatory=$false)][datetime]$AccountExpireDate,
    [Parameter(Mandatory=$false)][string]$AccountExpireTask,
    [Parameter(Mandatory=$false)][string]$AccountExpireRollingDays,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$AccountExpireDelete,
    [Parameter(Mandatory=$false)][string]$ExpirePassword,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$ExpirePasswordDays,
    [Parameter(Mandatory=$false)][datetime]$ExpirePasswordDate,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$SimultaneousMaxLogins,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$LoginsMaxPerIP,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$LoginsMaxPerIPAutoKick,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$LoginMaxFailures,
    [Parameter(Mandatory=$false)][string]$DisableAccountTask,
    [Parameter(Mandatory=$false)][string]$LogonHours, #0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
    [Parameter(Mandatory=$false)][string]$LogonDays, #1234567 (Sunday,Monday,Thuesday,wednesday,Thursday,Friday,Saturday)
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$UserSharesEnabled, #Enterprise
    [Parameter(Mandatory=$false)][hashtable[]]$IPRestrictions, # @{start='1.1.1.1',stop='1.1.1.2',type='Allow/Deny'}
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$OtpAuthFTP,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$OtpAuthFTPS,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$OtpAuthHTTP,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$OtpAuthHTTPS,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$OtpAuthSFTP,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$OtpAuthWEBDAV,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$RequireEncryption,
    [Parameter(Mandatory=$false)][string]$SSHPublicKeys,
    [Parameter(Mandatory=$false)][ValidateSet(“true”, "false")][string]$RequirePublicKeyForAuthentication,
    [Parameter(Mandatory=$false)][hashtable]$ProtocolsAllowed, #ftp:1,ftps:0,sftp:0,http:0,https:0,webdav:0, (Protocol:max connection per protocol)
    [Parameter(Mandatory=$false)][hashtable[]]$ContentRestrictions, #@{Type = "byte_1"; Path = "/"; Extension = "*.exe"},@{Type = "aeszip_2"; Path = "/"; Extension = "*.zip"}
    [Parameter(Mandatory=$false)][string]$AdminSitePermissions, #(SITE_VERSION)(SITE_USERS)(SITE_KICK)(SITE_KICKBAN)(SITE_PASS)(SITE_ZIP)(SITE_DOT)(SITE_QUIT)(SITE_CHMOD)(SITE_CHOWN)(SITE_CHGRP)(SITE_PLUGIN)(SITE_EMAILPASSWORD)(SITE_WEBFTPPROXY)(SITE_ADHOCWEBFTPPROXY)(CONNECT)
    [Parameter(Mandatory=$false)][string]$AdminGroupName,
    [Parameter(Mandatory=$false)][string]$PasswordUnsafeChars,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$PasswordRandomLength,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$PasswordMinLength,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$PasswordMinNumbers,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$PasswordMinLowercase,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$PasswordMinUppercase,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$PasswordMinSpecials,
    [Parameter(Mandatory=$false)][ValidatePattern('\d')][string]$PasswordHistoryCount,
    [Parameter(Mandatory=$false)][string]$WelcomeMessage,
    [Parameter(Mandatory=$false)][string]$CharacterEncoding,
    [Parameter(Mandatory=$false)][string]$UnixDefaultOwner,
    [Parameter(Mandatory=$false)][string]$UnixDefaultGroup,
    [Parameter(Mandatory=$false)][string]$UnixDefaultFilePrivs,
    [Parameter(Mandatory=$false)][string]$UnixDefaultFolderPrivs,
    [Parameter(Mandatory=$false)][string]$TimeZoneOffset,
    [Parameter(Mandatory=$false)][string]$TemporaryFileExtension,
    [Parameter(Mandatory=$false)][hashtable]$ExtraTextReferences #@{key = value; key1 = value1; key2 = value2}
)

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    # Initial Body buildup
    $Body = "command=setUserItem&data_action=new&serverGroup=$ServerGroup&username=$Username&xmlItem=user"

    ## User Settings
    $UserSettingsParameters = ""
    
    if(![string]::IsNullOrEmpty($CreatedByUsername)) { $UserSettingsParameters += "<created_by_username>$CreatedByUsername</created_by_username>"}
    if(![string]::IsNullOrEmpty($CreatedByEmail)) { $UserSettingsParameters += "<created_by_email>$CreatedByEmail</created_by_email>"}
    if(![string]::IsNullOrEmpty($CreatedTime)) { $UserSettingsParameters += "<created_time>$((Get-Date -Format MMddyyyyhhmmss).ToString())</created_time>"}
    if(![string]::IsNullOrEmpty($Username)) { $UserSettingsParameters += "<username>$Username</username>"}
    if(![string]::IsNullOrEmpty($Password)) { $UserSettingsParameters += "<password>$Password</password>"}
    if(![string]::IsNullOrEmpty($MaxLogins)) { $UserSettingsParameters += "<max_logins>$MaxLogins</max_logins>"}
    if(![string]::IsNullOrEmpty($RootDir)) { $UserSettingsParameters += "<root_dir>$RootDir</root_dir>"}
    if(![string]::IsNullOrEmpty($Email)) { $UserSettingsParameters += "<email>$Email</email>"}
    if(![string]::IsNullOrEmpty($FirstName)) { $UserSettingsParameters += "<first_name>$FirstName</first_name>" }
    if(![string]::IsNullOrEmpty($LastName)) { $UserSettingsParameters += "<last_name>$LastName</last_name>" }
    if(![string]::IsNullOrEmpty($Salt)) { $UserSettingsParameters += "<salt>$Salt</salt>" }
    if(![string]::IsNullOrEmpty($Phonenumber)) { $UserSettingsParameters += "<phone>$Phonenumber</phone>" }
    if(![string]::IsNullOrEmpty($AutoSetPassword)) { $UserSettingsParameters += "<auto_set_pass>$AutoSetPassword</auto_set_pass>" }
    if($LinkedVFS.Count -gt 0) {
        $linked_vfs_subitems = ""
            foreach($vfs_subitem in $LinkedVFS) { $linked_vfs_subitems += "<linked_vfs_subitem>$vfs_subitem</linked_vfs_subitem>" } 
        $UserSettingsParameters += "<linked_vfs type=""vector"">$linked_vfs_subitems</linked_vfs><extra_vfs type=""vector""></extra_vfs>"
    }

    ## Settings
    if(![string]::IsNullOrEmpty($LoginMaxTime)) { $UserSettingsParameters += "<max_login_time>$($LoginMaxTime.ToString())</max_login_time>" }
    if(![string]::IsNullOrEmpty($IdleMaxTime)) { $UserSettingsParameters += "<max_idle_time>$($IdleMaxTime.ToString())</max_idle_time>" }
    if(![string]::IsNullOrEmpty($UploadMaxSpeed)) { $UserSettingsParameters += "<speed_limit_upload>$($UploadMaxSpeed.ToString())</speed_limit_upload>" }
    if(![string]::IsNullOrEmpty($UploadMinSpeed)) { $UserSettingsParameters += "<min_upload_speed>$($UploadMinSpeed.ToString())</min_upload_speed>" }
    if(![string]::IsNullOrEmpty($DownloadMaxSpeed)) { $UserSettingsParameters += "<speed_limit_download>$($DownloadMaxSpeed.ToString())</speed_limit_download>" }
    if(![string]::IsNullOrEmpty($DownloadMinSpeed)) { $UserSettingsParameters += "<min_download_speed>$($DownloadMinSpeed.ToString())</min_download_speed>" }
    if(![string]::IsNullOrEmpty($DownloadToUploadRatio)) { $UserSettingsParameters += "<ratio>$($DownloadToUploadRatio.ToString())</ratio>" }
    if(![string]::IsNullOrEmpty($DownloadToUploadRatioPermantent)) { $UserSettingsParameters += "<ratio_field_permanent>$DownloadToUploadRatioPermanent</ratio_field_permanent>" }
    if(![string]::IsNullOrEmpty($UploadMaxFileSize)) { $UserSettingsParameters += "<max_upload_size>$($UploadMaxFileSize.ToString())</max_upload_size>" }
    if(![string]::IsNullOrEmpty($UploadMaxAmountPerSession)) { $UserSettingsParameters += "<max_upload_amount>$($UploadMaxAmountPerSession.ToString())</max_upload_amount>" }
    if(![string]::IsNullOrEmpty($UploadMaxAmountPerDay)) { $UserSettingsParameters += "<max_upload_amount_day>$($UploadMaxAmountPerDay.ToString())</max_upload_amount_day>" }
    if(![string]::IsNullOrEmpty($UploadMaxAmountPerMonth)) { $UserSettingsParameters += "<max_upload_amount_month>$($UploadMaxAmountPerMonth.ToString())</max_upload_amount_month>" }
    if(![string]::IsNullOrEmpty($DownloadMaxAmountPerSession)) { $UserSettingsParameters += "<max_download_amount>$($DownloadMaxAmountPerSession.ToString())</max_download_amount>" }
    if(![string]::IsNullOrEmpty($DownloadMaxAmountPerDay)) { $UserSettingsParameters += "<max_download_amount_day>$($DownloadMaxAmountPerMonth.ToString())</max_download_amount_day>" }
    if(![string]::IsNullOrEmpty($DownloadMaxAmountPerMonth)) { $UserSettingsParameters += "<max_download_amount_month>$($DownloadMaxAmountPerMonth.ToString())</max_download_amount_month>" }
    if(![string]::IsNullOrEmpty($UploadMaxCountPerSession)) { $UserSettingsParameters += "<max_upload_count>$($UploadMaxCountPerSession.ToString())</max_upload_count>" }
    if(![string]::IsNullOrEmpty($UploadMaxCountPerDay)) { $UserSettingsParameters += "<max_upload_count_day>$($UploadMaxCountPerDay.ToString())</max_upload_count_day>" }
    if(![string]::IsNullOrEmpty($UploadMaxcountPerMonth)) { $UserSettingsParameters += "<max_upload_count_month>$($UploadMaxcountPerMonth.ToString())</max_upload_count_month>" }
    if(![string]::IsNullOrEmpty($DownloadMaxCountPerSession)) { $UserSettingsParameters += "<max_download_count>$($DownloadMaxCountPerSession.ToString())</max_download_count>" }
    if(![string]::IsNullOrEmpty($DownloadMaxCountPerDay)) { $UserSettingsParameters += "<max_download_count_day>$($DownloadMaxCountPerDay.ToString())</max_download_count_day>" }
    if(![string]::IsNullOrEmpty($DownloadMaxCountPerMonth)) { $UserSettingsParameters += "<max_download_count_month>$($DownloadMaxCountPerMonth.ToString())</max_download_count_month>" }
    if(![string]::IsNullOrEmpty($PartialDownloadDisabled)) { $UserSettingsParameters += "<partial_download>$PartialDownloadDisabled</partial_download>" }
    if(![string]::IsNullOrEmpty($DirectoryCalculationDepth)) { $UserSettingsParameters += "<dir_depth>$($DirectoryCalculationDepth.ToString())</dir_depth><dir_calc>true</dir_calc>" }
    if(![string]::IsNullOrEmpty($DirectoryCountCalculationsEnabled)) { $UserSettingsParameters += "<dir_calc_count>$DirectoryCountCalculationsEnabled</dir_calc_count>" }
    if(![string]::IsNullOrEmpty($AS2EncryptKeystorePath)) { $UserSettingsParameters += "<as2EncryptKeystorePath>$AS2EncryptKeystorePath</as2EncryptKeystorePath>" }
    if(![string]::IsNullOrEmpty($AS2EncryptKeystoreFormat)) { $UserSettingsParameters += "<as2EncryptKeystoreFormat>$AS2EncryptKeystoreFormat</as2EncryptKeystoreFormat>" }
    if(![string]::IsNullOrEmpty($AS2EncryptKeystorePassword)) { $UserSettingsParameters += "<as2EncryptKeystorePassword>$AS2EncryptKeystorePassword</as2EncryptKeystorePassword>" }
    if(![string]::IsNullOrEmpty($AS2EncryptKeyAlias)) { $UserSettingsParameters += "<as2EncryptKeyAlias>$AS2EncryptKeyAlias</as2EncryptKeyAlias>" }
    if(![string]::IsNullOrEmpty($AS2EncryptKeyPassword)) { $UserSettingsParameters += "<as2EncryptKeyPassword>$AS2EncryptKeyPassword</as2EncryptKeyPassword>" }
    if(![string]::IsNullOrEmpty($AS2SignatureKeystorePath)) { $UserSettingsParameters += "<as2SignKeystorePath>$AS2SignatureKeystorePath</as2SignKeystorePath>" }
    if(![string]::IsNullOrEmpty($AS2SignatureKeystoreFormat)) { $UserSettingsParameters += "<as2SignKeystoreFormat>$AS2SignatureKeystoreFormat</as2SignKeystoreFormat>" }
    if(![string]::IsNullOrEmpty($AS2SignatureKeystorePassword)) { $UserSettingsParameters += "<as2SignKeystorePassword>$AS2SignatureKeystorePassword</as2SignKeystorePassword>" }
    if(![string]::IsNullOrEmpty($AS2SignatureKeyAlias)) { $UserSettingsParameters += "<as2SignKeyAlias>$AS2SignatureKeyAlias</as2SignKeyAlias>" }
    if(![string]::IsNullOrEmpty($AS3Allowed)) { $UserSettingsParameters += "<as3_allowed>$AS3Allowed</as3_allowed>" }
    if(![string]::IsNullOrEmpty($ParentQuotaDirectory)) { $UserSettingsParameters += "<parent_quota_dir>$ParentQuotaDirectory</parent_quota_dir>" }
    if(![string]::IsNullOrEmpty($ZipstreamAllowed)) { $UserSettingsParameters += "<allow_zipstream>$ZipstreamAllowed</allow_zipstream>" }
    if(![string]::IsNullOrEmpty($ZipstreamDMZAllowed)) { $UserSettingsParameters += "<zip_stream_decompress_at_dmz>$ZipstreamDMZAllowed</zip_stream_decompress_at_dmz>" }

    ## Restrictions
    if(![string]::IsNullOrEmpty($AccountExpireDate)) { $UserSettingsParameters += "<account_expire>$(Get-Date $AccountExpireDate -UFormat "%m/%d/%Y %r")</account_expire>" }
    if(![string]::IsNullOrEmpty($AccountExpireTask)) { $UserSettingsParameters += "<account_expire_task>$AccountExpireTask</account_expire_task>" }
    if(![string]::IsNullOrEmpty($AccountExpireRollingDays)) { $UserSettingsParameters += "<account_expire_rolling_days>$AccountExpireRollingDays</account_expire_rolling_days>" }
    if(![string]::IsNullOrEmpty($AccountExpireDelete)) { $UserSettingsParameters += "<account_expire_delete>$AccountExpireDelete</account_expire_delete>" }
    if(![string]::IsNullOrEmpty($ExpirePassword)) { $UserSettingsParameters += "<expire_password>$ExpirePassword</expire_password_days>" }
    if(![string]::IsNullOrEmpty($ExpirePasswordDays)) { $UserSettingsParameters += "<expire_password_days>$ExpirePasswordDays</expire_password>" }
    if(![string]::IsNullOrEmpty($ExpirePasswordDate)) { $UserSettingsParameters += "<expire_password_when>$(Get-Date $ExpirePasswordDate -UFormat "%m/%d/%Y %r")</expire_password_when>" }
    if(![string]::IsNullOrEmpty($SimultaneousMaxLogins)) { $UserSettingsParameters += "<max_logins>$($SimultaneousMaxLogins.ToString())</max_logins>" }
    if(![string]::IsNullOrEmpty($LoginsMaxPerIP)) { $UserSettingsParameters += "<max_logins_ip>$($LoginsMaxPerIP.ToString())</max_logins_ip>" }
    if(![string]::IsNullOrEmpty($LoginsMaxPerIPAutoKick)) { $UserSettingsParameters += "<logins_ip_auto_kick>$LoginsMaxPerIPAutoKick</logins_ip_auto_kick>" }
    if(![string]::IsNullOrEmpty($LoginMaxFailures)) { $UserSettingsParameters += "<failure_count_max>$($LoginMaxFailures.ToString())</failure_count_max>" }
    if(![string]::IsNullOrEmpty($DisableAccountTask)) { $UserSettingsParameters += "<disabled_account_task>$DisableAccountTask</disabled_account_task>" }
    if(![string]::IsNullOrEmpty($LogonHours)) { $UserSettingsParameters += "<hours_of_day>$LogonHours</hours_of_day>" } 
    if(![string]::IsNullOrEmpty($LogonDays)) { $UserSettingsParameters += "<day_of_week_allow>$LogonDays</day_of_week_allow>" }
    if(![string]::IsNullOrEmpty($UserSharesEnabled)) { $UserSettingsParameters += "<allow_user_shares>$UserSharesEnabled</allow_user_shares>" } 
    if(![string]::IsNullOrEmpty($IPRestrictions)) {
    $restrictip_subitems = ""
        foreach($restrictip_subitem in $IPRestrictions) { 
            Switch ($restrictip_subitem.type) {
                "Deny|D" { $restrictip_subitems += "<ip_restrictions_subitem type=""properties""><stop_ip>$($restrictip_subitem.stop)</stop_ip><start_ip>$($restrictip_subitem.start)</start_ip><type>D</type></ip_restrictions_subitem>"  }
                "Allow|A" { $restrictip_subitems += "<ip_restrictions_subitem type=""properties""><stop_ip>$($restrictip_subitem.stop)</stop_ip><start_ip>$($restrictip_subitem.start)</start_ip><type>A</type></ip_restrictions_subitem>" }
            }  
        }
        $UserSettingsParameters += "<ip_restrictions type=""vector"">$restrictip_subitems</ip_restrictions>"
    }
    if(![string]::IsNullOrEmpty($OtpAuthFTP)) { $UserSettingsParameters += "<otp_auth_ftp>$OtpAuthFTP</otp_auth_ftp>" } 
    if(![string]::IsNullOrEmpty($OtpAuthFTPS)) { $UserSettingsParameters += "<otp_auth_ftps>$OtpAuthFTPS</otp_auth_ftps>" }
    if(![string]::IsNullOrEmpty($OtpAuthHTTP)) { $UserSettingsParameters += "<otp_auth_http>$OtpAuthHTTP</otp_auth_http>" }
    if(![string]::IsNullOrEmpty($OtpAuthHTTPS)) { $UserSettingsParameters += "<otp_auth_https>$OtpAuthHTTPS</otp_auth_https>" }
    if(![string]::IsNullOrEmpty($OtpAuthSFTP)) { $UserSettingsParameters += "<otp_auth_sftp>$OtpAuthSFTP</otp_auth_sftp>" }
    if(![string]::IsNullOrEmpty($OtpAuthWEBDAV)) { $UserSettingsParameters += "<otp_auth_webdav>$OtpAuthWEBDAV</otp_auth_webdav>" }
    if(![string]::IsNullOrEmpty($RequireEncryption)) { $UserSettingsParameters += "<require_encryption>$RequireEncryption</require_encryption>" } 
    if(![string]::IsNullOrEmpty($SSHPublicKeys)) { $UserSettingsParameters += "<ssh_public_keys>$SSHPublicKeys</ssh_public_keys>" } # Looks to allow multiple keys...
    if(![string]::IsNullOrEmpty($RequirePublicKeyForAuthentication)) { $UserSettingsParameters += "<publickey_password>$RequirePublicKeyForAuthentication</publickey_password>" }
    if(![string]::IsNullOrEmpty($ProtocolsAllowed)) { 
        $ProtocolHashResult = ""
        foreach($Protocol in $ProtocolsAllowed.GetEnumerator()) { $ProtocolHashResult += "$($Protocol.key):$($Protocol.value)," }
        $UserSettingsParameters += "<allowed_protocols>$ProtocolHashResult</allowed_protocols>"
    } 
    if(![string]::IsNullOrEmpty($ContentRestrictions)) { 
        $ContentRestrictionsHashResult = ""
        foreach($Content in $ContentRestrictions) { $ContentRestrictionsHashResult += "$($Content.type);$($Content.path);$($Content.extension);" }
        $UserSettingsParameters += "<content_restriction>$ContentRestrictionsHashResult</content_restriction>"
    }

    ## Admin
    if(![string]::IsNullOrEmpty($AdminSitePermissions)) { $UserSettingsParameters += "<site>$AdminSitePermissions</site>" } 
    if(![string]::IsNullOrEmpty($AdminGroupName)) { $UserSettingsParameters += "<admin_group_name>$AdminGroupName</admin_group_name>" }
    if(![string]::IsNullOrEmpty($PasswordUnsafeChars)) { $UserSettingsParameters += "<unsafe_password_chars>$PasswordUnsafeChars</unsafe_password_chars>" }
    if(![string]::IsNullOrEmpty($PasswordRandomLength)) { $UserSettingsParameters += "<random_password_length>$($PasswordRandomLength.ToString())</random_password_length>" }
    if(![string]::IsNullOrEmpty($PasswordMinLength)) { $UserSettingsParameters += "<min_password_length>$($PasswordMinLength.ToString())</min_password_length>" }
    if(![string]::IsNullOrEmpty($PasswordMinNumbers)) { $UserSettingsParameters += "<min_password_numbers>$($PasswordMinNumbers.ToString())</min_password_numbers>" }
    if(![string]::IsNullOrEmpty($PasswordMinLowercase)) { $UserSettingsParameters += "<min_password_lowers>$($PasswordMinLowercase.ToString())</min_password_lowers>" }
    if(![string]::IsNullOrEmpty($PasswordMinUppercase)) { $UserSettingsParameters += "<min_password_uppers>$($PasswordMinUppercase.ToString())</min_password_uppers>" }
    if(![string]::IsNullOrEmpty($PasswordMinSpecials)) { $UserSettingsParameters += "<min_password_specials>$($PasswordMinSpecials.ToString())</min_password_specials>" }
    if(![string]::IsNullOrEmpty($PasswordHistoryCount)) { $UserSettingsParameters += "<password_history_count>$($PasswordHistoryCount.ToString())</password_history_count>" }

    ## MISC
    if(![string]::IsNullOrEmpty($WelcomeMessage)) { $UserSettingsParameters += "<welcome_message>$WelcomeMessage</welcome_message>" }
    if(![string]::IsNullOrEmpty($CharacterEncoding)) { $UserSettingsParameters += "<char_encoding>$CharacterEncoding</char_encoding>" }
    if(![string]::IsNullOrEmpty($UnixDefaultOwner)) { $UserSettingsParameters += "<default_owner_command>$UnixDefaultOwner</default_owner_command>" }
    if(![string]::IsNullOrEmpty($UnixDefaultGroup)) { $UserSettingsParameters += "<default_group_command>$UnixDefaultGroup</default_group_command>" }
    if(![string]::IsNullOrEmpty($UnixDefaultFilePrivs)) { $UserSettingsParameters += "<default_privs_command>$UnixDefaultFilePrivs</default_privs_command>" }
    if(![string]::IsNullOrEmpty($UnixDefaultFolderPrivs)) { $UserSettingsParameters += "<default_folder_privs_command>$UnixDefaultFolderPrivs</default_folder_privs_command>" }
    if(![string]::IsNullOrEmpty($TimeZoneOffset)) { $UserSettingsParameters += "<timezone_offset>$TimeZoneOffset</timezone_offset>" }
    if(![string]::IsNullOrEmpty($TemporaryFileExtension)) { $UserSettingsParameters += "<temp_upload_ext>$TemporaryFileExtension</temp_upload_ext>" }
    if(![string]::IsNullOrEmpty($ExtraTextReferences)) { foreach($Extra in $ExtraTextReferences.GetEnumerator()) { $UserSettingsParameters += "<x_$($Extra.key)>$($Extra.value)</x_$($Extra.key)>" } } #@{key = value; key1 = value1; key2 = value2}


    ### User Parameters
    $UserParameters = "<?xml version=""1.0"" encoding=""UTF-8""?><user type=""properties"">$UserSettingsParameters</user>"
    $Body += "&user=$(([uri]::EscapeUriString($UserParameters)).Replace("?","%3F").Replace("=","%3D"))"

    ### VFS_Item Parameters
    $regexVFSItems = '^<\?xml version="1\.0" encoding="UTF-8"\?><vfs_items type="vector">i?.*<\/vfs_items>$'

    if($VFSItems) {  
        if($VFSItems.Count -gt 1) { 
        Write-Verbose "VFS Items: Found multiple VFS items" 
            $MultipleVFSItems = ""
            foreach($item in $VFSItems) {
                if($item -match $regexVFSItems) {
                    $item = $item -replace '<\/vfs_items>$', '' # Regex TrimEnd
                    $item = $item -replace '^<\?xml version="1\.0" encoding="UTF-8"\?><vfs_items type="vector">i?', '' # Regex TrimStart
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
        Write-Host "Successfully created user"
    } catch { 
        Write-Error "Unable to Invoke RestMethod, Exception: $_"
    }

    $result = @{}
    if($response.result.response_status -eq "OK") {
        $result.Add("Result",$response.result)
    } else {
        $result.Add("Result",$response)
        $result.add("Request", ($RequestObject | ConvertTo-Json))
    }

return $result

}
