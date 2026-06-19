Return-Path: <linux-renesas-soc+bounces-34254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +SbFMmpyNWp8wgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:46:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB7B6A71F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:46:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HgCeH42H;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DD7130A6F43
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 16:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E23A3C109B;
	Fri, 19 Jun 2026 16:40:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE5D3BAD81
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 16:40:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887240; cv=none; b=Y7Vc6jycpoV++ycRm5QRNtuKOh+SPBz42oJaNgqtDbx6uPLgNGUheJiwkf14IQXT5q+FiYiTwoF1I3F4uIAvH2DkWe76cFC1W7ikn/VmyvIzZvbHHLOoFRlgd/KgW33Vh/v+zmJdgefB0A3V3Bdg7Sg6pZNctXFNDBnepUt4vFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887240; c=relaxed/simple;
	bh=Zn3XSG6hORLHNRjcjaj7meWx5dZSZuc1hEl6CSLfPSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgw4x3UvQ09OQkvgHZSgzZITkAQnPgLRLjTXvxbkpNYIAQvhl+7qf67H7iu+1TJzkL33xEFQz0Rc8j3kWmEjeHZmbDmIvh5OPQL9vCQ3y7NXzexzk7vfT/J5kFqI4DKAm8eLuLEiZCJRdY79h3jUJDVW8oTn5aUKgYV/xT02YNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgCeH42H; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so25733525e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 09:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781887237; x=1782492037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIEqkoD6iwL+1n5stloA1apOPaM0oCjUyYTN0fhMHWw=;
        b=HgCeH42HaQs3mV1tRBW0I0nlGKndZtr7Mw6IvizBaSnCtffD7UGGAfE7hZnN3iimq8
         RWj8q6/WY9wgYAn94OVWprSzdOXzGLWWGL/J8Tq3PTIPkQ81Y6SKChtHotKdbI+iJZ6L
         ZFpCiphL5FGGcDoiLbEdK+M1hw+4O33154b+QaqzNhW+qBvgX2rxuIBqiyZyxawDXX3A
         sk+my972pPj/9G1h9jxQ6f4JAxnmwI7eOZ2Lr7XXbtvsRwJzF9jxoKEEYvCvjfkutuDw
         m//k23zFmcviaDeGE6Esxqwq+hzIITInBMp7j57jZ0bbJPMzJIf8lBce0nivs682WGg7
         Pfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887237; x=1782492037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JIEqkoD6iwL+1n5stloA1apOPaM0oCjUyYTN0fhMHWw=;
        b=V+DlMWLE5tBYTQg+ZDX7JmlNKFqrQEcH71hYGt2ftIGV4pJME/FX7hVkiUy/dJHBqX
         0O4IFXOen8/2fJbFOOrHxRSOEqyB9WnSKFSAwJ52ybMG2iRQe09mxOzmYOf0hRYOWiwd
         v3sS6F7UndencpSP9rkERc6NLCYSpSx4bt4xNt4RwpOMlgeJgfwvx3lwBZCIWLrzxWfb
         ktrybSmoRvh3iulESszGbhzMCGt3hlBv/87bNmfQSTufVbX2qFztuLsxxWTqhCdgu8me
         xocN0RqAula2mcVfoKKQC6hEZymppELi1blC9Qs+UMGTYeZeZFBTOs+loYt3138F8vMh
         DiwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Qy0BfjzcZaDtO/oiGndTgmb0Lqfgu6kT0esfLJWQIBSFlmIpjqS6BtkTOGyXYD3SlLEcPL/NZ5Fev5eXPJPXl6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXP0ToFFsJIfjno2pzulVwSUv1KhW66rk60WFQj2RgY2PBvTDG
	/P/YYUM7rpyUx+QJSEBvaQlu40AV8+826f1/LleN6Zulr15Y5BBTJ6nB
