Return-Path: <linux-renesas-soc+bounces-16536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3E8AA55BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53EFD3BBD6E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BC02C17AE;
	Wed, 30 Apr 2025 20:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naVR+YFU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DA22BD93C;
	Wed, 30 Apr 2025 20:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045682; cv=none; b=o5Ef/lvWQaLrPJ1U+QhNZBpU7K3api/K9BxzPJjYEHq68IsPxBYxSAWvWWga7vGWLg66Ap3l+B4NXDwTvq+WbSYXpy7U2IxctVAKiBECYnG1JEKdsWZpX+sUoPHY2ttWFCcReAzt7Guf2I27Gf+OZTWZheEIKO/IcHAV7N1JoB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045682; c=relaxed/simple;
	bh=tuJVRD9SWKggmt10zDGe2utE4ktGEO588qhkl83mJ1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXqGvL1Tc7LXGqWOTJ1BY+CBBlYLLyMANi2H0yyTpvjQeUUQHpbEjAK5T3cJWTUEKo6N+woQhHASr2bM2oLopexqPBHSlv8QN23RzTZ9WjAl30WsQRm4roXq+6WeejpyMIwc9LOOM3lcGR4mGtEAdTZ1Ci7VRmWBfInpiTtDmiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naVR+YFU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so169011f8f.1;
        Wed, 30 Apr 2025 13:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045678; x=1746650478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3bhVpcP7T/A/bFEBGaAIzYTcwiANE7lYJzkmJHwVg4=;
        b=naVR+YFU5YG1WJXMz/sKRxKKwWOQLrpEPRp5jOP0A6qrxu7SL/mRsW7U19kiNLYxiJ
         brEp5HfeJK8iuDbBOCOqROWjlDb9OCa1NohZLEhw2OmU7JZVXu1BgU2ZssfcbgNP2kHZ
         DPp6T2fYoGFPfi0+4U/eLHIr+VSXOzU6cdFbpGJ83SxIhrmJcIbf+6gN881L2pT6t0Yw
         eR48EJ+TXTKkvEZ9mTMD+9JD5fx2d8wue1vX0ZRSHx557P8DdNpeip3+w/sw7fejbS+W
         mQHXKWYshSACy+1wvaMvwwRkWMqZXsloVD9IoQvMZKGeM948Y8XfOZKZbkSXhcq7w3u0
         yxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045678; x=1746650478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3bhVpcP7T/A/bFEBGaAIzYTcwiANE7lYJzkmJHwVg4=;
        b=nrczIBuWQOSSqWgtFGRKXIAMwdKkB5oyD+iX5d9g6TsgBQCIl6K/6e+NRPuyaYD2yD
         26pSYjL2mXfN9ug5rxlOPzf8Hezs1wcWZhOCjhWhsq/tP2ZxSFhWux18gPoOmA7gIWId
         Jnx1co4YfaLEXxkrPHEZeIOiQxFbgUEmONqWx23mCdutpbKweQNocZsVLFI+zsguk9+J
         n5Gh0o7vIXvSW3fCy99jgnGA6TVbzQKFLRpOg9Lx91RMnv2T13GIDHend6mi9Ig6NIZs
         y6xvsyVJ/Otg99tbmVXj81bctKQvwixNkXFWzHubsswLnvp4mAg16PqgQqSHwdq+hEkX
         gY+g==
X-Forwarded-Encrypted: i=1; AJvYcCUrX1NYunoEyVoW0iS5A900ID/UGMTYpT8b2TxL+AJ/dOkln1TZJld8Y5GfCanrc0sBqXsDm3er/Y5f@vger.kernel.org, AJvYcCWPj+SWYY2MAGx5z6qDepb7S08P4zS2NKxKd2eKeUqdfhp4cYm6UOfP95QqY67gO4ATiVPRq29JP5BtPbDj@vger.kernel.org, AJvYcCWcSqnJ3ujwgxBc+JowmTOo9fwwlUp4OzJfKgxArj0bNNpnT/mC3hzskljRHMy+wEpi3H0UWjtIFQm3zaramkHjXhk=@vger.kernel.org, AJvYcCXi8z2XkL/wRoW7vFN3tUxlY0MAk8YM8ysFBoIgM6cVL2jUboTa3Eg2Ki/XNdf3IF/tM5DO/fMjNosO@vger.kernel.org
X-Gm-Message-State: AOJu0YwsTesWAnVlGH1xEQWfw4+FBxtrOI1dDMoSJrdhERlTdFKNRwAO
	2Q2wiL97s0haP1YLmn4ocfsnkTRzo7PeQnUjdG7stJM9yWHhHg8T
