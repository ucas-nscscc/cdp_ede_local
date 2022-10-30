`ifndef MYCPU_H
    `define MYCPU_H

    `define BR_BUS_WD       33
    `define PFS_TO_FS_BUS_WD 70
    `define FS_TO_DS_BUS_WD 68
    `define DS_TO_ES_BUS_WD 200
    `define ES_TO_MS_BUS_WD 215
    `define MS_TO_WS_BUS_WD 173
    `define WS_TO_RF_BUS_WD 38
    `define ES_TO_MMU_BUS_WD 105
    `define WS_TO_MMU_BUS_WD 3
    `define PFS_TO_MMU_BUS_WD 32

    `define WS_TO_IH_BUS_WD 164
    `define IH_TO_FS_BUS_WD 33
    `define IH_TO_DS_BUS_WD 2
    `define IH_TO_ES_BUS_WD 1
    `define IH_TO_MS_BUS_WD 1
    `define IH_TO_WS_BUS_WD 32
    `define IH_TO_MMU_BUS_WD 132

    `define CSR_CRMD     14'h0000
    `define CSR_CRMD_PLV 1:0
    `define CSR_CRMD_PIE 2
    `define CSR_CRMD_DA  3
    `define CSR_CRMD_PG  4

    `define CSR_PRMD      14'h0001
    `define CSR_PRMD_PPLV 1:0
    `define CSR_PRMD_PIE  2

    `define CSR_ECFG     14'h0004
    `define CSR_ECFG_LIE 12:0

    `define CSR_ESTAT      14'h0005
    `define CSR_ESTAT_IS10 1:0

    `define CSR_ERA    14'h0006
    `define CSR_ERA_PC 31:0   

    `define CSR_BADV 14'h0007

    `define CSR_EENTRY    14'h000c
    `define CSR_EENTRY_VA 31:6

    `define CSR_TLBIDX 14'h0010
    `define CSR_TLBIDX_INDEX 3:0
    `define CSR_TLBIDX_PS 29:24
    `define CSR_TLBIDX_NE 31

    `define CSR_TLBEHI 14'h0011
    `define CSR_TLBEHI_VPPN 31:13

    `define CSR_TLBELO0 14'h0012
    `define CSR_TLBELO0_V 0
    `define CSR_TLBELO0_D 1
    `define CSR_TLBELO0_PLV 3:2
    `define CSR_TLBELO0_MAT 5:4
    `define CSR_TLBELO0_G 6
    `define CSR_TLBELO0_PPN 31:8

    `define CSR_TLBELO1 14'h0013
    `define CSR_TLBELO1_V 0
    `define CSR_TLBELO1_D 1
    `define CSR_TLBELO1_PLV 3:2
    `define CSR_TLBELO1_MAT 5:4
    `define CSR_TLBELO1_G 6
    `define CSR_TLBELO1_PPN 31:8

    `define CSR_ASID 14'h0018
    `define CSR_ASID_ASID 9:0
    `define CSR_ASID_ASIDBIS 23:16

    `define CSR_SAVE0     14'h0030
    `define CSR_SAVE1     14'h0031
    `define CSR_SAVE2     14'h0032
    `define CSR_SAVE3     14'h0033
    `define CSR_SAVE_DATA 31:0

    `define CSR_TID     14'h0040
    `define CSR_TID_TID 31:0

    `define CSR_TCFG        14'h0041
    `define CSR_TCFG_EN     0
    `define CSR_TCFG_PERIOD 1
    `define CSR_TCFG_INITV  31:2

    `define CSR_TVAL 14'h0042

    `define CSR_TICLR     14'h0044
    `define CSR_TICLR_CLR 0

    `define CSR_TLBRENTRY 14'h0088
    `define CSR_TLBRENTRY_PA 31:6

    `define CSR_DMW0 14'h0180
    `define CSR_DMW0_PLV0 0
    `define CSR_DMW0_PLV3 3
    `define CSR_DMW0_MAT 5:4
    `define CSR_DMW0_PSEG 27:25
    `define CSR_DMW0_VSEG 31:29

    `define CSR_DMW1 14'h0181
    `define CSR_DMW1_PLV0 0
    `define CSR_DMW1_PLV3 3
    `define CSR_DMW1_MAT 5:4
    `define CSR_DMW1_PSEG 27:25
    `define CSR_DMW1_VSEG 31:29

    `define ECODE_ADE 6'h08
    `define ECODE_ALE 6'h09
    `define ECODE_PIL 6'h01
    `define ECODE_PIS 6'h02
    `define ECODE_PIF 6'h03
    `define ECODE_PME 6'h04
    `define ECODE_PPI 6'h07
    `define ECODE_TLBR 6'h3f


    `define ESUBCODE_ADEF 9'h000
    
    `define ES_FORWARD_BUS  39
    // `define ES_FORWARD_BUS  5
    `define MS_FORWARD_BUS  39
    `define WS_FORWARD_BUS  37
    `define MS_TO_ES_BUS_WD  3
    `define WS_TO_ES_BUS_WD  2

    `define MMU_TO_IH_BUS_WD 108
    `define MMU_TO_PFS_BUS_WD 4
    `define MMU_TO_ES_BUS_WD 6
`endif
