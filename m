Return-Path: <linux-renesas-soc+bounces-7610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCAD93FF7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 22:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0CDF1C2280D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 20:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905B918E763;
	Mon, 29 Jul 2024 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlBpuTeq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829CB18A94A;
	Mon, 29 Jul 2024 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722284915; cv=none; b=MlhGQC1BXk96kmeXRbplrgW60MR1B6demgDLb2c/Vf+8kw06WRSHyxowMOHfCiPfyM/jKyMppWs0Zx0UyUEczqxnqO/NpfQOLgSUtdiYbeQGhIfqVhIKdS8JhwWRJOx4S1CeOLNCjLEg7/HIDxeaxro/Z2gWTR7anrZpM6oirfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722284915; c=relaxed/simple;
	bh=BTp/CYKxfOUCsERheUNpGVxOiaqzGvetZXqh4HZhTNY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yta1DdNpnWXhfPJdDlaZ2J7Zw25RmgCK5JHj62Tg79QEHDCrJ9kHpGIdflHIBiE5yc2XZ2qdEI/Uaazw5Vu6/BNgX3aU+cFjSJ16QI+50JYOtqL1KwiFIK5lcT08y72ldSJMVtgN1brmvnmEVIXJv0n/ZmVL/aaV86qYNJU7Pww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlBpuTeq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4281c164408so12818285e9.1;
        Mon, 29 Jul 2024 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722284911; x=1722889711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qh1b+DjgNKa0H+RCsZC06cpPfJirEFydxLmRc6G8n14=;
        b=GlBpuTeqzDUgLyZbfG6V/7yRLQGGLRcp5GALKGyueax00WPA6orxtrFR+I9UAwbbhF
         Da29fRiMOmUId1a6Q2wS/1287XHbPnwjyl6ZfzzhXWA25eURMKEnbvLWKN73pozjJpaC
         g/YcACXxSjXenPTQzdkGnRC3MGePdN+asDI9MGC1M/oKV2uSwRcjrga7eVLQWW35KiYD
         nx6iu0mbSlYW3lFAQZFcbCXxvajY5rW3yV+MEdknEtwkB81H9P5/1SCIVKWZ4qOIm98c
         u6IzP5Bovx34Ff+NiGyj8EXJiyI0FCWO1ARNl80A93POzT/fM6LN+2j8JJ8ePyarLvKD
         Rkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722284911; x=1722889711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qh1b+DjgNKa0H+RCsZC06cpPfJirEFydxLmRc6G8n14=;
        b=nFYP/XGM+RZ57UVYzhtOSvghXsVeYdIxtehSUVAeF7BR0x1sAz7y8oQUsvqreyP0j4
         aKlUsWLUKTNzCP9SWJGDFotLDW33qT1Na8I92SKhjNlUb38BpFjlgPzRteAcLDNb1KVq
         ieBuiLXPjGJnsPu9YRblxJwk8arHMVoz1la1+/zeb2YNEpXS9K64DpDzGpmhIoDb35ms
         gZWXOurzRTGj0r5Ys6ct9TMNxdQrSmL/gMaWi1afWPpgG5hmh/hv49dPeGxoU4ajwuFC
         jaXjEKnstWS5SN7k2Zs28CRB5E8oCRCTYmYG+Wtaxjvpu/F9rHDF8NfFwwibJKdxXAXP
         3Cxw==
X-Forwarded-Encrypted: i=1; AJvYcCVrXcN8d8k+w4nXxTmh7HyBxGRNw5Ab4lrgS/9Shrk7I6DfM1J9jUfr+hhzeRADfJTvdwfEb8jUEFULBu6N7kwCHuOpATOXssD9aKi00HDQhPd8BbXFDtkq0nOkhnvspx8YhpCk27s7ewUSF5pj3j+xxJIVTbCNZDluOi/AWMG1q4oLDQ==
X-Gm-Message-State: AOJu0Ywiu/lfJPoEr2IimOltig6qu1PCStNlxxUHvXBYxh+Jd3jlYf3D
	ow2DPa4k3N/ipp8JYao3O1BsQgxd67W7wDoH0fDVWwNHFDXGFvoX
