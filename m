Return-Path: <linux-renesas-soc+bounces-16441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7315EAA0567
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 10:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8E4F1A8508D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 08:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F80279329;
	Tue, 29 Apr 2025 08:20:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F392459F2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Apr 2025 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914813; cv=none; b=Mz2gS6EE9FyiYJe7XtDzuu7j5tmRuK/rmaWzY6B+bEUwNiW9wGap402bLNZ2Bcc8aFuIpkvReO1AwgzS7vzWAs5o7TIEVKVQShFGwDaRUuEL3aamckkE32ILVseyi7OKn+gRKbhnKRJoA4XLc4matgIGTjJU9xCL0Etm53kQfSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914813; c=relaxed/simple;
	bh=dGvuHSfkWN5YpZfVIDxLG+xBJMuepYZuf1DRxk2cJVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mlwg6HAa25DeGG1EnS2VBcIdmidhSeS6SrDZGXbadVimeVaZk7cKHmhrBSwcxFtMMBAkVt+mD5HOlnouG/TRzcHZ3U36UxK9bnJ9a6aRT/tl/cCsXO1iXPC1qFd+UHJOhWVkEtLPzAX0G/uSSVRh1/ZPmkJUj6TMFyPYBMXBhpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: UtqqXtGtRwGRinXi4hxtwA==
X-CSE-MsgGUID: 0WZX/h/ERIGzPn+uI1rp3Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Apr 2025 17:20:02 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.118])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 584474007F4D;
	Tue, 29 Apr 2025 17:20:00 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Subject: [PATCH v8 00/11] Add initial support for Renesas RZ/T2H SoC
Date: Tue, 29 Apr 2025 10:19:42 +0200
Message-ID: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com>
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
is done earlier by the bootloader.

This patch series applies to tty-next, needing commits [1], [2] and [3]
[1]: 25422e8f46c1f dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci
[2]: 043806bc9dbc6 serial: sh-sci: Introduced sci_of_data
[3]: 21fc3d6b45ba4 serial: sh-sci: Introduced function pointers
[4]: d004e3595718b serial: sh-sci: Fix a comment about SCIFA


Changes v7->v8

Rebased v7 patches on tty-next, and:

* [PATCH 1/11] (new patch)
  - Add secondary clock for RCSI
* [PATCH 3/11] (was 2/13)
  - extra parenthesis
  - added loco
  - renesas-cpg-mssr.h: removed unused clocks, added a macro for mstp
* [PATCH 5/11]:
 - moved struct cpg_mssr_pub pub to the beginning of struct cpg_mssr_priv
 - make *core & *info fit on the same line
 - order of doc tags
* [PATCH 6/11]
 - Makefile: keep ordered list
 - r9a09g077-cpg-mssr.c: use high bit instead of sel_base,
   same macro for DIV and MUX
 - removed unused clocks
 - CLK_LOCO is internal with a DEF_RATE definition
 - added CLK_PLL4D1 & CLK_SCI0ASYNC
 - added per-CA55 clocks
 - added missing error check in r9a09g077_cpg_mux_clk_register
 - fixed num_hw_mod_clks to 14
 - added missing 2 holes in mstpcr_for_rzt2h
 - renamed cpg_read_rzt2h_mstp_from_offset to cpg_read_rzt2h_mstp,
   directly reads at calculated address
 - added cpg_write_rzt2h_mstp and call in cpg_mstp_clock_endisable
 - do not register reset controller in case of CLK_REG_LAYOUT_RZ_T2H
 - moved CLK_DIV & CLK_MUX definitions to RZT2H specifics
* [PATCH 7/11] (new patch)
 - Do not declare PORT_RCSI in userland header
* [PATCH 8/11] (was 10/13)
  - s/rzsci/rsci/g
  - declared SCI_PORT_RSCI as private port ID
  - look for secondary clock
  - report error when rsci clocks are not found
* [PATCH 9/11] (was 11/13)
  - removed loco clock
  - added sci0 secondary clock
* [PATCH 10/11] (was 12/13)
  - removed loco clock
  - fixed checkpatch warning

Changes v6->v7
* [PATCH 2/13]
  - Add description for reg property
* [PATCH 3/13]
  - Moved all rsci in a separate file
  - Added example
