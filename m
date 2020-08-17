Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47CB6245BBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Aug 2020 06:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgHQEvr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Aug 2020 00:51:47 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:10753 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725812AbgHQEvq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Aug 2020 00:51:46 -0400
Date:   17 Aug 2020 13:51:45 +0900
X-IronPort-AV: E=Sophos;i="5.76,322,1592838000"; 
   d="scan'208";a="54735210"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Aug 2020 13:51:45 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 86A2A41BDAA7;
        Mon, 17 Aug 2020 13:51:45 +0900 (JST)
Message-ID: <87h7t1ho6f.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/3] soc: renesas: sort driver description title
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
In-Reply-To: <87lfidho8o.wl-kuninori.morimoto.gx@renesas.com>
References: <87lfidho8o.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Some Renesas drivers are not organized, or organized by Chip number.
Because of it, menu table is not readable.
This patch sort these.

This patch do
	- Collect RZ/xx in one place
	- Collect SH-Mobile xx in one place
	- align chip number on each groups

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/soc/renesas/Kconfig | 68 ++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index bd9a9ab10d21..d69d02a65f0a 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -53,21 +53,14 @@ config ARCH_EMEV2
 	select HAVE_ARM_SCU if SMP
 	select SYS_SUPPORTS_EM_STI
 
-config ARCH_R7S72100
-	bool "RZ/A1H (R7S72100)"
+config ARCH_SH73A0
+	bool "SH-Mobile AG5 (R8A73A00)"
+	select ARCH_RMOBILE
 	select ARM_ERRATA_754322
-	select PM
-	select PM_GENERIC_DOMAINS
-	select RENESAS_OSTM
-	select RENESAS_RZA1_IRQC
-	select SYS_SUPPORTS_SH_MTU2
-
-config ARCH_R7S9210
-	bool "RZ/A2 (R7S9210)"
-	select PM
-	select PM_GENERIC_DOMAINS
-	select RENESAS_OSTM
-	select RENESAS_RZA1_IRQC
+	select ARM_GLOBAL_TIMER
+	select HAVE_ARM_SCU if SMP
+	select HAVE_ARM_TWD if SMP
+	select RENESAS_INTC_IRQPIN
 
 config ARCH_R8A73A4
 	bool "R-Mobile APE6 (R8A73A40)"
@@ -78,11 +71,27 @@ config ARCH_R8A73A4
 	select RENESAS_IRQC
 
 config ARCH_R8A7740
-	bool "R-Mobile A1 (R8A77400)"
+	bool "R-Mobile A1   (R8A77400)"
 	select ARCH_RMOBILE
 	select ARM_ERRATA_754322
 	select RENESAS_INTC_IRQPIN
 
+config ARCH_R7S72100
+	bool "RZ/A1H (R7S72100)"
+	select ARM_ERRATA_754322
+	select PM
+	select PM_GENERIC_DOMAINS
+	select RENESAS_OSTM
+	select RENESAS_RZA1_IRQC
+	select SYS_SUPPORTS_SH_MTU2
+
+config ARCH_R7S9210
+	bool "RZ/A2  (R7S9210)"
+	select PM
+	select PM_GENERIC_DOMAINS
+	select RENESAS_OSTM
+	select RENESAS_RZA1_IRQC
+
 config ARCH_R8A7742
 	bool "RZ/G1H (R8A77420)"
 	select ARCH_RCAR_GEN2
@@ -114,13 +123,18 @@ config ARCH_R8A77470
 	select ARM_ERRATA_814220
 	select SYSC_R8A77470
 
+config ARCH_R9A06G032
+	bool "RZ/N1D (R9A06G032)"
+	select ARCH_RZN1
+	select ARM_ERRATA_814220
+
 config ARCH_R8A7778
-	bool "R-Car M1A (R8A77781)"
+	bool "R-Car M1A  (R8A77781)"
 	select ARCH_RCAR_GEN1
 	select ARM_ERRATA_754322
 
 config ARCH_R8A7779
-	bool "R-Car H1 (R8A77790)"
+	bool "R-Car H1   (R8A77790)"
 	select ARCH_RCAR_GEN1
 	select ARM_ERRATA_754322
 	select ARM_GLOBAL_TIMER
@@ -129,7 +143,7 @@ config ARCH_R8A7779
 	select SYSC_R8A7779
 
 config ARCH_R8A7790
-	bool "R-Car H2 (R8A77900)"
+	bool "R-Car H2   (R8A77900)"
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select ARM_ERRATA_814220
@@ -144,7 +158,7 @@ config ARCH_R8A7791
 	select SYSC_R8A7791
 
 config ARCH_R8A7792
-	bool "R-Car V2H (R8A77920)"
+	bool "R-Car V2H  (R8A77920)"
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
 	select SYSC_R8A7792
@@ -157,25 +171,11 @@ config ARCH_R8A7793
 	select SYSC_R8A7791
 
 config ARCH_R8A7794
-	bool "R-Car E2 (R8A77940)"
+	bool "R-Car E2   (R8A77940)"
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_814220
 	select SYSC_R8A7794
 
-config ARCH_R9A06G032
-	bool "RZ/N1D (R9A06G032)"
-	select ARCH_RZN1
-	select ARM_ERRATA_814220
-
-config ARCH_SH73A0
-	bool "SH-Mobile AG5 (R8A73A00)"
-	select ARCH_RMOBILE
-	select ARM_ERRATA_754322
-	select ARM_GLOBAL_TIMER
-	select HAVE_ARM_SCU if SMP
-	select HAVE_ARM_TWD if SMP
-	select RENESAS_INTC_IRQPIN
-
 endif # ARM
 
 if ARM64
-- 
2.25.1

