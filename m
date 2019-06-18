Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3304A515
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 17:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729204AbfFRPTa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 11:19:30 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:16165 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728572AbfFRPTa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 11:19:30 -0400
X-IronPort-AV: E=Sophos;i="5.62,389,1554735600"; 
   d="scan'208";a="18981214"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Jun 2019 00:19:28 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BBBB34006A86;
        Wed, 19 Jun 2019 00:19:25 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add HDMI encoder instance
Date:   Tue, 18 Jun 2019 16:18:38 +0100
Message-Id: <1560871119-16570-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the HDMI encoder to the R8A774A1 DT in disabled state.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
This patch depends on:
https://patchwork.kernel.org/patch/10995149/

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index d6dd4b6..a849ca7 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2397,6 +2397,37 @@
 			};
 		};
 
+		hdmi0: hdmi@fead0000 {
+			compatible = "renesas,r8a774a1-hdmi",
+				     "renesas,rcar-gen3-hdmi";
+			reg = <0 0xfead0000 0 0x10000>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 729>,
+				 <&cpg CPG_CORE R8A774A1_CLK_HDMI>;
+			clock-names = "iahb", "isfr";
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 729>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					dw_hdmi0_in: endpoint {
+						remote-endpoint = <&du_out_hdmi0>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+				};
+				port@2 {
+					/* HDMI sound */
+					reg = <2>;
+				};
+			};
+		};
+
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a774a1";
 			reg = <0 0xfeb00000 0 0x70000>;
@@ -2423,6 +2454,7 @@
 				port@1 {
 					reg = <1>;
 					du_out_hdmi0: endpoint {
+						remote-endpoint = <&dw_hdmi0_in>;
 					};
 				};
 				port@2 {
-- 
2.7.4

