Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E367E2B5CEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 11:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgKQKad (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 05:30:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727731AbgKQKac (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 05:30:32 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62B3C0617A7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 02:30:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id tNWU2300r4C55Sk01NWUrz; Tue, 17 Nov 2020 11:30:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-003Bbt-K6; Tue, 17 Nov 2020 11:30:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-008xp2-6H; Tue, 17 Nov 2020 11:30:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/7] ARM: shmobile: r8a7778: Introduce HPBREG_BASE
Date:   Tue, 17 Nov 2020 11:30:16 +0100
Message-Id: <20201117103022.2136527-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117103022.2136527-1-geert+renesas@glider.be>
References: <20201117103022.2136527-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace the hardcoded address of the HPB Register block by a macro.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/setup-r8a7778.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-r8a7778.c b/arch/arm/mach-shmobile/setup-r8a7778.c
index 2bc93f391bcf8e5d..819dbda47298ae88 100644
--- a/arch/arm/mach-shmobile/setup-r8a7778.c
+++ b/arch/arm/mach-shmobile/setup-r8a7778.c
@@ -14,6 +14,8 @@
 
 #include "common.h"
 
+#define HPBREG_BASE	0xfe700000
+
 #define INT2SMSKCR0	0x82288 /* 0xfe782288 */
 #define INT2SMSKCR1	0x8228c /* 0xfe78228c */
 
@@ -22,7 +24,7 @@
 
 static void __init r8a7778_init_irq_dt(void)
 {
-	void __iomem *base = ioremap(0xfe700000, 0x00100000);
+	void __iomem *base = ioremap(HPBREG_BASE, 0x00100000);
 
 	BUG_ON(!base);
 
-- 
2.25.1

