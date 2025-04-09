# PASSWD_NOTREQD

PowerShell script to remove "Password not required" flag from computer accounts in Active Directory using a CSV input file.

## 📝 Description

This PowerShell script allows you to :
1. Read a list of computer accounts from a CSV file
2. Disable `PASSWD_NOTREQD` flag
3. Modify the `userAccountControl` attribute in the Active Directory
4. Keep all other existing account settings

## ⚙️ Prerequisites

- [x] Active Directory PowerShell module installed
  ```powershell
  # For Windows Server :
  Add-WindowsFeature RSAT-AD-PowerShell
  
  # For Windows 10/11 :
  Install-WindowsFeature RSAT-AD-PowerShell
  ```
- [x] PowerShell 5.1 or later
- [x] Write permissions on computer objects in AD
- [x] Correctly formatted CSV file

## 📁 CSV format

Example of structure :
```csv
Name
SRV-WEB01
SRV-DB02
WS-CLIENT03
```

## 🚀 Utilisation

1. Change CSV path in script (line 4) :
   ```powershell
   $csvPath = ".\computers.csv" # Relative or absolute path
   ```

2. Run script (as administrator) :
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope Process -Force
   .\Disable-PasswordNotRequired.ps1
   ``

## 📄 Journal des modifications

| Version | Date | Auteur |
|---------|------------|---------------|
| 1.0 | 2025-04-09 | Artp86
