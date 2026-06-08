# Philips Validation Disc (Europe)

## Test Alarms

`Delete Non-existing alarm` is finished with `A$Delete returned bad error: 225!!`
That is not what happens on real hardware.

    225 = 0xE1 = E_PARAM


cdiemu

    alm_delete(100); errno : 225 E_PARAM
    alm_delete(101); errno : 103 E_ADRERR
    alm_delete(101); errno : 103 E_ADRERR
    alm_delete(102); errno : 225 E_PARAM
    alm_delete(1000002); errno : 102 E_BUSERR

210/05

    alm_delete(100); errno : 225 E_PARAM
    alm_delete(101); errno : 103 E_ADRERR
    alm_delete(101); errno : 103 E_ADRERR
    alm_delete(102); errno : 225 E_PARAM
    alm_delete(1000002); errno : 102 E_BUSERR

MiSTer

    alm_delete(100); errno : 225 E_PARAM
    alm_delete(101); errno : 225 E_PARAM
    alm_delete(101); errno : 225 E_PARAM
    alm_delete(102); errno : 225 E_PARAM
    alm_delete(1000002); errno : 102 E_BUSERR
