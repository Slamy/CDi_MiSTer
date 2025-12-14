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

// from https://github.com/Stovent/CeDImu/blob/master/src/CDI/OS9/Stt.hpp

enum SttFunction {
    SS_Opt = 0x00,   // read/write PD options
    SS_Ready = 0x01, // check for device ready
    SS_Size = 0x02,  // read/write file size
    SS_Reset = 0x03, // device restore
    SS_WTrk = 0x04,  // device write track
    SS_Pos = 0x05,   // get file current position
    SS_EOF = 0x06,   // test for end of file
    SS_Link = 0x07,  // link to status routines
    SS_ULink = 0x08, // unlink status routines
    SS_Feed = 0x09,  // destructive forward skip (form feed)
    SS_Frz = 0x0a,   // freeze DD_ information
    SS_SPT = 0x0b,   // set DD_TKS to given value
    SS_SQD = 0x0c,   // sequence down hard disk
    SS_DCmd = 0x0d,  // send direct command to device
    SS_DevNm = 0x0e, // return device name
    SS_FD = 0x0f,    // return file descriptor
    SS_Ticks = 0x10, // set lockout honor duration
    SS_Lock = 0x11,  // lock/release record
    SS_DStat = 0x12, // return display status
    SS_Joy = 0x13,   // return joystick value
    SS_BlkRd = 0x14, // block read
    SS_BlkWr = 0x15, // block write
    SS_Reten = 0x16, // retention cycle
    SS_WFM = 0x17,   // write file mark
    SS_RFM = 0x18,   // read past file mark
    SS_ELog = 0x19,  // read error log
    SS_SSig = 0x1a,  // send signal on data ready
    SS_Relea = 0x1b, // release device
    SS_Attr = 0x1c,  // set file attributes
    SS_Break = 0x1d, // send break out serial device
    SS_RsBit = 0x1e, // reserve bitmap sector (for disk reorganization)
    SS_RMS = 0x1f,   // get/set Motorola RMS status
    SS_FDInf = 0x20, // get FD info for specified FD sector
    SS_ACRTC = 0x21, // get/set Hitachi ACRTC status
    SS_IFC = 0x22,   // serial input flow control
    SS_OFC = 0x23,   // serial output flow control
    SS_EnRTS = 0x24, // enable RTS (modem control)
    SS_DsRTS = 0x25, // disable RTS (modem control)
    SS_DCOn = 0x26,  // send signal DCD TRUE
    SS_DCOff = 0x27, // send signal DCD FALSE
    SS_Skip = 0x28,  // skip block(s)
    SS_Mode = 0x29,  // set RBF access mode
    SS_Open = 0x2a,  // notification of new path opened
    SS_Close = 0x2b, // notification of path being closed

    SS_Path = 0x2c,    // CDFM return pathlist for open path
    SS_Play = 0x2d,    // CDFM play (CD-I) file
    SS_HEADER = 0x2e,  // CDFM return header of last sector read
    SS_Raw = 0x2f,     // CDFM read raw sectors
    SS_Seek = 0x30,    // CDFM issue physical seek command
    SS_Abort = 0x31,   // CDFM abort asynchronous operation in progress
    SS_CDDA = 0x32,    // CDFM play CD digital audio
    SS_Pause = 0x33,   // CDFM pause the disc driver
    SS_Eject = 0x34,   // CDFM open the drive door
    SS_Mount = 0x35,   // CDFM mount disc by disc number
    SS_Stop = 0x36,    // CDFM stop the disc drive
    SS_Cont = 0x37,    // CDFM start the disc after pause
    SS_Disable = 0x38, // CDFM disable hardware controls
    SS_Enable = 0x39,  // CDFM enable hardware controls
    SS_ReadToc = 0x3a, // CDFM read TOC (on red discs)
    SS_SM = 0x3b,      // CDFM's soundmap control status code
    SS_SD = 0x3c,      // CDFM's sound data manipulation status code
    SS_SC = 0x3d,      // CDFM's sound control status code

    SS_SEvent = 0x3E,  // set event on data ready
    SS_Sound = 0x3F,   // produce audible sound
    SS_DSize = 0x40,   // get drive size (in sectors)
    SS_Net = 0x41,     // NFM wild card getstat/setstat, with subcode
    SS_Rename = 0x42,  // rename file
    SS_Free = 0x43,    // return free statistics
    SS_VarSect = 0x44, // variable sector size supported query

