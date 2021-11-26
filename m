Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7917D45EAF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 11:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376571AbhKZKFU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 05:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376709AbhKZKDS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 05:03:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294CFC0613F8;
        Fri, 26 Nov 2021 01:54:51 -0800 (PST)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FBD41253;
        Fri, 26 Nov 2021 10:54:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637920489;
        bh=DnWJvl713MQAX3YFygjk12TSSxCTHU6eKoungwGuokg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LJusxTtzttw05xaBDe4CDwqWGcTOPs1NWqv0RlfhUUkB16etEfYsLM/52Mx8AwFfG
         wVIjj92GZedU7KPlDM7TeKYf4gx5rtecbqPs+FHR+2fSQaeSAKOQSxe2YEnNCHEeno
         Y5Tf0yxwQaZiijXtnXyPlemWCNv5NMgnx4NlDqQo=
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
Subject: [PATCH v4 1/4] arm64: dts: renesas: r8a779a0: Add DU support
Date:   Fri, 26 Nov 2021 09:54:42 +0000
Message-Id: <20211126095445.932930-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211126095445.932930-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211126095445.932930-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Provide the device nodes for the DU on the V3U platforms.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
v2
 - Use a single clock specification for the whole DU.

v3:
 - Use 'du.0' clock name instead of 'du'

v4:
 - Add in missing reset-names
 - Use full renesas,vsps


 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 9e085d635100..483bb971c3ca 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -2601,6 +2601,38 @@ isp3vin31: endpoint {
 			};
 		};
 
+		du: display@feb00000 {
+			compatible = "renesas,du-r8a779a0";
+			reg = <0 0xfeb00000 0 0x40000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 411>;
+			clock-names = "du.0";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 411>;
+			reset-names = "du.0";
+			renesas,vsps = <&vspd0 0>, <&vspd1 0>;
+
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

