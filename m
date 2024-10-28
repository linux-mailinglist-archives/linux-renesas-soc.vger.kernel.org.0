Return-Path: <linux-renesas-soc+bounces-10184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 680229B3CAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 22:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27F792834B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 21:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DBC1E501B;
	Mon, 28 Oct 2024 21:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLAx7IO7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC701E22E6;
	Mon, 28 Oct 2024 21:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150964; cv=none; b=JXV05GCaoi5882bgTr80t7XbbyP4AyTmFU+5m6EuzSLXZw4s5MmGHDP+JLi4f9zF139qiVfSeXWWWxUX62DZ1D8AcERcBQzTpbtek/Lf428+kt6UicU67/2GT812J2/7vIkj787DsFP0adwuLQ8ntUOJCtZMhrisLigkGrtGZeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150964; c=relaxed/simple;
	bh=VH3vI3IwjLjz1C1omzwi4Zy0AkY+KE00eT2lWWe43xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MnQM7tAxX6n43nnVubwUttc9gLZWaxt2Uszh+JWSK6NyNsIeF3bbvuftnPirV1881Dac+swmOLC3sfhkBR6LuXfL7uuDMoXSGK2AKiGNZjYBBqYLd2j7V+ELYpCJYkGeWdFGtdQR6hIkt+5Oz6Kfq8yrU954v/Yg4WvBPILmJVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLAx7IO7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso63742875e9.0;
        Mon, 28 Oct 2024 14:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730150961; x=1730755761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSqXFMkGZ4Ay2uI5kOzeW9pStlf/rRAFH1yX0jcZUak=;
        b=gLAx7IO7yV/iUoEs1Bs0WU+ep2AmO10Nw5DIZNpLEoAd5wVnb/PWIArItIFGeSzM6G
         GxihD2f/7OeGkpYjUftlErz0sXVDuWbeIBn6G7aGDrYnnxT3TnWYC+Q2kwAJiaMmIcVF
         SiFDztkKtmAGvO4wOWAwNJ3aJygC63I1BqbPGOeT31w7Bpgsw05JcIXTCnazyeQSQns6
         Rzkare4spw8xj4A4aEzatntBin+9G8GFSNsaFeEK12Mvs+FjUfL/DSowSbBvFuhZefcb
         WPzNCaxf+/aMPX/c76YeUpeOlVXTjv3/YvSQ/ebUZnwy29tDqY72yAAdSLnvT6so3Kyk
         aomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150961; x=1730755761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSqXFMkGZ4Ay2uI5kOzeW9pStlf/rRAFH1yX0jcZUak=;
        b=dFV/Yx+y29aUVYfiQMCcQAum9pUGcZIq7nV9qPurtVLxvqGv8ZWuKE0nE9306kHAj0
         cnS9PEDWgvhXbOnQAQODh6oonp06qurNaOlDtIhpSf/sbw+AmC7lSVc3V4cdYor0e2Gl
         wU8ptHvmVLbOsGHMe6ob5UW+CxvbOTeI/OWFfCHSr1pAbcAxyJdvOgm33mhSv9p5s8ne
         oTJli+J7bj3mQFtE3hqdsV3siYExHAqu4OtxdcQelS0h2e3xstAcYsFF37tOehMDYxRn
         F79RL8x0oAwDlzBjyN2u+UMy+lpSMNevnqakew1vh6HmY9e+o3y8umzNsAsPIHSXUl8Q
         3iHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqlVzBGTC+2s5eD1kuZ1ly7vEQHGrDL0WOrhe9afQHXnUW0f+K8LomHHgq9V80u0fJ4J5ACSxE2Sfg2Py4@vger.kernel.org, AJvYcCUvF+mWCaslzAAefZ8VJapre2PafjBkaGMutFtCxFV5m3tSQdlCa3uBieOtNL75232WDHez664hvGI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ptOFDNaPTXyLTfwmJeDz3FNNTFdkuNKaC5PIv9dFAniXT0WE
	+xGmIrykOvOKVDgoLb/t9Hx+6zQOPpU9Z2TO6llL4E6vrbnaHtCA
X-Google-Smtp-Source: AGHT+IG28IZNLp6B9fgW9E3dXNg2lpwf0fiOT4v4aCNstcCqEywdHvhxrcxFpJBh7GJlCl/7oDzcMA==
X-Received: by 2002:a05:600c:1d1d:b0:431:6083:cd30 with SMTP id 5b1f17b1804b1-4319ac6f85emr86448305e9.6.1730150960584;
        Mon, 28 Oct 2024 14:29:20 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:495c:4d71:e99d:a7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935a3edasm124360725e9.22.2024.10.28.14.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:29:20 -0700 (PDT)
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
Subject: [PATCH 1/2] clk: renesas: rzv2h-cpg: Add support for clocks without PM
Date: Mon, 28 Oct 2024 21:29:13 +0000
Message-ID: <20241028212914.1057715-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028212914.1057715-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241028212914.1057715-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Allow certain CPG_MOD clocks to be excluded from Runtime PM support. Some
clocks, like those in the CRU block, require specific sequences for
enabling/disabling, making them incompatible with standard Runtime PM
handling. For instance, initializing the CSI-2 D-PHY involves toggling
individual clocks, which prevents the use of Runtime PM.

