Return-Path: <linux-renesas-soc+bounces-33368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLSOA4cLG2qH+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:08:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A094D60DE77
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C3D7301B3C3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF753264D5;
	Sat, 30 May 2026 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPyuEcHF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CE933F8AD
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157314; cv=none; b=Uknr80uj6fo3QfSsir0F3U1y+UmUi2YCeSFVMbG/NRLOUyInna8BsXus9kkswriP7NNrhmRWBWwUQQRX5m3wglZkIcw6fIDOuCKzQJfEu4/KA75ey9TI1DxrRAbm9WjCRQ9MkOQN0GzhLiFsumS6sPoO1raKTE/z8XFDS1Kh9VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157314; c=relaxed/simple;
	bh=yVok12zJ6pkXd2JbmIH9j57MbvpuLpmDlwHO7XGGBzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3N9yKLiB2kABdgaOlCzEK268NiSUh54qPN7aV8ODcZWCAvkT5nubwlz7G+Q8Oe71L1AkjSnmSPh4ltzwTjpuKRbzW7b8Rks+pY8/l/cEg3u8iMAy2gF/PEYLf/Uj65jhe9GDEQnCW8zsWO+xy8uoumhK1xy62EcMzyCjIfxn9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPyuEcHF; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso1429220f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157311; x=1780762111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgIKGTQO7gPrOe26sxdu+A8xLu1XQ8EnCHCpNZxODoA=;
        b=LPyuEcHF4w02kR9lLEMRHyC0XJOrwwU+ZNvPmGkLJubOpgSPttz69Mav8LV1R8aHB/
         Lt+gxmA2ynSgXrDGFXO5OL660LvyHRmUrT5Rj3LIQKHHAyeVrMX7O/KtJuiDRbfMnTfm
         4tG+5uFTkg1xNq1xdhDPF9/l30UfMZ6eKpkeStDpax0PGjPoqLkVOp4Da5gOK3HeoFni
         THZH/7rmH/ZC/mfY0P6shvfW8HL0qTAfPY5BY0bUaESHCr0eeWPcnrH7Q2OyUEHy4iz4
         Z1Fk/lX3Pz/nkYKqsvXagXhdgkfDQqIuexfgFYrKL/8Hh1QUB/DhgpCWr5DDex7Tg+Sq
         YfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157311; x=1780762111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JgIKGTQO7gPrOe26sxdu+A8xLu1XQ8EnCHCpNZxODoA=;
        b=Y4q/hjSbliB8uOT8oXTBNthRPlPYRBANL/xaAciXKIjfGYX3SRPo1hq648PWnm3puD
         V7RkzoPhR25/6day7hTN851tfH1SYOZPpXaIQ3BniRlElOPGAWw51fsrVZzZBOg8k81h
         m9QUkdU9U1CeuDxqPKl/JdscoTWezQ27gV9TJ2Q48RGzhu+E9fkJP6vd0AFTI1Q5Nu5T
         IfcfyTLgGBgHNePhH9lWetW/qdNiS3cC1NlDnmUN0HHNXKLWncO1FOghiB+vjZ1pD1LK
         Io+EYALlQu31+4Tdu6/5DJeTLJFp3t4srQJcL39UNkHoJ0ZcItkmzrJvqwnFt6P4gq3M
         7xFg==
X-Forwarded-Encrypted: i=1; AFNElJ8o17yi8pVScsaJLRANfnuDEurEoit4BSCOA5/EziDaIIqVPryHwfSbF4yT/nV099wy2cbN4KaXcJunCG9IYhBzoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YytgVDXOI1g54azLFatygoio+g2cdLJCKFnNNi5fI/fnUaWy5OX
	u1N+wZcFQsNuVndgy+lNW3AxQRtmmJ2GYld70yB0+Xz+P6zghWdyaLRP
