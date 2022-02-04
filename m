Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0A7D4A9B01
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 15:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359325AbiBDObi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 09:31:38 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:41630 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1359321AbiBDObh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 09:31:37 -0500
X-IronPort-AV: E=Sophos;i="5.88,342,1635174000"; 
   d="scan'208";a="108810657"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Feb 2022 23:31:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.77])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8E54B400C75E;
        Fri,  4 Feb 2022 23:31:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Use SW_SD0_DEV_SEL macro for eMMC/SDHI device selection
Date:   Fri,  4 Feb 2022 14:31:32 +0000
Message-Id: <20220204143132.3608-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch replaces EMMC/SDHI macros with SW_SD0_DEV_SEL DIP-Switch
macro for eMMC/SDHI device selection.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi | 14 ++------------
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi     |  2 ++
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index 6ebda3724f2c..90cb7ec45751 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -8,16 +8,6 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
-/* SW1[2] should be at OFF position to enable 64 GB eMMC */
-#define EMMC	1
-
-/*
- * To enable uSD card on CN3,
- * SW1[2] should be at ON position.
- * Disable eMMC by setting "#define EMMC	0" above.
- */
-#define SDHI	(!EMMC)
-
 / {
 	aliases {
 		ethernet0 = &eth0;
@@ -185,7 +175,7 @@
 	};
 };
 
-#if SDHI
+#if (!SW_SD0_DEV_SEL)
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
 	pinctrl-1 = <&sdhi0_pins_uhs>;
@@ -200,7 +190,7 @@
 };
 #endif
 
-#if EMMC
+#if SW_SD0_DEV_SEL
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_emmc_pins>;
 	pinctrl-1 = <&sdhi0_emmc_pins>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index 28f21c287ba3..df7631fe5fac 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -18,6 +18,8 @@
  * Please change below macros according to SW1 setting
  */
 
+#define SW_SD0_DEV_SEL	1
+
 #define SW_SCIF_CAN	0
 #if (SW_SCIF_CAN)
 /* Due to HW routing, SW_RSPI_CAN is always 0 when SW_SCIF_CAN is set to 1 */
-- 
2.17.1

