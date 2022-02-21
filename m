Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 121B44BE516
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 19:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379480AbiBUPtc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 10:49:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379528AbiBUPta (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 10:49:30 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9516E24582
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 07:49:06 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by xavier.telenet-ops.be with bizsmtp
        id xrp42600L3YJRAw01rp4lL; Mon, 21 Feb 2022 16:49:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAvw-001TXO-0k; Mon, 21 Feb 2022 16:49:04 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAvv-006ErK-Bk; Mon, 21 Feb 2022 16:49:03 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] arm64: dts: renesas: spider: Complete SCIF3 description
Date:   Mon, 21 Feb 2022 16:48:54 +0100
Message-Id: <8e5701ca2a5f5925918217ab79e8489535339e7b.1645458249.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645458249.git.geert+renesas@glider.be>
References: <cover.1645458249.git.geert+renesas@glider.be>
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

Complete the description of the serial console by adding RTS/CTS, the
external clock crystal, and pin control.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index 3a90932fe85c8243..6e07c54148e716d7 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -31,11 +31,34 @@ &extalr_clk {
 	clock-frequency = <32768>;
 };
 
+&pfc {
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
+	scif3_pins: scif3 {
+		groups = "scif3_data", "scif3_ctrl";
+		function = "scif3";
+	};
+
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk";
+		function = "scif_clk";
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
 };
 
 &scif3 {
+	pinctrl-0 = <&scif3_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
 	status = "okay";
 };
+
+&scif_clk {
+	clock-frequency = <24000000>;
+};
-- 
2.25.1