Introduce a `no_pm` flag in the `mod_clock` and `rzv2h_mod_clk` structures
to indicate clocks that do not support PM. Add a helper function
`rzv2h_cpg_is_pm_clk()` to determine if a clock should be managed by
Runtime PM based on this flag. Define new macros like `DEF_MOD_NO_PM` for
easier specification of such clocks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 37 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h | 12 ++++++++---
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index b524a9d33610..ed45dbc1cc40 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -98,6 +98,7 @@ struct pll_clk {
  *
  * @priv: CPG private data
  * @hw: handle between common and hardware-specific interfaces
+ * @no_pm: flag to indicate PM is not supported
  * @on_index: register offset
  * @on_bit: ON/MON bit
  * @mon_index: monitor register offset
@@ -106,6 +107,7 @@ struct pll_clk {
 struct mod_clock {
 	struct rzv2h_cpg_priv *priv;
 	struct clk_hw hw;
+	bool no_pm;
 	u8 on_index;
 	u8 on_bit;
 	s8 mon_index;
@@ -541,6 +543,7 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 	clock->on_bit = mod->on_bit;
 	clock->mon_index = mod->mon_index;
 	clock->mon_bit = mod->mon_bit;
+	clock->no_pm = mod->no_pm;
 	clock->priv = priv;
 	clock->hw.init = &init;
 
@@ -658,6 +661,32 @@ static int rzv2h_cpg_reset_controller_register(struct rzv2h_cpg_priv *priv)
 	return devm_reset_controller_register(priv->dev, &priv->rcdev);
 }
 
+static bool rzv2h_cpg_is_pm_clk(struct rzv2h_cpg_priv *priv,
+				const struct of_phandle_args *clkspec)
+{
+	struct mod_clock *clock;
+	struct clk_hw *hw;
+	unsigned int id;
+
+	if (clkspec->args_count != 2)
+		return true;
+
+	id = clkspec->args[1];
+	if (clkspec->args[0] != CPG_MOD ||
+	    id >= priv->num_core_clks + priv->num_mod_clks)
+		return true;
+
+	if (priv->clks[priv->num_core_clks + id] == ERR_PTR(-ENOENT))
+		return true;
+
+	hw = __clk_get_hw(priv->clks[priv->num_core_clks + id]);
+	clock = to_mod_clock(hw);
+	if (clock->no_pm)
+		return false;
+
+	return true;
+}
+
 /**
  * struct rzv2h_cpg_pd - RZ/V2H power domain data structure
  * @priv: pointer to CPG private data structure
@@ -670,6 +699,8 @@ struct rzv2h_cpg_pd {
 
 static int rzv2h_cpg_attach_dev(struct generic_pm_domain *domain, struct device *dev)
 {
+	struct rzv2h_cpg_pd *pd = container_of(domain, struct rzv2h_cpg_pd, genpd);
+	struct rzv2h_cpg_priv *priv = pd->priv;
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args clkspec;
 	bool once = true;
@@ -679,6 +710,12 @@ static int rzv2h_cpg_attach_dev(struct generic_pm_domain *domain, struct device
 
 	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
 					   &clkspec)) {
+		if (!rzv2h_cpg_is_pm_clk(priv, &clkspec)) {
+			of_node_put(clkspec.np);
+			i++;
+			continue;
+		}
+
 		if (once) {
 			once = false;
 			error = pm_clk_create(dev);
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 819029c81904..0723df4c1134 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -100,6 +100,7 @@ enum clk_types {
  * @name: handle between common and hardware-specific interfaces
  * @parent: id of parent clock
  * @critical: flag to indicate the clock is critical
+ * @no_pm: flag to indicate PM is not supported
  * @on_index: control register index
  * @on_bit: ON bit
  * @mon_index: monitor register index
@@ -109,17 +110,19 @@ struct rzv2h_mod_clk {
 	const char *name;
 	u16 parent;
 	bool critical;
+	bool no_pm;
 	u8 on_index;
 	u8 on_bit;
 	s8 mon_index;
 	u8 mon_bit;
 };
 
-#define DEF_MOD_BASE(_name, _parent, _critical, _onindex, _onbit, _monindex, _monbit) \
+#define DEF_MOD_BASE(_name, _parent, _critical, _no_pm, _onindex, _onbit, _monindex, _monbit) \
 	{ \
 		.name = (_name), \
 		.parent = (_parent), \
 		.critical = (_critical), \
+		.no_pm = (_no_pm), \
 		.on_index = (_onindex), \
 		.on_bit = (_onbit), \
 		.mon_index = (_monindex), \
@@ -127,10 +130,13 @@ struct rzv2h_mod_clk {
 	}
 
 #define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit)		\
-	DEF_MOD_BASE(_name, _parent, false, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
 
 #define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex, _monbit)	\
-	DEF_MOD_BASE(_name, _parent, true, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _parent, true, false, _onindex, _onbit, _monindex, _monbit)
+
+#define DEF_MOD_NO_PM(_name, _parent, _onindex, _onbit, _monindex, _monbit)		\
+	DEF_MOD_BASE(_name, _parent, false, true, _onindex, _onbit, _monindex, _monbit)
 
 /**
  * struct rzv2h_reset - Reset definitions
-- 
2.43.0


