library rudranil;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

{uses
  System.SysUtils,
  System.Classes;      }

{$R *.res}

function SubmitThreadpoolWork: pointer;
  external 'kernel32.dll' name 'SubmitThreadpoolWork';
function CreateThreadpoolWork: pointer;
  external 'kernel32.dll' name 'CreateThreadpoolWork';
function FreeLibraryWhenCallbackReturns: pointer;
  external 'kernel32.dll' name 'FreeLibraryWhenCallbackReturns';
function InitOnceComplete: pointer;
  external 'kernel32.dll' name 'InitOnceComplete';
function InitOnceBeginInitialize: pointer;
  external 'kernel32.dll' name 'InitOnceBeginInitialize';
function GetExitCodeThread: pointer;
  external 'kernel32.dll' name 'GetExitCodeThread';
function SwitchToThread: pointer; external 'kernel32.dll' name 'SwitchToThread';
function GetTimeZoneInformation: pointer;
  external 'kernel32.dll' name 'GetTimeZoneInformation';
function PeekNamedPipe: pointer; external 'kernel32.dll' name 'PeekNamedPipe';
function FreeLibraryAndExitThread: pointer;
  external 'kernel32.dll' name 'FreeLibraryAndExitThread';
function ExitThread: pointer; external 'kernel32.dll' name 'ExitThread';
function GetDriveTypeW: pointer; external 'kernel32.dll' name 'GetDriveTypeW';
function WaitForSingleObjectEx: pointer;
  external 'kernel32.dll' name 'WaitForSingleObjectEx';
function LoadLibraryExA: pointer; external 'kernel32.dll' name 'LoadLibraryExA';
function LCMapStringEx: pointer; external 'kernel32.dll' name 'LCMapStringEx';
function CompareStringEx: pointer;
  external 'kernel32.dll' name 'CompareStringEx';
function CloseThreadpoolWork: pointer;
  external 'kernel32.dll' name 'CloseThreadpoolWork';
function WakeAllConditionVariable: pointer;
  external 'kernel32.dll' name 'WakeAllConditionVariable';
function GetSystemDirectoryW: pointer;
  external 'kernel32.dll' name 'GetSystemDirectoryW';
function CreateRemoteThread: pointer;
  external 'kernel32.dll' name 'CreateRemoteThread';
function VirtualQuery: pointer; external 'kernel32.dll' name 'VirtualQuery';
function RtlCaptureStackBackTrace: pointer;
  external 'kernel32.dll' name 'RtlCaptureStackBackTrace';
function GetProcessHeaps: pointer;
  external 'kernel32.dll' name 'GetProcessHeaps';
function VirtualFreeEx: pointer; external 'kernel32.dll' name 'VirtualFreeEx';
function UpdateProcThreadAttribute: pointer;
  external 'kernel32.dll' name 'UpdateProcThreadAttribute';
function InitializeProcThreadAttributeList: pointer;
  external 'kernel32.dll' name 'InitializeProcThreadAttributeList';
function DeleteProcThreadAttributeList: pointer;
  external 'kernel32.dll' name 'DeleteProcThreadAttributeList';
function VirtualProtectEx: pointer;
  external 'kernel32.dll' name 'VirtualProtectEx';
function QueryInformationJobObject: pointer;
  external 'kernel32.dll' name 'QueryInformationJobObject';
function SystemTimeToTzSpecificLocalTime: pointer;
  external 'kernel32.dll' name 'SystemTimeToTzSpecificLocalTime';
function FileTimeToSystemTime: pointer;
  external 'kernel32.dll' name 'FileTimeToSystemTime';
function HeapDestroy: pointer; external 'kernel32.dll' name 'HeapDestroy';
function EnumSystemLocalesEx: pointer;
  external 'kernel32.dll' name 'EnumSystemLocalesEx';
function GetProcessHandleCount: pointer;
  external 'kernel32.dll' name 'GetProcessHandleCount';
function SetThreadAffinityMask: pointer;
  external 'kernel32.dll' name 'SetThreadAffinityMask';
function GetCurrentProcessorNumber: pointer;
  external 'kernel32.dll' name 'GetCurrentProcessorNumber';
function ReadProcessMemory: pointer;
  external 'kernel32.dll' name 'ReadProcessMemory';
function GetProductInfo: pointer; external 'kernel32.dll' name 'GetProductInfo';
function SetProcessMitigationPolicy: pointer;
  external 'kernel32.dll' name 'SetProcessMitigationPolicy';
function VirtualAllocEx: pointer; external 'kernel32.dll' name 'VirtualAllocEx';
function VirtualQueryEx: pointer; external 'kernel32.dll' name 'VirtualQueryEx';
function GetProcessMitigationPolicy: pointer;
  external 'kernel32.dll' name 'GetProcessMitigationPolicy';
