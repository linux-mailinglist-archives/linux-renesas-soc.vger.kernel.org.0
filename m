Return-Path: <linux-renesas-soc+bounces-14186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4B5A5886C
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 22:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23753188C088
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 21:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7776F21E086;
	Sun,  9 Mar 2025 21:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYUG4Y4g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D282144AE;
	Sun,  9 Mar 2025 21:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741554867; cv=none; b=rx1dL9A2L5EreVOdlkZGHNMXXZa6Su/kRbbDS4I9BD0+mv8vEf8MFlIikLE+LhL0niUwte7uSlQfQXkMo+1MEMKieA/sDT/leUozfE055qjJ5Xq1Pxp6K/n+KJqQ+t1VC9O2KQzmvN3ItMN8b4GRFuEFdWU8dYl+Q8s6oNwaCLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741554867; c=relaxed/simple;
	bh=q3nuNRZKAWImELCntNh9m9fvTH3snOLd+bvPr457zWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWu1rQ4H7ySe4YXcyPZa1yP+ThsxyHlttVs04JS2LGzy27HehMrQshJK0FQRBcDKLXSiJpPEdDA03Yh9lHxQaPpIh5+sVDx3LCb1yegMs+DpyuhlqA6MKE7ejm6GhaaBzXzzF9oqTNkQ70PcxDTZPJ8GbMiYYUGIQE2vp7tARO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYUG4Y4g; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so30193645e9.1;
        Sun, 09 Mar 2025 14:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741554864; x=1742159664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXKHJBpWRSe9XkFdvaV0KeS04LB7f34Ir4er9ZP0uBM=;
        b=dYUG4Y4gkBMwAWLkrbgXOQvvQKp4hc6HMJ9a9rbEvsmbOAlAph3cqr8oY/yRPhUEPt
         WCTTBX8AuAOgRgF3NLcVv2HbwnqGkFZF0Y0KbECZghehILXEnq5Lk6Mx3juKnuzmJjJb
         +wC2ou+YNGKi/W3szhxYNJ9+HJJ61TRB46HA11zyDPT8gxErnggPpTqdR7P7sMVz/ZsB
         GBrDWYJtl2fEgzbni+sbU6s6t0uqF1MyKAJ1MdR1qqu07QhfyE6+Az88CUkGl7jS6t/C
         RU2tap75fvgOc/8h8s5k8M6IkNM3WfhY26fLbeL8Yyguw3u5BO+99iFfPj/tidO60wTZ
         UAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741554864; x=1742159664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXKHJBpWRSe9XkFdvaV0KeS04LB7f34Ir4er9ZP0uBM=;
        b=b6PY6+E645IjsPnpPaFHZb9qemMFuh0/PyMErlt9VDUFlJHtGf0qX/aQh3UHZFx3Mu
         +fJ9jaURFVAcRDa8Z2h+Ar41w1fodMQXILkqlykkguFRJ3FumXEG6Z5cyhqlltfzP4fD
         VgrRYnIVaG0GaRouaC6WJssSeTRmPBDOCKjOdG8sf9QOD8oxJWYF032tjtQVxFI/iqhs
         oCii9QA7L8U/4ONBsKcF6YxBwFGAxsRWkDmPrxmnwa5ImKKYrwjh57LDYJXhZVbsp7Zm
         T4DkHTLNgfe+8BinyoB/GLI6G15ib1S9A8qwwhvNYBVrtaM/Fylrye4HBKe/XJPWmiku
         aeEA==
X-Forwarded-Encrypted: i=1; AJvYcCVSZm5e38U+G8xWNcljTX6jDtSEmW6h+xmJ5lA75quETOJJELh5UVGP92RaLb6SCL7da0sNw3dkh0zbhEvhY0W7VKw=@vger.kernel.org, AJvYcCVpNecGFqcKRJZJKjjhAocqhPXl1qwkecRc3yuVOxd22Jd1hWe2i68Jq1Ayam9APL/9wSwR7Cf503dogBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOho3VyWxWBSJHFTFWxstOqWRgQ2pJqVOeQsmOwvtvT58ErH2
	fvOC2YxgrvsqPf2qqEInds0GbqhECd45Kgo8ZYXveEKzsmNAflin
