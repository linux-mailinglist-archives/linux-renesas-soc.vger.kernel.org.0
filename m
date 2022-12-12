Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 580BB64A5E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Dec 2022 18:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbiLLRax (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 12:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbiLLRan (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 12:30:43 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7A2FF13DC2;
        Mon, 12 Dec 2022 09:30:38 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,239,1665414000"; 
   d="scan'208";a="143082801"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Dec 2022 02:30:37 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6F691406F1F2;
        Tue, 13 Dec 2022 02:30:35 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH 12/16] arm64: dts: renesas: r9a09g011: Add USB3 DRD and host nodes
Date:   Mon, 12 Dec 2022 17:30:33 +0000
Message-Id: <20221212173033.1278337-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch add usb3 host node as child of usb3 drd node to
RZ/V2M SoC dtsi. The host needs to issue reset release on DRD
module before accessing host registers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index 69c1ebc5e0dd..bad0b6b4bc3b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -69,6 +69,36 @@ gic: interrupt-controller@82010000 {
 			clock-names = "clk";
 		};
 
+		usb3drd: usb@85070000 {
+			compatible = "renesas,r9a09g011-usb3drd",
+				     "renesas,rzv2m-usb3drd";
+			reg = <0x0 0x85070000 0x0 0x1000>;
+			clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
+				 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
+			clock-names = "peri_axi", "apb";
+			resets = <&cpg R9A09G011_USB_DRD_RESET>,
+				 <&cpg R9A09G011_USB_ARESETN_P>;
+			reset-names = "drd_reset", "aresetn_p";
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
+				clock-names = "host_axi", "reg";
+				resets = <&cpg R9A09G011_USB_ARESETN_H>;
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