function SetProcessDEPPolicy: pointer;
  external 'kernel32.dll' name 'SetProcessDEPPolicy';
function HeapSetInformation: pointer;
  external 'kernel32.dll' name 'HeapSetInformation';
function SetDefaultDllDirectories: pointer;
  external 'kernel32.dll' name 'SetDefaultDllDirectories';
function WriteProcessMemory: pointer;
  external 'kernel32.dll' name 'WriteProcessMemory';
function SetHandleInformation: pointer;
  external 'kernel32.dll' name 'SetHandleInformation';
function DuplicateHandle: pointer;
  external 'kernel32.dll' name 'DuplicateHandle';
function SetThreadInformation: pointer;
  external 'kernel32.dll' name 'SetThreadInformation';
function IsWow64Process: pointer; external 'kernel32.dll' name 'IsWow64Process';
function UnregisterWaitEx: pointer;
  external 'kernel32.dll' name 'UnregisterWaitEx';
function TryAcquireSRWLockExclusive: pointer;
  external 'kernel32.dll' name 'TryAcquireSRWLockExclusive';
function GetUserDefaultLocaleName: pointer;
  external 'kernel32.dll' name 'GetUserDefaultLocaleName';
function GetUserDefaultLangID: pointer;
  external 'kernel32.dll' name 'GetUserDefaultLangID';
function TerminateJobObject: pointer;
  external 'kernel32.dll' name 'TerminateJobObject';
function SetThreadDescription(threadHandle: THandle; pcwstr: PWideChar)
  : HResult; stdcall; external 'kernelbase.dll' name 'SetThreadDescription';
function SetConsoleTextAttribute: pointer;
  external 'kernel32.dll' name 'SetConsoleTextAttribute';
function WriteConsoleA: pointer; external 'kernel32.dll' name 'WriteConsoleA';
function GetLogicalProcessorInformation: pointer;
  external 'kernel32.dll' name 'GetLogicalProcessorInformation';
function SleepConditionVariableSRW: pointer;
  external 'kernel32.dll' name 'SleepConditionVariableSRW';
function WakeConditionVariable: pointer;
  external 'kernel32.dll' name 'WakeConditionVariable';
function InitializeConditionVariable: pointer;
  external 'kernel32.dll' name 'InitializeConditionVariable';
function OutputDebugStringA: pointer;
  external 'kernel32.dll' name 'OutputDebugStringA';
function GlobalFree: pointer; external 'kernel32.dll' name 'GlobalFree';
function CreateEventA: pointer; external 'kernel32.dll' name 'CreateEventA';
function QueryPerformanceCounter: pointer;
  external 'kernel32.dll' name 'QueryPerformanceCounter';
function GetCurrentProcessId: pointer;
  external 'kernel32.dll' name 'GetCurrentProcessId';
function GetCurrentThreadId: pointer;
  external 'kernel32.dll' name 'GetCurrentThreadId';
function GetSystemTimeAsFileTime: pointer;
  external 'kernel32.dll' name 'GetSystemTimeAsFileTime';
function InitializeSListHead: pointer;
  external 'kernel32.dll' name 'InitializeSListHead';
function IsDebuggerPresent: pointer;
  external 'kernel32.dll' name 'IsDebuggerPresent';
function UnhandledExceptionFilter: pointer;
  external 'kernel32.dll' name 'UnhandledExceptionFilter';
function SetUnhandledExceptionFilter: pointer;
  external 'kernel32.dll' name 'SetUnhandledExceptionFilter';
function GetStartupInfoW: pointer;
  external 'kernel32.dll' name 'GetStartupInfoW';
function IsProcessorFeaturePresent: pointer;
  external 'kernel32.dll' name 'IsProcessorFeaturePresent';
function GetModuleHandleW: pointer;
  external 'kernel32.dll' name 'GetModuleHandleW';
function GetCurrentProcess: pointer;
  external 'kernel32.dll' name 'GetCurrentProcess';
function TerminateProcess: pointer;
  external 'kernel32.dll' name 'TerminateProcess';
function InterlockedPushEntrySList: pointer;
  external 'kernel32.dll' name 'InterlockedPushEntrySList';
function RtlUnwind: pointer; external 'kernel32.dll' name 'RtlUnwind';
function GetLastError: pointer; external 'kernel32.dll' name 'GetLastError';
function SetLastError: pointer; external 'kernel32.dll' name 'SetLastError';
function EnterCriticalSection: pointer;
  external 'kernel32.dll' name 'EnterCriticalSection';
