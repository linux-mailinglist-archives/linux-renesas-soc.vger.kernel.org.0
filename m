Return-Path: <linux-renesas-soc+bounces-5463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0868CE25D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2024 10:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDE2E1F224A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2024 08:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0461D129E7A;
	Fri, 24 May 2024 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLyVrgdX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D391292E6;
	Fri, 24 May 2024 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716539366; cv=none; b=HRIlN9HMG4p3jjX0taMUknW9N3GBP3Uy4U+k3Jd+FCiq3uOtRs6kdtcvYh/SqcimSofhWgjQPtqdrbzqBjt0RlIMI1l6auc2C2tgIBC42lKHq1skHRVfNSIM49cIRV6xFBklDsBHtMX7eOCSUd83NkbL4CIzV2JPUYMkNyhupz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716539366; c=relaxed/simple;
	bh=VrG7DLlvfD2+1+P2k9OSigd8+aqIcyCiPteGxRosO4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xugf9bVXzOM2JHWgVaI5Rlz3zyO48NiHFbqXUPVecEB/5YB+p3/qTjpkqkOLUYOiHlWLdnD4dchllHwFJMJWawcXN7fq7KBc8vBE92IxrGPuZvq3HTnTplVa9FR1o2k6sL64gq2rNbsKhUAz7AFzD9tfM/HQ9r7tWULpboExSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLyVrgdX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f44b6f9363so4019395ad.3;
        Fri, 24 May 2024 01:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716539364; x=1717144164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjzcilTL0INsxNf0STvQEIzD+iCsrF8EvqMJvccQ0Sw=;
        b=ZLyVrgdXs1MXxVBHBgtUrkfH3kMzpaJPAn7ExqMZm+uXSDOt3q+eQYYWjZqysfllrW
         ZEKvbkBLQfnPWJAk6Dbk5S3Ne9q78gFTp7adv9NeTe70aRM4ymhIc7iNzGnzACYWOKV7
         oJcLWvs1s3bg4S0N7T92tE9v+efzSNiNex7gS4bjPFqQcjelQ9gtDoz5sdszj+K0v7cp
         scWmr/NxqAfRh0UXP6XN+zGEOPl5XVbEi3DrVWP5PqWNQS3qGE1j4YItq62Qf4DcdAMF
         5ZMfjrXIyRKtZRyoynXrZ2IcXM6jhSPm5PxeoKLbmAeXA6m2mVn7rDXO9QaeQUPrMWAH
         WHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716539364; x=1717144164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjzcilTL0INsxNf0STvQEIzD+iCsrF8EvqMJvccQ0Sw=;
        b=ZVfD10CVs5YyNzgQopTEPZIfUykF0K8c46g284k+WpgFz0rWB0Tvo/Qacx2mnAi6YJ
         m4ZcueL9KgbaSmXxbpFErVy1OmT5gtZVTIENxUYz7y6eLohT9BxSoGgIU04bk9AKYw18
         0S1nR/lHOQ/EBlQx8lgxo3/1dC5RbRars8XY+Tu8D608ChfpFJxuiacJLd+nVjJnY5p1
         RVVaL5s0pthQeBjm6PKz1ar0FSXNVpBnQY+2rlhmjmacWWhX+56qnu8A7mX5tX09Q5+7
         1b6p15Pe4Il2uBuED1gKtwAAeRryAEYmuhuJwGFUXVWinRoTcOXPTXnc1IsB/C/SOImM
         X6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCV7ELt+fJvY955eGMxfCCjAQRIYgGsOgikax53a3VRPyaaEzvUoC5kuafK8/jibyA6dlkKZeZihir7zXmVDQ8Jtu0tXOBsGKNdTNqxDDdJVNZjk2aphLPP/dYw1NSO6HksV+aDc3ZfYOb73mYsY7TE/gDOboCL2ktGXbCjQuV09ME/UuA==
