Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4395550CB12
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Apr 2022 16:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235287AbiDWOKQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 23 Apr 2022 10:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235161AbiDWOKF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Apr 2022 10:10:05 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CE7EBDF1;
        Sat, 23 Apr 2022 07:07:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,284,1643641200"; 
   d="scan'208";a="118907817"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Apr 2022 23:07:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 06BF34000689;
        Sat, 23 Apr 2022 23:07:03 +0900 (JST)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a07g054: Fix external clk node names
Date:   Sat, 23 Apr 2022 15:06:58 +0100
Message-Id: <20220423140658.145000-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220423140658.145000-1-biju.das.jz@bp.renesas.com>
References: <20220423140658.145000-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix audio clk node names with "_" -> "-" and add suffix '-clk' for can and
extal clks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index f35aa0311e9c..4313b9e3abed 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -13,14 +13,14 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	audio_clk1: audio_clk1 {
+	audio_clk1: audio-clk1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		/* This value must be overridden by boards that provide it */
 		clock-frequency = <0>;
 	};
 
-	audio_clk2: audio_clk2 {
+	audio_clk2: audio-clk2 {
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