    SS_UCM = 0x4C,   // UCM reserved
    SS_DM = 0x51,    // UCM's drawmap control status code
    SS_GC = 0x52,    // UCM's graphics cursor status code
    SS_RG = 0x53,    // UCM's region status code
    SS_DP = 0x54,    // UCM's drawing parameters status code
    SS_DR = 0x55,    // UCM's graphics drawing status code
    SS_DC = 0x56,    // UCM's display control status code
    SS_CO = 0x57,    // UCM's character output status code
    SS_VIQ = 0x58,   // UCM's video inquiry status code
    SS_PT = 0x59,    // UCM's pointer status code
    SS_SLink = 0x5A, // UCM link external subroutine module to UCM
    SS_KB = 0x5B,    // keyboard status code
    SS_SL = 0x5C,    // MC68HC05 Slave commands

    // sockets
    SS_Bind = 0x6C,    // bind a socket name
    SS_Listen = 0x6D,  // listen for connections
    SS_Connect = 0x6E, // initiate a connection
    SS_Resv = 0x6F,    // socket characteristics specification
    SS_Accept = 0x70,  // accept socket connections
    SS_Recv = 0x71,    // receive data
    SS_Send = 0x72,    // send data
    SS_GNam = 0x73,    // get socket name
    SS_SOpt = 0x74,    // set socket option
    SS_GOpt = 0x75,    // get socket option
    SS_Shut = 0x76,    // shut down socket connection
    SS_SendTo = 0x77,  // send to address
    SS_RecvFr = 0x78,  // receive from address
    SS_Install = 0x79, // install upper level protocol (ULP)

    SS_PCmd = 0x7A, // protocol direct command

    SS_SN = 0x8C,    // DSM's screen functions
    SS_AR = 0x8D,    // DSM's action region functions
    SS_MS = 0x8E,    // DSM's message functions
    SS_AC = 0x8F,    // DSM's action cursor functions
    SS_CDFD = 0x90,  // CDFM return file descriptor information
    SS_CCHAN = 0x91, // CDFM change channel request
    SS_FG = 0x92,
    SS_Sony = 0xA0,

    MV_Abort = 0x100,
    MV_BColor = 0x101,
    MV_ChSpeed = 0x102,
    MV_Conceal = 0x104,
    MV_Continue = 0x105,
    MV_Freeze = 0x106,
    MV_Hide = 0x107,
    MV_ImgSize = 0x108,
    MV_Loop = 0x109,
    MV_Next = 0x10a,
    MV_Off = 0x10b,
    MV_Org = 0x10c,
    MV_Pause = 0x10d,
    MV_Play = 0x10e,
    MV_Pos = 0x10f,
    MV_Release = 0x110,
    MV_SelStrm = 0x111,
    MV_Show = 0x112,
    MV_Trigger = 0x113,
    MV_Window = 0x114,
    MV_ReqSync = 0x117,

    MA_Abort = 0x011E, // from cdiemu
    MA_Close = 0x011F,
    MA_Cntrl = 0x0120,
    MA_Continue = 0x0121,
    MA_Loop = 0x0122,
    MA_Pause = 0x0123,
    MA_Play = 0x0124,
    MA_Release = 0x0125,
    MA_Trigger = 0x0126,
    MA_SLink = 0x0127,
    MA_Jump = 0x0128,

    MV_Create = 0x0130,
    MV_Info = 0x0131,
    MV_Status = 0x0132,

    MA_Create = 0x0138,
};

