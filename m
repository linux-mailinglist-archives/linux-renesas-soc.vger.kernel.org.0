Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFF4811E88A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 17:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbfLMQlU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:41:20 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:33450 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbfLMQlT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:41:19 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id dUhG2100d5USYZQ06UhGDP; Fri, 13 Dec 2019 17:41:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0006uO-Ey; Fri, 13 Dec 2019 17:41:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0000yr-Cu; Fri, 13 Dec 2019 17:41:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/7] arm: dts: renesas: Group tuples in reg/ranges/dma-ranges/states properties
Date:   Fri, 13 Dec 2019 17:41:07 +0100
Message-Id: <20191213164115.3697-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

To improve human readability and enable automatic validation, tuples
in various properties should be grouped.  While "make dtbs_check" does
not impose this yet for all properties, it does for some, hence
triggering me to fix (I hope) all of them.

Unfortunately even after this, a few "... is too long" warnings are
still printed (e.g. for PCI "ranges"), which I believe are false
positives.

This series is against renesas-devel-2019-12-13-v5.5-rc1[*] with
"[PATCH] ARM: dts: rcar-gen2: Fix PCI high address in
interrupt-map-mask" applied on top.

Thanks for your comments!

[*] Will be pushed out when gitolite.kernel.org is back.

Geert Uytterhoeven (7):
  ARM: dts: renesas: Group tuples in regulator-gpio states properties
  ARM: dts: renesas: Group tuples in interrupt properties
  ARM: dts: renesas: Group tuples in pci ranges and dma-ranges
    properties
  arm64: dts: renesas: Group tuples in regulator-gpio states properties
  arm64: dts: renesas: Group tuples in interrupt properties
  arm64: dts: renesas: Group tuples in pci ranges and dma-ranges
    properties
  arm64: dts: renesas: r8a77970: Group tuples in thermal reg property

 arch/arm/boot/dts/iwg20d-q7-common.dtsi       |   3 +-
 arch/arm/boot/dts/r7s72100.dtsi               |  18 +-
 arch/arm/boot/dts/r8a73a4.dtsi                |  42 ++--
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts |   3 +-
 arch/arm/boot/dts/r8a7740.dtsi                | 102 ++++-----
 arch/arm/boot/dts/r8a7743.dtsi                | 152 ++++++-------
 arch/arm/boot/dts/r8a7744.dtsi                | 152 ++++++-------
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts   |   3 +-
 arch/arm/boot/dts/r8a7745.dtsi                | 112 ++++-----
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts     |   3 +-
 arch/arm/boot/dts/r8a77470.dtsi               |  80 +++----
 arch/arm/boot/dts/r8a7778.dtsi                |   8 +-
 arch/arm/boot/dts/r8a7779-marzen.dts          |   3 +-
 arch/arm/boot/dts/r8a7779.dtsi                |   8 +-
 arch/arm/boot/dts/r8a7790-lager.dts           |   6 +-
 arch/arm/boot/dts/r8a7790.dtsi                | 158 ++++++-------
 arch/arm/boot/dts/r8a7791-koelsch.dts         |   9 +-
 arch/arm/boot/dts/r8a7791-porter.dts          |   6 +-
 arch/arm/boot/dts/r8a7791.dtsi                | 152 ++++++-------
 arch/arm/boot/dts/r8a7792.dtsi                |  64 +++---
 arch/arm/boot/dts/r8a7793-gose.dts            |   9 +-
 arch/arm/boot/dts/r8a7793.dtsi                | 120 +++++-----
 arch/arm/boot/dts/r8a7794-alt.dts             |   6 +-
 arch/arm/boot/dts/r8a7794-silk.dts            |   3 +-
 arch/arm/boot/dts/r8a7794.dtsi                | 104 ++++-----
 arch/arm/boot/dts/sh73a0.dtsi                 | 122 +++++-----
 .../arm64/boot/dts/renesas/hihope-common.dtsi |   3 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi     | 206 ++++++++---------
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi     | 206 ++++++++---------
 .../boot/dts/renesas/r8a774c0-cat874.dts      |   3 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi     | 164 +++++++-------
 arch/arm64/boot/dts/renesas/r8a7795.dtsi      | 214 +++++++++---------
 arch/arm64/boot/dts/renesas/r8a77960.dtsi     | 206 ++++++++---------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 206 ++++++++---------
 arch/arm64/boot/dts/renesas/r8a77970.dtsi     |  52 ++---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi     |  96 ++++----
 .../arm64/boot/dts/renesas/r8a77990-ebisu.dts |   6 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     | 164 +++++++-------
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     |  74 +++---
 .../boot/dts/renesas/salvator-common.dtsi     |   6 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi         |   3 +-
 41 files changed, 1514 insertions(+), 1543 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
