Return-Path: <linux-renesas-soc+bounces-18865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F470AEC13C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 22:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F724189BB65
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 20:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8E32EE29D;
	Fri, 27 Jun 2025 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyosXzhz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD2C2ED15F;
	Fri, 27 Jun 2025 20:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056971; cv=none; b=qwF/3teaYED2mYbzYLaWzKP7T9QhWz/jBh8nT+hfFuGuzLOW3sIqzzYJkWeEA44hKhxIIv2bYTIAD4F6X0WcCPbNgzU0q35ik7gUvnpoXNUIpXVUJplpGTPMFiWxjWZfr5tOTR5hJuSurzaLMZIoL6iokdv+eOwi+ErqnJcHsnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056971; c=relaxed/simple;
	bh=1i49leCQsu+i6wZP85drRFimnGWInInh2vw+ysp6ENY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NaENPyBgby9J5s0ukWkYpMKxW/b4K6bRGdJYiHRt9IRl36wTgwy4i6+DMBkhuNBy1AHqkbhjGTXLyiM0tfGG6Ml0UfUxklO+zsI3GbcepomrCZOivdCK9Wi22SQBGnDmmNBNaqslPKD5QJK5tlHQKLUFgnrvYlg2jsCv3ZMOEdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyosXzhz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so166728f8f.3;
        Fri, 27 Jun 2025 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751056968; x=1751661768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elcjYP2MKPmJhfOyJ3ZCoEh7a4cOU4MNvRKg6SxOGIU=;
        b=SyosXzhzZY7tCJ1Lfn9TILr4Y3JuXYAbs1xtjN7lYX4bg4JayybQBQePwy7GtsS41K
         nctEx7p4ZlAk1072P1L8f3MFeTilBnNkSIkL35ZsoeBrqrZ5VvYJZ89/wLNUBCKVISM+
         IJZamtqrEmOoJLd45lzfm8K0qfXOAY8/50dqnVaI4VxBquChgMBhjbcZ6rcvj4ALBO2B
         W/Fu0UjmFdAFYaX2yAzfqfGjF3mlGQS8fyrW2/H5QrATC4NrAY42Sd4vg7uWb1rIHCXv
         861IhLwXY9g0FGTEQwZ8JEX2zznvmW4UOHR4aygVMXyXHwMYEXmMGLhh4lJ26nXb/62/
         FfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056968; x=1751661768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elcjYP2MKPmJhfOyJ3ZCoEh7a4cOU4MNvRKg6SxOGIU=;
        b=HeqsOPAqg2h4DgiPu3QuGrVeKQlMdKUI3aaKRNywwMHk1stf67jfYtgWW6jUWLPxg7
         E00/SaWcI2/Z6t9TIZfCkAodtjTPHxEkmuNiiXrXiiGFSuleFrFhSKJBJBCx6dVg9/47
         90EnM7fyx+eJl97Dj2u1O7cg5MtOk9pp9vf8aIZ8EFW+l2g1t1s5kaaHtqxFOcslSgfQ
         1LwwbdVnLEXYj9CaP2HBZkwjNaQesI9/wO0l0lFWNMEQeyWE8AKvNUFSpRbZwiTbfNiz
         RJ9CTKArQPzW1p7YFPrEqrVEg55zutM6eX2ey2GxT22mHAUxdJ+qlEHSdzruFhCo5ftS
         6vdA==
X-Forwarded-Encrypted: i=1; AJvYcCVpS1Zsp+NzuekT36o9GbjJnaKFia42t1fW6jXp7KOeCSno7+rn+4WO0PK/qB8K254armkY9qw26Cfu@vger.kernel.org, AJvYcCWNT90PyYugkAnc0jN/iysrZUSUatEDMuLBUa5VSTvHn4nHhmwQE9lbHehbQGjh6PeGwlCcXMjV6e2N9fZB@vger.kernel.org, AJvYcCXLST6lbJFqCHBjXx71rWUFOS2onQzHGLcOnY2UHkub0BSqCqayAHvJPOnH/RfDTUN7jiQn5R137whw@vger.kernel.org
X-Gm-Message-State: AOJu0YxKOk0yBap4zDDK1M04r2/+/nKvO0XVKhzap2lSddSWjq3/Oqkd
	CQFb7ILP40Ji/rxml9P12L5wMNB0skFmSMlVZTMjBWP3eL1E+rTALjLV