X-Gm-Gg: ASbGncucSXSv0k8NB+UvKqspcPotsdOfSv1LfJZrzHNXEGSR5BvRZDLkyrTZu0BKupA
	shFMdnbvhIPSznNIJt7yPSdf7X6IWeLD+1/BmW9/7V5e8ErxNtdzwoWXZKT8M6cVzxtlF9N3NKZ
	bD4G3OGEmMw2x9MFT775OFc1I6zQJ2BehNcPGtGHjc+p89lubqifNQMU0eoc7wP18FoV/gNxrJL
	BfcoaWrl+qH3O8hw5HK293GqPxh0iqHRIB/LGdNyBEVFCd0Xddb5FXHPTQU/OyQkU9Nl7UGJQ5X
	AzC5raoUZKWIv4f1XeuqnxKt7r1xbKB3rcV+v6TuE0OgyEYmv4DdbuNMvQTmj+uvEtZumSsDn2M
	=
X-Google-Smtp-Source: AGHT+IEBZWC9DEdFjUKwbL20X83DQH3OeQBFCXQW5TQeNryNwVxAVtt3LwlyxYscP+ZuCFM03JgQkw==
X-Received: by 2002:a5d:588b:0:b0:3a0:8052:d3fa with SMTP id ffacd0b85a97d-3a09303bb7cmr428090f8f.33.1746045677448;
        Wed, 30 Apr 2025 13:41:17 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 01/15] clk: renesas: rzv2h-cpg: Add support for DSI clocks
Date: Wed, 30 Apr 2025 21:40:58 +0100
Message-ID: <20250430204112.342123-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for PLLDSI and PLLDSI divider clocks.

Introduce the `renesas-rzv2h-dsi.h` header to centralize and share
PLLDSI-related data structures, limits, and algorithms between the RZ/V2H
CPG and DSI drivers.

The DSI PLL is functionally similar to the CPG's PLLDSI, but has slightly
different parameter limits and omits the programmable divider present in
CPG. To ensure precise frequency calculations-especially for milliHz-level
accuracy needed by the DSI driver-the shared algorithm allows both drivers
to compute PLL parameters consistently using the same logic and input
clock.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Corrected parameter name in rzv2h_dsi_get_pll_parameters_values()
  description freq_millihz

v2->v3:
- Update the commit message to clarify the purpose of `renesas-rzv2h-dsi.h`
  header
- Used mul_u32_u32() in rzv2h_cpg_plldsi_div_determine_rate()
- Replaced *_mhz to *_millihz for clarity
- Updated u64->u32 for fvco limits
- Initialized the members in declaration order for
  RZV2H_CPG_PLL_DSI_LIMITS() macro
- Used clk_div_mask() in rzv2h_cpg_plldsi_div_recalc_rate()
- Replaced `unsigned long long` with u64
- Dropped rzv2h_cpg_plldsi_clk_recalc_rate() and reused
  rzv2h_cpg_pll_clk_recalc_rate() instead
- In rzv2h_cpg_plldsi_div_set_rate() followed the same style
  of RMW-operation as done in the other functions
- Renamed rzv2h_cpg_plldsi_set_rate() to rzv2h_cpg_pll_set_rate()
- Dropped rzv2h_cpg_plldsi_clk_register() and reused
  rzv2h_cpg_pll_clk_register() instead
- Added a gaurd in renesas-rzv2h-dsi.h header

