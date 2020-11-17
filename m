Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDB22B5CE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 11:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727728AbgKQKac (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 05:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727740AbgKQKac (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 05:30:32 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0241EC061A47
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 02:30:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id tNWV230014C55Sk01NWVs8; Tue, 17 Nov 2020 11:30:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-003Bbv-S2; Tue, 17 Nov 2020 11:30:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-008xp6-6v; Tue, 17 Nov 2020 11:30:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
Date:   Tue, 17 Nov 2020 11:30:17 +0100
Message-Id: <20201117103022.2136527-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117103022.2136527-1-geert+renesas@glider.be>
References: <20201117103022.2136527-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace using the legacy IOMEM() macro to map various registers related
to INTC2 configuration by ioremap().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/setup-r8a7779.c | 34 +++++++++++++++-----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-shmobile/setup-r8a7779.c b/arch/arm/mach-shmobile/setup-r8a7779.c
index 86406e3f9b22e31f..07c1bc96d4d9767f 100644
--- a/arch/arm/mach-shmobile/setup-r8a7779.c
+++ b/arch/arm/mach-shmobile/setup-r8a7779.c
@@ -38,30 +38,36 @@ static void __init r8a7779_map_io(void)
 	iotable_init(r8a7779_io_desc, ARRAY_SIZE(r8a7779_io_desc));
 }
 
+#define HPBREG_BASE	0xfe700000
+
 /* IRQ */
-#define INT2SMSKCR0 IOMEM(0xfe7822a0)
-#define INT2SMSKCR1 IOMEM(0xfe7822a4)
-#define INT2SMSKCR2 IOMEM(0xfe7822a8)
-#define INT2SMSKCR3 IOMEM(0xfe7822ac)
-#define INT2SMSKCR4 IOMEM(0xfe7822b0)
+#define INT2SMSKCR0	0x822a0	/* Interrupt Submask Clear Register 0 */
+#define INT2SMSKCR1	0x822a4	/* Interrupt Submask Clear Register 1 */
+#define INT2SMSKCR2	0x822a8	/* Interrupt Submask Clear Register 2 */
+#define INT2SMSKCR3	0x822ac	/* Interrupt Submask Clear Register 3 */
+#define INT2SMSKCR4	0x822b0	/* Interrupt Submask Clear Register 4 */
 
-#define INT2NTSR0 IOMEM(0xfe700060)
-#define INT2NTSR1 IOMEM(0xfe700064)
+#define INT2NTSR0	0x00060	/* Interrupt Notification Select Register 0 */
+#define INT2NTSR1	0x00064	/* Interrupt Notification Select Register 1 */
 
 static void __init r8a7779_init_irq_dt(void)
 {
+	void __iomem *base = ioremap(HPBREG_BASE, 0x00100000);
+
 	irqchip_init();
 
 	/* route all interrupts to ARM */
-	__raw_writel(0xffffffff, INT2NTSR0);
-	__raw_writel(0x3fffffff, INT2NTSR1);
+	__raw_writel(0xffffffff, base + INT2NTSR0);
+	__raw_writel(0x3fffffff, base + INT2NTSR1);
 
 	/* unmask all known interrupts in INTCS2 */
-	__raw_writel(0xfffffff0, INT2SMSKCR0);
-	__raw_writel(0xfff7ffff, INT2SMSKCR1);
-	__raw_writel(0xfffbffdf, INT2SMSKCR2);
-	__raw_writel(0xbffffffc, INT2SMSKCR3);
-	__raw_writel(0x003fee3f, INT2SMSKCR4);
+	__raw_writel(0xfffffff0, base + INT2SMSKCR0);
+	__raw_writel(0xfff7ffff, base + INT2SMSKCR1);
+	__raw_writel(0xfffbffdf, base + INT2SMSKCR2);
+	__raw_writel(0xbffffffc, base + INT2SMSKCR3);
+	__raw_writel(0x003fee3f, base + INT2SMSKCR4);
+
+	iounmap(base);
 }
 
 static const char *const r8a7779_compat_dt[] __initconst = {
-- 
2.25.1