X-Gm-Message-State: AOJu0Yw7pQ4hk4Ccbm/0/Yz+KKIVcym6wV74aGyd4C/I3ALnz3/yrSyA
	6xqXS3LyZd6N3fP+ZdTA/iQv9CZNHfJ5u6r0GEQGGgv+wVO7KozW
X-Google-Smtp-Source: AGHT+IF7trHW3+qHNaDcX19d2AnnRVHbIW1HFWj1+yor80TE9DY67KkrWL/XAJSVD+D2IFp34Q0qVA==
X-Received: by 2002:a17:902:e5cb:b0:1ec:77e5:2d6f with SMTP id d9443c01a7336-1f4497e15f8mr18971485ad.59.1716539363930;
        Fri, 24 May 2024 01:29:23 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:bfcd:61e0:7fa9:84b8:25fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9c6ea3sm8420325ad.277.2024.05.24.01.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 01:29:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] clk: renesas: Add RZ/V2H CPG core wrapper driver
Date: Fri, 24 May 2024 09:27:59 +0100
Message-Id: <20240524082800.333991-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add CPG core helper wrapper driver for RZ/V2H SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig     |   5 +
 drivers/clk/renesas/Makefile    |   1 +
 drivers/clk/renesas/rzv2h-cpg.c | 673 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h | 149 +++++++
 4 files changed, 828 insertions(+)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.h

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index d252150402e8..254203c2cb2e 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -40,6 +40,7 @@ config CLK_RENESAS
 	select CLK_R9A07G054 if ARCH_R9A07G054
 	select CLK_R9A08G045 if ARCH_R9A08G045
 	select CLK_R9A09G011 if ARCH_R9A09G011
+	select CLK_R9A09G057 if ARCH_R9A09G057
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -193,6 +194,10 @@ config CLK_R9A09G011
 	bool "RZ/V2M clock support" if COMPILE_TEST
 	select CLK_RZG2L
 
+config CLK_R9A09G057
+	bool "Renesas RZ/V2H(P) clock support" if COMPILE_TEST
+	select RESET_CONTROLLER
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index f7e18679c3b8..79cc7c4d77c6 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A08G045)		+= r9a08g045-cpg.o
 obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
