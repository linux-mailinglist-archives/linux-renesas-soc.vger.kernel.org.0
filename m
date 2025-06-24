Return-Path: <linux-renesas-soc+bounces-18664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4917AAE6D8E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ABA41BC61F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409272E765D;
	Tue, 24 Jun 2025 17:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKJlM+WG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0252E6D21;
	Tue, 24 Jun 2025 17:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786242; cv=none; b=gh2Whkw6eChxy4yXusSwFXJKVXv2s07B8tzoBlZB0jHtkmypaM+En8tdRz3qDs8QhhC4B7bJt6xSinO32R+XWfJJQiZ/blb8IAWySKPjCYgmVAJTWLxIhvhPFXJLb0lvdyAiaAoeEHljfTfYJKWdk2R547YOBQlV4I9c9NJAAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786242; c=relaxed/simple;
	bh=UEBUHE/DGAWtL9IV45PYPMN/r9yDe3zXWs2F8mUIL/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWwygn2MMEEhhp1M+dae1LFKYhJ3QvbyXCvRRIQ8kGAjOERcQhNAOBRs89Tb6k0fBLGLHk5uYs8UiAs5tLgo1KeqpFxj0mJl3yVCFasYuhu3hzTCfwcxIlegmKSI+kL7WORzgPJ/7jX+rDu8U4Z78pbmODDvY61w2uhCtJOF7IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKJlM+WG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so31510315e9.3;
        Tue, 24 Jun 2025 10:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750786238; x=1751391038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6NKGC362pA3i/BAGWUyJ6Alui9mWvc3wem6CesrlFQ=;
        b=WKJlM+WGOFcsApt9o9jbTj3uOTA+5tV5UFUreFrYAnHscmCTe4k6Fgszxlug+TEBYk
         DlP8VO6lfqsR1zUcAZ4MVdVrzqejaBrGqSYXuVCFIAoxKEN/e/FXhRUfXDT+GFklSg9O
         xLaM9tYiun8KYqkOcvYyhunKjiVzk2aP9Ig86R0grluF98GUcYP4GyiwwPMVdmwM80s+
         HW/GHw5ozjSP6YZydKhok1HILxCdooJ2ToDXaQJ07KO6kZyQORcQ5M51YpSaql6/N8Vk
         4a1Stz+woYgo6+FFStsJcEWzAdUz+2OkzthD+o2T1jVOooifhhs8N2yIqAcSt4ncu6+1
         Da1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786238; x=1751391038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6NKGC362pA3i/BAGWUyJ6Alui9mWvc3wem6CesrlFQ=;
        b=nFjVyGkRQJo9uWg1pVZb4ca8TJ0ObuggBKueLTt6+D/gWKc0lSxgx+2YAkMSu2NPUN
         bVkOmDUf3jTDoFTIsdSR2J7f5HIwlRpobJJ/FIjw0E5vcZJ2av4rtALOc07j4wvhbPKp
         ueeY1muuInkntK+X2XYlpA+aY5umTvCzNMLpwPV0falLJlc7NwKsAp6qurJARSSIRuS4
         ojmxoLALeF858kGfugzU02xU7k+5hg32cAhNnwDdsrsgArD8cVYmWI910UVnXk3UeZ1o
         0OCTipjorzQ6L583runB3U48yrtTSIhYnY+yp4t7E8p5CnPhoPk7ElRaP9VzTh9678WF
         pfwg==
X-Forwarded-Encrypted: i=1; AJvYcCW4IxaXs7IRbz0vUea1Zf11Ln3CY25+GkDCG4yLSSpoddulMQAXolX1aZHTbNohRStQqNpFRsQIPK82biIi@vger.kernel.org, AJvYcCWZ2Tl8Cy/0RK/5oUAgyOBlXascC8qQPV1r0x1efPzZliZpIRgOYsBwffqLX13IDJOjY/I0Jqk/1EAu@vger.kernel.org, AJvYcCXtI9FpsYywxssLRtTrxx0y8RKzKH+cig4qn4uO31okAkh7QyKrJ2Ygk60uLicHDrPYofiZ6p6dZqf7@vger.kernel.org
X-Gm-Message-State: AOJu0YzF8Dwt5jKvxCie802oU56c2QbcARHCR43jU7pUUMGUXJoYK8yS
	HcquAw1fHE84Woar8YbAZojPAuvGbroa/kcFgRJV7uptomdR6WGoGmsL
