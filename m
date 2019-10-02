Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC145C4B07
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 12:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfJBKJD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 06:09:03 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:55208 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726742AbfJBKJD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 06:09:03 -0400
X-IronPort-AV: E=Sophos;i="5.64,574,1559487600"; 
   d="scan'208";a="28103932"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Oct 2019 19:09:00 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 39D2342034EB;
        Wed,  2 Oct 2019 19:08:58 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 3/9] arm64: dts: renesas: r8a774b1: Add HDMI encoder instance
Date:   Wed,  2 Oct 2019 11:08:20 +0100
Message-Id: <1570010906-47486-4-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570010906-47486-1-git-send-email-biju.das@bp.renesas.com>
References: <1570010906-47486-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the HDMI encoder to the R8A774B1 DT in disabled state.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 V1-->V2
   * No change
   * Added Laurent's Reviewed-by tag.
---
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 777b45d..979be5a 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -1267,7 +1267,16 @@
 		};
 
 		hdmi0: hdmi@fead0000 {
+			compatible = "renesas,r8a774b1-hdmi",
+				     "renesas,rcar-gen3-hdmi";
 			reg = <0 0xfead0000 0 0x10000>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 729>,
+				 <&cpg CPG_CORE R8A774B1_CLK_HDMI>;
+			clock-names = "iahb", "isfr";
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 729>;
+			status = "disabled";
 
 			ports {
 				#address-cells = <1>;
@@ -1276,11 +1285,16 @@
 				port@0 {
 					reg = <0>;
 					dw_hdmi0_in: endpoint {
+						remote-endpoint = <&du_out_hdmi0>;
 					};
 				};
 				port@1 {
 					reg = <1>;
 				};
+				port@2 {
+					/* HDMI sound */
+					reg = <2>;
+				};
 			};
 		};
 
@@ -1310,6 +1324,7 @@
 				port@1 {
 					reg = <1>;
 					du_out_hdmi0: endpoint {
+						remote-endpoint = <&dw_hdmi0_in>;
 					};
 				};
 				port@2 {
-- 
2.7.4

