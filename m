Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F99130FA57
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 18:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237901AbhBDRyg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 12:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238756AbhBDRv2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:51:28 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C71BC061786
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 09:50:43 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id R5qf2400L4C55Sk015qf6B; Thu, 04 Feb 2021 18:50:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im6-003Fgj-UY; Thu, 04 Feb 2021 18:50:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7f5F-006vvo-Tb; Thu, 04 Feb 2021 14:54:09 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/6] soc: renesas: Introduce RENESAS_APMU Kconfig option
Date:   Thu,  4 Feb 2021 14:54:04 +0100
Message-Id: <20210204135409.1652604-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204135409.1652604-1-geert+renesas@glider.be>
References: <20210204135409.1652604-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas Advanced Power Management Unit for AP-System Core (APMU) is
not limited to R-Car Gen2 and RZ/G1 SoCs, but also present on R-Mobile
APE6.

Hence introduce a separate Kconfig symbol to control the build of
APMU-related files, currently selected by ARCH_RCAR_GEN2.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/Makefile | 5 +++--
 drivers/soc/renesas/Kconfig     | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-shmobile/Makefile b/arch/arm/mach-shmobile/Makefile
index f7bf17b7abaef7a9..bce16aa04c5c1bb2 100644
--- a/arch/arm/mach-shmobile/Makefile
+++ b/arch/arm/mach-shmobile/Makefile
@@ -20,7 +20,8 @@ obj-$(CONFIG_ARCH_R7S9210)	+= setup-r7s9210.o
 cpu-y				:= platsmp.o headsmp.o
 
 # Shared SoC family objects
-obj-$(CONFIG_ARCH_RCAR_GEN2)	+= setup-rcar-gen2.o platsmp-apmu.o $(cpu-y)
+obj-$(CONFIG_ARCH_RCAR_GEN2)	+= setup-rcar-gen2.o
+obj-$(CONFIG_RENESAS_APMU)	+= platsmp-apmu.o $(cpu-y)
 CFLAGS_setup-rcar-gen2.o	+= -march=armv7-a
 obj-$(CONFIG_ARCH_R8A7790)	+= regulator-quirk-rcar-gen2.o
 obj-$(CONFIG_ARCH_R8A7791)	+= regulator-quirk-rcar-gen2.o
@@ -28,7 +29,7 @@ obj-$(CONFIG_ARCH_R8A7793)	+= regulator-quirk-rcar-gen2.o
 
 # SMP objects
 smp-y				:= $(cpu-y)
-smp-$(CONFIG_ARCH_RCAR_GEN2)	+= headsmp-apmu.o
+smp-$(CONFIG_RENESAS_APMU)	+= headsmp-apmu.o
 smp-$(CONFIG_ARCH_SH73A0)	+= smp-sh73a0.o headsmp-scu.o platsmp-scu.o
 smp-$(CONFIG_ARCH_R8A7779)	+= smp-r8a7779.o headsmp-scu.o platsmp-scu.o
 smp-$(CONFIG_ARCH_EMEV2)	+= smp-emev2.o headsmp-scu.o platsmp-scu.o
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index b70bbc38efc6771d..f92b6cdff8d6ca25 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -6,6 +6,9 @@ menuconfig SOC_RENESAS
 
 if SOC_RENESAS
 
+config RENESAS_APMU
+	bool
+
 config ARCH_RCAR_GEN1
 	bool
 	select PM
@@ -19,6 +22,7 @@ config ARCH_RCAR_GEN2
 	select HAVE_ARM_ARCH_TIMER
 	select PM
 	select PM_GENERIC_DOMAINS
+	select RENESAS_APMU
 	select RENESAS_IRQC
 	select RST_RCAR
 	select SYS_SUPPORTS_SH_CMT
-- 
2.25.1

