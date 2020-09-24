Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0F2276B65
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Sep 2020 10:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgIXIFp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Sep 2020 04:05:45 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:63049 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727013AbgIXIFo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Sep 2020 04:05:44 -0400
X-IronPort-AV: E=Sophos;i="5.77,296,1596466800"; 
   d="scan'208";a="58035686"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Sep 2020 17:05:40 +0900
Received: from localhost.localdomain (unknown [172.29.53.102])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C80874205335;
        Thu, 24 Sep 2020 17:05:38 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure
Date:   Thu, 24 Sep 2020 09:05:35 +0100
Message-Id: <20200924080535.3641-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per the iWave RZ/G1M schematic, the signal LVDS_PPEN controls supply
voltage for touch panel, LVDS receiver and RGB LCD panel. Add regulator
for these device nodes and remove powerdown-gpios property from
lvds-receiver node as it results in touch controller driver probe failure.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v4->v5 : Restored Laurent's Rb tag, since it is minor change, renaming vcc-supply to power-supply

v3->v4 : Incorporated Laurent's review comments(https://patchwork.kernel.org/patch/11707887/)
         Added Laurent's Reviewed-by tag
v2->v3 : Added the missing part from the patch. removal of powerdown-gpios property.
v1->v2 : Add regulator in touch panel, LVDS receiver and RGB LCD panel device nodes
           (Ref: https://patchwork.kernel.org/patch/11707559/)
v1 : https://patchwork.kernel.org/patch/11705819/
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index ebbe1518ef8a..63cafd220dba 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -57,7 +57,7 @@
 
 	lvds-receiver {
 		compatible = "ti,ds90cf384a", "lvds-decoder";
-		powerdown-gpios = <&gpio7 25 GPIO_ACTIVE_LOW>;
+		power-supply = <&vcc_3v3_tft1>;
 
 		ports {
 			#address-cells = <1>;
@@ -81,6 +81,7 @@
 	panel {
 		compatible = "edt,etm0700g0dh6";
 		backlight = <&lcd_backlight>;
+		power-supply = <&vcc_3v3_tft1>;
 
 		port {
 			panel_in: endpoint {
@@ -113,6 +114,17 @@
 		};
 	};
 
+	vcc_3v3_tft1: regulator-panel {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vcc-3v3-tft1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		startup-delay-us = <500>;
+		gpio = <&gpio7 25 GPIO_ACTIVE_HIGH>;
+	};
+
 	vcc_sdhi1: regulator-vcc-sdhi1 {
 		compatible = "regulator-fixed";
 
@@ -207,6 +219,7 @@
 		reg = <0x38>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vcc_3v3_tft1>;
 	};
 };
 
-- 
2.17.1

