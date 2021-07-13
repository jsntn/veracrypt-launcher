A launcher created by Windows Batch Scripting that can be used to run the program within your VeraCrypt Volume quickly.

- The entries of this are the `.vbs` - `xxx-readOnly.vbs` and `xxx-write.vbs`
- `xxx-readOnly.vbs` is a wrapper for `xxx.NTFS.VC~T~readOnly.bat`, which is for read-only mode where the Driver mounted will be `T`
- `xxx-write.vbs` is a wrapper for `xxx.NTFS.VC~T~write.bat`, which is for write mode where the Driver mounted will be `T`
- The password for `xxx.NTFS.VC` here is `test`, and the password is hard-coded in `main/VC_readOnly.bat` and `main/VC_write.bat`
