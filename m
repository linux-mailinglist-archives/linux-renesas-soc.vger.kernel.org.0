Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1D6489A75
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 14:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbiAJNrL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 08:47:11 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:7529 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233443AbiAJNrK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 08:47:10 -0500
X-IronPort-AV: E=Sophos;i="5.88,277,1635174000"; 
   d="scan'208";a="106558122"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jan 2022 22:47:09 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D26DA42E3549;
        Mon, 10 Jan 2022 22:47:07 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 00/12] Add new Renesas RZ/V2L SoC and Renesas RZ/V2L SMARC EVK support
Date:   Mon, 10 Jan 2022 13:46:47 +0000
Message-Id: <20220110134659.30424-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

RZ/V2L is equipped with a Cortex-A55 (1.2 GHz) CPU and built-in AI
accelerator "DRP-AI" for vision, which is Renesas' original technology.
It also has a 16-bit DDR3L/DDR4 interface and a built-in 3D graphics
engine with Arm Mali-G31 and video codec (H.264).

The RZ/V2L is also package- and pin-compatible with the RZ/G2L. This
allows RZ/G2L users to easily upgrade to the RZ/V2L for additional AI
functions without needing to modify the system configuration, keeping
migration costs low.

Initial patches enables minimal peripherals on Renesas RZ/V2L SMARC EVK
and booted via initramfs/nfs. Below blocks are enabled on Renesas RZ/V2L
SMARC EVK:
- memory
- External input clock
- CPG
- Pin controller
- SCIF
- GbEthernet
- Audio Clock

Links for SoC and EVK:
[*] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/
rz-arm-based-high-end-32-64-bit-mpus/rzv2l-general-purpose-microprocessor-
equipped-renesas-original-ai-dedicated-accelerator-drp-ai-12ghz-dual
[*] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/
rz-arm-based-high-end-32-64-bit-mpus/rtk9744l23s01000be-rzg2l-evaluation-board-kit

This patch series is dependent on [0] & [1]

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20211216114305.5842-1-biju.das.jz@bp.renesas.com/
[1] https://patchwork.kernel.org/project/linux-renesas-soc/
patch/20211220170357.7899-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Sorry for cross posting the patches to multiple subsystems, as these are
just the dt-binding patches included as part of initial bringup patches.

Changes for v2:
* Included ACK from Rob
* Fixed alignment issue
* Added place holder for GPU node
* Updated divider values for PLL2/3

Test Logs on Renesas RZ/V2L SMARC EVK:

/ # cat /proc/cpuinfo
processor       : 0
BogoMIPS        : 48.00
Features        : fp asimd evtstrm crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x2
CPU part        : 0xd05
CPU revision    : 0

processor       : 1
BogoMIPS        : 48.00
Features        : fp asimd evtstrm crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x2
CPU part        : 0xd05
CPU revision    : 0

/ # cat /proc/meminfo
MemTotal:        1897380 kB
MemFree:         1811032 kB
MemAvailable:    1788712 kB
Buffers:               0 kB
Cached:            38408 kB
SwapCached:            0 kB
Active:                4 kB
Inactive:             32 kB
Active(anon):          4 kB
Inactive(anon):       32 kB
Active(file):          0 kB
Inactive(file):        0 kB
Unevictable:       38404 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:            68 kB
Mapped:             1356 kB
Shmem:                 0 kB
KReclaimable:      22940 kB
Slab:              33192 kB
SReclaimable:      22940 kB
SUnreclaim:        10252 kB
KernelStack:        1088 kB
PageTables:           28 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      948688 kB
Committed_AS:        664 kB
VmallocTotal:   133143461888 kB
VmallocUsed:        1396 kB
VmallocChunk:          0 kB
Percpu:              240 kB
AnonHugePages:         0 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
CmaTotal:         131072 kB
CmaFree:          130304 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
/ #
/ #
/ #
/ # cat /proc/interrupts
           CPU0       CPU1
 11:        814        896     GICv3  27 Level     arch_timer
 13:          0          0     GICv3 412 Level     1004b800.serial:rx err
 14:          6          0     GICv3 414 Level     1004b800.serial:rx full
 15:        368          0     GICv3 415 Level     1004b800.serial:tx empty
 16:          0          0     GICv3 413 Level     1004b800.serial:break
 17:         11          0     GICv3 416 Level     1004b800.serial:rx ready
 23:          0          0     GICv3 173 Edge      error
 24:          0          0     GICv3 157 Edge      11820000.dma-controller:0
 25:          0          0     GICv3 158 Edge      11820000.dma-controller:1
 26:          0          0     GICv3 159 Edge      11820000.dma-controller:2
 27:          0          0     GICv3 160 Edge      11820000.dma-controller:3
 28:          0          0     GICv3 161 Edge      11820000.dma-controller:4
 29:          0          0     GICv3 162 Edge      11820000.dma-controller:5
 30:          0          0     GICv3 163 Edge      11820000.dma-controller:6
 31:          0          0     GICv3 164 Edge      11820000.dma-controller:7
 32:          0          0     GICv3 165 Edge      11820000.dma-controller:8
 33:          0          0     GICv3 166 Edge      11820000.dma-controller:9
 34:          0          0     GICv3 167 Edge      11820000.dma-controller:10
 35:          0          0     GICv3 168 Edge      11820000.dma-controller:11
 36:          0          0     GICv3 169 Edge      11820000.dma-controller:12
 37:          0          0     GICv3 170 Edge      11820000.dma-controller:13
 38:          0          0     GICv3 171 Edge      11820000.dma-controller:14
 39:          0          0     GICv3 172 Edge      11820000.dma-controller:15
