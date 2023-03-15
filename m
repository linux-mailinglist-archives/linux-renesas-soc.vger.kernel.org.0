Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7656BA884
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Mar 2023 07:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjCOG6i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Mar 2023 02:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbjCOG6h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Mar 2023 02:58:37 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AE96220565;
        Tue, 14 Mar 2023 23:58:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,262,1673881200"; 
   d="scan'208";a="152641783"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Mar 2023 15:47:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.128])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B9A6B41846CE;
        Wed, 15 Mar 2023 15:47:32 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vinod Koul <vkoul@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: Add clock-names and reset-names to DMAC node
Date:   Wed, 15 Mar 2023 06:47:26 +0000
Message-Id: <20230315064726.22739-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230315064726.22739-1-biju.das.jz@bp.renesas.com>
References: <20230315064726.22739-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock-names and reset-names to RZ/G2{L,LC,UL}, RZ/V2L and
RZ/Five DMAC nodes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index a9700654b421..27c35a657b15 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -564,9 +564,11 @@ dmac: dma-controller@11820000 {
 					  "ch12", "ch13", "ch14", "ch15";
 			clocks = <&cpg CPG_MOD R9A07G043_DMAC_ACLK>,
 				 <&cpg CPG_MOD R9A07G043_DMAC_PCLK>;
+			clock-names = "main", "register";
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G043_DMAC_ARESETN>,
 				 <&cpg R9A07G043_DMAC_RST_ASYNC>;
+			reset-names = "arst", "rst_async";
 			#dma-cells = <1>;
 			dma-channels = <16>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 79cffbf20c55..7b68bbebb5bd 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -740,9 +740,11 @@ dmac: dma-controller@11820000 {
 					  "ch12", "ch13", "ch14", "ch15";
 			clocks = <&cpg CPG_MOD R9A07G044_DMAC_ACLK>,
 				 <&cpg CPG_MOD R9A07G044_DMAC_PCLK>;
+			clock-names = "main", "register";
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G044_DMAC_ARESETN>,
 				 <&cpg R9A07G044_DMAC_RST_ASYNC>;
+			reset-names = "arst", "rst_async";
 			#dma-cells = <1>;
 			dma-channels = <16>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index c0ae9c7c10fc..cc11e5855d62 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -746,9 +746,11 @@ dmac: dma-controller@11820000 {
 					  "ch12", "ch13", "ch14", "ch15";
 			clocks = <&cpg CPG_MOD R9A07G054_DMAC_ACLK>,
 				 <&cpg CPG_MOD R9A07G054_DMAC_PCLK>;
+			clock-names = "main", "register";
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G054_DMAC_ARESETN>,
 				 <&cpg R9A07G054_DMAC_RST_ASYNC>;
+			reset-names = "arst", "rst_async";
 			#dma-cells = <1>;
 			dma-channels = <16>;
 		};
-- 
2.25.1

