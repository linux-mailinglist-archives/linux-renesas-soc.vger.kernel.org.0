Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 617FC738665
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jun 2023 16:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbjFUOKd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Jun 2023 10:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbjFUOKT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2023 10:10:19 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A26B51BD8;
        Wed, 21 Jun 2023 07:10:14 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,260,1681138800"; 
   d="scan'208";a="168372767"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jun 2023 23:10:14 +0900
Received: from mulinux.example.org (unknown [10.226.93.96])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BFC2C4220E50;
        Wed, 21 Jun 2023 23:10:10 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 4/5] arm64: dts: renesas: r9a09g011: Add CSI nodes
Date:   Wed, 21 Jun 2023 15:09:42 +0100
Message-Id: <20230621140944.257352-5-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621140944.257352-1-fabrizio.castro.jz@renesas.com>
References: <20230621140944.257352-1-fabrizio.castro.jz@renesas.com>
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

The Renesas RZ/V2M comes with 6 Clocked Serial Interface (CSI)
IPs (CSI0, CSI1, CSI2, CSI3, CSI4, CSI5), but Linux is only
allowed access to CSI0 and CSI4.

This commit adds SoC specific device tree support for CSI0 and
CSI4.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index 46d67b200a66..33f2ecf42441 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -236,6 +236,34 @@ sys: system-controller@a3f03000 {
 			reg = <0 0xa3f03000 0 0x400>;
 		};
 
+		csi0: spi@a4020000 {
+			compatible = "renesas,rzv2m-csi";
+			reg = <0 0xa4020000 0 0x80>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CSI0_CLK>,
+				 <&cpg CPG_MOD R9A09G011_CPERI_GRPG_PCLK>;
+			clock-names = "csiclk", "pclk";
+			resets = <&cpg R9A09G011_CSI_GPG_PRESETN>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		csi4: spi@a4020200 {
+			compatible = "renesas,rzv2m-csi";
+			reg = <0 0xa4020200 0 0x80>;
+			interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CSI4_CLK>,
+				 <&cpg CPG_MOD R9A09G011_CPERI_GRPH_PCLK>;
+			clock-names = "csiclk", "pclk";
+			resets = <&cpg R9A09G011_CSI_GPH_PRESETN>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@a4030000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.34.1

