Return-Path: <linux-renesas-soc+bounces-11822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C009AA00C6A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 17:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1BF818818CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 16:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB7E1FBCA8;
	Fri,  3 Jan 2025 16:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WbgHWyey"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C81F1FBC93
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 16:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922965; cv=none; b=IbSQzWOCNz7RhVXGn2rgU8LGO490X/gHG1MX8moYeh0e4tsxLJpnR4ZalvU3gks0R8uPCM3fPJqVP9qEJj+5QGFAk5fseTQcXPL7kTjNNPiFiy68UCicDLNGACpw/malPMp1OKNrImtgpxAIRzzuJ8dTXL1elVrxIphdUmX8cTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922965; c=relaxed/simple;
	bh=uVe044tSzn+iBY3oWxbYQnnkPgvXI2BHBiYgjVWZHnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VptjbNE9Qco+49ufBG8M7Xx83qwATKaht7es8F5RA6SgrJ6KPwPRDB5mH0NIsBSru0yBTexWmU2UeQRZZww+E6I6YWXWGoBGvw7zLSWx/PJc2Sf6xmXWzxIFyc4cUOUUNFe+Etn0Xyzq2hd5kUzqHVPf/EfyJrHjsI8s7PJHwSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WbgHWyey; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa696d3901bso1485494966b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jan 2025 08:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922961; x=1736527761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+fdv+kWy/ao4qfObA3tHqnlkpS/1mTWNa+BlMy47LU=;
        b=WbgHWyeyT9v5N8AtFrN7XhXaO1Ls48XxM8I78PDcS13oziMeEBXZRDR/3NpfTfPl0T
         dqoFRcBFvG10Mf7291A4pw9Wux0sUz1vZBEJxf8j3QlI3/OG96RdWCF/e7WgPymk0ej8
         7G/LEO5mCubNEWeAeuau4LlLCbmT/RpjiPE19WGKbF4GDUgTrX5ZfSAEf+pN30Gnt8FR
         cg4tsgaoGjO3gpq2ik2a5WayrZTLZ3aJmsmQAiBAQnOHbAEnsZ3wV+vBCZqz2lvkeRnw
         MwhTd3jeY94Yn6CG8TsSm+tS2x/kVx+4NolZMzFIcKvL8bsjcW7KBlHwt5knleMaSEPR
         cZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922961; x=1736527761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+fdv+kWy/ao4qfObA3tHqnlkpS/1mTWNa+BlMy47LU=;
        b=DSkxjLMw43rSSxAeV0yCu0XkNtDzRjLrR24LHjga6Te9x8gcD9es0qw9EKLXjnzdAu
         i+2z3KLp447QR8CkW/m2Fv24L+zgguqbrpcJDlnBa8mz1ndS7X9U6gPqCKw6odMl/tJS
         +8Wyumcc63AsJpgGCP+O3vfSkjiylx6pFwqDgCxisdeQV5fcPTD/Q9e1EgTXAAWK5/c2
         +zMQ4FwTpm1U+SeQc+CvLT52qsFOj4lISHjOvNZHUG5/oaZm5NPaxnkwxTIlZe/ON3/q
         csVLu0t/11tHgHAz+AOVMnoR4M7eyGNMLby1P7KUqWlZUA+NiTnOzrAnaebXLa6BNmR1
         sKNw==
X-Forwarded-Encrypted: i=1; AJvYcCUue0KX40qG+Ftztafk6d/eqZRVurnq/0mGFYjdp8t0m4mGeSDL4EMAIEwrRUjSRhSDIh9hGf88JG3OO+78w0Vnjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2VpN19pI/7lz1vq9s3axgrf3SDVrFSV0yjqoGlmU4KVmA9vGI
	Rccbs3ro6vFBDdgXEOnJ7oM7Lbf3URH6uazh3V6f006HBP4PvQxMcYhhpAZbfek=
X-Gm-Gg: ASbGncs44c21+hpaPbfIa+W3pq8xEesMB+YAqTUaqY5UYvfmnIguawvBS5VASQW7P8K
	uK0MEx6KH+FSMH0jwZtY480+ENE5QFrwgN2rZtUocaQiHtugMbzy+bOi+8ynK1hAREymZxVweRz
	KtxfnSmQIkExrekS/r80CdMxrLbT44fDhmdlzrqQQ2Sa2JmUZPuGFkqYVYCqte/2fZBUYNxH0Di
	IvEfpVj7jzijYAb9RznVckUALu3oKfL+B7poVrwMXBk3TUcf5X63XK9zmzhxftNCTzvrD7bAIiS
	Q4iweFlaz50=
X-Google-Smtp-Source: AGHT+IFg0hLfHcpxcKd+nJuxWf8zDpM3DGdyBuqGxtSTywmzbjqc02ILv+2l6LzMZ0B0UQkQZ3JVww==
X-Received: by 2002:a17:906:4fd5:b0:aa6:b473:ea4c with SMTP id a640c23a62f3a-aac28748b3dmr4872244066b.10.1735922960625;
        Fri, 03 Jan 2025 08:49:20 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4971sm1937601466b.107.2025.01.03.08.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:49:20 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r8a08g045: Check the source of the CPU PLL settings