function LeaveCriticalSection: pointer;
  external 'kernel32.dll' name 'LeaveCriticalSection';
function DeleteCriticalSection: pointer;
  external 'kernel32.dll' name 'DeleteCriticalSection';
function InitializeCriticalSectionAndSpinCount: pointer;
  external 'kernel32.dll' name 'InitializeCriticalSectionAndSpinCount';
function TlsAlloc: pointer; external 'kernel32.dll' name 'TlsAlloc';
function TlsGetValue: pointer; external 'kernel32.dll' name 'TlsGetValue';
function TlsSetValue: pointer; external 'kernel32.dll' name 'TlsSetValue';
function TlsFree: pointer; external 'kernel32.dll' name 'TlsFree';
function FreeLibrary: pointer; external 'kernel32.dll' name 'FreeLibrary';
function GetProcAddress: pointer; external 'kernel32.dll' name 'GetProcAddress';
function LoadLibraryExW: pointer; external 'kernel32.dll' name 'LoadLibraryExW';
function EncodePointer: pointer; external 'kernel32.dll' name 'EncodePointer';
function RaiseException: pointer; external 'kernel32.dll' name 'RaiseException';
function GetStdHandle: pointer; external 'kernel32.dll' name 'GetStdHandle';
function WriteFile: pointer; external 'kernel32.dll' name 'WriteFile';
function GetModuleFileNameW: pointer;
  external 'kernel32.dll' name 'GetModuleFileNameW';
function ExitProcess: pointer; external 'kernel32.dll' name 'ExitProcess';
function GetModuleHandleExW: pointer;
  external 'kernel32.dll' name 'GetModuleHandleExW';
function GetCurrentThread: pointer;
  external 'kernel32.dll' name 'GetCurrentThread';
function OutputDebugStringW: pointer;
  external 'kernel32.dll' name 'OutputDebugStringW';
function HeapAlloc: pointer; external 'kernel32.dll' name 'HeapAlloc';
function HeapFree: pointer; external 'kernel32.dll' name 'HeapFree';
function FindClose: pointer; external 'kernel32.dll' name 'FindClose';
function FindFirstFileExW: pointer;
  external 'kernel32.dll' name 'FindFirstFileExW';
function FindNextFileW: pointer; external 'kernel32.dll' name 'FindNextFileW';
function IsValidCodePage: pointer;
  external 'kernel32.dll' name 'IsValidCodePage';
function GetACP: pointer; external 'kernel32.dll' name 'GetACP';
function GetOEMCP: pointer; external 'kernel32.dll' name 'GetOEMCP';
function GetCPInfo: pointer; external 'kernel32.dll' name 'GetCPInfo';
function GetCommandLineA: pointer;
  external 'kernel32.dll' name 'GetCommandLineA';
function GetCommandLineW: pointer;
  external 'kernel32.dll' name 'GetCommandLineW';
function MultiByteToWideChar: pointer;
  external 'kernel32.dll' name 'MultiByteToWideChar';
function WideCharToMultiByte: pointer;
  external 'kernel32.dll' name 'WideCharToMultiByte';
function GetEnvironmentStringsW: pointer;
  external 'kernel32.dll' name 'GetEnvironmentStringsW';
function FreeEnvironmentStringsW: pointer;
  external 'kernel32.dll' name 'FreeEnvironmentStringsW';
function SetEnvironmentVariableW: pointer;
  external 'kernel32.dll' name 'SetEnvironmentVariableW';
function SetStdHandle: pointer; external 'kernel32.dll' name 'SetStdHandle';
function GetFileType: pointer; external 'kernel32.dll' name 'GetFileType';
function GetStringTypeW: pointer; external 'kernel32.dll' name 'GetStringTypeW';
function GetLocaleInfoW: pointer; external 'kernel32.dll' name 'GetLocaleInfoW';
function IsValidLocale: pointer; external 'kernel32.dll' name 'IsValidLocale';
function GetUserDefaultLCID: pointer;
  external 'kernel32.dll' name 'GetUserDefaultLCID';
function EnumSystemLocalesW: pointer;
  external 'kernel32.dll' name 'EnumSystemLocalesW';
function GetTempPathW: pointer; external 'kernel32.dll' name 'GetTempPathW';
function GetDateFormatW: pointer; external 'kernel32.dll' name 'GetDateFormatW';
function GetTimeFormatW: pointer; external 'kernel32.dll' name 'GetTimeFormatW';
function CompareStringW: pointer; external 'kernel32.dll' name 'CompareStringW';
function LCMapStringW: pointer; external 'kernel32.dll' name 'LCMapStringW';
function GetProcessHeap: pointer; external 'kernel32.dll' name 'GetProcessHeap';
function SetConsoleCtrlHandler: pointer;
  external 'kernel32.dll' name 'SetConsoleCtrlHandler';
