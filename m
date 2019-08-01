Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB497DDB6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 16:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbfHAOWL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 10:22:11 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44156 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbfHAOWL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 10:22:11 -0400
Received: by mail-pg1-f193.google.com with SMTP id i18so34304094pgl.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Aug 2019 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4P6w/HAiSYzis3+J0RO7QH8f2Acmw1YWPcQOvjFv0Yc=;
        b=QofVvSa7TtEB8BhX5um9VpHixJvJhUd/LTNRpAjrTnl3P/e2GFSrGCbrXpr0ea/eF3
         VcXUkq57kNR70a5MP4oknIKlrbsJLeg8HZFSeFMsHYsHg+vyGGrk4TcqzwO647P4tbel
         n6+fs3DW1j8EpPBASUlb0i6ts2pRilDP4quGOelGhFrLWsuwU+8ARoeyvqxNseYkr/N0
         uIw9oEjf4qmU+P7WhlQ870FphalSQBhb5IYAL9xm5yqw5ZEHf6GEXu8q5kqT+ePUepsK
         Ljai8J9xpe9Eb+wzSTTp5wP4nM6a2ghlT4rfr2D1p/iFKhqP9peU0OulM3LDm+mRaLHG
         iodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4P6w/HAiSYzis3+J0RO7QH8f2Acmw1YWPcQOvjFv0Yc=;
        b=aRoZUoIczbzS9Yez+85uNeVErEc6F6aaN/FqKwPXLtE9qQ2+EuNFesMS0J4iBxLJ9c
         i4jmfQGkqd4AurkjmrBEyh+0iivmF7zgMWWiDXOhnobSxXOQL2CXCPMSRXsQIKxH9Tgy
         WetR7Yqqd/+8y1AezavOPub+fhVuHhgV0//NgNIrXVX8aWvMROGqpXRjJu6uISOY7uhh
         Jn1+4SmyObFB8a5CFaZWsFVA24OzE+9mRtBtuQ4wH07CxEaLC02wqyk5sApCnscnhm4Z
         APc9tZ4JP8zBHruqmQ+rONBaAyL9CYfIu7ZMTwi1dZu5RkHLSwbhsKJIFARe78G9Rh0o
         rQUA==
X-Gm-Message-State: APjAAAUncMAX9M/BwkOETj1EhnOucFECXbt6vreUZUPuD2bXg5wjNyP7
        DCI0k0/VbM113bw2cm5xBxN0QlNW
X-Google-Smtp-Source: APXvYqzZHUZpXrj2Blx14uvBufafvCrXFrqMbmrfjJP+wELzGyDqW5k1dcIusOFC+XkVnVN9M8I5KQ==
X-Received: by 2002:a63:7d05:: with SMTP id y5mr120909106pgc.425.1564669330113;
        Thu, 01 Aug 2019 07:22:10 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id w18sm91406294pfj.37.2019.08.01.07.22.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 01 Aug 2019 07:22:09 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a77970-eagle: sort nodes
Date:   Thu,  1 Aug 2019 23:21:53 +0900
Message-Id: <1564669313-22427-1-git-send-email-ykaneko0929@gmail.com>
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

 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 58 +++++++++++++-------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 233f26f..2afb91e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -23,10 +23,13 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0x0 0x48000000 0x0 0x38000000>;
+	d3p3: regulator-fixed {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
 	};
 
 	hdmi-out {
@@ -40,15 +43,6 @@
 		};
 	};
 
-	d3p3: regulator-fixed {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-3.3V";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
 	lvds-decoder {
 		compatible = "thine,thc63lvd1024";
 
@@ -73,6 +67,12 @@
 			};
 		};
 	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+	};
 };
 
 &avb {
@@ -102,6 +102,10 @@
 	};
 };
 
+&du {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -157,6 +161,18 @@
 	};
 };
 
+&lvds0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&thc63lvd1024_in>;
+			};
+		};
+	};
+};
+
 &pfc {
 	avb_pins: avb0 {
 		groups = "avb0_mdio", "avb0_rgmii", "avb0_txcrefclk";
@@ -190,19 +206,3 @@
 
 	status = "okay";
 };
-
-&du {
-	status = "okay";
-};
-
-&lvds0 {
-	status = "okay";
-
-	ports {
-		port@1 {
-			lvds0_out: endpoint {
-				remote-endpoint = <&thc63lvd1024_in>;
-			};
-		};
-	};
-};
-- 
1.9.1

