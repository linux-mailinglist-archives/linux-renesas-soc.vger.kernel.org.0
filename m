Return-Path: <linux-renesas-soc+bounces-34255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uuZVNUFxNWrzwQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:41:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4386C6A7183
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:41:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BK744tnM;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B014301C924
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 16:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DDE3C1086;
	Fri, 19 Jun 2026 16:40:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FA63BED70
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 16:40:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887241; cv=none; b=H0X/IHeake6G+ZOqD5lK+TTz1YRBlzcARFNXhiNt06yY4b/cT390zW7MTHGDGQ+oMXAPBx+F8HWofkgn4cI4Np5gQcaqqRQ4e+9onAvydRL52/bOBblTkLdKdR7F3xZD1PBwCZsGevcy0ScM/3yhP+REvQIIl79Duyac4+z0P8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887241; c=relaxed/simple;
	bh=UcIVfzdJ2FRCzYWuWnsXD9f74aDMD2jh2jDBAoTGc4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iAYMHfcXGUNioRaD22RIHyDBd7qvs/GJVPx0HilAoEqhwKRKhVQdG426nE/QaMpr7n8ssc4YfCqqgCwdpXvVBZM3NyRszNJlnyNG3Ij0QLiqbb+7HzpjFlGv5FgOHuzgZbNbIrddyyfuxKjA2lgI5IJo0PhpiCTrCZMZVh7iIPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BK744tnM; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eeba68948so1709560f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 09:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781887238; x=1782492038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUwTTWNijNoauBYWMM4vxYqDdCaJI9gYC2Zi+pLS1Z0=;
        b=BK744tnMyYd7+rFAAEM+DH5asjqTVEkYfs9NdTt3nq1UuP8/x1ZbZ5AZRFlAcLMmHF
         Qim8jljno2qI6CxCdpMC9ii6VwroSVaw9KPMZswqIH0aZI0HsDVBFEMcRi/7AqdpG7KH
         EzUj9+fzlGaaqavFv9ua4HBtMBebGXV5yhIu08DKp9GGR7jP3rnixio4fMid+cTR6lva
         y/mCDZvp1ERyGLHoBbd+6XO9imIIOliuRTBjqI3p2oQiNvsgHJTG2H1NJa6Pt9r29j3V
         aDtYw0HyL7ymI3IcY7UQMG4zo31fEVFylq9aapF4LPH8PG2z5G+l3TAwjEls24/L7Ok3
         OI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887238; x=1782492038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pUwTTWNijNoauBYWMM4vxYqDdCaJI9gYC2Zi+pLS1Z0=;
        b=lEqiqFP7udo+WF+zoPBoh3n8IXDGSW1eC2bZuQzqZ3DOwTRNIeL/pW2Mdbht95Vq2t
         MZ+sfJ2+WyXTd+61hySyectLfY0w7GDPjJeLqendwq3Oo9IgUpftbfX0A9+nXDYSoTHo
         sKLQjD+rREewHoxlBJiVqAvzMcj5Trvo62HGNyjT5PZV8WlyjgpiaA6MZIITWRReFZ76
         3Lk7VctCNlA53E1EoSUr5Uir1phWz19SaQTEr2uxzxa7in4EzJ+RyonkuO9sqFiR/NtQ
         3+Srm98dsQxM6nlrHgqDXq6h5GGkmsgwnwcWAEDuM6gJNnyPa/8B5k/oQKzRG0G3tASp
         yM2w==
X-Forwarded-Encrypted: i=1; AFNElJ81M2Ulpr5gF3qGkI+KwWb1Tpttornot6EqF1x7bLLMqRtMpffWDgPz0XC8PDrRipPeWEoXjb3EOe2CQCv4iW6J2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAbL/q1olmSDDz0fgh8ioFv2t7TXxE1pX82MAbr/ObHqWoJuII
	oGhqFuQdf1CKiiPrMUbZPLuzjEPuuvhcY9Q8RII7uwkN6mwCFS5Lt1FK8h42+w==
