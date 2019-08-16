Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20CE690318
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 15:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfHPNd3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 09:33:29 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55206 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727246AbfHPNd3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 09:33:29 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B982B25BDF3;
        Fri, 16 Aug 2019 23:33:27 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B04079407A4; Fri, 16 Aug 2019 15:33:25 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/1] arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name
Date:   Fri, 16 Aug 2019 15:33:23 +0200
Message-Id: <45f5d5a9e34d3fe4140a9a3b5f7ebe86c252440a.1565962268.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1565962268.git.horms+renesas@verge.net.au>
References: <cover.1565962268.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

Currently there are two nodes named "regulator1" in the Draak DTS: a
3.3V regulator for the eMMC and the LVDS decoder, and a 12V regulator
for the backlight.  This causes the former to be overwritten by the
latter.

Fix this by renaming all regulators with numerical suffixes to use named
suffixes, which are less likely to conflict.

Fixes: 4fbd4158fe8967e9 ("arm64: dts: renesas: r8a77995: draak: Add backlight")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 0711170b26b1..3aa2564dfdc2 100644
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
2.11.0