X-Gm-Gg: Acq92OEZXxrZNNg5+aIXcXQVCiMPmPgEkKHBdwZw+msDBdu7iTiOOuJw6CB+2AVLykI
	jW1zXaJpE9DKbbvf48AcQjrpcNlfpdUwq/E01+l36TWr+Z+AGEXBHX8Dhtuo33C962g5Zth2jEB
	2Rre6Ro2cVHZxQz6+qqBJ7cssm7h3lplIBJ8QPRdwrUuSdoalLgZhc0AkGOg5uM6iYvlZ1qj5YC
	sj0LcV08czubZgLw8Yj8zJCSw5Hdgv1va1ZEfNJggDkdoQTLj60OTlUWIXXhm/1gjt7dTNf6u6V
	NvLUPK6AyKtU8QuOxngXnEIT9gp3pluuwE2W71DwAeAxwErYoF7ytym9dU/pXMdsaIObOVMF1uz
	j2uj82fpyiPV/kbXmGv0pCRcfVAHrv7Kpi8PYBgtQ8WMRRzi/D+05+hJqCYKISeIp03w5+fNc2u
	KkMEq7xigRsq+jJD7NjOTZTXQWurtqmqx5gXPVWQN91/N3bx6Nq8hhef7RDWY=
X-Received: by 2002:a05:6000:1a54:b0:43d:7c1b:b8c7 with SMTP id ffacd0b85a97d-45ef6b4f243mr6227493f8f.21.1780157310749;
        Sat, 30 May 2026 09:08:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:30 -0700 (PDT)
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
Subject: [PATCH 02/17] clk: renesas: r9a08g046: Add clock and reset entries for SDHI
Date: Sat, 30 May 2026 17:07:56 +0100
Message-ID: <20260530160823.130907-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
References: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33368-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: A094D60DE77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset entries for SDHI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 92 +++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index a57638734ce7..272922b76e1e 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -17,10 +17,13 @@
 /* RZ/G3L Specific registers. */
 #define G3L_CPG_PL2_DDIV		(0x204)
 #define G3L_CPG_PL3_DDIV		(0x208)
+#define G3L_CPG_SDHI_DDIV		(0x218)
 #define G3L_CPG_CA55CORE_DDIV		(0x234)
 #define G3L_CPG_RSCI_DDIV		(0x238)
 #define G3L_CPG_RSPI_DDIV		(0x23c)
+#define G3L_CPG_SDHI_DSEL		(0x244)
 #define G3L_CLKDIVSTATUS		(0x280)
+#define G3L_CLKSELSTATUS		(0x284)
 #define G3L_CPG_ETH_SSEL		(0x410)
 #define G3L_CPG_RSCI_SSEL		(0x414)
 #define G3L_CPG_RSPI_SSEL		(0x418)
@@ -30,6 +33,9 @@
 #define G3L_DIVPL2A		DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
 #define G3L_DIVPL2B		DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
 #define G3L_DIVPL3A		DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
+#define G3L_DIV_SDHI0		DDIV_PACK(G3L_CPG_SDHI_DDIV, 0, 2)
+#define G3L_DIV_SDHI1		DDIV_PACK(G3L_CPG_SDHI_DDIV, 4, 2)
+#define G3L_DIV_SDHI2		DDIV_PACK(G3L_CPG_SDHI_DDIV, 8, 2)
 #define G3L_DIV_CA55_CORE0	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 0, 3)
 #define G3L_DIV_CA55_CORE1	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 4, 3)
 #define G3L_DIV_CA55_CORE2	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 8, 3)
@@ -61,8 +67,18 @@
 #define G3L_DIV_RSPI0_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 20, 1)
 #define G3L_DIV_RSPI1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 21, 1)
 #define G3L_DIV_RSPI2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 22, 1)
+#define G3L_DIV_SDHI0_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 24, 1)
+#define G3L_DIV_SDHI1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 25, 1)
+#define G3L_DIV_SDHI2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 26, 1)
+
+#define G3L_SEL_SDHI0_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 16, 1)
+#define G3L_SEL_SDHI1_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 17, 1)
+#define G3L_SEL_SDHI2_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 18, 1)
 
 /* RZ/G3L Specific clocks select. */
