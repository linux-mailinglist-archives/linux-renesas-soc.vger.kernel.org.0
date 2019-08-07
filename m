Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 109B38483A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Aug 2019 10:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbfHGIyY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Aug 2019 04:54:24 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:54460 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfHGIyY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Aug 2019 04:54:24 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id m8uH2000705gfCL068uHUW; Wed, 07 Aug 2019 10:54:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvHi5-0002fs-43; Wed, 07 Aug 2019 10:54:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvHi5-0006Te-1J; Wed, 07 Aug 2019 10:54:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: debug-ll: Add support for r7s9210
Date:   Wed,  7 Aug 2019 10:54:15 +0200
Message-Id: <20190807085415.24854-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable low-level debugging support for RZ/A2M (r7s9210).

The RZA2MEVB board uses either SCIF2 (SDRAM enabled) or SCIF4 (HyperRAM
only) for the serial console.

Note that "SCIFA" serial ports on RZ/A2 SoCs use a compressed register
layout, hence add support for that to renesas-scif.S.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/Kconfig.debug                | 20 +++++++++++++++++++-
 arch/arm/include/debug/renesas-scif.S |  6 +++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 85710e078afb4878..9fe038aecc553deb 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -924,6 +924,20 @@ choice
 		  Say Y here if you want kernel low-level debugging support
 		  via SCIF2 on Renesas RZ/A1H (R7S72100).
 
+	config DEBUG_R7S9210_SCIF2
+		bool "Kernel low-level debugging messages via SCIF2 on R7S9210"
+		depends on ARCH_R7S9210
+		help
+		  Say Y here if you want kernel low-level debugging support
+		  via SCIF2 on Renesas RZ/A2M (R7S9210).
+
+	config DEBUG_R7S9210_SCIF4
+		bool "Kernel low-level debugging messages via SCIF4 on R7S9210"
+		depends on ARCH_R7S9210
+		help
+		  Say Y here if you want kernel low-level debugging support
+		  via SCIF4 on Renesas RZ/A2M (R7S9210).
+
 	config DEBUG_RCAR_GEN1_SCIF0
 		bool "Kernel low-level debugging messages via SCIF0 on R8A7778"
 		depends on ARCH_R8A7778
@@ -1537,6 +1551,8 @@ config DEBUG_LL_INCLUDE
 	default "debug/msm.S" if DEBUG_QCOM_UARTDM
 	default "debug/omap2plus.S" if DEBUG_OMAP2PLUS_UART
 	default "debug/renesas-scif.S" if DEBUG_R7S72100_SCIF2
+	default "debug/renesas-scif.S" if DEBUG_R7S9210_SCIF2
+	default "debug/renesas-scif.S" if DEBUG_R7S9210_SCIF4
 	default "debug/renesas-scif.S" if DEBUG_RCAR_GEN1_SCIF0
 	default "debug/renesas-scif.S" if DEBUG_RCAR_GEN1_SCIF2
 	default "debug/renesas-scif.S" if DEBUG_RCAR_GEN2_SCIF0
@@ -1666,7 +1682,8 @@ config DEBUG_UART_PHYS
 	default 0xe6e60000 if DEBUG_RCAR_GEN2_SCIF0
 	default 0xe6e68000 if DEBUG_RCAR_GEN2_SCIF1
 	default 0xe6ee0000 if DEBUG_RCAR_GEN2_SCIF4
-	default 0xe8008000 if DEBUG_R7S72100_SCIF2
+	default 0xe8008000 if DEBUG_R7S72100_SCIF2 || DEBUG_R7S9210_SCIF2
+	default 0xe8009000 if DEBUG_R7S9210_SCIF4
 	default 0xf0000000 if DEBUG_DIGICOLOR_UA0
 	default 0xf0000be0 if ARCH_EBSA110
 	default 0xf1012000 if DEBUG_MVEBU_UART0_ALTERNATE
@@ -1699,6 +1716,7 @@ config DEBUG_UART_PHYS
 		DEBUG_LL_UART_EFM32 || \
 		DEBUG_UART_8250 || DEBUG_UART_PL01X || DEBUG_MESON_UARTAO || \
 		DEBUG_QCOM_UARTDM || DEBUG_R7S72100_SCIF2 || \
+		DEBUG_R7S9210_SCIF2 || DEBUG_R7S9210_SCIF4 || \
 		DEBUG_RCAR_GEN1_SCIF0 || DEBUG_RCAR_GEN1_SCIF2 || \
 		DEBUG_RCAR_GEN2_SCIF0 || DEBUG_RCAR_GEN2_SCIF1 || \
 		DEBUG_RCAR_GEN2_SCIF2 || DEBUG_RCAR_GEN2_SCIF4 || \
diff --git a/arch/arm/include/debug/renesas-scif.S b/arch/arm/include/debug/renesas-scif.S
index 1c5f795587fc5681..25f06663a9a4e2c1 100644
--- a/arch/arm/include/debug/renesas-scif.S
+++ b/arch/arm/include/debug/renesas-scif.S
@@ -11,7 +11,11 @@
 #define SCIF_PHYS	CONFIG_DEBUG_UART_PHYS
 #define SCIF_VIRT	((SCIF_PHYS & 0x00ffffff) | 0xfd000000)
 
-#if CONFIG_DEBUG_UART_PHYS < 0xe6e00000
+#if defined(CONFIG_DEBUG_R7S9210_SCIF2) || defined(CONFIG_DEBUG_R7S9210_SCIF4)
+/* RZ/A2 SCIFA */
+#define FTDR		0x06
+#define FSR		0x08
+#elif CONFIG_DEBUG_UART_PHYS < 0xe6e00000
 /* SCIFA */
 #define FTDR		0x20
 #define FSR		0x14
-- 
2.17.1

