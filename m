Return-Path: <linux-renesas-soc+bounces-27668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iZL0LDGdfGkLOAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:59:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBEEBA499
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4E923038515
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 11:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD8C37474D;
	Fri, 30 Jan 2026 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bo6JAlP/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D609737104A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774338; cv=none; b=uHKNyZ5LLK5mWXIPVWtdEP3gtiBnZs37JMS7Y2qXWRZ3z6wGmHVosB3ReLNq/lBMIiRnybSS35/a592IBSpIaRWvW+gdw+LOVX2W26rwuprXK1E/ynqeNG5aAREDqTUfV6R+KzZpvElgulVnzskop9A+HRhY/aSihivr3vmgDVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774338; c=relaxed/simple;
	bh=Wt36PN5bHjGIsRQN727yxFJttOtyQJFgvRYzNsGZ+a8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpL8dP11u4PvReZ1N0HH/7C/pCgF01t9k/wWuhpV9OO9vuuUTNLN6DGUggT6tkm9fsvIIMx1aYjfxQfAPqfrz7H7nht0kSVjqKFhc8mVsb8s1+tWjILmYGiJs/YfpmgwOkDgfQ3qzQzPDNzC10lzM8cu3FGUkUJv9RHuae2r9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bo6JAlP/; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so4747892a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 03:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769774334; x=1770379134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=na+ZDw0eAD/iSJmU7KFtSfYJdxr1nTFE8Fh4OeAd1ss=;
        b=bo6JAlP/ry7dpAEeJEZAviKVOtOi8llSR60XOIIJ0EGyrnWcJo4joG6BL+BAGdIqW/
         a60Ps/K1HtXREqjiJO7eNopTOpAOkhj/CBS7mNx7fr9ad+OjHKKu3cOG7511uJDaiNIl
         UtWsyiDMGKryyB5X+BBbXSBF+aKJ8du1oikSmnUxPVFLPjigwHhBhSVAhdfjFYaH+WZu
         5hy+wCGpVf6swijZ3OMqJXfc7Awd/ou/eF/6mleMHzg7Lo3sjuytHHgBNizQ1AMiS45A
         /W0jkmHoafvjxQAV2YsoxcyN/m2OMTrSEirmYIu276v5S+EREn6riW7ZTLGoGpH9G1nb
         7h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774334; x=1770379134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=na+ZDw0eAD/iSJmU7KFtSfYJdxr1nTFE8Fh4OeAd1ss=;
        b=Y88Nfe9/3XlMbGq3qPxb8JBc6Hm0Sv+vYiEYARZxNoUpvlvNRUUF4FD4jBT/alSxFG
         i82PQzLWf/mtK0kU+/7yJLWEvmJIk4tbUjz73reicYLXR/0cnxxQRGA3ZIBsc4c61euR
         G/K1oWUOlsezv31MLwayNqLDwRkD3IFJiDvHPN1IAUO55v2uHrDk1qlS3uUuE48aDxSJ
         ss6WbrQ1CYICtbJ5Hv9U3B+bCOtzpFIwpVlOiCL1fa+UmSVObcPv1IkplUCtLqJX0b8q
         zWY0c86fUxmD81SI+nrwxM0rQA8i44iiwid00Vm8DHiFAOsXRynaHseX+n9zweHFeXXx
         PUIw==
X-Forwarded-Encrypted: i=1; AJvYcCUiWr9HWdO/zDRY36NFNSrPLUYeK0U8SF3Jpg3kFg4Q42KpIJ83czpst9V1XA3dMnb+k4dKub4xAmWnfMpNAnBLuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzldZWZeGqmTMWXBOB7Z1EGLBGwn1JSf4BCNO9zk9+1FDncC8BW
	xtOEOGQwnarZvcO3Wuxja9XamsYUTXI8sIUKBi71oyK61l4P08anZ9eQ