+#define G3L_SEL_SDHI0		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 0, 2)
+#define G3L_SEL_SDHI1		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 4, 2)
+#define G3L_SEL_SDHI2		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 8, 2)
 #define G3L_SEL_ETH0_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)
 #define G3L_SEL_ETH0_RX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 1, 1)
 #define G3L_SEL_ETH0_RM		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 2, 1)
@@ -94,6 +110,7 @@ enum clk_ids {
 
 	/* Internal Core Clocks */
 	CLK_PLL1,
+	CLK_PLL1_DIV2,
 	CLK_PLL2,
 	CLK_PLL2_DIV2,
 	CLK_PLL2_DIV2_4,
@@ -117,16 +134,29 @@ enum clk_ids {
 	CLK_SEL_RSPI0,
 	CLK_SEL_RSPI1,
 	CLK_SEL_RSPI2,
+	CLK_SEL_SDHI0,
+	CLK_SEL_SDHI1,
+	CLK_SEL_SDHI2,
 	CLK_ETH0_TR,
 	CLK_ETH0_RM,
 	CLK_ETH1_TR,
 	CLK_ETH1_RM,
+	CLK_SD0_DIV2,
+	CLK_SD1_DIV2,
+	CLK_SD2_DIV2,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
 };
 
 /* Divider tables */
+static const struct clk_div_table dtable_1_4[] = {
+	{ 0, 1 },
+	{ 1, 2 },
+	{ 2, 4 },
+	{ 0, 0 },
+};
+
 static const struct clk_div_table dtable_1_8[] = {
 	{ 0, 1 },
 	{ 1, 2 },
@@ -190,11 +220,15 @@ static const char * const sel_eth1_tx[] = { ".div_eth1_tr", "eth1_txc_tx_clk" };
 static const char * const sel_eth1_rx[] = { ".div_eth1_tr", "eth1_rxc_rx_clk" };
 static const char * const sel_eth1_rm[] = { ".pll6_div10", "eth1_rxc_rx_clk" };
 static const char * const sel_rsci_rspi[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };
+static const char * const sel_sdhi[] = { ".pll2_div2", ".pll1_div2",  ".pll6", ".pll2_div6" };
 static const char * const sel_eth0_clk_tx_i[] = { ".sel_eth0_tx", ".div_eth0_rm" };
 static const char * const sel_eth0_clk_rx_i[] = { ".sel_eth0_rx", ".div_eth0_rm" };
 static const char * const sel_eth1_clk_tx_i[] = { ".sel_eth1_tx", ".div_eth1_rm" };
 static const char * const sel_eth1_clk_rx_i[] = { ".sel_eth1_rx", ".div_eth1_rm" };
 
+/* Mux clock indices tables. */
+static const u32 mtable_sd[] = { 0, 1, 2, 3 };
+
 static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal", CLK_EXTAL),
@@ -210,6 +244,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
 	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, CPG_PLL_CONF(0x50, 0),
 		    500000000UL),
+	DEF_FIXED(".pll1_div2", CLK_PLL1_DIV2, CLK_PLL1, 1, 2),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll2_div2_4", CLK_PLL2_DIV2_4, CLK_PLL2_DIV2, 1, 4),
 	DEF_FIXED(".pll2_div5", CLK_PLL2_DIV5, CLK_PLL2, 1, 5),
@@ -217,6 +252,12 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED(".pll2_div7", CLK_PLL2_DIV7, CLK_PLL2, 1, 7),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 	DEF_FIXED(".pll6_div10", CLK_PLL6_DIV10, CLK_PLL6, 1, 10),
+	DEF_SD_MUX(".sel_sdhi0", CLK_SEL_SDHI0, G3L_SEL_SDHI0, G3L_SEL_SDHI0_STS, sel_sdhi,
+		   mtable_sd, 0, NULL),
+	DEF_SD_MUX(".sel_sdhi1", CLK_SEL_SDHI1, G3L_SEL_SDHI1, G3L_SEL_SDHI1_STS, sel_sdhi,
+		   mtable_sd, 0, NULL),
+	DEF_SD_MUX(".sel_sdhi2", CLK_SEL_SDHI2, G3L_SEL_SDHI2, G3L_SEL_SDHI2_STS, sel_sdhi,
+		   mtable_sd, 0, NULL),
 	DEF_MUX(".sel_rsci0", CLK_SEL_RSCI0, G3L_SEL_RSCI0, sel_rsci_rspi),
 	DEF_MUX(".sel_rsci1", CLK_SEL_RSCI1, G3L_SEL_RSCI1, sel_rsci_rspi),
 	DEF_MUX(".sel_rsci2", CLK_SEL_RSCI2, G3L_SEL_RSCI2, sel_rsci_rspi),
@@ -264,6 +305,18 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    dtable_1_8, 0, 200000000UL, 0, NULL),
 	DEF_G3S_DIV("P19", R9A08G046_CLK_P19, CLK_SEL_RSPI2, G3L_DIV_RSPI2, G3L_DIV_RSPI2_STS,
 		    dtable_1_8, 0, 200000000UL, 0, NULL),