v1->v2:
- No changes
---
 drivers/clk/renesas/rzv2h-cpg.c       | 237 +++++++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h       |  14 ++
 include/linux/clk/renesas-rzv2h-dsi.h | 211 +++++++++++++++++++++++
 3 files changed, 460 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-dsi.h

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index e03c9801d2e9..fa4d662b81f8 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -14,9 +14,13 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas-rzv2h-dsi.h>
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
+#include <linux/math.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -26,6 +30,7 @@
 #include <linux/refcount.h>
 #include <linux/reset-controller.h>
 #include <linux/string_choices.h>
+#include <linux/units.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
 
@@ -48,6 +53,7 @@
 #define CPG_PLL_STBY(x)		((x))
 #define CPG_PLL_STBY_RESETB	BIT(0)
 #define CPG_PLL_STBY_RESETB_WEN	BIT(16)
+#define CPG_PLL_STBY_SSCGEN_WEN BIT(18)
 #define CPG_PLL_CLK1(x)		((x) + 0x004)
 #define CPG_PLL_CLK1_KDIV(x)	((s16)FIELD_GET(GENMASK(31, 16), (x)))
 #define CPG_PLL_CLK1_MDIV(x)	FIELD_GET(GENMASK(15, 6), (x))
@@ -79,6 +85,8 @@
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
  * @mstop_count: Array of mstop values
  * @rcdev: Reset controller entity
