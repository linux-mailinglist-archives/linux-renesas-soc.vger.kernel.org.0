Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5444E30C66
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2019 12:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbfEaKIL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 May 2019 06:08:11 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:20229 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726331AbfEaKIK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 May 2019 06:08:10 -0400
X-IronPort-AV: E=Sophos;i="5.60,534,1549897200"; 
   d="scan'208";a="17276127"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 May 2019 19:08:08 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 94ABF42251C9;
        Fri, 31 May 2019 19:08:05 +0900 (JST)
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
Subject: [PATCH v7 7/7] arm64: dts: renesas: cat874: Enable usb role switch support
Date:   Fri, 31 May 2019 11:00:00 +0100
Message-Id: <1559296800-5610-8-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables TI HD3SS3220 device and support usb role switch
for the CAT 874 platform.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V6-->V7
  * Updated as per the binding.
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
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index fbeece1..46a77ee 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -172,6 +172,31 @@
 	status = "okay";
 	clock-frequency = <100000>;
 
+	hd3ss3220@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+					hd3ss3220_ep: endpoint {
+						remote-endpoint = <&usb3_role_switch>;
+					};
+				};
+			};
+		};
+	};
+
 	tda19988: tda19988@70 {
 		compatible = "nxp,tda998x";
 		reg = <0x70>;
@@ -370,6 +395,13 @@
 &usb3_peri0 {
 	companion = <&xhci0>;
 	status = "okay";
+	usb-role-switch;
+
+	port {
+		usb3_role_switch: endpoint {
+			remote-endpoint = <&hd3ss3220_ep>;
+		};
+	};
 };
 
 &xhci0 {
-- 
2.7.4