X-Gm-Gg: AZuq6aKs+zrJWxpVolGk/zuGzTFIFDPAsN9YhhjDGMliOkNBS0whurIii1iizEEYgGx
	rh5Y2KdoHdyGJvmNqXnIJ58srbLkeBla0NvlI+LxzcSWbiosXadYHOwZ5ZDXrUVfdwG2fqftf9p
	AWlQ8a3VZut/yqCVxWcYlXCsBooay91YX487ghXIX6YIoBI/H4mhnYz+YF4CKeT/c93uB6loqNa
	nQzEJPpUnd91/hRhiuD9huY1Tecu0cfKVxLwKlcsjAe/Mt10PM5YYP63kb9jBNhbFxnxCnhIPV1
	in8ayODprgCmlY8NIFd2UFkpoEPRR/pZuw7cATwr4XMUj/jSjB2GEWekqAI479v/WQreNfRZLBl
	WhqNwXoKKu0vevDNCWDXfmDVi2KlVGglYnYDqaMrWny6J0D8OQjm8soIA9YP3KZat3pX6hLAu+Q
	k1G2QkPoIZ0sC1icSrT9aRBDGLoENU4MZdlA0=
X-Received: by 2002:a17:907:2d0e:b0:b88:1e2:ed49 with SMTP id a640c23a62f3a-b8dff22f549mr177830866b.8.1769774334208;
        Fri, 30 Jan 2026 03:58:54 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm404671566b.31.2026.01.30.03.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:58:53 -0800 (PST)
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
Subject: [PATCH v2 4/4] clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs
Date: Fri, 30 Jan 2026 11:58:45 +0000
Message-ID: <20260130115850.253555-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
References: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27668-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 4CBEEBA499
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset entries for the Gigabit Ethernet Interfaces
(GBETH 0-1) IPs found on the RZ/G3L SoC. This includes various dividers
and mux clocks needed by these two GBETH IPs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 114 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |   6 ++
 2 files changed, 120 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index cc7d3872e9e4..e74bab2df29a 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -18,17 +18,35 @@
 #define G3L_CPG_PL2_DDIV		(0x204)
 #define G3L_CPG_PL3_DDIV		(0x208)
 #define G3L_CLKDIVSTATUS		(0x280)
+#define G3L_CPG_ETH_SSEL		(0x410)
+#define G3L_CPG_ETH_SDIV		(0x434)
 
 /* RZ/G3L Specific division configuration.  */
 #define G3L_DIVPL2A		DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
 #define G3L_DIVPL2B		DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
 #define G3L_DIVPL3A		DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
+#define G3L_SDIV_ETH_A		DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
+#define G3L_SDIV_ETH_B		DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
+#define G3L_SDIV_ETH_C		DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
+#define G3L_SDIV_ETH_D		DDIV_PACK(G3L_CPG_ETH_SDIV, 12, 1)
 
 /* RZ/G3L Clock status configuration. */
 #define G3L_DIVPL2A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
 
+/* RZ/G3L Specific clocks select. */
+#define G3L_SEL_ETH0_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)
+#define G3L_SEL_ETH0_RX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 1, 1)
+#define G3L_SEL_ETH0_RM		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 2, 1)
+#define G3L_SEL_ETH0_CLK_TX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 3, 1)
+#define G3L_SEL_ETH0_CLK_RX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 4, 1)
+#define G3L_SEL_ETH1_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 8, 1)
+#define G3L_SEL_ETH1_RX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 9, 1)
+#define G3L_SEL_ETH1_RM		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 10, 1)
+#define G3L_SEL_ETH1_CLK_TX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 11, 1)
+#define G3L_SEL_ETH1_CLK_RX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 12, 1)
+
 /* PLL 1/4/6/7 configuration registers macro. */
 #define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
 
@@ -49,12 +67,29 @@ enum clk_ids {
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
 	CLK_PLL6,
+	CLK_PLL6_DIV10,
+	CLK_SEL_ETH0_TX,
+	CLK_SEL_ETH0_RX,
+	CLK_SEL_ETH0_RM,
+	CLK_SEL_ETH1_TX,
+	CLK_SEL_ETH1_RX,
+	CLK_SEL_ETH1_RM,
+	CLK_ETH0_TR,
+	CLK_ETH0_RM,
+	CLK_ETH1_TR,
+	CLK_ETH1_RM,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
 };
 
 /* Divider tables */
