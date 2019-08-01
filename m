Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5587DDC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 16:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731972AbfHAOX0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 10:23:26 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35102 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbfHAOX0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 10:23:26 -0400
Received: by mail-pl1-f196.google.com with SMTP id w24so32300802plp.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Aug 2019 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=d8QqAnaRG9B19aLd/6x1SuCSFj0V3dQnYyNBg9eKsxs=;
        b=FJiMJoQkijSbS7Hw3FvNwGh4jrejEQk1R2ODJ4arB99XCKFl69EUalt+3H6y9IQ0Sh
         do8Hbg6lu5RGw1WEPFX5bYe4hmqBZsxJ05ZO78RPPduWCivOElcI62KojrepLkdEKlvI
         5uDVY+nBBCQDehjzs7qRymxrl4HgsL+Op3BgHtk8+vMv/9nNLxtK8ZTerQW8rFljKt7X
         NXTKM/0ETZERIa06ltgJJApRzjwEilPf/7DrcHc5WLiH5JvikOyJdnveN8XlLVHt3hAN
         2SaYj65GSRMsDYMgIQb7Cax2Mvrv+VXu30eZvhzOpHqJXJuD80RvQZOJs7HXwwlxvdMq
         0t+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=d8QqAnaRG9B19aLd/6x1SuCSFj0V3dQnYyNBg9eKsxs=;
        b=DBlVLJ5MDdyRemkFKHrcVCX7vZtG+dtadVPCOn1IvvNz3E501CakAdhaVPfKbyAtyw
         KlxCe2UOloNbu+PMz7wrHT+DEz0kACNaoG8Yab/N8qhSO0aWEpb+evfvCsgboOyduBJU
         reqHJfbaSo3G21gBtTf/a76pCOKPjhGgICXJ84n412sMufcEdqHLjJRe/AYTtSGrTl1D
         yOAQsVwvT0lNMxuWQfJKQn9/FD07B3ZPdfI3QSoRK6JARp+3njVmsZdswTYqrlqULO1o
         HMK4B/PIdPfbZVP7qCilbVfEOg9gB5Oi6UZXn4iUZJsxVdeAh+WaTw/ocqWWhHlH5H3K
         uIcA==
X-Gm-Message-State: APjAAAV7+kgofonTSBlYJs1He1jLwghUCiVLELIO/MOip+m/IsEhc9Jz
        4YpLbC1T6iHGn+mgMUvp/UGEXkiU
X-Google-Smtp-Source: APXvYqzchMZ7vwg5+ycc1a3SAgOrqHTC46m69X5XZ5JEfK1atEKZtrEFuq/gOO86ntXKFLHViz/S+g==
X-Received: by 2002:a17:902:2f84:: with SMTP id t4mr123020876plb.57.1564669405491;
        Thu, 01 Aug 2019 07:23:25 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id k3sm55628686pgq.92.2019.08.01.07.23.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 01 Aug 2019 07:23:24 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a77970-v3msk: sort nodes
Date:   Thu,  1 Aug 2019 23:23:17 +0900
Message-Id: <1564669397-22515-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sort nodes.

If node address is present
   * Sort by node address, grouping all nodes with the same compat string
     and sorting the group alphabetically.
Else
   * Sort alphabetically

This should not have any run-time effect.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the master branch of Geert Uytterhoeven's renesas-devel
tree.

 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts | 116 ++++++++++++-------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 15cc9fe..d7c7b91 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -21,6 +21,41 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&adv7511_out>;
+			};
+		};
+	};
+
+	lvds-decoder {
+		compatible = "thine,thc63lvd1024";
+		vcc-supply = <&vcc_d3_3v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				thc63lvd1024_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				thc63lvd1024_out: endpoint {
+					remote-endpoint = <&adv7511_in>;
+				};
+			};
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
@@ -59,41 +94,6 @@
 		regulator-boot-on;
 		regulator-always-on;
 	};
-
-	lvds-decoder {
-		compatible = "thine,thc63lvd1024";
-		vcc-supply = <&vcc_d3_3v>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-				thc63lvd1024_in: endpoint {
-					remote-endpoint = <&lvds0_out>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-				thc63lvd1024_out: endpoint {
-					remote-endpoint = <&adv7511_in>;
-				};
-			};
-		};
-	};
-
-	hdmi-out {
-		compatible = "hdmi-connector";
-		type = "a";
-
-		port {
-			hdmi_con: endpoint {
-				remote-endpoint = <&adv7511_out>;
-			};
-		};
-	};
 };
 
 &avb {
@@ -128,29 +128,6 @@
 	clock-frequency = <32768>;
 };
 
-&pfc {
-	avb_pins: avb0 {
-		groups = "avb0_mdio", "avb0_rgmii", "avb0_txcrefclk";
-		function = "avb0";
-	};
-
-	i2c0_pins: i2c0 {
-		groups = "i2c0";
-		function = "i2c0";
-	};
-
-	mmc_pins: mmc_3_3v {
-		groups = "mmc_data8", "mmc_ctrl";
-		function = "mmc";
-		power-source = <3300>;
-	};
-
-	scif0_pins: scif0 {
-		groups = "scif0_data";
-		function = "scif0";
-	};
-};
-
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
@@ -220,6 +197,29 @@
 	status = "okay";
 };
 
+&pfc {
+	avb_pins: avb0 {
+		groups = "avb0_mdio", "avb0_rgmii", "avb0_txcrefclk";
+		function = "avb0";
+	};
+
+	i2c0_pins: i2c0 {
+		groups = "i2c0";
+		function = "i2c0";
+	};
+
+	mmc_pins: mmc_3_3v {
+		groups = "mmc_data8", "mmc_ctrl";
+		function = "mmc";
+		power-source = <3300>;
+	};
+
+	scif0_pins: scif0 {
+		groups = "scif0_data";
+		function = "scif0";
+	};
+};
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
-- 
1.9.1

