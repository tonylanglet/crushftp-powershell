
function New-CrushVFSItem {
Param(
    [Parameter(Mandatory=$true)]
    [string]$Name,

    [Parameter(Mandatory=$false)]
    [string]$Path = "/",
    
    [Parameter(Mandatory=$false)]
    [string]$BeforeUploadScript,

    [Parameter(Mandatory=$false)]
    [string]$AfterLoginScript,

    [Parameter(Mandatory=$false)]
    [string]$Type = "DIR",

    [Parameter(Mandatory=$false)]
    [string]$SshPrivateKey,

    [Parameter(Mandatory=$false)]
    [string]$Url,

    [Parameter(Mandatory=$false)]
    [string]$AfterDirScript,

    [Parameter(Mandatory=$false)]
    [string]$AddNewHost = "false",
    
    [Parameter(Mandatory=$false)]
    [string]$AfterUploadScript,
    
    [Parameter(Mandatory=$false)]
    [string]$KnownHostFile,
    
    [Parameter(Mandatory=$false)]
    [string]$NoMdtm = "false",
    
    [Parameter(Mandatory=$false)]
    [string]$HaDownload = "false",
    
    [Parameter(Mandatory=$false)]
    [string]$S3BucketInPath = "false",
    
    [Parameter(Mandatory=$false)]
    [string]$VerifyHost = "false",
    
    [Parameter(Mandatory=$false)]
    [string]$BeforeDirScript,
    
    [Parameter(Mandatory=$false)]
    [string]$ProxyActivePorts = "1025-65535",
    
    [Parameter(Mandatory=$false)]
    [string]$HaUpload = "false",
    
    [Parameter(Mandatory=$false)]
    [string]$S3Accelerate = "false",
    
    [Parameter(Mandatory=$false)]
    [string]$ExpiresOn,
    
    [Parameter(Mandatory=$false)]
    [string]$ReceiveCompressed = "false",
    
    [Parameter(Mandatory=$false)]
    [string]$S3StatHeadCallsDouble = "true",
    
    [string]$BeforeDownloadScript,
    
    [Parameter(Mandatory=$false)]
    [string]$DfsEnabled = "false",
    
    [Parameter(Mandatory=$false)]
    [string]$Simple = "false", 
    
    [Parameter(Mandatory=$false)]
    [string]$Encrypted = "false", 
    
    [Parameter(Mandatory=$false)]
    [string]$UseDMZ = "false", 
    
    [Parameter(Mandatory=$false)]
    [string]$SendCompressed = "false",
    
    [Parameter(Mandatory=$false)]
    [string]$BeforeLoginScript,
    
    [Parameter(Mandatory=$false)]
    [string]$SshPrivateKeyPass,
    
    [Parameter(Mandatory=$false)]
    [string]$AfterDownloadScript,
    
    [Parameter(Mandatory=$false)]
    [string]$SecureData = "false",
    
    [Parameter(Mandatory=$false)]
    [string]$SshTwoFactor = "false",
    
    [Parameter(Mandatory=$false)]
    [string]$BeforeLogoutScript,
    
    [Parameter(Mandatory=$false)]
    [string]$S3StatHeadCalls = "true"
)

$xmlVFS = "<?xml version=""1.0"" encoding=""UTF-8""?><vfs_items type=""vector""><vfs_items_subitem type=""properties""><name>$Name</name><path>$Path</path><vfs_item type=""vector""><vfs_item_subitem type=""properties""><before_upload_script>$BeforeUploadScript</before_upload_script><after_login_script>$AfterLoginScript</after_login_script><type>$Type</type><ssh_private_key>$SshPrivateKey</ssh_private_key><url>$Url</url><after_dir_script>$AfterDirScript</after_dir_script><addNewHost>$AddNewHost</addNewHost><after_upload_script>$AfterUploadScript</after_upload_script><knownHostFile>$KnownHostFile</knownHostFile><no_mdtm>$NoMdtm</no_mdtm><haDownload>$HaDownload</haDownload><s3_bucket_in_path>$S3BucketInPath</s3_bucket_in_path><verifyHost>$VerifyHost</verifyHost><before_dir_script>$BeforeDirScript</before_dir_script><proxyActivePorts>$ProxyActivePorts</proxyActivePorts><haUpload>$HaUpload</haUpload><s3_accelerate>$S3Accelerate</s3_accelerate><expires_on>$ExpiresOn</expires_on><receive_compressed>$ReceiveCompressed</receive_compressed><s3_stat_head_calls_double>$S3StatHeadCallsDouble</s3_stat_head_calls_double><before_download_script>$BeforeDownloadScript</before_download_script><dfs_enabled>$DfsEnabled</dfs_enabled><simple>$Simple</simple><encrypted>$Encrypted</encrypted><use_dmz>$UseDMZ</use_dmz><send_compressed>$SendCompressed</send_compressed><before_login_script>$BeforeLoginScript</before_login_script><ssh_private_key_pass>$SshPrivateKeyPass</ssh_private_key_pass><after_download_script>$AfterDownloadScript</after_download_script><secure_data>$SecureData</secure_data><ssh_two_factor>$SshTwoFactor</ssh_two_factor><before_logout_script>$BeforeLogoutScript</before_logout_script><s3_stat_head_calls>$S3StatHeadCalls</s3_stat_head_calls></vfs_item_subitem></vfs_item></vfs_items_subitem></vfs_items>" 

return $xmlVFS

}