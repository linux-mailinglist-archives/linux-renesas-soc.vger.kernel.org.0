Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484F43FE69A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Sep 2021 02:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbhIAXyh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 19:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhIAXyg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 19:54:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2DFC061757;
        Wed,  1 Sep 2021 16:53:37 -0700 (PDT)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD1421516;
        Thu,  2 Sep 2021 01:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630540416;
        bh=e2on+6nnHUEaEoE7ujMr2rV+rbpLzkiDLzQOxlXzjeQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T1gew15VmhIrU5rnBi3DMJk4QpG/bjcVk6CRxujz0GiL23l3x/smv0+fKLHoEPWUo
         ELj3Gudei9DDPC8QWEG4f8Hl9hH4F1RL5bU41b4U3MWHZ18sYTJpBVfS7Az7QR5dLX
         arYymdLEBecRomw28Zejg5iCZpPdgL6lVgnwMnms=
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
Subject: [PATCH v2 1/3] arm64: dts: renesas: r8a779a0: Add DU support
Date:   Thu,  2 Sep 2021 00:53:28 +0100
Message-Id: <20210901235330.1611086-2-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901235330.1611086-1-kieran.bingham@ideasonboard.com>
References: <20210901235330.1611086-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Provide the device nodes for the DU on the V3U platforms.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v2
 - Use a single clock specification for the whole DU.

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 631d520cebee..3241f7e7c01e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1142,6 +1142,36 @@ vspd1: vsp@fea28000 {
 			renesas,fcp = <&fcpvd1>;
 		};
 
+		du: display@feb00000 {
+			compatible = "renesas,du-r8a779a0";
+			reg = <0 0xfeb00000 0 0x40000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 411>;
+			clock-names = "du";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 411>;
+			vsps = <&vspd0 0>, <&vspd1 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_dsi0: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					du_out_dsi1: endpoint {
+					};
+				};
+			};
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.30.2