X-Gm-Gg: ASbGnct/LnprpdfajuQro/2x7i+5gLijcD0MVDyN/bIM0MXZZGMo6pb3uVo6GnOi3sj
	6eKEs9Z11ReL9b+CVNRHklUXHAJouBWxTN8Zw5sWPimtdd7IJA95OKAYkl8yn84jEx4JvjInSsU
	1bHnUx4KBct7JihnjnLKZcUhlbNxnLKmtJLBKuTMSjFZuiy28xgD30+eRTQkGU893H0s/KXfq+m
	2bhKYAfPQW8WiP4DdUSACPrfKCJI/lYswCGiI983isQ21fWZtJ3QEICoA+TtKF9i8YptjMpjnpH
	zNYmFe9m/EIskqa30U3mmrmAH254BltoO6G6Fbv4lVxMCjNyYKtdZ4aw4O4yyS0SqAQ2xL8n4g=
	=
X-Google-Smtp-Source: AGHT+IF3BRuFf5oUet1l+Hq4UXH40CIdvVq4cyvs4dimwu7l+UgqhTJ6Zv6fl1Wy6KrhrH4a+fMaIA==
X-Received: by 2002:a05:600c:1d08:b0:43c:f184:2e16 with SMTP id 5b1f17b1804b1-43cf184310dmr19365635e9.5.1741554863575;
        Sun, 09 Mar 2025 14:14:23 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:e951:ba7a:6a53:bac5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce70d13b4sm64443845e9.38.2025.03.09.14.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 14:14:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/5] clk: renesas: rzv2h: Refactor PLL configuration handling
Date: Sun,  9 Mar 2025 21:13:58 +0000
Message-ID: <20250309211402.80886-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor PLL handling by introducing a `struct pll` to encapsulate PLL
configuration parameters, ensuring consistency with the existing dynamic
divider structure.

Introduce the `PLL_PACK()` macro to simplify PLL structure initialization
and update the `DEF_PLL()` macro to use the new `pll` structure. Modify
relevant clock register functions to utilize the structured PLL data
instead of raw configuration values.

This refactoring improves code readability, maintainability, and
alignment with the existing clock configuration approach.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- New patch
---
 drivers/clk/renesas/r9a09g047-cpg.c |  2 +-
 drivers/clk/renesas/r9a09g057-cpg.c |  2 +-
 drivers/clk/renesas/rzv2h-cpg.c     | 13 ++++++++-----
 drivers/clk/renesas/rzv2h-cpg.h     | 30 +++++++++++++++++++++--------
 4 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index e9cf4342d0cf..7b9311af603e 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -79,7 +79,7 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
 	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
-	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
+	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 
 	/* Internal Core Clocks */
diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index d63eafbca780..031f332893a1 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -85,7 +85,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
 	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
-	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
+	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 
 	/* Internal Core Clocks */
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 2b9771ab2b3f..d115a810a46b 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -44,9 +44,11 @@
 #define CPG_BUS_1_MSTOP		(0xd00)
 #define CPG_BUS_MSTOP(m)	(CPG_BUS_1_MSTOP + ((m) - 1) * 4)
 
+#define CPG_PLL_CLK1(x)		((x) + 0x004)
 #define KDIV(val)		((s16)FIELD_GET(GENMASK(31, 16), (val)))
 #define MDIV(val)		FIELD_GET(GENMASK(15, 6), (val))
 #define PDIV(val)		FIELD_GET(GENMASK(5, 0), (val))
+#define CPG_PLL_CLK2(x)		((x) + 0x008)
 #define SDIV(val)		FIELD_GET(GENMASK(2, 0), (val))
 
 #define DDIV_DIVCTL_WEN(shift)		BIT((shift) + 16)
