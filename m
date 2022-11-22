Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74C5B634967
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Nov 2022 22:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235094AbiKVVf5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Nov 2022 16:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235096AbiKVVfz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2022 16:35:55 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A5FF5C623B;
        Tue, 22 Nov 2022 13:35:53 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,185,1665414000"; 
   d="scan'208";a="140911019"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Nov 2022 06:35:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.123])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9288940D24DA;
        Wed, 23 Nov 2022 06:35:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: renesas: r9a07g054: Add vspd node
Date:   Tue, 22 Nov 2022 21:35:28 +0000
Message-Id: <20221122213529.2103849-7-biju.das.jz@bp.renesas.com>
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

Add vspd node to RZ/V2L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch depen upon binding patch [1]
 [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221122193415.1873179-1-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 29b63589209f..244934ce5991 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -651,6 +651,20 @@ dsi: dsi@10850000 {
 			status = "disabled";
 		};
 
+		vspd: vsp@10870000 {
+			compatible = "renesas,r9a07g054-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x10870000 0 0x10000>;
+			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G054_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A07G054_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A07G054_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G054_LCDC_RESET_N>;
+			renesas,fcp = <&fcpvd>;
+		};
+
 		fcpvd: fcp@10880000 {
 			compatible = "renesas,r9a07g054-fcpvd",
 				     "renesas,fcpv";
-- 
2.25.1

