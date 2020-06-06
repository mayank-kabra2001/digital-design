#! /usr/bin/vvp
:ivl_version "10.1 (stable)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "system";
:vpi_module "vhdl_sys";
:vpi_module "v2005_math";
:vpi_module "va_math";
S_0x561f7fd95890 .scope module, "controller" "controller" 2 1;
 .timescale 0 0;
    .port_info 0 /OUTPUT 1 "ldA"
    .port_info 1 /OUTPUT 1 "clrA"
    .port_info 2 /OUTPUT 1 "sftA"
    .port_info 3 /OUTPUT 1 "ldQ"
    .port_info 4 /OUTPUT 1 "clrQ"
    .port_info 5 /INPUT 1 "eqz"
    .port_info 6 /OUTPUT 1 "sftQ"
    .port_info 7 /OUTPUT 1 "ldM"
    .port_info 8 /OUTPUT 1 "clrff"
    .port_info 9 /OUTPUT 1 "addsub"
    .port_info 10 /OUTPUT 1 "decr"
    .port_info 11 /OUTPUT 1 "ldcnt"
    .port_info 12 /OUTPUT 1 "done"
    .port_info 13 /INPUT 1 "clk"
    .port_info 14 /INPUT 1 "q0"
    .port_info 15 /INPUT 1 "qm1"
    .port_info 16 /INPUT 1 "start"
P_0x561f7fd95a10 .param/l "S0" 0 2 5, C4<000>;
P_0x561f7fd95a50 .param/l "S1" 0 2 5, C4<001>;
P_0x561f7fd95a90 .param/l "S2" 0 2 5, C4<010>;
P_0x561f7fd95ad0 .param/l "S3" 0 2 5, C4<011>;
P_0x561f7fd95b10 .param/l "S4" 0 2 5, C4<100>;
P_0x561f7fd95b50 .param/l "S5" 0 2 5, C4<101>;
P_0x561f7fd95b90 .param/l "S6" 0 2 5, C4<110>;
v0x561f7fd95fb0_0 .var "addsub", 0 0;
o0x7ff3ee84a048 .functor BUFZ 1, C4<z>; HiZ drive
v0x561f7fdb5dd0_0 .net "clk", 0 0, o0x7ff3ee84a048;  0 drivers
v0x561f7fdb5e90_0 .var "clrA", 0 0;
v0x561f7fdb5f30_0 .var "clrQ", 0 0;
v0x561f7fdb5ff0_0 .var "clrff", 0 0;
v0x561f7fdb6100_0 .var "decr", 0 0;
v0x561f7fdb61c0_0 .var "done", 0 0;
o0x7ff3ee84a168 .functor BUFZ 1, C4<z>; HiZ drive
v0x561f7fdb6280_0 .net "eqz", 0 0, o0x7ff3ee84a168;  0 drivers
v0x561f7fdb6340_0 .var "ldA", 0 0;
v0x561f7fdb6400_0 .var "ldM", 0 0;
v0x561f7fdb64c0_0 .var "ldQ", 0 0;
v0x561f7fdb6580_0 .var "ldcnt", 0 0;
o0x7ff3ee84a258 .functor BUFZ 1, C4<z>; HiZ drive
v0x561f7fdb6640_0 .net "q0", 0 0, o0x7ff3ee84a258;  0 drivers
o0x7ff3ee84a288 .functor BUFZ 1, C4<z>; HiZ drive
v0x561f7fdb6700_0 .net "qm1", 0 0, o0x7ff3ee84a288;  0 drivers
v0x561f7fdb67c0_0 .var "sftA", 0 0;
v0x561f7fdb6880_0 .var "sftQ", 0 0;
o0x7ff3ee84a318 .functor BUFZ 1, C4<z>; HiZ drive
v0x561f7fdb6940_0 .net "start", 0 0, o0x7ff3ee84a318;  0 drivers
v0x561f7fdb6a00_0 .var "state", 2 0;
E_0x561f7fd83ca0 .event edge, v0x561f7fdb6a00_0;
E_0x561f7fd83fd0 .event posedge, v0x561f7fdb5dd0_0;
    .scope S_0x561f7fd95890;
T_0 ;
    %wait E_0x561f7fd83fd0;
    %load/vec4 v0x561f7fdb6a00_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 3;
    %cmp/u;
    %jmp/1 T_0.0, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 3;
    %cmp/u;
    %jmp/1 T_0.1, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 3;
    %cmp/u;
    %jmp/1 T_0.2, 6;
    %dup/vec4;
    %pushi/vec4 3, 0, 3;
    %cmp/u;
    %jmp/1 T_0.3, 6;
    %dup/vec4;
    %pushi/vec4 4, 0, 3;
    %cmp/u;
    %jmp/1 T_0.4, 6;
    %dup/vec4;
    %pushi/vec4 5, 0, 3;
    %cmp/u;
    %jmp/1 T_0.5, 6;
    %dup/vec4;
    %pushi/vec4 6, 0, 3;
    %cmp/u;
    %jmp/1 T_0.6, 6;
    %pushi/vec4 0, 0, 3;
    %assign/vec4 v0x561f7fdb6a00_0, 0;
    %jmp T_0.8;
T_0.0 ;
    %load/vec4 v0x561f7fdb6940_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_0.9, 8;
    %pushi/vec4 1, 0, 3;
    %assign/vec4 v0x561f7fdb6a00_0, 0;
T_0.9 ;
    %jmp T_0.8;
T_0.1 ;
    %pushi/vec4 2, 0, 3;
    %assign/vec4 v0x561f7fdb6a00_0, 0;
    %jmp T_0.8;
