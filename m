Return-Path: <linux-renesas-soc+bounces-10786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1E59E0DEE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 22:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6643DB38CC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 20:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826711DF25D;
	Mon,  2 Dec 2024 20:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/ShCADX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8747C1DEFD2;
	Mon,  2 Dec 2024 20:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733171974; cv=none; b=j/UmFDsFUpHh4mA1bIree5tgWqG5P+JV7Uxai0QA6uaYIHNJq90YsXpkqzsOcteML8wKnHf5+5J0L7O8MBdQ+MPdfXlbCKPYFCu2nVrh6wjze9Ko4RwHJTdsndsikYvrh17yhs7SdskEcS18+dQgUrBgnkFPx5e2MxC5IM+imvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733171974; c=relaxed/simple;
	bh=2PA3p9GOdm8qCLg8nr1vPh3TBdstHUOtl6ZXM6hqv4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6NBivt/BjeWLoLzyy6K4WuRzXLR6VGc9yqITgv3ExsDYpurctr/4LQyguYfygyOGqJL2eBtD0y9mIlE2e10r8EKGYmcjHmvmPA6PLLQijhSEXl5Nv9Pt9rE0w8Xdm4whhpmD+kzXvOkmtIT8fY9D0usCKtaHgvM/Ou1TgWclEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/ShCADX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso3793313f8f.1;
        Mon, 02 Dec 2024 12:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733171971; x=1733776771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBCNxIql7vOqDHapA7sEh3yy9UhiEVzICf6BciQ2ElQ=;
        b=T/ShCADX8NB3HI2Sy6e4NGT2TR1Uv0otMvG9noBPpB1cDGj+mji8n6oHQ/5IgH86Lx
         W5ZO5Y0oBHjh8sschvCccPqFTY8iYBXtSiqj1WgFo7WY7L47sA7jsFhmFAmdvT937kH6
         PpCNZbcP5HLSM1iw5V3QvLm5BlX+yEnhwV1Fcrx3SLstMzUeo0dh7LcwMer8fT0OIz/1
         jEX7V3NNQ5frrFpJjo9LgZKEwE/U5nhrIdjPaZwnbYLGSj9z4/LI9lUR97v5cb0trEt6
         IXQ97kiCKKYUIMOCxPpiVPimeCszqszM4gjnvpisKrpj57C4YCVhwLq/bZ3a93S5b5Vw
         dxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733171971; x=1733776771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBCNxIql7vOqDHapA7sEh3yy9UhiEVzICf6BciQ2ElQ=;
        b=s9nAcs/4npoJ/keeOTAb9p9b/b/kmEygOYPJVPDsEWWP9L99AKJRgPzTqnBRGuz089
         zPsm/tvyfOXYh5EWCkSRl5tgugWHYotjL9Fp3MiN35kZj2PSTC4ouWOI8DQXxRN0cW+Q
         POtyvrQmbUqVk9utBcXcs/hOAHhyBzIpnBw2bXjyMqJhzcQ2/LVDkCYwCHe4eIcoO7T1
         zGOhIhBM2XkEwH4kXuYePrg2CHcvNgNoQke55ra4XMn/KZ/RHPZZA/Mdk2yuq0MoFEHu
         eBqlpH82Ph3RBp2+kk/mWp/g9u7yUJ3XDP8uWkpIvvFOpK0SwJ6NcMgqXgVhlU8xRAOM
         8+8w==
X-Forwarded-Encrypted: i=1; AJvYcCW2vJ0/HKSKCloQURsvvsz6hW1lKkDVsjCLYfF0OlfMEk+1iLX6oDCQwA+DxLjpYnXYE8mpdn2wEy0=@vger.kernel.org, AJvYcCXIt1DxquykECqyvK+c0+ayzaGijSe7uh8QTfaH74WgP1SOJH4NQIJJYEuBfN70ToOSuQDQbZghgcFN9cdK@vger.kernel.org
X-Gm-Message-State: AOJu0YwooLJsABRZS780GSJIz5fN372RLXrJVzFi5CnNJ0lIkqq1wrbO
	dyyg+rNVP1BVpZPObyV3xMTglvtKT81oYRHUAiYCbA3qdIPkzB5I
X-Gm-Gg: ASbGncseoBEk9WIt5SYwwQdTk92lkX1gTLAE6FjrrsRhWC08ONsA09BOpW2AL9aVpdw
	4aTp2u4WvK5LadHZmMliChyHH6bMvUTIpC0dOB8Fzagzpv58hBQCHxfKooVHts4zsDkcaew5GCm
	TCXlloehz8GWLfJo1Rroub11FJvZVzRvdRYze3tqRs5kep3Gb+iMeLzUt4m+1D1ODBYC4N3xK7k
	3nI2ljjXr7tU0fgipJWyVVFYXU/5il4cyeB1g5pzzNnJCcHUMD8MoXyXEspXdevaILwn4Hdw276
	gw==
