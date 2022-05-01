Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF55516423
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 May 2022 13:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346284AbiEALdD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 May 2022 07:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346328AbiEALdC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 May 2022 07:33:02 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 50CA06D38C;
        Sun,  1 May 2022 04:29:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,189,1647270000"; 
   d="scan'208";a="118512284"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 May 2022 20:29:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.14])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AB6CE4229240;
        Sun,  1 May 2022 20:29:32 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/6] arm64: dts: renesas: r9a07g043: Add SPI Multi I/O Bus controller node
Date:   Sun,  1 May 2022 12:29:21 +0100
Message-Id: <20220501112926.47024-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501112926.47024-1-biju.das.jz@bp.renesas.com>
References: <20220501112926.47024-1-biju.das.jz@bp.renesas.com>
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

Add SPI Multi I/O Bus controller node to R9A07G043 (RZ/G2UL) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 15335e9ca06b..55bf4b72304f 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -418,12 +418,20 @@ adc: adc@10059000 {
 		};
 
 		sbc: spi@10060000 {
+			compatible = "renesas,r9a07g043-rpc-if",
+				     "renesas,rzg2l-rpc-if";
 			reg = <0 0x10060000 0 0x10000>,
 			      <0 0x20000000 0 0x10000000>,
 			      <0 0x10070000 0 0x10000>;
+			reg-names = "regs", "dirmap", "wbuf";
+			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G043_SPI_CLK2>,
+				 <&cpg CPG_MOD R9A07G043_SPI_CLK>;
+			resets = <&cpg R9A07G043_SPI_RST>;
+			power-domains = <&cpg>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			/* place holder */
+			status = "disabled";
 		};
 
 		cpg: clock-controller@11010000 {
-- 
2.25.1