X-Gm-Gg: AfdE7cmdAIAZxCQC7MwONWw862T272ZODCLUfhR67sigJRpVFztCrW7uh3qCza7tALK
	/nH5V8DtuHdBeSoWqWVYsvOSUEI0NpZzh9+/Fg/HN/Orjw49FxUFl5gWOTg6sXIVtByO5FoVFIq
	bOEdHIi/5QaGABeQ/mmhXFgYc9tpCQZrXo+qihf6nlxETVPjxhdWCoU+wlVVUt9h1XbaXq7irjh
	McI0REF0GOtgPhV2hFqUbHKYWllDVnorz7oG3N6QBo+dDwPbXNNfrzBprSCde9HAwJK6eKO8R4a
	zBU8o/E7IbHBtOGYUNrCYpKU46pJRyqtR7GeHKq8eXQuQ4NAiPaoc9TSIoDj/4v1bkVsDHF6YJA
	vzX2uTZwTcNtgW77lyAEOa5V4olg04kAeSXVSCfvn5A1AByiFmvyEqhSgnNudgmj1NRhjQteozZ
	A69RL5289taLWW5Znrlu7g6xvIDuXbaiYxtfOlaA==
X-Received: by 2002:a05:600d:6451:20b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-492409fbebamr46521085e9.4.1781887236903;
        Fri, 19 Jun 2026 09:40:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:b387:a6c7:e8fd:bca5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221de7sm261621f8f.33.2026.06.19.09.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:40:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 4/6] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
Date: Fri, 19 Jun 2026 17:40:24 +0100
Message-ID: <20260619164030.380098-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34254-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid,init.name:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AB7B6A71F2

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for RZ/G3L DSI mux that supports 2 duty cycles.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 132 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |   9 +++
 2 files changed, 141 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f3a9d2675748..4b0aec804021 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -120,6 +120,11 @@
 #define RZG3L_PLL7_FSTD_DIV_MR_MIN	(8 * MEGA)
 #define RZG3L_PLL7_FSTD_DIV_MR_MAX	(16 * MEGA)
 
