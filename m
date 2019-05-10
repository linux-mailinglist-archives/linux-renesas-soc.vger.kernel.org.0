Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A971A158
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 18:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfEJQXH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 12:23:07 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38096 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfEJQXH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 12:23:07 -0400
Received: by mail-lf1-f65.google.com with SMTP id y19so4569204lfy.5;
        Fri, 10 May 2019 09:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ayY1uydNbi09S54QGqWj/gKqj2c4BgGfzdZK20ZWByU=;
        b=ixVqAjVT4nEj7ElJ4+oPsfs/itKW4X4vU8v6F94p7FJRWAuHjnuM510YOIMC174eGt
         2b0/k6+OEjBNDLHeRxZUUwwionRljahp83Hw6HGSxDAUHqdqWKZkAX0CF8InrgM2sNSK
         5tKduvvXM6S2XXls0SvDIsdjjeUw4pZeIPD7Bz3m/OzWmNCfueFM9n5bSlY8shYcq3z5
         lCoOBp4YfxEIL6l2f8xohZZRGYvOxYSNA2EQr94TUq5ycmvog4knRxVFDAEdqhxziWuO
         EA1TzJk4uFN4dhrIirdJKeoEJbbbtziR1kIKdS9JjBB9jum+yn68uFaGuLLkn0nWrzZa
         90cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ayY1uydNbi09S54QGqWj/gKqj2c4BgGfzdZK20ZWByU=;
        b=Ca8oJdWHdv+aY6MFy2id3Sm9SQm4fGYlGUuTGB5RE4AmQ9XUxEz3gAOCEddW0bGApU
         c8SpJQbxQtcFdMgpkIwAPkA8dTY+Q4qtaoxpuuDJQ82+r4SZ3gionPbHE5/W71ohnnm3
         v3Ha6+yA9642KQujYiKNYs6WkLul87hWCY5TlTYxIQOlgHImcbhQH2wbj18rvPeXWUor
         5tQCSMvTJoIRZmhFmp2X2sLnyC2JWWtwC2pgyN6i9s8yRUT+ItqqKQml+q1sprPSbhvC
         urOgjEZ//Tznq61iDGu+MsgKF4i8nXzUzw/ZuCGBjmxeCkJMAYzphpUJ1b9ZpLiK7Ig0
         Ah2w==
X-Gm-Message-State: APjAAAXkZ9L2sX8JTxyC37xToTsLgtNPF17VQePaepjM6joL+cmX+iZd
        KWEeWX+DnRt9TO9wEB+TgzjhEAQfHHI=
X-Google-Smtp-Source: APXvYqyZR6Cs5GH6zJDgLKpDIylalMinGPFQRdaUOVl8hukJxEvg+xm6wZCjO7n46eWhFEFmXhcZPw==
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr6892246lfa.25.1557505385006;
        Fri, 10 May 2019 09:23:05 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
        by smtp.gmail.com with ESMTPSA id z12sm1693732lfh.72.2019.05.10.09.23.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 10 May 2019 09:23:04 -0700 (PDT)
From:   Oleksandr Tyshchenko <olekstysh@gmail.com>
To:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     julien.grall@arm.com, horms@verge.net.au, magnus.damm@gmail.com,
        linux@armlinux.org.uk,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [RFC PATCH] ARM: mach-shmobile: Parse DT to get ARCH timer memory region
Date:   Fri, 10 May 2019 19:22:57 +0300
Message-Id: <1557505377-28577-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Don't use hardcoded address, retrieve it from device-tree instead.

And besides, this patch fixes the memory error when running
on top of Xen hypervisor:

(XEN) traps.c:1999:d0v0 HSR=0x93830007 pc=0xc0b097f8 gva=0xf0805000
      gpa=0x000000e6080000

Which shows that VCPU0 in Dom0 is trying to access an address in memory
it is not allowed to access (0x000000e6080000).
Put simply, Xen doesn't know that it is a device's register memory
since it wasn't described in a host device tree (which Xen parses)
and as the result this memory region wasn't assigned to Dom0 at
domain creation time.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---

This patch is meant to get feedback from the community before
proceeding further. If we decide to go this direction, all Gen2
device-trees should be updated (add memory region) before
this patch going in.

e.g. r8a7790.dtsi:

...
timer {
	compatible = "arm,armv7-timer";
	interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
			      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
			      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
			      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	 reg = <0 0xe6080000 0 0x1000>;
};
...

---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 35dda21..153e3f5 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/memblock.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 #include <asm/mach/arch.h>
@@ -61,6 +62,8 @@ static unsigned int __init get_extal_freq(void)
 
 void __init rcar_gen2_timer_init(void)
 {
+	struct device_node *np;
+	struct resource res;
 	void __iomem *base;
 	u32 freq;
 
@@ -72,6 +75,13 @@ void __init rcar_gen2_timer_init(void)
 	if (!psci_smp_available())
 		secure_cntvoff_init();
 
+	np = of_find_compatible_node(NULL, NULL, "arm,armv7-timer");
+	if (!np)
+		goto out;
+
+	if (of_address_to_resource(np, 0, &res))
+		goto out;
+
 	if (of_machine_is_compatible("renesas,r8a7745") ||
 	    of_machine_is_compatible("renesas,r8a77470") ||
 	    of_machine_is_compatible("renesas,r8a7792") ||
@@ -88,7 +98,9 @@ void __init rcar_gen2_timer_init(void)
 	}
 
 	/* Remap "armgcnt address map" space */
-	base = ioremap(0xe6080000, PAGE_SIZE);
+	base = ioremap(res.start, resource_size(&res));
+	if (!base)
+		goto out;
 
 	/*
 	 * Update the timer if it is either not running, or is not at the
@@ -109,6 +121,9 @@ void __init rcar_gen2_timer_init(void)
 
 	iounmap(base);
 
+out:
+	of_node_put(np);
+
 	of_clk_init(NULL);
 	timer_probe();
 }
-- 
2.7.4

