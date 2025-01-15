Return-Path: <linux-renesas-soc+bounces-12169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA43AA125E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 15:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 190001880476
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 14:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6B924A7EB;
	Wed, 15 Jan 2025 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JTqgkK6Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3A424A7EC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736950867; cv=none; b=hgLZowLWLvyD/K8uUZe/I+4W7zF2mwPhNO6ByIQNsxE+5TmDDXC2iIbSU3+3rinJ45A87jqtEyKm6QnckAe20gPvLxxbJ4/QToIqg8g9fB9D8hXuOq2JxqQHpjXdfydN2YrVWXpyC7w+2oDO9YTZgiJeHlJR02yaFVtdqMVo1rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736950867; c=relaxed/simple;
	bh=nj13N1ZTV7Kjt+TdLdInP3UcHYwEz1SDgFL4/oh3AEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WmyOILP/ZzfRuyPq+L79aZi44W9Nu4Y6sv/tCO/Hs25lVJQ9WYxmwOSow4XVimL+HZGtZsqvV8c7E4cyk7eIsDweYh90Huj8K/rK6d1oC1lutK3enf07l7bWalMgV6bjfjnin36Umwuombtjck3wl9PRg2Y9Ss0h8w+axngRSXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JTqgkK6Z; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385eed29d17so3343310f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 06:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736950863; x=1737555663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aQU0JRvu4k3QvD4IrdyBcGtc8xbP0jsq/0kMVNzSuZo=;
        b=JTqgkK6ZvVbPZC2viq6xUfqRVYnY5rsABQmCQ6xUqqQbbU9uaxD7zBfeHFk8RZhG11
         Z9ohK+6HBVVJa95/bN8rtCY09VhAIfV8+Pg0JNlHUdNegIopvH9vwj70Kyp0aGJ0icJ6
         pos/HbvGBI+B5YbTBxjJuDb6EAMZbMlCdv3y+c6/+O7zLMVroY4p2LpcLcqygqipG6fv
         hcpyiytD7HeZry7P4zP5ZYdGKmbkrW1Is6cMPHR5CoKqOSZnjPhSJhMQ/96U63QZopuJ
         daoX6YaF1wNbhuUpAZV81EZqcNe6HIOsHDOkRceFZbkPeB+AQTGGBl+0Trl6VdJFBzeu
         VcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736950863; x=1737555663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQU0JRvu4k3QvD4IrdyBcGtc8xbP0jsq/0kMVNzSuZo=;
        b=K7MfKwv1xkbOyKthWkB3/WAQLRdHCOHyeauZBSmeUhTsFE0IUjuJVQvw25N3zUkz21
         09SGPKW/4+EFZZVtgotm714TR5vIHwhnmLKaeJBnXkbpsXqX+4EMtu1LTbCyHj+VSwkf
         Rsx4YDAEOinYp/uz/+whnsc26ltfpZPI7H9g1TsbrtgD7vINoOkaadBlQpX5PX79CP+i
         MXRgW+kXERMQDd3owkqM0jAntefc5JMzqPxjp3GbViYkgyTI7WkWlC7gV3pBIAAWFxWu
         GNsUi0ibV+nZUe870WRzGjxqLFkruqgHdxAEMO9VqTCQ170+7gIHHo4fjyFq8uT9p2c5
         6qew==
X-Forwarded-Encrypted: i=1; AJvYcCVqNzJ14E2PCnclLAugA1qk08eI78epG1FA7NHU3hLftIf4zDMZlSuJmHCqCBZE+53BoVd73dZXb+5W5WcOI8hDHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4iHyt9dGffWCMRAlsn/pMQIYtQLlvpKQnsXggY6bILo3OPaRR
	LDPldQOvbQkqyoJ7F1er9SG+WedArsVBlF3RxBsVNT6cDrQeC7QYlKV1TOq1SHU=
X-Gm-Gg: ASbGncvWoJ0ocjrZo5AO/QhNyfNflavBeDxkAmkJIHBtaq5dR+JLddymnOhdny107HU
	qZTnJ9Jt/s1PJ+ayj5WdIQ5SEWD1q/sTwzt1+9+JkgrfkU9umKH5uFPA0ppm9MHQnIC90La23Kt
	2wWah5VRx73iuo/XQgB+ZVd9+Ft/40xuMjmsJAFlCpm+VvvUI9lkTGapAPtnKhQ5GofbhenQ1CX
	Lk54/RVv0jJ2HEPqo5Vh9Jk0/8YCbrEFNKqi8S4vltLTiYCsLaJF31jLod4hSwqb8Kv6SqMNGeV
	jmq44yo3uUI=
X-Google-Smtp-Source: AGHT+IEVdJBFqh4ZjOUnNvr2cZGagk+FDm7RaDFrW+4PFULQiXAe33zQay9mkvsSK8Mr18aS19JxQQ==
X-Received: by 2002:a5d:6d82:0:b0:385:fb59:8358 with SMTP id ffacd0b85a97d-38a87358c39mr25746447f8f.53.1736950861909;
        Wed, 15 Jan 2025 06:21:01 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74e63fasm24656745e9.36.2025.01.15.06.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:21:01 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2] clk: renesas: r8a08g045: Check the source of the CPU PLL settings
