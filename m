Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F4112C24
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 13:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbfECLSQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 07:18:16 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35942 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbfECLSP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 07:18:15 -0400
Received: by mail-lj1-f196.google.com with SMTP id y8so4681359ljd.3;
        Fri, 03 May 2019 04:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=eJXURNNvLCpeFBpRtJCIRPKpBboCkLnQxDdwM/tNb1U=;
        b=KVpLdx+c0FazhIk9DysPEnyHpZz7UKLQjnFBYMUL3hpnH3EPaWzEAKirN/hvLCClVn
         e4UaHC76lOeTmW7N+q5XgtjXchPKIU/zBJSpdzrDYHI7YfMFWs5kbTjoz1Wjl0+jamjk
         Qga8yOqa3G/nIkLSAXu4t02rUsoyQHigekUIQfaCCy5sMhDOfAtP2h5/HNbiToW3aafw
         QUGFht57y/Il9IW3807teHhXNZtD1l2oQUphIiGs1jVeJQ9JqylHFg6X4tBiQO5xKT7X
         v4Zzue0kZfges4yO7xyzWYwJOk95Acv/CRvE++YZorIa4ociSuktQrODA0hR2YsrXt50
         S6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eJXURNNvLCpeFBpRtJCIRPKpBboCkLnQxDdwM/tNb1U=;
        b=ZWsrZ89yBM86UseIoHiYB3JtZrRio7l6VUvByStmMOVYhp26GsphCPkankQ4RL1fJn
         BuHHKpRBsvLS80zo98QixV3mnvumMI52tUUGDRvDp0l5/jXaVdrutxRPZ2HfRAgD27OM
         HUbe401+wTI88HIis+MTLRo14upOMXla8lSlYRNoiKe4fj0v8/8LHaRnSueWDadP+wFY
         RwlGBEcvn0C9hTBfhk1FhftjboeEcDT7ruRUtxIyqNzc+Kab/a6Zv1Kv01Mdv1+C1Fcn
         zAaqk7wAR6XV0ZMvHcFeZIms2hLPe7IywdJjDNFL2W/Z/Iqwxr1CPkDWPdlSkLzcUXPR
         /UBg==
X-Gm-Message-State: APjAAAXLhB1BPTGMMDz2Iwfc3aM42SMzuWx0N2uwzT3y/BcEFghfxdQt
        p1VXoISLvVGkzIE77HLZXhFw1qBRb+A=
X-Google-Smtp-Source: APXvYqy0gS0PHe0iNMbFopADZzUG2RCrLQDmjIP6ZigtXC4HXB/4Stinp4Bt4AXyhGYTPAXaPNpB9Q==
X-Received: by 2002:a2e:8794:: with SMTP id n20mr5097631lji.76.1556882293173;
        Fri, 03 May 2019 04:18:13 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
        by smtp.gmail.com with ESMTPSA id p19sm370795lfc.48.2019.05.03.04.18.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 03 May 2019 04:18:12 -0700 (PDT)
From:   Oleksandr Tyshchenko <olekstysh@gmail.com>
To:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     julien.grall@arm.com, horms@verge.net.au, magnus.damm@gmail.com,
        linux@armlinux.org.uk, biju.das@bp.renesas.com,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V2] ARM: mach-shmobile: Don't init CNTVOFF if PSCI is available
Date:   Fri,  3 May 2019 14:17:48 +0300
Message-Id: <1556882268-27451-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

If PSCI is available then most likely we are running on PSCI-enabled
U-Boot which, we assume, has already taken care of resetting CNTVOFF
before switching to non-secure mode and we don't need to.

Also, don't init CNTVOFF if we are running on top of Xen hypervisor,
as CNTVOFF is controlled by hypervisor itself and shouldn't be touched
by Dom0 in such case.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
   You can find previous discussion here:
   https://lkml.org/lkml/2019/4/17/810

   Changes in v2:
      - Clarify patch subject/description
      - Don't use CONFIG_ARM_PSCI option, check whether the PSCI is available,
        by using psci_smp_available()
      - Check whether we are running on top of Xen, by using xen_domain()
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index eea60b2..bc8537b 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -17,7 +17,9 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
+#include <xen/xen.h>
 #include <asm/mach/arch.h>
+#include <asm/psci.h>
 #include <asm/secure_cntvoff.h>
 #include "common.h"
 #include "rcar-gen2.h"
@@ -63,7 +65,16 @@ void __init rcar_gen2_timer_init(void)
 	void __iomem *base;
 	u32 freq;
 
-	secure_cntvoff_init();
+	/*
+	 * If PSCI is available then most likely we are running on PSCI-enabled
+	 * U-Boot which, we assume, has already taken care of resetting CNTVOFF
+	 * before switching to non-secure mode and we don't need to.
+	 * Another check is to be sure that we are not running on top of Xen
+	 * hypervisor, as CNTVOFF is controlled by hypervisor itself and
+	 * shouldn't be touched by Dom0 in such case.
+	 */
+	if (!psci_smp_available() && !xen_domain())
+		secure_cntvoff_init();
 
 	if (of_machine_is_compatible("renesas,r8a7745") ||
 	    of_machine_is_compatible("renesas,r8a77470") ||
-- 
2.7.4

