Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FFE2B5CE5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 11:31:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727735AbgKQKac (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 05:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727377AbgKQKab (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 05:30:31 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63AB0C0617A7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 02:30:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id tNWV2300N4C55Sk06NWVL6; Tue, 17 Nov 2020 11:30:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFp-003Bby-0O; Tue, 17 Nov 2020 11:30:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-008xpM-9O; Tue, 17 Nov 2020 11:30:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/7] ARM: shmobile: sh73a0: Use ioremap() to map L2C registers
Date:   Tue, 17 Nov 2020 11:30:20 +0100
Message-Id: <20201117103022.2136527-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117103022.2136527-1-geert+renesas@glider.be>
References: <20201117103022.2136527-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace using the legacy IOMEM() macro to map the L2C registers by
ioremap().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/setup-sh73a0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-sh73a0.c b/arch/arm/mach-shmobile/setup-sh73a0.c
index cac92edd2b8879cc..d626bce83462c86e 100644
--- a/arch/arm/mach-shmobile/setup-sh73a0.c
+++ b/arch/arm/mach-shmobile/setup-sh73a0.c
@@ -44,7 +44,7 @@ static void __init sh73a0_generic_init(void)
 {
 #ifdef CONFIG_CACHE_L2X0
 	/* Shared attribute override enable, 64K*8way */
-	l2x0_init(IOMEM(0xf0100000), 0x00400000, 0xc20f0fff);
+	l2x0_init(ioremap(0xf0100000, PAGE_SIZE), 0x00400000, 0xc20f0fff);
 #endif
 }

-- 
2.25.1