+ * @dsi_limits: PLL DSI parameters limits
+ * @plldsi_div_parameters: PLL DSI and divider parameters configuration
  */
 struct rzv2h_cpg_priv {
 	struct device *dev;
@@ -95,6 +103,9 @@ struct rzv2h_cpg_priv {
 	atomic_t *mstop_count;
 
 	struct reset_controller_dev rcdev;
+
+	const struct rzv2h_pll_div_limits *dsi_limits;
+	struct rzv2h_plldsi_parameters plldsi_div_parameters;
 };
 
 #define rcdev_to_priv(x)	container_of(x, struct rzv2h_cpg_priv, rcdev)
@@ -152,6 +163,24 @@ struct ddiv_clk {
 
 #define to_ddiv_clock(_div) container_of(_div, struct ddiv_clk, div)
 
+/**
+ * struct rzv2h_plldsi_div_clk - PLL DSI DDIV clock
+ *
+ * @dtable: divider table
+ * @priv: CPG private data
+ * @hw: divider clk
+ * @ddiv: divider configuration
+ */
+struct rzv2h_plldsi_div_clk {
+	const struct clk_div_table *dtable;
+	struct rzv2h_cpg_priv *priv;
+	struct clk_hw hw;
+	struct ddiv ddiv;
+};
+
+#define to_plldsi_div_clk(_hw) \
+	container_of(_hw, struct rzv2h_plldsi_div_clk, hw)
+
 static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
@@ -200,6 +229,188 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
 	return ret;
 }
 
+static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
+						      unsigned long parent_rate)
+{
+	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
+	struct rzv2h_cpg_priv *priv = dsi_div->priv;
+	struct ddiv ddiv = dsi_div->ddiv;
+	u32 div;
+
+	div = readl(priv->base + ddiv.offset);
+	div >>= ddiv.shift;
+	div &= clk_div_mask(ddiv.width);
+	div = dsi_div->dtable[div].div;
+
+	return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
+}
+
+static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
+					       struct clk_rate_request *req)
+{
+	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
+	struct rzv2h_cpg_priv *priv = dsi_div->priv;
+	struct rzv2h_plldsi_parameters *dsi_dividers = &priv->plldsi_div_parameters;
+	u64 rate_millihz;
+
+	/*
+	 * Adjust the requested clock rate (`req->rate`) to ensure it falls within
+	 * the supported range of 5.44 MHz to 187.5 MHz.
+	 */
+	req->rate = clamp(req->rate, 5440000UL, 187500000UL);
+
+	rate_millihz = mul_u32_u32(req->rate, MILLI);
+	if (rate_millihz == dsi_dividers->error_millihz + dsi_dividers->freq_millihz)
+		goto exit_determine_rate;
+
+	if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
+						 dsi_dividers, rate_millihz)) {
+		dev_err(priv->dev,
+			"failed to determine rate for req->rate: %lu\n",
+			req->rate);
+		return -EINVAL;
+	}
+
+exit_determine_rate:
+	req->best_parent_rate = req->rate * dsi_dividers->csdiv;
+
+	return 0;
+};
+
+static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
+					 unsigned long rate,
+					 unsigned long parent_rate)
+{
+	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
+	struct rzv2h_cpg_priv *priv = dsi_div->priv;
+	struct rzv2h_plldsi_parameters *dsi_dividers = &priv->plldsi_div_parameters;
+	struct ddiv ddiv = dsi_div->ddiv;
+	const struct clk_div_table *clkt;
+	bool div_found = false;
+	u32 val, shift, div;
+
+	div = dsi_dividers->csdiv;
+	for (clkt = dsi_div->dtable; clkt->div; clkt++) {
+		if (clkt->div == div) {
+			div_found = true;
+			break;
+		}
+	}
+
+	if (!div_found)
+		return -EINVAL;
+
+	shift = ddiv.shift;
+	val = readl(priv->base + ddiv.offset) | DDIV_DIVCTL_WEN(shift);
+	val &= ~(clk_div_mask(ddiv.width) << shift);
+	val |= (u32)clkt->val << shift;
+	writel(val, priv->base + ddiv.offset);
+
+	return 0;
+};
+
+static const struct clk_ops rzv2h_cpg_plldsi_div_ops = {
+	.recalc_rate = rzv2h_cpg_plldsi_div_recalc_rate,
+	.determine_rate = rzv2h_cpg_plldsi_div_determine_rate,
+	.set_rate = rzv2h_cpg_plldsi_div_set_rate,
+};
+
+static struct clk * __init
+rzv2h_cpg_plldsi_div_clk_register(const struct cpg_core_clk *core,
+				  struct rzv2h_cpg_priv *priv)
+{
+	struct rzv2h_plldsi_div_clk *clk_hw_data;
+	struct clk **clks = priv->clks;
+	struct clk_init_data init;
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_hw *clk_hw;
+	int ret;
+
+	parent = clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+	clk_hw_data->ddiv = core->cfg.ddiv;
+	clk_hw_data->dtable = core->dtable;
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = &rzv2h_cpg_plldsi_div_ops;
+	init.flags = core->flag;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	clk_hw = &clk_hw_data->hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
+static long rzv2h_cpg_plldsi_round_rate(struct clk_hw *hw,
+					unsigned long rate,
+					unsigned long *parent_rate)
+{
+	return clamp(rate, 25000000UL, 375000000UL);
+}
+
+static int rzv2h_cpg_pll_set_rate(struct clk_hw *hw,
+				  unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+	struct rzv2h_plldsi_parameters *dsi_dividers;
+	struct pll pll = pll_clk->pll;
+	u16 offset = pll.offset;
+	u32 val;
+	int ret;
+
+	/* Put PLL into standby mode */
+	writel(CPG_PLL_STBY_RESETB_WEN, priv->base + CPG_PLL_STBY(offset));
+	ret = readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
+					val, !(val & CPG_PLL_MON_LOCK),
+					100, 2000);
+	if (ret) {
+		dev_err(priv->dev, "Failed to put PLLDSI into standby mode");
+		return ret;
+	}
+
+	dsi_dividers = &priv->plldsi_div_parameters;
+	/* Output clock setting 1 */
+	writel((dsi_dividers->k << 16) | (dsi_dividers->m << 6) | (dsi_dividers->p),
+	       priv->base + CPG_PLL_CLK1(offset));
+
+	/* Output clock setting 2 */
+	val = readl(priv->base + CPG_PLL_CLK2(offset));
+	writel((val & ~GENMASK(2, 0)) | dsi_dividers->s,
+	       priv->base + CPG_PLL_CLK2(offset));
+
+	/* Put PLL to normal mode */
+	writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
+	       priv->base + CPG_PLL_STBY(offset));
+
+	/* PLL normal mode transition, output clock stability check */
+	ret = readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
+					val, (val & CPG_PLL_MON_LOCK),
+					100, 2000);
+	if (ret) {
+		dev_err(priv->dev, "Failed to put PLLDSI into normal mode");
+		return ret;
+	}
+
+	return 0;
+};
+
 static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 						   unsigned long parent_rate)
 {
@@ -221,6 +432,12 @@ static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	return DIV_ROUND_CLOSEST_ULL(rate, CPG_PLL_CLK1_PDIV(clk1));
 }
 
