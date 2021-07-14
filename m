Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B34843C84B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 14:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239412AbhGNMxm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 08:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239374AbhGNMxl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 08:53:41 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C246C061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 05:50:49 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by andre.telenet-ops.be with bizsmtp
        id V0qW2500Y1ccfby010qWp4; Wed, 14 Jul 2021 14:50:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLO-0018dS-Kf; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLN-00AaEX-RP; Wed, 14 Jul 2021 14:50:29 +0200
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
Subject: [PATCH v4 07/10] arm64: kdump: Remove custom linux,elfcorehdr parsing
Date:   Wed, 14 Jul 2021 14:50:17 +0200
Message-Id: <65b6e3294cb84d50a6aab8503a9ebcf41445166d.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Remove the architecture-specific code for parsing the "linux,elfcorehdr"
property under the "/chosen" node in DT, as the platform-agnostic
handling in the FDT core code already takes care of this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - s/handlng/parsing/ in patch description.
---
 arch/arm64/mm/init.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 8490ed2917ff2430..946e246660f2b180 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -125,25 +125,6 @@ static void __init reserve_crashkernel(void)
 #endif /* CONFIG_KEXEC_CORE */
 
 #ifdef CONFIG_CRASH_DUMP
-static int __init early_init_dt_scan_elfcorehdr(unsigned long node,
-		const char *uname, int depth, void *data)
-{
-	const __be32 *reg;
-	int len;
-
-	if (depth != 1 || strcmp(uname, "chosen") != 0)
-		return 0;
-
-	reg = of_get_flat_dt_prop(node, "linux,elfcorehdr", &len);
-	if (!reg || (len < (dt_root_addr_cells + dt_root_size_cells)))
-		return 1;
-
-	elfcorehdr_addr = dt_mem_next_cell(dt_root_addr_cells, &reg);
-	elfcorehdr_size = dt_mem_next_cell(dt_root_size_cells, &reg);
-
-	return 1;
-}
-
 /*
  * reserve_elfcorehdr() - reserves memory for elf core header
  *
@@ -154,8 +135,6 @@ static int __init early_init_dt_scan_elfcorehdr(unsigned long node,
  */
 static void __init reserve_elfcorehdr(void)
 {
-	of_scan_flat_dt(early_init_dt_scan_elfcorehdr, NULL);
-
 	if (!elfcorehdr_size)
 		return;
 
-- 
2.25.1