function HeapSize: pointer; external 'kernel32.dll' name 'HeapSize';
function HeapReAlloc: pointer; external 'kernel32.dll' name 'HeapReAlloc';
function FlushFileBuffers: pointer;
  external 'kernel32.dll' name 'FlushFileBuffers';
function GetConsoleOutputCP: pointer;
  external 'kernel32.dll' name 'GetConsoleOutputCP';
function GetConsoleMode: pointer; external 'kernel32.dll' name 'GetConsoleMode';
function GetFileSizeEx: pointer; external 'kernel32.dll' name 'GetFileSizeEx';
function SetFilePointerEx: pointer;
  external 'kernel32.dll' name 'SetFilePointerEx';
function ReadFile: pointer; external 'kernel32.dll' name 'ReadFile';
function ReadConsoleW: pointer; external 'kernel32.dll' name 'ReadConsoleW';
function CreateFileW: pointer; external 'kernel32.dll' name 'CreateFileW';
function CloseHandle: pointer; external 'kernel32.dll' name 'CloseHandle';
function WriteConsoleW: pointer; external 'kernel32.dll' name 'WriteConsoleW';
function DecodePointer: pointer; external 'kernel32.dll' name 'DecodePointer';
function CreateDirectoryW: pointer;
  external 'kernel32.dll' name 'CreateDirectoryW';
function DeleteFileW: pointer; external 'kernel32.dll' name 'DeleteFileW';
function GetTempFileNameW: pointer;
  external 'kernel32.dll' name 'GetTempFileNameW';
function DebugBreak: pointer; external 'kernel32.dll' name 'DebugBreak';
function CreateProcessW: pointer; external 'kernel32.dll' name 'CreateProcessW';
function GetTickCount64: pointer; external 'kernel32.dll' name 'GetTickCount64';
function GetWindowsDirectoryW: pointer;
  external 'kernel32.dll' name 'GetWindowsDirectoryW';
function LocalFree: pointer; external 'kernel32.dll' name 'LocalFree';
function FormatMessageA: pointer; external 'kernel32.dll' name 'FormatMessageA';
function CopyFileExW: pointer; external 'kernel32.dll' name 'CopyFileExW';
function MoveFileExW: pointer; external 'kernel32.dll' name 'MoveFileExW';
function RegisterApplicationRestart: pointer;
  external 'kernel32.dll' name 'RegisterApplicationRestart';
function GetProcessTimes: pointer;
  external 'kernel32.dll' name 'GetProcessTimes';
function GetSystemTime: pointer; external 'kernel32.dll' name 'GetSystemTime';
function SystemTimeToFileTime: pointer;
  external 'kernel32.dll' name 'SystemTimeToFileTime';
function InitializeCriticalSectionEx: pointer;
  external 'kernel32.dll' name 'InitializeCriticalSectionEx';
function CreateMutexW: pointer; external 'kernel32.dll' name 'CreateMutexW';
function OpenMutexW: pointer; external 'kernel32.dll' name 'OpenMutexW';
function FormatMessageW: pointer; external 'kernel32.dll' name 'FormatMessageW';
function InitializeCriticalSection: pointer;
  external 'kernel32.dll' name 'InitializeCriticalSection';
function CreateIoCompletionPort: pointer;
  external 'kernel32.dll' name 'CreateIoCompletionPort';
function GetQueuedCompletionStatus: pointer;
  external 'kernel32.dll' name 'GetQueuedCompletionStatus';
function PostQueuedCompletionStatus: pointer;
  external 'kernel32.dll' name 'PostQueuedCompletionStatus';
function SetEvent: pointer; external 'kernel32.dll' name 'SetEvent';
function WaitForSingleObject: pointer;
  external 'kernel32.dll' name 'WaitForSingleObject';
function SleepEx: pointer; external 'kernel32.dll' name 'SleepEx';
function CreateEventW: pointer; external 'kernel32.dll' name 'CreateEventW';
function SetWaitableTimer: pointer;
  external 'kernel32.dll' name 'SetWaitableTimer';
function WaitForMultipleObjects: pointer;
  external 'kernel32.dll' name 'WaitForMultipleObjects';
function CreateWaitableTimerW: pointer;
  external 'kernel32.dll' name 'CreateWaitableTimerW';
function QueueUserAPC: pointer; external 'kernel32.dll' name 'QueueUserAPC';
function TerminateThread: pointer;
  external 'kernel32.dll' name 'TerminateThread';
function CancelIoEx: pointer; external 'kernel32.dll' name 'CancelIoEx';
function Sleep: pointer; external 'kernel32.dll' name 'Sleep';
function GetFileAttributesExW: pointer;
  external 'kernel32.dll' name 'GetFileAttributesExW';