+	DEF_G3S_DIV("SD0", R9A08G046_CLK_SD0, CLK_SEL_SDHI0, G3L_DIV_SDHI0, G3L_DIV_SDHI0_STS,
+		    dtable_1_4, 800000000UL, 600000000UL, CLK_SET_RATE_PARENT,
+		    rzg3s_cpg_div_clk_notifier),
+	DEF_G3S_DIV("SD1", R9A08G046_CLK_SD1, CLK_SEL_SDHI1, G3L_DIV_SDHI1, G3L_DIV_SDHI1_STS,
+		    dtable_1_4, 800000000UL, 600000000UL, CLK_SET_RATE_PARENT,
+		    rzg3s_cpg_div_clk_notifier),
+	DEF_G3S_DIV("SD2", R9A08G046_CLK_SD2, CLK_SEL_SDHI2, G3L_DIV_SDHI2, G3L_DIV_SDHI2_STS,
+		    dtable_1_4, 800000000UL, 600000000UL, CLK_SET_RATE_PARENT,
+		    rzg3s_cpg_div_clk_notifier),
+	DEF_FIXED(".sd0_div2", CLK_SD0_DIV2, R9A08G046_CLK_SD0, 1, 2),
+	DEF_FIXED(".sd1_div2", CLK_SD1_DIV2, R9A08G046_CLK_SD1, 1, 2),
+	DEF_FIXED(".sd2_div2", CLK_SD2_DIV2, R9A08G046_CLK_SD2, 1, 2),
 	DEF_FIXED("HP", R9A08G046_CLK_HP, CLK_PLL6_DIV10, 1, 1),
 	DEF_MUX_FLAGS("ETHTX01", R9A08G046_CLK_ETHTX01, G3L_SEL_ETH0_CLK_TX_I, sel_eth0_clk_tx_i,
 		      CLK_SET_RATE_PARENT),
@@ -297,6 +350,36 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_REG0, BIT(0))),
 	DEF_MOD("wdt0_clk",		R9A08G046_WDT0_CLK, R9A08G046_OSCCLK, 0x548, 1,
 					MSTOP(BUS_REG0, BIT(0))),