Date: Wed, 15 Jan 2025 16:20:58 +0200
Message-ID: <20250115142059.1833063-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the RZ/G3S SoC, the CPU PLL settings can be set and retrieved through
the CPG_PLL1_CLK1 and CPG_PLL1_CLK2 registers. However, these settings are
applied only when CPG_PLL1_SETTING.SEL_PLL1 is set to 0. Otherwise, the
CPU PLL operates at the default frequency of 1.1 GHz. This patch adds
support to the PLL driver to return the 1.1 GHz frequency when the CPU PLL
is configured with the default frequency.

Fixes: 01eabef547e6 ("clk: renesas: rzg2l: Add support for RZ/G3S PLL")
Fixes: de60a3ebe410 ("clk: renesas: Add minimal boot support for RZ/G3S SoC")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- check the validity of the setting offset in
  rzg3s_cpg_pll_clk_recalc_rate()
- s/settings/setting/g

 drivers/clk/renesas/r9a08g045-cpg.c |  5 +++--
 drivers/clk/renesas/rzg2l-cpg.c     | 13 ++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     | 10 +++++++---
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 0e7e3bf05b52..cb63d397429f 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -51,7 +51,7 @@
 #define G3S_SEL_SDHI2		SEL_PLL_PACK(G3S_CPG_SDHI_DSEL, 8, 2)
 
 /* PLL 1/4/6 configuration registers macro. */
-#define G3S_PLL146_CONF(clk1, clk2)	((clk1) << 22 | (clk2) << 12)
+#define G3S_PLL146_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
 
 #define DEF_G3S_MUX(_name, _id, _conf, _parent_names, _mux_flags, _clk_flags) \
 	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = (_conf), \
@@ -134,7 +134,8 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
-	DEF_G3S_PLL(".pll1", CLK_PLL1, CLK_EXTAL, G3S_PLL146_CONF(0x4, 0x8)),
+	DEF_G3S_PLL(".pll1", CLK_PLL1, CLK_EXTAL, G3S_PLL146_CONF(0x4, 0x8, 0x100),
+		    1100000000UL),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll4", CLK_PLL4, CLK_EXTAL, 100, 3),
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index ddf722ca79eb..4bd8862dc82b 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -51,6 +51,7 @@
 #define RZG3S_DIV_M		GENMASK(25, 22)
 #define RZG3S_DIV_NI		GENMASK(21, 13)
 #define RZG3S_DIV_NF		GENMASK(12, 1)
+#define RZG3S_SEL_PLL		BIT(0)
 
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
@@ -60,6 +61,7 @@
 #define GET_REG_OFFSET(val)		((val >> 20) & 0xfff)
 #define GET_REG_SAMPLL_CLK1(val)	((val >> 22) & 0xfff)
 #define GET_REG_SAMPLL_CLK2(val)	((val >> 12) & 0xfff)
+#define GET_REG_SAMPLL_SETTING(val)	((val) & 0xfff)
 
 #define CPG_WEN_BIT		BIT(16)
 
@@ -943,6 +945,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
 
 struct pll_clk {
 	struct clk_hw hw;
+	unsigned long default_rate;
 	unsigned int conf;
 	unsigned int type;
 	void __iomem *base;
@@ -980,12 +983,19 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct pll_clk *pll_clk = to_pll(hw);
 	struct rzg2l_cpg_priv *priv = pll_clk->priv;
-	u32 nir, nfr, mr, pr, val;
+	u32 nir, nfr, mr, pr, val, setting;
 	u64 rate;
 
 	if (pll_clk->type != CLK_TYPE_G3S_PLL)
 		return parent_rate;
 
+	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
+	if (setting) {
+		val = readl(priv->base + setting);
+		if (val & RZG3S_SEL_PLL)
+			return pll_clk->default_rate;
+	}
+
 	val = readl(priv->base + GET_REG_SAMPLL_CLK1(pll_clk->conf));
 
 	pr = 1 << FIELD_GET(RZG3S_DIV_P, val);
@@ -1038,6 +1048,7 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	pll_clk->base = priv->base;
 	pll_clk->priv = priv;
 	pll_clk->type = core->type;
+	pll_clk->default_rate = core->default_rate;
 
 	ret = devm_clk_hw_register(dev, &pll_clk->hw);
 	if (ret)
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 881a89b5a710..b74c94a16986 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -102,7 +102,10 @@ struct cpg_core_clk {
 	const struct clk_div_table *dtable;
 	const u32 *mtable;
 	const unsigned long invalid_rate;
-	const unsigned long max_rate;
+	union {
+		const unsigned long max_rate;
+		const unsigned long default_rate;
+	};
 	const char * const *parent_names;
 	notifier_fn_t notifier;
 	u32 flag;
@@ -144,8 +147,9 @@ enum clk_types {
 	DEF_TYPE(_name, _id, _type, .parent = _parent)
 #define DEF_SAMPLL(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SAM_PLL, .parent = _parent, .conf = _conf)
-#define DEF_G3S_PLL(_name, _id, _parent, _conf) \
-	DEF_TYPE(_name, _id, CLK_TYPE_G3S_PLL, .parent = _parent, .conf = _conf)
+#define DEF_G3S_PLL(_name, _id, _parent, _conf, _default_rate) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3S_PLL, .parent = _parent, .conf = _conf, \
+		 .default_rate = _default_rate)
 #define DEF_INPUT(_name, _id) \
 	DEF_TYPE(_name, _id, CLK_TYPE_IN)
 #define DEF_FIXED(_name, _id, _parent, _mult, _div) \
-- 
2.43.0


