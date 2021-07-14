Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A90583C84B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 14:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239408AbhGNMxm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 08:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239352AbhGNMxk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 08:53:40 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF804C061767
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 05:50:48 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by xavier.telenet-ops.be with bizsmtp
        id V0qX250071ccfby010qX5X; Wed, 14 Jul 2021 14:50:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLO-0018dQ-SJ; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLN-00AaEJ-Q0; Wed, 14 Jul 2021 14:50:29 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>, Mike Rapoport <rppt@kernel.org>
Cc:     Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-mm@kvack.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 05/10] of: fdt: Use IS_ENABLED(CONFIG_BLK_DEV_INITRD) instead of #ifdef
Date:   Wed, 14 Jul 2021 14:50:15 +0200
Message-Id: <2f6ab7db7f9657b809aba7693df697c9bf9f57ae.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace the conditional compilation using "#ifdef CONFIG_BLK_DEV_INITRD"
by a check for "IS_ENABLED(CONFIG_BLK_DEV_INITRD)", to increase compile
coverage and to simplify the code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - New.
---
 drivers/of/fdt.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 1b4dd5418b44b9fb..a98e1bb9c84d9765 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -859,7 +859,6 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
 	return best_data;
 }
 
-#ifdef CONFIG_BLK_DEV_INITRD
 static void __early_init_dt_declare_initrd(unsigned long start,
 					   unsigned long end)
 {
@@ -885,6 +884,9 @@ static void __init early_init_dt_check_for_initrd(unsigned long node)
 	int len;
 	const __be32 *prop;
 
+	if (!IS_ENABLED(CONFIG_BLK_DEV_INITRD))
+		return;
+
 	pr_debug("Looking for initrd properties... ");
 
 	prop = of_get_flat_dt_prop(node, "linux,initrd-start", &len);
@@ -903,11 +905,6 @@ static void __init early_init_dt_check_for_initrd(unsigned long node)
 
 	pr_debug("initrd_start=0x%llx  initrd_end=0x%llx\n", start, end);
 }
-#else
-static inline void early_init_dt_check_for_initrd(unsigned long node)
-{
-}
-#endif /* CONFIG_BLK_DEV_INITRD */
 
 /**
  * early_init_dt_check_for_elfcorehdr - Decode elfcorehdr location from flat
-- 
2.25.1

