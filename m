Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE9594CBD66
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233087AbiCCMOj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbiCCMOi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:14:38 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2D5AAB0D20;
        Thu,  3 Mar 2022 04:13:51 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,151,1643641200"; 
   d="scan'208";a="112218599"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Mar 2022 21:13:51 +0900
Received: from localhost.localdomain (unknown [10.226.93.138])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1C67242F4DB2;
        Thu,  3 Mar 2022 21:13:48 +0900 (JST)
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
Subject: [PATCH 0/7] Add Renesas RZ/G2UL Type-1 {SoC,SMARC EVK} support
Date:   Thu,  3 Mar 2022 12:13:39 +0000
Message-Id: <20220303121346.4769-1-biju.das.jz@bp.renesas.com>
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
RZ/G2UL SoC has single Core 1.0GHz CA-55 with Type-1 and
Type-2 SoC's

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
soc_id: r9a07g043u
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
 11:        397     GICv3  27 Level     arch_timer
 13:          0     GICv3 412 Level     1004b800.serial:rx err
 14:         11     GICv3 414 Level     1004b800.serial:rx full
 15:        333     GICv3 415 Level     1004b800.serial:tx empty
 16:          0     GICv3 413 Level     1004b800.serial:break
 17:         28     GICv3 416 Level     1004b800.serial:rx ready
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
IPI5:         0       IRQ work interrupts
IPI6:         0       CPU wake-up interrupts
Err:          0

/ # cat /proc/meminfo
MemTotal:         872180 kB
MemFree:          848960 kB
MemAvailable:     816180 kB
Buffers:               0 kB
Cached:             3948 kB
SwapCached:            0 kB
Active:                4 kB
Inactive:             76 kB
Active(anon):          4 kB
Inactive(anon):       76 kB
Active(file):          0 kB
Inactive(file):        0 kB
Unevictable:        3948 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:           116 kB
Mapped:             1292 kB
Shmem:                 0 kB
KReclaimable:       2024 kB
Slab:               6868 kB
SReclaimable:       2024 kB
SUnreclaim:         4844 kB
KernelStack:         908 kB
PageTables:           64 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      436088 kB
Committed_AS:        592 kB
VmallocTotal:   133143592960 kB
VmallocUsed:        1136 kB
VmallocChunk:          0 kB
Percpu:               92 kB
HardwareCorrupted:     0 kB
AnonHugePages:         0 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
CmaTotal:          32768 kB
CmaFree:           32384 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB

/ # mount -t debugfs none /sys/kernel/debug/
/ #  cat /sys/kernel/debug/clk/clk_summary
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


Cheers,
Biju

Biju Das (7):
  dt-bindings: power: renesas,rzg2l-sysc: Document RZ/G2UL SoC
  soc: renesas: Identify RZ/G2UL SoC
  dt-bindings: clock: Add R9A07G043U CPG Clock and Reset Definitions
  dt-bindings: clock: renesas: Document RZ/G2UL SoC
  clk: renesas: Add support for RZ/G2UL SoC
  arm64: dts: renesas: Add initial DTSI for RZ/G2UL SoC
  arm64: dts: renesas: Add initial device tree for RZ/G2UL Type-1 SMARC
    EVK

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |   9 +-
 .../bindings/power/renesas,rzg2l-sysc.yaml    |  11 +-
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   | 413 ++++++++++++++++++
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 111 +++++
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    |  25 ++
 drivers/clk/renesas/Kconfig                   |   7 +-
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a07g043-cpg.c           | 157 +++++++
 drivers/clk/renesas/rzg2l-cpg.c               |   6 +
 drivers/clk/renesas/rzg2l-cpg.h               |   1 +
 drivers/soc/renesas/Kconfig                   |   6 +
 drivers/soc/renesas/renesas-soc.c             |  13 +
 include/dt-bindings/clock/r9a07g043u-cpg.h    | 186 ++++++++
 14 files changed, 938 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
 create mode 100644 drivers/clk/renesas/r9a07g043-cpg.c
 create mode 100644 include/dt-bindings/clock/r9a07g043u-cpg.h

-- 
2.17.1

