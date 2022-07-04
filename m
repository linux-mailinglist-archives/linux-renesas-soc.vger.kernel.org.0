Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 132C6565B06
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 18:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbiGDQQr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jul 2022 12:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234640AbiGDQQc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 12:16:32 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D0FE099
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Jul 2022 09:16:30 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id r4GT2700X4C55Sk014GTrJ; Mon, 04 Jul 2022 18:16:28 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o8OkN-0021kZ-Gn; Mon, 04 Jul 2022 18:16:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o8OkM-001DGe-VM; Mon, 04 Jul 2022 18:16:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: spider-cpu: Fix scif0/scif3 sort order
Date:   Mon,  4 Jul 2022 18:16:26 +0200
Message-Id: <2fe0e782351c202ed009dcd658f4bceec8f3a56d.1656951240.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The scif0 nodes were accidentally inserted after the scif3 nodes,
breaking alphabetical sort order.

Fixes: 1614c8624a48b9c9 ("arm64: dts: renesas: spider-cpu: Enable SCIF0 on second connector")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.20.

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi  | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index 7fa225dafa6e5749..2cc365a720c19fc5 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -55,16 +55,16 @@ i2c4_pins: i2c4 {
 		function = "i2c4";
 	};
 
-	scif3_pins: scif3 {
-		groups = "scif3_data", "scif3_ctrl";
-		function = "scif3";
-	};
-
 	scif0_pins: scif0 {
 		groups = "scif0_data", "scif0_ctrl";
 		function = "scif0";
 	};
 
+	scif3_pins: scif3 {
+		groups = "scif3_data", "scif3_ctrl";
+		function = "scif3";
+	};
+
 	scif_clk_pins: scif_clk {
 		groups = "scif_clk";
 		function = "scif_clk";
@@ -76,16 +76,16 @@ &rwdt {
 	status = "okay";
 };
 
-&scif3 {
-	pinctrl-0 = <&scif3_pins>;
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
 
 	uart-has-rtscts;
 	status = "okay";
 };
 
-&scif0 {
-	pinctrl-0 = <&scif0_pins>;
+&scif3 {
+	pinctrl-0 = <&scif3_pins>;
 	pinctrl-names = "default";
 
 	uart-has-rtscts;
-- 
2.25.1

