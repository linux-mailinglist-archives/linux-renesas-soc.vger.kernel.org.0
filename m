Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8445119210C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 07:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgCYGYk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 02:24:40 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53834 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725939AbgCYGYj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 02:24:39 -0400
X-IronPort-AV: E=Sophos;i="5.72,303,1580742000"; 
   d="scan'208";a="42786380"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Mar 2020 15:24:37 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D83E74000FAF;
        Wed, 25 Mar 2020 15:24:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 2/2] arm64: dts: renesas: add USB3.0 device nodes for r8a77961
Date:   Wed, 25 Mar 2020 15:24:30 +0900
Message-Id: <1585117470-8625-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585117470-8625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1585117470-8625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds USB3.0 related device nodes for r8a77961 (R-Car M3-W+).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index d3e0861..de27b2f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -678,9 +678,16 @@
 		};
 
 		usb3_phy0: usb-phy@e65ee000 {
+			compatible = "renesas,r8a77961-usb3-phy",
+				     "renesas,rcar-gen3-usb3-phy";
 			reg = <0 0xe65ee000 0 0x90>;
+			clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>,
+				 <&usb_extal_clk>;
+			clock-names = "usb3-if", "usb3s_clk", "usb_extal";
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 328>;
 			#phy-cells = <0>;
-			/* placeholder */
+			status = "disabled";
 		};
 
 		arm_cc630p: crypto@e6601000 {
@@ -929,13 +936,25 @@
 		};
 
 		xhci0: usb@ee000000 {
+			compatible = "renesas,xhci-r8a77961",
+				     "renesas,rcar-gen3-xhci";
 			reg = <0 0xee000000 0 0xc00>;
-			/* placeholder */
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 328>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 328>;
+			status = "disabled";
 		};
 
 		usb3_peri0: usb@ee020000 {
+			compatible = "renesas,r8a77961-usb3-peri",
+				     "renesas,rcar-gen3-usb3-peri";
 			reg = <0 0xee020000 0 0x400>;
-			/* placeholder */
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 328>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 328>;
+			status = "disabled";
 		};
 
 		ohci0: usb@ee080000 {
-- 
2.7.4