+static const struct clk_ops rzv2h_cpg_plldsi_ops = {
+	.recalc_rate = rzv2h_cpg_pll_clk_recalc_rate,
+	.round_rate = rzv2h_cpg_plldsi_round_rate,
+	.set_rate = rzv2h_cpg_pll_set_rate,
+};
+
 static const struct clk_ops rzv2h_cpg_pll_ops = {
 	.is_enabled = rzv2h_cpg_pll_clk_is_enabled,
 	.enable = rzv2h_cpg_pll_clk_enable,
@@ -230,7 +447,8 @@ static const struct clk_ops rzv2h_cpg_pll_ops = {
 static struct clk * __init
 rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 			   struct rzv2h_cpg_priv *priv,
-			   const struct clk_ops *ops)
+			   const struct clk_ops *ops,
+			   bool turn_on)
 {
 	void __iomem *base = priv->base;
 	struct device *dev = priv->dev;
@@ -260,6 +478,13 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	pll_clk->base = base;
 	pll_clk->priv = priv;
 
+	if (turn_on) {
+		/* Disable SSC and turn on PLL clock when init */
+		writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB |
+		       CPG_PLL_STBY_SSCGEN_WEN,
+		       base + CPG_PLL_STBY(pll_clk->pll.offset));
+	}
+
 	ret = devm_clk_hw_register(dev, &pll_clk->hw);
 	if (ret)
 		return ERR_PTR(ret);
@@ -501,7 +726,7 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 			clk = clk_hw->clk;
 		break;
 	case CLK_TYPE_PLL:
-		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
+		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops, false);
 		break;
 	case CLK_TYPE_DDIV:
 		clk = rzv2h_cpg_ddiv_clk_register(core, priv);
@@ -509,6 +734,12 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_SMUX:
 		clk = rzv2h_cpg_mux_clk_register(core, priv);
 		break;
+	case CLK_TYPE_PLLDSI:
+		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_plldsi_ops, true);
+		break;
+	case CLK_TYPE_PLLDSI_DIV:
+		clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
@@ -1045,6 +1276,8 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 	priv->last_dt_core_clk = info->last_dt_core_clk;
 	priv->num_resets = info->num_resets;
 
