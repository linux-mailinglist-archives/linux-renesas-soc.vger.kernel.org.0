Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D185B59A6A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Aug 2022 21:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351532AbiHSTkT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Aug 2022 15:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350601AbiHSTkS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Aug 2022 15:40:18 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F1DC821E04;
        Fri, 19 Aug 2022 12:40:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,248,1654527600"; 
   d="scan'208";a="129965191"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Aug 2022 04:40:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.25])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E9F93400D4C0;
        Sat, 20 Aug 2022 04:40:15 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g011: Add i2c nodes
Date:   Fri, 19 Aug 2022 20:39:43 +0100
Message-Id: <20220819193944.337599-3-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819193944.337599-1-phil.edworthy@renesas.com>
References: <20220819193944.337599-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index 44e1e288343c..fb1a97202c38 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -123,6 +123,34 @@ cpg: clock-controller@a3500000 {
 			#power-domain-cells = <0>;
 		};
 
+		i2c0: i2c@a4030000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r9a09g011", "renesas,rzv2m-i2c";
+			reg = <0 0xa4030000 0 0x80>;
+			interrupts = <GIC_SPI 232 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "tia", "tis";
+			clocks = <&cpg CPG_MOD R9A09G011_IIC_PCLK0>;
+			resets = <&cpg R9A09G011_IIC_GPA_PRESETN>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@a4030100 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,i2c-r9a09g011", "renesas,rzv2m-i2c";
+			reg = <0 0xa4030100 0 0x80>;
+			interrupts = <GIC_SPI 234 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 238 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "tia", "tis";
+			clocks = <&cpg CPG_MOD R9A09G011_IIC_PCLK1>;
+			resets = <&cpg R9A09G011_IIC_GPB_PRESETN>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		uart0: serial@a4040000 {
 			compatible = "renesas,r9a09g011-uart", "renesas,em-uart";
 			reg = <0 0xa4040000 0 0x80>;
-- 
2.34.1

