Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 718165B8A9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Sep 2022 16:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiINOdu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Sep 2022 10:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbiINOds (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 10:33:48 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A905F999
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2022 07:33:45 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:e925:8cbe:2e99:b03b])
        by andre.telenet-ops.be with bizsmtp
        id KqZi2800w3vs4GX01qZilP; Wed, 14 Sep 2022 16:33:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oYTSQ-005B5L-5B; Wed, 14 Sep 2022 16:33:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oYTH1-000zCl-JW; Wed, 14 Sep 2022 16:21:55 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: Fix USB PHY device and child node names
Date:   Wed, 14 Sep 2022 16:21:54 +0200
Message-Id: <6442b4042e26537abc8632c4772f8201685f1f1f.1663165098.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

make dtbs_check:

    usb-phy@e6590100: '#phy-cells' is a required property
	    From schema: dtschema/schemas/phy/phy-provider.yaml

The R-Car Gen2 USB PHY device nodes do not represent USB PHYs
theirselves, and thus do not have "#phy-cells" properties.  Fix the
warning by renaming them from "usb-phy" to "usb-phy-controller".
Rename their child nodes from "usb-channel" to "usb-phy", as these do
represent USB PHYs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
See also "[PATCH v2] dt-bindings: phy: renesas,rcar-gen2-usb-phy:
Convert to json-schema"
https://lore.kernel.org/r/dbdcffd009302734fe2fb895ce04b72fa1ea4355.1663165000.git.geert+renesas@glider.be

 arch/arm/boot/dts/r8a7742.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a7743.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a7744.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a7745.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a77470.dtsi | 8 ++++----
 arch/arm/boot/dts/r8a7790.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a7791.dtsi  | 6 +++---
 arch/arm/boot/dts/r8a7794.dtsi  | 6 +++---
 8 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
index 420e0b3259d48de6..758a1bf02fae9a15 100644
--- a/arch/arm/boot/dts/r8a7742.dtsi
+++ b/arch/arm/boot/dts/r8a7742.dtsi
@@ -633,7 +633,7 @@ hsusb: usb@e6590000 {
 			status = "disabled";
 		};
 
