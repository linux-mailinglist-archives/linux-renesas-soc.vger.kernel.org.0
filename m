Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAC319FF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 17:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbfEJPQc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 11:16:32 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40999 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727353AbfEJPQc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 11:16:32 -0400
Received: by mail-lj1-f195.google.com with SMTP id k8so5394672lja.8;
        Fri, 10 May 2019 08:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UovbodiAPH01A7Tcpc/52cdJYhzSVeuvrSUyXwSIGMY=;
        b=VO6jPCKVOzfVew1boUYMZmskgf/NPM6AOJJgSWYT8GFFTi8BhTiuQNARiiL6Eox+ou
         N+ZgQAn4i6pxl4IDUFQXnHwrsQGHRIAevMbQe4Cw+TilhZS8R83yYKmGZKNnkbPA79g4
         II8RqwVOaX7tOFIUe5uu3S6CJifz7cnJTSZzd3pYC8eBISgoe6f3ovH/3FC9SbupqBYO
         6GRy4u3z6jY6eX7gcfgY8UbzRsMaJXQK6YgpugtgWgDT/peEoG6/yxCTUHCdm2QShCiC
         Gv3THVJUIOw/IprvmZk9fi8E0++qHqYfvlyeLCqksZC4VaNafDWtxVvUUDrTRTQumS0S
         wWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UovbodiAPH01A7Tcpc/52cdJYhzSVeuvrSUyXwSIGMY=;
        b=iZBui+f/6cpLPse/AA4ORd1AkuvPagKRuENFSMUK0nnSNJ0Q6ywgMvkuL4z+6nAyg6
         Xj9jKt543/i+43exDdn/XYP6lRC+8CHer7e3eD8EvukZwN7MhgOKpK/Cnvc2Uz/OtOdN
         0XmIw0KqYKHCNuvWk/sEB0owI7+zlYHSVhxy6DTQIXibEezJe43loipN+KnQePx7WA3A
         aBfhggwWKxi5H9u329k3gQdwq35f3QvEVRX+LYdPXG+6rVjTKpn9sfDmxk0CXlJpzIid
         3RZEjDRBStbpOhfpohGPg4I+EfajTBi8SmGlcf45QCbDcB44+r4LA/OUCsbI5Xo8/WnM
         Q7jw==
X-Gm-Message-State: APjAAAV44eBvdUCqLfl0qys7mRSVqQ/juRXPytLXfYODyYiIzigRrNUa
        ltnENjt5sJyir+Nr2AVLrKTDMG4QNl0=
X-Google-Smtp-Source: APXvYqzjQ3HAbAY4NbU911V5cjC+7qK7izvPshyPKb7zQM66e0eMF385k1F5NRT8GAnsIpLCSa2s3w==
X-Received: by 2002:a2e:8141:: with SMTP id t1mr6369926ljg.122.1557501389839;
        Fri, 10 May 2019 08:16:29 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
        by smtp.gmail.com with ESMTPSA id k3sm1291830ljj.73.2019.05.10.08.16.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 10 May 2019 08:16:29 -0700 (PDT)
From:   Oleksandr Tyshchenko <olekstysh@gmail.com>
To:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     julien.grall@arm.com, horms@verge.net.au, magnus.damm@gmail.com,
        linux@armlinux.org.uk, biju.das@bp.renesas.com,
        geert@linux-m68k.org,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V3] ARM: mach-shmobile: Don't init CNTVOFF if PSCI is available
Date:   Fri, 10 May 2019 18:16:13 +0300
Message-Id: <1557501373-24436-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

If PSCI is available then most likely we are running on PSCI-enabled
U-Boot which, we assume, has already taken care of resetting CNTVOFF
before switching to non-secure mode and we don't need to.

Please note, an extra check to prevent secure_cntvoff_init() from
being called for secondary CPUs in headsmp-apmu.S is not needed,
as SMP code for APMU based system is not executed if PSCI is in use.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
   You can find previous discussions here:
   [v1] https://lkml.org/lkml/2019/4/17/810
   [v2] https://lkml.org/lkml/2019/5/3/338

   Changes in v2:
      - Clarify patch subject/description
      - Don't use CONFIG_ARM_PSCI option, check whether the PSCI is available,
        by using psci_smp_available()
      - Check whether we are running on top of Xen, by using xen_domain()

   Changes in v3:
      - Don't check for the presence of Xen
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index eea60b2..35dda21 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -18,6 +18,7 @@
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 #include <asm/mach/arch.h>
+#include <asm/psci.h>
 #include <asm/secure_cntvoff.h>
 #include "common.h"
 #include "rcar-gen2.h"
@@ -63,7 +64,13 @@ void __init rcar_gen2_timer_init(void)
 	void __iomem *base;
 	u32 freq;
 
-	secure_cntvoff_init();
+	/*
+	 * If PSCI is available then most likely we are running on PSCI-enabled
+	 * U-Boot which, we assume, has already taken care of resetting CNTVOFF
+	 * before switching to non-secure mode and we don't need to.
+	 */
+	if (!psci_smp_available())
+		secure_cntvoff_init();
 
 	if (of_machine_is_compatible("renesas,r8a7745") ||
 	    of_machine_is_compatible("renesas,r8a77470") ||
-- 
2.7.4