Date: Fri,  3 Jan 2025 18:48:34 +0200
Message-ID: <20250103164834.1778090-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the RZ/G3S SoC, the CPU PLL settings can be set and retrieved through
the CPG_PLL1_CLK1 and CPG_PLL1_CLK2 registers. However, these settings are
applied only when CPG_PLL1_SETTING.SEL_PLL1 is set to 0. Otherwise, the
CPU PLL operates at the default frequency of 1.1 GHz. This patch adds
support to the PLL driver to return the 1.1 GHz frequency when the CPU PLL
is configured with the default frequency.

Fixes: 01eabef547e6 ("clk: renesas: rzg2l: Add support for RZ/G3S PLL")
Fixes: de60a3ebe410 ("clk: renesas: Add minimal boot support for RZ/G3S SoC")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c |  5 +++--
 drivers/clk/renesas/rzg2l-cpg.c     |  8 ++++++++
 drivers/clk/renesas/rzg2l-cpg.h     | 10 +++++++---
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 0e7e3bf05b52..df962d88c66e 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -51,7 +51,7 @@
 #define G3S_SEL_SDHI2		SEL_PLL_PACK(G3S_CPG_SDHI_DSEL, 8, 2)
 
 /* PLL 1/4/6 configuration registers macro. */
-#define G3S_PLL146_CONF(clk1, clk2)	((clk1) << 22 | (clk2) << 12)
+#define G3S_PLL146_CONF(clk1, clk2, settings)	((clk1) << 22 | (clk2) << 12 | (settings))
 
 #define DEF_G3S_MUX(_name, _id, _conf, _parent_names, _mux_flags, _clk_flags) \
 	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = (_conf), \
@@ -134,7 +134,8 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
-	DEF_G3S_PLL(".pll1", CLK_PLL1, CLK_EXTAL, G3S_PLL146_CONF(0x4, 0x8)),
+	DEF_G3S_PLL(".pll1", CLK_PLL1, CLK_EXTAL, G3S_PLL146_CONF(0x4, 0x8, 0x100),
+		    1100000000UL),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll4", CLK_PLL4, CLK_EXTAL, 100, 3),
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index ddf722ca79eb..b52a93973b11 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -51,6 +51,7 @@
 #define RZG3S_DIV_M		GENMASK(25, 22)
 #define RZG3S_DIV_NI		GENMASK(21, 13)
 #define RZG3S_DIV_NF		GENMASK(12, 1)
+#define RZG3S_SEL_PLL		BIT(0)
 
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
@@ -60,6 +61,7 @@
 #define GET_REG_OFFSET(val)		((val >> 20) & 0xfff)
 #define GET_REG_SAMPLL_CLK1(val)	((val >> 22) & 0xfff)
 #define GET_REG_SAMPLL_CLK2(val)	((val >> 12) & 0xfff)
+#define GET_REG_SAMPLL_SETTINGS(val)	((val) & 0xfff)
 
 #define CPG_WEN_BIT		BIT(16)
 
@@ -943,6 +945,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
 
 struct pll_clk {
 	struct clk_hw hw;
+	unsigned long default_rate;
 	unsigned int conf;
 	unsigned int type;
 	void __iomem *base;
@@ -986,6 +989,10 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	if (pll_clk->type != CLK_TYPE_G3S_PLL)
 		return parent_rate;
 
+	val = readl(priv->base + GET_REG_SAMPLL_SETTINGS(pll_clk->conf));
+	if (val & RZG3S_SEL_PLL)
+		return pll_clk->default_rate;
+
 	val = readl(priv->base + GET_REG_SAMPLL_CLK1(pll_clk->conf));
 
 	pr = 1 << FIELD_GET(RZG3S_DIV_P, val);
@@ -1038,6 +1045,7 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	pll_clk->base = priv->base;
 	pll_clk->priv = priv;
 	pll_clk->type = core->type;
+	pll_clk->default_rate = core->default_rate;
 
 	ret = devm_clk_hw_register(dev, &pll_clk->hw);
 	if (ret)
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 881a89b5a710..b74c94a16986 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -102,7 +102,10 @@ struct cpg_core_clk {
 	const struct clk_div_table *dtable;
 	const u32 *mtable;
 	const unsigned long invalid_rate;
-	const unsigned long max_rate;
+	union {
+		const unsigned long max_rate;
+		const unsigned long default_rate;
+	};
 	const char * const *parent_names;
 	notifier_fn_t notifier;
 	u32 flag;
@@ -144,8 +147,9 @@ enum clk_types {
 	DEF_TYPE(_name, _id, _type, .parent = _parent)
 #define DEF_SAMPLL(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SAM_PLL, .parent = _parent, .conf = _conf)
-#define DEF_G3S_PLL(_name, _id, _parent, _conf) \
-	DEF_TYPE(_name, _id, CLK_TYPE_G3S_PLL, .parent = _parent, .conf = _conf)
+#define DEF_G3S_PLL(_name, _id, _parent, _conf, _default_rate) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3S_PLL, .parent = _parent, .conf = _conf, \
+		 .default_rate = _default_rate)
 #define DEF_INPUT(_name, _id) \
 	DEF_TYPE(_name, _id, CLK_TYPE_IN)
 #define DEF_FIXED(_name, _id, _parent, _mult, _div) \
-- 
2.43.0