X-Google-Smtp-Source: AGHT+IGRns+nKdVfIxr1MYrtQKjr8rgrTpzjmI65w13lt0ykMiXkOt156ypmt9WPr0iiNJFx6AGBEg==
X-Received: by 2002:a05:600c:4f16:b0:426:67f0:b4f3 with SMTP id 5b1f17b1804b1-42811e13a17mr56421525e9.26.1722284910156;
        Mon, 29 Jul 2024 13:28:30 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:91c0:6bc7:8f80:c05e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280f484cdesm125478115e9.44.2024.07.29.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:28:29 -0700 (PDT)
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
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 2/3] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
Date: Mon, 29 Jul 2024 21:26:44 +0100
Message-Id: <20240729202645.263525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729202645.263525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240729202645.263525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add family-specific clock driver for RZ/V2H(P) SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5
- Packed resets array
- Updated rzv2h_cpg_reset_xlate() to get index
- Dropped description for info member from struct rzv2h_cpg_priv

v3->v4
- Dropped masking of parent clks with 0xffff
- Dropped storing mod clk id and now calculating it
  based on index and bit.
- Made parent to u16 in struct rzv2h_mod_clk
- Made a copy of resets array in struct rzv2h_cpg_priv

v2->v3
- Dropped num_hw_resets from struct rzv2h_cpg_priv
- Dropped range_check for module clocks
- Made mon_index to s8 instead of u8 in struct rzv2h_mod_clk
- Added support for critical module clocks with DEF_MOD_CRITICAL
- Added check for mon_index in rzv2h_mod_clock_endisable and
  rzv2h_mod_clock_is_enabled()

v1->v2
- Introduced family specific config option
- Now using register indexes for CLKON/CLKMON/RST/RSTMON
- Introduced PLL_CONF macro
- Dropped function pointer to get PLL_CLK1/2 offsets
- Added range check for core clks
- Dropped NULLified clocks check
- Updated commit description
---
 drivers/clk/renesas/Kconfig     |   4 +
 drivers/clk/renesas/Makefile    |   1 +
 drivers/clk/renesas/rzv2h-cpg.c | 685 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h | 149 +++++++
 4 files changed, 839 insertions(+)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.h

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 4410d16de4e2..f078ccb635bb 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -228,6 +228,10 @@ config CLK_RZG2L
 	bool "RZ/{G2L,G2UL,G3S,V2L} family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
+config CLK_RZV2H
+	bool "RZ/V2H(P) family clock support" if COMPILE_TEST
+	select RESET_CONTROLLER
+
 # Generic
 config CLK_RENESAS_CPG_MSSR
 	bool "CPG/MSSR clock support" if COMPILE_TEST
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index f7e18679c3b8..d81a62e78345 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+= rcar-gen3-cpg.o
 obj-$(CONFIG_CLK_RCAR_GEN4_CPG)		+= rcar-gen4-cpg.o
 obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
 obj-$(CONFIG_CLK_RZG2L)			+= rzg2l-cpg.o
