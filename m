Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51C8B2E1DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2019 18:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfE2QFT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 May 2019 12:05:19 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33051 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfE2QFT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 May 2019 12:05:19 -0400
Received: by mail-lj1-f195.google.com with SMTP id w1so3065417ljw.0;
        Wed, 29 May 2019 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3GGGJA3/I10hmN+FaID7oELuHlwizlwhFdAP02ZnolQ=;
        b=mKSaLVai8fibO9xKHXtzRA7PDgGPWELFQ3E7x9Zz5tEvUAFreXll1s/5+3JW0i46wp
         zj3796TIVoSku/Gaed0HWnuU/BgHtn4KQmUL7iMUiqk4RpEquAwKzVrJ7iRKzEh2vI4E
         snMm3uGbiAdj6maldgD55Fagf9KcrF4rd64YueRxn5MSB0iS9BbsKWyzN9nGyXnc3zmN
         1F10NBbNFwZwThR7f4KdP18gCSibcMvbs4bLL4D6H+8QETUTcfCZriRBitDXHjiUk54S
         SH8AmdhJLF5qv51j7ZD/u/2DxQhkn1Yyc8DliOV32tdCjrnRwCKnrjjOU5NT6q0ljlz9
         8PDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3GGGJA3/I10hmN+FaID7oELuHlwizlwhFdAP02ZnolQ=;
        b=uU0+5L9sWdMndFEfcRDNi7UdyIRrCtx9ZGmlJc0x8QW9YhIXSNkY0PfDGBsQ9JtcQO
         1sa97dJB4K1gXYVE+GF6lWhM43Z2ExeNDh6W6xVuFG+p0Schka7qOe0ybOVYLc/wLeR0
         fmMoU2TdS/MF0S6zxbyjgXooCpvhTrgzR19W4r5Xka6WlVYAk30MuYTH/VRjhl9kALUw
         33szW8fATD3izVPgyWRUpbEyDs8m2IGHf7MiNuB+V7BXwFLCTm52L5m308npsgmCZrfN
         olNToH0TyMsMd4tDhEvSk9U24u3sb0PCxAr5cSoWSwanGdFk7bhwqM/48zD+LqaLkna1
         rBzA==
X-Gm-Message-State: APjAAAXIT3RbyT9HbknnHVWZUMAb3GEZeNmDsj4w7q5iO6YjWwuU1kaG
        /Y8G4+5MszORzpqdoPOVDmEH0TzaXvI=
X-Google-Smtp-Source: APXvYqzLp5xKUGGGWBXOnT/y1XSI7KgHDiukVIOqLlK45IjtJk9lqFcIiFl87qV6vYJ1UK6yLhu4fA==
X-Received: by 2002:a2e:8583:: with SMTP id b3mr42982443lji.136.1559145916644;
        Wed, 29 May 2019 09:05:16 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
        by smtp.gmail.com with ESMTPSA id k18sm3537179ljk.70.2019.05.29.09.05.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 29 May 2019 09:05:15 -0700 (PDT)
From:   Oleksandr Tyshchenko <olekstysh@gmail.com>
To:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     julien.grall@arm.com, horms@verge.net.au, magnus.damm@gmail.com,
        linux@armlinux.org.uk, geert@linux-m68k.org,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V6] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI is available
Date:   Wed, 29 May 2019 19:05:00 +0300
Message-Id: <1559145900-5757-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

If PSCI is available then most likely we are running on PSCI-enabled
U-Boot which, we assume, has already taken care of resetting CNTVOFF
and updating counter module before switching to non-secure mode
and we don't need to.

As the psci_smp_available() helper always returns false if CONFIG_SMP
is disabled, it can't be used safely as an indicator of PSCI usage.
For that reason, we check for the mandatory PSCI operation to be
available.

Please note, an extra check to prevent secure_cntvoff_init() from
being called for secondary CPUs in headsmp-apmu.S is not needed,
as SMP code for APMU based system is not executed if PSCI is in use.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
   You can find previous discussions here:
   [v1]  https://lkml.org/lkml/2019/4/17/810
   [v2]  https://lkml.org/lkml/2019/5/3/338
   [v3]  https://lkml.org/lkml/2019/5/10/415
   [RFC] https://lkml.org/lkml/2019/5/10/473
   [v4]  https://lkml.org/lkml/2019/5/14/550
   [v5]  https://lkml.org/lkml/2019/5/17/219

   Changes in v2:
      - Clarify patch subject/description
      - Don't use CONFIG_ARM_PSCI option, check whether the PSCI is available,
        by using psci_smp_available()
      - Check whether we are running on top of Xen, by using xen_domain()

   Changes in v3:
      - Don't check for the presence of Xen

   Changes in v4:
      - Don't use psci_smp_available() helper, check for psci_ops.cpu_on
        directly
      - Skip updating counter module if PSCI is available

   Changes in v5:
      - Check for psci_ops.cpu_on if CONFIG_ARM_PSCI_FW is defined

   Changes in v6:
      - Use reverse Xmas tree declaration order
      - Use #ifdef instead of #if defined()
      - Add Geert's R-b
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index eea60b2..9e4bc18 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -17,6 +17,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
+#include <linux/psci.h>
 #include <asm/mach/arch.h>
 #include <asm/secure_cntvoff.h>
 #include "common.h"
@@ -60,9 +61,24 @@ static unsigned int __init get_extal_freq(void)
 
 void __init rcar_gen2_timer_init(void)
 {
+	bool need_update = true;
 	void __iomem *base;
 	u32 freq;
 
+	/*
+	 * If PSCI is available then most likely we are running on PSCI-enabled
+	 * U-Boot which, we assume, has already taken care of resetting CNTVOFF
+	 * and updating counter module before switching to non-secure mode
+	 * and we don't need to.
+	 */
+#ifdef CONFIG_ARM_PSCI_FW
+	if (psci_ops.cpu_on)
+		need_update = false;
+#endif
+
+	if (need_update == false)
+		goto skip_update;
+
 	secure_cntvoff_init();
 
 	if (of_machine_is_compatible("renesas,r8a7745") ||
@@ -102,6 +118,7 @@ void __init rcar_gen2_timer_init(void)
 
 	iounmap(base);
 
+skip_update:
 	of_clk_init(NULL);
 	timer_probe();
 }
-- 
2.7.4

