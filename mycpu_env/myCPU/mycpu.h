`ifndef MYCPU_H
    `define MYCPU_H

    //general bus wide
    `define BR_BUS_WD       33 
    `define FS_TO_DS_BUS_WD 70//65, add fs_tlb_ex
    `define DS_TO_ES_BUS_WD 199//194, ex_backward & ex-gather +5
    `define ES_TO_MS_BUS_WD 242//202, +5+3 +32
    `define MS_TO_WS_BUS_WD 202//194 //+8
    `define WS_TO_RF_BUS_WD 38

    //related bus wide
    `define ES_REL_BUS_WD   44
    `define MS_REL_BUS_WD   44
    `define WS_REL_BUS_WD   7
    `define TLB_INV_BUS_WD  12//72

    `define CSR_TLB_IN_BUS_WD 100
    `define CSR_TLB_OUT_BUS_WD 127
    
    `define TLB_TO_FS_BUS_WD  37
    `define FS_TO_TLB_BUS_WD 20
    `define CSR_TO_FS_BUS_WD 69
    `define TLB_TO_ES_BUS_WD 37
    `define ES_TO_TLB_BUS_WD 30
    `define CSR_TO_ES_BUS_WD 98
    //csr_reg number
    `define CSR_CRMD    0
    `define CSR_PRMD    1
    `define CSR_ECFG    4
    `define CSR_ESTAT   5
    `define CSR_ERA     6
    `define CSR_BADV    7
    `define CSR_EENTRY  12 //0xc
    `define CSR_SAVE0   48 //0x30
    `define CSR_SAVE1   49
    `define CSR_SAVE2   50
    `define CSR_SAVE3   51
    `define CSR_TID     64 //0x40
    `define CSR_TCFG    65
    `define CSR_TVAL    66
    `define CSR_TICLR   68 //0x44

    `define CSR_TLBIDX      16 //14'h10
    `define CSR_TLBEHI      17 //14'h11
    `define CSR_TLBELO0     18 //14'h12
    `define CSR_TLBELO1     19 //14'h13
    `define CSR_ASID        24 //14'h18
    `define CSR_TLBRENTRY   136//14'h88
    `define CSR_DMW0        384//14'h180
    `define CSR_DMW1        385//14'h181
    `define TLBSRCH         1//4'h1
    `define TLBRD           2//4'h2
    `define TLBWR           4//4'h04
    `define TLBFILL         8//4'h08
    `define INVTLB_0        16//4'h10
    `define INVTLB_1        17//4'h11
    `define INVTLB_2        18//4'h12
    `define INVTLB_3        19//4'h13
    `define INVTLB_4        20//4'h14
    `define INVTLB_5        21//4'h15
    `define INVTLB_6        22//4'h16

    //csr_crmd field
    `define CSR_CRMD_PLV 1:0
    `define CSR_CRMD_IE 2
    `define CSR_CRMD_DA 3
    `define CSR_CRMD_PG 4
    `define CSR_CRMD_DATF 6:5
    `define CSR_CRMD_DATM 8:7

    //csr_prmd field
    `define CSR_PRMD_PPLV 1:0
    `define CSR_PRMD_PIE 2

    //csr_ecfg field
    `define CSR_ECFG_LIE 12:0

    //csr_estat field
    `define CSR_ESTAT_IS10 1:0
    `define CSR_ESTAT_ECODE 21:16
    `define CSR_ESTAT_ESUBCODE 30:22

    //csr_era field
    `define CSR_ERA_PC 31:0

    //csr_bacv field
    `define CSR_BADV_VADDR 31:0

    //csr_eentry field
    `define CSR_EENTRY_VA 31:6

    //csr_save field
    `define CSR_SAVE_DATA 31:0

    //csr_tid field
    `define CSR_TID_TID 31:0

    //csr_tcfg field
    `define CSR_TCFG_EN 0
    `define CSR_TCFG_PERIOD 1
    `define CSR_TCFG_INITV 31:2

    //csr_ticlr field
    `define CSR_TICLR_CLR 0

    //csr ecode && esubcode
    `define CSR_ECODE_INT 0 //中断
    `define CSR_ECODE_PIL 1//load操作页无效
    `define CSR_ECODE_PIS 2//store操作页无效
    `define CSR_ECODE_PIF 3//取值操作页无效
    `define CSR_ECODE_PME 4//页修改
    `define CSR_ECODE_PPI 7//页特权等级不合规
    `define CSR_ECODE_ADE 8 //取值地址错例外&访存指令地址错例外
    `define CSR_ESUBCODE_ADEF 0 //取值地址错
    `define CSR_ESUBCODE_ADEM 1 //访存指令地址错例外
    `define CSR_ECODE_ALE 9  //地址非对齐例外
    `define CSR_ECODE_SYS 11 //系统调用例外
    `define CSR_ECODE_BRK 12 //断点例外
    `define CSR_ECODE_INE 13 //指令不存在例外
    `define CSR_ECODE_IPE 14//指令特权等级错
    `define CSR_ECODE_TLBR 63//TLB重填 例外 3f

    //tlb ex
    `define TLB_ADEF_EX 0
    `define TLB_ADEM_EX 1
    `define TLB_TLBR_EX 2
    `define TLB_PIF_EX 3
    `define TLB_PPI_EX 4
    //`define TLB_ALE 即es_ex_local
    `define TLB_PIL_EX 5
    `define TLB_PIS_EX 6
    `define TLB_PME_EX 7
`endif
