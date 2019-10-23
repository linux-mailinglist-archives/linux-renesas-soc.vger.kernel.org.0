Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 406B0E1A1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391324AbfJWM3t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:29:49 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:36698 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391322AbfJWM3s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:29:48 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id H0Vl2100b05gfCL060Vl6w; Wed, 23 Oct 2019 14:29:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlp-0000eH-QF; Wed, 23 Oct 2019 14:29:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlp-0003Du-Of; Wed, 23 Oct 2019 14:29:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/4] clk: renesas: Add r8a77961 support
Date:   Wed, 23 Oct 2019 14:29:37 +0200
Message-Id: <20191023122941.12342-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for the Clock Pulse Generator / Module
Standby and Software Reset block in the Renesas R-Car M3-W+ (R8A77961)
SoC.  As R-Car M3-W+ is very similar to R-Car M3-W (R8A77960), the
existing driver for R-Car M3-W is updated to handle both.

To avoid confusion between R-Car M3-W and M3-W+, the existing config
symbol for M3-W is renamed to CLK_R8A77960 in a dependency-free way, and
references to r8a7796 are updated.

Changes compared to v1[1]:
  - Split in per-subsystem series,
  - Add Reviewed-by, Tested-by,
  - Rename CLK_R8A7796,
  - Update r8a7796 references,

I intend to queue this series in clk-renesas-for-v5.5.
The second patch will be put on a branch shared between driver and DTS.

Thanks for your comments!

[1] "[PATCH/RFC 00/19] arm64: dts: renesas: Initial support for R-Car M3-W+"
    https://lore.kernel.org/linux-renesas-soc/20191007102332.12196-1-geert+renesas@glider.be/

Geert Uytterhoeven (4):
  dt-bindings: clock: renesas: cpg-mssr: Document r8a77961 support
  dt-bindings: clock: Add r8a77961 CPG Core Clock Definitions
  clk: renesas: Rename CLK_R8A7796 to CLK_R8A77960
  clk: renesas: r8a7796: Add R8A77961 CPG/MSSR support

 .../bindings/clock/renesas,cpg-mssr.txt       | 11 ++--
 drivers/clk/renesas/Kconfig                   |  9 ++-
 drivers/clk/renesas/Makefile                  |  3 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c        | 24 +++++--
 drivers/clk/renesas/renesas-cpg-mssr.c        |  8 ++-
 include/dt-bindings/clock/r8a77961-cpg-mssr.h | 65 +++++++++++++++++++
 6 files changed, 107 insertions(+), 13 deletions(-)
 create mode 100644 include/dt-bindings/clock/r8a77961-cpg-mssr.h

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
