Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA002169A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2019 11:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727669AbfEQJ6p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 May 2019 05:58:45 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33544 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbfEQJ6p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 May 2019 05:58:45 -0400
Received: by mail-lj1-f195.google.com with SMTP id w1so5796777ljw.0;
        Fri, 17 May 2019 02:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7IQqw/zCk49M4CTj1Osv3TDkm05cc0pffIOGepZLXmo=;
        b=XHc9m3rWVl8kKVuFONLFh9duic0MoOGqenQYMKs9C0mjlOiBRlHZCcVlYwexy/2H1S
         gkWi4fD3pi/e1GhZ/uAUh+C5XKm5PnWF1U8rZ4lWHBcoFVb4ik5GNdlYve+v9SdIcB6a
         Q2eY4Xk/ep4+42mSSdxi8376gvn2lKpVXZocHg8wr8ybFuNQ9tYwCsZ4yDGUGiBt1re+
         M7fldX6Cc3EkykHxzhJP0ITiUMXfkUP92FKa+KJJzga3n37vvZ3YvDzzJrLhqTA/DVdI
         WJiAnk5FbTEzI7xZIZNcUrIMKJSAytV3WCeuaZHavMyy/b+iJCqQOSCah7Htihq/lBs+
         q9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7IQqw/zCk49M4CTj1Osv3TDkm05cc0pffIOGepZLXmo=;
        b=IwJqZYOfbZHmFSeRMNSPe6W7onCoI/sBgDTEZBQXVR7EOWmOvi8jrD+YqXS9eoSqjL
         CZ3uLKwoZM/2Uewgm8z4CTYhLy4J/MlXT6FtC7Qj9JzkmGWx5WyiN47/xKu6IYHvIHkA
         lgfAatjBfOn6+D8Y9kzJd6kwBe5L1OiGwsttAVCaoRW7QE3Ee7dhkyZEAy4t8zhQL+nc
         ilZ2I7xGORWmtcaFpo84DCijgxyLZraUFVUxO9t19hiCAbHoklQPGWYVVPV5ssBy+hme
         KFM3uypHZLvHGYVpVjKJOtUIKagVW3iEtS6Q7qMMh4YqsZv9tFiPc7XdBvO/7iLJOuda
         fj2w==
X-Gm-Message-State: APjAAAV1BF8UqKxSnk1IGCbnIqrsdGLxdzRYEQXgk8TYSvBrO1llLzCP
        7Mdo+GgPY/+vXWwSQtix1YwOJO/thPk=
X-Google-Smtp-Source: APXvYqz7lvkwBZ1PTqgT0BBKUlqadz1F0K35Dq7yLjC4EsZO7HzMHBHXt/eN8h09dUEfAOWRZ8RJEQ==
X-Received: by 2002:a2e:730c:: with SMTP id o12mr24903943ljc.61.1558087123094;
        Fri, 17 May 2019 02:58:43 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
        by smtp.gmail.com with ESMTPSA id y27sm1328720ljd.14.2019.05.17.02.58.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 17 May 2019 02:58:42 -0700 (PDT)
From:   Oleksandr Tyshchenko <olekstysh@gmail.com>
To:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     julien.grall@arm.com, horms@verge.net.au, magnus.damm@gmail.com,
        linux@armlinux.org.uk, geert@linux-m68k.org,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V5] ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI is available
Date:   Fri, 17 May 2019 12:58:13 +0300
Message-Id: <1558087093-22113-1-git-send-email-olekstysh@gmail.com>
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

---
   You can find previous discussions here:
   [v1]  https://lkml.org/lkml/2019/4/17/810
   [v2]  https://lkml.org/lkml/2019/5/3/338
   [v3]  https://lkml.org/lkml/2019/5/10/415
   [RFC] https://lkml.org/lkml/2019/5/10/473
   [v4]  https://lkml.org/lkml/2019/5/14/550

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
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index eea60b2..0eeca49b 100644
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
@@ -62,6 +63,21 @@ void __init rcar_gen2_timer_init(void)
 {
 	void __iomem *base;
 	u32 freq;
+	bool need_update = true;
+
+	/*
+	 * If PSCI is available then most likely we are running on PSCI-enabled
+	 * U-Boot which, we assume, has already taken care of resetting CNTVOFF
+	 * and updating counter module before switching to non-secure mode
+	 * and we don't need to.
+	 */
+#if defined(CONFIG_ARM_PSCI_FW)
+	if (psci_ops.cpu_on)
+		need_update = false;
+#endif
+
+	if (need_update == false)
+		goto skip_update;
 
 	secure_cntvoff_init();
 
@@ -102,6 +118,7 @@ void __init rcar_gen2_timer_init(void)
 
 	iounmap(base);
 
+skip_update:
 	of_clk_init(NULL);
 	timer_probe();
 }
-- 
2.7.4

