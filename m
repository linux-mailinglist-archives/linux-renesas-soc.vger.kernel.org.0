Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEB9D78EBC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 13:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240579AbjHaLSB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 07:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbjHaLSA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 07:18:00 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B488CF3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:17:56 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by andre.telenet-ops.be with bizsmtp
        id gBHs2A00d3874jb01BHsCq; Thu, 31 Aug 2023 13:17:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbfgC-0026uz-7u;
        Thu, 31 Aug 2023 13:17:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbfgO-00CHY3-NZ;
        Thu, 31 Aug 2023 13:17:52 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mtd@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 4/4] ARM: shmobile: sh73a0: Reserve boot area when SMP is enabled
Date:   Thu, 31 Aug 2023 13:17:47 +0200
Message-Id: <20eb4e7fca9c41a34500fc5984602b41006b4575.1693409184.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693409184.git.geert+renesas@glider.be>
References: <cover.1693409184.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CPU core bringup on SH-Mobile AG5 uses the SYS Boot Address (SBAR) and
Address Translation Area (APARMBAREA) registers to specify the base
address and size of the boot area of the System CPU.  With this enabled,
when the System CPU accesses a physical address in the range from zero
up to the configured size, the top address bits are replaced by those
specified in the SBAR register.  Hence any device residing in this low
part of physical address space cannot be accessed.

Prevent conflicts by reserving this memory region using
request_mem_region().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/smp-sh73a0.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-shmobile/smp-sh73a0.c b/arch/arm/mach-shmobile/smp-sh73a0.c
index 453d488650295842..3757aed64c4241a5 100644
--- a/arch/arm/mach-shmobile/smp-sh73a0.c
+++ b/arch/arm/mach-shmobile/smp-sh73a0.c
@@ -44,10 +44,16 @@ static int sh73a0_boot_secondary(unsigned int cpu, struct task_struct *idle)
 
 static void __init sh73a0_smp_prepare_cpus(unsigned int max_cpus)
 {
-	void __iomem *ap = ioremap(AP_BASE, PAGE_SIZE);
-	void __iomem *sysc = ioremap(SYSC_BASE, PAGE_SIZE);
+	void __iomem *ap, *sysc;
+
+	if (!request_mem_region(0, SZ_4K, "Boot Area")) {
+		pr_err("Failed to request boot area\n");
+		return;
+	};
 
 	/* Map the reset vector (in headsmp.S) */
+	ap = ioremap(AP_BASE, PAGE_SIZE);
+	sysc = ioremap(SYSC_BASE, PAGE_SIZE);
 	writel(0, ap + APARMBAREA);      /* 4k */
 	writel(__pa(shmobile_boot_vector), sysc + SBAR);
 	iounmap(sysc);
-- 
2.34.1