const char *sttFunctionToString(const uint16_t stt) {
    switch (stt) {
    case SttFunction::SS_Opt:
        return "SS_Opt";
    case SttFunction::SS_Ready:
        return "SS_Ready";
    case SttFunction::SS_Size:
        return "SS_Size";
    case SttFunction::SS_Reset:
        return "SS_Reset";
    case SttFunction::SS_WTrk:
        return "SS_WTrk";
    case SttFunction::SS_Pos:
        return "SS_Pos";
    case SttFunction::SS_EOF:
        return "SS_EOF";
    case SttFunction::SS_Link:
        return "SS_Link";
    case SttFunction::SS_ULink:
        return "SS_ULink";
    case SttFunction::SS_Feed:
        return "SS_Feed";
    case SttFunction::SS_Frz:
        return "SS_Frz";
    case SttFunction::SS_SPT:
        return "SS_SPT";
    case SttFunction::SS_SQD:
        return "SS_SQD";
    case SttFunction::SS_DCmd:
        return "SS_DCmd";
    case SttFunction::SS_DevNm:
        return "SS_DevNm";
    case SttFunction::SS_FD:
        return "SS_FD";
    case SttFunction::SS_Ticks:
        return "SS_Ticks";
    case SttFunction::SS_Lock:
        return "SS_Lock";
    case SttFunction::SS_DStat:
        return "SS_DStat";
    case SttFunction::SS_Joy:
        return "SS_Joy";
    case SttFunction::SS_BlkRd:
        return "SS_BlkRd";
    case SttFunction::SS_BlkWr:
        return "SS_BlkWr";
    case SttFunction::SS_Reten:
        return "SS_Reten";
    case SttFunction::SS_WFM:
        return "SS_WFM";
    case SttFunction::SS_RFM:
        return "SS_RFM";
    case SttFunction::SS_ELog:
        return "SS_ELog";
    case SttFunction::SS_SSig:
        return "SS_SSig";
    case SttFunction::SS_Relea:
        return "SS_Relea";
    case SttFunction::SS_Attr:
        return "SS_Attr";
    case SttFunction::SS_Break:
        return "SS_Break";
    case SttFunction::SS_RsBit:
        return "SS_RsBit";
    case SttFunction::SS_RMS:
        return "SS_RMS";
    case SttFunction::SS_FDInf:
        return "SS_FDInf";
    case SttFunction::SS_ACRTC:
        return "SS_ACRTC";
    case SttFunction::SS_IFC:
        return "SS_IFC";
    case SttFunction::SS_OFC:
        return "SS_OFC";
    case SttFunction::SS_EnRTS:
        return "SS_EnRTS";
    case SttFunction::SS_DsRTS:
        return "SS_DsRTS";
    case SttFunction::SS_DCOn:
        return "SS_DCOn";
    case SttFunction::SS_DCOff:
        return "SS_DCOff";
    case SttFunction::SS_Skip:
        return "SS_Skip";
    case SttFunction::SS_Mode:
        return "SS_Mode";
    case SttFunction::SS_Open:
        return "SS_Open";
    case SttFunction::SS_Close:
        return "SS_Close";

    case SttFunction::SS_Path:
        return "SS_Path";
    case SttFunction::SS_Play:
        return "SS_Play";
    case SttFunction::SS_HEADER:
        return "SS_HEADER";
    case SttFunction::SS_Raw:
        return "SS_Raw";
    case SttFunction::SS_Seek:
        return "SS_Seek";
    case SttFunction::SS_Abort:
        return "SS_Abort";
    case SttFunction::SS_CDDA:
        return "SS_CDDA";
    case SttFunction::SS_Pause:
        return "SS_Pause";
    case SttFunction::SS_Eject:
        return "SS_Eject";
    case SttFunction::SS_Mount:
        return "SS_Mount";
    case SttFunction::SS_Stop:
        return "SS_Stop";
    case SttFunction::SS_Cont:
        return "SS_Cont";
    case SttFunction::SS_Disable:
        return "SS_Disable";
    case SttFunction::SS_Enable:
        return "SS_Enable";
    case SttFunction::SS_ReadToc:
        return "SS_ReadToc";
    case SttFunction::SS_SM:
        return "SS_SM";
    case SttFunction::SS_SD:
        return "SS_SD";
    case SttFunction::SS_SC:
        return "SS_SC";

    case SttFunction::SS_SEvent:
        return "SS_SEvent";
    case SttFunction::SS_Sound:
        return "SS_Sound";
    case SttFunction::SS_DSize:
        return "SS_DSize";
    case SttFunction::SS_Net:
        return "SS_Net";
    case SttFunction::SS_Rename:
        return "SS_Rename";
    case SttFunction::SS_Free:
        return "SS_Free";
    case SttFunction::SS_VarSect:
        return "SS_VarSect";

    case SttFunction::SS_UCM:
        return "SS_UCM";
    case SttFunction::SS_DM:
        return "SS_DM";
    case SttFunction::SS_GC:
        return "SS_GC";
    case SttFunction::SS_RG:
        return "SS_RG";
    case SttFunction::SS_DP:
        return "SS_DP";
    case SttFunction::SS_DR:
        return "SS_DR";
    case SttFunction::SS_DC:
        return "SS_DC";
    case SttFunction::SS_CO:
        return "SS_CO";
    case SttFunction::SS_VIQ:
        return "SS_VIQ";
    case SttFunction::SS_PT:
        return "SS_PT";
    case SttFunction::SS_SLink:
        return "SS_SLink";
    case SttFunction::SS_KB:
        return "SS_KB";
    case SttFunction::SS_SL:
        return "SS_SL";

    case SttFunction::SS_Bind:
        return "SS_Bind";
    case SttFunction::SS_Listen:
        return "SS_Listen";
    case SttFunction::SS_Connect:
        return "SS_Connect";
    case SttFunction::SS_Resv:
        return "SS_Resv";
    case SttFunction::SS_Accept:
        return "SS_Accept";
    case SttFunction::SS_Recv:
        return "SS_Recv";
    case SttFunction::SS_Send:
        return "SS_Send";
    case SttFunction::SS_GNam:
        return "SS_GNam";
    case SttFunction::SS_SOpt:
        return "SS_SOpt";
    case SttFunction::SS_GOpt:
        return "SS_GOpt";
    case SttFunction::SS_Shut:
        return "SS_Shut";
    case SttFunction::SS_SendTo:
        return "SS_SendTo";
    case SttFunction::SS_RecvFr:
        return "SS_RecvFr";
    case SttFunction::SS_Install:
        return "SS_Install";

    case SttFunction::SS_PCmd:
        return "SS_PCmd";

    case SttFunction::SS_SN:
        return "SS_SN";
    case SttFunction::SS_AR:
        return "SS_AR";
    case SttFunction::SS_MS:
        return "SS_MS";
    case SttFunction::SS_AC:
        return "SS_AC";
    case SttFunction::SS_CDFD:
        return "SS_CDFD";
    case SttFunction::SS_CCHAN:
        return "SS_CCHAN";
    case SttFunction::SS_FG:
        return "SS_FG";
    case SttFunction::SS_Sony:
        return "SS_Sony";

    case SttFunction::MV_Abort:
        return "MV_Abort";
    case SttFunction::MV_BColor:
        return "MV_BColor";
    case SttFunction::MV_ChSpeed:
        return "MV_ChSpeed";
    case SttFunction::MV_Conceal:
        return "MV_Conceal";
    case SttFunction::MV_Continue:
        return "MV_Continue";
    case SttFunction::MV_Freeze:
        return "MV_Freeze";
    case SttFunction::MV_Hide:
        return "MV_Hide";
    case SttFunction::MV_ImgSize:
        return "MV_ImgSize";
    case SttFunction::MV_Loop:
        return "MV_Loop";
    case SttFunction::MV_Next:
        return "MV_Next";
    case SttFunction::MV_Off:
        return "MV_Off";
    case SttFunction::MV_Org:
        return "MV_Org";
    case SttFunction::MV_Pause:
        return "MV_Pause";
    case SttFunction::MV_Play:
        return "MV_Play";
    case SttFunction::MV_Pos:
        return "MV_Pos";
    case SttFunction::MV_Release:
        return "MV_Release";
    case SttFunction::MV_SelStrm:
        return "MV_SelStrm";
    case SttFunction::MV_Show:
        return "MV_Show";
    case SttFunction::MV_Trigger:
        return "MV_Trigger";
    case SttFunction::MV_Window:
        return "MV_Window";
    case SttFunction::MV_ReqSync:
        return "MV_ReqSync";

    case SttFunction::MA_Abort:
        return "MA_Abort";
    case SttFunction::MA_Close:
        return "MA_Close";
    case SttFunction::MA_Cntrl:
        return "MA_Cntrl";
    case SttFunction::MA_Continue:
        return "MA_Continue";
    case SttFunction::MA_Loop:
        return "MA_Loop";
    case SttFunction::MA_Pause:
        return "MA_Pause";
    case SttFunction::MA_Play:
        return "MA_Play";
    case SttFunction::MA_Release:
        return "MA_Release";
    case SttFunction::MA_Trigger:
        return "MA_Trigger";
    case SttFunction::MA_SLink:
        return "MA_SLink";
    case SttFunction::MA_Jump:
        return "MA_Jump";

    case SttFunction::MV_Create:
        return "MV_Create";
    case SttFunction::MV_Info:
        return "MV_Info";
    case SttFunction::MV_Status:
        return "MV_Status";

    case SttFunction::MA_Create:
        return "MA_Create";

    default:
        return "Unknown system call ";
    }
}

const char *ss_dc_FunctionToString(const uint16_t d2) {
#define NUM(a) (sizeof(a) / sizeof(*a))

    static const char *names[] = {
        "DC_CrFCT",    "DC_RdFCT", "DC_WrFCT", "DC_RdFI",   "DC_WrFI",    "DC_DlFCT",   "DC_CrLCT",    "DC_RdLCT",
        "DC_WrLCT",    "DC_RdLI",  "DC_WrLI",  "DC_DlLCT",  "DC_FLnk",    "DC_LLnk",    "DC_Exec",     "DC_Intl",
        "DC_NOP",      "DC_SSig",  "DC_Relea", "DC_SetCmp", "DC_DsplSiz", "DC_GetClut", "DC_GetCluts", "DC_SetClut",
        "DC_SetCluts", "DC_MapDM", "DC_Off",   "DC_PRdLCT", "DC_PWrLCT",
    };

    return d2 < NUM(names) ? names[d2] : "---";
}