-		usbphy: usb-phy@e6590100 {
+		usbphy: usb-phy-controller@e6590100 {
 			compatible = "renesas,usb-phy-r8a7742",
 				     "renesas,rcar-gen2-usb-phy";
 			reg = <0 0xe6590100 0 0x100>;
@@ -645,11 +645,11 @@ usbphy: usb-phy@e6590100 {
 			resets = <&cpg 704>;
 			status = "disabled";
 
-			usb0: usb-channel@0 {
+			usb0: usb-phy@0 {
 				reg = <0>;
 				#phy-cells = <1>;
 			};
-			usb2: usb-channel@2 {
+			usb2: usb-phy@2 {
 				reg = <2>;
 				#phy-cells = <1>;
 			};
diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index c0c145a5fe8da52a..20f1d98a048dc1af 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -584,7 +584,7 @@ hsusb: usb@e6590000 {
 			status = "disabled";
 		};
 
-		usbphy: usb-phy@e6590100 {
+		usbphy: usb-phy-controller@e6590100 {
 			compatible = "renesas,usb-phy-r8a7743",
 				     "renesas,rcar-gen2-usb-phy";
 			reg = <0 0xe6590100 0 0x100>;
@@ -596,11 +596,11 @@ usbphy: usb-phy@e6590100 {
 			resets = <&cpg 704>;
 			status = "disabled";
 
-			usb0: usb-channel@0 {
+			usb0: usb-phy@0 {
 				reg = <0>;
 				#phy-cells = <1>;
 			};
-			usb2: usb-channel@2 {
+			usb2: usb-phy@2 {
 				reg = <2>;
 				#phy-cells = <1>;
 			};
diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 3f4fb53dd6df1696..96b2d5a4e8f64bd6 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -584,7 +584,7 @@ hsusb: usb@e6590000 {
 			status = "disabled";
 		};
 
-		usbphy: usb-phy@e6590100 {
+		usbphy: usb-phy-controller@e6590100 {
 			compatible = "renesas,usb-phy-r8a7744",
 				     "renesas,rcar-gen2-usb-phy";
 			reg = <0 0xe6590100 0 0x100>;
@@ -596,11 +596,11 @@ usbphy: usb-phy@e6590100 {
 			resets = <&cpg 704>;
 			status = "disabled";
 
-			usb0: usb-channel@0 {
+			usb0: usb-phy@0 {
 				reg = <0>;
 				#phy-cells = <1>;
 			};
-			usb2: usb-channel@2 {
+			usb2: usb-phy@2 {
 				reg = <2>;
 				#phy-cells = <1>;
 			};
diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index fe8e98a66d93ebc8..afc902e532d8d45a 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -525,7 +525,7 @@ hsusb: usb@e6590000 {
 			status = "disabled";
 		};
 
-		usbphy: usb-phy@e6590100 {
+		usbphy: usb-phy-controller@e6590100 {
 			compatible = "renesas,usb-phy-r8a7745",
 				     "renesas,rcar-gen2-usb-phy";
 			reg = <0 0xe6590100 0 0x100>;
@@ -537,11 +537,11 @@ usbphy: usb-phy@e6590100 {
 			resets = <&cpg 704>;
 			status = "disabled";
 
-			usb0: usb-channel@0 {
+			usb0: usb-phy@0 {
 				reg = <0>;
 				#phy-cells = <1>;
 			};
-			usb2: usb-channel@2 {
+			usb2: usb-phy@2 {
 				reg = <2>;
 				#phy-cells = <1>;
 			};
diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index c90f2a2702146701..a5cf663a0118ee1d 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -357,7 +357,7 @@ hsusb0: hsusb@e6590000 {
 			status = "disabled";
 		};
 
-		usbphy0: usb-phy@e6590100 {
+		usbphy0: usb-phy-controller@e6590100 {
 			compatible = "renesas,usb-phy-r8a77470",
 				     "renesas,rcar-gen2-usb-phy";
 			reg = <0 0xe6590100 0 0x100>;
@@ -369,7 +369,7 @@ usbphy0: usb-phy@e6590100 {
 			resets = <&cpg 704>;
 			status = "disabled";
 
-			usb0: usb-channel@0 {
+			usb0: usb-phy@0 {
 				reg = <0>;
 				#phy-cells = <1>;
 			};
@@ -393,7 +393,7 @@ hsusb1: hsusb@e6598000 {
 			status = "disabled";
 		};
 
-		usbphy1: usb-phy@e6598100 {
+		usbphy1: usb-phy-controller@e6598100 {
 			compatible = "renesas,usb-phy-r8a77470",
 				     "renesas,rcar-gen2-usb-phy";
 			reg = <0 0xe6598100 0 0x100>;
@@ -405,7 +405,7 @@ usbphy1: usb-phy@e6598100 {
 			resets = <&cpg 706>;
 			status = "disabled";
 
-			usb1: usb-channel@0 {
+			usb1: usb-phy@0 {
 				reg = <0>;
 				#phy-cells = <1>;
 			};
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index a640488d513b2f53..db171e3c62f25eb8 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -654,7 +654,7 @@ hsusb: usb@e6590000 {
 			status = "disabled";
 		};
 
-		usbphy: usb-phy@e6590100 {
+		usbphy: usb-phy-controller@e6590100 {
 			compatible = "renesas,usb-phy-r8a7790",
 				     "renesas,rcar-gen2-usb-phy";
 			reg = <0 0xe6590100 0 0x100>;
@@ -666,11 +666,11 @@ usbphy: usb-phy@e6590100 {
 			resets = <&cpg 704>;
 			status = "disabled";
 
-			usb0: usb-channel@0 {
+			usb0: usb-phy@0 {
 				reg = <0>;
 				#phy-cells = <1>;
 			};
-			usb2: usb-channel@2 {
+			usb2: usb-phy@2 {
 				reg = <2>;
 				#phy-cells = <1>;
 			};
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 542ed0a71872959a..d8f91d9f42aeed8a 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -608,7 +608,7 @@ hsusb: usb@e6590000 {
 			status = "disabled";
 		};
 
-		usbphy: usb-phy@e6590100 {
+		usbphy: usb-phy-controller@e6590100 {
 			compatible = "renesas,usb-phy-r8a7791",
 				     "renesas,rcar-gen2-usb-phy";
 			reg = <0 0xe6590100 0 0x100>;
@@ -620,11 +620,11 @@ usbphy: usb-phy@e6590100 {
 			resets = <&cpg 704>;
 			status = "disabled";
 
-			usb0: usb-channel@0 {
+			usb0: usb-phy@0 {
 				reg = <0>;
 				#phy-cells = <1>;
 			};
-			usb2: usb-channel@2 {
+			usb2: usb-phy@2 {
 				reg = <2>;
 				#phy-cells = <1>;
 			};
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index b601ee6f7580b285..7aa781ff3bff6952 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -506,7 +506,7 @@ hsusb: usb@e6590000 {
 			status = "disabled";
 		};
 
-		usbphy: usb-phy@e6590100 {
+		usbphy: usb-phy-controller@e6590100 {
 			compatible = "renesas,usb-phy-r8a7794",
 				     "renesas,rcar-gen2-usb-phy";
 			reg = <0 0xe6590100 0 0x100>;
@@ -518,11 +518,11 @@ usbphy: usb-phy@e6590100 {
 			resets = <&cpg 704>;
 			status = "disabled";
 
-			usb0: usb-channel@0 {
+			usb0: usb-phy@0 {
 				reg = <0>;
 				#phy-cells = <1>;
 			};
-			usb2: usb-channel@2 {
+			usb2: usb-phy@2 {
 				reg = <2>;
 				#phy-cells = <1>;
 			};
-- 
2.25.1

