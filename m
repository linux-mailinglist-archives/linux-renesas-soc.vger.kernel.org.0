Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64C0D63495C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Nov 2022 22:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbiKVVfk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Nov 2022 16:35:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235033AbiKVVfj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2022 16:35:39 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 64AEEC495C;
        Tue, 22 Nov 2022 13:35:38 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,185,1665414000"; 
   d="scan'208";a="143583226"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Nov 2022 06:35:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.123])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5A58140D24BC;
        Wed, 23 Nov 2022 06:35:35 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: renesas: r9a07g044: Add fcpvd node
Date:   Tue, 22 Nov 2022 21:35:23 +0000
Message-Id: <20221122213529.2103849-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com>
References: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add fcpvd node to RZ/G2L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch depen upon binding patch [1]
 [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221122193415.1873179-2-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 487536696d90..e90c517077ab 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -618,6 +618,18 @@ sbc: spi@10060000 {
 			status = "disabled";
 		};
 
+		fcpvd: fcp@10880000 {
+			compatible = "renesas,r9a07g044-fcpvd",
+				     "renesas,fcpv";
+			reg = <0 0x10880000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_LCDC_RESET_N>;
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a07g044-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.25.1

