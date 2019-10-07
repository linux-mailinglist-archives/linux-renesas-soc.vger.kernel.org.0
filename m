Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABB59CDF2C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2019 12:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbfJGKXp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Oct 2019 06:23:45 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:46914 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfJGKXp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Oct 2019 06:23:45 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id AaPh2100605gfCL01aPhT4; Mon, 07 Oct 2019 12:23:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-00086b-6b; Mon, 07 Oct 2019 12:23:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iHQB3-0003Bo-4C; Mon, 07 Oct 2019 12:23:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 00/19] arm64: dts: renesas: Initial support for R-Car M3-W+
Date:   Mon,  7 Oct 2019 12:23:13 +0200
Message-Id: <20191007102332.12196-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This RFC patch series adds support for the R-Car M3-W+ (R8A77961) SoC
and the Salvator-XS board with R-Car M3-W+.  This SoC is a derivative of
R-Car M3-W (R8A77960), and also known as R-Car M3-W ES3.0.
As this is an RFC, I'm sending it to a limited audience.

Based on experience with previous SoCs in the R-Car Gen3 family, the
following design decisions were made:
  - Use different compatible values (r8a77961-based),
  - Use different clock and SYSC DT binding definitions
    (R8A77961-based), but the same numerical values, to allow sharing
    drivers,
  - Share the pin control driver,
  - Share the clock driver,
  - Share the system controller driver.

While the DT ABI is stable (hence we cannot s/r8a7796/r8a77960/ in DTS),
kernel source code and kernel config symbols can be changed at any
time.  As changing kernel config symbols impacts the user, they weren't
renamed yet.

Questions:
  - What's the board part number of Salvator-XS with R-Car M3-W+?
  - Should r8a77961_pinmux_info (and the rename of r8a7796_pinmux_info
    to r8a77960_pinmux_info) be dropped? I added it because
    r8a7796_pinmux_info.name contains "r8a77960_pfc".

  - Should the CLK_R8A77961 and PINCTRL_PFC_R8A77961 symbols be dropped?
    The clock and pin control drivers are the same or almost the same,
    so the code increase by always enabling both is minimal.

  - Should the R8A77961 config symbols be dropped?
      - CONFIG_ARCH_R8A77961
      - CONFIG_CLK_R8A77961
      - CONFIG_PINCTRL_PFC_R8A77961
      - CONFIG_SYSC_R8A77961

  - If not, should the R8A7796 config symbols be renamed?
      - CONFIG_ARCH_R8A7796 to CONFIG_ARCH_R8A77960?
      - CONFIG_CLK_R8A7796 to CONFIG_CLK_R8A77960?
      - CONFIG_PINCTRL_PFC_R8A7796 to CONFIG_PINCTRL_PFC_R8A77960?
      - CONFIG_SYSC_R8A7796 to CONFIG_SYSC_R8A77960?
    Due to dependencies on CONFIG_ARCH_R8A7796, this should be a single
    commit.

Related questions for old R-Car H3 ES1.x support:
  - Should CONFIG_PINCTRL_PFC_R8A77950 be added, to allow compiling out
    R-Car H3 ES1.x pin control support?
    If yes, should CONFIG_PINCTRL_PFC_R8A7795 be renamed to
    CONFIG_PINCTRL_PFC_R8A77951?

This patch series is based on renesas-drivers-2019-10-01-v5.4-rc1).  For
your convenience, it is available in the topic/r8a77961-v1 branch of my
renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

This has been tested using remote access.

Thanks for your comments!

Geert Uytterhoeven (19):
  dt-bindings: arm: renesas: Document R-Car M3-W+ SoC DT bindings
  dt-bindings: arm: renesas: Add Salvator-XS board with R-Car M3-W+
  dt-bindings: clock: renesas: cpg-mssr: Document r8a77961 support
  dt-bindings: pinctrl: sh-pfc: Document r8a77961 support
  dt-bindings: power: rcar-sysc: Document r8a77961 support
  dt-bindings: reset: rcar-rst: Document r8a77961 support
  dt-bindings: serial: sh-sci: Document r8a77961 bindings
  dt-bindings: power: Add r8a77961 SYSC power domain definitions
  dt-bindings: clock: Add r8a77961 CPG Core Clock Definitions
  soc: renesas: Add R8A77961 config option
  soc: renesas: Identify R-Car M3-W+
  soc: renesas: rcar-sysc: Add R8A77961 support
  soc: renesas: rcar-rst: Add support for R-Car M3-W+
  clk: renesas: r8a7796: Add R8A77961 CPG/MSSR support
  pinctrl: sh-pfc: r8a7796: Add R8A77961 PFC support
  arm64: dts: renesas: Add Renesas R8A77961 SoC support
  arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-W+
  arm64: defconfig: Enable R8A77961 SoC
  [LOCAL] arm64: renesas_defconfig: Enable R8A77961 SoC

 .../devicetree/bindings/arm/renesas.yaml      |   6 +
 .../bindings/clock/renesas,cpg-mssr.txt       |   9 +-
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt  |   1 +
 .../bindings/power/renesas,rcar-sysc.txt      |   1 +
 .../devicetree/bindings/reset/renesas,rst.txt |   1 +
 .../bindings/serial/renesas,sci-serial.txt    |   2 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../boot/dts/renesas/r8a77961-salvator-xs.dts |  31 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     | 723 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 arch/arm64/configs/renesas_defconfig          |   1 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c        |  21 +-
 drivers/clk/renesas/renesas-cpg-mssr.c        |   6 +
 drivers/pinctrl/sh-pfc/Kconfig                |   4 +
 drivers/pinctrl/sh-pfc/Makefile               |   1 +
 drivers/pinctrl/sh-pfc/core.c                 |   8 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c          |  31 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h               |   3 +-
 drivers/soc/renesas/Kconfig                   |  11 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/r8a7796-sysc.c            |  27 +-
 drivers/soc/renesas/rcar-rst.c                |   1 +
 drivers/soc/renesas/rcar-sysc.c               |   5 +-
 drivers/soc/renesas/rcar-sysc.h               |   3 +-
 drivers/soc/renesas/renesas-soc.c             |   3 +
 include/dt-bindings/clock/r8a77961-cpg-mssr.h |  65 ++
 include/dt-bindings/power/r8a77961-sysc.h     |  32 +
 29 files changed, 978 insertions(+), 27 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961.dtsi
 create mode 100644 include/dt-bindings/clock/r8a77961-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a77961-sysc.h

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
