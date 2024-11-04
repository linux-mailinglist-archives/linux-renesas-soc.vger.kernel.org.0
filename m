Return-Path: <linux-renesas-soc+bounces-10289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0479BC15F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 00:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5F1F282B18
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 23:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861461FDFB9;
	Mon,  4 Nov 2024 23:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0t6yOZ8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A167E1CC177;
	Mon,  4 Nov 2024 23:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730762651; cv=none; b=pWBe0dafgjFIh31jM+7s4BnhSCCAeq2A5jmN38Gqi1fBaNqHs/AVuU4kj95TbGFkd8ToS4YrijSMjPPgEwnMbZvVPalA1iSaGXPV2ikjS0RTsOVL50EkMpL+UwnJKYtpvcfjGtfu+p8cngkCnegz22q5zaf3I41vsBYb0PLZ8aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730762651; c=relaxed/simple;
	bh=LuOc3f9necl3f4zGTUtmHGD+dRw0yKku88JXZhq0Z80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhxcomaPREkROsXFon+dYV8Xh5vO+mROZh8RpUc204PBE+RvNPkdzUsKg17gYW5B8RHrnN9Gox3/TVvffYbRR/m0jGF7kT9UppRHZUPCET71N5S77cAOBJ8V9TUcp45vFrhuL+5my0YLi1qJqmA2VHvcIXqGydjQmx0PyuDkGds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0t6yOZ8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43161c0068bso40465695e9.1;
        Mon, 04 Nov 2024 15:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730762648; x=1731367448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDhpbT1XZZg37jocxcRxRi9Yb6xLxIcc0ElWbURKKdk=;
        b=B0t6yOZ8H7qyyjl5Ane+nniwd53EQqkJZ+lESxHDMlQGvThV+CqFxhEMtOwR3KYRSl
         Brei79hNf+4VGO9KrNbACt26GnHK8skSxeYZuW7cY1vrBuCFKrHNm0igN627b3XDCsOI
         lmEp5c1GDKaFVjalD3rskfbd74V+XMC5gKTpocZdxdkyw5qu1rri2IDwHyUsG18rnXJW
         dg30Ha7PK9H0xlRQ98IHK4aRbwN+PYy1l062dKbU4xP2nrqZy0WcLtVdKS4fn0nzWozk
         OIQNlPgGJGyWNF7fP0/vGf6+Fs6M7hFKUOt9YhuakdGdEDWFkHLd4ZP+tp+95D0KEuT2
         6K7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730762648; x=1731367448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDhpbT1XZZg37jocxcRxRi9Yb6xLxIcc0ElWbURKKdk=;
        b=c539jVTcdB5B8ogMLgoFm9Akm7bz4oTTR+rkKeIC928Z/ww9SbI9Ka/hows5yqNMmH
         Q/C62HUwTBUiu9H/YTrsjeb49s2ioqYHvPJ5q414cb06H55UJWsf57k3Xi5+Xui/dBfK
         jrzA7R5PBmRX7TQkgMVLAUoDbqmuLCSJ+mSnoX0VIi7+XLKpjAmW0Tod4oFocKk1oZUk
         tuW8u8noEfAHBCXeTD1ostk5H49LsREWkGNzKkjSQdoPS6G7pSVYsWPfcCP3ztw6e72Y
         iJ7rObZpAUGDa3YTxU+dDcYDYuuFim6rMnJHvyudg/5A7NV4L3fmNawW8xsmkUsfTP/t
         hpLA==
X-Forwarded-Encrypted: i=1; AJvYcCWBadK++RS/j6qFj1cC/XbNx/J13J1AsnJhIhZTlnG8aClwnsjIVA+wMZlfDOG3NziSwKk38mCdpUc=@vger.kernel.org, AJvYcCX0CQLDszKERXa/yCtl5T3hgNLdxIxQfW5PZMElh19/dkSysr7gFxTHZyFY7cRI6l+UftG68r5gy5VNtrUS@vger.kernel.org
X-Gm-Message-State: AOJu0YwxEvOVN3MGup1ZeQIIGTLKsgk+2WqZcFkTgqneJGtjkMgr37UI
	9NFf/dlzybhRgxQKI/QNu5TUbbIkHs3ZTP8g9/TaW2LhNRt3rs35
X-Google-Smtp-Source: AGHT+IHkVTNNQR+NOAgqH3oJeVrmxaDB2ITXPt6c5bV2fprTTKXsP8Iq+mhSOH2f5WvyAItp3y7Iiw==
X-Received: by 2002:a05:600c:4f8e:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-432832449ccmr115542395e9.8.1730762647717;
        Mon, 04 Nov 2024 15:24:07 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b000:5e71:8a91:bce5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab254sm167156675e9.3.2024.11.04.15.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 15:24:06 -0800 (PST)
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
Subject: [PATCH v2 1/2] clk: renesas: rzv2h-cpg: Add selective Runtime PM support for clocks
Date: Mon,  4 Nov 2024 23:24:00 +0000
Message-ID: <20241104232401.290423-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241104232401.290423-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241104232401.290423-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update `rzv2h_cpg_attach_dev` to prevent external clocks not tied to the
power domain from being managed by Runtime PM. This ensures that only
clocks originating from the domain are controlled, thereby avoiding
unintended handling of external clocks.

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
v1->v2
- Updated code to skip external clocks to be controlled from runtime PM
- Updated id range check
- Updated commit message
---
 drivers/clk/renesas/rzv2h-cpg.c | 39 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h | 12 +++++++---
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index b524a9d33610..9645eb84bf9d 100644
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
 
@@ -668,8 +671,38 @@ struct rzv2h_cpg_pd {
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
+			return true;
+
+		if (priv->clks[priv->num_core_clks + id] == ERR_PTR(-ENOENT))
+			return true;
+
+		clock = to_mod_clock(__clk_get_hw(priv->clks[priv->num_core_clks + id]));
+
+		return !clock->no_pm;
+	}
+
+	case CPG_CORE:
+	default:
+		return true;
+	}
+}
+
 static int rzv2h_cpg_attach_dev(struct generic_pm_domain *domain, struct device *dev)
 {
+	struct rzv2h_cpg_pd *pd = container_of(domain, struct rzv2h_cpg_pd, genpd);
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args clkspec;
 	bool once = true;
@@ -679,6 +712,12 @@ static int rzv2h_cpg_attach_dev(struct generic_pm_domain *domain, struct device
 
 	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
 					   &clkspec)) {
+		if (!rzv2h_cpg_is_pm_clk(pd, &clkspec)) {
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


