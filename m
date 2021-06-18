Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 169423ACA63
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 13:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234245AbhFRLuN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 07:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbhFRLuN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 07:50:13 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE9CC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 04:48:03 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:104a:f93d:b771:fc40])
        by baptiste.telenet-ops.be with bizsmtp
        id Jbo12500X47PYg101bo1Mv; Fri, 18 Jun 2021 13:48:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1luCyf-000z2x-DT; Fri, 18 Jun 2021 13:48:01 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1luCyf-007L9Q-19; Fri, 18 Jun 2021 13:48:01 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Chris Paterson <Chris.Paterson2@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: rzg2: Rename i2c_dvfs to iic_pmic
Date:   Fri, 18 Jun 2021 13:47:59 +0200
Message-Id: <3fee803a7464a3243e62a943a6a5dce8f1c65a2d.1624016811.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As RZ/G2 SoCs do not support DVFS, the "iic-dvfs" module was renamed to
"iic-pmic" in the RZ/G Series, 2nd Generation User’s Manual: Hardware
Rev. 1.00.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.15.

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 78c121a89f11b8ae..6f4fffacfca21b7f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -25,7 +25,7 @@ aliases {
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
-		i2c7 = &i2c_dvfs;
+		i2c7 = &iic_pmic;
 	};
 
 	/*
@@ -715,7 +715,7 @@ i2c6: i2c@e66e8000 {
 			status = "disabled";
 		};
 
-		i2c_dvfs: i2c@e60b0000 {
+		iic_pmic: i2c@e60b0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "renesas,iic-r8a774a1",
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 28c612ce49c0ffba..0f7bdfc90a0dc325 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -588,7 +588,7 @@ i2c6: i2c@e66e8000 {
 			status = "disabled";
 		};
 
-		i2c_dvfs: i2c@e60b0000 {
+		iic_pmic: i2c@e60b0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "renesas,iic-r8a774b1",
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 0b0f871bac1cb116..d597772c4c37e970 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -574,7 +574,7 @@ i2c7: i2c@e6690000 {
 			status = "disabled";
 		};
 
-		i2c_dvfs: i2c@e60b0000 {
+		iic_pmic: i2c@e60b0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "renesas,iic-r8a774c0",
-- 
2.25.1

