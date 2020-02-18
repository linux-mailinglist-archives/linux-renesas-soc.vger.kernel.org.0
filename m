Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01FE816271F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2020 14:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgBRNaZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Feb 2020 08:30:25 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:40420 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgBRNaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 08:30:25 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id 4DWN2200a5USYZQ01DWNbV; Tue, 18 Feb 2020 14:30:22 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j42xC-0005cY-LV; Tue, 18 Feb 2020 14:30:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j42xC-0005oW-JV; Tue, 18 Feb 2020 14:30:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/4] arm: dts: renesas: Add reset control properties for display
Date:   Tue, 18 Feb 2020 14:30:15 +0100
Message-Id: <20200218133019.22299-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds reset control properties to the device nodes for
the Display Units on all supported R-Car Gen2 and Gen3, RZ/G1, and RZ/G2
SoCs.

Changes compared to v1:
  - Use "du.0" resp. "du.2" instead of "du.0-1" resp. "du.2-3",
  - Drop LVDS reset, as LVDS is now a separate node,
  - Extend from R-Car H3 to all supported R-Car Gen2/3, RZ/G1, RZ/G2.

I intend to queue this in renesas-devel for v5.7.
Thanks!

Geert Uytterhoeven (4):
  ARM: dts: rcar-gen2: Add reset control properties for display
  ARM: dts: rzg1: Add reset control properties for display
  arm64: dts: renesas: rcar-gen3: Add reset control properties for
    display
  arm64: dts: renesas: rzg2: Add reset control properties for display

 arch/arm/boot/dts/r8a7743.dtsi            | 5 +++--
 arch/arm/boot/dts/r8a7744.dtsi            | 5 +++--
 arch/arm/boot/dts/r8a7745.dtsi            | 2 ++
 arch/arm/boot/dts/r8a77470.dtsi           | 5 +++--
 arch/arm/boot/dts/r8a7790.dtsi            | 2 ++
 arch/arm/boot/dts/r8a7791.dtsi            | 5 +++--
 arch/arm/boot/dts/r8a7792.dtsi            | 5 +++--
 arch/arm/boot/dts/r8a7793.dtsi            | 5 +++--
 arch/arm/boot/dts/r8a7794.dtsi            | 2 ++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 5 +++--
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 5 +++--
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 5 +++--
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 8 ++++----
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 5 +++--
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 5 +++--
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 3 +--
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 3 +--
 19 files changed, 47 insertions(+), 30 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
