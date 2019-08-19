Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFBA6923F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 14:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfHSM41 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 08:56:27 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36560 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfHSM40 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 08:56:26 -0400
Received: by mail-pf1-f193.google.com with SMTP id w2so1137914pfi.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2019 05:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=QEVugNrwQn9HwJDipPXfRxXHdN0DWCVE7QvzrzGlVyM=;
        b=HNJxDe3R7D8tn+mkR/SCoFZcIl3HfJ1DULfW95/RIjy90SVnANgynyUUGOAe/GD69r
         IyVuQRVY9lsbG6PQcJ+RzfPHFJthGbXWoK6GMy4AUHWi5GX55U05NzuxuJDNYl1mms8R
         xNJh5Z+qtY1CqtF2+35B/buIQxZcIe3mkQMY6/9p+tq0hWjA5LWs7DCGgTpODyZlIWQz
         uCcI2kweIM9d9NAGG9pJjcxzpqvarKLqp1ENq+Rthl9S1ARbuw6icswfPNnvCP5N8CRu
         OuZyha0Qwm3ulgg6xVFMCjG9vgRdE/nMju0B0s2s7v/sFvnf8U+IpDhAGvHmci12gYpe
         vdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QEVugNrwQn9HwJDipPXfRxXHdN0DWCVE7QvzrzGlVyM=;
        b=bvQ0GH1HerBEFAu9pifcHeaVrTYPnqS2ytMOG/C/xZCXB5n8uwFua91IrnbX89t1nX
         bJDgoToKCY1/iLsWY6r7fKyGJe3ecLtCgQJqumHy2ejyZhpc+awpHBFqcjPweVmGZWX6
         w78tT8HvDOFk6qgLSNvpM8FRYYKKiumsdH0zIeStLovVbA1h5qCDgIxSvy+nx+iALdVe
         YbdW02qVgqd6wpOISHBUBWSDjgDOSx0G8e+l1nrsxnTP05SgzL6pihB3kT9hY8Qd97U5
         +C1rxv2+ysj76yyFosJUab0GdkjN8IGXXi3YWWIyMaLIoJ2rtsaL+2rzbDFdjjZgGRP1
         f+Fw==
X-Gm-Message-State: APjAAAUU+0Ft4UemODNSpyFGtzfws3pgfWxHv0+ECkX43E7Ysqyjgj6r
        y8hmh1oeNnQv11e3RT+me/XHKwHM
X-Google-Smtp-Source: APXvYqy4bMQ/vHuZpbyn8j0NFl6JegnwAY4lGn8k0mpVmEhzublpgdUhxeQ2rHR2PvNTfve31yW+Pg==
X-Received: by 2002:a17:90a:cf8d:: with SMTP id i13mr9731606pju.63.1566219385980;
        Mon, 19 Aug 2019 05:56:25 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id s125sm20827604pfc.133.2019.08.19.05.56.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 19 Aug 2019 05:56:25 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a7796: sort nodes
Date:   Mon, 19 Aug 2019 21:56:18 +0900
Message-Id: <1566219378-23126-1-git-send-email-ykaneko0929@gmail.com>
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

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 152 +++++++++++++++----------------
 1 file changed, 76 insertions(+), 76 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 26df5b8..3dc9d73 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1833,6 +1833,17 @@
 				      "ssi.1", "ssi.0";
 			status = "disabled";
 
