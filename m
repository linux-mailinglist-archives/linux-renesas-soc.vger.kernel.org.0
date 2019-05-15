Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8B61F3F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 14:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbfEOMRC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 08:17:02 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:51323 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728217AbfEOMRB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 08:17:01 -0400
X-IronPort-AV: E=Sophos;i="5.60,472,1549897200"; 
   d="scan'208";a="15816073"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2019 21:16:59 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 605D04003864;
        Wed, 15 May 2019 21:16:56 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v6 7/7] arm64: dts: renesas: r8a774c0-cat874: Enable usb role switch support
Date:   Wed, 15 May 2019 13:09:12 +0100
Message-Id: <1557922152-16449-8-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables TI HD3SS3220 device and support usb role switch
for the CAT 874 platform.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V5-->V6
  * No change
V4-->V5
  * No change
V3-->V4
  * No change
V2-->V3
  * Used "renesas,usb-role-switch" instead of generic "usb-role-switch"
    property
V1-->V2
  * New patch
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index b9ae7db..124ed58 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -85,6 +85,34 @@
 	clock-frequency = <48000000>;
 };
 
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	hd3ss3220@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+		};
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hd3ss3220_ep: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&usb3peri_role_switch>;
+			};
+		};
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins>;
 	pinctrl-names = "default";
@@ -175,6 +203,17 @@
 &usb3_peri0 {
 	companion = <&xhci0>;
 	status = "okay";
+	usb-role-switch;
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usb3peri_role_switch: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&hd3ss3220_ep>;
+		};
+	};
 };
 
 &xhci0 {
-- 
2.7.4

