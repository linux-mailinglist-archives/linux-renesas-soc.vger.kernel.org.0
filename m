Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1AA4EFF9B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 10:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242803AbiDBIPh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 04:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352566AbiDBIPc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 04:15:32 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D32DC527CA;
        Sat,  2 Apr 2022 01:13:35 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,229,1643641200"; 
   d="scan'208";a="116499425"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Apr 2022 17:13:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5B82441F41FD;
        Sat,  2 Apr 2022 17:13:33 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/7] arm64: dts: renesas: r9a07g043: Fillup the pinctrl stub node
Date:   Sat,  2 Apr 2022 09:13:22 +0100
Message-Id: <20220402081328.26292-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220402081328.26292-1-biju.das.jz@bp.renesas.com>
References: <20220402081328.26292-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fillup the pinctrl(GPIO) stub node in RZ/G2UL SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added Rb tag from Geert
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index ad898cab64a6..ffba6007e3cc 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -275,10 +275,16 @@
 		};
 
 		pinctrl: pinctrl@11030000 {
+			compatible = "renesas,r9a07g043-pinctrl";
 			reg = <0 0x11030000 0 0x10000>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			/* place holder */
+			gpio-ranges = <&pinctrl 0 0 152>;
+			clocks = <&cpg CPG_MOD R9A07G043_GPIO_HCLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043_GPIO_RSTN>,
+				 <&cpg R9A07G043_GPIO_PORT_RESETN>,
+				 <&cpg R9A07G043_GPIO_SPARE_RESETN>;
 		};
 
 		dmac: dma-controller@11820000 {
-- 
2.17.1