function GetFullPathNameW: pointer;
  external 'kernel32.dll' name 'GetFullPathNameW';
function CancelIo: pointer; external 'kernel32.dll' name 'CancelIo';
function CreateThread: pointer; external 'kernel32.dll' name 'CreateThread';
function ReadDirectoryChangesW: pointer;
  external 'kernel32.dll' name 'ReadDirectoryChangesW';
function GetVersionExW: pointer; external 'kernel32.dll' name 'GetVersionExW';
function SetThreadPriority: pointer;
  external 'kernel32.dll' name 'SetThreadPriority';
function CreateEventExW: pointer; external 'kernel32.dll' name 'CreateEventExW';
function LocalAlloc: pointer; external 'kernel32.dll' name 'LocalAlloc';
function LoadLibraryW: pointer; external 'kernel32.dll' name 'LoadLibraryW';
function GetConsoleScreenBufferInfo: pointer;
  external 'kernel32.dll' name 'GetConsoleScreenBufferInfo';
function GetVersion: pointer; external 'kernel32.dll' name 'GetVersion';
function GetFileSize: pointer; external 'kernel32.dll' name 'GetFileSize';
function CreateToolhelp32Snapshot: pointer;
  external 'kernel32.dll' name 'CreateToolhelp32Snapshot';
function Process32FirstW: pointer;
  external 'kernel32.dll' name 'Process32FirstW';
function Process32NextW: pointer; external 'kernel32.dll' name 'Process32NextW';
function GetComputerNameW: pointer;
  external 'kernel32.dll' name 'GetComputerNameW';
function GetSystemPowerStatus: pointer;
  external 'kernel32.dll' name 'GetSystemPowerStatus';
function OpenProcess: pointer; external 'kernel32.dll' name 'OpenProcess';
function K32GetProcessMemoryInfo: pointer;
  external 'kernel32.dll' name 'K32GetProcessMemoryInfo';
function ResetEvent: pointer; external 'kernel32.dll' name 'ResetEvent';
function ReleaseMutex: pointer; external 'kernel32.dll' name 'ReleaseMutex';
function GetSystemInfo: pointer; external 'kernel32.dll' name 'GetSystemInfo';
function QueryFullProcessImageNameW: pointer;
  external 'kernel32.dll' name 'QueryFullProcessImageNameW';
function GetFileInformationByHandle: pointer;
  external 'kernel32.dll' name 'GetFileInformationByHandle';
function LockFile: pointer; external 'kernel32.dll' name 'LockFile';
function LockFileEx: pointer; external 'kernel32.dll' name 'LockFileEx';
function SetEndOfFile: pointer; external 'kernel32.dll' name 'SetEndOfFile';
function SetFilePointer: pointer; external 'kernel32.dll' name 'SetFilePointer';
function UnlockFile: pointer; external 'kernel32.dll' name 'UnlockFile';
function GetOverlappedResult: pointer;
  external 'kernel32.dll' name 'GetOverlappedResult';
function CreateMutexA: pointer; external 'kernel32.dll' name 'CreateMutexA';
function VirtualAlloc: pointer; external 'kernel32.dll' name 'VirtualAlloc';
function CreateFileMappingW: pointer;
  external 'kernel32.dll' name 'CreateFileMappingW';
function MapViewOfFileEx: pointer;
  external 'kernel32.dll' name 'MapViewOfFileEx';
function UnmapViewOfFile: pointer;
  external 'kernel32.dll' name 'UnmapViewOfFile';
function OpenMutexA: pointer; external 'kernel32.dll' name 'OpenMutexA';
function GetThreadId: pointer; external 'kernel32.dll' name 'GetThreadId';
function GetModuleHandleA: pointer;
  external 'kernel32.dll' name 'GetModuleHandleA';
function LoadResource: pointer; external 'kernel32.dll' name 'LoadResource';
function LockResource: pointer; external 'kernel32.dll' name 'LockResource';
function SizeofResource: pointer; external 'kernel32.dll' name 'SizeofResource';
function FindResourceW: pointer; external 'kernel32.dll' name 'FindResourceW';
function GetUserDefaultUILanguage: pointer;
  external 'kernel32.dll' name 'GetUserDefaultUILanguage';
function ExpandEnvironmentStringsW: pointer;
  external 'kernel32.dll' name 'ExpandEnvironmentStringsW';
