Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD221682B8E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Jan 2023 12:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbjAaLdQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Jan 2023 06:33:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjAaLdM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jan 2023 06:33:12 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BD54B892
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Jan 2023 03:32:37 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:fd54:3eff:f16a:8c82])
        by albert.telenet-ops.be with bizsmtp
        id FPYa2900L3oGUMV06PYaYG; Tue, 31 Jan 2023 12:32:35 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pMos8-007vmO-SS;
        Tue, 31 Jan 2023 12:32:34 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pMosM-000Omh-Ps;
        Tue, 31 Jan 2023 12:32:34 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: falcon: Describe CAN clock
Date:   Tue, 31 Jan 2023 12:32:33 +0100
Message-Id: <0bf36a1708ad87c00455b96ebaacc63fb7305b7a.1675164686.git.geert+renesas@glider.be>
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

Describe the 40 MHz Crystal Clock Oscillator providing CAN_CLK.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index b2e67b82caf6ec34..63db822e5f4662b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -37,8 +37,12 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&can_clk {
+	clock-frequency = <40000000>;
+};
+
 &canfd {
-	pinctrl-0 = <&canfd0_pins>, <&canfd1_pins>;
+	pinctrl-0 = <&canfd0_pins>, <&canfd1_pins>, <&can_clk_pins>;
 	pinctrl-names = "default";
 	status = "okay";
 
@@ -80,6 +84,11 @@ pins_mii {
 
 	};
 
+	can_clk_pins: can-clk {
+		groups = "can_clk";
+		function = "can_clk";
+	};
+
 	canfd0_pins: canfd0 {
 		groups = "canfd0_data";
 		function = "canfd0";
-- 
2.34.1

