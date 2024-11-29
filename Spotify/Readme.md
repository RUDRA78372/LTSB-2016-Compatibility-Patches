# Warning! This is a messy solution, and there is probably a better way to do it. If you aren't sure what you are doing, use the web version of spotify instead.
Spotify imports SetThreadDescription function from kernel32.dll
This function exists in Windows 10 LTSB 2016, but the function exists in kernelbase.dll.
So we need to put a fake kernel32.dll that exports the function for spotify.
We also need to edit spotify.exe using CFF Explorer so that it uses our own dll instead of kernel32.dll, and so that other dlls in the same directory don't import our dll by mistake.

## Here is how to do this:
1. Open Spotify.exe from spotify installation directory (Usually %appdata%\Spotify) using CFF Explorer.
2. Go to import directory.
3. Rename the module kernel32.dll to rudranil.dll
4. Save the file to desktop.
5. Backup your original Spotify.exe
6. Move the modified Spotify.exe from your desktop to your spotify installation directory.
7. Put rudranil.dll in the spotify installation directory.
8. Enjoy!
> I have used rudranil.dll replacing kernel32.dll because that's my name and matches 8 character limit of the dll name. You can use any other name if you want.
### After each update, you need to do it again, and probably need a new dll each time. I will try to update the dll regularly (no promises).
![image](https://github.com/user-attachments/assets/e42c7d0f-aa3e-4f15-97ec-06f19abf2de2)