X-Gm-Gg: ASbGncuqu3jLtV6PqStJhFpPEyDsXP6pNbgjkGqoHG3QxC6970yTmBGffMVEpLOYa24
	AsVCtZyBV8wCAJRIISH3tHVanXfK45FEbcdmvHlID7jmA5n/97Egfrip1v7Al5OcDnU5tZxNxH3
	PMloXB7x2k6MSi3vjNCNslhIzgB995W7owNCPWynbo7nRMtsVlqOMr10dg4kY5RU9LcnVUBLgHe
	r+ppgWCMQyw2b+BlhpEvJWFxrb0WeJl77y6MCivRWnkyb18b086sdtyrjCPyPbAZ+3RrJqljk5X
	2K4cXEOE8KJG2jSHUyM/xRv6idpqxRKn5nTsC3I2IBa/Vfptiisje35TizK74QVy4dNQrn7fDer
	9hbep5CqCjS+5QUFj8NZ3
X-Google-Smtp-Source: AGHT+IEZ/iq8mHAW3TThdNzJowXX4LkR1NhhS85+vFyjwutfDxXJrUG8HVF+xw0IGv4e1GfTU+IEag==
X-Received: by 2002:a05:600c:6211:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-453659f5828mr141529555e9.26.1750786238246;
        Tue, 24 Jun 2025 10:30:38 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm181662565e9.27.2025.06.24.10.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:30:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/6] clk: renesas: rzv2h: Add fixed-factor module clocks with status reporting
Date: Tue, 24 Jun 2025 18:30:28 +0100
Message-ID: <20250624173030.472196-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624173030.472196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250624173030.472196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for fixed-factor module clocks that can report their enable
status through the module status monitor. Introduce a new clock type,
CLK_TYPE_FF_MOD_STATUS, and define the associated structure,
rzv2h_ff_mod_status_clk, to manage these clocks.

Implement the .is_enabled callback by reading the module status register
using monitor index and bit definitions. Provide a helper macro,
DEF_FIXED_MOD_STATUS, to simplify the definition of such clocks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 83 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h | 22 +++++++++
 2 files changed, 105 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 11325980379a..a511f34abf18 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -150,6 +150,22 @@ struct ddiv_clk {
 
 #define to_ddiv_clock(_div) container_of(_div, struct ddiv_clk, div)
 
+/**
+ * struct rzv2h_ff_mod_status_clk - Fixed Factor Module Status Clock
+ *
+ * @priv: CPG private data
+ * @conf: fixed mod configuration
+ * @fix: fixed factor clock
+ */
+struct rzv2h_ff_mod_status_clk {
+	struct rzv2h_cpg_priv *priv;
+	struct fixed_mod_conf conf;
+	struct clk_fixed_factor fix;
+};
+
+#define to_rzv2h_ff_mod_status_clk(_hw) \
+	container_of(_hw, struct rzv2h_ff_mod_status_clk, fix.hw)
+
 static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
@@ -421,6 +437,70 @@ rzv2h_cpg_mux_clk_register(const struct cpg_core_clk *core,
 	return clk_hw->clk;
 }
 
+static int
+rzv2h_clk_ff_mod_status_is_enabled(struct clk_hw *hw)
+{
+	struct rzv2h_ff_mod_status_clk *fix = to_rzv2h_ff_mod_status_clk(hw);
+	struct rzv2h_cpg_priv *priv = fix->priv;
+	u32 offset = GET_CLK_MON_OFFSET(fix->conf.mon_index);
+	u32 bitmask = BIT(fix->conf.mon_bit);
+	u32 val;
+
+	val = readl(priv->base + offset);
+	return !!(val & bitmask);
+}
+
+static struct clk_ops rzv2h_clk_ff_mod_status_ops;
+
+static struct clk * __init
+rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
+					struct rzv2h_cpg_priv *priv)
+{
+	struct rzv2h_ff_mod_status_clk *clk_hw_data;
+	struct clk_init_data init = { };
+	struct clk_fixed_factor *fix;
+	const struct clk *parent;
+	const char *parent_name;
+	int ret;
+
+	WARN_DEBUG(core->parent >= priv->num_core_clks);
+	parent = priv->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	parent_name = __clk_get_name(parent);
+	parent = priv->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+	clk_hw_data->conf = core->cfg.fixed_mod;
+
+	rzv2h_clk_ff_mod_status_ops = clk_fixed_factor_ops;
+	rzv2h_clk_ff_mod_status_ops.is_enabled = rzv2h_clk_ff_mod_status_is_enabled;
+
+	init.name = core->name;
+	init.ops = &rzv2h_clk_ff_mod_status_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	fix = &clk_hw_data->fix;
+	fix->hw.init = &init;
+	fix->mult = core->mult;
+	fix->div = core->div;
+
+	ret = devm_clk_hw_register(priv->dev, &clk_hw_data->fix.hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw_data->fix.hw.clk;
+}
+
 static struct clk
 *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
 			       void *data)
