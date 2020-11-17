Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C872B5CE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 11:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbgKQKac (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 05:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727728AbgKQKac (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 05:30:32 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E186DC0617A6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 02:30:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id tNWV2300D4C55Sk01NWVsA; Tue, 17 Nov 2020 11:30:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-003Bbx-SP; Tue, 17 Nov 2020 11:30:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-008xpH-8l; Tue, 17 Nov 2020 11:30:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/7] ARM: shmobile: r8a7779: Remove obsolete static mappings
Date:   Tue, 17 Nov 2020 11:30:19 +0100
Message-Id: <20201117103022.2136527-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117103022.2136527-1-geert+renesas@glider.be>
References: <20201117103022.2136527-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are no more users of the statically mapped IOMEM regions on R-Car
H1.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/setup-r8a7779.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-r8a7779.c b/arch/arm/mach-shmobile/setup-r8a7779.c
index 07c1bc96d4d9767f..446d40b50b7b784b 100644
--- a/arch/arm/mach-shmobile/setup-r8a7779.c
+++ b/arch/arm/mach-shmobile/setup-r8a7779.c
@@ -15,29 +15,6 @@
 #include "common.h"
 #include "r8a7779.h"
 
-static struct map_desc r8a7779_io_desc[] __initdata = {
-	/* 2M identity mapping for 0xf0000000 (MPCORE) */
-	{
-		.virtual	= 0xf0000000,
-		.pfn		= __phys_to_pfn(0xf0000000),
-		.length		= SZ_2M,
-		.type		= MT_DEVICE_NONSHARED
-	},
-	/* 16M identity mapping for 0xfexxxxxx (DMAC-S/HPBREG/INTC2/LRAM/DBSC) */
-	{
-		.virtual	= 0xfe000000,
-		.pfn		= __phys_to_pfn(0xfe000000),
-		.length		= SZ_16M,
-		.type		= MT_DEVICE_NONSHARED
-	},
-};
-
-static void __init r8a7779_map_io(void)
-{
-	debug_ll_io_init();
-	iotable_init(r8a7779_io_desc, ARRAY_SIZE(r8a7779_io_desc));
-}
-
 #define HPBREG_BASE	0xfe700000
 
 /* IRQ */
@@ -77,7 +54,6 @@ static const char *const r8a7779_compat_dt[] __initconst = {
 
 DT_MACHINE_START(R8A7779_DT, "Generic R8A7779 (Flattened Device Tree)")
 	.smp		= smp_ops(r8a7779_smp_ops),
-	.map_io		= r8a7779_map_io,
 	.init_irq	= r8a7779_init_irq_dt,
 	.init_late	= shmobile_init_late,
 	.dt_compat	= r8a7779_compat_dt,
-- 
2.25.1