+#define CPG_PLLDSI_SMUX_LVDS_DUTY_NUM		4
+#define CPG_PLLDSI_SMUX_LVDS_DUTY_DEN		7
+#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM	1
+#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN	2
+
 /**
  * struct clk_hw_data - clock hardware data
  * @hw: clock hw
@@ -741,6 +746,20 @@ struct dsi_div_hw_data {
 
 #define to_dsi_div_hw_data(_hw)	container_of(_hw, struct dsi_div_hw_data, hw)
 
+/**
+ * struct rzg3l_dsi_mux_clk - PLL DSI MUX clock
+ *
+ * @priv: CPG private data
+ * @mux: mux clk
+ */
+struct rzg3l_dsi_mux_clk {
+	struct rzg2l_cpg_priv *priv;
+	struct clk_mux mux;
+};
+
+#define to_plldsi_clk_mux(_mux) \
+	container_of(_mux, struct rzg3l_dsi_mux_clk, mux)
+
 static unsigned long rzg2l_cpg_dsi_div_recalc_rate(struct clk_hw *hw,
 						   unsigned long parent_rate)
 {
@@ -1402,6 +1421,116 @@ static const struct clk_ops rzg3l_cpg_pll_ops = {
 	.recalc_rate = rzg3s_cpg_pll_clk_recalc_rate,
 };
 
+static u8 rzg3l_cpg_dsi_smux_get_parent(struct clk_hw *hw)
+{
+	return clk_mux_ops.get_parent(hw);
+}
+
+static int rzg3l_cpg_dsi_smux_set_parent(struct clk_hw *hw, u8 index)
+{
+	return clk_mux_ops.set_parent(hw, index);
+}
+
+static int rzg3l_cpg_dsi_smux_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	req->best_parent_rate = req->rate;
+
+	return 0;
+}
+
+static int rzg3l_cpg_dsi_smux_get_duty_cycle(struct clk_hw *hw,
+					     struct clk_duty *duty)
+{
+	u8 parent = clk_mux_ops.get_parent(hw);
+
+	/*
+	 * CDIV7_DSIx_CLK - LVDS path (div7) - duty 4/7.
+	 * CSDIV_DSIx - DSI/RGB path (csdiv) - duty 1/2.
+	 */
+	if (parent == 0) {
+		duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
+		duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;
+	} else {
+		duty->num = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM;
+		duty->den = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN;
+	}
+
+	return 0;
+}
+
+static int rzg3l_cpg_dsi_smux_set_duty_cycle(struct clk_hw *hw,
+					     struct clk_duty *duty)
+{
+	struct clk_hw *parent_hw;
+	u8 parent_idx;
+
+	/*
+	 * Select parent based on requested duty cycle:
+	 * - If duty > 50% (num/den > 1/2), select LVDS path (parent 0)
+	 * - Otherwise, select DSI/RGB path (parent 1)
+	 */
+	if (duty->num * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN >
+	    duty->den * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM)
+		parent_idx = 0;
+	else
+		parent_idx = 1;
+
+	if (parent_idx >= clk_hw_get_num_parents(hw))
+		return -EINVAL;
+
+	parent_hw = clk_hw_get_parent_by_index(hw, parent_idx);
+	if (!parent_hw)
+		return -EINVAL;
+
+	return clk_hw_set_parent(hw, parent_hw);
+}
+
+static const struct clk_ops rzg3l_cpg_dsi_smux_ops = {
+	.determine_rate = rzg3l_cpg_dsi_smux_determine_rate,
+	.get_parent = rzg3l_cpg_dsi_smux_get_parent,
+	.set_parent = rzg3l_cpg_dsi_smux_set_parent,
+	.get_duty_cycle = rzg3l_cpg_dsi_smux_get_duty_cycle,
+	.set_duty_cycle = rzg3l_cpg_dsi_smux_set_duty_cycle,
+};
+
+static struct clk * __init
+rzg3l_cpg_dsi_mux_clk_register(const struct cpg_core_clk *core,
+			       struct rzg2l_cpg_priv *priv)
+{
+	struct rzg3l_dsi_mux_clk *clk_hw_data;
+	struct clk_init_data init;
+	struct clk_hw *clk_hw;
+	int ret;
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+
+	init.name = core->name;
+	init.ops = &rzg3l_cpg_dsi_smux_ops;
+	init.flags = core->flag | CLK_SET_RATE_PARENT;
+	init.parent_names = core->parent_names;
+	init.num_parents = core->num_parents;
+
+	clk_hw_data->mux.reg = priv->base + GET_REG_OFFSET(core->conf);
+	clk_hw_data->mux.shift = GET_SHIFT(core->conf);
+	clk_hw_data->mux.mask = clk_div_mask(GET_WIDTH(core->conf));
+	clk_hw_data->mux.flags = core->mux_flags;
+	clk_hw_data->mux.lock = &priv->rmw_lock;
+
+	clk_hw = &clk_hw_data->mux.hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
 static inline bool
 rzg3l_dsi_compute_pll_parameters(struct rzg3l_plldsi_parameters *pars,
 				 struct rzg3l_plldsi_parameters *p,
@@ -1708,6 +1837,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_G3L_PLLDSI:
 		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3l_cpg_plldsi_ops);
 		break;
+	case CLK_TYPE_G3L_DSI_MUX:
+		clk = rzg3l_cpg_dsi_mux_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 6fea87d84dd6..b6faa78d379d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -148,6 +148,9 @@ enum clk_types {
 
 	/* Clock for G3L DSI divider */
 	CLK_TYPE_G3L_DSI_DIV,
+
+	/* Clock for G3L DSI clock source selector */
+	CLK_TYPE_G3L_DSI_MUX,
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -201,6 +204,12 @@ enum clk_types {
 		 .parent_names = _parent_names, \
 		 .num_parents = ARRAY_SIZE(_parent_names), \
 		 .mux_flags = CLK_MUX_READ_ONLY)
+#define DEF_G3L_SEL_DSI_MUX(_name, _id, _conf, _parent_names) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3L_DSI_MUX, .conf = _conf, \
+		 .parent_names = _parent_names, \
+		 .num_parents = ARRAY_SIZE(_parent_names), \
+		 .flag = CLK_SET_RATE_PARENT, \
+		 .mux_flags = CLK_MUX_HIWORD_MASK)
 #define DEF_SD_MUX(_name, _id, _conf, _sconf, _parent_names, _mtable, _clk_flags, _notifier) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SD_MUX, .conf = _conf, .sconf = _sconf, \
 		 .parent_names = _parent_names, \
-- 
2.43.0


