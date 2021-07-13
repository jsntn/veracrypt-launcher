A launcher created by Windows Batch Scripting that can be used to mount your VeraCrypt Volume quickly.

### Introduction

- The entries of this are `read-xxx.bat` and `write-xxx.bat`, edit them as your case may be
- `xxx.NTFS.VC` is the VeraCrypt Volume, and its password here is `test`
- `xxx.NTFS.VC.ini` is the configuration file, and `<VeraCrypt Volume>.ini` is the mandatory naming for specific Volume
- About the configuration in `xxx.NTFS.VC.ini`,
  ```bash
  program=  # The absolute path of VeraCrypt. will use the built-in VeraCrypt program if omitted
  drive=T  # The Drive for the VeraCrypt Volume
  volume=xxx.NTFS.VC  # The VeraCrypt Volume name
  password=test  # The password for the VeraCrypt Volume. Input the password manually if omitted
  ```

### Your Use Case

1. Crerate your own VeraCrypt Volume
2. Prepare your Configuration File
3. Store both of the Volume and its Configuration File in `data` folder
4. Edit your Entries
