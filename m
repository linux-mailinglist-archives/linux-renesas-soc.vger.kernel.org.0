Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 127C6461C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 16:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbfFNOz5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 10:55:57 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:34518 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728272AbfFNOz5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 10:55:57 -0400
X-IronPort-AV: E=Sophos;i="5.62,373,1554735600"; 
   d="scan'208";a="18682009"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Jun 2019 23:55:55 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2ED0141C18DB;
        Fri, 14 Jun 2019 23:55:52 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: hihope-common: Enable USB3.0
Date:   Fri, 14 Jun 2019 15:51:09 +0100
Message-Id: <1560523869-56668-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables USB3.0 host/peripheral device node for the HiHope
RZ/G2M board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch depend on [1]
[1]. https://patchwork.kernel.org/patch/10995323/
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 18763ca..6a45c49 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -150,6 +150,11 @@
 			bias-pull-up;
 		};
 	};
+
+	usb30_pins: usb30 {
+		groups = "usb30";
+		function = "usb30";
+	};
 };
 
 &rwdt {
@@ -213,3 +218,27 @@
 
 	status = "okay";
 };
+
+&usb3_peri0 {
+	phys = <&usb3_phy0>;
+	phy-names = "usb";
+
+	companion = <&xhci0>;
+
+	status = "okay";
+};
+
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3s0_clk {
+	clock-frequency = <100000000>;
+};
+
+&xhci0 {
+	pinctrl-0 = <&usb30_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.7.4

