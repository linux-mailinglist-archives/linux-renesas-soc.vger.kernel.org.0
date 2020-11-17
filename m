Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7750F2B5CE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 11:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbgKQKac (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 05:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgKQKac (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 05:30:32 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFEF8C0613CF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 02:30:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id tNWV2300R4C55Sk01NWVsL; Tue, 17 Nov 2020 11:30:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-003Bc0-WF; Tue, 17 Nov 2020 11:30:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-008xpW-Ay; Tue, 17 Nov 2020 11:30:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/7] ARM: shmobile: sh73a0: Remove obsolete static mapping
Date:   Tue, 17 Nov 2020 11:30:22 +0100
Message-Id: <20201117103022.2136527-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117103022.2136527-1-geert+renesas@glider.be>
References: <20201117103022.2136527-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are no more users of the statically mapped IOMEM region on
SH-Mobile AG5.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/setup-sh73a0.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-sh73a0.c b/arch/arm/mach-shmobile/setup-sh73a0.c
index d626bce83462c86e..405e1af68a684f9a 100644
--- a/arch/arm/mach-shmobile/setup-sh73a0.c
+++ b/arch/arm/mach-shmobile/setup-sh73a0.c
@@ -22,24 +22,6 @@
 #include "common.h"
 #include "sh73a0.h"
 
-static struct map_desc sh73a0_io_desc[] __initdata = {
-	/* create a 1:1 identity mapping for 0xe6xxxxxx
-	 * used by CPGA, INTC and PFC.
-	 */
-	{
-		.virtual	= 0xe6000000,
-		.pfn		= __phys_to_pfn(0xe6000000),
-		.length		= 256 << 20,
-		.type		= MT_DEVICE_NONSHARED
-	},
-};
-
-static void __init sh73a0_map_io(void)
-{
-	debug_ll_io_init();
-	iotable_init(sh73a0_io_desc, ARRAY_SIZE(sh73a0_io_desc));
-}
-
 static void __init sh73a0_generic_init(void)
 {
 #ifdef CONFIG_CACHE_L2X0
@@ -56,7 +38,6 @@ static const char *const sh73a0_boards_compat_dt[] __initconst = {
 
 DT_MACHINE_START(SH73A0_DT, "Generic SH73A0 (Flattened Device Tree)")
 	.smp		= smp_ops(sh73a0_smp_ops),
-	.map_io		= sh73a0_map_io,
 	.init_machine	= sh73a0_generic_init,
 	.init_late	= shmobile_init_late,
 	.dt_compat	= sh73a0_boards_compat_dt,
-- 
2.25.1

