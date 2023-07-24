A launcher created by Windows Batch Scripting that can be used to mount your VeraCrypt Volume quickly.

### Introduction

- The entries of this are `read-xxx.bat` and `write-xxx.bat`, edit them as your case may be
  Note:
  - The `xxx` in the file name can be any string, which doesn't impact the script execution
  - The content should be updated, e.g. https://github.com/jsntn/windows-veracrypt-volume-launcher/blob/master/read-xxx.bat#L3
- `xxx.NTFS.VC` is the VeraCrypt Volume, and its password here is `test`
- `xxx.NTFS.VC.ini` is the configuration file, and `<VeraCrypt Volume>.ini` is the mandatory naming for specific Volume
- About the configuration in `xxx.NTFS.VC.ini`,
  ```bash
  program=  # The absolute path of VeraCrypt.
              Note:
              1) Will use the built-in TrueCrypt program if 'truecrypt' is inputted
              2) Will use the built-in VeraCrypt program if omitted
  volume=xxx.NTFS.VC  # The VeraCrypt Volume name
  password=test  # The password for the VeraCrypt Volume. Input the password manually if omitted
  ```

### Your Use Case

1. Crerate your own VeraCrypt Volume, e.g. `xxx.NTFS.VC`
2. Prepare your Configuration File, e.g. `xxx.NTFS.VC.ini`
3. Store both of the Volume (`xxx.NTFS.VC`) and its Configuration File (`xxx.NTFS.VC.ini`) in `data` folder
4. Edit your Entries, e.g. `read-xxx.bat` and `write-xxx.bat`
5. Use it from the entry as in your case
