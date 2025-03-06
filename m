Return-Path: <linux-renesas-soc+bounces-14092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965EFA54EE6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 16:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF34E3B1996
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783621624C8;
	Thu,  6 Mar 2025 15:25:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5031FDE37
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Mar 2025 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274733; cv=none; b=IWHnqzKXI1a9dJqzYKINeMCUUDEAp9HzBy32IOtug8JYtKs5a41O1vkhOGdfy5SplNTl+lRM7vVjMkbuevZljtypOqrp9wlr+7SuQ0XHSBBiadUwPt3VV+860vLo58D2uZwlYZsDIJu5KPIbXw8At9LPva8sUs/F6da2DqfvSEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274733; c=relaxed/simple;
	bh=fczWsdg5IuI9IKjidEZapYvjR1Jj454x3Uswamjiets=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MbMUXII5SptDMP+mLgH6HHD9EqjBFYDYdu/yUn4Ps2HCmOvy276XwUjDCqPQBZVG7miPDQuHLbJUCmI4xOXsLPQI+B4m8cckkcrDdcEp/bhk2DwCFtppgo727op+l0XJzfqOPHavqMaHP5GJOvQcEhaEkpNKHqdysufejwLYHXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ga/qmcqBQVuya6Gnz/dT/Q==
X-CSE-MsgGUID: tPxpaLTzQyGT/QgcUN9zAA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Mar 2025 00:25:28 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8EFB64007213;
	Fri,  7 Mar 2025 00:25:26 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Subject: [PATCH v4 00/13] Add initial support for Renesas RZ/T2H SoC
Date: Thu,  6 Mar 2025 16:24:34 +0100
Message-ID: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset brings basic support for Renesas RZ/T2H SoC and
its evaluation board. The 4 CPUs are enabled, only the serial 
console is available and the board must boot on a ramdisk. 
earlycon is supported, though.

The RZ/T2H serial controller (SCI) is quite different from the 
other RZ SoCs, one of the big differences (but not the only) being
the 32 bits registers. In order to not modify the existing sh-sci 
driver too much, a new set of 'ops' function pointer is introduced,
allowing to code the specifics of RZ/T2H in a separate file.
Termios setting is not supported yet, the default 115200 baudrate
being kept by default.

Clock support for RZ/T2H is added to the existing renesas-cpg-mssr
driver, with some little modifications so that more parameters are
passed to the device-specific registration callback. 
At this stage, the assumption is made that most of the initialization 
is done earlier by the bootloader. Module clock enable/disable is 
not supported, because quite hard to test when the only available 
peripheral is the serial console, and will come in a future patchset.

This patch applies to tty-next + patch [1]

[1]: https://lore.kernel.org/linux-renesas-soc/11c2eab45d48211e75d8b8202cce60400880fe55.1741114989.git.geert+renesas@glider.be/T/#u

Changes v3->v4
* Remove all unwanted 'Reviewed by:' tags coming from internal patchwork.
* [PATCH 2/13]: 
  - Handle maxItems and clocks names properly in schema.
* [PATCH 3/13]: 
  - Add more details in commit description about why renesas,sci 
    does not apply.
  - Remove uart-has-rtscts for !rzsci.
* [PATCH 4/13] & [PATCH 13/13] 
  - Sets ARCH_R9A09G077 to Y by default.
* [PATCH 6/13] 
   - Add missing #include <bitfield.h> (reported by bot)
   - Add missing __iomem address space in cpg_rzt2h_addr_from_offset and
     return type (reported by bot)
   - fixed clocks: inverted 'mult' and 'div' parameters when using 
     the DEF_FIXED macro
* [PATCH 8/13]
   - Add missing #include <bitfield.h>
   - Remove sci_poll_get_char sci_poll_put_char from sh-sci-common.h (both 
     function are not used by rzsci yet).
   - Add missing #ifdef around .poll_put_char pointer initialization.
* [PATCH 9/13] 
  - Fix the bot compilation error on superh in sci_probe_earlyprink()
* [PATCH 10/13]
  - Add missing #include <bitfield.h>
  - Fix christmas tree code style in rzsci_transmit_chars.
* [PATCH 13/13]
  - Change the commit title.
  - Remove CONFIG_ARCH_R9A09G077=y.

Changes v2->v3
* Amend [PATCH v2 05/13] with Signed-off-by, added comment about
  moved parameters of priv data.
* bindings:
  - sci: own section for RZ/T2H sci, resets no required at this stage
  - sci: 'uart-has-rtscts' is conditional to RZ/T2H.
  - renesas: 'renesas,r9a09g077' is the fallback.
  - cpg: renamed 'r9a09g077-cpg-mssr.h to 'renesas,r9a09g077-cpg-mssr.h'.
  - cpg: update renesas,cpg-mssr.yaml (added loco clock, maxItems for registers is 2),
    update commit description
