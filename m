Return-Path: <linux-renesas-soc+bounces-33476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nqKZArvRH2qJqQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:03:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BB6634F38
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:03:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dJe8MYrd;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7305D30F36C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29043F0A9B;
	Wed,  3 Jun 2026 06:57:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428FC3F411B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469863; cv=none; b=ggqOt1bhokDWUllEBfS7viknNbS9NQxjQB610E9cSjg/VinWp45FttpJFvbipoII7tWjfHPE3qrQ/yyFfyM0ihBJnjpjSithNtST1X/gUqav6hA4a/6/u4m6TM9sjtVYtYZO7E+7RnQETFNqLyvtVv16TtABiGswL+GEGKcJPbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469863; c=relaxed/simple;
	bh=Dm42WS7yRYc3FH5Q3+a0i4FgjkrzOhx91jwSv7eyPyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=punKHThhJAc9ga64KCl99OBjSIQKAPk/12HetmU21bWnJslXUYhYbdFKvZJisgX93UJH7lY7hyzVgycjfm6hFqKmQEmcojcZ2gQvEOfUt8HUv0Xvo01/syMUVVN4KJFxaeXBjq/nm5tp7ACPIGscJq9SDG8phCUmlx/rmXpSTpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJe8MYrd; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso6972185e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469858; x=1781074658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ivm20Ks+ZHfZt4Rm5ZO9KdkY9jbIechczVaaD9UKeFU=;
        b=dJe8MYrditDNfVlTIX7e7iti8tcp1mHp+UfMJZhJCgNpEsYMFG9y9qP5MOXtRwawU7
         ASGZAN1SEm7KObfxzO0eRATNSkd+K3ywMtUjvE5XeavSxD830tdiFqwKNL4/MM88HLlm
         FenuyPWMqeQViUsNmjJARa+7vLGtFFwDq0A0a6kESNJRblfhvF0YTHQmIG3Y+dV8ODb+
         uki+c0iinasNMePoeNQO76OauYfI17vJkDOIG+zp61SFh9IHT7yqNPA6ljrYcixqrSeU
         aRMR3+HCQgrEHeLMSadWStSGiZcdwWzMtYjOOhPEbewbheAJyWHgg5oeSkaETrtjrjHr
         dRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469858; x=1781074658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ivm20Ks+ZHfZt4Rm5ZO9KdkY9jbIechczVaaD9UKeFU=;
        b=PER6xKBrSI/axf8mzOsoerKOlzbD8ejdylNkEGBqXpwEIQItNKbvHjokshNPQInEUl
         gwAy/wx2PcWUETB1qId9Sylbx/U+ai/Nm/PjXdvAqKKEl/uNG5cIdYvzvgUbYn2EsmnK
         OwDCc0kF3urUPMI0SAdE4WdIqPaJ74jFmP5G44mSR8B1DwEOxvAoEDlN3HhOmgnkYPjI
         4X2mmWXZTdrIr9I38DELhXFkqh8SkNToxfUOr3WnNwyOKewwhzHEVyQkjjFS7h4VxSeb
         pMJ3wUSiZajcyDlr9YvCdO0x5sgBlGErju+lQueDbYpskNchvZvIlhqKvAlUNNI54/DA
         tkXg==
X-Forwarded-Encrypted: i=1; AFNElJ/0vv08dmEDo2JmPUyLDm+pA8uGULju+RRRcjnsvtY0nbJQW+Kx8GfN3vGelh8vKKgxLa+Srr/J3DOKwergoCjXwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNah9gdIarLbBu7Aaf6vBLLxZNR63Bsmz/yeqUkn3r0xGryyE6
	db/jjbVL7G/lC9DY225NGQQrH7CeHa1BjuWoe5i9b1i6mpiLYf1J1bdw
X-Gm-Gg: Acq92OEMFg++sqWgSaO/O5hMm5QNPMAFhXfBpzurH3qv/dT2IhNUYlKD0M5i2qxghEU
	MKaOwgzXMbQT0uBWhsNQruuuzvF/NNMerchbjP+6K71ID72G6PDb05VPel2hJKqW2pWrDtemOM+
	WW/tn4NR1ft55ldUKk1a7WrEPlfnD1Em7ikUXQaIvYnWLxmWTHNXi5YMjLDQjArTy/Fr2ZInWn0
	EWjHN6CIXtDGjDBtLdbRY+pSxywhtTUnCDKrgS5auIjJMc4rAcbKx8/Lgc2WChhqysxgD0chfmI
	Xlh/jZdPffkleRCfmw9QjI2C2JTdQ99yF3m6TeWZ0mDOpQrQy+HKavbQDohoyQjGx+ahR67/XI+
	9W05TEKiolV51lb+MScaygixesteFNUa1nli+a4Wu2YF0frJQI/a+ObVVke5ZpnQtFpWp87UBfa
	gQiunOvDSyCNaP8RCaP2wZCKxUvU1FZHxp1mVBoRpTpRp3KoTmFXDwyh2qDg4=
X-Received: by 2002:a05:600c:c049:b0:490:b724:507d with SMTP id 5b1f17b1804b1-490b7245253mr16336485e9.11.1780469857511;
        Tue, 02 Jun 2026 23:57:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:37 -0700 (PDT)
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
Subject: [PATCH v17 02/17] clk: renesas: r9a08g046: Add clock and reset entries for SDHI
Date: Wed,  3 Jun 2026 07:57:02 +0100
Message-ID: <20260603065731.93243-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33476-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58BB6634F38

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset entries for SDHI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
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