+obj-$(CONFIG_CLK_R9A09G057)		+= rzv2h-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
new file mode 100644
index 000000000000..eb6b7ab86675
--- /dev/null
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -0,0 +1,673 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) Clock Pulse Generator
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ *
+ * Based on rzg2l-cpg.c
+ *
+ * Copyright (C) 2015 Glider bvba
+ * Copyright (C) 2013 Ideas On Board SPRL
+ * Copyright (C) 2015 Renesas Electronics Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/iopoll.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_domain.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+#include "rzv2h-cpg.h"
+
+#ifdef DEBUG
+#define WARN_DEBUG(x)		WARN_ON(x)
+#else
+#define WARN_DEBUG(x)		do { } while (0)
+#endif
+
+#define KDIV(val)			((s16)FIELD_GET(GENMASK(31, 16), (val)))
+#define MDIV(val)			FIELD_GET(GENMASK(15, 6), (val))
+#define PDIV(val)			FIELD_GET(GENMASK(5, 0), (val))
+#define SDIV(val)			FIELD_GET(GENMASK(2, 0), (val))
+
+/**
+ * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
+ *
+ * @rcdev: Reset controller entity
+ * @dev: CPG device
+ * @base: CPG register block base address
+ * @rmw_lock: protects register accesses
+ * @clks: Array containing all Core and Module Clocks
+ * @num_core_clks: Number of Core Clocks in clks[]
+ * @num_mod_clks: Number of Module Clocks in clks[]
+ * @num_resets: Number of Module Resets in info->resets[]
+ * @info: Pointer to platform data
+ */
+struct rzv2h_cpg_priv {
+	struct reset_controller_dev rcdev;
+	struct device *dev;
+	void __iomem *base;
+	spinlock_t rmw_lock;
+
+	struct clk **clks;
+	unsigned int num_core_clks;
+	unsigned int num_mod_clks;
+	unsigned int num_resets;
+
+	const struct rzv2h_cpg_info *info;
+};
+
+struct pll_clk {
+	struct clk_hw hw;
+	unsigned int conf;
+	unsigned int type;
+	void __iomem *base;
+	struct rzv2h_cpg_priv *priv;
+};
+
+#define to_pll(_hw)	container_of(_hw, struct pll_clk, hw)
+
+static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
+						   unsigned long parent_rate)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+	const struct rzv2h_cpg_info *info = priv->info;
+	int clk1_off, clk2_off;
+	unsigned int clk1, clk2;
+	u64 rate;
+
+	clk1_off = info->pll_get_clk1_offset(pll_clk->conf);
+	clk2_off = info->pll_get_clk2_offset(pll_clk->conf);
+	if (clk1_off == -EINVAL || clk2_off == -EINVAL)
+		return 0;
+
+	clk1 = readl(priv->base + clk1_off);
+	clk2 = readl(priv->base + clk2_off);
+
+	rate = mul_u64_u32_shr(parent_rate, (MDIV(clk1) << 16) + KDIV(clk1),
+			       16 + SDIV(clk2));
+
+	return DIV_ROUND_CLOSEST_ULL(rate, PDIV(clk1));
+}
+
+static const struct clk_ops rzv2h_cpg_pll_ops = {
+	.recalc_rate = rzv2h_cpg_pll_clk_recalc_rate,
+};
+
+static struct clk * __init
+rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
+			   struct clk **clks,
+			   void __iomem *base,
+			   struct rzv2h_cpg_priv *priv,
+			   const struct clk_ops *ops)
+{
+	struct device *dev = priv->dev;
+	struct clk_init_data init;
+	const struct clk *parent;
+	const char *parent_name;
+	struct pll_clk *pll_clk;
+
+	parent = clks[core->parent & 0xffff];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
+	if (!pll_clk)
+		return ERR_PTR(-ENOMEM);
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = ops;
+	init.flags = 0;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	pll_clk->hw.init = &init;
+	pll_clk->conf = core->conf;
+	pll_clk->base = base;
+	pll_clk->priv = priv;
+	pll_clk->type = core->type;
+
+	return clk_register(NULL, &pll_clk->hw);
+}
+
+static struct clk
+*rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
+			       void *data)
+{
+	unsigned int clkidx = clkspec->args[1];
+	struct rzv2h_cpg_priv *priv = data;
+	struct device *dev = priv->dev;
+	const char *type;
+	struct clk *clk;
+
+	switch (clkspec->args[0]) {
+	case CPG_CORE:
+		type = "core";
+		clk = priv->clks[clkidx];
+		break;
+
+	case CPG_MOD:
+		type = "module";
+		if (clkidx >= priv->num_mod_clks) {
+			dev_err(dev, "Invalid %s clock index %u\n", type,
+				clkidx);
+			return ERR_PTR(-EINVAL);
+		}
+		clk = priv->clks[priv->num_core_clks + clkidx];
+		break;
+
+	default:
+		dev_err(dev, "Invalid CPG clock type %u\n", clkspec->args[0]);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (IS_ERR(clk))
+		dev_err(dev, "Cannot get %s clock %u: %ld", type, clkidx,
+			PTR_ERR(clk));
+	else
+		dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
+			clkspec->args[0], clkspec->args[1], clk,
+			clk_get_rate(clk));
+	return clk;
+}
+
+static void __init
+rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
+			    const struct rzv2h_cpg_info *info,
+			    struct rzv2h_cpg_priv *priv)
+{
+	struct clk *clk = ERR_PTR(-EOPNOTSUPP), *parent;
+	struct device *dev = priv->dev;
+	unsigned int id = core->id, div = core->div;
+	const char *parent_name;
+
+	WARN_DEBUG(id >= priv->num_core_clks);
+	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
+
+	if (!core->name) {
+		/* Skip NULLified clock */
+		return;
+	}
+
+	switch (core->type) {
+	case CLK_TYPE_IN:
+		clk = of_clk_get_by_name(priv->dev->of_node, core->name);
+		break;
+	case CLK_TYPE_FF:
+		WARN_DEBUG(core->parent >= priv->num_core_clks);
+		parent = priv->clks[core->parent];
+		if (IS_ERR(parent)) {
+			clk = parent;
+			goto fail;
+		}
+
+		parent_name = __clk_get_name(parent);
+		clk = clk_register_fixed_factor(NULL, core->name,
+						parent_name, CLK_SET_RATE_PARENT,
+						core->mult, div);
+		break;
+	case CLK_TYPE_PLL:
+		clk = rzv2h_cpg_pll_clk_register(core, priv->clks, priv->base, priv,
+						 &rzv2h_cpg_pll_ops);
+		break;
+	default:
+		goto fail;
+	}
+
+	if (IS_ERR_OR_NULL(clk))
+		goto fail;
+
+	dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
+	priv->clks[id] = clk;
+	return;
+
+fail:
+	dev_err(dev, "Failed to register %s clock %s: %ld\n", "core",
+		core->name, PTR_ERR(clk));
+}
+
+/**
+ * struct mstp_clock - MSTP gating clock
+ *
+ * @hw: handle between common and hardware-specific interfaces
+ * @off: register offset
+ * @bit: ON/MON bit
+ * @monoff: monitor register offset
+ * @monbit: montor bit
+ * @priv: CPG/MSTP private data
+ */
+struct mstp_clock {
+	struct clk_hw hw;
+	u16 off;
+	u8 bit;
+	u16 monoff;
+	u8 monbit;
+	struct rzv2h_cpg_priv *priv;
+};
+
+#define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
+
+static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
+{
+	struct mstp_clock *clock = to_mod_clock(hw);
+	struct rzv2h_cpg_priv *priv = clock->priv;
+	unsigned int reg = clock->off;
+	struct device *dev = priv->dev;
+	u32 bitmask = BIT(clock->bit);
+	u32 value;
+	int error;
+
+	dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
+		enable ? "ON" : "OFF");
+
+	value = bitmask << 16;
+	if (enable)
+		value |= bitmask;
+
+	writel(value, priv->base + reg);
+
+	if (!enable)
+		return 0;
+
+	reg = clock->monoff;
+	bitmask = BIT(clock->monbit);
+	error = readl_poll_timeout_atomic(priv->base + reg, value,
+					  value & bitmask, 0, 10);
+	if (error)
+		dev_err(dev, "Failed to enable CLK_ON %p\n",
+			priv->base + reg);
+
+	return error;
+}
+
+static int rzv2h_mod_clock_enable(struct clk_hw *hw)
+{
+	return rzv2h_mod_clock_endisable(hw, true);
+}
+
+static void rzv2h_mod_clock_disable(struct clk_hw *hw)
+{
+	rzv2h_mod_clock_endisable(hw, false);
+}
+
+static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
+{
+	struct mstp_clock *clock = to_mod_clock(hw);
+	struct rzv2h_cpg_priv *priv = clock->priv;
+	u32 bitmask = BIT(clock->monbit);
+
+	return readl(priv->base + clock->monoff) & bitmask;
+}
+
+static const struct clk_ops rzv2h_mod_clock_ops = {
+	.enable = rzv2h_mod_clock_enable,
+	.disable = rzv2h_mod_clock_disable,
+	.is_enabled = rzv2h_mod_clock_is_enabled,
+};
+
+static void __init
+rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
+			   const struct rzv2h_cpg_info *info,
+			   struct rzv2h_cpg_priv *priv)
+{
+	struct mstp_clock *clock = NULL;
+	struct device *dev = priv->dev;
+	unsigned int id = mod->id;
+	struct clk_init_data init;
+	struct clk *parent, *clk;
+	const char *parent_name;
+	unsigned int i;
+
+	WARN_DEBUG(id < priv->num_core_clks);
+	WARN_DEBUG(id >= priv->num_core_clks + priv->num_mod_clks);
+	WARN_DEBUG(mod->parent >= priv->num_core_clks + priv->num_mod_clks);
+	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
+
+	if (!mod->name) {
+		/* Skip NULLified clock */
+		return;
+	}
+
+	parent = priv->clks[mod->parent];
+	if (IS_ERR(parent)) {
+		clk = parent;
+		goto fail;
+	}
+
+	clock = devm_kzalloc(dev, sizeof(*clock), GFP_KERNEL);
+	if (!clock) {
+		clk = ERR_PTR(-ENOMEM);
+		goto fail;
+	}
+
+	init.name = mod->name;
+	init.ops = &rzv2h_mod_clock_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	for (i = 0; i < info->num_crit_mod_clks; i++)
+		if (id == info->crit_mod_clks[i]) {
+			dev_dbg(dev, "CPG %s setting CLK_IS_CRITICAL\n",
+				mod->name);
+			init.flags |= CLK_IS_CRITICAL;
+			break;
+		}
+
+	parent_name = __clk_get_name(parent);
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	clock->off = mod->off;
+	clock->bit = mod->bit;
+	clock->monoff = mod->monoff;
+	clock->monbit = mod->monbit;
+	clock->priv = priv;
+	clock->hw.init = &init;
+
+	clk = clk_register(NULL, &clock->hw);
+	if (IS_ERR(clk))
+		goto fail;
+
+	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
+	priv->clks[id] = clk;
+
+	return;
+
+fail:
+	dev_err(dev, "Failed to register %s clock %s: %ld\n", "module",
+		mod->name, PTR_ERR(clk));
+}
+
+#define rcdev_to_priv(x)	container_of(x, struct rzv2h_cpg_priv, rcdev)
+
+static int rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	struct rzv2h_cpg_priv *priv = rcdev_to_priv(rcdev);
+	const struct rzv2h_cpg_info *info = priv->info;
+	unsigned int reg = info->resets[id].resoff;
+	u32 mask = BIT(info->resets[id].resbit);
+	s8 monbit = info->resets[id].monbit;
+	u32 value = mask << 16;
+
+	dev_dbg(rcdev->dev, "assert id:%ld offset:0x%x\n", id, reg);
+
+	writel(value, priv->base + reg);
+
+	reg = info->resets[id].monoff;
+	mask = BIT(monbit);
+
+	return readl_poll_timeout_atomic(priv->base + reg, value,
+					 value & mask, 10, 200);
+}
+
+static int rzv2h_cpg_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct rzv2h_cpg_priv *priv = rcdev_to_priv(rcdev);
+	const struct rzv2h_cpg_info *info = priv->info;
+	unsigned int reg = info->resets[id].resoff;
+	u32 mask = BIT(info->resets[id].resbit);
+	s8 monbit = info->resets[id].monbit;
+	u32 value = (mask << 16) | mask;
+
+	dev_dbg(rcdev->dev, "deassert id:%ld offset:0x%x\n", id, reg);
+
+	writel(value, priv->base + reg);
+
+	reg = info->resets[id].monoff;
+	mask = BIT(monbit);
+
+	return readl_poll_timeout_atomic(priv->base + reg, value,
+					 !(value & mask), 10, 200);
+}
+
+static int rzv2h_cpg_reset(struct reset_controller_dev *rcdev,
+			   unsigned long id)
+{
+	int ret;
+
+	ret = rzv2h_cpg_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return rzv2h_cpg_deassert(rcdev, id);
+}
+
+static int rzv2h_cpg_status(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	struct rzv2h_cpg_priv *priv = rcdev_to_priv(rcdev);
+	const struct rzv2h_cpg_info *info = priv->info;
+	unsigned int reg = info->resets[id].monoff;
+	s8 monbit = info->resets[id].monbit;
+	u32 bitmask = BIT(monbit);
+
+	return !!(readl(priv->base + reg) & bitmask);
+}
+
+static const struct reset_control_ops rzv2h_cpg_reset_ops = {
+	.reset = rzv2h_cpg_reset,
+	.assert = rzv2h_cpg_assert,
+	.deassert = rzv2h_cpg_deassert,
+	.status = rzv2h_cpg_status,
+};
+
+static int rzv2h_cpg_reset_xlate(struct reset_controller_dev *rcdev,
+				 const struct of_phandle_args *reset_spec)
+{
+	struct rzv2h_cpg_priv *priv = rcdev_to_priv(rcdev);
+	const struct rzv2h_cpg_info *info = priv->info;
+	unsigned int id = reset_spec->args[0];
+
+	if (id >= rcdev->nr_resets || !info->resets[id].resoff) {
+		dev_err(rcdev->dev, "Invalid reset index %u\n", id);
+		return -EINVAL;
+	}
+
+	return id;
+}
+
+static int rzv2h_cpg_reset_controller_register(struct rzv2h_cpg_priv *priv)
+{
+	priv->rcdev.ops = &rzv2h_cpg_reset_ops;
+	priv->rcdev.of_node = priv->dev->of_node;
+	priv->rcdev.dev = priv->dev;
+	priv->rcdev.of_reset_n_cells = 1;
+	priv->rcdev.of_xlate = rzv2h_cpg_reset_xlate;
+	priv->rcdev.nr_resets = priv->num_resets;
+
+	return devm_reset_controller_register(priv->dev, &priv->rcdev);
+}
+
+/**
+ * struct rzv2h_cpg_pd - RZ/V2H power domain data structure
+ * @genpd: generic PM domain
+ * @priv: pointer to CPG private data structure
+ */
+struct rzv2h_cpg_pd {
+	struct generic_pm_domain genpd;
+	struct rzv2h_cpg_priv *priv;
+};
+
+static int rzv2h_cpg_attach_dev(struct generic_pm_domain *domain, struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct of_phandle_args clkspec;
+	bool once = true;
+	struct clk *clk;
+	int error;
+	int i = 0;
+
+	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
+					   &clkspec)) {
+		if (once) {
+			once = false;
+			error = pm_clk_create(dev);
+			if (error) {
+				of_node_put(clkspec.np);
+				goto err;
+			}
+		}
+		clk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
+		if (IS_ERR(clk)) {
+			error = PTR_ERR(clk);
+			goto fail_destroy;
+		}
+
+		error = pm_clk_add_clk(dev, clk);
+		if (error) {
+			dev_err(dev, "pm_clk_add_clk failed %d\n",
+				error);
+			goto fail_put;
+		}
+		i++;
+	}
+
+	return 0;
+
+fail_put:
+	clk_put(clk);
+
+fail_destroy:
+	pm_clk_destroy(dev);
+err:
+	return error;
+}
+
+static void rzv2h_cpg_detach_dev(struct generic_pm_domain *unused, struct device *dev)
+{
+	if (!pm_clk_no_clocks(dev))
+		pm_clk_destroy(dev);
+}
+
+static void rzv2h_cpg_genpd_remove_simple(void *data)
+{
+	pm_genpd_remove(data);
+}
+
+static int __init rzv2h_cpg_add_pm_domains(struct rzv2h_cpg_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct device_node *np = dev->of_node;
+	struct rzv2h_cpg_pd *pd;
+	int ret;
+
+	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return -ENOMEM;
+
+	pd->genpd.name = np->name;
+	pd->priv = priv;
+	pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON | GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
+	pd->genpd.attach_dev = rzv2h_cpg_attach_dev;
+	pd->genpd.detach_dev = rzv2h_cpg_detach_dev;
+	ret = pm_genpd_init(&pd->genpd, &pm_domain_always_on_gov, false);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, rzv2h_cpg_genpd_remove_simple, &pd->genpd);
+	if (ret)
+		return ret;
+
+	return of_genpd_add_provider_simple(np, &pd->genpd);
+}
+
+static void rzv2h_cpg_del_clk_provider(void *data)
+{
+	of_clk_del_provider(data);
+}
+
+static int __init rzv2h_cpg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct rzv2h_cpg_info *info;
+	struct rzv2h_cpg_priv *priv;
+	unsigned int nclks, i;
+	struct clk **clks;
+	int error;
+
+	info = of_device_get_match_data(dev);
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->info = info;
+	spin_lock_init(&priv->rmw_lock);
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	nclks = info->num_total_core_clks + info->num_hw_mod_clks;
+	clks = devm_kmalloc_array(dev, nclks, sizeof(*clks), GFP_KERNEL);
+	if (!clks)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, priv);
+	priv->clks = clks;
+	priv->num_core_clks = info->num_total_core_clks;
+	priv->num_mod_clks = info->num_hw_mod_clks;
+	priv->num_resets = info->num_resets;
+
+	for (i = 0; i < nclks; i++)
+		clks[i] = ERR_PTR(-ENOENT);
+
+	for (i = 0; i < info->num_core_clks; i++)
+		rzv2h_cpg_register_core_clk(&info->core_clks[i], info, priv);
+
+	for (i = 0; i < info->num_mod_clks; i++)
+		rzv2h_cpg_register_mod_clk(&info->mod_clks[i], info, priv);
+
+	error = of_clk_add_provider(np, rzv2h_cpg_clk_src_twocell_get, priv);
+	if (error)
+		return error;
+
+	error = devm_add_action_or_reset(dev, rzv2h_cpg_del_clk_provider, np);
+	if (error)
+		return error;
+
+	error = rzv2h_cpg_add_pm_domains(priv);
+	if (error)
+		return error;
+
+	error = rzv2h_cpg_reset_controller_register(priv);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static const struct of_device_id rzv2h_cpg_match[] = {
+	{ /* sentinel */ }
+};
+
+static struct platform_driver rzv2h_cpg_driver = {
+	.driver		= {
+		.name	= "rzv2h-cpg",
+		.of_match_table = rzv2h_cpg_match,
+	},
+};
+
+static int __init rzv2h_cpg_init(void)
+{
+	return platform_driver_probe(&rzv2h_cpg_driver, rzv2h_cpg_probe);
+}
+
+subsys_initcall(rzv2h_cpg_init);
+
+MODULE_DESCRIPTION("Renesas RZ/V2H CPG Driver");
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
new file mode 100644
index 000000000000..689c123d01c5
--- /dev/null
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Renesas RZ/V2H(P) Clock Pulse Generator
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#ifndef __RENESAS_RZV2H_CPG_H__
+#define __RENESAS_RZV2H_CPG_H__
+
+/**
+ * Definitions of CPG Core Clocks
+ *
+ * These include:
+ *   - Clock outputs exported to DT
+ *   - External input clocks
+ *   - Internal CPG clocks
+ */
+struct cpg_core_clk {
+	const char *name;
+	unsigned int id;
+	unsigned int parent;
+	unsigned int div;
+	unsigned int mult;
+	unsigned int type;
+	unsigned int conf;
+};
+
+enum clk_types {
+	/* Generic */
+	CLK_TYPE_IN,		/* External Clock Input */
+	CLK_TYPE_FF,		/* Fixed Factor Clock */
+	CLK_TYPE_PLL,
+};
+
+#define DEF_TYPE(_name, _id, _type...) \
+	{ .name = _name, .id = _id, .type = _type }
+#define DEF_BASE(_name, _id, _type, _parent...) \
+	DEF_TYPE(_name, _id, _type, .parent = _parent)
+#define DEF_PLL(_name, _id, _parent, _conf) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLL, .parent = _parent, .conf = _conf)
+#define DEF_INPUT(_name, _id) \
+	DEF_TYPE(_name, _id, CLK_TYPE_IN)
+#define DEF_FIXED(_name, _id, _parent, _mult, _div) \
+	DEF_BASE(_name, _id, CLK_TYPE_FF, _parent, .div = _div, .mult = _mult)
+
+/**
+ * struct rzv2h_mod_clk - Module Clocks definitions
+ *
+ * @name: handle between common and hardware-specific interfaces
+ * @id: clock index in array containing all Core and Module Clocks
+ * @parent: id of parent clock
+ * @off: register offset
+ * @bit: ON/MON bit
+ * @monoff: monitor register offset
+ * @monbit: monitor bit
+ */
+struct rzv2h_mod_clk {
+	const char *name;
+	unsigned int id;
+	unsigned int parent;
+	u16 off;
+	u8 bit;
+	u16 monoff;
+	u8 monbit;
+};
+
+#define DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _monoff, _monbit)	\
+	{ \
+		.name = _name, \
+		.id = MOD_CLK_BASE + (_id), \
+		.parent = (_parent), \
+		.off = (_off), \
+		.bit = (_bit), \
+		.monoff = (_monoff), \
+		.monbit = (_monbit), \
+	}
+
+#define DEF_MOD(_name, _id, _parent, _off, _bit, _monoff, _monbit)	\
+	DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _monoff, _monbit)
+
+/**
+ * struct rzv2h_reset - Reset definitions
+ *
+ * @off: reset register offset
+ * @bit: reset bit
+ * @monoff: monitor register offset
+ * @monbit: monitor bit
+ */
+struct rzv2h_reset {
+	u16 resoff;
+	u8 resbit;
+	u16 monoff;
+	u8 monbit;
+};
+
+#define DEF_RST(_id, _resoff, _resbit, _monoff, _monbit)	\
+	[_id] = { \
+		.resoff = (_resoff), \
+		.resbit = (_resbit), \
+		.monoff = (_monoff), \
+		.monbit = (_monbit) \
+	}
+
+/**
+ * struct rzv2h_cpg_info - SoC-specific CPG Description
+ *
+ * @core_clks: Array of Core Clock definitions
+ * @num_core_clks: Number of entries in core_clks[]
+ * @num_total_core_clks: Total number of Core Clocks (exported + internal)
+ *
+ * @mod_clks: Array of Module Clock definitions
+ * @num_mod_clks: Number of entries in mod_clks[]
+ * @num_hw_mod_clks: Number of Module Clocks supported by the hardware
+ *
+ * @resets: Array of Module Reset definitions
+ * @num_resets: Number of entries in resets[]
+ *
+ * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
+ *                 should not be disabled without a knowledgeable driver
+ * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+ * @pll_get_clk1_offset: Function pointer to get PLL CLK1 offset
+ * @pll_get_clk2_offset: Function pointer to get PLL CLK2 offset
+ */
+struct rzv2h_cpg_info {
+	/* Core Clocks */
+	const struct cpg_core_clk *core_clks;
+	unsigned int num_core_clks;
+	unsigned int num_total_core_clks;
+
+	/* Module Clocks */
+	const struct rzv2h_mod_clk *mod_clks;
+	unsigned int num_mod_clks;
+	unsigned int num_hw_mod_clks;
+
+	/* Resets */
+	const struct rzv2h_reset *resets;
+	unsigned int num_resets;
+
+	/* Critical Module Clocks that should not be disabled */
+	const unsigned int *crit_mod_clks;
+	unsigned int num_crit_mod_clks;
+
+	/* function pointers for PLL information */
+	int (*pll_get_clk1_offset)(int clk);
+	int (*pll_get_clk2_offset)(int clk);
+};
+
+#endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.34.1


