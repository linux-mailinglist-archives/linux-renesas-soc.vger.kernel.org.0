Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CED22F5AD4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 07:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbhANGpl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 01:45:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbhANGpl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 01:45:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AFEC061795;
        Wed, 13 Jan 2021 22:45:00 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF6322B3;
        Thu, 14 Jan 2021 07:44:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610606699;
        bh=RVLfJ1fqe9E6dvJ354lLrdtA9y4flhCaUbY0KfNQPIc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fkCL870ueVnHS4j7M698fkYRfJpG4MPFLQKTEt5G0b8ZL7o/pOm2087fmdxgfd7QB
         1Jrka6dBYzIy/JNPbtHEeRaVp0Rr9/CDytaCw8zCoDFwebqpfmNReBZTw2bIgnPcuc
         3WTUScRPFVAS0dj/PnWOKwoc5j9g+UsTESt7Qfhs=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sandy Huang <hjc@rock-chips.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Yao <markyao0591@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 1/7] ARM: dts: imx6q(dl): Move 'port' nodes under 'ports' for HDMI encoder
Date:   Thu, 14 Jan 2021 08:44:31 +0200
Message-Id: <20210114064437.5793-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In preparation for the conversion of the DWC HDMI TX device tree
bindings to YAML, move the HDMI encoder's 'port' nodes under a 'ports'
node. The 'ports' node is optional in the OF graph implementation, but
YAML bindings require it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/imx6q.dtsi   | 20 +++++++++++---------
 arch/arm/boot/dts/imx6qdl.dtsi | 25 ++++++++++++++-----------
 2 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index 5277e3903291..8d209c1b3ca7 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -406,19 +406,21 @@ ipu2_csi1_mux_to_ipu2_csi1: endpoint {
 &hdmi {
 	compatible = "fsl,imx6q-hdmi";
 
-	port@2 {
-		reg = <2>;
+	ports {
+		port@2 {
+			reg = <2>;
 
-		hdmi_mux_2: endpoint {
-			remote-endpoint = <&ipu2_di0_hdmi>;
+			hdmi_mux_2: endpoint {
+				remote-endpoint = <&ipu2_di0_hdmi>;
+			};
 		};
-	};
 
-	port@3 {
-		reg = <3>;
+		port@3 {
+			reg = <3>;
 
-		hdmi_mux_3: endpoint {
-			remote-endpoint = <&ipu2_di1_hdmi>;
+			hdmi_mux_3: endpoint {
+				remote-endpoint = <&ipu2_di1_hdmi>;
+			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 6f59a99cbe82..82e01ce026ea 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -182,8 +182,6 @@ gpmi: nand-controller@112000 {
 		};
 
 		hdmi: hdmi@120000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			reg = <0x00120000 0x9000>;
 			interrupts = <0 115 0x04>;
 			gpr = <&gpr>;
@@ -192,19 +190,24 @@ hdmi: hdmi@120000 {
 			clock-names = "iahb", "isfr";
 			status = "disabled";
 
-			port@0 {
-				reg = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-				hdmi_mux_0: endpoint {
-					remote-endpoint = <&ipu1_di0_hdmi>;
+				port@0 {
+					reg = <0>;
+
+					hdmi_mux_0: endpoint {
+						remote-endpoint = <&ipu1_di0_hdmi>;
+					};
 				};
-			};
 
-			port@1 {
-				reg = <1>;
+				port@1 {
+					reg = <1>;
 
-				hdmi_mux_1: endpoint {
-					remote-endpoint = <&ipu1_di1_hdmi>;
+					hdmi_mux_1: endpoint {
+						remote-endpoint = <&ipu1_di1_hdmi>;
+					};
 				};
 			};
 		};
-- 
Regards,

Laurent Pinchart

