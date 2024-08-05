Return-Path: <linux-renesas-soc+bounces-7738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E7A948268
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 21:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FC131F21CCB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 19:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E38A16BE27;
	Mon,  5 Aug 2024 19:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Npsp2XJD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7360516B748;
	Mon,  5 Aug 2024 19:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722886775; cv=none; b=p9ArIYNtH4m6AQ/abVKq03x8WYhTTr8hAzt17V7qJ+VOg0ffsMPhD1MqAkK3ZBGeoWU+wfvGF43cMo5fAwV7c6UOl5slZvxAji2iKHjNSlPyTpVyHhptLNRZF3ONxdJ8/7z+x8xrnCh5s6ovvi6PnHtQf7Ubb7q6vcEP0SNQoww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722886775; c=relaxed/simple;
	bh=F+jkdLZqDg1epEI747I3jdv2ek5xvZD0wbcO7QobI2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HBIZAlICbPl94+EFM6M4hNR0Fh4FUQLnO+OqXjL5MLyFj+qMCpBohGU1pYgjc/xDadqKLcSdqCakuie/IGy9z29AgOZwyjyAdLA7g5aXFSt8GGMGICQiYmxhsh7Gtrl4o0s7KFoO7O+djSbbgwhRZ6CJKc+s/yJLEQpnUgASLp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Npsp2XJD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so99346895e9.2;
        Mon, 05 Aug 2024 12:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722886772; x=1723491572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR1AyChyTeToqkCku60q53cdRHzQOJxM7fPXTxEVIeA=;
        b=Npsp2XJDovgUhgiTzrFd8OERuBpvPcYU9rDM/lEkS7DWrMMJpIleYs0qNrCaxYODFk
         xwYVCbNeprgFKztVreQuKlCOPxU2LitdN+47TjnP59R6JmIA7mQ0CPfDQHHf4/PA3HLW
         sWBvogarRXeIQ9t2HtsejkvHjc51p8qmXMFVbPfrLNnTgIbxBmVA9y6Gg+td1jGxeC2N
         aFmT2xyCusjCfIbN519L4lFQV3+cLdgjg+iFa55tDPHR3i9f6yS/icWubE3EgNjiwKcP
         /Pdka8QxLmMhE21JDZE/WJ3NeK/DLPAS4k2AcWLC1BK7Gt/oi2rV5MMaF/tZUV5MNeEQ
         bhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722886772; x=1723491572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mR1AyChyTeToqkCku60q53cdRHzQOJxM7fPXTxEVIeA=;
        b=pS03p38oCyltA90Oi+q9B1pF1GCXu6JHUiz0wVH1DkVDNVEhUzqbCFBb0N7vw8Wln3
         kW37d63A62uj+j/3IFySPPDIP7/NwrNdIfu7x6phFSQlYniI0lOgUTAWKoWhY3YgtA5h
         QNYgi8iNyIoXXDXlPkhuuIqaeeiadYzWzeMWb7I1GZmGV6TPZVigYcvoTMY+tMh7aFrL
         cgnIE62KReZLS+j8H+Gucd6CC9HdsmeFTsLFG19ycCwwEq5Sz0Q7ofLgYU3EsvwXQ9D5
         avoOA0hO7YOJwtZ6LE+2GQrYOsJMY9gfblZObvNXN1k006INax+JyHlc3pUpcs17kjF5
         uxbg==
X-Forwarded-Encrypted: i=1; AJvYcCUmLJI31g0Grpbey70cb5K9AS9CqnAvPMU3f4zrVFf7JImSyEk59ElyU6t+i3PfCMEvz2WxRaTEwXbCQf2drs0Jp0nQtoDIvO9wQQT/MoKKWvvLxaHoXkwQvhRJOBO7OqJrGyRARNId
X-Gm-Message-State: AOJu0Yy/P/qlKCKlNiEJeCgNtyxPDpOD6tmwzKkGbvGRrpX/P8LRyVml
	6pZhRxdDOd+PWQUvpxrbMB7qqW8r9gfQmgL7Lr9mex19BuQjX8eC
