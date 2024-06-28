Return-Path: <linux-renesas-soc+bounces-6890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F7591BF53
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 15:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65FCB1C20959
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 13:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F0A1BF32B;
	Fri, 28 Jun 2024 13:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeNDGi82"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DB31BF301;
	Fri, 28 Jun 2024 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719580272; cv=none; b=BrOvpTJSIN3iup6TIz48oiMOVWak6U1e01+tNcm/YlKY6a+w75Pg4YFtcWiu5E5YLPgBIMSd+WxBGTh19EkskyAwUKsIB4JgxZW4d/Gg/baNxK+p0BUbcXF9GhtLf1n6pmDx9SfWZK7lzcyYUCuUekYhfJYwXr4YW9oN14sf3T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719580272; c=relaxed/simple;
	bh=Iy4lVS+XinkulkfhkDEkz58JE0QmHQASnzw/PsYpTEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SbIPt5cYlcqvbZqBm7//Gg5rQOFa0X3gqXfz4k37f3/U5xFavWEY0ygqzptRUaQQAaj0crj3FHnn40gjWDrU3blDy4P2mbKA28W6HEnJDcySv94a6DGBqG33KNr6LWs0ipwxSSvl+z5djVIZR2+LEj50a0LgBYOOeaj643bDe1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeNDGi82; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42565697036so10627335e9.1;
        Fri, 28 Jun 2024 06:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719580269; x=1720185069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raokwMIVVU25776pO8kkmuMQ/NGZYJ6MwDxiM/GSAiw=;
        b=IeNDGi82KElqUiM+uK3qZibtdNLM6I1BiNh/HoR2JJf7uDfK6oV2b8nsfFQCYBP8gi
         tU8M1gS6WIprUSt3quvg6GuA2hcaaZtBkp/8SjEUIL1nte1m2Yotz3CD+4dU6aqXi81k
         8Z5+x4DTjGi37wwBcSDIXwLoWKA2opjn69/p58xZg/ugs5TwO3z+lQd7aREGqo+z+BPY
         wv0ixI1u2pHTCkJ0n89kLoqzHD6wksjtsS6eGAlwkwO214wdjNDdIAvHpILocoGUcEFq
         6LYPA/MENz14wUKTXYnRhE/yTOnOatuGdGtrob+ABO+EdWdjrul9WX5MWWMJp8rKdXA0
         PJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719580269; x=1720185069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=raokwMIVVU25776pO8kkmuMQ/NGZYJ6MwDxiM/GSAiw=;
        b=VWzHKBZgeuHOy903dBR3kcwDRtahdDIv9ld81MMz0p0TAfZbB4GwKDz0YzYaQzdld3
         +BXAG9H+qR4dmfnRjsNY827++km5AUD25HhnWGr2lJV6EzFEk4S5EYC8iYsFHNEOR2Hj
         XpW2q4njadJuR1xYzmyIGlJzQXhk4GFGqY8pSP9zWNQmpzfO2B+SC9X4Pga36iMKHIp5
         p3qt8XWtvor8iI9x24c59VsPIfxvt4nmo9EdiSGEs4greJ/VCHCXbWCqbuKWqOPq3kBL
         1IgxAk72qQyqWfrjNYzg5m7ia/pcq62JK+b5kyx/+asKJ34EzrF5qqtHlRB9MZqmdHwF
         s4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWmMXz6FjaqPfTyI9qOSDObYoPVQZxcwcA8Cwn/wQFiBbvn9UzUb5rewUvg5/S+dAvgCIj4Jhltv5sutaxqW9Ph+9qvlW5m2M8ciKZ7NvOae4mWgkBCS8fE2z3N2XGvIgCcYX4xQbdiXX07PJg=
X-Gm-Message-State: AOJu0Yyx9WIV5kJh8dAN2xbBxOAwU5B0SZjKVlz1Ayiuw447Y8IicHmS
	mROImL3CdhPoJez0Ef4v7Sw/Aig7mVd+DrxNoqz2tpYBhTQjDCni
X-Google-Smtp-Source: AGHT+IEQaIuVZKSUAD417Em/IG6HwsnyfoJV3LTJa6Sqrhfe+8WNw6/kN/oeveM3+00MdfDBpBkpVA==
X-Received: by 2002:a05:6000:1846:b0:365:aec0:e191 with SMTP id ffacd0b85a97d-36760a7c1demr2051339f8f.21.1719580269187;
        Fri, 28 Jun 2024 06:11:09 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af557fesm35298865e9.11.2024.06.28.06.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 06:11:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] clk: renesas: rzg2l-cpg: Refactor to use priv for clks and base in clock register functions
