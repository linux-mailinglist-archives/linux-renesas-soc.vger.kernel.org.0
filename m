Return-Path: <linux-renesas-soc+bounces-20516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8893B265D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 14:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E6063B4EE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 12:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DC62FC89A;
	Thu, 14 Aug 2025 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1gGtDS1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8803E571;
	Thu, 14 Aug 2025 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175719; cv=none; b=Xt2WB9dGlGSMrBZu42k296YUKtn7wocHujNMpWDWdpNtJYFZTR849wT1qVOH5BJKQXoLCmJGmluvoawlwRuCjk7CcBbHUM4ZgxqwD/ou5iYWs+6Ufet+960GbUKjB7TYPH14/E0FLeXr+GN9EBhHkcfkko32r82gewp6EdmgBAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175719; c=relaxed/simple;
	bh=yyoBq0vSGg6GN2oDroTDJPnxlIIvPfJII0LNlewBpRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8YPWktR0YlOJLFrL+qeO/DscTxXo2qRalgSBrnryWtzVEU95lcLl1p3k6dRhnaKsVYPOWqLR7oenVj1JCNVjICyRuKyFSBoD5Fci+5rkKggKtoCidspGiUOmGYOGHjg23MDdsxP5acmQxnrCZ562yhEbTyD2J76UGvX5FETIYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1gGtDS1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e411c820so479264f8f.1;
        Thu, 14 Aug 2025 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755175716; x=1755780516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvVO4sN6LrkoM7IBqRLaNnb4ceub6PaYAkxvR+ucA6s=;
        b=R1gGtDS11l71f17/l9jxdxTJBXOwEUFQZSmQaIOAv0EUiKhPhdpvOssr38zri82Kck
         pnf3KvMfd+iYZu+K9P1XspHkhxF+fxZmBtE0PbcuwQ27RxwV4R/N0fjx68XUp2x3VSm+
         fCM9+Eol3VJcH2Y5R+n5RaljKsfQ2t1Bim7oiCdFCmonNm1mdH5gZeK1JGjP9gbI9CV+
         8j6RF2xg3kZr3LDymCXatXCdJHzaAl/Pe+gYTP9MU/BQd+W3XmXYA59fx1lcS2Bg+266
         XJ1cS6Tecq4CqUztZDwUhed7fhaypI0fbVRlR/iLC4TzNhKrDJRqAIksA0C4FE/dYgX9
         BY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755175716; x=1755780516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvVO4sN6LrkoM7IBqRLaNnb4ceub6PaYAkxvR+ucA6s=;
        b=XbznoiNwwaFBPzEveP2nzCZQjpgX0NX+Iai0KDtg+Vf5umbwCZkg1mfVlmRbCieFdv
         Hb96pZhSpO2oU37S1+OWMjBh9tkdneUe6MFSazs0qq8rSwT7N4z7jmImho2ex/eOsGmW
         N5TYDcHZvl7lYzqoyWMFdUXqzUsYQ27aOujvYCE2px0xoRUXFmI3Cc2OokTgjLcaiGBQ
         E/DzlkERnxTsgMe6sf6MxZizkE6Eltj79aDqr6fgR96CeePEXO0dkZYlb+cc9vq3pj6S
         qYLshWIBPcjVAAhqwq/LJXIH9SpdzihFl3omCgq+vYqhGl4KOCwZYnSF5jXhbJIUwsLe
         xY7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUB+vq1RKWE7tTq6/kjEu/3xF+ifZAG9Ao0BV8so0X34RsCTP56oKdpTrAeLPqW9FKI3szPo5EkD6HsLpQ9@vger.kernel.org, AJvYcCWylODzqNSBK9PHAbGzhwYlM7sOKlGvFGkFKiADz5ET6EhWidOSXDtgp3PRiQgtBVTM+FLpRujj9OCbfm441FcZkBg=@vger.kernel.org, AJvYcCXSLvWrmYRBbMqc9zqt9kV30cwZdKQbR0J9EpHkfMZmG5RR3nf51foNQ1SfIS52bQhyGyfRIiMY0BI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/iCdli+Zq9n1oRwBJZ+fOvvexh2cq6OoSk2LGZ2qNLvL0QPld
	Us21ANFGjWG1JF77jb2d5L+m6NqsJuzhtnQQ2ke8vduPNxX88lra5nk0
X-Gm-Gg: ASbGncvm5VEb9NyH5daLzp7HXV6fesAz9xR4Yoz6zpdG1Y14G7tGQ6WktNWpiLoxMmd
	VyUI3mHcsWGwtAq690I27yaBzgBbYx9tG5exxlVJ9+UrQTcwLAHxaS5VbjXvX2hai4UWfk5N4jG
	n6dyE3u2eb5IEJqGwJBLASXcm1zoJqmyTIN4nXh+Urj2hV9AqhaTTo7nG/EngjuDl84POd293xG
	x9eJeQcMiMZ1MQ+QnyvK3Zm1n5FZaU0A5LIEzJ7ajiLRALhvWjYLw3L5iJP/WnfZgcQg9PCTV6V
	bpXZLPps4kfrGrL8/KwTG6g274Dqrv0J0h3vCag7Gq3oCK8RGWH8dtdpG0XLsLUsZZ3U29VktCE
	3lNnuDSoKhdDJPNXU7AGZcZTjqUpl2wvIOG70KLbE6eDW0sDIdB00hNqhGxr0Ka9seGaWcRsWfQ
	==