X-Google-Smtp-Source: AGHT+IHuUm2URszCs4lrvCnl+Eodq7QDAW5os4qw9A71m5mgvT3LQliBgyXeYqv7YVA5hMRAug63DQ==
X-Received: by 2002:a05:600c:1f96:b0:428:f0a:3f92 with SMTP id 5b1f17b1804b1-428e6b2f142mr105161765e9.21.1722886771283;
        Mon, 05 Aug 2024 12:39:31 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:25b8:5324:d26c:319c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e4f5b6sm151496395e9.25.2024.08.05.12.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 12:39:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] clk: renesas: rzv2h-cpg: Add support for dynamic switching divider clocks
Date: Mon,  5 Aug 2024 20:38:45 +0100
Message-Id: <20240805193846.52416-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240805193846.52416-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240805193846.52416-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for dynamic switching divider clocks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 163 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h |   7 ++
 2 files changed, 170 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 34221046dc46..4dd056d1b58d 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -45,14 +45,23 @@
 #define PDIV(val)		FIELD_GET(GENMASK(5, 0), (val))
 #define SDIV(val)		FIELD_GET(GENMASK(2, 0), (val))
 
+#define DDIV_DIVCTL_WIDTH		(3)
+#define DDIV_DIVCTL_WEN(shift)		(1 << ((shift) + 16))
+#define DDIV_GET_MON(val)		FIELD_GET(GENMASK(4, 0), (val))
+#define DDIV_GET_SHIFT(val)		FIELD_GET(GENMASK(8, 5), (val))
+#define DDIV_GET_REG_OFFSET(val)	FIELD_GET(GENMASK(19, 9), (val))
+
 #define GET_MOD_CLK_ID(base, index, bit)		\
 			((base) + ((((index) * (16))) + (bit)))
 
+#define CPG_CLKSTATUS0		(0x700)
+
 /**
  * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
  *
  * @dev: CPG device
  * @base: CPG register block base address
+ * @rmw_lock: protects register accesses
  * @clks: Array containing all Core and Module Clocks
  * @num_core_clks: Number of Core Clocks in clks[]
  * @num_mod_clks: Number of Module Clocks in clks[]
@@ -64,6 +73,7 @@
 struct rzv2h_cpg_priv {
 	struct device *dev;
 	void __iomem *base;
+	spinlock_t rmw_lock;
 
 	struct clk **clks;
 	unsigned int num_core_clks;
@@ -108,6 +118,21 @@ struct mod_clock {
 
 #define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
 
+/**
+ * struct ddiv_clk - DDIV clock
+ *
+ * @priv: CPG private data
+ * @div: divider clk
+ * @mon: monitor bit in CPG_CLKSTATUS0 register
+ */
+struct ddiv_clk {
+	struct rzv2h_cpg_priv *priv;
+	struct clk_divider div;
+	u8 mon;
+};
+
+#define to_ddiv_clock(_div) container_of(_div, struct ddiv_clk, div)
+
 static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 						   unsigned long parent_rate)
 {
@@ -173,6 +198,139 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	return pll_clk->hw.clk;
 }
 
