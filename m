Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7DE78EC8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 13:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjHaLxN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 07:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346145AbjHaLxE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 07:53:04 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2138B10DA
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:52:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by baptiste.telenet-ops.be with bizsmtp
        id gBsf2A00B3874jb01BsfNn; Thu, 31 Aug 2023 13:52:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgDq-002755-Dw;
        Thu, 31 Aug 2023 13:52:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbgE2-00CIVN-T8;
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
Subject: [PATCH/RFC 12/13] ARM: dts: renesas: marzen: Add FLASH node
Date:   Thu, 31 Aug 2023 13:52:34 +0200
Message-Id: <440ce3bb950c34fd57071b4eec83ad9643b682e5.1693481518.git.geert+renesas@glider.be>
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

Add a device node for the Spansion S29GL512N NOR FLASH on the Marzen
development board.  This FLASH resides in the external address space of
the Local Bus State Controller.

Note that as the CFI-FLASH has a run-time conflict with CPU bring-up, it
will only be available when booting with SMP disabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to RFC:
  - Use "cfi-flash" compatible value,
  - Add pin control,
  - Move to LBSC,
  - Depends on "[PATCH] ARM: shmobile: r8a7779: Reserve boot area when
    SMP is enabled".

[1] "[PATCH/RFC] ARM: dts: marzen: Add FLASH node"
    https://lore.kernel.org/r/07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be/
---
 arch/arm/boot/dts/renesas/r8a7779-marzen.dts | 34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7779-marzen.dts b/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
index 9c001cbfc02f79f7..dfc6d63a21cd5474 100644
--- a/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
@@ -229,6 +229,35 @@ &extal_clk {
 };
 
 &lbsc {
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
 	ethernet@18000000 {
 		compatible = "smsc,lan89218", "smsc,lan9115";
 		reg = <0x18000000 0x100>;
@@ -288,6 +317,11 @@ lbsc {
 		};
 	};
 
+	flash_pins: flash {
+		groups = "lbsc_cs0";
+		function = "lbsc";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data_c";
 		function = "scif2";
-- 
2.34.1