X-Gm-Gg: AfdE7cmp00OD6N/3bMSgtMGsGCe3JVzqQnFfm4w/XPLTApxuHJ8iLoSZrYrfaqwG213
	llK+MgKDcw8E8NZ+1PprEuN2fnDmJB2v5qTRbNFFLWRPUPiqpendlZ67lX1UOQzlNNZddbBIK46
	/7h5Bm3qrT3d/XEJ+NjAvrShYZg3t1fYE5cntretalmGwUJZRiKRXL/v5zLRiugQoUNFwu4xlBV
	D9DAkuZGrohW0fevV2IcM3VsR0DtWLstUC5bYA/bW6XLt32gD2YTC36EEtm21LX/ZSUCrIjNwSc
	ycQfnfxorqntP/MHOMisFn+e7/5iAoeHkMJfjv0MLeAZQl+QwAlhHoAXPZFSVzHU9LESNeeyqCC
	OUahs2lI6ZA+kGMep7IAV3yVzXCNO9tuxF2WUKTdANjmxXbZpdYwpm2xNLFGqRXA+OI0FEO5wo6
	AoYYWlG3kQQqHYQLSdTb8XOf13xS29uRNDTZ+ymd5c/5YjHbra
X-Received: by 2002:a05:6000:2903:b0:460:1f32:628d with SMTP id ffacd0b85a97d-4650685a360mr8191628f8f.11.1781887237686;
        Fri, 19 Jun 2026 09:40:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:b387:a6c7:e8fd:bca5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221de7sm261621f8f.33.2026.06.19.09.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:40:37 -0700 (PDT)
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
Subject: [PATCH 5/6] clk: renesas: r9a08g046-cpg: Add MIPI DSI and LCDC clock/reset entries
Date: Fri, 19 Jun 2026 17:40:25 +0100
Message-ID: <20260619164030.380098-6-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34255-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4386C6A7183

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset entries for the MIPI DSI and LCDC peripherals on the
RZ/G3L (R9A08G046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 62 +++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 4488bd1988e8..7cea2c6d2c42 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -19,22 +19,26 @@
 #define G3L_CPG_PL3_DDIV		(0x208)
 #define G3L_CPG_SDHI_DDIV		(0x218)
 #define G3L_CPG_GE3D_DDIV		(0x224)
+#define G3L_CPG_DSI_DDIV		(0x228)
 #define G3L_CPG_CA55CORE_DDIV		(0x234)
 #define G3L_CPG_RSCI_DDIV		(0x238)
 #define G3L_CPG_RSPI_DDIV		(0x23c)
 #define G3L_CPG_SDHI_DSEL		(0x244)
 #define G3L_CLKDIVSTATUS		(0x280)
 #define G3L_CLKSELSTATUS		(0x284)
+#define G3L_CPG_DSI_SSEL		(0x408)
 #define G3L_CPG_GE3D_SSEL		(0x40c)
 #define G3L_CPG_ETH_SSEL		(0x410)
 #define G3L_CPG_RSCI_SSEL		(0x414)
 #define G3L_CPG_RSPI_SSEL		(0x418)
+#define G3L_CPG_DSI_SDIV		(0x430)
 #define G3L_CPG_ETH_SDIV		(0x434)
 
 /* RZ/G3L Specific division configuration.  */
 #define G3L_DIVPL2A		DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
 #define G3L_DIVPL2B		DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
 #define G3L_DIVPL3A		DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
+#define G3L_DIVPL3B		DDIV_PACK(G3L_CPG_PL3_DDIV, 4, 2)
 #define G3L_DIV_SDHI0		DDIV_PACK(G3L_CPG_SDHI_DDIV, 0, 2)
 #define G3L_DIV_SDHI1		DDIV_PACK(G3L_CPG_SDHI_DDIV, 4, 2)
 #define G3L_DIV_SDHI2		DDIV_PACK(G3L_CPG_SDHI_DDIV, 8, 2)
@@ -54,11 +58,14 @@
 #define G3L_SDIV_ETH_B		DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
 #define G3L_SDIV_ETH_C		DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
 #define G3L_SDIV_ETH_D		DDIV_PACK(G3L_CPG_ETH_SDIV, 12, 1)
+#define G3L_SDIV_DSI_C_SET	DDIV_PACK(G3L_CPG_DSI_SDIV, 8, 1)
+#define G3L_DIV_DSI		DDIV_PACK(G3L_CPG_DSI_DDIV, 0, 2)
 
 /* RZ/G3L Clock status configuration. */
 #define G3L_DIVPL2A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
+#define G3L_DIVPL3B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 9, 1)
 #define G3L_DIV_CA55_CORE0_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 12, 1)
 #define G3L_DIV_CA55_CORE1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 13, 1)
 #define G3L_DIV_CA55_CORE2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 14, 1)
@@ -78,6 +85,7 @@
 #define G3L_SEL_SDHI1_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 17, 1)
 #define G3L_SEL_SDHI2_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 18, 1)
 #define G3L_DIV_GE3D_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 27, 1)
+#define G3L_DIV_DSI_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 28, 1)
 
 /* RZ/G3L Specific clocks select. */
 #define G3L_SEL_SDHI0		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 0, 2)
@@ -101,6 +109,7 @@
 #define G3L_SEL_RSPI0		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 0, 2)
 #define G3L_SEL_RSPI1		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 2, 2)
 #define G3L_SEL_RSPI2		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 4, 2)
+#define G3L_SEL_DSI		SEL_PLL_PACK(G3L_CPG_DSI_SSEL, 0, 1)
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
@@ -126,8 +135,11 @@ enum clk_ids {
 	CLK_PLL3_DIV2,
 	CLK_PLL3_DIV2_2,
 	CLK_PLL3_DIV3,
+	CLK_PLL3_DIV6,
 	CLK_PLL6,
 	CLK_PLL6_DIV10,
+	CLK_PLL7,
+	CLK_PLL7_DSI_SDIV,
 	CLK_SEL_ETH0_TX,
 	CLK_SEL_ETH0_RX,
 	CLK_SEL_ETH0_RM,
@@ -149,6 +161,7 @@ enum clk_ids {
 	CLK_ETH0_RM,
 	CLK_ETH1_TR,
 	CLK_ETH1_RM,
+	CLK_M2_DIV7,
 	CLK_SD0_DIV2,
 	CLK_SD1_DIV2,
 	CLK_SD2_DIV2,
@@ -165,6 +178,12 @@ static const struct clk_div_table dtable_1_4[] = {
 	{ 0, 0 },
 };
 
+static const struct clk_div_table dtable_1_2[] = {
+	{ 0, 1 },
+	{ 1, 2 },
+	{ 0, 0 },
+};
+
 static const struct clk_div_table dtable_1_8[] = {
 	{ 0, 1 },
 	{ 1, 2 },
@@ -220,7 +239,16 @@ static const struct clk_div_table dtable_8_256[] = {
 	{ 0, 0 },
 };
 
+static const struct clk_div_table dtable_16_128[] = {
+	{ 0, 16 },
+	{ 1, 32 },
+	{ 2, 64 },
+	{ 3, 128 },
+	{ 0, 0 },
+};
+
 /* Mux clock names tables. */
+static const char * const sel_dsi[] = { "M2_DIV7", ".pll7_dsi_div"};
 static const char * const sel_eth0_tx[] = { ".div_eth0_tr", "eth0_txc_tx_clk" };
 static const char * const sel_eth0_rx[] = { ".div_eth0_tr", "eth0_rxc_rx_clk" };
 static const char * const sel_eth0_rm[] = { ".pll6_div10", "eth0_rxc_rx_clk" };
@@ -254,6 +282,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, CPG_PLL_CONF(0x50, 0),
 		    500000000UL),
 	DEF_FIXED(".pll1_div2", CLK_PLL1_DIV2, CLK_PLL1, 1, 2),
+	DEF_G3L_PLLDSI(".pll7", CLK_PLL7, CLK_EXTAL, CPG_PLL_CONF(0x80, 0)),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll2_div2_4", CLK_PLL2_DIV2_4, CLK_PLL2_DIV2, 1, 4),
 	DEF_FIXED(".pll2_div5", CLK_PLL2_DIV5, CLK_PLL2, 1, 5),
@@ -262,6 +291,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 	DEF_FIXED(".pll3_div2_2", CLK_PLL3_DIV2_2, CLK_PLL3_DIV2, 1, 2),
 	DEF_FIXED(".pll3_div3", CLK_PLL3_DIV3, CLK_PLL3, 1, 3),
+	DEF_FIXED(".pll3_div6", CLK_PLL3_DIV6, CLK_PLL3, 1, 6),
 	DEF_FIXED(".pll6_div10", CLK_PLL6_DIV10, CLK_PLL6, 1, 10),
 	DEF_SD_MUX(".sel_sdhi0", CLK_SEL_SDHI0, G3L_SEL_SDHI0, G3L_SEL_SDHI0_STS, sel_sdhi,
 		   mtable_sd, 0, NULL),
@@ -283,6 +313,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_MUX(".sel_eth1_tx", CLK_SEL_ETH1_TX, G3L_SEL_ETH1_TX, sel_eth1_tx),
 	DEF_MUX(".sel_eth1_rx", CLK_SEL_ETH1_RX, G3L_SEL_ETH1_RX, sel_eth1_rx),
 	DEF_MUX(".sel_eth1_rm", CLK_SEL_ETH1_RM, G3L_SEL_ETH1_RM, sel_eth1_rm),
+	DEF_G3L_DSI_DIV(".pll7_dsi_div", CLK_PLL7_DSI_SDIV, CLK_PLL7, G3L_CPG_DSI_SDIV),
 	DEF_DIV(".div_eth0_tr", CLK_ETH0_TR, CLK_PLL6, G3L_SDIV_ETH_A, dtable_4_200),
 	DEF_DIV(".div_eth1_tr", CLK_ETH1_TR, CLK_PLL6, G3L_SDIV_ETH_C, dtable_4_200),
 	DEF_DIV(".div_eth0_rm", CLK_ETH0_RM, CLK_SEL_ETH0_RM, G3L_SDIV_ETH_B, dtable_2_20),
@@ -301,6 +332,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    dtable_8_256, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P1", R9A08G046_CLK_P1, CLK_PLL3_DIV2, G3L_DIVPL3A, G3L_DIVPL3A_STS,
 		    dtable_4_128, 0, 0, 0, NULL),
+	DEF_G3S_DIV("P2", R9A08G046_CLK_P2, CLK_PLL3_DIV2, G3L_DIVPL3B, G3L_DIVPL3B_STS,
+		    dtable_8_256, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
 		    dtable_4_128, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P13", R9A08G046_CLK_P13, CLK_SEL_RSCI0, G3L_DIV_RSCI0, G3L_DIV_RSCI0_STS,
@@ -329,6 +362,14 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED(".sd0_div2", CLK_SD0_DIV2, R9A08G046_CLK_SD0, 1, 2),
 	DEF_FIXED(".sd1_div2", CLK_SD1_DIV2, R9A08G046_CLK_SD1, 1, 2),
 	DEF_FIXED(".sd2_div2", CLK_SD2_DIV2, R9A08G046_CLK_SD2, 1, 2),
+	DEF_G3S_DIV("M1", R9A08G046_CLK_M1, CLK_PLL2_DIV6, G3L_DIV_DSI, G3L_DIV_DSI_STS,
+		    dtable_16_128, 0, 0, 0, NULL),
+	DEF_DIV_FLAGS("M2", R9A08G046_CLK_M2, CLK_PLL7, G3L_SDIV_DSI_C_SET, dtable_1_2,
+		      CLK_SET_RATE_PARENT, CLK_DIVIDER_ROUND_CLOSEST),
+	DEF_FIXED("M2_DIV7", CLK_M2_DIV7, R9A08G046_CLK_M2, 1, 7),
+	DEF_G3L_SEL_DSI_MUX("M3", R9A08G046_CLK_M3, G3L_SEL_DSI, sel_dsi),
+	DEF_FIXED("M4", R9A08G046_CLK_M4, CLK_PLL7, 1, 1),
+	DEF_FIXED("M5", R9A08G046_CLK_M5, CLK_PLL3_DIV6, 1, 2),
 	DEF_FIXED("HP", R9A08G046_CLK_HP, CLK_PLL6_DIV10, 1, 1),
 	DEF_MUX_FLAGS("ETHTX01", R9A08G046_CLK_ETHTX01, G3L_SEL_ETH0_CLK_TX_I, sel_eth0_clk_tx_i,
 		      CLK_SET_RATE_PARENT),
@@ -347,6 +388,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_G3S_DIV("G", R9A08G046_CLK_G, CLK_SEL_GE3D, G3L_DIV_GE3D, G3L_DIV_GE3D_STS,
 		    dtable_1_32, 0, 0, 0, NULL),
 	DEF_FIXED("OSCCLK", R9A08G046_OSCCLK, CLK_EXTAL, 1, 1),
+	DEF_FIXED("dsi_pllclk", R9A08G046_MIPI_DSI_PLLCLK, R9A08G046_CLK_M4, 1, 1),
 };
 
 static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
@@ -400,6 +442,22 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_VIDEO, BIT(12))),
 	DEF_MOD("ge3d_ace_clk",		R9A08G046_GE3D_ACE_CLK, R9A08G046_CLK_P1, 0x558, 2,
 					MSTOP(BUS_PERI_VIDEO, BIT(12))),
