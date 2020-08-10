Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE65C240895
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 17:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgHJPWl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 11:22:41 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:5536 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728224AbgHJPWi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 11:22:38 -0400
X-IronPort-AV: E=Sophos;i="5.75,457,1589209200"; 
   d="scan'208";a="54088471"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Aug 2020 00:22:37 +0900
Received: from localhost.localdomain (unknown [172.29.52.120])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D06DF4001962;
        Tue, 11 Aug 2020 00:22:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] ARM: dts: iwg20d-q7-common: Fix touch controller probe failure
Date:   Mon, 10 Aug 2020 16:22:19 +0100
Message-Id: <20200810152219.6254-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per the iWave RZ/G1M schematic, the signal LVDS_PPEN controls supply
voltage for touch panel, LVDS receiver and RGB LCD panel. Add regulator
for these device nodes and remove powerdown-gpios property from
lvds-receiver node as it results in touch controller driver probe failure.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 v1->v2 : Add regulator in touch panel, LVDS receiver and RGB LCD panel device nodes
 v1 : https://patchwork.kernel.org/patch/11705819/
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index 4c8b9a6b0125..056f93119d8a 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -57,6 +57,7 @@
 
 	lvds-receiver {
 		compatible = "ti,ds90cf384a", "lvds-decoder";
+		vcc-supply = <&vcc_3v3_tft1>;
 
 		ports {
 			#address-cells = <1>;
@@ -80,6 +81,7 @@
 	panel {
 		compatible = "edt,etm0700g0dh6";
 		backlight = <&lcd_backlight>;
+		power-supply = <&vcc_3v3_tft1>;
 
 		port {
 			panel_in: endpoint {
@@ -112,6 +114,17 @@
 		};
 	};
 
+	vcc_3v3_tft1: regulator-panel {
+		compatible = "regulator-fixed";
+
+		regulator-name = "Panel Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		startup-delay-us = <70000>;
+		gpio = <&gpio7 25 GPIO_ACTIVE_HIGH>;
+	};
+
 	vcc_sdhi1: regulator-vcc-sdhi1 {
 		compatible = "regulator-fixed";
 
@@ -206,6 +219,7 @@
 		reg = <0x38>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vcc_3v3_tft1>;
 	};
 };
 
-- 
2.17.1