IPI0:       251        253       Rescheduling interrupts
IPI1:        36         33       Function call interrupts
IPI2:         0          0       CPU stop interrupts
IPI3:         0          0       CPU stop (for crash dump) interrupts
IPI4:         0          0       Timer broadcast interrupts
IPI5:         0          0       IRQ work interrupts
IPI6:         0          0       CPU wake-up interrupts
Err:          0
/ #
/ #
/ #
/ # for i in machine family soc_id revision; do echo -n "$i: ";cat /sys/devices/
soc0/$i; done
machine: Renesas SMARC EVK based on r9a07g054l2
family: RZ/V2L
soc_id: r9a07g054
revision: Rev 0
/ #
/ #
/ #

Cheers,
Prabhakar

Biju Das (12):
  dt-bindings: power: renesas,rzg2l-sysc: Document RZ/V2L SoC
  soc: renesas: Identify RZ/V2L SoC
  dt-bindings: clock: Add R9A07G054 CPG Clock and Reset Definitions
  dt-bindings: clock: renesas: Document RZ/V2L SoC
  clk: renesas: Add support for RZ/V2L SoC
  dt-bindings: pinctrl: renesas: Document RZ/V2L pinctrl
  pinctrl: renesas: Kconfig: Select PINCTRL_RZG2L if RZ/V2L SoC is
    enabled
  dt-bindings: dma: rz-dmac: Document RZ/V2L SoC
  dt-bindings: net: renesas,etheravb: Document RZ/V2L SoC
  arm64: dts: renesas: Add initial DTSI for RZ/V2L SoC
  arm64: dts: renesas: Add initial device tree for RZ/V2L SMARC EVK
  arm64: dts: renesas: Add support for r9a07g044c1/r9a07g054l1-smarc.dts

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  14 +-
 .../bindings/dma/renesas,rz-dmac.yaml         |   3 +-
 .../bindings/net/renesas,etheravb.yaml        |   3 +-
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  15 +-
 .../bindings/power/renesas,rzg2l-sysc.yaml    |   7 +-
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../boot/dts/renesas/r9a07g044c1-smarc.dts    |  99 ++++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    | 491 ++++++++++++++++++
 .../boot/dts/renesas/r9a07g054l1-smarc.dts    |  25 +
 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi  |  25 +
 .../boot/dts/renesas/r9a07g054l2-smarc.dts    |  25 +
 arch/arm64/boot/dts/renesas/r9a07g054l2.dtsi  |  13 +
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  |   2 +-
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     |   2 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |   2 +-
 drivers/clk/renesas/Kconfig                   |   7 +-
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a07g054-cpg.c           | 184 +++++++
 drivers/clk/renesas/rzg2l-cpg.c               |   6 +
 drivers/clk/renesas/rzg2l-cpg.h               |   1 +
 drivers/pinctrl/renesas/Kconfig               |   1 +
 drivers/soc/renesas/Kconfig                   |   5 +
 drivers/soc/renesas/renesas-soc.c             |  13 +
 include/dt-bindings/clock/r9a07g054-cpg.h     | 226 ++++++++
 24 files changed, 1154 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l1-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l2.dtsi
 create mode 100644 drivers/clk/renesas/r9a07g054-cpg.c
 create mode 100644 include/dt-bindings/clock/r9a07g054-cpg.h

-- 
2.17.1

