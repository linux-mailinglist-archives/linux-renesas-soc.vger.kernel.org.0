Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8CC4E1A9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391611AbfJWMdv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:33:51 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:41642 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389891AbfJWMdq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:33:46 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id H0Zj2100r05gfCL010Zjg4; Wed, 23 Oct 2019 14:33:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpf-0003tX-Ry; Wed, 23 Oct 2019 14:33:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpf-0003QC-QF; Wed, 23 Oct 2019 14:33:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 00/11] arm64: renesas: Add r8a77961 support
Date:   Wed, 23 Oct 2019 14:33:31 +0200
Message-Id: <20191023123342.13100-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds initial support for the Renesas R-Car M3-W+
(R8A77961) SoC, and for the Salvator-XS development board equipped with
this SoC.  As R-Car M3-W+ is very similar to R-Car M3-W (R8A77960), the
existing RST and SYSC drivers are updated to handle both.

To avoid confusion between R-Car M3-W and M3-W+, a new config symbol
(ARCH_R8A77960) is introduced for M3-W, to replace the old symbol
(ARCH_R8A7796) later.  The old symbol will be removed when all users in
other subsystems have been converted to use the new symbol.
The existing config symbol for M3-W SYSC is renamed to SYSC_R8A77960.

Changes compared to v1[1]:
  - Split in per-subsystem series,
  - Add Reviewed-by, Tested-by,
  - Rename SYSC_R8A7796,
  - Add ARCH_R8A77960,
  - Prepare for future removal of ARCH_R8A7796,
  - Wrap SoC-specific parts in #ifdefs.

I intend to queue this series in renesas-devel for v5.5 (except for the
local defconfig patch).
Note that arch/arm64/boot/dts/renesas/r8a77961.dtsi depends on the power
domain and clock domain indices from:
  - "[PATCH v2 5/5] dt-bindings: power: Add r8a77961 SYSC power domain
     definitions"[2],
  - "[PATCH v2 2/4] dt-bindings: clock: Add r8a77961 CPG Core Clock
     Definitions"[3],
which will be put on a branch shared by drivers and DTS.

For testing, I pushed this and all dependencies[2-5] to the
topic/r8a77961-v2 branch of my renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

Thanks for your comments!

[1] "[PATCH/RFC 00/19] arm64: dts: renesas: Initial support for R-Car M3-W+"
    https://lore.kernel.org/linux-renesas-soc/20191007102332.12196-1-geert+renesas@glider.be/
[2] "[PATCH v2 0/5] dt-bindings: arm: renesas: Add core r8a77961 support"
    (https://lore.kernel.org/linux-renesas-soc/20191023122911.12166-1-geert+renesas@glider.be/)
[3] "[PATCH v2 0/4] clk: renesas: Add r8a77961 support"
    (https://lore.kernel.org/linux-renesas-soc/20191023122941.12342-1-geert+renesas@glider.be/)
[4] "[PATCH v2 0/3] pinctrl: sh-pfc: Add r8a77961 support"
    (https://lore.kernel.org/linux-renesas-soc/20191023122955.12420-1-geert+renesas@glider.be/)
[5] "[PATCH v2] dt-bindings: serial: sh-sci: Document r8a77961 bindings"
    (https://lore.kernel.org/linux-renesas-soc/20191023123010.12501-1-geert+renesas@glider.be/)

Geert Uytterhoeven (11):
  soc: renesas: Rename SYSC_R8A7796 to SYSC_R8A77960
  soc: renesas: Add ARCH_R8A77960 for existing R-Car M3-W
  soc: renesas: Add ARCH_R8A77961 for new R-Car M3-W+
  soc: renesas: Identify R-Car M3-W+
  soc: renesas: rcar-rst: Add R8A77961 support
  soc: renesas: rcar-sysc: Add R8A77961 support
  arm64: dts: renesas: Prepare for rename of ARCH_R8A7796 to
    ARCH_R8A77960
  arm64: dts: renesas: Add Renesas R8A77961 SoC support
  arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-W+
  arm64: defconfig: Enable R8A77961 SoC
  [LOCAL] arm64: renesas_defconfig: Enable R8A77961 SoC

 arch/arm64/boot/dts/renesas/Makefile          |   4 +
 .../boot/dts/renesas/r8a77961-salvator-xs.dts |  31 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     | 723 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 arch/arm64/configs/renesas_defconfig          |   1 +
 drivers/soc/renesas/Kconfig                   |  21 +-
 drivers/soc/renesas/Makefile                  |   3 +-
 drivers/soc/renesas/r8a7796-sysc.c            |  27 +-
 drivers/soc/renesas/rcar-rst.c                |   1 +
 drivers/soc/renesas/rcar-sysc.c               |   7 +-
 drivers/soc/renesas/rcar-sysc.h               |   3 +-
 drivers/soc/renesas/renesas-soc.c             |   5 +-
 12 files changed, 807 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961.dtsi

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
