Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A63175AF4B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jul 2023 15:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjGTNKw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jul 2023 09:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbjGTNKu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2023 09:10:50 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A73EE269E;
        Thu, 20 Jul 2023 06:10:41 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,218,1684767600"; 
   d="scan'208";a="170253830"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Jul 2023 22:10:41 +0900
Received: from localhost.localdomain (unknown [10.226.92.157])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2ABAF4012252;
        Thu, 20 Jul 2023 22:10:37 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        stable@kernel.org
Subject: [PATCH 4/6] arm64: dts: renesas: r9a07g044: Update overfow/underflow IRQ names for MTU3 channels
Date:   Thu, 20 Jul 2023 14:10:14 +0100
Message-Id: <20230720131016.331793-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230720131016.331793-1-biju.das.jz@bp.renesas.com>
References: <20230720131016.331793-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per R01UH0914EJ0130 Rev.1.30 HW manual the MTU3 overflow/underflow
interrupt names starts with 'tci' instead of 'tgi'.

Replace the below overflow/underflow interrupt names:
 - tgiv0->tciv0
 - tgiv1->tciv1
 - tgiu1->tciu1
 - tgiv2->tciv2
 - tgiu2->tciu2
 - tgiv3->tciv3
 - tgiv4->tciv4
 - tgiv6->tciv6
 - tgiv7->tciv7
 - tgiv8->tciv8
 - tgiu8->tciu8

Fixes: 26336d66d021 ("arm64: dts: renesas: r9a07g044: Add MTU3a node")
Fixes: dd123dd01def ("arm64: dts: renesas: r9a07g054: Add MTU3a node")
Cc: stable@kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 232910e07444..66f68fc2b241 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -223,20 +223,20 @@ mtu3: timer@10001200 {
 				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "tgia0", "tgib0", "tgic0", "tgid0",
-					  "tgiv0", "tgie0", "tgif0",
-					  "tgia1", "tgib1", "tgiv1", "tgiu1",
-					  "tgia2", "tgib2", "tgiv2", "tgiu2",
+					  "tciv0", "tgie0", "tgif0",
+					  "tgia1", "tgib1", "tciv1", "tciu1",
+					  "tgia2", "tgib2", "tciv2", "tciu2",
 					  "tgia3", "tgib3", "tgic3", "tgid3",
-					  "tgiv3",
+					  "tciv3",
 					  "tgia4", "tgib4", "tgic4", "tgid4",
-					  "tgiv4",
+					  "tciv4",
 					  "tgiu5", "tgiv5", "tgiw5",
 					  "tgia6", "tgib6", "tgic6", "tgid6",
-					  "tgiv6",
+					  "tciv6",
 					  "tgia7", "tgib7", "tgic7", "tgid7",
-					  "tgiv7",
+					  "tciv7",
 					  "tgia8", "tgib8", "tgic8", "tgid8",
-					  "tgiv8", "tgiu8";
+					  "tciv8", "tciu8";
 			clocks = <&cpg CPG_MOD R9A07G044_MTU_X_MCK_MTU3>;
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G044_MTU_X_PRESET_MTU3>;
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 2eba3a8a100d..1f1d481dc783 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -223,20 +223,20 @@ mtu3: timer@10001200 {
 				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "tgia0", "tgib0", "tgic0", "tgid0",
-					  "tgiv0", "tgie0", "tgif0",
-					  "tgia1", "tgib1", "tgiv1", "tgiu1",
-					  "tgia2", "tgib2", "tgiv2", "tgiu2",
+					  "tciv0", "tgie0", "tgif0",
+					  "tgia1", "tgib1", "tciv1", "tciu1",
+					  "tgia2", "tgib2", "tciv2", "tciu2",
 					  "tgia3", "tgib3", "tgic3", "tgid3",
-					  "tgiv3",
+					  "tciv3",
 					  "tgia4", "tgib4", "tgic4", "tgid4",
-					  "tgiv4",
+					  "tciv4",
 					  "tgiu5", "tgiv5", "tgiw5",
 					  "tgia6", "tgib6", "tgic6", "tgid6",
-					  "tgiv6",
+					  "tciv6",
 					  "tgia7", "tgib7", "tgic7", "tgid7",
-					  "tgiv7",
+					  "tciv7",
 					  "tgia8", "tgib8", "tgic8", "tgid8",
-					  "tgiv8", "tgiu8";
+					  "tciv8", "tciu8";
 			clocks = <&cpg CPG_MOD R9A07G054_MTU_X_MCK_MTU3>;
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G054_MTU_X_PRESET_MTU3>;
-- 
2.25.1

