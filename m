Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74FB478EC8F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 13:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241600AbjHaLxO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 07:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346176AbjHaLxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 07:53:04 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2355010E2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:52:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by laurent.telenet-ops.be with bizsmtp
        id gBsf2A0023874jb01Bsfvy; Thu, 31 Aug 2023 13:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgDq-00274z-Cg;
        Thu, 31 Aug 2023 13:52:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgE2-00CIVJ-SJ;
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
Subject: [PATCH 11/13] ARM: dts: renesas: rskrza1: Add FLASH nodes
Date:   Thu, 31 Aug 2023 13:52:33 +0200
Message-Id: <17a221699da14639e72264ffa39d47592d470f9a.1693481518.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693481518.git.geert+renesas@glider.be>
References: <cover.1693481518.git.geert+renesas@glider.be>
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

Add device nodes for the Spansion S29GL512S NOR FLASH and the dual
Spansion S25FL512S QSPI NOR FLASH on the RSK+RZA1 development board.
The former resides in the external address space of the Bus State
Controller (BSC).  The latter is mapped directly through the SPI Multi
I/O Bus Controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../arm/boot/dts/renesas/r7s72100-rskrza1.dts | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
index e95b820e401663eb..f3233290041d0b52 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
@@ -29,6 +29,48 @@ memory@8000000 {
 		reg = <0x08000000 0x02000000>;
 	};
 
+	flash@18000000 {
+		compatible = "mtd-rom";
+		reg = <0x18000000 0x08000000>;
+		clocks = <&mstp9_clks R7S72100_CLK_SPIBSC0>;
+		power-domains = <&cpg_clocks>;
+		bank-width = <4>;
+		device-width = <1>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "uboot";
+				reg = <0x00000000 0x00080000>;
+			};
+
+			partition@80000 {
+				label = "uboot-env";
+				reg = <0x00080000 0x00040000>;
+			};
+
+			partition@c0000 {
+				label = "dt";
+				reg = <0x000c0000 0x00040000>;
+			};
+
+			partition@100000 {
+				label = "kernel";
+				reg = <0x00100000 0x00280000>;
+			};
+
+			partition@400000 {
+				label = "rootfs";
+				reg = <0x00400000 0x01c00000>;
+			};
+		};
+	};
+
 	keyboard {
 		compatible = "gpio-keys";
 
@@ -113,6 +155,30 @@ eeprom@50 {
 	};
 };
 
+&bsc {
+	flash@0 {
+		compatible = "cfi-flash";
+		reg = <0x00000000 0x4000000>;
+		bank-width = <2>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "apps";
+				reg = <0x00000000 0x01000000>;
+			};
+
+			partition@1000000 {
+				label = "data";
+				reg = <0x01000000 0x03000000>;
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

