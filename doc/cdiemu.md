# CD-i Emulator Debugger Manual

The official manual is not very detailed when it comes to the debugger

    ?                              - Displays command help
    .[DEV.][REG] [VALUE]           - Displays/changes register(s)
    @[NUM]                         - Displays/changes default relocation
    d[f][FMT][CNT] [ADDR] [LEN]    - Dumps memory
    eb [BUSCMD]                    - Displays/changes emulator bus
    ed                             - Displays OS-9 device table
    em[r] [PATTERN]                - Displays emulator modules
    et [LEVEL] [DEVICE|MODULE|?]   - Toggles emulator trace level
    ef [FILE]                      - Redirects emulator trace to file
    ew[rwspk] [ADDR|*]             - Adds/kills emulator watch address
    er[g]                          - Resets emulator
    ep                             - Displays emulator ports
    g[s][e] [ADDR] [:CLOCKS]       - Resumes emulation
    l MODULE                       - Links to module
    a MODULE...                    - Attaches symbol modules
    s [MODULE:][SYMBOL]            - Displays symbols
    q[m][o]                        - Quits emulator
    t[N][n]                        - Traces instruction(s)
    r FILE                         - Runs commands from file
    v EXPR                         - Displays expression value
    i[t][h] [TABLE]                - Displays processor clocks

