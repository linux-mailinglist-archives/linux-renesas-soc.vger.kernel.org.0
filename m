Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D294923EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 14:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbfHSMze (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 08:55:34 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36481 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfHSMzd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 08:55:33 -0400
Received: by mail-pf1-f193.google.com with SMTP id w2so1136708pfi.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2019 05:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wxLexOtpgiOZUCwyidEYaY3eooecCDD5CLNpFroafaI=;
        b=MP6L1+Ti0g0EfBo4RrkTQ4TUf7oFPj0XE8pqOctRmGvYb8EV2H5jHmOQqUV2pmfDv8
         ssk79pgomUQFl5vm5jY3fNnYGkDp1TTmcoC6n25pbuD4GYeP3Kw3TPK0Ij1nLNd4/Rla
         M78c77eWYj5z4pnfXcj79jOfZHB9HU8ODO8H+udxr5TdkQP3dh/2v+QQpW9TN5SGysCm
         LW2g7MqxJvCbxXfaiRejuf+ljcucb+Rco4pb+SdT+NcGHq/oYZIEf5AIHKKkLCW9do0/
         QcE3BFVEAEY60CbHJhu9YKLoxc1F8lsNUey4yR5oOAReRYUYteGGJ2SIcEMC9ic6baGF
         q7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wxLexOtpgiOZUCwyidEYaY3eooecCDD5CLNpFroafaI=;
        b=J5/PxnadSwtufxmT2+7ozkIWp6FQ5Spz5BkGutd96nRcMIGB0ENoo3I/7lFisg1SAX
         qxVzrFesWJ6OXbMR6QJhktlJhGDSLK/uQtxo9+ccraqJ9YLXv5+9B8sqOZNVLkGhmLVw
         LTmd3KY8QOoJ6K4STv7XR7MBrWOUHGAkA451b3pPDnt1H41CtiT1v0JIkV7/pnOkpv/P
         deYzv1tPr1sBBMQtacs4jo1rT9fYlf1rkGbRTEastvLji+Pydk7hiSeWh6tsvTaZ8uMy
         VuaAun45mAimnHenWaLcmoMY3oxciTXZQBygXjXGkf43o+eO/ig2KWQvlLH+h/VdAeJ5
         I/ug==
X-Gm-Message-State: APjAAAXYnbawU3HBZMWoGK45oKgB2b0lHz/7Ru+K5yCEBWpLcXbMi626
        9Q4uqRlPKkEIohxgvg3/1mM7VInp
X-Google-Smtp-Source: APXvYqyhDDchMWr1RWUittFEHEHopaQA3ix1MeEU072Be8O/tTlfL0IZKYLZgD/m92nSlltSLeqVVA==
X-Received: by 2002:aa7:8007:: with SMTP id j7mr23790753pfi.154.1566219332838;
        Mon, 19 Aug 2019 05:55:32 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id i15sm14949839pfd.160.2019.08.19.05.55.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 19 Aug 2019 05:55:32 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a774a1: sort nodes
Date:   Mon, 19 Aug 2019 21:54:55 +0900
Message-Id: <1566219295-23003-1-git-send-email-ykaneko0929@gmail.com>
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

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 174 +++++++++++++++---------------
 1 file changed, 87 insertions(+), 87 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index bdb4675..06c7c84 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1726,6 +1726,28 @@
 				      "ssi.1", "ssi.0";
 			status = "disabled";
 
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+				};
+				port@1 {
+					reg = <1>;
+				};
+			};
+
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
@@ -1742,17 +1764,6 @@
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
@@ -1806,6 +1817,59 @@
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
@@ -2016,70 +2080,6 @@
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
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				port@0 {
-					reg = <0>;
-				};
-				port@1 {
-					reg = <1>;
-				};
-			};
 		};
 
 		audma0: dma-controller@ec700000 {
@@ -2746,6 +2746,18 @@
 			thermal-sensors = <&tsc 2>;
 			sustainable-power = <3874>;
 
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&a57_0 0 2>;
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
@@ -2759,18 +2771,6 @@
 					type = "critical";
 				};
 			};
-			cooling-maps {
-				map0 {
-					trip = <&target>;
-					cooling-device = <&a57_0 0 2>;
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

