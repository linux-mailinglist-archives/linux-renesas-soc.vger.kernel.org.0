Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42DC78EBC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 13:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242380AbjHaLSB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 07:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjHaLSA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 07:18:00 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715B8CE4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:17:56 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by andre.telenet-ops.be with bizsmtp
        id gBHs2A00b3874jb01BHsCo; Thu, 31 Aug 2023 13:17:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbfgC-0026up-6P;
        Thu, 31 Aug 2023 13:17:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbfgO-00CHXu-LD;
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
Subject: [PATCH/RFC 2/4] ARM: shmobile: rcar-gen2: Reserve boot area when SMP is enabled
Date:   Thu, 31 Aug 2023 13:17:45 +0200
Message-Id: <091150233acb0557a2ad3294d67b2adb6758670c.1693409184.git.geert+renesas@glider.be>
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

CPU core bringup on R-Car Gen2 SoCs uses the Cortex-A7/A15 Boot Address
Register to specify the boot area of the System CPU.  With this enabled,
when the System CPU accesses a physical address in the range from 0x0 to
0x3ffff, the top address bits are replaced by those specified in the
SBAR register.  Hence any device residing in the low 256 KiB of physical
address space cannot be accessed.

Prevent conflicts by reserving this memory region using
request_mem_region().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/pm-rcar-gen2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mach-shmobile/pm-rcar-gen2.c b/arch/arm/mach-shmobile/pm-rcar-gen2.c
index 7447e5fd7ed41e99..3453d5733224df44 100644
--- a/arch/arm/mach-shmobile/pm-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/pm-rcar-gen2.c
@@ -52,6 +52,11 @@ void __init rcar_gen2_pm_init(void)
 	struct resource res;
 	int error;
 
+	if (!request_mem_region(0, SZ_256K, "Boot Area")) {
+		pr_err("Failed to request boot area\n");
+		return;
+	};
+
 	for_each_of_cpu_node(np) {
 		if (of_device_is_compatible(np, "arm,cortex-a15"))
 			has_a15 = true;
-- 
2.34.1

