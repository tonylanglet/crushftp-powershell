# CrushFTP with Powershell

User management for CrushFTP, there is no documented API for CrushFTP but this module is created out of the REST XML calls done in the background and was fetched through a networking tool.

**_The work has been done on a v.8 license and I'm aware there are changes to the API functionality in v.9 but feel free to try it out_**

**_Some functionality has not yet been tested but if the logics of CrushFTP REST calls is of "best practise" it should work._** 

## Getting Started

### Prerequisites
* Powershell
* CrushFTP v.8 account ()v.9 not yet tested)

### Installing

#### CrushFTP Account
To make API calls you are required to have an account, by a regular user account you are most likely only able to fetch information regarding your own account. In order to make most of the module you would require a Admin account. 

#### Powershell
Install [Powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell?view=powershell-6)

#### keepersecurity.powershell module
By downloading the module from here you'll get the module, manifest and all (you might want to remove the -master part of the folder once un-zipped). Move the module folder to the Powershell module folder <C:\Program Files\WindowsPowerShell\Modules\> in order to call Import-Module CrushFTP withouth a qualified path.
  
Open a Powershell window
 ```
 C:\PS> Import-Module crushftp.powershell 
 ```

#### Verify Installation 

To verfiy that the crushftp.powershell module is loaded type the following in a powershell window
 ```
 C:\PS> Get-Module -Name crushftp.powershell
 ```
 If you get the following output the module is loaded
 ```
 ModuleType Version    Name                                ExportedCommands                                                       
 ---------- -------    ----                                ----------------                                                   
 Script     1.0        keepersecurity.powershell           {Add-KeeperRecordNotes, Del-KeeperEnterpriseTeam...} 
 ```  
### Test

The following examples show you how to run the scripts by using the Powershell module

#### Using Powershell module

Make sure the crushftp.powershell module is loaded, see installation step above. Once the module is loaded you can use the functions.
```
'Get-CrushServerInfo', 
'Get-CrushUser', 
'Get-CrushUserList',
'New-CurshAuthenticationObject',
'New-CrushUser',
'New-CrushVFSItem',
'New-CrushVFSPermission',
'Remove-CrushUser',
'Set-CrushUser',
```   
   
The functions require a crushftp account to run, the current setup is using Basic authentication.
``` 
$authuser = "<username>"
$authpass = "<password>"
$authserver = "<server>" # Ip (120.12.1.10) or URL (http://ftp.contoso.com/)
$authport = "<port>" 

$AuthObj = New-CrushAuthenticationObject -Server $authserver -Port $authport -Username $authuser -Password $authpass
``` 
Running one of the modules functions,
```
# The following module function will create a new user named john.doe  

New-CrushUser -Username "john.doe" -Password "passwd" $AuthenticationObject $AuthObj
``` 
## Setup Explanation

CrushFTP does not provide documentation regarding the API references and in the CrushFPT v.8 documentation you would be referenced to a browser network/developer plugin in order to back-track the calls used to manage the application from code.

I'm using powershell as a daily tool and I required the possibilities to create/edit/delete user accounts and that's the reason why I've created a module which others could take advantage of as well. 

## Built With

* [Powershell](https://docs.microsoft.com/en-us/powershell/scripting/getting-started/getting-started-with-windows-powershell?view=powershell-6) - The main framework used

## Contributing

Feel free to submit a Pull request...

## Versioning

For the versions available, see the [tags on this repository](https://github.com/tonylanglet/keepersecurity.powershell/tags). 

## Authors

* **Tony Langlet** - *Initial work* - [TonyLanglet](https://github.com/tonylanglet)

See also the list of [contributors](https://github.com/tonylanglet/keepersecurity.powershell/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments


## To-Do
- [ ] Complete New-CrushUser and Set-CrushUser Webinterface options
- [ ] Server settings 
- [ ] Uploads/Downloads