X-Google-Smtp-Source: AGHT+IExicnqlI7MUgisnDfcR3qET/OtXbBsZ99IMepiGNG6dt39iYau4MNLehxwgZdZoiXpqlypRA==
X-Received: by 2002:a05:6000:1446:b0:385:e5dc:e285 with SMTP id ffacd0b85a97d-385e5dce400mr10941824f8f.58.1733171970573;
        Mon, 02 Dec 2024 12:39:30 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:7f2:1e67:9db5:ea0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e8783843sm7640201f8f.4.2024.12.02.12.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 12:39:28 -0800 (PST)
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
Subject: [PATCH v3 1/2] clk: renesas: rzv2h: Add selective Runtime PM support for clocks
Date: Mon,  2 Dec 2024 20:39:15 +0000
Message-ID: <20241202203916.48668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202203916.48668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241202203916.48668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update `rzv2h_cpg_attach_dev` to prevent external and core clocks not tied
to the power domain from being managed by Runtime PM. This ensures that
only clocks originating from the domain are controlled, thereby avoiding
unintended handling of external and core clocks.

Additionally, introduce a `no_pm` flag in `mod_clock` and `rzv2h_mod_clk`
structures to exclude specific clocks from Runtime PM when needed. Some
clocks, such as those in the CRU block, require unique enable/disable
sequences that are incompatible with standard Runtime PM. For example,
the CSI-2 D-PHY clock initialization requires toggling individual clocks,
making Runtime PM unsuitable.

The helper function `rzv2h_cpg_is_pm_clk()` checks whether a clock should
be managed by Runtime PM based on this `no_pm` flag. New macros, such as
`DEF_MOD_NO_PM`, allow straightforward declaration of clocks that bypass
PM.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
-> Replaced `rzv2h-cpg` to `rzv2h` in commit header
-> Switched to use for loop while looping
-> Considering core clocks to be non pm clocks

v1->v2
- Updated code to skip external clocks to be controlled from runtime PM
- Updated id range check
- Updated commit message
---
 drivers/clk/renesas/rzv2h-cpg.c | 44 ++++++++++++++++++++++++++++++---
 drivers/clk/renesas/rzv2h-cpg.h | 12 ++++++---
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index b524a9d33610..1154493583a7 100644
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
 
@@ -668,17 +671,51 @@ struct rzv2h_cpg_pd {
 	struct generic_pm_domain genpd;
 };
 
+static bool rzv2h_cpg_is_pm_clk(struct rzv2h_cpg_pd *pd,
+				const struct of_phandle_args *clkspec)
+{
+	if (clkspec->np != pd->genpd.dev.of_node || clkspec->args_count != 2)
+		return false;
+
+	switch (clkspec->args[0]) {
+	case CPG_MOD: {
+		struct rzv2h_cpg_priv *priv = pd->priv;
+		unsigned int id = clkspec->args[1];
+		struct mod_clock *clock;
+
+		if (id >= priv->num_mod_clks)
+			return false;
+
+		if (priv->clks[priv->num_core_clks + id] == ERR_PTR(-ENOENT))
+			return false;
+
+		clock = to_mod_clock(__clk_get_hw(priv->clks[priv->num_core_clks + id]));
+
+		return !clock->no_pm;
+	}
+
+	case CPG_CORE:
+	default:
+		return false;
+	}
+}
+
 static int rzv2h_cpg_attach_dev(struct generic_pm_domain *domain, struct device *dev)
 {
+	struct rzv2h_cpg_pd *pd = container_of(domain, struct rzv2h_cpg_pd, genpd);
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args clkspec;
 	bool once = true;
 	struct clk *clk;
+	unsigned int i;
 	int error;
-	int i = 0;
 
-	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
-					   &clkspec)) {
+	for (i = 0; !of_parse_phandle_with_args(np, "clocks", "#clock-cells", i, &clkspec); i++) {
+		if (!rzv2h_cpg_is_pm_clk(pd, &clkspec)) {
+			of_node_put(clkspec.np);
+			continue;
+		}
+
 		if (once) {
 			once = false;
 			error = pm_clk_create(dev);
@@ -700,7 +737,6 @@ static int rzv2h_cpg_attach_dev(struct generic_pm_domain *domain, struct device
 				error);
 			goto fail_put;
 		}
-		i++;
 	}
 
 	return 0;
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


