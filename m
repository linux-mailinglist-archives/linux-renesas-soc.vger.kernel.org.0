Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319544770CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 12:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbhLPLnM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 06:43:12 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:8078 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231464AbhLPLnM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 06:43:12 -0500
X-IronPort-AV: E=Sophos;i="5.88,211,1635174000"; 
   d="scan'208";a="104166388"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Dec 2021 20:43:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7CC4840121C6;
        Thu, 16 Dec 2021 20:43:08 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3]  Add Renesas RZ/G2LC{SoC,SMARC EVK} support
Date:   Thu, 16 Dec 2021 11:43:02 +0000
Message-Id: <20211216114305.5842-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

RZ/G2L and RZ/G2LC SoC's are similar and they share the same DEVID.
RZ/G2LC has fewer peripherals compared to RZ/G2L.

SSI (3 channels vs 4 channels)
GbEthernet (1 channel vs 2 channels)
SCIFA (4 channels vs 5 channels)
ADC is only supported in RZ/G2L.

This patch series aims to add support for Renesas RZ/G2LC SoC and
basic support for  Renesas RZ/G2L SMARC EVK (based on R9A07G044C2)
- memory
- External input clock
- SCIF
- GbEthernet
- Audio Clock

It shares the same carrier board with RZ/G2L, but the pin mapping is
different. Disable the device nodes which is not tested and
delete the corresponding pinctrl definitions.

Note:-
On the H/W manual Number of Supported SSI channels as 2 and
SCIFA as 3. I got clarification from HW team that it is 3 and 4.

Test logs:-
root@smarc-rzg2lc:~# cat /proc/cpuinfo
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

root@smarc-rzg2lc:~# cat /proc/meminfo
MemTotal:         868836 kB
MemFree:          745012 kB
MemAvailable:     733492 kB
Buffers:               0 kB
Cached:            28456 kB
SwapCached:            0 kB
Active:             5344 kB
Inactive:          31936 kB
Active(anon):        660 kB
Inactive(anon):    17648 kB
Active(file):       4684 kB
Inactive(file):    14288 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:          8824 kB
Mapped:            11428 kB
Shmem:              9484 kB
KReclaimable:      25568 kB
Slab:              60584 kB
SReclaimable:      25568 kB
SUnreclaim:        35016 kB
KernelStack:        1424 kB
PageTables:          688 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      434416 kB
Committed_AS:      50076 kB
VmallocTotal:   133143461888 kB
VmallocUsed:        2000 kB
VmallocChunk:          0 kB
Percpu:              504 kB
AnonHugePages:         0 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
CmaTotal:         131072 kB
CmaFree:          130676 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
root@smarc-rzg2lc:~# cat /proc/interrupts
           CPU0       CPU1
 11:      38819      38039     GICv3  27 Level     arch_timer
 13:          0          0     GICv3 412 Level     1004b800.serial:rx err
 14:          2          0     GICv3 414 Level     1004b800.serial:rx full
 15:       1282          0     GICv3 415 Level     1004b800.serial:tx empty
 16:          0          0     GICv3 413 Level     1004b800.serial:break
 17:         53          0     GICv3 416 Level     1004b800.serial:rx ready
 18:          0          0     GICv3 173 Edge      error
 19:          0          0     GICv3 157 Edge      11820000.dma-controller:0
 20:          0          0     GICv3 158 Edge      11820000.dma-controller:1
 21:          0          0     GICv3 159 Edge      11820000.dma-controller:2
 22:          0          0     GICv3 160 Edge      11820000.dma-controller:3
 23:          0          0     GICv3 161 Edge      11820000.dma-controller:4
 24:          0          0     GICv3 162 Edge      11820000.dma-controller:5
 25:          0          0     GICv3 163 Edge      11820000.dma-controller:6
 26:          0          0     GICv3 164 Edge      11820000.dma-controller:7
 27:          0          0     GICv3 165 Edge      11820000.dma-controller:8
 28:          0          0     GICv3 166 Edge      11820000.dma-controller:9
 29:          0          0     GICv3 167 Edge      11820000.dma-controller:10
 30:          0          0     GICv3 168 Edge      11820000.dma-controller:11
 31:          0          0     GICv3 169 Edge      11820000.dma-controller:12
 32:          0          0     GICv3 170 Edge      11820000.dma-controller:13
 33:          0          0     GICv3 171 Edge      11820000.dma-controller:14
 34:          0          0     GICv3 172 Edge      11820000.dma-controller:15
 35:      10423          0     GICv3 116 Level     eth0
IPI0:      3655       5842       Rescheduling interrupts
IPI1:       251        787       Function call interrupts
IPI2:         0          0       CPU stop interrupts
IPI3:         0          0       CPU stop (for crash dump) interrupts
IPI4:         0          0       Timer broadcast interrupts
IPI5:        20         54       IRQ work interrupts
IPI6:         0          0       CPU wake-up interrupts
Err:          0
root@smarc-rzg2lc:~#


Biju Das (3):
  arm64: dts: renesas: rzg2l-smarc: Move pinctrl definitions
  arm64: dts: renesas: Add initial DTSI for RZ/G2LC SoC
  arm64: dts: renesas: Add initial device tree for RZ/G2LC SMARC EVK

 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi  |  32 ++++
 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |  99 +++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g044c2.dtsi  |  20 +++
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    |   1 +
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  | 137 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 127 ----------------
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi |  25 ++++
 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi    |  76 ++++++++++
 9 files changed, 391 insertions(+), 127 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi

-- 
2.17.1