+	DEF_MOD("dsi_sysclk",		R9A08G046_MIPI_DSI_SYSCLK, R9A08G046_CLK_M5, 0x568, 1,
+					MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
+	DEF_MOD("dsi_aclk",		R9A08G046_MIPI_DSI_ACLK, R9A08G046_CLK_P1, 0x568, 2,
+					MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
+	DEF_MOD("dsi_pclk",		R9A08G046_MIPI_DSI_PCLK, R9A08G046_CLK_P2, 0x568, 3,
+					MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
+	DEF_MOD("dsi_vclk",		R9A08G046_MIPI_DSI_VCLK, R9A08G046_CLK_M3, 0x568, 4,
+					MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
+	DEF_MOD("dsi_lpclk",		R9A08G046_MIPI_DSI_LPCLK, R9A08G046_CLK_M1, 0x568, 5,
+					MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
+	DEF_MOD("lcdc_clk_a",		R9A08G046_LCDC_CLK_A, R9A08G046_CLK_P1, 0x56c, 0,
+					MSTOP(BUS_PERI_VIDEO, BIT(7) | BIT(8) | BIT(9))),
+	DEF_MOD("lcdc_clk_d",		R9A08G046_LCDC_CLK_D, R9A08G046_CLK_M3, 0x56c, 1,
+					MSTOP(BUS_PERI_VIDEO, BIT(7) | BIT(8) | BIT(9))),
+	DEF_MOD("lcdc_clk_p",		R9A08G046_LCDC_CLK_P, R9A08G046_CLK_P2, 0x56c, 2,
+					MSTOP(BUS_PERI_VIDEO, BIT(7) | BIT(8) | BIT(9))),
 	DEF_MOD("ssi0_pclk2",		R9A08G046_SSI0_PCLK2, R9A08G046_CLK_P0,	0x570, 0,
 					MSTOP(BUS_MCPU1, BIT(10))),
 	DEF_MOD("ssi0_pclk_sfr",	R9A08G046_SSI0_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 1,
@@ -537,6 +595,10 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_GE3D_RESETN, 0x858, 0),
 	DEF_RST(R9A08G046_GE3D_AXI_RESETN, 0x858, 1),
 	DEF_RST(R9A08G046_GE3D_ACE_RESETN, 0x858, 2),
+	DEF_RST(R9A08G046_MIPI_DSI_CMN_RSTB, 0x868, 0),
+	DEF_RST(R9A08G046_MIPI_DSI_ARESET_N, 0x868, 1),
+	DEF_RST(R9A08G046_MIPI_DSI_PRESET_N, 0x868, 2),
+	DEF_RST(R9A08G046_LCDC_RESET_N, 0x86c, 0),
 	DEF_RST(R9A08G046_SSI0_RST_M2_REG, 0x870, 0),
 	DEF_RST(R9A08G046_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A08G046_SSI2_RST_M2_REG, 0x870, 2),
-- 
2.43.0


