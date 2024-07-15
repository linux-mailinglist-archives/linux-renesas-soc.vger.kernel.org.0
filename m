Return-Path: <linux-renesas-soc+bounces-7340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E3F931265
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 12:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 391A9284354
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 10:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F3C188CD7;
	Mon, 15 Jul 2024 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eN3E3Fzs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5830318786F;
	Mon, 15 Jul 2024 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721039845; cv=none; b=g5fA8jgFBemlfKoT/hBiGJqN08ZbTiWXbnkHKSLI+WwiJOaeq4aMM9vg4V5tBEaRR3sdH96jLPgEOwi+Q3/l1iH0OASJd2sa6XkeJ4UujDdcL4MmKXe3vRcX/qqm96BB5QDufQ5OO/S8p78jSceWnlfQ2xfbWVBn/bhRjvwzbck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721039845; c=relaxed/simple;
	bh=ky+5tSQQzqFWCNpNAIeY3uIgkubnSnZSYviML9RnqnA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=endHxL5FNrOFjVMoNqUw2nzqvkU57ww5zCbZHPq/YcIpXPp+2f90sYwz6Gp5eUY6QLbs4DjD+mlUky68fQW+UGlqcqPdRG4dOBMeS5WgPTccZjunPRPehic5S1lVLQp6UFUvLfdG61b01TGX5AtRxsI7WzQd3dY4WZVWWYbLFxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eN3E3Fzs; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4266ed6c691so25700935e9.3;
        Mon, 15 Jul 2024 03:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721039842; x=1721644642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/u+ZmERenCTIp/LSR+hNqWpf4RdVSMdEHwyfQffZLs=;
        b=eN3E3FzsKNCtZ77KR9fB2uFT0e2nmkhXGAhTJb2PbyGkVf+rYfOfSM3Cn1oTkXB6Rd
         M0PpwFu435ilChSAGO4jTQZo8z+LTbTxAsY7O74/a900t+fZsc0+4OVcGYV16KOqAaMI
         G80mwqax3BceUQdR4JRUf5XKNMxACXTvsuD6sPGJEn+7EQsxg8r3OM7Imdqc9Xw/rHIK
         BEbbJpFwqih+eV9930De1y0sh0e0VNGobu31PmZKDdklPKaJME4dbZ4nSBIOTnXIW34v
         riPOrzBZTFASeVFPgzU+fHRXpO+264RPkw+1pyG6Xd/DnQ9gB95B8Xo4WHybwti19kNb
         H57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721039842; x=1721644642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/u+ZmERenCTIp/LSR+hNqWpf4RdVSMdEHwyfQffZLs=;
        b=br55lMwx9x87UvYF3c5PNMrH1cRsbDLf19wtRj+xUi2BWgXmUSzfU8Zf09R+hnQ1MW
         VXGzQVZwgt5SIBOIuBdshymrGQ3NrqTFZPvx7RckJfZc3L74CAnEzdNkUpShtGLS/1wB
         xhEyzyjZY2An/vT4tqe/Tc3QFnUq6BqG1DVWAviUrFwkwG9McVDqeKaIY2OWezljj/5v
         Q/Qz+ujPNJtWMQiR7AIOeptjt85CBgF5JXcyHU7X0FIfi12nVBqvQoIMzrpMJhm557dV
         CpqQKYHxyUbvPWxPEIzCZlow8IP5Fkf28nlHaYXhMcWhj5E73TaBTsN1qU5GYuIbeyLn
         OxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzt8diANiUqp9i8iG2AP1V17TycGU58G9jRk/Y9WPd2uBrFG5sNEcf2ohicecCwceVxBQyphz4C6vDBAPebmYkQJxpvL9lrpRlWEtLJjLyhwWlpRD1kqQ4ULYEWFKPLS2c9RMSZ5z2
X-Gm-Message-State: AOJu0YwI/insVVWRcpDF8QrZjrju4+AVA3euJqpHQbDLwOnIbKJneKCK
	DOFM4NkMjoMawHeKltIhH1ICLcx6Dy2RiZk77/PLWk8gqPncBxBQ
X-Google-Smtp-Source: AGHT+IHTjXo/gpdtKts7jxUcKsguUViTpAMtfgYji8DIozC5fNO9hwB8H+nSSuzn8S4bc9WrqUDWYA==
X-Received: by 2002:a05:600c:5112:b0:426:8884:3781 with SMTP id 5b1f17b1804b1-4268884382dmr111345725e9.24.1721039841601;
        Mon, 15 Jul 2024 03:37:21 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb454sm81153855e9.32.2024.07.15.03.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:37:20 -0700 (PDT)
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
Subject: [PATCH v2 2/2] clk: renesas: rzg2l-cpg: Refactor to use priv for clks and base in clock register functions
Date: Mon, 15 Jul 2024 11:35:55 +0100
Message-Id: <20240715103555.507767-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240715103555.507767-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240715103555.507767-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

While at it, drop masking of parent clocks with 0xffff as nothing is ever
stored in the high bits.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Squashed patches (2,3,4)/4 into single patch
- Dropped masking of parent clock with 0xffff
- Dropped creating local variable clks
---
 drivers/clk/renesas/rzg2l-cpg.c | 45 +++++++++++++--------------------
 1 file changed, 17 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 1fe71a18cf86..d6351140f1ab 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -339,8 +339,7 @@ static const struct clk_ops rzg3s_div_clk_ops = {
 };
 
 static struct clk * __init
