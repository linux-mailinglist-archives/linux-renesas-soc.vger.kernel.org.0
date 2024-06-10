Return-Path: <linux-renesas-soc+bounces-6030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 358A0902C79
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 01:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C1A11C21641
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 23:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B059153820;
	Mon, 10 Jun 2024 23:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3R4MtHo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D204115253F;
	Mon, 10 Jun 2024 23:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718062357; cv=none; b=HIp2FsAXokMIHUs37+/1slZ6m8r6KgnSl+Nk6Z2ubCnfbgXeVUQuo/wJjVnZnOBFcVFqrOhxIGxHyGGfLDDOZnec3GdLnb70LxZQtnmyArcaQne4Ozx7PFTQ//pr7PeadTyvHHf1Ax49ueh9MI8PHCUIexRWUI1QhQ8A5unoweM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718062357; c=relaxed/simple;
	bh=IrVIN/XtgM0xX/yrZ7/Dw1V28rdIV2WfADCKLUt6nog=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pBEMYzexc9CAqhjWicIFCt3wvI0zj7yF95YXZlz8NZfvBshxVhpORgxJMt8FQxWuJ7y3kVrkxqyDoc6nVyNkBQ0rDYVsf/XnurThIkQJU9/it440hYrZQf7X0LfnIja5egBQAHP1ghJqgKLhC9cqgdz1RqbsiJzwneEZaTCTK9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3R4MtHo; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-35f1cb7a40fso1982719f8f.0;
        Mon, 10 Jun 2024 16:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718062353; x=1718667153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeAScyOi1WoWChT+xQyTaYNxcYjLuae80lC6S9xqTHA=;
        b=c3R4MtHoQ+RSdMG1sPNEJ5Aib0TV5t+Pbrp9JJI1M/SBJDCYdbQsZj7J+Is/vE+jmA
         gmQd5HK1xGY3IXeTmdKzMcOmU28bUdolKphmUmzsrFD/izgsyOzD1M++y4Dx0Tt5MT0o
         Mvq+253x+FSpPNNg2VqPeSVLMJN30YAsiG58pzeyTtGni8e5ST+lTQHlHRvRIYJ2SHww
         MzGSc40bJ2YQrFpKPXBHOipukqFH2QVBTqYmrH64hn7o7ZXWCQSAZE9txCa5fb0iUYfe
         57fIGCktqeMSo9Lr6uQbu9tBp9LibpZKWBZXV4spqo5iw+SSVMHawd4OG2BAGiIPzBTn
         Oj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718062353; x=1718667153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeAScyOi1WoWChT+xQyTaYNxcYjLuae80lC6S9xqTHA=;
        b=MOPlmhuyp2bZy0+sYAKGEboDCzRT6QfrULk6M5+Bs7bcruaPy4bobYEWgVuSztj4A6
         XL0N56RZj0S93eAUDLbezOTf20msDAmyWb4cb9HU0ZoHGtvsftfUO95id3bl+SvFiTva
         MRcr+aYBBwjVXSo5xETE/jlkxXqRDNV9vVL/kHU7KCiFHoV+9yRTa6qlo0UVYkhOZ/+h
         zVe284jBaOzlHnSYqIDeAZDHOO7eePmElm9oXaELtj2ou0rvLIAb9rFXkLwhbEUDbthy
         Pizz7RD7v5CjlZu5Jrv5636efVM9SXo0Pv/KxXA8stYp5cwH2/crHEMYmCgM3ig0+R+9
         83Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWT1ebmFHsRYZHCcHHlh32Uc694dkdAj9virYnaDtZsEB2mNtDRINg4uYrOUyfA2+7mBRzXShr+5+DsxldR1pp6V+VJR5Pt9MV8nr/dgYJgCkSivwFwqnX/LgjXoqB+NxGkaB2QnjMKH3G5h8Vpi6PV7qHt6KEa4RBrpd4NzwbW1WFziw==