@@ -499,6 +579,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 		else
 			clk = clk_hw->clk;
 		break;
+	case CLK_TYPE_FF_MOD_STATUS:
+		clk = rzv2h_cpg_fixed_mod_status_clk_register(core, priv);
+		break;
 	case CLK_TYPE_PLL:
 		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
 		break;
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 7321b085f937..317c8ee2e2d5 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -93,6 +93,23 @@ struct smuxed {
 		.width = (_width), \
 	})
 
+/**
+ * struct fixed_mod_conf - Structure for fixed module configuration
+ *
+ * @mon_index: monitor index
+ * @mon_bit: monitor bit
+ */
+struct fixed_mod_conf {
+	u8 mon_index;
+	u8 mon_bit;
+};
+
+#define FIXED_MOD_CONF_PACK(_index, _bit) \
+	((struct fixed_mod_conf){ \
+		.mon_index = (_index), \
+		.mon_bit = (_bit), \
+	})
+
 #define CPG_SSEL0		(0x300)
 #define CPG_SSEL1		(0x304)
 #define CPG_CDDIV0		(0x400)
@@ -151,6 +168,7 @@ struct cpg_core_clk {
 		struct ddiv ddiv;
 		struct pll pll;
 		struct smuxed smux;
+		struct fixed_mod_conf fixed_mod;
 	} cfg;
 	const struct clk_div_table *dtable;
 	const char * const *parent_names;
@@ -163,6 +181,7 @@ enum clk_types {
 	/* Generic */
 	CLK_TYPE_IN,		/* External Clock Input */
 	CLK_TYPE_FF,		/* Fixed Factor Clock */
+	CLK_TYPE_FF_MOD_STATUS,	/* Fixed Factor Clock which can report the status of module clock */
 	CLK_TYPE_PLL,
 	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
 	CLK_TYPE_SMUX,		/* Static Mux */
@@ -178,6 +197,9 @@ enum clk_types {
 	DEF_TYPE(_name, _id, CLK_TYPE_IN)
 #define DEF_FIXED(_name, _id, _parent, _mult, _div) \
 	DEF_BASE(_name, _id, CLK_TYPE_FF, _parent, .div = _div, .mult = _mult)
+#define DEF_FIXED_MOD_STATUS(_name, _id, _parent, _mult, _div, _gate) \
+	DEF_BASE(_name, _id, CLK_TYPE_FF_MOD_STATUS, _parent, .div = _div, \
+		 .mult = _mult, .cfg.fixed_mod = _gate)
 #define DEF_DDIV(_name, _id, _parent, _ddiv_packed, _dtable) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DDIV, \
 		.cfg.ddiv = _ddiv_packed, \
-- 
2.49.0


