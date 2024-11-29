# Newer versions of OBS Studio use IsWow64Process2 function which was implemented in Windows 10 1709.
## Fortunately, patching this is really easy, you just need Explorer Suite CFF Explorer.
### Here is how to do it:
1. Open obs.dll from obs installation directory (Usually %ProgramFiles%\obs-studio\bin\64bit) using CFF Explorer.
2. Go to import directory.
3. Open the module kernel32.dll
4. Change IsWow64Process2 to IsWow64Process.
5. Save the file to desktop.
6. Backup your original obs.dll
7. Move the modified obs.dll from your desktop to your obs installation directory.
8. Enjoy!

![image](https://github.com/user-attachments/assets/7a6cb71c-4bbb-4c07-a365-2ccb649881fd)