+static const struct clk_div_table dtable_2_20[] = {
+	{ 0, 2 },
+	{ 1, 20 },
+	{ 0, 0 },
+};
+
 static const struct clk_div_table dtable_4_128[] = {
 	{ 0, 4 },
 	{ 1, 2 },
@@ -63,6 +98,13 @@ static const struct clk_div_table dtable_4_128[] = {
 	{ 0, 0 },
 };
 
+static const struct clk_div_table dtable_4_200[] = {
+	{ 0, 4 },
+	{ 1, 20 },
+	{ 2, 200 },
+	{ 0, 0 },
+};
+
 static const struct clk_div_table dtable_8_256[] = {
 	{ 0, 8 },
 	{ 1, 16 },
@@ -71,6 +113,18 @@ static const struct clk_div_table dtable_8_256[] = {
 	{ 0, 0 },
 };
 
+/* Mux clock names tables. */
+static const char * const sel_eth0_tx[] = { ".div_eth0_tr", "eth0_txc_tx_clk" };
+static const char * const sel_eth0_rx[] = { ".div_eth0_tr", "eth0_rxc_rx_clk" };
+static const char * const sel_eth0_rm[] = { ".pll6_div10", "eth0_rxc_rx_clk" };
+static const char * const sel_eth1_tx[] = { ".div_eth1_tr", "eth1_txc_tx_clk" };
+static const char * const sel_eth1_rx[] = { ".div_eth1_tr", "eth1_rxc_rx_clk" };
+static const char * const sel_eth1_rm[] = { ".pll6_div10", "eth1_rxc_rx_clk" };
+static const char * const sel_eth0_clk_tx_i[] = { ".sel_eth0_tx", ".div_eth0_rm" };
+static const char * const sel_eth0_clk_rx_i[] = { ".sel_eth0_rx", ".div_eth0_rm" };
+static const char * const sel_eth1_clk_tx_i[] = { ".sel_eth1_tx", ".div_eth1_rm" };
+static const char * const sel_eth1_clk_rx_i[] = { ".sel_eth1_rx", ".div_eth1_rm" };
+
 static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal", CLK_EXTAL),
@@ -86,6 +140,17 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    500000000UL),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
+	DEF_FIXED(".pll6_div10", CLK_PLL6_DIV10, CLK_PLL6, 1, 10),
+	DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
+	DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
+	DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),
+	DEF_MUX(".sel_eth1_tx", CLK_SEL_ETH1_TX, G3L_SEL_ETH1_TX, sel_eth1_tx),
+	DEF_MUX(".sel_eth1_rx", CLK_SEL_ETH1_RX, G3L_SEL_ETH1_RX, sel_eth1_rx),
+	DEF_MUX(".sel_eth1_rm", CLK_SEL_ETH1_RM, G3L_SEL_ETH1_RM, sel_eth1_rm),
+	DEF_DIV(".div_eth0_tr", CLK_ETH0_TR, CLK_PLL6, G3L_SDIV_ETH_A, dtable_4_200),
+	DEF_DIV(".div_eth1_tr", CLK_ETH1_TR, CLK_PLL6, G3L_SDIV_ETH_C, dtable_4_200),
+	DEF_DIV(".div_eth0_rm", CLK_ETH0_RM, CLK_SEL_ETH0_RM, G3L_SDIV_ETH_B, dtable_2_20),
+	DEF_DIV(".div_eth1_rm", CLK_ETH1_RM, CLK_SEL_ETH1_RM, G3L_SDIV_ETH_D, dtable_2_20),
 
 	/* Core output clk */
 	DEF_G3S_DIV("P0", R9A08G046_CLK_P0, CLK_PLL2_DIV2, G3L_DIVPL2B, G3L_DIVPL2B_STS,
@@ -94,6 +159,21 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    dtable_4_128, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
 		    dtable_4_128, 0, 0, 0, NULL),
+	DEF_FIXED("HP", R9A08G046_CLK_HP, CLK_PLL6_DIV10, 1, 1),
+	DEF_MUX_FLAGS("ETHTX01", R9A08G046_CLK_ETHTX01, G3L_SEL_ETH0_CLK_TX_I, sel_eth0_clk_tx_i,
+		      CLK_SET_RATE_PARENT),
+	DEF_MUX_FLAGS("ETHRX01", R9A08G046_CLK_ETHRX01, G3L_SEL_ETH0_CLK_RX_I, sel_eth0_clk_rx_i,
+		      CLK_SET_RATE_PARENT),
+	DEF_MUX_FLAGS("ETHTX11", R9A08G046_CLK_ETHTX11, G3L_SEL_ETH1_CLK_TX_I, sel_eth1_clk_tx_i,
+		      CLK_SET_RATE_PARENT),
+	DEF_MUX_FLAGS("ETHRX11", R9A08G046_CLK_ETHRX11, G3L_SEL_ETH1_CLK_RX_I, sel_eth1_clk_rx_i,
+		      CLK_SET_RATE_PARENT),
+	DEF_FIXED("ETHRM0", R9A08G046_CLK_ETHRM0, CLK_ETH0_RM, 1, 1),
+	DEF_FIXED("ETHTX02", R9A08G046_CLK_ETHTX02, CLK_SEL_ETH0_TX, 1, 1),
+	DEF_FIXED("ETHRX02", R9A08G046_CLK_ETHRX02, CLK_SEL_ETH0_RX, 1, 1),
+	DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),
+	DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
+	DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX, 1, 1),
 };
 
 static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