* [PATCH 10/13]
  - Renamed compatible string to r9a09g077-rsci
* [PATCH 11/13]
  - Renamed compatible string to r9a09g077-rsci
* [PATCH 12/13]
  - lands in arm64 directory instead of arm

Changes v5->v6
* [PATCH 1/13]
  - Rebased on top of next-20250331
* [PATCH 2/13]
  - Set clock minItem constraint
  - Moved additionalProperties after 'allOf' section
* [PATCH 10/13]
  - Rename SERIAL_RZ_SCI_T2 to CONFIG_SERIAL_RSCI
  - Rename rz-sci-t2.{c,h} to rsci.{c,h}
  - Rename port type to PORT_RSCI
  - Rename sci_r9a09g077_data to of_sci_r9a09g077_data for consistency
* [PATCH 12/13]
  - Rebased on top of next-20250331
* [PATCH 13/13]
  - Renamed CONFIG_SERIAL_RZ_SCI_T2 to CONFIG_SERIAL_RSCI

Changes v4->v5
* [PATCH 2/13]:
  - Set reg minItems and maxItems defaults at top level
* [PATCH 8/13]:
   - sci_shutdown is no longer static (systemd needs it)
* [PATCH 10/13]:
  - Rename SERIAL_RZ_SCI to SERIAL_RZ_SCI_T2
  - Rename rzsci.{c,h} to rz-sci-t2.{c,h}
  - Rename port type to PORT_RZ_SCI_T2
  - Set sci_shutdown ops pointer (needed by systemd for having a console)
* [PATCH 13/13]:
   - Renamed CONFIG_SERIAL_RZ_SCI to CONFIG_SERIAL_RZ_SCI_T2

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



Thierry Bultel (11):
  dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
  dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC
  dt-bindings: clock: Add cpg for the Renesas RZ/T2H SoC
  soc: renesas: Add RZ/T2H (R9A09G077) config option
  clk: renesas: Pass sub struct of cpg_mssr_priv to cpg_clk_register
  clk: renesas: Add support for R9A09G077 SoC
  serial: sh-sci: Use private port ID
  serial: sh-sci: Add support for RZ/T2H SCI
  arm64: dts: renesas: Add initial support for renesas RZ/T2H SoC
  arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
  arm64: defconfig: Enable Renesas RZ/T2H serial SCI

 .../bindings/clock/renesas,cpg-mssr.yaml      |  58 ++-
 .../bindings/serial/renesas,rsci.yaml         |  18 +-
 .../bindings/soc/renesas/renesas.yaml         |  10 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 122 +++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  31 ++
 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi |  13 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c        |   7 +-
 drivers/clk/renesas/r8a77970-cpg-mssr.c       |   8 +-
 drivers/clk/renesas/r9a09g077-cpg-mssr.c      | 252 ++++++++++
 drivers/clk/renesas/rcar-gen2-cpg.c           |   5 +-
 drivers/clk/renesas/rcar-gen2-cpg.h           |   3 +-
 drivers/clk/renesas/rcar-gen3-cpg.c           |   6 +-
 drivers/clk/renesas/rcar-gen3-cpg.h           |   3 +-
 drivers/clk/renesas/rcar-gen4-cpg.c           |   6 +-
 drivers/clk/renesas/rcar-gen4-cpg.h           |   3 +-
 drivers/clk/renesas/renesas-cpg-mssr.c        | 188 +++++--
 drivers/clk/renesas/renesas-cpg-mssr.h        |  32 +-
 drivers/soc/renesas/Kconfig                   |   6 +
 drivers/tty/serial/Kconfig                    |   7 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/rsci.c                     | 466 ++++++++++++++++++
 drivers/tty/serial/rsci.h                     |  12 +
 drivers/tty/serial/sh-sci-common.h            |   8 +
 drivers/tty/serial/sh-sci.c                   | 194 +++++---
 .../clock/renesas,r9a09g077-cpg-mssr.h        |  48 ++
 29 files changed, 1340 insertions(+), 175 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
 create mode 100644 drivers/clk/renesas/r9a09g077-cpg-mssr.c
 create mode 100644 drivers/tty/serial/rsci.c
 create mode 100644 drivers/tty/serial/rsci.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h

-- 
2.43.0


