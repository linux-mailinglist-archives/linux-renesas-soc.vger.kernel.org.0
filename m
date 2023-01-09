Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 396F866274C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jan 2023 14:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234368AbjAINiw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Jan 2023 08:38:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237277AbjAINiO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2023 08:38:14 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5CB1409A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jan 2023 05:35:59 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:c32c:cc7a:25f1:127a])
        by albert.telenet-ops.be with bizsmtp
        id 6dbq2900K2RK3VH06dbqam; Mon, 09 Jan 2023 14:35:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pEsJY-001Lky-BH;
        Mon, 09 Jan 2023 14:35:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pEsJa-00EOnj-56;
        Mon, 09 Jan 2023 14:35:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: eagle: Add SCIF_CLK support
Date:   Mon,  9 Jan 2023 14:35:48 +0100
Message-Id: <7dddaa362945118deab534ccfddfc0870abe8526.1673271243.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the external SCIF clock crystal, which can be used as a clock
source for the (High Speed) Serial Communication Interfaces with FIFO.

This improves serial console accuracy from 115200-257 bps to
115200+0 bps.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested with a remote Eagle.

To be queued in renesas-devel for v6.3.
---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 004a5eacd460da95..405404c0843d9747 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -287,6 +287,9 @@ lvds0_out: endpoint {
 };
 
 &pfc {
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
 	avb_pins: avb0 {
 		groups = "avb0_mdio", "avb0_rgmii", "avb0_txcrefclk";
 		function = "avb0";
@@ -316,6 +319,11 @@ scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
 	};
+
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk_b";
+		function = "scif_clk";
+	};
 };
 
 &rpc {
@@ -391,3 +399,7 @@ &scif0 {
 
 	status = "okay";
 };
+
+&scif_clk {
+	clock-frequency = <14745600>;
+};
-- 
2.34.1

