Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC905260E35
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 10:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbgIHI5D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 04:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbgIHI5C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 04:57:02 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8CEC061573
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2020 01:57:01 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id RLwr230074C55Sk01Lwrau; Tue, 08 Sep 2020 10:56:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kFZQp-0000Bo-07; Tue, 08 Sep 2020 10:56:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kFYIO-00019X-GC; Tue, 08 Sep 2020 09:44:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Make rcar_gen2_{timer_init,reserve}() static
Date:   Tue,  8 Sep 2020 09:44:03 +0200
Message-Id: <20200908074403.4379-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As of commit 1e90fea35b80cfe1 ("ARM: shmobile: r8a7791: Use common R-Car
Gen2 machine definition"), there are no more users of
rcar_gen2_timer_init() and rcar_gen2_reserve() outside
arch/arm/mach-shmobile/setup-rcar-gen2.c.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.10.

 arch/arm/mach-shmobile/rcar-gen2.h       | 2 --
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-shmobile/rcar-gen2.h b/arch/arm/mach-shmobile/rcar-gen2.h
index 4777fff2de413b7e..af9dbd6aa49e4d30 100644
--- a/arch/arm/mach-shmobile/rcar-gen2.h
+++ b/arch/arm/mach-shmobile/rcar-gen2.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_RCAR_GEN2_H__
 #define __ASM_RCAR_GEN2_H__
 
-void rcar_gen2_timer_init(void);
-void rcar_gen2_reserve(void);
 void rcar_gen2_pm_init(void);
 
 #endif /* __ASM_RCAR_GEN2_H__ */
diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index fa1b00547d164b42..287dcbdb20de493a 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -61,7 +61,7 @@ static unsigned int __init get_extal_freq(void)
 #define CNTCR 0
 #define CNTFID0 0x20
 
-void __init rcar_gen2_timer_init(void)
+static void __init rcar_gen2_timer_init(void)
 {
 	bool need_update = true;
 	void __iomem *base;
@@ -193,7 +193,7 @@ static int __init rcar_gen2_scan_mem(unsigned long node, const char *uname,
 	return 0;
 }
 
-void __init rcar_gen2_reserve(void)
+static void __init rcar_gen2_reserve(void)
 {
 	struct memory_reserve_config mrc;
 
-- 
2.17.1

