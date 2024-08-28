Return-Path: <linux-renesas-soc+bounces-8423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A4F9623AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 11:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE93B1C23FD4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 09:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBAE16BE10;
	Wed, 28 Aug 2024 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fi8FWMY/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D33167DB8;
	Wed, 28 Aug 2024 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837913; cv=none; b=iPZ0TwS+9vhTgCWjKN3nzcY602/6abPzPyC/gveIzhf1iowPzUcnTpMWOKfqRf0UfNiGTxKbj11014Obg0U4xxuBbfvLmeFfh3F4YDyT5zUFO75xAjvnrlu1To0x8ysuKSwMKr2A230mMuGoFX9lPBAL65zjGP0skuFA0qQrCsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837913; c=relaxed/simple;
	bh=ZlWRoRJstE9e2rJJrvl3iMz8fbroYASWo9leddnt4Yw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dGmyONo6qH0uA7tDyTkcsUU2JUId04pvzMzp2QHklWhWLIjV+/EMD4VUUeCSoW/3B3JmwmjVvQnowseN7gXw+ASh2x1F20nmrFqKUmA8nLt0ZoHNGoaD2t6r3VjdHo1xO1dVfhCpIL1GVyneHzy4fHp0qnBIsRUpS4qS3wr6fbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fi8FWMY/; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8677ae5a35so618378066b.0;
        Wed, 28 Aug 2024 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724837910; x=1725442710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeuIKm5+h+sp18OT/4oyXPu1Yr0a66hM7JIxDYmXza0=;
        b=fi8FWMY/VyIq2LuF/ly0OE6WKQjrAV5jRpMxsCF1h11skYPyGPIc8+UvCE6JwTa2Pu
         isz7MmgZUoM9daBg1BcUfCi45Ys7HOADZzbQKnqHbJHZA8nbH1SqHnknq/1qx7ArLkBl
         rXg4Ohx/MpaPAN2uCSaeQRuHPEE9jSfTNtdygAKEUgzw5Gt79BYpW/kfayZ//P1NtBD3
         8JPajmiuMYLFHToUeiHCYJdCCN737RwVn08sp8WrjM2fhwuz2PXen1pZqAisaOGKoc7W
         jdJgvhPBcb2nt2bctn0gLDcDF3fwfxUIBYdDZRUq1fmYjuyt02iqTUp16vi2zVHOCWxY
         zlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837910; x=1725442710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeuIKm5+h+sp18OT/4oyXPu1Yr0a66hM7JIxDYmXza0=;
        b=iNLPkLHUqnRXXtmDS0Ox6P8YCvseLlj1aYRGssGa174mUTN0msgyyv4CEpj3Ke8hPT
         pgXyPn8g1Yx6zKyZhaBdWUCg4phaMSmuJvIB640FlEKmzD+AHWgHHG0tyig144ckx5ex
         DYJ9UNoVsoBqyb8dPDYnfqaox4Pxdo9Hin1uKzg0rBDRYnhGziMw/q/6psqSr2jnOl8j
         rgda9PwlBs4Wc1XHAWc+9fkkuSelU32VcYKiAzLWO2mjPCRPpv4FPFzFt2Di9NATq6mJ
         nLOehdigHY8lkTvcgo2NHYytiYci/oQLMXWxYJAoipGvrqLGYvGLK8FTmvipbc2kcA25
         oVRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6MYYQlrBQalZWjEUNA8CyeokYgeJcXG619j9J4DHHkk1mHboc8TxiUzLYNEgCo6SYfzVYhcXk/ts=@vger.kernel.org, AJvYcCUUiUVrnIBaTBgXkly3qP6kFTnDprL8oY3EbGh2VD0ZoqRHpUO+ZgNGnwS31WXFJ2usLi4V0kYUHEqyF8OK@vger.kernel.org
X-Gm-Message-State: AOJu0YztcS6mfP7NoZZD36w3Fss8HIzbnUIKo7Ljo6qdUrzJ1E281E4C
	M+r/w5DzHY1xrMShm/VYn1fbfjVR/o6uj35OK1FPM1LOH8TlJmfViJWG6QHzLOc=
X-Google-Smtp-Source: AGHT+IFErBgHIYrP94D+Zt0ddZyiRjtIZhmXT8yRci1iBgw/I8nfE87hA9rehDfhsxUbDt98OMbRVg==
X-Received: by 2002:a17:907:9490:b0:a7a:8586:d36b with SMTP id a640c23a62f3a-a870a8e8e19mr116060466b.3.1724837909847;
        Wed, 28 Aug 2024 02:38:29 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:5ac5:89a0:20cd:42bc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e548967fsm222634366b.19.2024.08.28.02.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:38:29 -0700 (PDT)
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
Subject: [PATCH v3 1/2] clk: renesas: rzv2h-cpg: Add support for dynamic switching divider clocks
Date: Wed, 28 Aug 2024 10:38:21 +0100
Message-Id: <20240828093822.162855-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3
- Updated DDIV_DIVCTL_WEN() macro
- Introduced struct ddiv to pass divider config
- Updated DDIV_PACK() macro