* rz/sci: 
  - rebase the patchset on v6.14-rc3.
  - removed unused register bits definitions in rzsci.c
  - rzsci: replace the busy loop in rzsci_poll_put_char by 
    readl_relaxed_poll_timeout_atomic
  - change 'struct sci_suspend_regs' to opaque pointer in sci_port, 
    kzalloc it with size returned from the added 'suspend_regs_size()' 
    to specific ops.
  - renamed 'sh-sci_common.h' to 'sh-sci-common.h'
  - add Geert's fixes for SH crash
  - do not use SCI_OF_DATA macro to avoid code duplication by compiler
  - revert some global functions to static
* clk:
  - fixed Kconfig for selecting CLK_RENESAS_CPG_MSSR.
  - code style.
  - use macros for MSTPCR block selection.
  - fixed erroneous offset in mstpcr_for_rzt2h array.
  - fixed the forgotten rcar-gen2-cpg.c in [PATCH v2 05/13]
 * defconfig;
  - added commit description and SoB
  - update cover letter about SoC options

Changes v1->v2
* CPG based on renesas-cpg-mssr (no more new CPG driver), updated cover letter
  for that.
* bindings: 
  - passed dt_binding_check and added missing compatible strings, 
  - document SoC + evaluation board in a single commit
  - rzsci added to sci documentation
  - fixed dependencies
  - renamed the evaluation board to r9a9g077m44-rzt2h-evk
  - removed clock module numbers & resets from binding header
  - compatibles: renamed r9a09g077-rzt2h-evk to rzt2h-evk
* rz/sci:
  - added Renesas copyright
  - fixed rzsci_receive_chars following Geert's advice, and comment
    that 9-bits data is not supported
  - fixed the regression (ops init) on non-DT legacy boards, sci_probe_regmap
    called moved in the non-DT case.
  - moved struct sci_of_data introduction in the appropriate commit
* dts
  - applied conventions (nodes alphabetical order & node names)
  - added missing compatibles to r9a09g077m44.dtsi and r9a09g077m44-rzt2h-evk.dts
  
  

Thierry Bultel (13):
  dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC
  dt-bindings: clock: Add cpg for the Renesas RZ/T2H SoC
  dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci
  soc: renesas: Add RZ/T2H (R9A09G077) config option
  clk: renesas: Pass sub struct of cpg_mssr_priv to cpg_clk_register
  clk: renesas: Add support for R9A09G077 SoC
  serial: sh-sci: Fix a comment about SCIFA
  serial: sh-sci: Introduced function pointers
  serial: sh-sci: Introduced sci_of_data
  serial: sh-sci: Add support for RZ/T2H SCI
  arm64: dts: renesas: Add initial support for renesas RZ/T2H SoC
  arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
  arm64: defconfig: Enable Renesas RZ/T2H serial SCI

 .../bindings/clock/renesas,cpg-mssr.yaml      |  56 +-
 .../bindings/serial/renesas,sci.yaml          |  63 +-
 .../bindings/soc/renesas/renesas.yaml         |  10 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 129 ++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  35 +
 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi |  13 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c        |   7 +-
 drivers/clk/renesas/r8a77970-cpg-mssr.c       |  11 +-
 drivers/clk/renesas/r9a09g077-cpg-mssr.c      | 238 +++++++
 drivers/clk/renesas/rcar-gen2-cpg.c           |   5 +-
 drivers/clk/renesas/rcar-gen2-cpg.h           |   3 +-
 drivers/clk/renesas/rcar-gen3-cpg.c           |   6 +-
 drivers/clk/renesas/rcar-gen3-cpg.h           |   6 +-
 drivers/clk/renesas/rcar-gen4-cpg.c           |   8 +-
 drivers/clk/renesas/rcar-gen4-cpg.h           |   3 +-
 drivers/clk/renesas/renesas-cpg-mssr.c        | 153 +++--
 drivers/clk/renesas/renesas-cpg-mssr.h        |  43 +-
 drivers/soc/renesas/Kconfig                   |   6 +
 drivers/tty/serial/Kconfig                    |   7 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/rzsci.c                    | 466 +++++++++++++
 drivers/tty/serial/rzsci.h                    |  12 +
 drivers/tty/serial/sh-sci-common.h            | 166 +++++
 drivers/tty/serial/sh-sci.c                   | 648 ++++++++++--------
 drivers/tty/serial/sh-sci.h                   |   2 -
 .../clock/renesas,r9a09g077-cpg-mssr.h        |  49 ++
 include/linux/serial_sci.h                    |   3 +-
 include/uapi/linux/serial_core.h              |   3 +
 32 files changed, 1770 insertions(+), 390 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
 create mode 100644 drivers/clk/renesas/r9a09g077-cpg-mssr.c
 create mode 100644 drivers/tty/serial/rzsci.c
 create mode 100644 drivers/tty/serial/rzsci.h
 create mode 100644 drivers/tty/serial/sh-sci-common.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h

-- 
2.43.0