+static unsigned long rzv2h_ddiv_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+	unsigned int val;
+
+	val = readl(divider->reg) >> divider->shift;
+	val &= clk_div_mask(divider->width);
+
+	return divider_recalc_rate(hw, parent_rate, val, divider->table,
+				   divider->flags, divider->width);
+}
+
+static long rzv2h_ddiv_round_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long *prate)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+
+	return divider_round_rate(hw, rate, prate, divider->table,
+				  divider->width, divider->flags);
+}
+
+static int rzv2h_ddiv_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
+}
+
+static inline int rzv2h_cpg_wait_ddiv_clk_update_done(void __iomem *base, u8 mon)
+{
+	u32 bitmask = BIT(mon);
+	u32 val;
+
+	return readl_poll_timeout_atomic(base + CPG_CLKSTATUS0, val, !(val & bitmask), 10, 200);
+}
+
+static int rzv2h_ddiv_set_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long parent_rate)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+	struct ddiv_clk *ddiv = to_ddiv_clock(divider);
+	struct rzv2h_cpg_priv *priv = ddiv->priv;
+	unsigned long flags = 0;
+	int value;
+	u32 val;
+	int ret;
+
+	value = divider_get_val(rate, parent_rate, divider->table,
+				divider->width, divider->flags);
+	if (value < 0)
+		return value;
+
+	spin_lock_irqsave(divider->lock, flags);
+
+	ret = rzv2h_cpg_wait_ddiv_clk_update_done(priv->base, ddiv->mon);
+	if (ret)
+		goto ddiv_timeout;
+
+	val = DDIV_DIVCTL_WEN(divider->shift) | (u32)value << divider->shift;
+	writel(val, divider->reg);
+
+	ret = rzv2h_cpg_wait_ddiv_clk_update_done(priv->base, ddiv->mon);
+	if (ret)
+		goto ddiv_timeout;
+
+	spin_unlock_irqrestore(divider->lock, flags);
+
+	return 0;
+
+ddiv_timeout:
+	spin_unlock_irqrestore(divider->lock, flags);
+	return ret;
+}
+
+static const struct clk_ops rzv2h_ddiv_clk_divider_ops = {
+	.recalc_rate = rzv2h_ddiv_recalc_rate,
+	.round_rate = rzv2h_ddiv_round_rate,
+	.determine_rate = rzv2h_ddiv_determine_rate,
+	.set_rate = rzv2h_ddiv_set_rate,
+};
+
+static struct clk * __init
+rzv2h_cpg_ddiv_clk_register(const struct cpg_core_clk *core,
+			    struct rzv2h_cpg_priv *priv)
+{
+	u8 shift = DDIV_GET_SHIFT(core->conf);
+	struct clk_init_data init = {};
+	struct device *dev = priv->dev;
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_divider *div;
+	struct ddiv_clk *ddiv;
+	int ret;
+
+	parent = priv->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	parent_name = __clk_get_name(parent);
+
+	if (shift + DDIV_DIVCTL_WIDTH > 16)
+		return ERR_PTR(-EINVAL);
+
+	ddiv = devm_kzalloc(priv->dev, sizeof(*ddiv), GFP_KERNEL);
+	if (!ddiv)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = core->name;
+	init.ops = &rzv2h_ddiv_clk_divider_ops;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	ddiv->priv = priv;
+	ddiv->mon = DDIV_GET_MON(core->conf);
+	div = &ddiv->div;
+	div->reg = priv->base + DDIV_GET_REG_OFFSET(core->conf);
+	div->shift = shift;
+	div->width = DDIV_DIVCTL_WIDTH;
+	div->flags = core->flag;
+	div->lock = &priv->rmw_lock;
+	div->hw.init = &init;
+	div->table = core->dtable;
+
+	ret = devm_clk_hw_register(dev, &div->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return div->hw.clk;
+}
+
 static struct clk
 *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
 			       void *data)
@@ -254,6 +412,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_PLL:
 		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
 		break;
+	case CLK_TYPE_DDIV:
+		clk = rzv2h_cpg_ddiv_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
@@ -612,6 +773,8 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	spin_lock_init(&priv->rmw_lock);
+
 	priv->dev = dev;
 
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 6df59e041701..936af15b648a 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -24,6 +24,8 @@ struct cpg_core_clk {
 	unsigned int mult;
 	unsigned int type;
 	unsigned int conf;
+	const struct clk_div_table *dtable;
+	u32 flag;
 };
 
 enum clk_types {
@@ -31,6 +33,7 @@ enum clk_types {
 	CLK_TYPE_IN,		/* External Clock Input */
 	CLK_TYPE_FF,		/* Fixed Factor Clock */
 	CLK_TYPE_PLL,
+	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
 };
 
 /* BIT(31) indicates if CLK1/2 are accessible or not */
@@ -49,6 +52,10 @@ enum clk_types {
 	DEF_TYPE(_name, _id, CLK_TYPE_IN)
 #define DEF_FIXED(_name, _id, _parent, _mult, _div) \
 	DEF_BASE(_name, _id, CLK_TYPE_FF, _parent, .div = _div, .mult = _mult)
+#define DEF_DDIV(_name, _id, _parent, _conf, _dtable) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DDIV, .conf = _conf, \
+		 .parent = _parent, .dtable = _dtable, \
+		 .flag = CLK_DIVIDER_HIWORD_MASK)
 
 /**
  * struct rzv2h_mod_clk - Module Clocks definitions
-- 
2.34.1


