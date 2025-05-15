Return-Path: <linux-renesas-soc+bounces-17132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA574AB891D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 16:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A96316C9B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 14:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4231BC9F4;
	Thu, 15 May 2025 14:18:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD701DF258
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 May 2025 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318726; cv=none; b=DVLVBPdhZ3RxMd3YGVqtdEGdB7PDK/QhbKQvBrs9aGyWkNV6b3arM9a4CvO03ws+3uH41AxdVYl0vcBWTc3M79fkprxavMflhX3rpgfmiSbmS0icbitffaEUezCZLX97zCiUyYWBkxYrf7FMW/pAxyBbQtEqEQ/Bzvq5MNRZcHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318726; c=relaxed/simple;
	bh=52ng8kczzoPC2ebrBw+rpv1+4lxkRh+AyLR4xv/s1iU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dQmpqEOLtpC12QLRA3ASZ9bICIlzpDaJrMwKD2uBfPFTPhM/tn7UwK5qmkQGO5SfoMAweqA9RcS9n6vXwksYo8heTyhXtKxEcIhsMn7eHXNv9dMbU2kv45BSltL+pNOSkRi6GX8xetLonr0hEolt8qcITVYT8PUhwKcm0LWBJ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: zfchXCjFQk+euQx96eJwxg==
X-CSE-MsgGUID: T6yzMFwJQw2Wjq39faBHGA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 May 2025 23:18:34 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.187])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 19DC6401A460;
	Thu, 15 May 2025 23:18:31 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Subject: [PATCH v9 00/10] Add initial support for Renesas RZ/T2H SoC
Date: Thu, 15 May 2025 16:18:15 +0200
Message-ID: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
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

This patch series applies to next-20250514 and later

Changes v8->v9
Rebase v8 patches on linux-next, and:

* [PATCH 1/10]:
  - typo in description
  - Named clocks 'operational' and 'bus', and added optional 'sck' clock
  - Uses value of 2nd core clock in example to break the dependency on 
    cpg patch
* [PATCH 2/10] (was 3/11):
  - Keep clock names in generic section because T2H is a subset
  - Removed R9A09G077_CLK_BSC, to only keep R9A09G077_CLK_CKIO
  - Removed R9A09G077_MSTP* macros and module clocks definitions
* [PATCH 3/10] (was 4/11): none
* [PATCH 4/10] (was 5/11): rebase on linux-next
* [PATCH 5/10] (was 6/11):
  - Renamed r9a09g077-cpg-mssr.c to r9a09g077-cpg.c
  - Makefile: keep alphabetical order
  - Fixed DIVSCI0ASYNC
  - Removed unused CLK_MAIN
  - Simplified the clock tree, removing CLK_SEL_PLL0, CLK_SEL_PLL1 &
    CLK_SEL_PLL4
  - Renamed loco to .loco
  - Fixed the register bits in dtable_24_25_30_32, re-ordered the table
  - DEF_DIV & DEF_MUX: set flag to zero always (might change in a future
    commit)
  - Do not set CLK_DIVIDER_HIWORD_MASK
  - Uses '8' as value of removed R9A09G077_PCLK_SCI0 definition
  - Fixed addr calculation with RZT2H_REG_OFFSET in
    r9a09g077_cpg_clk_register
  - struct cpg_core_clk: moved union in specific section
  - Renamed cpg_read_rzt2h_mstp to cpg_rzt2h_mstp_read
  - Renamed cpg_write_rzt2h_mstp to cpg_rzt2h_mstp_write
* [PATCH 6/10] (was 7/11):
  - Shrunk length od type & regtype
  - Uses BIT(7) in id value
  - Set sci_ports[0].type & sci_ports[0].regtype in
    scix_early_console_setup
* [PATCH 7/10] (was 8/11):
  - Fixed some code formatting
  - Renamed rzt2_sci_uart_ops to rsci_uart_ops
  - Renamed of_sci_r9a09g077_data to of_sci_rsci_data
  - Added EXPORT_SYMBOL for public functions
  - Added MODULE_LICENSE & MODULE_DESCRIPTION
  - Fixed RSCI clock names
  - Fixed SCI_PORT_RSCI using BIT(7)
* [PATCH 8/10] (was 9/11):
  - Fixed RCSI clock names
  - No longer uses removed R9A09G077_PCLK_SCI0 definition
* [PATCH 9/10] (was 10/11):
  - Makefile: keep the alphabetical order
* [PATCH 10/10] (was 11/11): none


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
  - cpg: update renesas,cpg-mssr.yaml (added loco clock,
    maxItems for registers is 2),
  - update commit description
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
* CPG based on renesas-cpg-mssr (no more new CPG driver), 
  updated cover letter for that.
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
  - fixed the regression (ops init) on non-DT legacy boards,
    sci_probe_regmap called moved in the non-DT case.
  - moved struct sci_of_data introduction in the appropriate commit
* dts
  - applied conventions (nodes alphabetical order & node names)
  - added missing compatibles to r9a09g077m44.dtsi and
    r9a09g077m44-rzt2h-evk.dts


Thierry Bultel (10):
  dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
  dt-bindings: clock: Add cpg for the Renesas RZ/T2H SoC
  soc: renesas: Add RZ/T2H (R9A09G077) config option
  clk: renesas: Pass sub struct of cpg_mssr_priv to cpg_clk_register
  clk: renesas: Add support for R9A09G077 SoC
  serial: sh-sci: Use private port ID
  serial: sh-sci: Add support for RZ/T2H SCI
  arm64: dts: renesas: Add initial support for renesas RZ/T2H SoC
  arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
  arm64: defconfig: Enable Renesas RZ/T2H serial SCI

 .../bindings/clock/renesas,cpg-mssr.yaml      |  46 +-
 .../bindings/serial/renesas,rsci.yaml         |  21 +-
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 122 +++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  31 ++
 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi |  13 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c        |   7 +-
 drivers/clk/renesas/r8a77970-cpg-mssr.c       |   8 +-
 drivers/clk/renesas/r9a09g077-cpg.c           | 242 +++++++++
 drivers/clk/renesas/rcar-gen2-cpg.c           |   5 +-
 drivers/clk/renesas/rcar-gen2-cpg.h           |   3 +-
 drivers/clk/renesas/rcar-gen3-cpg.c           |   6 +-
 drivers/clk/renesas/rcar-gen3-cpg.h           |   3 +-
 drivers/clk/renesas/rcar-gen4-cpg.c           |   6 +-
 drivers/clk/renesas/rcar-gen4-cpg.h           |   3 +-
 drivers/clk/renesas/renesas-cpg-mssr.c        | 187 +++++--
 drivers/clk/renesas/renesas-cpg-mssr.h        |  32 +-
 drivers/soc/renesas/Kconfig                   |   6 +
 drivers/tty/serial/Kconfig                    |   7 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/rsci.c                     | 468 ++++++++++++++++++
 drivers/tty/serial/rsci.h                     |  12 +
 drivers/tty/serial/sh-sci-common.h            |   8 +
 drivers/tty/serial/sh-sci.c                   | 206 +++++---
 .../clock/renesas,r9a09g077-cpg-mssr.h        |  28 ++
 28 files changed, 1310 insertions(+), 170 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
 create mode 100644 drivers/clk/renesas/r9a09g077-cpg.c
 create mode 100644 drivers/tty/serial/rsci.c
 create mode 100644 drivers/tty/serial/rsci.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h

-- 
2.43.0