X-Google-Smtp-Source: AGHT+IGnfRuBiXHcNasBj8V0kjZYUwzz0tQhDh0lj/QNysPwmE+TAvc6EqfROPfbdsvVbIBwK2j/BA==
X-Received: by 2002:a05:6000:290c:b0:3a5:8cdd:c174 with SMTP id ffacd0b85a97d-3ba50cfe90fmr2262056f8f.26.1755175715757;
        Thu, 14 Aug 2025 05:48:35 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c466838sm53497380f8f.49.2025.08.14.05.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 05:48:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/4] clk: renesas: rzv2h: Refactor rzv2h_cpg_fixed_mod_status_clk_register()
Date: Thu, 14 Aug 2025 13:48:24 +0100
Message-ID: <20250814124832.76266-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
References: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Refactor rzv2h_cpg_fixed_mod_status_clk_register() for code reuse
when adding support for module clock as parent later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 63 +++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index f468afbb54e2..8511b7154e90 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -451,34 +451,35 @@ rzv2h_clk_ff_mod_status_is_enabled(struct clk_hw *hw)
 }
 
 static struct clk * __init
-rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
-					struct rzv2h_cpg_priv *priv)
+rzv2h_cpg_mod_status_clk_register(struct rzv2h_cpg_priv *priv, const char *name,
+				  const char *parent_clk_name, u16 mult,
+				  u16 div, struct fixed_mod_conf conf)
 {
 	struct rzv2h_ff_mod_status_clk *clk_hw_data;
 	struct clk_init_data init = { };
 	struct clk_fixed_factor *fix;
-	const struct clk *parent;
 	const char *parent_name;
 	int ret;
 
-	WARN_DEBUG(core->parent >= priv->num_core_clks);
-	parent = priv->clks[core->parent];
-	if (IS_ERR(parent))
-		return ERR_CAST(parent);
-
-	parent_name = __clk_get_name(parent);
-	parent = priv->clks[core->parent];
-	if (IS_ERR(parent))
-		return ERR_CAST(parent);
+	if (!priv->ff_mod_status_ops) {
+		priv->ff_mod_status_ops =
+			devm_kzalloc(priv->dev, sizeof(*priv->ff_mod_status_ops), GFP_KERNEL);
+		if (!priv->ff_mod_status_ops)
+			return ERR_PTR(-ENOMEM);
+		memcpy(priv->ff_mod_status_ops, &clk_fixed_factor_ops,
+		       sizeof(const struct clk_ops));
+		priv->ff_mod_status_ops->is_enabled = rzv2h_clk_ff_mod_status_is_enabled;
+	}
 
 	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
 	if (!clk_hw_data)
 		return ERR_PTR(-ENOMEM);
 
 	clk_hw_data->priv = priv;
-	clk_hw_data->conf = core->cfg.fixed_mod;
+	clk_hw_data->conf = conf;
+	parent_name = parent_clk_name;
 
-	init.name = core->name;
+	init.name = name;
 	init.ops = priv->ff_mod_status_ops;
 	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = &parent_name;
@@ -486,8 +487,8 @@ rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
 
 	fix = &clk_hw_data->fix;
 	fix->hw.init = &init;
-	fix->mult = core->mult;
-	fix->div = core->div;
+	fix->mult = mult;
+	fix->div = div;
 
 	ret = devm_clk_hw_register(priv->dev, &clk_hw_data->fix.hw);
 	if (ret)
@@ -496,6 +497,25 @@ rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
 	return clk_hw_data->fix.hw.clk;
 }
 
+static struct clk * __init
+rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
+					struct rzv2h_cpg_priv *priv)
+{
+	const struct clk *parent;
+	const char *parent_name;
+
+	WARN_DEBUG(core->parent >= priv->num_core_clks);
+	parent = priv->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	parent_name = __clk_get_name(parent);
+
+	return rzv2h_cpg_mod_status_clk_register(priv, core->name, parent_name,
+						 core->mult, core->div,
+						 core->cfg.fixed_mod);
+}
+
 static struct clk
 *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
 			       void *data)
@@ -575,17 +595,6 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 			clk = clk_hw->clk;
 		break;
 	case CLK_TYPE_FF_MOD_STATUS:
-		if (!priv->ff_mod_status_ops) {
-			priv->ff_mod_status_ops =
-				devm_kzalloc(dev, sizeof(*priv->ff_mod_status_ops), GFP_KERNEL);
-			if (!priv->ff_mod_status_ops) {
-				clk = ERR_PTR(-ENOMEM);
-				goto fail;
-			}
-			memcpy(priv->ff_mod_status_ops, &clk_fixed_factor_ops,
-			       sizeof(const struct clk_ops));
-			priv->ff_mod_status_ops->is_enabled = rzv2h_clk_ff_mod_status_is_enabled;
-		}
 		clk = rzv2h_cpg_fixed_mod_status_clk_register(core, priv);
 		break;
 	case CLK_TYPE_PLL:
-- 
2.43.0


