
#pragma once

// got from here https://github.com/Stovent/CeDImu/blob/master/src/CDI/OS9/SystemCalls.hpp
enum SystemCallType {
    F_Link = 0x0000,
    F_Load = 0x0001,
    F_UnLink = 0x0002,
    F_Fork = 0x0003,
    F_Wait = 0x0004,
    F_Chain = 0x0005,
    F_Exit = 0x0006,
    F_Mem = 0x0007,
    F_Send = 0x0008,
    F_Icpt = 0x0009,
    F_Sleep = 0x000A,
    F_SSpd = 0x000B,
    F_ID = 0x000C,
    F_SPrior = 0x000D,
    F_STrap = 0x000E,
    F_PErr = 0x000F,
    F_PrsNam = 0x0010,
    F_CmpNam = 0x0011,
    F_SchBit = 0x0012,
    F_AllBit = 0x0013,
    F_DelBit = 0x0014,
    F_Time = 0x0015,
    F_STime = 0x0016,
    F_CRC = 0x0017,
    F_GPrDsc = 0x0018,
    F_GBlkMp = 0x0019,
    F_GModDr = 0x001A,
    F_CpyMem = 0x001B,
    F_SUser = 0x001C,
    F_UnLoad = 0x001D,
    F_RTE = 0x001E,
    F_GPrDBT = 0x001F,
    F_Julian = 0x0020,
    F_TLink = 0x0021,
    F_DFork = 0x0022,
    F_DExec = 0x0023,
    F_DExit = 0x0024,
    F_DatMod = 0x0025,
    F_SetCRC = 0x0026,
    F_SetSys = 0x0027,
    F_SRqMem = 0x0028,
    F_SRtMem = 0x0029,
    F_IRQ = 0x002A,
    F_IOQu = 0x002B,
    F_AProc = 0x002C,
    F_NProc = 0x002D,
    F_VModul = 0x002E,
    F_FindPD = 0x002F,
    F_AllPD = 0x0030,
    F_RetPD = 0x0031,
    F_SSvc = 0x0032,
    F_IODel = 0x0033,
    F_GProcP = 0x0037,
    F_Move = 0x0038,
    F_AllRAM = 0x0039,
    F_Permit = 0x003A,
    F_Protect = 0x003B,
    F_AllTsk = 0x003F,
    F_DelTsk = 0x0040,
    F_AllPrc = 0x004B,
    F_DelPrc = 0x004C,
    F_FModul = 0x004E,
    F_SysDbg = 0x0052,
    F_Event = 0x0053,
    F_Gregor = 0x0054,
    F_SysID = 0x0055,
    F_Alarm = 0x0056,
    F_SigMask = 0x0057,
    F_ChkMem = 0x0058,
    F_UAcct = 0x0059,
    F_CCtl = 0x005A,
    F_GSPUMp = 0x005B,
    F_SRqCMem = 0x005C,
    F_POSK = 0x005D,
    F_Panic = 0x005E,
    F_MBuf = 0x005F,
    F_Trans = 0x0060,
    I_Attach = 0x0080,
    I_Detach = 0x0081,
    I_Dup = 0x0082,
    I_Create = 0x0083,
    I_Open = 0x0084,
    I_MakDir = 0x0085,
    I_ChgDir = 0x0086,
    I_Delete = 0x0087,
    I_Seek = 0x0088,
    I_Read = 0x0089,
    I_Write = 0x008A,
    I_ReadLn = 0x008B,
    I_WritLn = 0x008C,
    I_GetStt = 0x008D,
    I_SetStt = 0x008E,
    I_Close = 0x008F,
};