@@ -94,7 +96,7 @@ struct pll_clk {
 	struct rzv2h_cpg_priv *priv;
 	void __iomem *base;
 	struct clk_hw hw;
-	unsigned int conf;
+	struct pll pll;
 	unsigned int type;
 };
 
@@ -145,14 +147,15 @@ static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct pll_clk *pll_clk = to_pll(hw);
 	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+	struct pll pll = pll_clk->pll;
 	unsigned int clk1, clk2;
 	u64 rate;
 
-	if (!PLL_CLK_ACCESS(pll_clk->conf))
+	if (!pll.clk)
 		return 0;
 
-	clk1 = readl(priv->base + PLL_CLK1_OFFSET(pll_clk->conf));
-	clk2 = readl(priv->base + PLL_CLK2_OFFSET(pll_clk->conf));
+	clk1 = readl(priv->base + CPG_PLL_CLK1(pll.offset));
+	clk2 = readl(priv->base + CPG_PLL_CLK2(pll.offset));
 
 	rate = mul_u64_u32_shr(parent_rate, (MDIV(clk1) << 16) + KDIV(clk1),
 			       16 + SDIV(clk2));
@@ -193,7 +196,7 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	init.num_parents = 1;
 
 	pll_clk->hw.init = &init;
-	pll_clk->conf = core->cfg.conf;
+	pll_clk->pll = core->cfg.pll;
 	pll_clk->base = base;
 	pll_clk->priv = priv;
 	pll_clk->type = core->type;
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 576a070763cb..0a99a85433bd 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -10,6 +10,25 @@
 
 #include <linux/bitfield.h>
 
+/**
+ * struct pll - Structure for PLL configuration
+ *
+ * @offset: STBY register offset
+ * @clk: Flag to indicate if CLK1/2 are accessible or not
+ */
+struct pll {
+	unsigned int offset:9;
+	unsigned int clk:1;
+};
+
+#define PLL_PACK(_offset, _clk) \
+	((struct pll){ \
+		.offset = _offset, \
+		.clk = _clk \
+	})
+
+#define PLLCA55		PLL_PACK(0x60, 1)
+
 /**
  * struct ddiv - Structure for dynamic switching divider
  *
@@ -74,6 +93,7 @@ struct cpg_core_clk {
 	union {
 		unsigned int conf;
 		struct ddiv ddiv;
+		struct pll pll;
 	} cfg;
 	const struct clk_div_table *dtable;
 	u32 flag;
@@ -87,18 +107,12 @@ enum clk_types {
 	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
 };
 
-/* BIT(31) indicates if CLK1/2 are accessible or not */
-#define PLL_CONF(n)		(BIT(31) | ((n) & ~GENMASK(31, 16)))
-#define PLL_CLK_ACCESS(n)	((n) & BIT(31) ? 1 : 0)
-#define PLL_CLK1_OFFSET(n)	((n) & ~GENMASK(31, 16))
-#define PLL_CLK2_OFFSET(n)	(((n) & ~GENMASK(31, 16)) + (0x4))
-
 #define DEF_TYPE(_name, _id, _type...) \
 	{ .name = _name, .id = _id, .type = _type }
 #define DEF_BASE(_name, _id, _type, _parent...) \
 	DEF_TYPE(_name, _id, _type, .parent = _parent)
-#define DEF_PLL(_name, _id, _parent, _conf) \
-	DEF_TYPE(_name, _id, CLK_TYPE_PLL, .parent = _parent, .cfg.conf = _conf)
+#define DEF_PLL(_name, _id, _parent, _pll_packed) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLL, .parent = _parent, .cfg.pll = _pll_packed)
 #define DEF_INPUT(_name, _id) \
 	DEF_TYPE(_name, _id, CLK_TYPE_IN)
 #define DEF_FIXED(_name, _id, _parent, _mult, _div) \
-- 
2.43.0