@@ -107,6 +187,38 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_REG1, BIT(2))),
 	DEF_MOD("dmac_pclk",		R9A08G046_DMAC_PCLK, R9A08G046_CLK_P3, 0x52c, 1,
 					MSTOP(BUS_REG1, BIT(3))),
+	DEF_MOD("eth0_clk_axi",		R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_MOD("eth1_clk_axi",		R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_MOD("eth0_clk_chi",		R9A08G046_ETH0_CLK_CHI, R9A08G046_CLK_P1, 0x57c, 2,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_MOD("eth1_clk_chi",		R9A08G046_ETH1_CLK_CHI, R9A08G046_CLK_P1, 0x57c, 3,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth0_tx_i",	R9A08G046_ETH0_CLK_TX_I, R9A08G046_CLK_ETHTX01, 0x57c, 4,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth0_tx_180_i", R9A08G046_ETH0_CLK_TX_180_I, R9A08G046_CLK_ETHTX02, 0x57c, 4,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth1_tx_i",	R9A08G046_ETH1_CLK_TX_I, R9A08G046_CLK_ETHTX11, 0x57c, 5,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_COUPLED("eth1_tx_180_i", R9A08G046_ETH1_CLK_TX_180_I, R9A08G046_CLK_ETHTX12, 0x57c, 5,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_COUPLED("eth0_rx_i",	R9A08G046_ETH0_CLK_RX_I, R9A08G046_CLK_ETHRX01, 0x57c, 6,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth0_rx_180_i", R9A08G046_ETH0_CLK_RX_180_I, R9A08G046_CLK_ETHRX02, 0x57c, 6,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth1_rx_i",	R9A08G046_ETH1_CLK_RX_I, R9A08G046_CLK_ETHRX11, 0x57c, 7,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_COUPLED("eth1_rx_180_i", R9A08G046_ETH1_CLK_RX_180_I, R9A08G046_CLK_ETHRX12, 0x57c, 7,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_MOD("eth0_ptp_ref_i",	R9A08G046_ETH0_CLK_PTP_REF_I, R9A08G046_CLK_HP, 0x57c, 8,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_MOD("eth1_ptp_ref_i",	R9A08G046_ETH1_CLK_PTP_REF_I, R9A08G046_CLK_HP, 0x57c, 9,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_MOD("eth0_rmii_i",		R9A08G046_ETH0_CLK_RMII_I, R9A08G046_CLK_ETHRM0, 0x57c, 10,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_MOD("eth1_rmii_i",		R9A08G046_ETH1_CLK_RMII_I, R9A08G046_CLK_ETHRM1, 0x57c, 11,
+					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
 };
@@ -117,6 +229,8 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
+	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
 };
 
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 7de4cb7af1cc..9abb53483759 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -188,6 +188,12 @@ enum clk_types {
 		 .parent_names = _parent_names, \
 		 .num_parents = ARRAY_SIZE(_parent_names), \
 		 .mux_flags = CLK_MUX_READ_ONLY)
+#define DEF_MUX_FLAGS(_name, _id, _conf, _parent_names, _flag) \
+	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
+		 .parent_names = _parent_names, \
+		 .num_parents = ARRAY_SIZE(_parent_names), \
+		 .mux_flags = CLK_MUX_HIWORD_MASK, \
+		 .flag = _flag)
 #define DEF_SD_MUX(_name, _id, _conf, _sconf, _parent_names, _mtable, _clk_flags, _notifier) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SD_MUX, .conf = _conf, .sconf = _sconf, \
 		 .parent_names = _parent_names, \
-- 
2.43.0


