Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82264154F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 03:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238770AbhIWBFk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 21:05:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33828 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238728AbhIWBFk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 21:05:40 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A7FE146F;
        Thu, 23 Sep 2021 03:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632359048;
        bh=vtubVnyN/IFVUyscM8xZe8dSZqbaXbTsFGZ33uc67js=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lYlxvXpVs73lLzK1VP7aifmUfAI5YvwmkS52gEXjB3mXrLbQe8w7ZgIlIqEAcvbE4
         THLyvRuvnQqrcgx6Lg3BNoJIdGqFGQUcicECQvByccC6sRbYSAPoIYnB1udyva/cZC
         n9gLhQifEWlJojhgXS7BH3m+euV6eyRT9O3YjUF4=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/3] arm64: dts: renesas: r8a779a0: Add DSI encoders
Date:   Thu, 23 Sep 2021 02:04:01 +0100
Message-Id: <20210923010402.3418555-3-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210923010402.3418555-1-kieran.bingham@ideasonboard.com>
References: <20210923010402.3418555-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Provide the two MIPI DSI encoders on the V3U and connect them to the DU
accordingly.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
v2
 - Fixup indentation

v3
 - Fix the clock references
 - Fixup dsi1 as well

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 64 +++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index dfe99af89908..b81b2391ed29 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1270,12 +1270,76 @@ ports {
 				port@0 {
 					reg = <0>;
 					du_out_dsi0: endpoint {
+						remote-endpoint = <&dsi0_in>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 					du_out_dsi1: endpoint {
+						remote-endpoint = <&dsi1_in>;
+					};
+				};
+			};
+		};
+
+		dsi0: dsi-encoder@fed80000 {
+			compatible = "renesas,r8a779a0-dsi-csi2-tx";
+			reg = <0 0xfed80000 0 0x10000>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 415>,
+				 <&cpg CPG_CORE R8A779A0_CLK_DSI>,
+				 <&extal_clk>;
+			clock-names = "fck", "dsi", "pll";
+
+			resets = <&cpg 415>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi0_in: endpoint {
+						remote-endpoint = <&du_out_dsi0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi0_out: endpoint {
+					};
+				};
+			};
+		};
+
+		dsi1: dsi-encoder@fed90000 {
+			compatible = "renesas,r8a779a0-dsi-csi2-tx";
+			reg = <0 0xfed90000 0 0x10000>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 415>,
+				 <&cpg CPG_CORE R8A779A0_CLK_DSI>,
+				 <&extal_clk>;
+			clock-names = "fck", "dsi", "pll";
+
+			resets = <&cpg 416>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi1_in: endpoint {
+						remote-endpoint = <&du_out_dsi1>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi1_out: endpoint {
 					};
 				};
 			};
-- 
2.30.2