function GlobalAlloc: pointer; external 'kernel32.dll' name 'GlobalAlloc';
function GlobalSize: pointer; external 'kernel32.dll' name 'GlobalSize';
function GlobalUnlock: pointer; external 'kernel32.dll' name 'GlobalUnlock';
function GlobalLock: pointer; external 'kernel32.dll' name 'GlobalLock';
function GetLocaleInfoEx: pointer;
  external 'kernel32.dll' name 'GetLocaleInfoEx';
function MapViewOfFile: pointer; external 'kernel32.dll' name 'MapViewOfFile';
function CreateFileMappingA: pointer;
  external 'kernel32.dll' name 'CreateFileMappingA';
function OpenFileMappingA: pointer;
  external 'kernel32.dll' name 'OpenFileMappingA';
function AllocConsole: pointer; external 'kernel32.dll' name 'AllocConsole';
function AttachConsole: pointer; external 'kernel32.dll' name 'AttachConsole';
function GetCurrentConsoleFont: pointer;
  external 'kernel32.dll' name 'GetCurrentConsoleFont';
function SetCurrentDirectoryW: pointer;
  external 'kernel32.dll' name 'SetCurrentDirectoryW';
function GetCurrentDirectoryW: pointer;
  external 'kernel32.dll' name 'GetCurrentDirectoryW';
function GetExitCodeProcess: pointer;
  external 'kernel32.dll' name 'GetExitCodeProcess';
function PowerCreateRequest: pointer;
  external 'kernel32.dll' name 'PowerCreateRequest';
function PowerSetRequest: pointer;
  external 'kernel32.dll' name 'PowerSetRequest';
function PowerClearRequest: pointer;
  external 'kernel32.dll' name 'PowerClearRequest';
function ResumeThread: pointer; external 'kernel32.dll' name 'ResumeThread';
function CreateJobObjectW: pointer;
  external 'kernel32.dll' name 'CreateJobObjectW';
function AssignProcessToJobObject: pointer;
  external 'kernel32.dll' name 'AssignProcessToJobObject';
function SetInformationJobObject: pointer;
  external 'kernel32.dll' name 'SetInformationJobObject';
function RegisterWaitForSingleObject: pointer;
  external 'kernel32.dll' name 'RegisterWaitForSingleObject';
function UnregisterWait: pointer; external 'kernel32.dll' name 'UnregisterWait';
function InitializeSRWLock: pointer;
  external 'kernel32.dll' name 'InitializeSRWLock';
function ReleaseSRWLockExclusive: pointer;
  external 'kernel32.dll' name 'ReleaseSRWLockExclusive';
function ReleaseSRWLockShared: pointer;
  external 'kernel32.dll' name 'ReleaseSRWLockShared';
function AcquireSRWLockExclusive: pointer;
  external 'kernel32.dll' name 'AcquireSRWLockExclusive';
function AcquireSRWLockShared: pointer;
  external 'kernel32.dll' name 'AcquireSRWLockShared';
function GetSystemDirectoryA: pointer;
  external 'kernel32.dll' name 'GetSystemDirectoryA';
function LoadLibraryA: pointer; external 'kernel32.dll' name 'LoadLibraryA';
function VirtualProtect: pointer; external 'kernel32.dll' name 'VirtualProtect';
function VirtualFree: pointer; external 'kernel32.dll' name 'VirtualFree';
function SwitchToFiber: pointer; external 'kernel32.dll' name 'SwitchToFiber';
function DeleteFiber: pointer; external 'kernel32.dll' name 'DeleteFiber';
function CreateFiberEx: pointer; external 'kernel32.dll' name 'CreateFiberEx';
function GetEnvironmentVariableW: pointer;
  external 'kernel32.dll' name 'GetEnvironmentVariableW';
function ConvertFiberToThread: pointer;
  external 'kernel32.dll' name 'ConvertFiberToThread';
function ConvertThreadToFiberEx: pointer;
  external 'kernel32.dll' name 'ConvertThreadToFiberEx';
function SetConsoleMode: pointer; external 'kernel32.dll' name 'SetConsoleMode';
function ReadConsoleA: pointer; external 'kernel32.dll' name 'ReadConsoleA';
function FindFirstFileW: pointer; external 'kernel32.dll' name 'FindFirstFileW';
function VerSetConditionMask: pointer;
  external 'kernel32.dll' name 'VerSetConditionMask';
function GetNativeSystemInfo: pointer;
  external 'kernel32.dll' name 'GetNativeSystemInfo';
function VerifyVersionInfoW: pointer;
  external 'kernel32.dll' name 'VerifyVersionInfoW';
function GetFileAttributesW: pointer;
  external 'kernel32.dll' name 'GetFileAttributesW';
function RemoveDirectoryW: pointer;
  external 'kernel32.dll' name 'RemoveDirectoryW';
