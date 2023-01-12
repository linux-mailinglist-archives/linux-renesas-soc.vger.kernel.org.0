Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8237B66866F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 23:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbjALWKT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 17:10:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbjALWJt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 17:09:49 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5CF575371E;
        Thu, 12 Jan 2023 13:59:51 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,212,1669042800"; 
   d="scan'208";a="149165247"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2023 06:59:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2694D400B9F8;
        Fri, 13 Jan 2023 06:59:47 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 10/12] arm64: dts: renesas: r9a09g011: Add USB3 DRD, device and host nodes
Date:   Thu, 12 Jan 2023 21:59:04 +0000
Message-Id: <20230112215906.494394-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch add usb3 host and peripheral device node as child of usb3 drd
node to RZ/V2M SoC dtsi. The host/device needs to issue reset release on
DRD module before accessing host/device registers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added all the USB3 nodes
 * Added reg property for USB3 peri
 * Added interrupt propertiees for DRD
---
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index dcd3a05e54fe..958ea705f4d4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -69,6 +69,51 @@ gic: interrupt-controller@82010000 {
 			clock-names = "clk";
 		};
 
+		usb3drd: usb3drd@85070400 {
+			compatible = "renesas,r9a09g011-usb3drd",
+				     "renesas,rzv2m-usb3drd";
+			reg = <0x0 0x85070400 0x0 0x100>;
+			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "drd", "bc", "gpi";
+			clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
+				 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
+			clock-names = "axi", "reg";
+			resets = <&cpg R9A09G011_USB_DRD_RESET>;
+			power-domains = <&cpg>;
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			usb3host: usb@85060000 {
+				compatible = "renesas,r9a09g011-xhci",
+					     "renesas,rzv2m-xhci";
+				reg = <0 0x85060000 0 0x2000>;
+				interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_H>,
+					 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
+				clock-names = "axi", "reg";
+				resets = <&cpg R9A09G011_USB_ARESETN_H>;
+				power-domains = <&cpg>;
+				status = "disabled";
+			};
+
+			usb3peri: usb3peri@85070000 {
+				compatible = "renesas,r9a09g011-usb3-peri",
+					     "renesas,rzv2m-usb3-peri";
+				reg = <0x0 0x85070000 0x0 0x400>;
+				interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
+					 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
+				clock-names = "axi", "reg";
+				resets = <&cpg R9A09G011_USB_ARESETN_P>;
+				power-domains = <&cpg>;
+				status = "disabled";
+			};
+		};
+
 		avb: ethernet@a3300000 {
 			compatible = "renesas,etheravb-r9a09g011","renesas,etheravb-rzv2m";
 			reg = <0 0xa3300000 0 0x800>;
-- 
2.25.1

