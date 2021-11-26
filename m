Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B6D45EAF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 11:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376604AbhKZKFY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 05:05:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376718AbhKZKDX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 05:03:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2277C061379;
        Fri, 26 Nov 2021 01:54:51 -0800 (PST)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6C551269;
        Fri, 26 Nov 2021 10:54:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637920490;
        bh=rsbrKVt3Utv0L/6U7sAR0uWYaMAYbQNm0kLvejLepNo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mynm4jClVjh8MCo51TLKVddB3BT4ptoyGbTNJEhFmpDnFqQoImeTJSiqRcP30uVwc
         3EuMXBwJ7eNaMRMIaKzAkJXmKx1uYWJLJJTgJY9KFBI1vamg4kW5l5ASmdAxF+FaAO
         HSlDk/Fjx4nr3drOR9S8G0mRXhxW/llHnq0v1CXU=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/4] arm64: dts: renesas: r8a779a0: Add DSI encoders
Date:   Fri, 26 Nov 2021 09:54:43 +0000
Message-Id: <20211126095445.932930-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211126095445.932930-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211126095445.932930-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

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

-v4:
 - Use the correct pll clocks.


This is still pending approval/integration of the DSI encoder bindings
at [0]

[0] https://lore.kernel.org/all/YQGFP%2FcFoSksPyn+@pendragon.ideasonboard.com/

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 64 +++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 483bb971c3ca..fdad8bc4a069 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -2622,12 +2622,76 @@ ports {
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
+				 <&cpg CPG_CORE R8A779A0_CLK_CL16MCK>;
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
+				 <&cpg CPG_CORE R8A779A0_CLK_CL16MCK>;
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

