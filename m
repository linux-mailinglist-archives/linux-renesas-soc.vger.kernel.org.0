Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464947BAEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 09:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbfGaHsM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 03:48:12 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:46134 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfGaHsL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 03:48:11 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id jKo92000f05gfCL01Ko9gb; Wed, 31 Jul 2019 09:48:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsjLF-0006wj-Kh; Wed, 31 Jul 2019 09:48:09 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsjLF-0001Un-JA; Wed, 31 Jul 2019 09:48:09 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name
Date:   Wed, 31 Jul 2019 09:48:01 +0200
Message-Id: <20190731074801.5706-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731073744.13963-1-geert+renesas@glider.be>
References: <20190731073744.13963-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently there are two nodes named "regulator1" in the Draak DTS: a
3.3V regulator for the eMMC and the LVDS decoder, and a 12V regulator
for the backlight.  This causes the former to be overwritten by the
latter.

Fix this by renaming all regulators with numerical suffixes to use named
suffixes, which are less likely to conflict.

Fixes: 4fbd4158fe8967e9 ("arm64: dts: renesas: r8a77995: draak: Add backlight")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I guess this is a fix for v5.3?

This fix takes a slightly different approach than commit
12105cec654cf906 ("arm64: dts: renesas: r8a77990: ebisu: Fix backlight
regulator numbering"), which just fixed the conflicting numerical
suffix.
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 0711170b26b1fe1c..3aa2564dfdc25fff 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -97,7 +97,7 @@
 		reg = <0x0 0x48000000 0x0 0x18000000>;
 	};
 
-	reg_1p8v: regulator0 {
+	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -106,7 +106,7 @@
 		regulator-always-on;
 	};
 
-	reg_3p3v: regulator1 {
+	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
 		regulator-min-microvolt = <3300000>;
@@ -115,7 +115,7 @@
 		regulator-always-on;
 	};
 
-	reg_12p0v: regulator1 {
+	reg_12p0v: regulator-12p0v {
 		compatible = "regulator-fixed";
 		regulator-name = "D12.0V";
 		regulator-min-microvolt = <12000000>;
-- 
2.17.1

