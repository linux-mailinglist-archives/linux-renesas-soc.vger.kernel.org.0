Return-Path: <linux-renesas-soc+bounces-10664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A0E9D5F18
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 13:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67BEF1F22580
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 12:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7501DF26A;
	Fri, 22 Nov 2024 12:46:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32F01E492;
	Fri, 22 Nov 2024 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279583; cv=none; b=IrDmCZHMeZ34+IZEOanrIWgOxr+n2k78eP7nmTdPH0aesakQ4xrxFZLn8G7UWjLlJ9qgQeSwgP9Kjv4bl/T3zkGNvbC/5O9JGeIH6RW8l60msZreb6dLiXH8JfH1SGjU8U34FrO7ElNu3aUdX4X9fwUY3NfwHHo1c+tTT681VKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279583; c=relaxed/simple;
	bh=c/+zyr/Rn0EdyLB92wzKAsULxtS5gCAfuDJk2DOJZFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KsHO0PIgnrPvuSvB4DYYzLl/hqmzJcC5Mh2b0xJB8D6YnFcPkQebw1+abUpbytprDN/DBXHeaoV2sgINwPWto2drjiUshqls/ZAxpVbGJDaUkIiGnTBRX116Z5+DxPE4wo+5Ff3cgIP6Fz2nX122q8R8oYyvjOgcAfcQJPlf8oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 6zuj4mPHTTKVRI/FMovSYA==
X-CSE-MsgGUID: 3JsKBUaPSiWZ4kE3BdRuUw==
X-IronPort-AV: E=Sophos;i="6.12,175,1728918000"; 
   d="scan'208";a="225786430"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2024 21:46:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5402F4237D3A;
	Fri, 22 Nov 2024 21:46:01 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 00/12] Add support for Renesas RZ/G3E SoC and SMARC-EVK platform
Date: Fri, 22 Nov 2024 12:45:36 +0000
Message-ID: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds initial support for the Renesas RZ/G3E SoC and
RZ/G3E SMARC EVK platform. The RZ/G3E device is a general-purpose
microprocessor with a quad-core CA-55, single core CM-33, Ethos-U55 NPU
, Mali-G52 3-D Graphics and other peripherals.

Support for below list of blocks added on SoC DTSI (r9a09g047.dtsi):
 - EXT CLKs
 - 4X CA55
 - SCIF
 - CPG
 - GIC
 - ARMv8 Timer

This adds also support for the RZ/G3E SMARC EVK board
(r9a09g047e57-smarc.dts) and enable the following peripheral:
 - SCIF
 
Note:
 This patch series gives a boot console with serial driver support.
Later there is a plan to add support for SoC Identification using
SYSC driver and pin controller support were also added.
 
Test logs:
/ # uname -r
6.12.0-next-20241122-12513-g189628626a52

/ # cat /proc/cpuinfo
processor       : 0
BogoMIPS        : 48.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x2
CPU part        : 0xd05
CPU revision    : 0

processor       : 1
BogoMIPS        : 48.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x2
CPU part        : 0xd05
CPU revision    : 0

processor       : 2
BogoMIPS        : 48.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x2
CPU part        : 0xd05
CPU revision    : 0

processor       : 3
BogoMIPS        : 48.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x2
CPU part        : 0xd05
CPU revision    : 0

/ #

/ # cat /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
 11:        436        539        467        446    GICv3  27 Level     arch_timer
 14:          0          0          0          0    GICv3 561 Level     11c01400.serial:rx err
 15:          0          0          0          0    GICv3 564 Level     11c01400.serial:rx full
 16:        391          0          0          0    GICv3 565 Level     11c01400.serial:tx empty
 17:          0          0          0          0    GICv3 562 Level     11c01400.serial:break
 18:         67          0          0          0    GICv3 566 Level     11c01400.serial:rx ready
 19:          0          0          0          0    GICv3 563 Level     11c01400.serial:tx end
IPI0:         3         12         12         25       Rescheduling interrupts
IPI1:       299        276        347         82       Function call interrupts
IPI2:         0          0          0          0       CPU stop interrupts
IPI3:         0          0          0          0       CPU stop NMIs
IPI4:         0          0          0          0       Timer broadcast interrupts
IPI5:         0          0          0          0       IRQ work interrupts
IPI6:         0          0          0          0       CPU backtrace interrupts
IPI7:         0          0          0          0       KGDB roundup interrupts
Err:          0
/ #

/ # cat /proc/meminfo
MemTotal:        3882652 kB
MemFree:         3846048 kB
MemAvailable:    3775780 kB

Biju Das (12):
  dt-bindings: serial: renesas: Document RZ/G3E (r9a09g047) scif
  dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
  dt-bindings: soc: renesas: Document RZ/G3E SMARC SoM and Carrier-II
    EVK
  dt-bindings: clock: renesas: Document RZ/G3E SoC CPG
  soc: renesas: Add RZ/G3E (R9A09G047) config option
  clk: renesas: Add support for RZ/G3E SoC
  clk: renesas: rzv2h-cpg: Add MSTOP support
  arm64: dts: renesas: Add initial DTSI for RZ/G3E SoC
  arm64: dts: renesas: Add initial support for RZ/G3E SMARC SoM
  arm64: dts: renesas: Add initial device tree for RZ/G3E SMARC EVK
    board
  arm64: defconfig: Enable R9A09G047 SoC
  HACK-DO-NOT-APPLY-defconfig: Enable INIT RAMFS

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |  15 +-
 .../bindings/serial/renesas,scif.yaml         |   5 +
 .../bindings/soc/renesas/renesas.yaml         |  17 +++
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 144 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi |  18 +++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  18 +++
 arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi |  13 ++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  24 +++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |  28 ++++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |   7 +-
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g047-cpg.c           | 100 ++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c           | 117 +++++++++-----
 drivers/clk/renesas/rzv2h-cpg.c               |  98 +++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  23 ++-
 drivers/soc/renesas/Kconfig                   |   5 +
 .../dt-bindings/clock/renesas,r9a09g047-cpg.h |  21 +++
 19 files changed, 604 insertions(+), 54 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
 create mode 100644 drivers/clk/renesas/r9a09g047-cpg.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g047-cpg.h

-- 
2.43.0


