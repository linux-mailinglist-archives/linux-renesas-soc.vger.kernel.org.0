Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C2C3FE6A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Sep 2021 02:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233571AbhIAXyi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 19:54:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53848 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhIAXyh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 19:54:37 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 683451544;
        Thu,  2 Sep 2021 01:53:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630540416;
        bh=NbhF6WzQJ9BKxrEgoIvu6phF4AkR/Rg1lsS5nZtesiA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oM/M31prNq/HZdff/YRxYqFQI1yCe1oMw0mDfcVO4QuHULl1hbEnN2tt9BKi7XI1S
         tNcni2I8wl8FVP4jSzuKEsXwyCVUyNLf78oAGkMZxCg9/z/t/AxfhHFY+KlOot+b5W
         02UTnG2bel0KkPELCqAb5F43AU39k9GfG/ry3HII=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] arm64: dts: renesas: r8a779a0: Add DSI encoders
Date:   Thu,  2 Sep 2021 00:53:29 +0100
Message-Id: <20210901235330.1611086-3-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901235330.1611086-1-kieran.bingham@ideasonboard.com>
References: <20210901235330.1611086-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Provide the two MIPI DSI encoders on the V3U and connect them to the DU
accordingly.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v2
 - Fixup indentation

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 60 +++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 3241f7e7c01e..1ce9884ea527 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1161,12 +1161,72 @@ ports {
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
+				 <&cpg CPG_CORE R8A779A0_CLK_DSI>;
+			clock-names = "fck", "dsi";
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
+			clocks = <&cpg CPG_MOD 416>,
+				 <&cpg CPG_CORE R8A779A0_CLK_DSI>;
+			clock-names = "fck", "dsi";
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

