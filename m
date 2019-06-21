Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7C464E2C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbfFUJMQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:12:16 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33672 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbfFUJMO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:12:14 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0E47025AD85;
        Fri, 21 Jun 2019 19:12:13 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 14588940954; Fri, 21 Jun 2019 11:12:11 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI is available
Date:   Fri, 21 Jun 2019 11:12:08 +0200
Message-Id: <51a0daf64dee78dacaecc7bec3d36e0b2f49c7a1.1561105093.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561105093.git.horms+renesas@verge.net.au>
References: <cover.1561105093.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

If PSCI is available then most likely we are running on PSCI-enabled
U-Boot which, we assume, has already taken care of resetting CNTVOFF
and updating counter module before switching to non-secure mode
and we don't need to.

As the psci_smp_available() helper always returns false if CONFIG_SMP
is disabled, it can't be used safely as an indicator of PSCI usage.
For that reason, we check for the mandatory PSCI operation to be
available.

Please note, an extra check to prevent secure_cntvoff_init() from
being called for secondary CPUs in headsmp-apmu.S is not needed,
as SMP code for APMU based system is not executed if PSCI is in use.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index eea60b20c6b4..9e4bc1865f84 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -17,6 +17,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
+#include <linux/psci.h>
 #include <asm/mach/arch.h>
 #include <asm/secure_cntvoff.h>
 #include "common.h"
@@ -60,9 +61,24 @@ static unsigned int __init get_extal_freq(void)
 
 void __init rcar_gen2_timer_init(void)
 {
+	bool need_update = true;
 	void __iomem *base;
 	u32 freq;
 
+	/*
+	 * If PSCI is available then most likely we are running on PSCI-enabled
+	 * U-Boot which, we assume, has already taken care of resetting CNTVOFF
+	 * and updating counter module before switching to non-secure mode
+	 * and we don't need to.
+	 */
+#ifdef CONFIG_ARM_PSCI_FW
+	if (psci_ops.cpu_on)
+		need_update = false;
+#endif
+
+	if (need_update == false)
+		goto skip_update;
+
 	secure_cntvoff_init();
 
 	if (of_machine_is_compatible("renesas,r8a7745") ||
@@ -102,6 +118,7 @@ void __init rcar_gen2_timer_init(void)
 
 	iounmap(base);
 
+skip_update:
 	of_clk_init(NULL);
 	timer_probe();
 }
-- 
2.11.0