v1->v2
- Dropped DDIV_DIVCTL_WIDTH
- width is now extracted from conf
- Updated DDIV_GET_* macros
- Now doing rmw as some of the DIVCTLx require it
---
 drivers/clk/renesas/rzv2h-cpg.c | 165 +++++++++++++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h |  39 +++++++-
 2 files changed, 201 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 34221046dc46..b524a9d33610 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -45,14 +45,19 @@
 #define PDIV(val)		FIELD_GET(GENMASK(5, 0), (val))
 #define SDIV(val)		FIELD_GET(GENMASK(2, 0), (val))
 
+#define DDIV_DIVCTL_WEN(shift)		BIT((shift) + 16)
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
@@ -64,6 +69,7 @@
 struct rzv2h_cpg_priv {
 	struct device *dev;
 	void __iomem *base;
+	spinlock_t rmw_lock;
 
 	struct clk **clks;
 	unsigned int num_core_clks;
@@ -108,6 +114,21 @@ struct mod_clock {
 
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
@@ -161,7 +182,7 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	init.num_parents = 1;
 
 	pll_clk->hw.init = &init;
-	pll_clk->conf = core->conf;
+	pll_clk->conf = core->cfg.conf;
 	pll_clk->base = base;
 	pll_clk->priv = priv;
 	pll_clk->type = core->type;
@@ -173,6 +194,143 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
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
+	val = readl(divider->reg) | DDIV_DIVCTL_WEN(divider->shift);
+	val &= ~(clk_div_mask(divider->width) << divider->shift);
+	val |= (u32)value << divider->shift;
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
+	struct ddiv cfg_ddiv = core->cfg.ddiv;
+	struct clk_init_data init = {};
+	struct device *dev = priv->dev;
+	u8 shift = cfg_ddiv.shift;
+	u8 width = cfg_ddiv.width;
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
+	if ((shift + width) > 16)
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
+	ddiv->mon = cfg_ddiv.monbit;
+	div = &ddiv->div;
+	div->reg = priv->base + cfg_ddiv.offset;
+	div->shift = shift;
+	div->width = width;
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
index 6df59e041701..1c7a979ab790 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -8,6 +8,29 @@
 #ifndef __RENESAS_RZV2H_CPG_H__
 #define __RENESAS_RZV2H_CPG_H__
 
+/**
+ * struct ddiv - Structure for dynamic switching divider
+ *
+ * @offset: register offset
+ * @shift: position of the divider bit
+ * @width: width of the divider
+ * @monbit: monitor bit in CPG_CLKSTATUS0 register
+ */
+struct ddiv {
+	unsigned int offset:11;
+	unsigned int shift:4;
+	unsigned int width:4;
+	unsigned int monbit:5;
+};
+
+#define DDIV_PACK(_offset, _shift, _width, _monbit) \
+	((struct ddiv){ \
+		.offset = _offset, \
+		.shift = _shift, \
+		.width = _width, \
+		.monbit = _monbit \
+	})
+
 /**
  * Definitions of CPG Core Clocks
  *
@@ -23,7 +46,12 @@ struct cpg_core_clk {
 	unsigned int div;
 	unsigned int mult;
 	unsigned int type;
-	unsigned int conf;
+	union {
+		unsigned int conf;
+		struct ddiv ddiv;
+	} cfg;
+	const struct clk_div_table *dtable;
+	u32 flag;
 };
 
 enum clk_types {
@@ -31,6 +59,7 @@ enum clk_types {
 	CLK_TYPE_IN,		/* External Clock Input */
 	CLK_TYPE_FF,		/* Fixed Factor Clock */
 	CLK_TYPE_PLL,
+	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
 };
 
 /* BIT(31) indicates if CLK1/2 are accessible or not */
@@ -44,11 +73,17 @@ enum clk_types {
 #define DEF_BASE(_name, _id, _type, _parent...) \
 	DEF_TYPE(_name, _id, _type, .parent = _parent)
 #define DEF_PLL(_name, _id, _parent, _conf) \
-	DEF_TYPE(_name, _id, CLK_TYPE_PLL, .parent = _parent, .conf = _conf)
+	DEF_TYPE(_name, _id, CLK_TYPE_PLL, .parent = _parent, .cfg.conf = _conf)
 #define DEF_INPUT(_name, _id) \
 	DEF_TYPE(_name, _id, CLK_TYPE_IN)
 #define DEF_FIXED(_name, _id, _parent, _mult, _div) \
 	DEF_BASE(_name, _id, CLK_TYPE_FF, _parent, .div = _div, .mult = _mult)
+#define DEF_DDIV(_name, _id, _parent, _ddiv_packed, _dtable) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DDIV, \
+		.cfg.ddiv = _ddiv_packed, \
+		.parent = _parent, \
+		.dtable = _dtable, \
+		.flag = CLK_DIVIDER_HIWORD_MASK)
 
 /**
  * struct rzv2h_mod_clk - Module Clocks definitions
-- 
2.34.1


