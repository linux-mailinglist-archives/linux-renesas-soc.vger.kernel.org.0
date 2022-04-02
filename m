Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3AC4EFF62
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 09:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241503AbiDBHci (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 03:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240859AbiDBHch (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 03:32:37 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 903CF173B2B;
        Sat,  2 Apr 2022 00:30:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,229,1643641200"; 
   d="scan'208";a="116497342"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Apr 2022 16:30:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8713C4001944;
        Sat,  2 Apr 2022 16:30:40 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/5] Add Renesas RZ/G2UL Type-1 {SoC,SMARC EVK} support
Date:   Sat,  2 Apr 2022 08:30:32 +0100
Message-Id: <20220402073037.23947-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

RZ/G2UL Family SoC consists of Type-1 and Type-2 SoC's.
Both these SoC's has single Core 1.0GHz CA-55 with similar
peripheral IP's to that of RZ/G2LC and RZ/G2L.

The difference between Type1 and Type2 SoC's are as follows
Function	Type1			Type2
SCIF		5ch {0,1,2,3,4}		4ch {0,1,2,3}
Ethernet	2ch {0,1}		1ch {0}
SSI		4ch {0,1,2,3}		3ch {0,1,2}
ADC		2ch {0,1}		N/A
DU		1ch Parallel I/F	N/A

RZ/G2UL Type-2 is pin compatible with RZ/G2LC, so the number of channels
for each IP matches with RZ/G2LC.
The table below shows the functional differences between RZ/G2LC and 
RZ/G2UL Type-2.
Function	RZ/G2LC			RZ/G2UL Type-2
Cortex-A55	Dual 1.2GHz		Single 1.0GHz
DU		1ch MIPI-DSI		N/A
GPT		6ch {0,3,4,5,6,7}	N/A
Mali-31		1ch			N/A

This patch series aims to add support for Renesas RZ/G2UL Type-1 SoC and
basic support for Renesas RZ/G2UL SMARC EVK (based on R9A07G043U11)
- memory
- External input clock
- SCIF
- GbEthernet

It shares the same carrier board with RZ/G2L, but the pin mapping is
different. Place holders are added in device nodes to avoid compilation
errors for the devices which have not been enabled yet on RZ/G2UL SoC.

Also disable the device nodes which is not tested and delete the
corresponding pinctrl definitions.

Test logs:-

/ # for i in machine family soc_id revision; do echo -n "$i: "; cat /sys/devices/soc0/$i;done
machine: Renesas SMARC EVK based on r9a07g043u11
family: RZ/G2UL
soc_id: r9a07g043
revision: 0

/ # cat /proc/cpuinfo
processor       : 0
BogoMIPS        : 48.00
Features        : fp asimd evtstrm crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x2
CPU part        : 0xd05
CPU revision    : 0

/ # cat /proc/interrupts
           CPU0
 11:       1439     GICv3  27 Level     arch_timer
 13:          0     GICv3 412 Level     1004b800.serial:rx err
 14:         15     GICv3 414 Level     1004b800.serial:rx full
 15:        351     GICv3 415 Level     1004b800.serial:tx empty
 16:          0     GICv3 413 Level     1004b800.serial:break
 17:          5     GICv3 416 Level     1004b800.serial:rx ready
 18:          0     GICv3 173 Edge      error
 19:          0     GICv3 157 Edge      11820000.dma-controller:0
 20:          0     GICv3 158 Edge      11820000.dma-controller:1
 21:          0     GICv3 159 Edge      11820000.dma-controller:2
 22:          0     GICv3 160 Edge      11820000.dma-controller:3
 23:          0     GICv3 161 Edge      11820000.dma-controller:4
 24:          0     GICv3 162 Edge      11820000.dma-controller:5
 25:          0     GICv3 163 Edge      11820000.dma-controller:6
 26:          0     GICv3 164 Edge      11820000.dma-controller:7
 27:          0     GICv3 165 Edge      11820000.dma-controller:8
 28:          0     GICv3 166 Edge      11820000.dma-controller:9
 29:          0     GICv3 167 Edge      11820000.dma-controller:10
 30:          0     GICv3 168 Edge      11820000.dma-controller:11
 31:          0     GICv3 169 Edge      11820000.dma-controller:12
 32:          0     GICv3 170 Edge      11820000.dma-controller:13
 33:          0     GICv3 171 Edge      11820000.dma-controller:14
 34:          0     GICv3 172 Edge      11820000.dma-controller:15
IPI0:         0       Rescheduling interrupts
IPI1:         0       Function call interrupts
IPI2:         0       CPU stop interrupts
IPI3:         0       CPU stop (for crash dump) interrupts
IPI4:         0       Timer broadcast interrupts
IPI5:         1       IRQ work interrupts
IPI6:         0       CPU wake-up interrupts
Err:          0

/ # cat /proc/meminfo
MemTotal:         868744 kB
MemFree:          820840 kB
MemAvailable:     797676 kB
Buffers:               0 kB
Cached:             3948 kB
SwapCached:            0 kB
Active:                4 kB
Inactive:             72 kB
Active(anon):          4 kB
Inactive(anon):       72 kB
Active(file):          0 kB
Inactive(file):        0 kB
Unevictable:        3948 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:           112 kB
Mapped:             1300 kB
Shmem:                 0 kB
KReclaimable:      21256 kB
Slab:              30352 kB
SReclaimable:      21256 kB
SUnreclaim:         9096 kB
KernelStack:         908 kB
PageTables:           64 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      434372 kB
Committed_AS:        592 kB
VmallocTotal:   133143592960 kB
VmallocUsed:        1188 kB
VmallocChunk:          0 kB
Percpu:              120 kB
AnonHugePages:         0 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
CmaTotal:         131072 kB
CmaFree:          130688 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
/ # mount -t debugfs none /sys/kernel/debug/
/ # cat /sys/kernel/debug/clk/clk_summary
                                 enable  prepare  protect                                duty  hardware
   clock                          count    count    count        rate   accuracy phase  cycle    enable
-------------------------------------------------------------------------------------------------------
 audio_mclock                         0        0        0    11289600          0     0  50000         Y
 extal                                2        2        0    24000000          0     0  50000         Y
    .pll6                             0        0        0   500000000          0     0  50000         Y
    .pll5                             0        0        0  3000000000          0     0  50000         Y
    .pll3                             1        1        0  1600000000          0     0  50000         Y
       .pll3_div2                     1        1        0   800000000          0     0  50000         Y
          .pll3_div2_4                1        1        0   200000000          0     0  50000         Y
             P1                       4        4        0   200000000          0     0  50000         Y
                dmac_aclk             2        2        0   200000000          0     0  50000         Y
                ia55_clk              1        1        0   200000000          0     0  50000         Y
                gic                   1        1        0   200000000          0     0  50000         Y
                P1_DIV2               1        1        0   100000000          0     0  50000         Y
                   dmac_pclk          1        1        0   100000000          0     0  50000         Y
             .pll3_div2_4_2           0        0        0   100000000          0     0  50000         Y
                P2                    0        0        0   100000000          0     0  50000         Y
                   ia55_pclk          0        0        0   100000000          0     0  50000         N
    .pll2                             1        1        0  1600000000          0     0  50000         Y
       .pll2_div2                     1        1        0   800000000          0     0  50000         Y
          .pll2_div2_8                1        1        0   100000000          0     0  50000         Y
             P0                       1        1        0   100000000          0     0  50000         Y
                sci1                  0        0        0   100000000          0     0  50000         N
                sci0                  0        0        0   100000000          0     0  50000         N
                scif4                 0        0        0   100000000          0     0  50000         N
                scif3                 0        0        0   100000000          0     0  50000         N
                scif2                 0        0        0   100000000          0     0  50000         N
                scif1                 0        0        0   100000000          0     0  50000         N
                scif0                 2        2        0   100000000          0     0  50000         Y
    .pll1                             0        0        0  1000000000          0     0  50000         Y
       I                              0        0        0  1000000000          0     0  50000         Y
    .osc_div1000                      0        0        0       24000          0     0  50000         Y
    .osc                              0        0        0    24000000          0     0  50000         Y
 can                                  0        0        0           0          0     0  50000         Y
 audio_clk2                           0        0        0    12288000          0     0  50000         Y
 audio_clk1                           0        0        0    11289600          0     0  50000         Y
/ #

v3->v4:
 * Documented RZ/G2UL SMARC EVK
 * Removed LAST_COMMON macro from clock and reset indices.
 * Added comment for RZ/G2UL specific clocks
 * Listed all clocks and reset in the same order as RZ/G2L.
 * Added Rb tag from Geert
 * Updated num_hw_mod_clks and num_resets.
v2->v3:
 * Changed the compatible from r9a07g043u-sysc->r9a07g043-sysc
 * Changed the compatible from r9a07g043u-cpg->r9a07g043-cpg
 * Retained Rb tag from Rob as it is trivial change.
 * Changed the config from ARCH_R9A07G043U->ARCH_R9A07G043
 * renamed the file r9a07g043u-cpg.h->r9a07g043-cpg.h
 * Prepared Common Module Clock/Reset indices for RZ/G2UL and RZ/Five
 * Prepared RZ/G2UL specific Module Clock/Reset indices.

Biju Das (5):
  dt-bindings: arm: renesas: Document Renesas RZ/G2UL SMARC EVK
  dt-bindings: clock: Add R9A07G043 CPG Clock and Reset Definitions
  clk: renesas: Add support for RZ/G2UL SoC
  arm64: dts: renesas: Add initial DTSI for RZ/G2UL SoC
  arm64: dts: renesas: Add initial device tree for RZ/G2UL Type-1 SMARC
    EVK

 .../devicetree/bindings/arm/renesas.yaml      |   2 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    | 413 ++++++++++++++++++
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 111 +++++
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    |  25 ++
 drivers/clk/renesas/Kconfig                   |   7 +-
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a07g043-cpg.c           | 157 +++++++
 drivers/clk/renesas/rzg2l-cpg.c               |   6 +
 drivers/clk/renesas/rzg2l-cpg.h               |   1 +
 include/dt-bindings/clock/r9a07g043-cpg.h     | 184 ++++++++
 11 files changed, 908 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
 create mode 100644 drivers/clk/renesas/r9a07g043-cpg.c
 create mode 100644 include/dt-bindings/clock/r9a07g043-cpg.h

-- 
2.17.1