-rzg3s_cpg_div_clk_register(const struct cpg_core_clk *core, struct clk **clks,
-			   void __iomem *base, struct rzg2l_cpg_priv *priv)
+rzg3s_cpg_div_clk_register(const struct cpg_core_clk *core, struct rzg2l_cpg_priv *priv)
 {
 	struct div_hw_data *div_hw_data;
 	struct clk_init_data init = {};
@@ -351,7 +350,7 @@ rzg3s_cpg_div_clk_register(const struct cpg_core_clk *core, struct clk **clks,
 	u32 max = 0;
 	int ret;
 
-	parent = clks[core->parent & 0xffff];
+	parent = priv->clks[core->parent];
 	if (IS_ERR(parent))
 		return ERR_CAST(parent);
 
@@ -400,16 +399,15 @@ rzg3s_cpg_div_clk_register(const struct cpg_core_clk *core, struct clk **clks,
 
 static struct clk * __init
 rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
-			   struct clk **clks,
-			   void __iomem *base,
 			   struct rzg2l_cpg_priv *priv)
 {
+	void __iomem *base = priv->base;
 	struct device *dev = priv->dev;
 	const struct clk *parent;
 	const char *parent_name;
 	struct clk_hw *clk_hw;
 
-	parent = clks[core->parent & 0xffff];
+	parent = priv->clks[core->parent];
 	if (IS_ERR(parent))
 		return ERR_CAST(parent);
 
@@ -440,7 +438,6 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
 
 static struct clk * __init
 rzg2l_cpg_mux_clk_register(const struct cpg_core_clk *core,
-			   void __iomem *base,
 			   struct rzg2l_cpg_priv *priv)
 {
 	const struct clk_hw *clk_hw;
@@ -448,7 +445,7 @@ rzg2l_cpg_mux_clk_register(const struct cpg_core_clk *core,
 	clk_hw = devm_clk_hw_register_mux(priv->dev, core->name,
 					  core->parent_names, core->num_parents,
 					  core->flag,
-					  base + GET_REG_OFFSET(core->conf),
+					  priv->base + GET_REG_OFFSET(core->conf),
 					  GET_SHIFT(core->conf),
 					  GET_WIDTH(core->conf),
 					  core->mux_flags, &priv->rmw_lock);
@@ -508,7 +505,6 @@ static const struct clk_ops rzg2l_cpg_sd_clk_mux_ops = {
 
 static struct clk * __init
 rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
-			      void __iomem *base,
 			      struct rzg2l_cpg_priv *priv)
 {
 	struct sd_mux_hw_data *sd_mux_hw_data;
@@ -652,7 +648,6 @@ static const struct clk_ops rzg2l_cpg_dsi_div_ops = {
 
 static struct clk * __init
 rzg2l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
-			       struct clk **clks,
 			       struct rzg2l_cpg_priv *priv)
 {
 	struct dsi_div_hw_data *clk_hw_data;
@@ -662,7 +657,7 @@ rzg2l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
 	struct clk_hw *clk_hw;
 	int ret;
 
-	parent = clks[core->parent & 0xffff];
+	parent = priv->clks[core->parent];
 	if (IS_ERR(parent))
 		return ERR_CAST(parent);
 
@@ -900,7 +895,6 @@ static const struct clk_ops rzg2l_cpg_sipll5_ops = {
 
 static struct clk * __init
 rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
-			  struct clk **clks,
 			  struct rzg2l_cpg_priv *priv)
 {
 	const struct clk *parent;
@@ -910,7 +904,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
 	struct clk_hw *clk_hw;
 	int ret;
 
-	parent = clks[core->parent & 0xffff];
+	parent = priv->clks[core->parent];
 	if (IS_ERR(parent))
 		return ERR_CAST(parent);
 
@@ -1013,8 +1007,6 @@ static const struct clk_ops rzg3s_cpg_pll_ops = {
 
 static struct clk * __init
 rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
-			   struct clk **clks,
-			   void __iomem *base,
 			   struct rzg2l_cpg_priv *priv,
 			   const struct clk_ops *ops)
 {
@@ -1025,7 +1017,7 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	struct pll_clk *pll_clk;
 	int ret;
 
-	parent = clks[core->parent & 0xffff];
+	parent = priv->clks[core->parent];
 	if (IS_ERR(parent))
 		return ERR_CAST(parent);
 
@@ -1042,7 +1034,7 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 
 	pll_clk->hw.init = &init;
 	pll_clk->conf = core->conf;
-	pll_clk->base = base;
+	pll_clk->base = priv->base;
 	pll_clk->priv = priv;
 	pll_clk->type = core->type;
 
@@ -1140,34 +1132,31 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 			clk = clk_hw->clk;
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
-		clk = rzg3s_cpg_div_clk_register(core, priv->clks, priv->base, priv);
+		clk = rzg3s_cpg_div_clk_register(core, priv);
 		break;
 	case CLK_TYPE_MUX:
-		clk = rzg2l_cpg_mux_clk_register(core, priv->base, priv);
+		clk = rzg2l_cpg_mux_clk_register(core, priv);
 		break;
 	case CLK_TYPE_SD_MUX:
-		clk = rzg2l_cpg_sd_mux_clk_register(core, priv->base, priv);
+		clk = rzg2l_cpg_sd_mux_clk_register(core, priv);
 		break;
 	case CLK_TYPE_PLL5_4_MUX:
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


