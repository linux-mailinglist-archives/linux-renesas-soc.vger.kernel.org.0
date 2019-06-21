Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524514E32E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbfFUJRc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:17:32 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJRc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:17:32 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8266325BEBB;
        Fri, 21 Jun 2019 19:16:39 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1A54B94353B; Fri, 21 Jun 2019 11:16:36 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 51/53] arm64: dts: renesas: r8a774a1: Add HDMI encoder instance
Date:   Fri, 21 Jun 2019 11:16:29 +0200
Message-Id: <8c965642354950cd17d1edff57fd5ca965040517.1561107232.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Add the HDMI encoder to the R8A774A1 DT in disabled state.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index b437edc04712..f209457c7807 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2368,6 +2368,37 @@
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
@@ -2394,6 +2425,7 @@
 				port@1 {
 					reg = <1>;
 					du_out_hdmi0: endpoint {
+						remote-endpoint = <&dw_hdmi0_in>;
 					};
 				};
 				port@2 {
-- 
2.11.0

