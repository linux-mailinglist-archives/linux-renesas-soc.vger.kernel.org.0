Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 299C2E1AA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390056AbfJWMdw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:33:52 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:45762 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389863AbfJWMdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:33:45 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id H0Zj2100d05gfCL060ZkVE; Wed, 23 Oct 2019 14:33:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpf-0003tY-S7; Wed, 23 Oct 2019 14:33:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpf-0003QE-R5; Wed, 23 Oct 2019 14:33:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 01/11] soc: renesas: Rename SYSC_R8A7796 to SYSC_R8A77960
Date:   Wed, 23 Oct 2019 14:33:32 +0200
Message-Id: <20191023123342.13100-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023123342.13100-1-geert+renesas@glider.be>
References: <20191023123342.13100-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rename CONFIG_SYSC_R8A7796 for R-Car M3-W (R8A77960) to
CONFIG_SYSC_R8A77960, to avoid confusion with R-Car M3-W+ (R8A77961),
which will use CONFIG_SYSC_R8A77961.

Rename r8a7796_sysc_info and r8a7796_sysc_init for consistency.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/soc/renesas/Kconfig        | 4 ++--
 drivers/soc/renesas/Makefile       | 2 +-
 drivers/soc/renesas/r8a7796-sysc.c | 8 ++++----
 drivers/soc/renesas/rcar-sysc.c    | 4 ++--
 drivers/soc/renesas/rcar-sysc.h    | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 3bd0c218bf30992a..328d7c409202e6a5 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -202,7 +202,7 @@ config ARCH_R8A7795
 config ARCH_R8A7796
 	bool "Renesas R-Car M3-W SoC Platform"
 	select ARCH_RCAR_GEN3
-	select SYSC_R8A7796
+	select SYSC_R8A77960
 	help
 	  This enables support for the Renesas R-Car M3-W SoC.
 
@@ -292,7 +292,7 @@ config SYSC_R8A7795
 	bool "R-Car H3 System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
 
-config SYSC_R8A7796
+config SYSC_R8A77960
 	bool "R-Car M3-W System Controller support" if COMPILE_TEST
 	select SYSC_RCAR
 
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index e99dc37ea1209444..d8a7cfdc9c9cc45f 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -15,7 +15,7 @@ obj-$(CONFIG_SYSC_R8A7791)	+= r8a7791-sysc.o
 obj-$(CONFIG_SYSC_R8A7792)	+= r8a7792-sysc.o
 obj-$(CONFIG_SYSC_R8A7794)	+= r8a7794-sysc.o
 obj-$(CONFIG_SYSC_R8A7795)	+= r8a7795-sysc.o
-obj-$(CONFIG_SYSC_R8A7796)	+= r8a7796-sysc.o
+obj-$(CONFIG_SYSC_R8A77960)	+= r8a7796-sysc.o
 obj-$(CONFIG_SYSC_R8A77965)	+= r8a77965-sysc.o
 obj-$(CONFIG_SYSC_R8A77970)	+= r8a77970-sysc.o
 obj-$(CONFIG_SYSC_R8A77980)	+= r8a77980-sysc.o
diff --git a/drivers/soc/renesas/r8a7796-sysc.c b/drivers/soc/renesas/r8a7796-sysc.c
index d374622a667bbfbd..c2accd8d76686ef4 100644
--- a/drivers/soc/renesas/r8a7796-sysc.c
+++ b/drivers/soc/renesas/r8a7796-sysc.c
@@ -47,16 +47,16 @@ static const struct soc_device_attribute r8a7796es1[] __initconst = {
 	{ /* sentinel */ }
 };
 
-static int __init r8a7796_sysc_init(void)
+static int __init r8a77960_sysc_init(void)
 {
 	if (soc_device_match(r8a7796es1))
-		r8a7796_sysc_info.extmask_val = 0;
+		r8a77960_sysc_info.extmask_val = 0;
 
 	return 0;
 }
 
-struct rcar_sysc_info r8a7796_sysc_info __initdata = {
-	.init = r8a7796_sysc_init,
+struct rcar_sysc_info r8a77960_sysc_info __initdata = {
+	.init = r8a77960_sysc_init,
 	.areas = r8a7796_areas,
 	.num_areas = ARRAY_SIZE(r8a7796_areas),
 	.extmask_offs = 0x2f8,
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index d4f2ed52b2b363be..5f17b12e9d0c6a87 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -313,8 +313,8 @@ static const struct of_device_id rcar_sysc_matches[] __initconst = {
 #ifdef CONFIG_SYSC_R8A7795
 	{ .compatible = "renesas,r8a7795-sysc", .data = &r8a7795_sysc_info },
 #endif
-#ifdef CONFIG_SYSC_R8A7796
-	{ .compatible = "renesas,r8a7796-sysc", .data = &r8a7796_sysc_info },
+#ifdef CONFIG_SYSC_R8A77960
+	{ .compatible = "renesas,r8a7796-sysc", .data = &r8a77960_sysc_info },
 #endif
 #ifdef CONFIG_SYSC_R8A77965
 	{ .compatible = "renesas,r8a77965-sysc", .data = &r8a77965_sysc_info },
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index e4c9854f5dc00492..379a6b2661ebce87 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -61,7 +61,7 @@ extern const struct rcar_sysc_info r8a7791_sysc_info;
 extern const struct rcar_sysc_info r8a7792_sysc_info;
 extern const struct rcar_sysc_info r8a7794_sysc_info;
 extern struct rcar_sysc_info r8a7795_sysc_info;
-extern struct rcar_sysc_info r8a7796_sysc_info;
+extern struct rcar_sysc_info r8a77960_sysc_info;
 extern const struct rcar_sysc_info r8a77965_sysc_info;
 extern const struct rcar_sysc_info r8a77970_sysc_info;
 extern const struct rcar_sysc_info r8a77980_sysc_info;
-- 
2.17.1