function GetTempPathA: pointer; external 'kernel32.dll' name 'GetTempPathA';
function GetLocalTime: pointer; external 'kernel32.dll' name 'GetLocalTime';
function MoveFileW: pointer; external 'kernel32.dll' name 'MoveFileW';
function ReplaceFileW: pointer; external 'kernel32.dll' name 'ReplaceFileW';
function QueryPerformanceFrequency: pointer;
  external 'kernel32.dll' name 'QueryPerformanceFrequency';
function GetTickCount: pointer; external 'kernel32.dll' name 'GetTickCount';
function K32EnumProcessModules: pointer;
  external 'kernel32.dll' name 'K32EnumProcessModules';
function K32GetModuleFileNameExW: pointer;
  external 'kernel32.dll' name 'K32GetModuleFileNameExW';
function K32GetModuleInformation: pointer;
  external 'kernel32.dll' name 'K32GetModuleInformation';
function GetVolumePathNameW: pointer;
  external 'kernel32.dll' name 'GetVolumePathNameW';
function AreFileApisANSI: pointer;
  external 'kernel32.dll' name 'AreFileApisANSI';
function GetDiskFreeSpaceExW: pointer;
  external 'kernel32.dll' name 'GetDiskFreeSpaceExW';
function GetFileTime: pointer; external 'kernel32.dll' name 'GetFileTime';
function SetFileAttributesW: pointer;
  external 'kernel32.dll' name 'SetFileAttributesW';
function DeviceIoControl: pointer;
  external 'kernel32.dll' name 'DeviceIoControl';
function CreateDirectoryExW: pointer;
  external 'kernel32.dll' name 'CreateDirectoryExW';
function TrySubmitThreadpoolCallback: pointer;
  external 'kernel32.dll' name 'TrySubmitThreadpoolCallback';

