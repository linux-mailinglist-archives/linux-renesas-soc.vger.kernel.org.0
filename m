Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822317A19EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Sep 2023 11:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233183AbjIOJGc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Sep 2023 05:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbjIOJGa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2023 05:06:30 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD2549D8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2023 02:04:51 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by albert.telenet-ops.be with bizsmtp
        id m94q2A00C1C8whw0694qBP; Fri, 15 Sep 2023 11:04:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qh4kZ-003lJf-22;
        Fri, 15 Sep 2023 11:04:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qh4ks-00Gdl7-2u;
        Fri, 15 Sep 2023 11:04:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 2/2] ARM: dts: renesas: bockw: Add FLASH node
Date:   Fri, 15 Sep 2023 11:04:46 +0200
Message-Id: <45e6343ae07ef1add8bba5e8281ef9e6a977c573.1694768311.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694768311.git.geert+renesas@glider.be>
References: <cover.1694768311.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a device node for the Spansion S29GL512P NOR FLASH on the Bock-W
development board.  This FLASH resides in the external address space of
the Local Bus State Controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a7778-bockw.dts | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7778-bockw.dts b/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
index 9b65d246e5836a91..a3f9d74e8877b72b 100644
--- a/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
+++ b/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
@@ -62,6 +62,35 @@ sndcodec: simple-audio-card,codec {
 };
 
 &bsc {
+	flash@0 {
+		compatible = "cfi-flash";
+		reg = <0x0 0x04000000>;
+		pinctrl-0 = <&flash_pins>;
+		pinctrl-names = "default";
+		bank-width = <2>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "uboot";
+				reg = <0x00000000 0x00040000>;
+				read-only;
+			};
+			partition@40000 {
+				label = "uboot-env";
+				reg = <0x00040000 0x00040000>;
+				read-only;
+			};
+			partition@80000 {
+				label = "flash";
+				reg = <0x00080000 0x03f80000>;
+			};
+		};
+	};
+
 	ethernet@18300000 {
 		compatible = "smsc,lan89218", "smsc,lan9115";
 		reg = <0x18300000 0x1000>;
@@ -126,6 +155,11 @@ &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
+	flash_pins: flash {
+		groups = "lbsc_cs0";
+		function = "lbsc";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data_a", "scif0_ctrl";
 		function = "scif0";
-- 
2.34.1

