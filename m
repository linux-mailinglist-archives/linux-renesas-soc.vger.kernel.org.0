Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 814DC50E7BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 20:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244209AbiDYSFh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 14:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244207AbiDYSFg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 14:05:36 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DB40D47041;
        Mon, 25 Apr 2022 11:02:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,289,1643641200"; 
   d="scan'208";a="119108224"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2022 03:02:31 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DAA2E40C73DE;
        Tue, 26 Apr 2022 03:02:27 +0900 (JST)
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
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a07g054: Fix external clk node names
Date:   Mon, 25 Apr 2022 19:02:20 +0100
Message-Id: <20220425180220.204058-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425180220.204058-1-biju.das.jz@bp.renesas.com>
References: <20220425180220.204058-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add suffix '-clk' for can and extal clk node names and replace the
clk node names audio_clk{1,2} with clk-{1,2} as per the device
tree specification.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Replaced clk node names audio_clk{1,2} with clk-{1,2}.
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index f35aa0311e9c..65f965669c6b 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -13,14 +13,14 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	audio_clk1: audio_clk1 {
+	audio_clk1: clk-1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		/* This value must be overridden by boards that provide it */
 		clock-frequency = <0>;
 	};
 
-	audio_clk2: audio_clk2 {
+	audio_clk2: clk-2 {
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

