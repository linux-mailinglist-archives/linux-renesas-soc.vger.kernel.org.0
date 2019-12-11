Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B886C11AC74
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2019 14:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbfLKNwZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Dec 2019 08:52:25 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:57946 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729228AbfLKNwZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Dec 2019 08:52:25 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id cdsP2100J5USYZQ01dsPbB; Wed, 11 Dec 2019 14:52:23 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1if2Pf-00014M-PC; Wed, 11 Dec 2019 14:52:23 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1if2Pf-0006yk-Nz; Wed, 11 Dec 2019 14:52:23 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/4] ARM: shmobile: Enable ARM_GLOBAL_TIMER on Cortex-A9 MPCore SoCs
Date:   Wed, 11 Dec 2019 14:52:22 +0100
Message-Id: <20191211135222.26770-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211135222.26770-1-geert+renesas@glider.be>
References: <20191211135222.26770-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SH-Mobile AG5 and R-Car H1 SoCs are based on the Cortex-A9 MPCore, which
includes a global timer.

Enable the ARM global timer on these SoCs, which will be used for:
  - the scheduler clock, improving scheduler accuracy from 10 ms to 3 or
    4 ns,
  - delay loops, allowing removal of calls to shmobile_init_delay() from
    the corresponding machine vectors.

Note that when using an old DTB lacking the global timer, the kernel
will still work.  However, loops-per-jiffies will no longer be preset,
and the delay loop will need to be calibrated during boot.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebased
---
 arch/arm/mach-shmobile/setup-r8a7779.c | 1 -
 arch/arm/mach-shmobile/setup-sh73a0.c  | 1 -
 drivers/soc/renesas/Kconfig            | 2 ++
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-r8a7779.c b/arch/arm/mach-shmobile/setup-r8a7779.c
index b13ec9088ce5354c..86406e3f9b22e31f 100644
--- a/arch/arm/mach-shmobile/setup-r8a7779.c
+++ b/arch/arm/mach-shmobile/setup-r8a7779.c
@@ -72,7 +72,6 @@ static const char *const r8a7779_compat_dt[] __initconst = {
 DT_MACHINE_START(R8A7779_DT, "Generic R8A7779 (Flattened Device Tree)")
 	.smp		= smp_ops(r8a7779_smp_ops),
 	.map_io		= r8a7779_map_io,
-	.init_early	= shmobile_init_delay,
 	.init_irq	= r8a7779_init_irq_dt,
 	.init_late	= shmobile_init_late,
 	.dt_compat	= r8a7779_compat_dt,
diff --git a/arch/arm/mach-shmobile/setup-sh73a0.c b/arch/arm/mach-shmobile/setup-sh73a0.c
index 4b7d07a36a24aa75..cac92edd2b8879cc 100644
--- a/arch/arm/mach-shmobile/setup-sh73a0.c
+++ b/arch/arm/mach-shmobile/setup-sh73a0.c
@@ -56,7 +56,6 @@ static const char *const sh73a0_boards_compat_dt[] __initconst = {
 DT_MACHINE_START(SH73A0_DT, "Generic SH73A0 (Flattened Device Tree)")
 	.smp		= smp_ops(sh73a0_smp_ops),
 	.map_io		= sh73a0_map_io,
-	.init_early	= shmobile_init_delay,
 	.init_machine	= sh73a0_generic_init,
 	.init_late	= shmobile_init_late,
 	.dt_compat	= sh73a0_boards_compat_dt,
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 2d10e34cdbe4d117..f87a7466171c5eba 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -116,6 +116,7 @@ config ARCH_R8A7779
 	bool "R-Car H1 (R8A77790)"
 	select ARCH_RCAR_GEN1
 	select ARM_ERRATA_754322
+	select ARM_GLOBAL_TIMER
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
 	select SYSC_R8A7779
@@ -163,6 +164,7 @@ config ARCH_SH73A0
 	bool "SH-Mobile AG5 (R8A73A00)"
 	select ARCH_RMOBILE
 	select ARM_ERRATA_754322
+	select ARM_GLOBAL_TIMER
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
 	select RENESAS_INTC_IRQPIN
-- 
2.17.1