+	priv->dsi_limits = info->plldsi_limits;
+
 	for (i = 0; i < nclks; i++)
 		clks[i] = ERR_PTR(-ENOENT);
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index a05fb5e7f707..acae042fdf5b 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -100,6 +100,7 @@ struct smuxed {
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
 #define CPG_CSDIV0		(0x500)
+#define CPG_CSDIV1		(0x504)
 
 #define CDDIV0_DIVCTL1	DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
@@ -163,6 +164,8 @@ enum clk_types {
 	CLK_TYPE_PLL,
 	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
 	CLK_TYPE_SMUX,		/* Static Mux */
+	CLK_TYPE_PLLDSI,	/* PLLDSI */
+	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -190,6 +193,14 @@ enum clk_types {
 		 .num_parents = ARRAY_SIZE(_parent_names), \
 		 .flag = CLK_SET_RATE_PARENT, \
 		 .mux_flags = CLK_MUX_HIWORD_MASK)
+#define DEF_PLLDSI(_name, _id, _parent, _pll_packed) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI, .parent = _parent, .cfg.pll = _pll_packed)
+#define DEF_PLLDSI_DIV(_name, _id, _parent, _ddiv_packed, _dtable) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_DIV, \
+		 .cfg.ddiv = _ddiv_packed, \
+		 .dtable = _dtable, \
+		 .parent = _parent, \
+		 .flag = CLK_SET_RATE_PARENT)
 
 /**
  * struct rzv2h_mod_clk - Module Clocks definitions
@@ -296,6 +307,7 @@ struct rzv2h_reset {
  *
  * @num_mstop_bits: Maximum number of MSTOP bits supported, equivalent to the
  *		    number of CPG_BUS_m_MSTOP registers multiplied by 16.
+ * @plldsi_limits: PLL DSI parameters limits
  */
 struct rzv2h_cpg_info {
 	/* Core Clocks */
@@ -314,6 +326,8 @@ struct rzv2h_cpg_info {
 	unsigned int num_resets;
 
 	unsigned int num_mstop_bits;
+
+	const struct rzv2h_pll_div_limits *plldsi_limits;
 };
 
 extern const struct rzv2h_cpg_info r9a09g047_cpg_info;
diff --git a/include/linux/clk/renesas-rzv2h-dsi.h b/include/linux/clk/renesas-rzv2h-dsi.h
new file mode 100644
index 000000000000..faecb5d49c20
--- /dev/null
+++ b/include/linux/clk/renesas-rzv2h-dsi.h
@@ -0,0 +1,211 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Renesas RZ/V2H(P) DSI CPG helper
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+#ifndef __RENESAS_RZV2H_DSI_H__
+#define __RENESAS_RZV2H_DSI_H__
+
+#include <linux/limits.h>
+#include <linux/math.h>
+#include <linux/math64.h>
+#include <linux/units.h>
+
+#define OSC_CLK_IN_MEGA		(24 * MEGA)
+
+struct rzv2h_pll_div_limits {
+	struct {
+		u32 min;
+		u32 max;
+	} fvco;
+
+	struct {
+		u16 min;
+		u16 max;
+	} m;
+
+	struct {
+		u8 min;
+		u8 max;
+	} p;
+
+	struct {
+		u8 min;
+		u8 max;
+	} s;
+
+	struct {
+		s16 min;
+		s16 max;
+	} k;
+
+	struct {
+		u8 min;
+		u8 max;
+	} csdiv;
+};
+
+struct rzv2h_plldsi_parameters {
+	u64 freq_millihz;
+	s64 error_millihz;
+	u16 m;
+	s16 k;
+	u8 csdiv;
+	u8 p;
+	u8 s;
+};
+
+#define RZV2H_CPG_PLL_DSI_LIMITS(name)					\
+	static const struct rzv2h_pll_div_limits (name) = {		\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+		.csdiv = { .min = 2, .max = 32 },			\
+	}								\
+
+/**
+ * rzv2h_dsi_get_pll_parameters_values - Finds the best combination of PLL parameters
+ * and divider value for a given frequency.
+ *
+ * @limits: Pointer to the structure containing the limits for the PLL parameters and
+ * divider values
+ * @pars: Pointer to the structure where the best calculated PLL parameters and divider
+ * values will be stored
+ * @freq_millihz: Target output frequency in millihertz
+ *
+ * This function calculates the best set of PLL parameters (M, K, P, S) and divider
+ * value (CSDIV) to achieve the desired frequency.
+ * There is no direct formula to calculate the PLL parameters and the divider value,
+ * as it's an open system of equations, therefore this function uses an iterative
+ * approach to determine the best solution. The best solution is one that minimizes
+ * the error (desired frequency - actual frequency).
+ *
+ * Return: true if a valid set of divider values is found, false otherwise.
+ */
+static __maybe_unused bool
+rzv2h_dsi_get_pll_parameters_values(const struct rzv2h_pll_div_limits *limits,
+				    struct rzv2h_plldsi_parameters *pars,
+				    u64 freq_millihz)
+{
+	struct rzv2h_plldsi_parameters p, best;
+
+	/* Initialize best error to maximum possible value */
+	best.error_millihz = S64_MAX;
+
+	for (p.csdiv = limits->csdiv.min; p.csdiv <= limits->csdiv.max; p.csdiv += 2) {
+		for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
+			u32 fref = OSC_CLK_IN_MEGA / p.p;
+
+			for (p.s = limits->s.min; p.s <= limits->s.max; p.s++) {
+				u16 two_pow_s = 1 << p.s;
+				u16 divider = two_pow_s * p.csdiv;
+
+				for (p.m = limits->m.min; p.m <= limits->m.max; p.m++) {
+					u64 output_m, output_k_range;
+					s64 pll_k, output_k;
+					u64 fvco, output;
+
+					/*
+					 * The frequency generated by the combination of the
+					 * PLL + divider is calculated as follows:
+					 *
+					 * Freq = Ffout / csdiv
+					 *
+					 * With:
+					 * Ffout = Ffvco / 2^(pll_s)
+					 * Ffvco = (pll_m + (pll_k / 65536)) * Ffref
+					 * Ffref = 24MHz / pll_p
+					 *
+					 * Freq can also be rewritten as:
+					 * Freq = Ffvco / (2^(pll_s) * csdiv))
+					 *      = Ffvco / divider
+					 *      = (pll_m * Ffref) / divider + ((pll_k / 65536) * Ffref) / divider
+					 *      = output_m + output_k
+					 *
+					 * Every parameter has been determined at this point, but pll_k.
+					 * Considering that:
+					 * -32768 <= pll_k <= 32767
+					 * Then:
+					 * -0.5 <= (pll_k / 65536) < 0.5
+					 * Therefore:
+					 * -Ffref / (2 * divider) <= output_k < Ffref / (2 * divider)
+					 */
+
+					/* Compute output M component (in mHz) */
+					output_m = DIV_ROUND_CLOSEST_ULL(p.m * fref * 1000ULL,
+									 divider);
+					/* Compute range for output K (in mHz) */
+					output_k_range = DIV_ROUND_CLOSEST_ULL(fref * 1000ULL,
+									       divider * 2);
+					/*
+					 * No point in continuing if we can't achieve the
+					 * desired frequency
+					 */
+					if (freq_millihz <  (output_m - output_k_range) ||
+					    freq_millihz >= (output_m + output_k_range))
+						continue;
+
+					/*
+					 * Compute the K component
+					 *
+					 * Since:
+					 * Freq = output_m + output_k
+					 * Then:
+					 * output_k = Freq - output_m
+					 *          = ((pll_k / 65536) * Ffref) / divider
+					 * Therefore:
+					 * pll_k = (output_k * 65536 * divider) / Ffref
+					 */
+					output_k = freq_millihz - output_m;
+					pll_k = div64_s64(output_k * 65536ULL * divider, fref);
+					pll_k = DIV_S64_ROUND_CLOSEST(pll_k, 1000);
+
+					/* Validate K value within allowed limits */
+					if (pll_k < limits->k.min || pll_k > limits->k.max)
+						continue;
+
+					p.k = pll_k;
+
+					/* Compute (Ffvco * 65536) */
+					fvco = ((p.m * 65536ULL) + p.k) * fref;
+					if ((fvco < (limits->fvco.min * 65536ULL)) ||
+					    (fvco > (limits->fvco.max * 65536ULL)))
+						continue;
+
+					/* PLL_M component of (output * 65536 * PLL_P) */
+					output = p.m * 65536ULL * OSC_CLK_IN_MEGA;
+					/* PLL_K component of (output * 65536 * PLL_P) */
+					output += p.k * OSC_CLK_IN_MEGA;
+					/* Make it in mHz */
+					output *= 1000ULL;
+					output /= 65536ULL * p.p * divider;
+
+					p.error_millihz = freq_millihz - output;
+					p.freq_millihz = output;
+
+					/* If an exact match is found, return immediately */
+					if (p.error_millihz == 0) {
+						*pars = p;
+						return true;
+					}
+
+					/* Update best match if error is smaller */
+					if (abs(best.error_millihz) > abs(p.error_millihz))
+						best = p;
+				}
+			}
+		}
+	}
+
+	/* If no valid parameters were found, return false */
+	if (best.error_millihz == S64_MAX)
+		return false;
+
+	*pars = best;
+	return true;
+}
+
+#endif	/* __RENESAS_RZV2H_DSI_H__ */
-- 
2.49.0


