Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBBA12D96A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Dec 2019 15:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfLaOQq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Dec 2019 09:16:46 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:59258 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfLaOQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Dec 2019 09:16:46 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id keGj2100N5USYZQ06eGkQg; Tue, 31 Dec 2019 15:16:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1imIKB-00065H-Sm; Tue, 31 Dec 2019 15:16:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1imIKB-0008EY-RC; Tue, 31 Dec 2019 15:16:43 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: Group tuples in operating-points properties
Date:   Tue, 31 Dec 2019 15:16:42 +0100
Message-Id: <20191231141642.31609-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To improve human readability and enable automatic validation, the tuples
in the "operating-points" properties of CPU nodes should be grouped.

Fix this by grouping the tuples of these properties using angle brackets
in the DTS files for all Renesas SoCs that don't already do so.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a73a4-ape6evm.dts | 7 ++-----
 arch/arm/boot/dts/sh73a0-kzm9g.dts    | 9 +++------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
index 1fbf45082726af36..9eea57d069c227a7 100644
--- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
@@ -238,11 +238,8 @@
 
 &cpu0 {
 	cpu0-supply = <&vdd_dvfs>;
-	operating-points = <
-		/* kHz  uV */
-		1950000 1115000
-		1462500  995000
-	>;
+	operating-points = <1950000 1115000>,	/* kHz  uV */
+			   <1462500  995000>;
 	voltage-tolerance = <1>; /* 1% */
 };
 
diff --git a/arch/arm/boot/dts/sh73a0-kzm9g.dts b/arch/arm/boot/dts/sh73a0-kzm9g.dts
index 5fa9d3d9cd36a146..1c9dfe9f10e552da 100644
--- a/arch/arm/boot/dts/sh73a0-kzm9g.dts
+++ b/arch/arm/boot/dts/sh73a0-kzm9g.dts
@@ -25,12 +25,9 @@
 	cpus {
 		cpu@0 {
 			cpu0-supply = <&vdd_dvfs>;
-			operating-points = <
-				/* kHz  uV */
-				1196000 1315000
-				 598000 1175000
-				 398667 1065000
-			>;
+			operating-points = <1196000 1315000>,	/* kHz  uV */
+					   < 598000 1175000>,
+					   < 398667 1065000>;
 			voltage-tolerance = <1>; /* 1% */
 		};
 	};
-- 
2.17.1