T_0.2 ;
    %delay 2, 0;
    %load/vec4 v0x561f7fdb6640_0;
    %load/vec4 v0x561f7fdb6700_0;
    %concat/vec4; draw_concat_vec4
    %cmpi/e 1, 0, 2;
    %jmp/0xz  T_0.11, 4;
    %pushi/vec4 3, 0, 3;
    %assign/vec4 v0x561f7fdb6a00_0, 0;
    %jmp T_0.12;
T_0.11 ;
    %load/vec4 v0x561f7fdb6640_0;
    %load/vec4 v0x561f7fdb6700_0;
    %concat/vec4; draw_concat_vec4
    %cmpi/e 2, 0, 2;
    %jmp/0xz  T_0.13, 4;
    %pushi/vec4 4, 0, 3;
    %assign/vec4 v0x561f7fdb6a00_0, 0;
    %jmp T_0.14;
T_0.13 ;
    %pushi/vec4 5, 0, 3;
    %assign/vec4 v0x561f7fdb6a00_0, 0;
T_0.14 ;
T_0.12 ;
    %jmp T_0.8;
T_0.3 ;
    %pushi/vec4 5, 0, 3;
    %assign/vec4 v0x561f7fdb6a00_0, 0;
    %jmp T_0.8;
T_0.4 ;
    %pushi/vec4 5, 0, 3;
    %assign/vec4 v0x561f7fdb6a00_0, 0;
    %jmp T_0.8;
T_0.5 ;
    %delay 2, 0;
    %load/vec4 v0x561f7fdb6640_0;
    %load/vec4 v0x561f7fdb6700_0;
    %concat/vec4; draw_concat_vec4
    %pushi/vec4 1, 0, 2;
    %cmp/e;
    %flag_get/vec4 4;
    %load/vec4 v0x561f7fdb6280_0;
    %nor/r;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_0.15, 8;
    %pushi/vec4 3, 0, 3;
    %assign/vec4 v0x561f7fdb6a00_0, 0;
    %jmp T_0.16;
T_0.15 ;
    %load/vec4 v0x561f7fdb6640_0;
    %load/vec4 v0x561f7fdb6700_0;
    %concat/vec4; draw_concat_vec4
    %pushi/vec4 2, 0, 2;
    %cmp/e;
    %flag_get/vec4 4;
    %load/vec4 v0x561f7fdb6280_0;
    %nor/r;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_0.17, 8;
    %pushi/vec4 4, 0, 3;
    %assign/vec4 v0x561f7fdb6a00_0, 0;
    %jmp T_0.18;
T_0.17 ;
    %load/vec4 v0x561f7fdb6280_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_0.19, 8;
    %pushi/vec4 6, 0, 3;
    %assign/vec4 v0x561f7fdb6a00_0, 0;
T_0.19 ;
T_0.18 ;
T_0.16 ;
    %jmp T_0.8;
T_0.6 ;
    %pushi/vec4 6, 0, 3;
    %assign/vec4 v0x561f7fdb6a00_0, 0;
    %jmp T_0.8;
T_0.8 ;
    %pop/vec4 1;
    %jmp T_0;
    .thread T_0;
    .scope S_0x561f7fd95890;
T_1 ;
    %wait E_0x561f7fd83ca0;
    %load/vec4 v0x561f7fdb6a00_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 3;
    %cmp/u;
    %jmp/1 T_1.0, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 3;
    %cmp/u;
    %jmp/1 T_1.1, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 3;
    %cmp/u;
    %jmp/1 T_1.2, 6;
    %dup/vec4;
    %pushi/vec4 3, 0, 3;
    %cmp/u;
    %jmp/1 T_1.3, 6;
    %dup/vec4;
    %pushi/vec4 4, 0, 3;
    %cmp/u;
    %jmp/1 T_1.4, 6;
    %dup/vec4;
    %pushi/vec4 5, 0, 3;
    %cmp/u;
    %jmp/1 T_1.5, 6;
    %dup/vec4;
    %pushi/vec4 6, 0, 3;
    %cmp/u;
    %jmp/1 T_1.6, 6;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb5e90_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb67c0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb64c0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb6880_0, 0, 1;
    %jmp T_1.8;
T_1.0 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb5e90_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb6340_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb67c0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb5f30_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb64c0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb6880_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb6400_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb5ff0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb61c0_0, 0, 1;
    %jmp T_1.8;
T_1.1 ;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x561f7fdb5e90_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x561f7fdb5ff0_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x561f7fdb6580_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x561f7fdb6400_0, 0, 1;
    %jmp T_1.8;
T_1.2 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb5e90_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb6400_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb5ff0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb6580_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x561f7fdb64c0_0, 0, 1;
    %jmp T_1.8;
T_1.3 ;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x561f7fdb6340_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x561f7fd95fb0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb64c0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb67c0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb6880_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb6100_0, 0, 1;
    %jmp T_1.8;
T_1.4 ;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x561f7fdb6340_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fd95fb0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb64c0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb67c0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb6880_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb6100_0, 0, 1;
    %jmp T_1.8;
T_1.5 ;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x561f7fdb67c0_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb64c0_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x561f7fdb6880_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x561f7fdb6340_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x561f7fdb6100_0, 0, 1;
    %jmp T_1.8;
T_1.6 ;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x561f7fdb61c0_0, 0, 1;
    %jmp T_1.8;
T_1.8 ;
    %pop/vec4 1;
    %jmp T_1;
    .thread T_1, $push;
# The file index is used to find the file name in the following table.
:file_names 3;
    "N/A";
    "<interactive>";
    "multiply_controller.v";