+obj-$(CONFIG_CLK_RZV2H)			+= rzv2h-cpg.o
 
 # Generic
 obj-$(CONFIG_CLK_RENESAS_CPG_MSSR)	+= renesas-cpg-mssr.o
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
new file mode 100644
index 000000000000..23430bce7ab4
--- /dev/null
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -0,0 +1,685 @@
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
+#define GET_CLK_ON_OFFSET(x)	(0x600 + ((x) * 4))
+#define GET_CLK_MON_OFFSET(x)	(0x800 + ((x) * 4))
+#define GET_RST_OFFSET(x)	(0x900 + ((x) * 4))
+#define GET_RST_MON_OFFSET(x)	(0xA00 + ((x) * 4))
+
+#define KDIV(val)		((s16)FIELD_GET(GENMASK(31, 16), (val)))
+#define MDIV(val)		FIELD_GET(GENMASK(15, 6), (val))
+#define PDIV(val)		FIELD_GET(GENMASK(5, 0), (val))
+#define SDIV(val)		FIELD_GET(GENMASK(2, 0), (val))
+
+#define GET_MOD_CLK_ID(base, index, bit)		\
+			((base) + ((((index) * (16))) + (bit)))
+
+/**
+ * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
+ *
+ * @dev: CPG device
+ * @base: CPG register block base address
+ * @clks: Array containing all Core and Module Clocks
+ * @num_core_clks: Number of Core Clocks in clks[]
+ * @num_mod_clks: Number of Module Clocks in clks[]
+ * @resets: Array of resets
+ * @num_resets: Number of Module Resets in info->resets[]
+ * @last_dt_core_clk: ID of the last Core Clock exported to DT
+ * @rcdev: Reset controller entity
+ */
+struct rzv2h_cpg_priv {
+	struct device *dev;
+	void __iomem *base;
+
+	struct clk **clks;
+	unsigned int num_core_clks;
+	unsigned int num_mod_clks;
+	struct rzv2h_reset *resets;
+	unsigned int num_resets;
+	unsigned int last_dt_core_clk;
+
+	struct reset_controller_dev rcdev;
+};
+
+#define rcdev_to_priv(x)	container_of(x, struct rzv2h_cpg_priv, rcdev)
+
+struct pll_clk {
+	struct rzv2h_cpg_priv *priv;
+	void __iomem *base;
+	struct clk_hw hw;
+	unsigned int conf;
+	unsigned int type;
+};
+
+#define to_pll(_hw)	container_of(_hw, struct pll_clk, hw)
+
+/**
+ * struct mod_clock - Module clock
+ *
+ * @priv: CPG private data
+ * @hw: handle between common and hardware-specific interfaces
+ * @on_index: register offset
+ * @on_bit: ON/MON bit
+ * @mon_index: monitor register offset
+ * @mon_bit: montor bit
+ */
+struct mod_clock {
+	struct rzv2h_cpg_priv *priv;
+	struct clk_hw hw;
+	u8 on_index;
+	u8 on_bit;
+	s8 mon_index;
+	u8 mon_bit;
+};
+
+#define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
+
+static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
+						   unsigned long parent_rate)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+	unsigned int clk1, clk2;
+	u64 rate;
+
+	if (!PLL_CLK_ACCESS(pll_clk->conf))
+		return 0;
+
+	clk1 = readl(priv->base + PLL_CLK1_OFFSET(pll_clk->conf));
+	clk2 = readl(priv->base + PLL_CLK2_OFFSET(pll_clk->conf));
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
+			   struct rzv2h_cpg_priv *priv,
+			   const struct clk_ops *ops)
+{
+	void __iomem *base = priv->base;
+	struct device *dev = priv->dev;
+	struct clk_init_data init;
+	const struct clk *parent;
+	const char *parent_name;
+	struct pll_clk *pll_clk;
+	int ret;
+
+	parent = priv->clks[core->parent];
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
+	ret = devm_clk_hw_register(dev, &pll_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pll_clk->hw.clk;
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
+		if (clkidx > priv->last_dt_core_clk) {
+			dev_err(dev, "Invalid %s clock index %u\n", type, clkidx);
+			return ERR_PTR(-EINVAL);
+		}
+		clk = priv->clks[clkidx];
+		break;
+
+	case CPG_MOD:
+		type = "module";
+		if (clkidx >= priv->num_mod_clks) {
+			dev_err(dev, "Invalid %s clock index %u\n", type, clkidx);
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
+			    struct rzv2h_cpg_priv *priv)
+{
+	struct clk *clk = ERR_PTR(-EOPNOTSUPP), *parent;
+	unsigned int id = core->id, div = core->div;
+	struct device *dev = priv->dev;
+	const char *parent_name;
+	struct clk_hw *clk_hw;
+
+	WARN_DEBUG(id >= priv->num_core_clks);
+	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
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
+		clk_hw = devm_clk_hw_register_fixed_factor(dev, core->name,
+							   parent_name, CLK_SET_RATE_PARENT,
+							   core->mult, div);
+		if (IS_ERR(clk_hw)) {
+			clk = ERR_CAST(clk_hw);
+			break;
+		}
+		clk = clk_hw->clk;
+		break;
+	case CLK_TYPE_PLL:
+		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
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
+	dev_err(dev, "Failed to register core clock %s: %ld\n",
+		core->name, PTR_ERR(clk));
+}
+
+static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
+{
+	struct mod_clock *clock = to_mod_clock(hw);
+	unsigned int reg = GET_CLK_ON_OFFSET(clock->on_index);
+	struct rzv2h_cpg_priv *priv = clock->priv;
+	u32 bitmask = BIT(clock->on_bit);
+	struct device *dev = priv->dev;
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
+	if (!enable || clock->mon_index < 0)
+		return 0;
+
+	reg = GET_CLK_MON_OFFSET(clock->mon_index);
+	bitmask = BIT(clock->mon_bit);
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
+	struct mod_clock *clock = to_mod_clock(hw);
+	struct rzv2h_cpg_priv *priv = clock->priv;
+	u32 bitmask;
+	u32 offset;
+
+	if (clock->mon_index >= 0) {
+		offset = GET_CLK_MON_OFFSET(clock->mon_index);
+		bitmask = BIT(clock->mon_bit);
+	} else {
+		offset = GET_CLK_ON_OFFSET(clock->on_index);
+		bitmask = BIT(clock->on_bit);
+	}
+
+	return readl(priv->base + offset) & bitmask;
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
+			   struct rzv2h_cpg_priv *priv)
+{
+	struct mod_clock *clock = NULL;
+	struct device *dev = priv->dev;
+	struct clk_init_data init;
+	struct clk *parent, *clk;
+	const char *parent_name;
+	unsigned int id;
+	int ret;
+
+	id = GET_MOD_CLK_ID(priv->num_core_clks, mod->on_index, mod->on_bit);
+	WARN_DEBUG(id >= priv->num_core_clks + priv->num_mod_clks);
+	WARN_DEBUG(mod->parent >= priv->num_core_clks + priv->num_mod_clks);
+	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
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
+	if (mod->critical)
+		init.flags |= CLK_IS_CRITICAL;
+
+	parent_name = __clk_get_name(parent);
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	clock->on_index = mod->on_index;
+	clock->on_bit = mod->on_bit;
+	clock->mon_index = mod->mon_index;
+	clock->mon_bit = mod->mon_bit;
+	clock->priv = priv;
+	clock->hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &clock->hw);
+	if (ret) {
+		clk = ERR_PTR(ret);
+		goto fail;
+	}
+
+	priv->clks[id] = clock->hw.clk;
+
+	return;
+
+fail:
+	dev_err(dev, "Failed to register module clock %s: %ld\n",
+		mod->name, PTR_ERR(clk));
+}
+
+static int rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	struct rzv2h_cpg_priv *priv = rcdev_to_priv(rcdev);
+	unsigned int reg = GET_RST_OFFSET(priv->resets[id].reset_index);
+	u32 mask = BIT(priv->resets[id].reset_bit);
+	u8 monbit = priv->resets[id].mon_bit;
+	u32 value = mask << 16;
+
+	dev_dbg(rcdev->dev, "assert id:%ld offset:0x%x\n", id, reg);
+
+	writel(value, priv->base + reg);
+
+	reg = GET_RST_MON_OFFSET(priv->resets[id].mon_index);
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
+	unsigned int reg = GET_RST_OFFSET(priv->resets[id].reset_index);
+	u32 mask = BIT(priv->resets[id].reset_bit);
+	u8 monbit = priv->resets[id].mon_bit;
+	u32 value = (mask << 16) | mask;
+
+	dev_dbg(rcdev->dev, "deassert id:%ld offset:0x%x\n", id, reg);
+
+	writel(value, priv->base + reg);
+
+	reg = GET_RST_MON_OFFSET(priv->resets[id].mon_index);
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
+	unsigned int reg = GET_RST_MON_OFFSET(priv->resets[id].mon_index);
+	u8 monbit = priv->resets[id].mon_bit;
+
+	return !!(readl(priv->base + reg) & BIT(monbit));
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
+	unsigned int id = reset_spec->args[0];
+	u8 rst_index = id / 16;
+	u8 rst_bit = id % 16;
+	unsigned int i;
+
+	for (i = 0; i < rcdev->nr_resets; i++) {
+		if (rst_index == priv->resets[i].reset_index &&
+		    rst_bit == priv->resets[i].reset_bit)
+			return i;
+	}
+
+	return -EINVAL;
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
+ * @priv: pointer to CPG private data structure
+ * @genpd: generic PM domain
+ */
+struct rzv2h_cpg_pd {
+	struct rzv2h_cpg_priv *priv;
+	struct generic_pm_domain genpd;
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
+	priv->resets = devm_kmemdup(dev, info->resets, sizeof(*info->resets) *
+				    info->num_resets, GFP_KERNEL);
+	if (!priv->resets)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, priv);
+	priv->clks = clks;
+	priv->num_core_clks = info->num_total_core_clks;
+	priv->num_mod_clks = info->num_hw_mod_clks;
+	priv->last_dt_core_clk = info->last_dt_core_clk;
+	priv->num_resets = info->num_resets;
+
+	for (i = 0; i < nclks; i++)
+		clks[i] = ERR_PTR(-ENOENT);
+
+	for (i = 0; i < info->num_core_clks; i++)
+		rzv2h_cpg_register_core_clk(&info->core_clks[i], priv);
+
+	for (i = 0; i < info->num_mod_clks; i++)
+		rzv2h_cpg_register_mod_clk(&info->mod_clks[i], priv);
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
index 000000000000..ab6beaa50296
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
+/* BIT(31) indicates if CLK1/2 are accessible or not */
+#define PLL_CONF(n)		(BIT(31) | ((n) & ~GENMASK(31, 16)))
+#define PLL_CLK_ACCESS(n)	((n) & BIT(31) ? 1 : 0)
+#define PLL_CLK1_OFFSET(n)	((n) & ~GENMASK(31, 16))
+#define PLL_CLK2_OFFSET(n)	(((n) & ~GENMASK(31, 16)) + (0x4))
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
+ * @parent: id of parent clock
+ * @critical: flag to indicate the clock is critical
+ * @on_index: control register index
+ * @on_bit: ON bit
+ * @mon_index: monitor register index
+ * @mon_bit: monitor bit
+ */
+struct rzv2h_mod_clk {
+	const char *name;
+	u16 parent;
+	bool critical;
+	u8 on_index;
+	u8 on_bit;
+	s8 mon_index;
+	u8 mon_bit;
+};
+
+#define DEF_MOD_BASE(_name, _parent, _critical, _onindex, _onbit, _monindex, _monbit) \
+	{ \
+		.name = (_name), \
+		.parent = (_parent), \
+		.critical = (_critical), \
+		.on_index = (_onindex), \
+		.on_bit = (_onbit), \
+		.mon_index = (_monindex), \
+		.mon_bit = (_monbit), \
+	}
+
+#define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit)		\
+	DEF_MOD_BASE(_name, _parent, false, _onindex, _onbit, _monindex, _monbit)
+
+#define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex, _monbit)	\
+	DEF_MOD_BASE(_name, _parent, true, _onindex, _onbit, _monindex, _monbit)
+
+/**
+ * struct rzv2h_reset - Reset definitions
+ *
+ * @reset_index: reset register index
+ * @reset_bit: reset bit
+ * @mon_index: monitor register index
+ * @mon_bit: monitor bit
+ */
+struct rzv2h_reset {
+	u8 reset_index;
+	u8 reset_bit;
+	u8 mon_index;
+	u8 mon_bit;
+};
+
+#define DEF_RST_BASE(_resindex, _resbit, _monindex, _monbit)	\
+	{ \
+		.reset_index = (_resindex), \
+		.reset_bit = (_resbit), \
+		.mon_index = (_monindex), \
+		.mon_bit = (_monbit), \
+	}
+
+#define DEF_RST(_resindex, _resbit, _monindex, _monbit)	\
+	DEF_RST_BASE(_resindex, _resbit, _monindex, _monbit)
+
+/**
+ * struct rzv2h_cpg_info - SoC-specific CPG Description
+ *
+ * @core_clks: Array of Core Clock definitions
+ * @num_core_clks: Number of entries in core_clks[]
+ * @last_dt_core_clk: ID of the last Core Clock exported to DT
+ * @num_total_core_clks: Total number of Core Clocks (exported + internal)
+ *
+ * @mod_clks: Array of Module Clock definitions
+ * @num_mod_clks: Number of entries in mod_clks[]
+ * @num_hw_mod_clks: Number of Module Clocks supported by the hardware
+ *
+ * @resets: Array of Module Reset definitions
+ * @num_resets: Number of entries in resets[]
+ */
+struct rzv2h_cpg_info {
+	/* Core Clocks */
+	const struct cpg_core_clk *core_clks;
+	unsigned int num_core_clks;
+	unsigned int last_dt_core_clk;
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
+};
+
+#endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.34.1


