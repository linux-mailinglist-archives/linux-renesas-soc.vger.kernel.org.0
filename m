Return-Path: <linux-renesas-soc+bounces-18023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A0AD3506
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 13:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3EB73A7A54
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 11:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FF728003E;
	Tue, 10 Jun 2025 11:34:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDC82253F8;
	Tue, 10 Jun 2025 11:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555263; cv=none; b=kvxagPCk0yvL3AdrA4O+ZWsHYlG7/bMG9lNo3XtdOsZCwEklktnv0B9zuBlrSoNhTWCai5k+DFoFjlZxtB47uSwhq0qAbT/p4LkkdoRxBIMIfTWlJXOIsEW2KdyHZq8wDVsGFF40omt8w+beKRSVL7jQ1OGhhyhtqkDwHeOe4tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555263; c=relaxed/simple;
	bh=cVtT3YT9Xv4eaPkI9AJRnDqFJZ/NsUmg+VTunANrekY=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=SYfS8hOe4TRcfsmDMGAx/MiES92Mb+xcC7sY71hEVEUr5Rn1hRrhO9zKbCRJbt+RbztvkaykfiLXXG3BmHWUET7KWEsZpM60DHcULsAjT4ULedd0C3a8bYQtdiYJBBpO5TXpptUUb3Gbh/ysyMRm+Qun47oydBW4x88GfyszzkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bGmsB2P7nz4y3Rt;
	Tue, 10 Jun 2025 19:34:06 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 55ABXxDX055070;
	Tue, 10 Jun 2025 19:33:59 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Jun 2025 19:34:03 +0800 (CST)
Date: Tue, 10 Jun 2025 19:34:03 +0800 (CST)
X-Zmail-TransId: 2afb6848182b233-bddc4
X-Mailer: Zmail v1.0
Message-ID: <20250610193403161UQCV5cVGXCRVDheTb7jvi@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <ulf.hansson@linaro.org>, <changhuang.liang@starfivetech.com>
Cc: <geert+renesas@glider.be>, <magnus.damm@gmail.com>, <heiko@sntech.de>,
        <krzk@kernel.org>, <alim.akhtar@samsung.com>,
        <walker.chen@starfivetech.com>, <sebastian.reichel@collabora.com>,
        <detlev.casanova@collabora.com>, <finley.xiao@rock-chips.com>,
        <shawn.lin@rock-chips.com>, <pgwipeout@gmail.com>,
        <qiu.yutan@zte.com.cn>, <shao.mingyin@zte.com.cn>,
        <linux-pm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <yang.tao172@zte.com.cn>,
        <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBwbWRvbWFpbjogVXNlIHN0cl9lbmFibGVfZGlzYWJsZS1saWtlIGhlbHBlcnM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55ABXxDX055070
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6848182E.001/4bGmsB2P7nz4y3Rt

From: Shao Mingyin <shao.mingyin@zte.com.cn>

Replace ternary (condition ? "enable" : "disable") syntax and ternary
(condition ? "on" : "off") syntax with helpers from
string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
v2:
 %sable ==> %s in jh71xx_pmu_dev()
 drivers/pmdomain/renesas/rcar-gen4-sysc.c    | 3 ++-
 drivers/pmdomain/renesas/rcar-sysc.c         | 3 ++-
 drivers/pmdomain/rockchip/pm-domains.c       | 3 ++-
 drivers/pmdomain/samsung/exynos-pm-domains.c | 6 +++---
 drivers/pmdomain/starfive/jh71xx-pmu.c       | 7 ++++---
 5 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
index e001b5c25bed..c8aa7538e95f 100644
--- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
+#include <linux/string_choices.h>

 #include "rcar-gen4-sysc.h"

@@ -171,7 +172,7 @@ static int rcar_gen4_sysc_power(u8 pdr, bool on)
  out:
        spin_unlock_irqrestore(&rcar_gen4_sysc_lock, flags);

-       pr_debug("sysc power %s domain %d: %08x -> %d\n", on ? "on" : "off",
+       pr_debug("sysc power %s domain %d: %08x -> %d\n", str_on_off(on),
                 pdr, ioread32(rcar_gen4_sysc_base + SYSCISCR(reg_idx)), ret);
        return ret;
 }
diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index 047495f54e8a..dae01ca0ef6a 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/soc/renesas/rcar-sysc.h>
+#include <linux/string_choices.h>

 #include "rcar-sysc.h"

@@ -162,7 +163,7 @@ static int rcar_sysc_power(const struct rcar_sysc_pd *pd, bool on)

        spin_unlock_irqrestore(&rcar_sysc_lock, flags);

-       pr_debug("sysc power %s domain %d: %08x -> %d\n", on ? "on" : "off",
+       pr_debug("sysc power %s domain %d: %08x -> %d\n", str_on_off(on),
                 pd->isr_bit, ioread32(rcar_sysc_base + SYSCISR), ret);
        return ret;
 }
diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 4cce407bb1eb..0681c763f843 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -21,6 +21,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mfd/syscon.h>
+#include <linux/string_choices.h>
 #include <soc/rockchip/pm_domains.h>
 #include <soc/rockchip/rockchip_sip.h>
 #include <dt-bindings/power/px30-power.h>
@@ -595,7 +596,7 @@ static int rockchip_do_pmu_set_power_domain(struct rockchip_pm_domain *pd,
                                        is_on == on, 0, 10000);
        if (ret) {
                dev_err(pmu->dev, "failed to set domain '%s' %s, val=%d\n",
-                       genpd->name, on ? "on" : "off", is_on);
+                       genpd->name, str_on_off(on), is_on);
                return ret;
        }

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 9b502e8751d1..1a892c611dad 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/pm_domain.h>
 #include <linux/delay.h>
 #include <linux/of.h>
@@ -38,7 +39,6 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
        struct exynos_pm_domain *pd;
        void __iomem *base;
        u32 timeout, pwr;
-       char *op;

        pd = container_of(domain, struct exynos_pm_domain, pd);
        base = pd->base;
@@ -51,8 +51,8 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)

        while ((readl_relaxed(base + 0x4) & pd->local_pwr_cfg) != pwr) {
                if (!timeout) {
-                       op = (power_on) ? "enable" : "disable";
-                       pr_err("Power domain %s %s failed\n", domain->name, op);
+                       pr_err("Power domain %s %s failed\n", domain->name,
+                              str_enable_disable(power_on));
                        return -ETIMEDOUT;
                }
                timeout--;
diff --git a/drivers/pmdomain/starfive/jh71xx-pmu.c b/drivers/pmdomain/starfive/jh71xx-pmu.c
index 74720c09a6e3..dc3e109e273a 100644
--- a/drivers/pmdomain/starfive/jh71xx-pmu.c
+++ b/drivers/pmdomain/starfive/jh71xx-pmu.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/string_choices.h>
 #include <dt-bindings/power/starfive,jh7110-pmu.h>

 /* register offset */
@@ -155,7 +156,7 @@ static int jh7110_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)

        if (ret) {
                dev_err(pmu->dev, "%s: failed to power %s\n",
-                       pmd->genpd.name, on ? "on" : "off");
+                       pmd->genpd.name, str_on_off(on));
                return -ETIMEDOUT;
        }

@@ -197,8 +198,8 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
        }

        if (is_on == on) {
-               dev_dbg(pmu->dev, "pm domain [%s] is already %sable status.\n",
-                       pmd->genpd.name, on ? "en" : "dis");
+               dev_dbg(pmu->dev, "pm domain [%s] is already %s status.\n",
+                       pmd->genpd.name, str_enable_disable(on));
                return 0;
        }

-- 
2.25.1