exports
  SubmitThreadpoolWork, CreateThreadpoolWork, FreeLibraryWhenCallbackReturns,
  InitOnceComplete, InitOnceBeginInitialize, GetExitCodeThread, SwitchToThread,
  GetTimeZoneInformation, PeekNamedPipe, FreeLibraryAndExitThread, ExitThread,
  GetDriveTypeW, WaitForSingleObjectEx, LoadLibraryExA, LCMapStringEx,
  CompareStringEx, CloseThreadpoolWork, WakeAllConditionVariable,
  GetSystemDirectoryW, CreateRemoteThread, VirtualQuery,
  RtlCaptureStackBackTrace, GetProcessHeaps, VirtualFreeEx,
  UpdateProcThreadAttribute, InitializeProcThreadAttributeList,
  DeleteProcThreadAttributeList, VirtualProtectEx, QueryInformationJobObject,
  SystemTimeToTzSpecificLocalTime, FileTimeToSystemTime, HeapDestroy,
  EnumSystemLocalesEx, GetProcessHandleCount, SetThreadAffinityMask,
  GetCurrentProcessorNumber, ReadProcessMemory, GetProductInfo,
  SetProcessMitigationPolicy, VirtualAllocEx, VirtualQueryEx,
  GetProcessMitigationPolicy, SetProcessDEPPolicy, HeapSetInformation,
  SetDefaultDllDirectories, WriteProcessMemory, SetHandleInformation,
  DuplicateHandle, SetThreadInformation, IsWow64Process, UnregisterWaitEx,
  TryAcquireSRWLockExclusive, GetUserDefaultLocaleName, GetUserDefaultLangID,
  TerminateJobObject, SetThreadDescription, SetConsoleTextAttribute,
  WriteConsoleA, GetLogicalProcessorInformation, SleepConditionVariableSRW,
  WakeConditionVariable, InitializeConditionVariable, OutputDebugStringA,
  GlobalFree, CreateEventA, QueryPerformanceCounter, GetCurrentProcessId,
  GetCurrentThreadId, GetSystemTimeAsFileTime, InitializeSListHead,
  IsDebuggerPresent, UnhandledExceptionFilter, SetUnhandledExceptionFilter,
  GetStartupInfoW, IsProcessorFeaturePresent, GetModuleHandleW,
  GetCurrentProcess, TerminateProcess, InterlockedPushEntrySList, RtlUnwind,
  GetLastError, SetLastError, EnterCriticalSection, LeaveCriticalSection,
  DeleteCriticalSection, InitializeCriticalSectionAndSpinCount, TlsAlloc,
  TlsGetValue,
  TlsSetValue, TlsFree, FreeLibrary, GetProcAddress, LoadLibraryExW,
  EncodePointer, RaiseException, GetStdHandle, WriteFile, GetModuleFileNameW,
  ExitProcess, GetModuleHandleExW, GetCurrentThread, OutputDebugStringW,
  HeapAlloc, HeapFree, FindClose, FindFirstFileExW, FindNextFileW,
  IsValidCodePage, GetACP, GetOEMCP, GetCPInfo, GetCommandLineA,
  GetCommandLineW, MultiByteToWideChar, WideCharToMultiByte,
  GetEnvironmentStringsW, FreeEnvironmentStringsW, SetEnvironmentVariableW,
  SetStdHandle, GetFileType, GetStringTypeW, GetLocaleInfoW, IsValidLocale,
  GetUserDefaultLCID, EnumSystemLocalesW, GetTempPathW, GetDateFormatW,
  GetTimeFormatW, CompareStringW, LCMapStringW, GetProcessHeap,
  SetConsoleCtrlHandler, HeapSize, HeapReAlloc, FlushFileBuffers,
  GetConsoleOutputCP, GetConsoleMode, GetFileSizeEx,
  SetFilePointerEx, ReadFile, ReadConsoleW, CreateFileW, CloseHandle,
  WriteConsoleW, DecodePointer, CreateDirectoryW, DeleteFileW, GetTempFileNameW,
  DebugBreak, CreateProcessW, GetTickCount64, GetWindowsDirectoryW, LocalFree,
  FormatMessageA, CopyFileExW, MoveFileExW, RegisterApplicationRestart,
  GetProcessTimes, GetSystemTime, SystemTimeToFileTime,
  InitializeCriticalSectionEx, CreateMutexW, OpenMutexW, FormatMessageW,
  InitializeCriticalSection, CreateIoCompletionPort, GetQueuedCompletionStatus,
  PostQueuedCompletionStatus, SetEvent, WaitForSingleObject, SleepEx,
  CreateEventW, SetWaitableTimer, WaitForMultipleObjects, CreateWaitableTimerW,
  QueueUserAPC, TerminateThread, CancelIoEx, Sleep, GetFileAttributesExW,
  GetFullPathNameW, CancelIo, CreateThread, ReadDirectoryChangesW,
  GetVersionExW, SetThreadPriority, CreateEventExW, LocalAlloc, LoadLibraryW,
  GetConsoleScreenBufferInfo, GetVersion, GetFileSize, CreateToolhelp32Snapshot,
  Process32FirstW, Process32NextW, GetComputerNameW, GetSystemPowerStatus,
  OpenProcess, K32GetProcessMemoryInfo, ResetEvent, ReleaseMutex, GetSystemInfo,
  QueryFullProcessImageNameW, GetFileInformationByHandle, LockFile, LockFileEx,
  SetEndOfFile, SetFilePointer, UnlockFile, GetOverlappedResult, CreateMutexA,
  VirtualAlloc, CreateFileMappingW, MapViewOfFileEx, UnmapViewOfFile,
  OpenMutexA, GetThreadId, GetModuleHandleA, LoadResource, LockResource,
  SizeofResource,
  FindResourceW, GetUserDefaultUILanguage, ExpandEnvironmentStringsW,
  GlobalAlloc, GlobalSize, GlobalUnlock, GlobalLock, GetLocaleInfoEx,
  MapViewOfFile, CreateFileMappingA, OpenFileMappingA, AllocConsole,
  AttachConsole, GetCurrentConsoleFont, SetCurrentDirectoryW,
  GetCurrentDirectoryW, GetExitCodeProcess, PowerCreateRequest, PowerSetRequest,
  PowerClearRequest, ResumeThread, CreateJobObjectW, AssignProcessToJobObject,
  SetInformationJobObject, RegisterWaitForSingleObject, UnregisterWait,
  InitializeSRWLock, ReleaseSRWLockExclusive, ReleaseSRWLockShared,
  AcquireSRWLockExclusive, AcquireSRWLockShared, GetSystemDirectoryA,
  LoadLibraryA, VirtualProtect, VirtualFree, SwitchToFiber, DeleteFiber,
  CreateFiberEx, GetEnvironmentVariableW, ConvertFiberToThread,
  ConvertThreadToFiberEx, SetConsoleMode,
  ReadConsoleA, FindFirstFileW, VerSetConditionMask, GetNativeSystemInfo,
  VerifyVersionInfoW, GetFileAttributesW, RemoveDirectoryW, GetTempPathA,
  GetLocalTime, MoveFileW, ReplaceFileW, QueryPerformanceFrequency,
  GetTickCount, K32EnumProcessModules, K32GetModuleFileNameExW,
  K32GetModuleInformation, GetVolumePathNameW, AreFileApisANSI,
  GetDiskFreeSpaceExW, GetFileTime, SetFileAttributesW, DeviceIoControl,
  CreateDirectoryExW, TrySubmitThreadpoolCallback;

begin

end.
