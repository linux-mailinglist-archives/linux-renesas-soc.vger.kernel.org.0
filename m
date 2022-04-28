Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1BC851352A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 15:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347134AbiD1NfT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346139AbiD1NfS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:35:18 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A568E1EC5D;
        Thu, 28 Apr 2022 06:32:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,295,1647270000"; 
   d="scan'208";a="118327326"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Apr 2022 22:32:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8059542DDD04;
        Thu, 28 Apr 2022 22:31:58 +0900 (JST)
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
Subject: [PATCH v4 1/2] arm64: dts: renesas: r9a07g044: Fix external clk node names
Date:   Thu, 28 Apr 2022 14:31:55 +0100
Message-Id: <20220428133156.18080-1-biju.das.jz@bp.renesas.com>
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

Add suffix '-clk' for can and extal clk node names and replace the
clk node names audio_clk{1,2} with audio{1,2}-clk as per the device
tree specification.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Replaced clk node names audio_clk{1,2} with audio{1,2}-clk.
v2->v3:
 * Sorted clk node-names alphabetically
v1->v2:
 * Replaced clk node names audio_clk{1,2} with clk-{1,2}.
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 19287cccb1f0..3652e511160f 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -13,14 +13,14 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	audio_clk1: audio_clk1 {
+	audio_clk1: audio1-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		/* This value must be overridden by boards that provide it */
 		clock-frequency = <0>;
 	};
 
-	audio_clk2: audio_clk2 {
+	audio_clk2: audio2-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		/* This value must be overridden by boards that provide it */
@@ -28,14 +28,14 @@ audio_clk2: audio_clk2 {
 	};
 
 	/* External CAN clock - to be overridden by boards that provide it */
-	can_clk: can {
+	can_clk: can-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
 	/* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
-	extal_clk: extal {
+	extal_clk: extal-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		/* This value must be overridden by the board */
-- 
2.25.1

