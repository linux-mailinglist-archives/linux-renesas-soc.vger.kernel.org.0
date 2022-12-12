Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60C4F64A5DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Dec 2022 18:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbiLLR3c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 12:29:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbiLLR3H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 12:29:07 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6D2DB13F2C;
        Mon, 12 Dec 2022 09:28:56 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,239,1665414000"; 
   d="scan'208";a="145905953"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Dec 2022 02:28:55 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 53A3B406F1D2;
        Tue, 13 Dec 2022 02:28:53 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH 13/16] arm64: dts: renesas: r9a09g011: Add USB3 peripheral node
Date:   Mon, 12 Dec 2022 17:28:01 +0000
Message-Id: <20221212172804.1277751-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add USB3 peripheral device node to RZ/V2M SoC dtsi.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index bad0b6b4bc3b..48674b948236 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -97,6 +97,22 @@ usb3host: usb@85060000 {
 				power-domains = <&cpg>;
 				status = "disabled";
 			};
+
+			usb3peri: usb3peri {
+				compatible = "renesas,r9a09g011-usb3-peri",
+					     "renesas,rzv2m-usb3-peri";
+				interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "all_p", "drd", "bc", "gpi";
+				clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
+					 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
+				clock-names = "aclk", "reg";
+				resets = <&cpg R9A09G011_USB_ARESETN_P>;
+				power-domains = <&cpg>;
+				status = "disabled";
+			};
 		};
 
 		avb: ethernet@a3300000 {
-- 
2.25.1

