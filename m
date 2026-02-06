Return-Path: <linux-renesas-soc+bounces-27979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBpwBiDIhWnAGAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 11:53:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7BBFCD91
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 11:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF87A300D4D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 10:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7133939C4;
	Fri,  6 Feb 2026 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CD4V2d+y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D680E38F25E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375197; cv=none; b=QGXTJ4D1pXXk78BIFoNhKD0wRCStProl9PJRp7stIGlnjD5kZ19dI5gH7kpO5mnbmWt8l7Nzw0YqvI1ckFx5EECq++XTetHcQDvsPk+7ZhjGgW8A9HNLVtVPRUY/bXvtNBQv9XmmCkUL3OBb37E/inZtXAT7YlU9ysypFLfVToc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375197; c=relaxed/simple;
	bh=kjScV1T5/VdYayocYBA2dz1cbmi0EZoIfKkzXZdS0LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OllLtMktVCKVU9tEWzhyrLNzrh5iHqsf+1479PgnXT9Ypf7F8hUgF5yKX8vbCKKhslDkz6eTRC+f/1qktseeabOfFFQ40QWfgnWdtgKkmf+BlFJyfgshgQEBYFLsqGMpWecTJ5PwsrgNkiTWSve4cXZUi01Z9CcZdycCBy9gDEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CD4V2d+y; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1252395f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 02:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375195; x=1770979995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WmKsY8ayiw3/jo38sqRg0fzRnMmAiOhgs/UG6PFaCM=;
        b=CD4V2d+y5SBJELR8ZCbUSvJxPUtpp6Y2LQAwrYg0CT7MJb5TLfOnRUBYD+uXBAiFdc
         4P2mrNAYsWsjhBh0ffFhDh9sE8lAUPp8bfjXG9u01LCj/iN1Jd+g9K1I1pYSsce0FRx7
         ASGDQ9z32sjicKtQqQEfa7QpNvex7BcXdDq5msE7ojcVLEYBnAoHSlnJ7biKxzlU0NNA
         9yb9PetWRHHP83+YDehves7yJY6ZwoJLkU3T8NOWrLXeyOPq1ceEZO9fsXlYCmekSKSj
         ElP4B4/zGgeJIdnNRb+RxBSY61O8jJw9tjncNtIGuuWPYhmnSa3ENrRfjgJiX63+pDBE
         RiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375195; x=1770979995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1WmKsY8ayiw3/jo38sqRg0fzRnMmAiOhgs/UG6PFaCM=;
        b=ORM6WoN2pGZCTYq/ywB9PD0305e8prUeYu+OFmCUTmh2VJeSp+rkSj10gySMBnceUS
         uVTIifYmyNnaO7B6fuGHBhcYZ3bp3ocgvxbhxAAURf6F28yZxS/NE9yY8aQuLk93ewoH
         inqhqWm54kcXsWPnfHS1JIOVa61lmEeehvve/sP1ID/ZnpSDcwXwQZUZ9Ff/nuool/m/
         mvf/6nrOpJmlbAwoTm0L/tJErQsgASGkp7QPTXeehBOqYt1/lRxirJ9U/ZTGuzd3IME8
         FIpkgIFHA2IXczvSlshnQfx5K+xlqtGqzPyVPlPb0wn1JoLY4hp+ibn8h3+6S0zdoSCz
         T4UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBv76lj3bwiG1IlB13nu5UKuoAeDPh0Ekx1fpY2OqmZLwc7mxSHUlUDiWnrdwTZBINHLDgXpa11NP+V2bFjgCnsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl+CKcKFWx69eJqP4Wos18Urrl6yZ/Fg63Wo+qrYDVnVPyo01K
	aXfdZd8jCJRrru+ShmDnG3TUGbhsgojyWiScn/kHAmxZtQoN7NdRCdDj
X-Gm-Gg: AZuq6aJXceSoL8xJ+2R4ipAYUI0bf6j734h+ZytJY7hGtS/DTtJBml+8VusPXf2QAIf
	aWxaAYGlhCoB5clE/wD5BGWwqKFfB2alaGjdOiSMzQmbPoUWYaAkLibjzcyFgZXea3UvBYT7vof
	apOO5OScAXso/OtPHHtLzpMZzzV0ylO6lOy7Z2rjDKZsH4BTAAnJ1tk3d6tK2T3RV43Vk6dka35
	ADVGhDUH5Dn34P+771oQojc4HCrFKglehN5iI8rTgImGPGoVhkDAbOdbyBsTuRn1wEr7TI+pgRM
	dIgmR6TbkPZLiXnPRSGsuIrpyeX9EgxHId3uH+AKFeYK7RGmgjQh614cQD2fnuQZYQTWsU8JFnx
	BgjtbBRk8km7zb+30BiCm9V0f3392jZHDOam5sMvKnuns+hrGU01ZsdpSgfEoKealG3LtMapVu5
	8bzO2LWzIGsEE889Wcpg==