+	DEF_MOD("sdhi0_imclk",		R9A08G046_SDHI0_IMCLK, CLK_SD0_DIV2, 0x554, 0,
+					MSTOP(BUS_PERI_COM, BIT(0))),
+	DEF_MOD("sdhi0_imclk2",		R9A08G046_SDHI0_IMCLK2, CLK_SD0_DIV2, 0x554, 1,
+					MSTOP(BUS_PERI_COM, BIT(0))),
+	DEF_MOD("sdhi0_clk_hs",		R9A08G046_SDHI0_CLK_HS, R9A08G046_CLK_SD0, 0x554, 2,
+					MSTOP(BUS_PERI_COM, BIT(0))),
+	DEF_MOD("sdhi0_iaclks",		R9A08G046_SDHI0_IACLKS, R9A08G046_CLK_P1, 0x554, 3,
+					MSTOP(BUS_PERI_COM, BIT(0))),
+	DEF_MOD("sdhi0_iaclkm",		R9A08G046_SDHI0_IACLKM, R9A08G046_CLK_P1, 0x554, 12,
+					MSTOP(BUS_PERI_COM, BIT(0))),
+	DEF_MOD("sdhi1_imclk",		R9A08G046_SDHI1_IMCLK, CLK_SD1_DIV2, 0x554, 4,
+					MSTOP(BUS_PERI_COM, BIT(1))),
+	DEF_MOD("sdhi1_imclk2",		R9A08G046_SDHI1_IMCLK2, CLK_SD1_DIV2, 0x554, 5,
+					MSTOP(BUS_PERI_COM, BIT(1))),
+	DEF_MOD("sdhi1_clk_hs",		R9A08G046_SDHI1_CLK_HS, R9A08G046_CLK_SD1, 0x554, 6,
+					MSTOP(BUS_PERI_COM, BIT(1))),
+	DEF_MOD("sdhi1_iaclks",		R9A08G046_SDHI1_IACLKS, R9A08G046_CLK_P1, 0x554, 7,
+					MSTOP(BUS_PERI_COM, BIT(1))),
+	DEF_MOD("sdhi1_iaclkm",		R9A08G046_SDHI1_IACLKM, R9A08G046_CLK_P1, 0x554, 13,
+					MSTOP(BUS_PERI_COM, BIT(1))),
+	DEF_MOD("sdhi2_imclk",		R9A08G046_SDHI2_IMCLK, CLK_SD2_DIV2, 0x554, 8,
+					MSTOP(BUS_PERI_COM, BIT(11))),
+	DEF_MOD("sdhi2_imclk2",		R9A08G046_SDHI2_IMCLK2, CLK_SD2_DIV2, 0x554, 9,
+					MSTOP(BUS_PERI_COM, BIT(11))),
+	DEF_MOD("sdhi2_clk_hs",		R9A08G046_SDHI2_CLK_HS, R9A08G046_CLK_SD2, 0x554, 10,
+					MSTOP(BUS_PERI_COM, BIT(11))),
+	DEF_MOD("sdhi2_iaclks",		R9A08G046_SDHI2_IACLKS, R9A08G046_CLK_P1, 0x554, 11,
+					MSTOP(BUS_PERI_COM, BIT(11))),
+	DEF_MOD("sdhi2_iaclkm",		R9A08G046_SDHI2_IACLKM, R9A08G046_CLK_P1, 0x554, 14,
+					MSTOP(BUS_PERI_COM, BIT(11))),
 	DEF_MOD("ssi0_pclk2",		R9A08G046_SSI0_PCLK2, R9A08G046_CLK_P0,	0x570, 0,
 					MSTOP(BUS_MCPU1, BIT(10))),
 	DEF_MOD("ssi0_pclk_sfr",	R9A08G046_SSI0_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 1,
@@ -412,6 +495,15 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
 	DEF_RST(R9A08G046_WDT0_PRESETN, 0x848, 0),
+	DEF_RST(R9A08G046_SDHI0_IXRST, 0x854, 0),
+	DEF_RST(R9A08G046_SDHI1_IXRST, 0x854, 1),
+	DEF_RST(R9A08G046_SDHI2_IXRST, 0x854, 2),
+	DEF_RST(R9A08G046_SDHI0_IXRSTAXIM, 0x854, 3),
+	DEF_RST(R9A08G046_SDHI0_IXRSTAXIS, 0x854, 4),
+	DEF_RST(R9A08G046_SDHI1_IXRSTAXIM, 0x854, 5),
+	DEF_RST(R9A08G046_SDHI1_IXRSTAXIS, 0x854, 6),
+	DEF_RST(R9A08G046_SDHI2_IXRSTAXIM, 0x854, 7),
+	DEF_RST(R9A08G046_SDHI2_IXRSTAXIS, 0x854, 8),
 	DEF_RST(R9A08G046_SSI0_RST_M2_REG, 0x870, 0),
 	DEF_RST(R9A08G046_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A08G046_SSI2_RST_M2_REG, 0x870, 2),
-- 
2.43.0