// got this from here https://github.com/Stovent/CeDImu/blob/master/src/CDI/OS9/SystemCalls.cpp
const char *systemCallNameToString(const SystemCallType call) {
    switch (call) {
    case SystemCallType::F_Link:
        return "F$Link";
    case SystemCallType::F_Load:
        return "F$Load";
    case SystemCallType::F_UnLink:
        return "F$UnLink";
    case SystemCallType::F_Fork:
        return "F$Fork";
    case SystemCallType::F_Wait:
        return "F$Wait";
    case SystemCallType::F_Chain:
        return "F$Chain";
    case SystemCallType::F_Exit:
        return "F$Exit";
    case SystemCallType::F_Mem:
        return "F$Mem";
    case SystemCallType::F_Send:
        return "F$Send";
    case SystemCallType::F_Icpt:
        return "F$Icpt";
    case SystemCallType::F_Sleep:
        return "F$Sleep";
    case SystemCallType::F_SSpd:
        return "F$SSpd";
    case SystemCallType::F_ID:
        return "F$ID";
    case SystemCallType::F_SPrior:
        return "F$SPrior";
    case SystemCallType::F_STrap:
        return "F$STrap";
    case SystemCallType::F_PErr:
        return "F$PErr";
    case SystemCallType::F_PrsNam:
        return "F$PrsNam";
    case SystemCallType::F_CmpNam:
        return "F$CmpNam";
    case SystemCallType::F_SchBit:
        return "F$SchBit";
    case SystemCallType::F_AllBit:
        return "F$AllBit";
    case SystemCallType::F_DelBit:
        return "F$DelBit";
    case SystemCallType::F_Time:
        return "F$Time";
    case SystemCallType::F_STime:
        return "F$STime";
    case SystemCallType::F_CRC:
        return "F$CRC";
    case SystemCallType::F_GPrDsc:
        return "F$GPrDsc";
    case SystemCallType::F_GBlkMp:
        return "F$GBlkMp";
    case SystemCallType::F_GModDr:
        return "F$GModDr";
    case SystemCallType::F_CpyMem:
        return "F$CpyMem";
    case SystemCallType::F_SUser:
        return "F$SUser";
    case SystemCallType::F_UnLoad:
        return "F$UnLoad";
    case SystemCallType::F_RTE:
        return "F$RTE";
    case SystemCallType::F_GPrDBT:
        return "F$GPrDBT";
    case SystemCallType::F_Julian:
        return "F$Julian";
    case SystemCallType::F_TLink:
        return "F$TLink";
    case SystemCallType::F_DFork:
        return "F$DFork";
    case SystemCallType::F_DExec:
        return "F$DExec";
    case SystemCallType::F_DExit:
        return "F$DExit";
    case SystemCallType::F_DatMod:
        return "F$DatMod";
    case SystemCallType::F_SetCRC:
        return "F$SetCRC";
    case SystemCallType::F_SetSys:
        return "F$SetSys";
    case SystemCallType::F_SRqMem:
        return "F$SRqMem";
    case SystemCallType::F_SRtMem:
        return "F$SRtMem";
    case SystemCallType::F_IRQ:
        return "F$IRQ";
    case SystemCallType::F_IOQu:
        return "F$IOQu";
    case SystemCallType::F_AProc:
        return "F$AProc";
    case SystemCallType::F_NProc:
        return "F$NProc";
    case SystemCallType::F_VModul:
        return "F$VModul";
    case SystemCallType::F_FindPD:
        return "F$FindPD";
    case SystemCallType::F_AllPD:
        return "F$AllPD";
    case SystemCallType::F_RetPD:
        return "F$RetPD";
    case SystemCallType::F_SSvc:
        return "F$SSvc";
    case SystemCallType::F_IODel:
        return "F$IODel";
    case SystemCallType::F_GProcP:
        return "F$GProcP";
    case SystemCallType::F_Move:
        return "F$Move";
    case SystemCallType::F_AllRAM:
        return "F$AllRAM";
    case SystemCallType::F_Permit:
        return "F$Permit";
    case SystemCallType::F_Protect:
        return "F$Protect";
    case SystemCallType::F_AllTsk:
        return "F$AllTsk";
    case SystemCallType::F_DelTsk:
        return "F$DelTsk";
    case SystemCallType::F_AllPrc:
        return "F$AllPrc";
    case SystemCallType::F_DelPrc:
        return "F$DelPrc";
    case SystemCallType::F_FModul:
        return "F$FModul";
    case SystemCallType::F_SysDbg:
        return "F$SysDbg";
    case SystemCallType::F_Event:
        return "F$Event";
    case SystemCallType::F_Gregor:
        return "F$Gregor";
    case SystemCallType::F_SysID:
        return "F$SysID";
    case SystemCallType::F_Alarm:
        return "F$Alarm";
    case SystemCallType::F_SigMask:
        return "F$SigMask";
    case SystemCallType::F_ChkMem:
        return "F$ChkMem";
    case SystemCallType::F_UAcct:
        return "F$UAcct";
    case SystemCallType::F_CCtl:
        return "F$CCtl";
    case SystemCallType::F_GSPUMp:
        return "F$GSPUMp";
    case SystemCallType::F_SRqCMem:
        return "F$SRqCMem";
    case SystemCallType::F_POSK:
        return "F$POSK";
    case SystemCallType::F_Panic:
        return "F$Panic";
    case SystemCallType::F_MBuf:
        return "F$MBuf";
    case SystemCallType::F_Trans:
        return "F$Trans";
    case SystemCallType::I_Attach:
        return "I$Attach";
    case SystemCallType::I_Detach:
        return "I$Detach";
    case SystemCallType::I_Dup:
        return "I$Dup";
    case SystemCallType::I_Create:
        return "I$Create";
    case SystemCallType::I_Open:
        return "I$Open";
    case SystemCallType::I_MakDir:
        return "I$MakDir";
    case SystemCallType::I_ChgDir:
        return "I$ChgDir";
    case SystemCallType::I_Delete:
        return "I$Delete";
    case SystemCallType::I_Seek:
        return "I$Seek";
    case SystemCallType::I_Read:
        return "I$Read";
    case SystemCallType::I_Write:
        return "I$Write";
    case SystemCallType::I_ReadLn:
        return "I$ReadLn";
    case SystemCallType::I_WritLn:
        return "I$WritLn";
    case SystemCallType::I_GetStt:
        return "I$GetStt";
    case SystemCallType::I_SetStt:
        return "I$SetStt";
    case SystemCallType::I_Close:
        return "I$Close";
    default:
        return "Unknown system call ";
    }
}