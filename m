Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 486E978EC86
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 13:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346136AbjHaLxL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 07:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346133AbjHaLxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 07:53:04 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5E510CF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:52:40 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by albert.telenet-ops.be with bizsmtp
        id gBsf2A0033874jb06BsfXb; Thu, 31 Aug 2023 13:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgDq-00274y-Bt;
        Thu, 31 Aug 2023 13:52:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgE2-00CIVE-Rb;
        Thu, 31 Aug 2023 13:52:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/13] ARM: dts: renesas: genmai: Add FLASH nodes
Date:   Thu, 31 Aug 2023 13:52:32 +0200
Message-Id: <53c89c70c6b010702fd9ab5247e19986857671ba.1693481518.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693481518.git.geert+renesas@glider.be>
References: <cover.1693481518.git.geert+renesas@glider.be>
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

Add device nodes for the two Spansion S29GL512S NOR FLASHes and the
dual Spansion S25FL512S QSPI NOR FLASH on the Genmai development board.
The former reside in the address space of the Bus State Controller
(BSC).  The latter is mapped directly through the SPI Multi I/O Bus
Controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index ee52c6d5349d0046..29ba098f5dd5e86b 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -29,6 +29,35 @@ memory@8000000 {
 		reg = <0x08000000 0x08000000>;
 	};
 
+	flash@18000000 {
+		compatible = "mtd-rom";
+		reg = <0x18000000 0x08000000>;
+		bank-width = <4>;
+		device-width = <1>;
+
+		clocks = <&mstp9_clks R7S72100_CLK_SPIBSC0>;
+		power-domains = <&cpg_clocks>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "user";
+				reg = <0x00000000 0x04000000>;
+			};
+
+			partition@4000000 {
+				label = "user1";
+				reg = <0x04000000 0x40000000>;
+			};
+		};
+	};
+
 	leds {
 		status = "okay";
 		compatible = "gpio-leds";
@@ -82,6 +111,62 @@ &extal_clk {
 	clock-frequency = <13330000>;
 };
 
+&bsc {
+	flash@0 {
+		compatible = "cfi-flash";
+		reg = <0x00000000 0x04000000>;
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
+			};
+
+			partition@40000 {
+				label = "uboot-env";
+				reg = <0x00040000 0x00020000>;
+			};
+
+			partition@60000 {
+				label = "flash";
+				reg = <0x00060000 0x03fa0000>;
+			};
+		};
+	};
+
+	flash@4000000 {
+		compatible = "cfi-flash";
+		reg = <0x04000000 0x04000000>;
+		bank-width = <2>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "uboot1";
+				reg = <0x00000000 0x00040000>;
+			};
+
+			partition@40000 {
+				label = "uboot-env1";
+				reg = <0x00040000 0x00020000>;
+			};
+
+			partition@60000 {
+				label = "flash1";
+				reg = <0x00060000 0x03fa0000>;
+			};
+		};
+	};
+};
+
 &usb_x1_clk {
 	clock-frequency = <48000000>;
 };
-- 
2.34.1

