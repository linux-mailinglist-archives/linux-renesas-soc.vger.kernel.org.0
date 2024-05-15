Return-Path: <linux-renesas-soc+bounces-5370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B16E8C6832
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2024 16:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E59521F24F74
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2024 14:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A759A13F458;
	Wed, 15 May 2024 14:02:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A4C13F00B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2024 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781749; cv=none; b=V1FPAMS528tHJV2BpEERFYuJnvvcgeJyfT23vKUxcjKZiWrlhm33FKZ84uebIBFxYQsBuCUyvH/NZsbSDtN7ivHIuuTaT4YUYTj6eOtTb3kzUlubbRHtqIsCaGMOkD3fCp5xj5bjV/D2Q64MLY1UBvKS8deJdSkztCIUhHiDCAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781749; c=relaxed/simple;
	bh=PHeG/627dOPWa8LHTtWxDV007SWbZTNzDw4Wof0MrS0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SKwtd/0qSy1A7yl5h4rZRWaHbO1yWjahflB7BaD7CL0/mQNhcah3uA10MhRMFZ1b3xiUOktt5ecP7+mSQ8EihWjMeqB2N1fHoczuM3CTWw9Fi3kFhvBfwodOaqsETlRkqcwcs3NJNTZYu92NXuyUD5DGlnP5bwPGriFtm4BWa6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b558:3285:d1a8:9c24])
	by andre.telenet-ops.be with bizsmtp
	id PS2G2C0091HiNV501S2Ge7; Wed, 15 May 2024 16:02:20 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s7FC8-007Obr-CA;
	Wed, 15 May 2024 16:02:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s7FCy-004hZL-8O;
	Wed, 15 May 2024 16:02:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: Fix userspace enter on LPAE with CC_OPTIMIZE_FOR_SIZE=y
Date: Wed, 15 May 2024 16:02:14 +0200
Message-Id: <200d273a83906a68a1c4a9298c415980737be811.1715781469.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Booting an LPAE-enabled kernel built with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
fails when starting userspace:

    Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
    CPU: 1 PID: 1 Comm: init Tainted: G        W        N 6.9.0-rc1-koelsch-00004-g7af5b901e847 #1930
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    Call trace:
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x78/0xa8
     dump_stack_lvl from panic+0x118/0x398
     panic from do_exit+0x1ec/0x938
     do_exit from sys_exit_group+0x0/0x10
    ---[ end Kernel panic - not syncing: Attempted to kill init!  exitcode=0x00000004 ]---

Add the missing memory clobber to cpu_set_ttbcr(), as suggested by
Russell King.

Force inlining of uaccess_save_and_enable(), as suggested by Ard
Biesheuvel.

The latter fixes booting on Koelsch.

Fixes: 7af5b901e84743c6 ("ARM: 9358/2: Implement PAN for LPAE by TTBR0 page table walks disablement")
Closes: https://lore.kernel.org/r/CAMuHMdWTAJcZ9BReWNhpmsgkOzQxLNb5OhNYxzxv6D5TSh2fwQ@mail.gmail.com/
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Feel free to fold into the original commit.

Apparently the "From: Catalin Marinas <catalin.marinas@arm.com>" in
https://lore.kernel.org/r/20240312-arm32-lpae-pan-v3-4-532647afcd38@linaro.org
is not reflected in commit 7af5b901e84743c6?
---
 arch/arm/include/asm/proc-fns.h | 2 +-
 arch/arm/include/asm/uaccess.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/proc-fns.h b/arch/arm/include/asm/proc-fns.h
index 9b3105a2a5e0691e..b4986a23d8528a50 100644
--- a/arch/arm/include/asm/proc-fns.h
+++ b/arch/arm/include/asm/proc-fns.h
@@ -187,7 +187,7 @@ static inline unsigned int cpu_get_ttbcr(void)
 
 static inline void cpu_set_ttbcr(unsigned int ttbcr)
 {
-	asm("mcr p15, 0, %0, c2, c0, 2" : : "r" (ttbcr));
+	asm volatile("mcr p15, 0, %0, c2, c0, 2" : : "r" (ttbcr) : "memory");
 }
 
 #else	/*!CONFIG_MMU */
diff --git a/arch/arm/include/asm/uaccess.h b/arch/arm/include/asm/uaccess.h
index 25d21d7d6e3efee0..6c9c16d767cfd5df 100644
--- a/arch/arm/include/asm/uaccess.h
+++ b/arch/arm/include/asm/uaccess.h
@@ -47,7 +47,7 @@ static __always_inline void uaccess_restore(unsigned int flags)
 
 #elif defined(CONFIG_CPU_TTBR0_PAN)
 
-static inline unsigned int uaccess_save_and_enable(void)
+static __always_inline unsigned int uaccess_save_and_enable(void)
 {
 	unsigned int old_ttbcr = cpu_get_ttbcr();
 
-- 
2.34.1