+			rcar_sound,ctu {
+				ctu00: ctu-0 { };
+				ctu01: ctu-1 { };
+				ctu02: ctu-2 { };
+				ctu03: ctu-3 { };
+				ctu10: ctu-4 { };
+				ctu11: ctu-5 { };
+				ctu12: ctu-6 { };
+				ctu13: ctu-7 { };
+			};
+
 			rcar_sound,dvc {
 				dvc0: dvc-0 {
 					dmas = <&audma1 0xbc>;
@@ -1849,17 +1860,6 @@
 				mix1: mix-1 { };
 			};
 
-			rcar_sound,ctu {
-				ctu00: ctu-0 { };
-				ctu01: ctu-1 { };
-				ctu02: ctu-2 { };
-				ctu03: ctu-3 { };
-				ctu10: ctu-4 { };
-				ctu11: ctu-5 { };
-				ctu12: ctu-6 { };
-				ctu13: ctu-7 { };
-			};
-
 			rcar_sound,src {
 				src0: src-0 {
 					interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
@@ -1913,6 +1913,59 @@
 				};
 			};
 
+			rcar_sound,ssi {
+				ssi0: ssi-0 {
+					interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x01>, <&audma1 0x02>;
+					dma-names = "rx", "tx";
+				};
+				ssi1: ssi-1 {
+					interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x03>, <&audma1 0x04>;
+					dma-names = "rx", "tx";
+				};
+				ssi2: ssi-2 {
+					interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x05>, <&audma1 0x06>;
+					dma-names = "rx", "tx";
+				};
+				ssi3: ssi-3 {
+					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x07>, <&audma1 0x08>;
+					dma-names = "rx", "tx";
+				};
+				ssi4: ssi-4 {
+					interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x09>, <&audma1 0x0a>;
+					dma-names = "rx", "tx";
+				};
+				ssi5: ssi-5 {
+					interrupts = <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x0b>, <&audma1 0x0c>;
+					dma-names = "rx", "tx";
+				};
+				ssi6: ssi-6 {
+					interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x0d>, <&audma1 0x0e>;
+					dma-names = "rx", "tx";
+				};
+				ssi7: ssi-7 {
+					interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x0f>, <&audma1 0x10>;
+					dma-names = "rx", "tx";
+				};
+				ssi8: ssi-8 {
+					interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x11>, <&audma1 0x12>;
+					dma-names = "rx", "tx";
+				};
+				ssi9: ssi-9 {
+					interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&audma0 0x13>, <&audma1 0x14>;
+					dma-names = "rx", "tx";
+				};
+			};
+
 			rcar_sound,ssiu {
 				ssiu00: ssiu-0 {
 					dmas = <&audma0 0x15>, <&audma1 0x16>;
@@ -2123,59 +2176,6 @@
 					dma-names = "rx", "tx";
 				};
 			};
-
-			rcar_sound,ssi {
-				ssi0: ssi-0 {
-					interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x01>, <&audma1 0x02>;
-					dma-names = "rx", "tx";
-				};
-				ssi1: ssi-1 {
-					interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x03>, <&audma1 0x04>;
-					dma-names = "rx", "tx";
-				};
-				ssi2: ssi-2 {
-					interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x05>, <&audma1 0x06>;
-					dma-names = "rx", "tx";
-				};
-				ssi3: ssi-3 {
-					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x07>, <&audma1 0x08>;
-					dma-names = "rx", "tx";
-				};
-				ssi4: ssi-4 {
-					interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x09>, <&audma1 0x0a>;
-					dma-names = "rx", "tx";
-				};
-				ssi5: ssi-5 {
-					interrupts = <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x0b>, <&audma1 0x0c>;
-					dma-names = "rx", "tx";
-				};
-				ssi6: ssi-6 {
-					interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x0d>, <&audma1 0x0e>;
-					dma-names = "rx", "tx";
-				};
-				ssi7: ssi-7 {
-					interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x0f>, <&audma1 0x10>;
-					dma-names = "rx", "tx";
-				};
-				ssi8: ssi-8 {
-					interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x11>, <&audma1 0x12>;
-					dma-names = "rx", "tx";
-				};
-				ssi9: ssi-9 {
-					interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x13>, <&audma1 0x14>;
-					dma-names = "rx", "tx";
-				};
-			};
 		};
 
 		audma0: dma-controller@ec700000 {
@@ -2860,6 +2860,18 @@
 			thermal-sensors = <&tsc 2>;
 			sustainable-power = <3874>;
 
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&a57_0 2 4>;
+					contribution = <1024>;
+				};
+				map1 {
+					trip = <&target>;
+					cooling-device = <&a53_0 0 2>;
+					contribution = <1024>;
+				};
+			};
 			trips {
 				target: trip-point1 {
 					temperature = <100000>;
@@ -2873,18 +2885,6 @@
 					type = "critical";
 				};
 			};
-			cooling-maps {
-				map0 {
-					trip = <&target>;
-					cooling-device = <&a57_0 2 4>;
-					contribution = <1024>;
-				};
-				map1 {
-					trip = <&target>;
-					cooling-device = <&a53_0 0 2>;
-					contribution = <1024>;
-				};
-			};
 		};
 	};
 
-- 
1.9.1

