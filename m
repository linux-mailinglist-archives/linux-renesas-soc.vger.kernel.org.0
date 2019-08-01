Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A09D67DDDE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 16:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfHAOZW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 10:25:22 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44509 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731986AbfHAOZW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 10:25:22 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so34308892pgl.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Aug 2019 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=eawaJmlmdDHURoGKBRWYUt94TqnnyTuVqmRFGluvMdw=;
        b=GXHFrZSQ/x87ASlCkbnVK2XtNHcMTdoqDQ34w8vIwnexdEdoOFYYfNr/QTA5HotTzk
         I7RUcyuhBrG9swmx3MEz2IhPnfNe43XwbOwZHB4AKRHzYuscrsUlYRBQxEakTqWbA937
         rNH1OQb5vtPDJgrPSnnvQYpsNsbJyjBLd6SAJZsi7B9WbKAfZK8HP+5mM5eW3Rm9GNyk
         Z8Zw1UgwrPkWhHYcnn6s8rnIGV7QdHzLftXF8CP9XyeabhHDq9Pnf5CuR/TvTkIQRDK0
         zZzaJLUqFw7lNHozh3cyzS21vQwPvIX3/QHYgJ7L5uqbeuqD/bENuEM4Nu7zbX3++tWa
         nNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eawaJmlmdDHURoGKBRWYUt94TqnnyTuVqmRFGluvMdw=;
        b=mPj2OR3bEfpMNxYOZfMgSLadBfnyPwjpFdP2w1D3LAgRlLDqNMdSCbQlPacctwWsiW
         GXwrYKwWe3IX4WwqtWx9UJ2i3jM2h3tgIrcq+eB1xy+1gBT2AUS0U6vpoJf6ZcLEnNn1
         V/HEzzxS+7CzQlL5MCp6T9mkNXF/r1m5TqSHZS8pLsaPed5LZxj5zjU8LJb8Lj4TCWOj
         M3AfxHmfWbOFHy/3B67zLkVkwHPWo6hAAz/XLkIJOUARCjN6hV0Ra07aIV2JyuVPpBQe
         RQBcrCqb+2mHKfVCN6nPlQJlbWgnrZL9iBFkp9KZEP+B04Qg+M5F8vw8asbFY8aNIhO0
         m4ow==
X-Gm-Message-State: APjAAAXPsaK1c7LorOCJxxfF0xLNrsXwaI2hSK0kJn5uPuoT4GFYGvcj
        d+2i3RGXsBXtWCNiJrzshlPZf4NF
X-Google-Smtp-Source: APXvYqz/zl/HOQ3KWjDcDXRPmGAGYIdKDuiYamDdsJho904JPyRdqObLf6F4Qh1+o2y1n9aEvrVHuQ==
X-Received: by 2002:a63:b102:: with SMTP id r2mr48732100pgf.370.1564669521432;
        Thu, 01 Aug 2019 07:25:21 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id o24sm137026149pfp.135.2019.08.01.07.25.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 01 Aug 2019 07:25:20 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a77995: sort nodes
Date:   Thu,  1 Aug 2019 23:25:13 +0900
Message-Id: <1564669513-22756-1-git-send-email-ykaneko0929@gmail.com>
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

 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 76 +++++++++++++++----------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index bcd5442..b3dbf55 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -242,41 +242,6 @@
 			resets = <&cpg 407>;
 		};
 
-		hscif0: serial@e6540000 {
-			compatible = "renesas,hscif-r8a77995",
-				     "renesas,rcar-gen3-hscif",
-				     "renesas,hscif";
-			reg = <0 0xe6540000 0 0x60>;
-			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 520>,
-				 <&cpg CPG_CORE R8A77995_CLK_S3D1C>,
-				 <&scif_clk>;
-			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac1 0x31>, <&dmac1 0x30>,
-			       <&dmac2 0x31>, <&dmac2 0x30>;
-			dma-names = "tx", "rx", "tx", "rx";
-			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
-			resets = <&cpg 520>;
-			status = "disabled";
-		};
-
-		hscif3: serial@e66a0000 {
-			compatible = "renesas,hscif-r8a77995",
-				     "renesas,rcar-gen3-hscif",
-				     "renesas,hscif";
-			reg = <0 0xe66a0000 0 0x60>;
-			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 517>,
-				 <&cpg CPG_CORE R8A77995_CLK_S3D1C>,
-				 <&scif_clk>;
-			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac0 0x37>, <&dmac0 0x36>;
-			dma-names = "tx", "rx";
-			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
-			resets = <&cpg 517>;
-			status = "disabled";
-		};
-
 		i2c0: i2c@e6500000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -344,6 +309,41 @@
 			status = "disabled";
 		};
 
+		hscif0: serial@e6540000 {
+			compatible = "renesas,hscif-r8a77995",
+				     "renesas,rcar-gen3-hscif",
+				     "renesas,hscif";
+			reg = <0 0xe6540000 0 0x60>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 520>,
+				 <&cpg CPG_CORE R8A77995_CLK_S3D1C>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x31>, <&dmac1 0x30>,
+			       <&dmac2 0x31>, <&dmac2 0x30>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 520>;
+			status = "disabled";
+		};
+
+		hscif3: serial@e66a0000 {
+			compatible = "renesas,hscif-r8a77995",
+				     "renesas,rcar-gen3-hscif",
+				     "renesas,hscif";
+			reg = <0 0xe66a0000 0 0x60>;
+			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 517>,
+				 <&cpg CPG_CORE R8A77995_CLK_S3D1C>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac0 0x37>, <&dmac0 0x36>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 517>;
+			status = "disabled";
+		};
+
 		hsusb: usb@e6590000 {
 			compatible = "renesas,usbhs-r8a77995",
 				     "renesas,rcar-gen3-usbhs";
@@ -1100,6 +1100,9 @@
 			polling-delay = <1000>;
 			thermal-sensors = <&thermal>;
 
+			cooling-maps {
+			};
+
 			trips {
 				cpu-crit {
 					temperature = <120000>;
@@ -1107,9 +1110,6 @@
 					type = "critical";
 				};
 			};
-
-			cooling-maps {
-			};
 		};
 	};
 
-- 
1.9.1

