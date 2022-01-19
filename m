Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB95493B9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 15:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354984AbiASOCv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 09:02:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354986AbiASOCp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:02:45 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80895C061747
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:02:43 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a44d:f245:bac9:611c])
        by xavier.telenet-ops.be with bizsmtp
        id ke2h2600Z2FKFx601e2hXD; Wed, 19 Jan 2022 15:02:41 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXt-00AS1D-7V; Wed, 19 Jan 2022 15:02:41 +0100
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXs-009iIZ-Ct; Wed, 19 Jan 2022 15:02:40 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 15/15] arm64: dts: renesas: spider: Complete SCIF3 description
Date:   Wed, 19 Jan 2022 15:02:32 +0100
Message-Id: <1a25201134ba1174f639fce130a1275290632b08.1642599415.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642599415.git.geert+renesas@glider.be>
References: <cover.1642599415.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Complete the description of the serial console by adding RTS/CTS, the
external clock crystal, and pin control.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