X-Gm-Message-State: AOJu0YyXQ25duHijnhTBha49ch5dNf+jyrCpm6u5EQK3Nh8g+9b1ctUu
	J/ryBcAc9xzV5mAZlRYhs7HP0mRomOV4SKqTQ3RlyXkPtwUcI45RtRlJOznm
X-Google-Smtp-Source: AGHT+IGjJRIWvGwDaQqMDDKnv+e9Ju/u9y/2SxGutMDnUXnf60vZT/CLuX228/FmXRCq8Q4sNefVxw==
X-Received: by 2002:a5d:6610:0:b0:35f:2549:f8cf with SMTP id ffacd0b85a97d-35f2549fa56mr2856625f8f.60.1718062353004;
        Mon, 10 Jun 2024 16:32:33 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:74ea:e666:238d:5e76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1efe9a74sm5447698f8f.104.2024.06.10.16.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:32:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 3/4] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
Date: Tue, 11 Jun 2024 00:32:20 +0100
Message-Id: <20240610233221.242749-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/clk/renesas/rzv2h-cpg.c | 672 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h | 162 ++++++++
 4 files changed, 839 insertions(+)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg.h

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index d252150402e8..330c8bc03777 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -228,6 +228,10 @@ config CLK_RZG2L
 	bool "Renesas RZ/{G2L,G2UL,G3S,V2L} family clock support" if COMPILE_TEST
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
index 000000000000..f3c9f562234b
--- /dev/null
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -0,0 +1,672 @@
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
+ * @clks: Array containing all Core and Module Clocks
+ * @num_core_clks: Number of Core Clocks in clks[]
+ * @num_mod_clks: Number of Module Clocks in clks[]
+ * @num_resets: Number of Module Resets in info->resets[]
+ * @num_hw_resets: Number of resets supported by HW
+ * @last_dt_core_clk: ID of the last Core Clock exported to DT
+ * @info: Pointer to platform data
+ */
+struct rzv2h_cpg_priv {
+	struct reset_controller_dev rcdev;
+	struct device *dev;
+	void __iomem *base;
+
+	struct clk **clks;
+	unsigned int num_core_clks;
+	unsigned int num_mod_clks;
+	unsigned int num_resets;
+	unsigned int num_hw_resets;
+	unsigned int last_dt_core_clk;
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
+	int range_check;
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
+		range_check = 15 - (clkidx % 16);
+		if (range_check < 0 || clkidx >= priv->num_mod_clks) {
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
+ * struct mod_clock - Module clock
+ *
+ * @hw: handle between common and hardware-specific interfaces
+ * @off: register offset
+ * @bit: ON/MON bit
+ * @monoff: monitor register offset
+ * @monbit: montor bit
+ * @priv: CPG private data
+ */
+struct mod_clock {
+	struct clk_hw hw;
+	u8 on_index;
+	u8 on_bit;
+	u16 mon_index;
+	u8 mon_bit;
+	struct rzv2h_cpg_priv *priv;
+};
+
+#define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
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
+	if (!enable)
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
+	u32 offset = GET_CLK_MON_OFFSET(clock->mon_index);
+	u32 bitmask = BIT(clock->mon_bit);
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
+			   const struct rzv2h_cpg_info *info,
+			   struct rzv2h_cpg_priv *priv)
+{
+	struct mod_clock *clock = NULL;
+	struct device *dev = priv->dev;
+	struct clk_init_data init;
+	unsigned int id = mod->id;
+	struct clk *parent, *clk;
+	const char *parent_name;
+	unsigned int i;
+
+	WARN_DEBUG(id < priv->num_core_clks);
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
+	clock->on_index = mod->on_index;
+	clock->on_bit = mod->on_bit;
+	clock->mon_index = mod->mon_index;
+	clock->mon_bit = mod->mon_bit;
+	clock->priv = priv;
+	clock->hw.init = &init;
+
+	clk = clk_register(NULL, &clock->hw);
+	if (IS_ERR(clk))
+		goto fail;
+
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
+	unsigned int reg = GET_RST_OFFSET(info->resets[id].reset_index);
+	u32 mask = BIT(info->resets[id].reset_bit);
+	s8 monbit = info->resets[id].mon_bit;
+	u32 value = mask << 16;
+
+	dev_dbg(rcdev->dev, "assert id:%ld offset:0x%x\n", id, reg);
+
+	writel(value, priv->base + reg);
+
+	reg = GET_RST_MON_OFFSET(info->resets[id].mon_index);
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
+	unsigned int reg = GET_RST_OFFSET(info->resets[id].reset_index);
+	u32 mask = BIT(info->resets[id].reset_bit);
+	s8 monbit = info->resets[id].mon_bit;
+	u32 value = (mask << 16) | mask;
+
+	dev_dbg(rcdev->dev, "deassert id:%ld offset:0x%x\n", id, reg);
+
+	writel(value, priv->base + reg);
+
+	reg = GET_RST_MON_OFFSET(info->resets[id].mon_index);
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
+	unsigned int reg = GET_RST_MON_OFFSET(info->resets[id].mon_index);
+	s8 monbit = info->resets[id].mon_bit;
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
+	unsigned int id = reset_spec->args[0];
+
+	if (id >= rcdev->nr_resets || ((id % 16) > 15)) {
+		dev_err(rcdev->dev, "Invalid reset index %u\n", id);
+		return -EINVAL;
+	}
+
+	return id;
+}
+
+static int rzv2h_cpg_reset_controller_register(struct rzv2h_cpg_priv *priv)
+{
+	WARN_DEBUG(priv->num_resets >= priv->num_hw_resets);
+
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
+	priv->last_dt_core_clk = info->last_dt_core_clk;
+	priv->num_resets = info->num_resets;
+	priv->num_hw_resets = info->num_hw_resets;
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
index 000000000000..d2791a3a23a0
--- /dev/null
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -0,0 +1,162 @@
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
+ * @id: clock index in array containing all Core and Module Clocks
+ * @parent: id of parent clock
+ * @on_index: control register index
+ * @on_bit: ON bit
+ * @mon_index: monitor register index
+ * @mon_bit: monitor bit
+ */
+struct rzv2h_mod_clk {
+	const char *name;
+	unsigned int parent;
+	unsigned int id;
+	u8 on_index;
+	u8 on_bit;
+	u8 mon_index;
+	u8 mon_bit;
+};
+
+#define DEF_MOD_BASE(_name, _parent, _id, _onindex, _onbit, _monindex, _monbit)	\
+	{ \
+		.name = (_name), \
+		.parent = (_parent), \
+		.id = (_id), \
+		.on_index = (_onindex), \
+		.on_bit = (_onbit), \
+		.mon_index = (_monindex), \
+		.mon_bit = (_monbit), \
+	}
+
+#define MOD_CLK_ID(x)	(MOD_CLK_BASE + (x))
+#define MOD_ID(x, y)	((((x) * 16)) + (y))
+
+#define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit)	\
+	DEF_MOD_BASE(_name, _parent, MOD_CLK_ID(MOD_ID(_onindex, _onbit)),	\
+		     _onindex, _onbit, _monindex, _monbit)
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
+#define RST_ID(x, y)	((((x) * 16)) + (y))
+
+#define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit)	\
+	[_id] = { \
+		.reset_index = (_resindex), \
+		.reset_bit = (_resbit), \
+		.mon_index = (_monindex), \
+		.mon_bit = (_monbit), \
+	}
+
+#define DEF_RST(_resindex, _resbit, _monindex, _monbit)	\
+	DEF_RST_BASE(RST_ID((_resindex), (_resbit)), _resindex, _resbit, _monindex, _monbit)
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
+ * @num_hw_resets: Number of resets supported by the hardware
+ *
+ * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
+ *                 should not be disabled without a knowledgeable driver
+ * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
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
+	unsigned int num_hw_resets;
+
+	/* Critical Module Clocks that should not be disabled */
+	const unsigned int *crit_mod_clks;
+	unsigned int num_crit_mod_clks;
+};
+
+#endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.34.1