X-Gm-Gg: ASbGnct5Hrez8q1rlpDltRhgvcGUb6zvLusRFLrtzSS8tX+1jXBeC98yZA7m0RWwtYl
	mZd4Udght2AVgSN+mNL8bdY4pWsaKSMJGqcTp1Lk6JBrWukeJDyl6WKBbhq+AfWkjKksWBimd7U
	Jw0qHYcKCpf/rSILLa31fwDZxN/Wxybt/gZJ2I50o5pcX17xvVbFNQyXR3D9/H4zw0O2887ME1O
	nZUA/FWC96sXoCL2Isw5N0zIZ8FsUT18PWFtixCA3rE7QHZXN5qEUDmTfuIITa2gdCmvsjQ74wT
	U9j4Hw1dD2VFiL2Pu6PG4mZtycUZlt9KL5VY/sgBnO17IfnLEPWNwgqB5f1CkvJWWvRu2pRqUc8
	nR4YCDP6T+A==
X-Google-Smtp-Source: AGHT+IET6tkjYPXTj/gKEyf2oNDd4BkWtF8tvO1TQfp9y4Ghm7ipDCg2co84tFL/nllhgVXCYicdeg==
X-Received: by 2002:a05:6000:25e2:b0:3a4:f7df:baf5 with SMTP id ffacd0b85a97d-3a8e842f9famr4373367f8f.0.1751056968120;
        Fri, 27 Jun 2025 13:42:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3b46:edb1:4d0:593b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab7asm3609322f8f.24.2025.06.27.13.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 13:42:47 -0700 (PDT)
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
Subject: [PATCH v2 4/6] clk: renesas: rzv2h: Add fixed-factor module clocks with status reporting
Date: Fri, 27 Jun 2025 21:42:35 +0100
Message-ID: <20250627204237.214635-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Note, this patch generates below checkpatch warning but this is
not a problem.
`WARNING: struct clk_ops should normally be const`

v1->v2:
- Moved rzv2h_clk_ff_mod_status_ops to the CPG private data structure
  and initialized it in the CPG probe function.
---
 drivers/clk/renesas/rzv2h-cpg.c | 92 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h | 22 ++++++++
 2 files changed, 114 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 11325980379a..40eb1c287c34 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -77,6 +77,7 @@
  * @resets: Array of resets
  * @num_resets: Number of Module Resets in info->resets[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
+ * @ff_mod_status_ops: Fixed Factor Module Status Clock operations
  * @mstop_count: Array of mstop values
  * @rcdev: Reset controller entity
  */
@@ -92,6 +93,8 @@ struct rzv2h_cpg_priv {
 	unsigned int num_resets;
 	unsigned int last_dt_core_clk;
 
+	struct clk_ops *ff_mod_status_ops;
+
 	atomic_t *mstop_count;
 
 	struct reset_controller_dev rcdev;
@@ -150,6 +153,22 @@ struct ddiv_clk {
 
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
@@ -421,6 +440,65 @@ rzv2h_cpg_mux_clk_register(const struct cpg_core_clk *core,
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
+	init.name = core->name;
+	init.ops = priv->ff_mod_status_ops;
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
@@ -499,6 +577,20 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 		else
 			clk = clk_hw->clk;
 		break;
+	case CLK_TYPE_FF_MOD_STATUS:
+		if (!priv->ff_mod_status_ops) {
+			priv->ff_mod_status_ops =
+				devm_kzalloc(dev, sizeof(*priv->ff_mod_status_ops), GFP_KERNEL);
+			if (!priv->ff_mod_status_ops) {
+				clk = ERR_PTR(-ENOMEM);
+				goto fail;
+			}
+			memcpy(priv->ff_mod_status_ops, &clk_fixed_factor_ops,
+			       sizeof(const struct clk_ops));
+			priv->ff_mod_status_ops->is_enabled = rzv2h_clk_ff_mod_status_is_enabled;
+		}
+		clk = rzv2h_cpg_fixed_mod_status_clk_register(core, priv);
+		break;
 	case CLK_TYPE_PLL:
 		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
 		break;
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 25e0a9e5761b..ba4f0196643f 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -94,6 +94,23 @@ struct smuxed {
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
@@ -152,6 +169,7 @@ struct cpg_core_clk {
 		struct ddiv ddiv;
 		struct pll pll;
 		struct smuxed smux;
+		struct fixed_mod_conf fixed_mod;
 	} cfg;
 	const struct clk_div_table *dtable;
 	const char * const *parent_names;
@@ -164,6 +182,7 @@ enum clk_types {
 	/* Generic */
 	CLK_TYPE_IN,		/* External Clock Input */
 	CLK_TYPE_FF,		/* Fixed Factor Clock */
+	CLK_TYPE_FF_MOD_STATUS,	/* Fixed Factor Clock which can report the status of module clock */
 	CLK_TYPE_PLL,
 	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
 	CLK_TYPE_SMUX,		/* Static Mux */
@@ -179,6 +198,9 @@ enum clk_types {
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


