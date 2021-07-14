Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D9B3C84AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 14:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239385AbhGNMxl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 08:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239347AbhGNMxk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 08:53:40 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B8CC061768
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 05:50:48 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by xavier.telenet-ops.be with bizsmtp
        id V0qW2500U1ccfby010qW5T; Wed, 14 Jul 2021 14:50:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLO-0018dV-Ab; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLN-00AaEl-Sn; Wed, 14 Jul 2021 14:50:29 +0200
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
Subject: [PATCH v4 09/10] arm64: kdump: Use IS_ENABLED(CONFIG_CRASH_DUMP) instead of #ifdef
Date:   Wed, 14 Jul 2021 14:50:19 +0200
Message-Id: <767e34a7ec29c417fdd5ff6e0fc76bc93d4f3c6f.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace the conditional compilation using "#ifdef CONFIG_CRASH_DUMP" by
a check for "IS_ENABLED(CONFIG_CRASH_DUMP)", to increase compile
coverage and to simplify the code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - New.
---
 arch/arm64/mm/init.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index f90ba99437c0f3c9..dc2a5b73232843e4 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -124,7 +124,6 @@ static void __init reserve_crashkernel(void)
 }
 #endif /* CONFIG_KEXEC_CORE */
 
-#ifdef CONFIG_CRASH_DUMP
 /*
  * reserve_elfcorehdr() - reserves memory for elf core header
  *
@@ -135,7 +134,7 @@ static void __init reserve_crashkernel(void)
  */
 static void __init reserve_elfcorehdr(void)
 {
-	if (!elfcorehdr_size)
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP) || !elfcorehdr_size)
 		return;
 
 	if (memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)) {
@@ -148,11 +147,6 @@ static void __init reserve_elfcorehdr(void)
 	pr_info("Reserving %lldKB of memory at 0x%llx for elfcorehdr\n",
 		elfcorehdr_size >> 10, elfcorehdr_addr);
 }
-#else
-static void __init reserve_elfcorehdr(void)
-{
-}
-#endif /* CONFIG_CRASH_DUMP */
 
 /*
  * Return the maximum physical address for a zone accessible by the given bits
-- 
2.25.1

