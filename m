Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6593A285D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 11:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhFJJjh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 05:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhFJJjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 05:39:37 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C326CC0617A6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 02:37:40 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a946:bccb:b1a1:3055])
        by albert.telenet-ops.be with bizsmtp
        id FMde2500P0wnyou06MdeEc; Thu, 10 Jun 2021 11:37:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH86-00FDWz-CK; Thu, 10 Jun 2021 11:37:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH85-00BTlH-Ll; Thu, 10 Jun 2021 11:37:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/14] arm64: renesas: Add support for R Car H3e 2G-and M3e-2G
Date:   Thu, 10 Jun 2021 11:37:13 +0200
Message-Id: <cover.1623315732.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

The new R-Car Gen3e SoCs are different gradings of the existing R-Car
Gen3 SoCs.  This series adds support for the first two members of the
family: R-Car H3e-2G (R8A779M1) and R-Car M3e-2G (R8A779M3), on the
Salvator-XS and ULCB (with and without Kingfisher) development boards.

This series depends on "[PATCH 0/4] arm64: dts: renesas: salvator-x(s):
Factor out common optional parts".

It has been tested on Salvator-X with R-Car H3 ES3.0 and Salvator-XS
with R-Car M3-W+.  The last two patches have been tested by overclocking
R-Car H3 ES2.0 and M3-W ES1.0.

For testing, a branch with dependencies and fixups to prototype R-Car
Gen3e development on older Gen3 SoCs can be found at[2].

For this initial submission, I'm restricting the audience to the Renesas
SoC and Device Tree people.

Thanks for your comments!

[1] https://lore.kernel.org/linux-renesas-soc/cover.1623087028.git.geert+renesas@glider.be
[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rcar-gen3e-v1

Geert Uytterhoeven (14):
  dt-bindings: arm: renesas: Document R-Car H3e-2G and M3e-2G SoCs and
    boards
  soc: renesas: Identify R-Car H3e-2G and M3e-2G
  pinctrl: renesas: Fix pin control matching on R-Car H3e-2G
  mmc: renesas_sdhi: Add support for R-Car H3e-2G and M3e-2G
  arm64: dts: renesas: Add Renesas R8A779M1 SoC support
  arm64: dts: renesas: Add Renesas R8A779M3 SoC support
  arm64: dts: renesas: Add support for Salvator-XS with R-Car H3e-2G
  arm64: dts: renesas: Add support for H3ULCB with R-Car H3e-2G
  arm64: dts: renesas: Add support for H3ULCB+Kingfisher with R-Car
    H3e-2G
  arm64: dts: renesas: Add support for Salvator-XS with R-Car M3e-2G
  arm64: dts: renesas: Add support for M3ULCB with R-Car M3e-2G
  arm64: dts: renesas: Add support for M3ULCB+Kingfisher with R-Car
    M3e-2G
  [RFC] arm64: dts: renesas: r8a779m1: Add Cortex-A57 2 GHz opp
  [RFC] arm64: dts: renesas: r8a779m3: Add Cortex-A57 2 GHz opp

 .../devicetree/bindings/arm/renesas.yaml      | 50 +++++++++++++----
 arch/arm64/boot/dts/renesas/Makefile          |  8 +++
 .../boot/dts/renesas/r8a779m1-salvator-xs.dts | 53 ++++++++++++++++++
 .../boot/dts/renesas/r8a779m1-ulcb-kf.dts     | 19 +++++++
 arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts | 54 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779m1.dtsi     | 21 ++++++++
 .../boot/dts/renesas/r8a779m3-salvator-xs.dts | 46 ++++++++++++++++
 .../boot/dts/renesas/r8a779m3-ulcb-kf.dts     | 18 +++++++
 arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts | 45 ++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779m3.dtsi     | 21 ++++++++
 drivers/mmc/host/renesas_sdhi_core.c          |  2 +
 drivers/pinctrl/renesas/core.c                | 14 +++--
 drivers/soc/renesas/Kconfig                   |  2 +
 drivers/soc/renesas/renesas-soc.c             | 19 +++++++
 14 files changed, 356 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3.dtsi

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