Date: Fri, 28 Jun 2024 14:10:21 +0100
Message-Id: <20240628131021.177866-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplify the `rzg2l-cpg` driver by removing explicit passing of `clks` and
`base` parameters in various clock registration functions. These values
are now accessed directly from the `priv` structure.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index d72d95e0a7ca..37c986ecdcbc 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -400,10 +400,10 @@ rzg3s_cpg_div_clk_register(const struct cpg_core_clk *core, struct rzg2l_cpg_pri
 
 static struct clk * __init
 rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
-			   struct clk **clks,
-			   void __iomem *base,
 			   struct rzg2l_cpg_priv *priv)
 {
+	void __iomem *base = priv->base;
+	struct clk **clks = priv->clks;
 	struct device *dev = priv->dev;
 	const struct clk *parent;
 	const char *parent_name;
@@ -440,7 +440,6 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
 
 static struct clk * __init
 rzg2l_cpg_mux_clk_register(const struct cpg_core_clk *core,
-			   void __iomem *base,
 			   struct rzg2l_cpg_priv *priv)
 {
 	const struct clk_hw *clk_hw;
@@ -448,7 +447,7 @@ rzg2l_cpg_mux_clk_register(const struct cpg_core_clk *core,
 	clk_hw = devm_clk_hw_register_mux(priv->dev, core->name,
 					  core->parent_names, core->num_parents,
 					  core->flag,
-					  base + GET_REG_OFFSET(core->conf),
+					  priv->base + GET_REG_OFFSET(core->conf),
 					  GET_SHIFT(core->conf),
 					  GET_WIDTH(core->conf),
 					  core->mux_flags, &priv->rmw_lock);
@@ -651,10 +650,10 @@ static const struct clk_ops rzg2l_cpg_dsi_div_ops = {
 
 static struct clk * __init
 rzg2l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
-			       struct clk **clks,
 			       struct rzg2l_cpg_priv *priv)
 {
 	struct dsi_div_hw_data *clk_hw_data;
+	struct clk **clks = priv->clks;
 	const struct clk *parent;
 	const char *parent_name;
 	struct clk_init_data init;
@@ -899,9 +898,9 @@ static const struct clk_ops rzg2l_cpg_sipll5_ops = {
 
 static struct clk * __init
 rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
-			  struct clk **clks,
 			  struct rzg2l_cpg_priv *priv)
 {
+	struct clk **clks = priv->clks;
 	const struct clk *parent;
 	struct clk_init_data init;
 	const char *parent_name;
@@ -1012,11 +1011,10 @@ static const struct clk_ops rzg3s_cpg_pll_ops = {
 
 static struct clk * __init
 rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
-			   struct clk **clks,
-			   void __iomem *base,
 			   struct rzg2l_cpg_priv *priv,
 			   const struct clk_ops *ops)
 {
+	struct clk **clks = priv->clks;
 	struct device *dev = priv->dev;
 	const struct clk *parent;
 	struct clk_init_data init;
@@ -1041,7 +1039,7 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 
 	pll_clk->hw.init = &init;
 	pll_clk->conf = core->conf;
-	pll_clk->base = base;
+	pll_clk->base = priv->base;
 	pll_clk->priv = priv;
 	pll_clk->type = core->type;
 
@@ -1133,25 +1131,22 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 						core->mult, div);
 		break;
 	case CLK_TYPE_SAM_PLL:
-		clk = rzg2l_cpg_pll_clk_register(core, priv->clks, priv->base, priv,
-						 &rzg2l_cpg_pll_ops);
+		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg2l_cpg_pll_ops);
 		break;
 	case CLK_TYPE_G3S_PLL:
-		clk = rzg2l_cpg_pll_clk_register(core, priv->clks, priv->base, priv,
-						 &rzg3s_cpg_pll_ops);
+		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3s_cpg_pll_ops);
 		break;
 	case CLK_TYPE_SIPLL5:
-		clk = rzg2l_cpg_sipll5_register(core, priv->clks, priv);
+		clk = rzg2l_cpg_sipll5_register(core, priv);
 		break;
 	case CLK_TYPE_DIV:
-		clk = rzg2l_cpg_div_clk_register(core, priv->clks,
-						 priv->base, priv);
+		clk = rzg2l_cpg_div_clk_register(core, priv);
 		break;
 	case CLK_TYPE_G3S_DIV:
 		clk = rzg3s_cpg_div_clk_register(core, priv);
 		break;
 	case CLK_TYPE_MUX:
-		clk = rzg2l_cpg_mux_clk_register(core, priv->base, priv);
+		clk = rzg2l_cpg_mux_clk_register(core, priv);
 		break;
 	case CLK_TYPE_SD_MUX:
 		clk = rzg2l_cpg_sd_mux_clk_register(core, priv);
@@ -1160,7 +1155,7 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 		clk = rzg2l_cpg_pll5_4_mux_clk_register(core, priv);
 		break;
 	case CLK_TYPE_DSI_DIV:
-		clk = rzg2l_cpg_dsi_div_clk_register(core, priv->clks, priv);
+		clk = rzg2l_cpg_dsi_div_clk_register(core, priv);
 		break;
 	default:
 		goto fail;
-- 
2.34.1