X-Received: by 2002:a05:6000:2c05:b0:435:9f1b:8d19 with SMTP id ffacd0b85a97d-436293889f5mr3853188f8f.38.1770375195145;
        Fri, 06 Feb 2026 02:53:15 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629730992sm4519611f8f.21.2026.02.06.02.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:53:14 -0800 (PST)
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
Subject: [PATCH v4 2/4] clk: renesas: rzg2l: Add support for enabling PLLs
Date: Fri,  6 Feb 2026 10:53:02 +0000
Message-ID: <20260206105312.231015-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
References: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27979-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC7BBFCD91
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for enabling PLL clocks in the RZ/G3L CPG driver to turn off
some PLLs, if they are not in use(eg: PLL6, PLL7)

Introduce `is_enabled` and `enable` callbacks to handle PLL state
transitions. With the `enable` callback, PLL will be turned ON only when
the PLL consumer device is enabled; otherwise, it will remain off. Define
new macros for PLL standby and monitor registers to facilitate this
process.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 67 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  4 ++
 2 files changed, 71 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 945e31c8f161..7e569a7c8fc2 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -58,6 +58,13 @@
 #define RZG3S_DIV_NF		GENMASK(12, 1)
 #define RZG3S_SEL_PLL		BIT(0)
 
+#define RZG3L_PLL_STBY_OFFSET(x)	(GET_REG_SAMPLL_CLK1(x) - 0x4)
+#define RZG3L_PLL_STBY_RESETB		BIT(0)
+#define RZG3L_PLL_STBY_RESETB_WEN	BIT(16)
+#define RZG3L_PLL_MON_OFFSET(x)		(GET_REG_SAMPLL_CLK1(x) + 0x8)
+#define RZG3L_PLL_MON_RESETB		BIT(0)
+#define RZG3L_PLL_MON_LOCK		BIT(4)
+
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
 #define CLK_RST_R(reg)		(reg)
@@ -1175,6 +1182,63 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	return pll_clk->hw.clk;
 }
 
+static int rzg3l_cpg_pll_clk_is_enabled(struct clk_hw *hw)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzg2l_cpg_priv *priv = pll_clk->priv;
+	u32 val = readl(priv->base + RZG3L_PLL_MON_OFFSET(pll_clk->conf));
+	u32 mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
+
+	/* Ensure both RESETB and LOCK bits are set */
+	return (mon_val == (val & mon_val));
+}
+
+static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzg2l_cpg_priv *priv = pll_clk->priv;
+	u32 stby_offset, mon_offset;
+	u32 val, mon_val;
+	int ret;
+
+	stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
+	mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
+
+	if (enable) {
+		val = RZG3L_PLL_STBY_RESETB_WEN | RZG3L_PLL_STBY_RESETB;
+		mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
+	} else {
+		val = RZG3L_PLL_STBY_RESETB_WEN;
+		mon_val = 0;
+	}
+
+	writel(val, priv->base + stby_offset);
+
+	/* ensure PLL is in normal/stanby mode */
+	ret = readl_poll_timeout_atomic(priv->base + mon_offset, val, mon_val ==
+					(val & (RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK)),
+					10, 100);
+	if (ret)
+		dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
+			"enable" : "disable", stby_offset, hw->clk);
+
+	return ret;
+}
+
+static int rzg3l_cpg_pll_clk_enable(struct clk_hw *hw)
+{
+	if (rzg3l_cpg_pll_clk_is_enabled(hw))
+		return 0;
+
+	return rzg3l_cpg_pll_clk_endisable(hw, true);
+}
+
+static const struct clk_ops rzg3l_cpg_pll_ops = {
+	.is_enabled = rzg3l_cpg_pll_clk_is_enabled,
+	.enable = rzg3l_cpg_pll_clk_enable,
+	.recalc_rate = rzg3s_cpg_pll_clk_recalc_rate,
+};
+
 static struct clk
 *rzg2l_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
 			       void *data)
@@ -1258,6 +1322,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_SAM_PLL:
 		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg2l_cpg_pll_ops);
 		break;
+	case CLK_TYPE_G3L_PLL:
+		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3l_cpg_pll_ops);
+		break;
 	case CLK_TYPE_G3S_PLL:
 		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3s_cpg_pll_ops);
 		break;
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 1db413bb433d..7de4cb7af1cc 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -123,6 +123,7 @@ enum clk_types {
 	CLK_TYPE_IN,		/* External Clock Input */
 	CLK_TYPE_FF,		/* Fixed Factor Clock */
 	CLK_TYPE_SAM_PLL,
+	CLK_TYPE_G3L_PLL,
 	CLK_TYPE_G3S_PLL,
 
 	/* Clock with divider */
@@ -152,6 +153,9 @@ enum clk_types {
 	DEF_TYPE(_name, _id, _type, .parent = _parent)
 #define DEF_SAMPLL(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SAM_PLL, .parent = _parent, .conf = _conf)
+#define DEF_G3L_PLL(_name, _id, _parent, _conf, _default_rate) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3L_PLL, .parent = _parent, .conf = _conf, \
+		 .default_rate = _default_rate)
 #define DEF_G3S_PLL(_name, _id, _parent, _conf, _default_rate) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3S_PLL, .parent = _parent, .conf = _conf, \
 		 .default_rate = _default_rate)
-- 
2.43.0


