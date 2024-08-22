Return-Path: <linux-renesas-soc+bounces-8013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0470C95B39F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 13:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D6BC1C2108F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 11:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616A91B81DC;
	Thu, 22 Aug 2024 11:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmvZKBAP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578651B7913;
	Thu, 22 Aug 2024 11:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724325410; cv=none; b=PnMqF2YJBnKlZ4DwoN2sU29MVzr22v4soUakTp5UHdQDvoh6XWbciko/BLa63yhnf1SXjOA2vDa2uzXE/WDn1+pMsEv+McmzHg1w99sBhTJx9hSrxmlvqByci9xtF5t4h+kCUSVlEdu3wKut86hTHfYju1IPVuItUB0e1cuCYPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724325410; c=relaxed/simple;
	bh=hRKm7Z3jwcsWTk4Tvxzh3HVld34TIVT4eE5kxPVQJHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TJJLYRPgI4IZgZ/DPSrSN8998f3aFkmo1M7zLf/s3o7/2SXouqUQ2ApJJTe9+ZKU5FAlQ0wNaGVX9pxIMV8kJoTis4uDJT2/0fLpF1P44s2KTRQAFIHLgcwXK8u1Cy24CjjSa4LklxkygeWbaXjjGlovENgbSXiXaSM/jy3HpKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmvZKBAP; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-533461323cdso801589e87.2;
        Thu, 22 Aug 2024 04:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724325406; x=1724930206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRoo+6lL1lkK1EzAzfmsyNMyiyymuhN3nbMxc3lJUb0=;
        b=SmvZKBAPaY6QGbJakuaEkEeDz6S9xbD3K7/qFuMDl2Tar4wMhSD27h/7UAdZJZAKP3
         dUVH5Wlgncs2j5p4wgy31dZNoRmGvzvVyCDW15gZDSToZ8mmzNkNdPE7aXgwHtNeKsOT
         23uM21uef/2THJu7YM1HAQdaW76RiNBzxy8Z8P7Wg5T9zBGjsyHrGw4ABtXnFTRgJzAm
         LYmZdHMa6/cqLxWTQ1FneiYQQ4UBO3pNlQt080QByJbDfxO6CpwZADHPwZ/LHTc/Kb4i
         aKM5hpA8jc5jwLB8f4jLtpzANCsGyWrVpH581epui2pHwuwwPXqwq6nfnjhKlaKVMOMC
         gJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724325406; x=1724930206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRoo+6lL1lkK1EzAzfmsyNMyiyymuhN3nbMxc3lJUb0=;
        b=e2vU6zaLtzy5ApqV4e5jiVh3R2GzFGAE1nJANi9WwVbkywWE6dgAdr3HOrOxCN+ZNH
         HSWJTlkAqYNzrsPg7a3DNNWKQZjAq5Q7XB5wgCtgM96mwidHNGmaSq5rfzwd7yQZJy04
         MVeICHXIE2ePeJmqT3MKowGYwDFw/7PPGtfoXz+a4NPzuxRmAOE+PdboD/Q+FSO6Hz4A
         kjKUfecVwXrZUGZikfJUh4EkINH00K7XHFbb7ls8th4bwarRWKMsHYS3NfG2J6/vcuUq
         x/DjazUUWqBAprPWyHKIUpAUlg93xId37p2IcWeY1Xlx0CpE+7f87qX/ZltUAaBaDv8Q
         HGzg==
X-Forwarded-Encrypted: i=1; AJvYcCWqUC6OD/5ejV4iyedZ2Ql23fhQogl97cnp+CPdS1UkM06QL07w4RzFqD+1bpmtgt1RauYHTmMLpUOX3ScF@vger.kernel.org, AJvYcCX7tYrnXNNvQ1p4vIiF7HyHwZ5fEXS06QiWvIzhCMBY7iTbvEF/xIOQT7N+CvnmTfJfGsr8RhaTZkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9IUB5XdCliqS+wfJBchcWAdPSSu6xUWJwDk/ajMrUtM/1ATq
	CAo9yzIDbxU0MwftAZiz25tJPWKXOYyMK3CCtbl4ecyoMFSlDSkcLf/yWTJ0
X-Google-Smtp-Source: AGHT+IH/gJ4wfCVTtLhywZmIOIpmLWWXZGJVgHeTnyePLOLwmS6zDkEL+hFkHIwrVsIe22zYEn3pBQ==
X-Received: by 2002:a05:6512:3f12:b0:533:4191:fa47 with SMTP id 2adb3069b0e04-5334fd54882mr931983e87.47.1724325405904;
        Thu, 22 Aug 2024 04:16:45 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f46a2sm104479766b.208.2024.08.22.04.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 04:16:45 -0700 (PDT)
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
Subject: [PATCH v2 1/2] clk: renesas: rzv2h-cpg: Add support for dynamic switching divider clocks
Date: Thu, 22 Aug 2024 12:16:30 +0100
Message-Id: <20240822111631.544886-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822111631.544886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240822111631.544886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- Dropped DDIV_DIVCTL_WIDTH
- width is now extracted from conf
- Updated DDIV_GET_* macros
- Now doing rmw as some of the DIVCTLx require it
---
 drivers/clk/renesas/rzv2h-cpg.c | 165 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h |   7 ++
 2 files changed, 172 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 34221046dc46..54070dd1c019 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -45,14 +45,23 @@
 #define PDIV(val)		FIELD_GET(GENMASK(5, 0), (val))
 #define SDIV(val)		FIELD_GET(GENMASK(2, 0), (val))
 
+#define DDIV_DIVCTL_WEN(shift)		(1 << ((shift) + 16))
+#define DDIV_GET_WIDTH(val)		FIELD_GET(GENMASK(3, 0), (val))
+#define DDIV_GET_SHIFT(val)		FIELD_GET(GENMASK(7, 4), (val))
+#define DDIV_GET_REG_OFFSET(val)	FIELD_GET(GENMASK(18, 8), (val))
+#define DDIV_GET_MON(val)		FIELD_GET(GENMASK(23, 19), (val))
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
@@ -173,6 +198,141 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
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
+	if ((shift + DDIV_GET_WIDTH(core->conf)) > 16)
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
+	div->width = DDIV_GET_WIDTH(core->conf);
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
@@ -254,6 +414,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_PLL:
 		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
 		break;
+	case CLK_TYPE_DDIV:
+		clk = rzv2h_cpg_ddiv_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
@@ -612,6 +775,8 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
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


