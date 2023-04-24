Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F367A6ED2A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Apr 2023 18:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjDXQjV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 12:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbjDXQjU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 12:39:20 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 781857AAA;
        Mon, 24 Apr 2023 09:39:19 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,223,1677510000"; 
   d="scan'208";a="160554398"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Apr 2023 01:39:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.191])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C01F14022321;
        Tue, 25 Apr 2023 01:39:16 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v8 2/4] arm64: dts: renesas: r9a07g054: Add DU node
Date:   Mon, 24 Apr 2023 17:39:06 +0100
Message-Id: <20230424163908.137535-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230424163908.137535-1-biju.das.jz@bp.renesas.com>
References: <20230424163908.137535-1-biju.das.jz@bp.renesas.com>
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

Add DU node to RZ/V2L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v7->v8:
 * Added RZ/G2L fallback
 * Added Rb tag from Geert.
v7:
 * New patch.
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 244934ce5991..3495f6bacfeb 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -677,6 +677,21 @@ fcpvd: fcp@10880000 {
 			resets = <&cpg R9A07G054_LCDC_RESET_N>;
 		};
 
+		du: display@10890000 {
+			compatible = "renesas,r9a07g054-du",
+				     "renesas,r9a07g044-du";
+			reg = <0 0x10890000 0 0x10000>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G054_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A07G054_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A07G054_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G054_LCDC_RESET_N>;
+			renesas,vsps = <&vspd 0>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a07g054-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.25.1

