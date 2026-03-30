Return-Path: <linux-renesas-soc+bounces-30585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOg+GL98ymlo9QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:38:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B457935C1B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF706304DEB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9743D413D;
	Mon, 30 Mar 2026 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l14qBvGE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17C23D4126
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877036; cv=none; b=Wg1Irc7SogheDyQIBjKru/a6JeWsCw+nNyX3mKiroEugjij3PcQV9e/97E4cDFKKOvBKkm5M6BtTfrXdfFwzpmWBT+VFrWgF3v7mbXiNgnitUG4x8MA/GpkE2U2kZFWAUk7WJUwxZ0lecVn76YW36oYt6V0hjs2FwZy+ujBbZBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877036; c=relaxed/simple;
	bh=bRArHes47JWde1bC7egfGcbgnSM8Lx3eSPcdh05X4R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQbCfgphM5NMOoWjIVeEw596toaZBM7gKMk+dRwjZ9Z3fw7JnAciI2ZwejUgDHF88/nJUtr7aFRnwBJtyrJL/5d7Ij9PZR0571lH/ED6scra4r4SQ2ri4wRUTEbB2GRV3VVvv8r0dJoinah9BeiqpXDTVQUAJm/YOVsl/8KZ2vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l14qBvGE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cf7683a28so774495f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 06:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877033; x=1775481833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcvCEhkrttsFhRawb3q8Twe0Xk0/UhKtzUoezNsmPyw=;
        b=l14qBvGEPNPzP7FJKIpb+7ZBezdHPfvBt2/NIJk6Wb7CT4o3RLxF6wd2NlR/oJfnDY
         U7JAAA+Y58n148KFHmWVHovzDd1To129IviHQaNoKQ/X6d7H94AenmvCqhvx5Bwq92Je
         SpfL6XPaMSVPMDYzuCdZetvM8/jM0YSpt+u+ZErBxqbLddgyEtDz+oxw5Rknqfl315cs
         rmoY1P+ZmkoQc2amLuyKfPqgTFt+Uo2c7pAHabjRe4EBu/MJKoscPCd9Uzni4b2tFwTl
         PflgayuBn/pL6QWddqymL8qnZC/CUi9J5sTD6yBM602GLBhBuVwfNgIbrsHKMS9Ywc1C
         V9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877033; x=1775481833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NcvCEhkrttsFhRawb3q8Twe0Xk0/UhKtzUoezNsmPyw=;
        b=EZO4Txv2fffXH/Tkwt3mhhlTfCIJKrd/T0D5t4hN+9TikvfVZkQJ4A2OJn03O5DBJj
         GhE2XW+8TZaF5POn6027y2LVC8E5laS1Lo0sEDki2E1kRvyhT8SMeGIqpeB75rU/CKXT
         IaC5kvIaHnCQOuFQC6yeMsiGHTkOGLnl8gptyx317TJTcKsQ5gAP21eaBE2HOJeQsSbd
         ihTDWAWcMLXLTMbLT7n+O/WBHMz2zxhn7pkeEk7Tzb3m4CfD0bRW+yNt/HOfVngBoM4S
         WG1Hls8KRLvWelDPUhK73JwnxidDWZEG86IL8d5hXydEokXbEhITwZ6ch9tsBR1IlJO5
         G9NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqgtKz7SSQ64OydYFgHCmqv5FIYFMXApDDgmUuwOT5TMyH90ggmPNmICEqDMhUIcp22S9PUd6srYe1VyFbyN1JDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoG04ftvKquk3CD+lMz/clhiAvccg0XF9tzAclWBsyIzdoDff2
	05xsZMyVDLcBOM4aAOn3fKeQVjSyCkW21gcfjDIPXeA5qh6F6No4RSL9
X-Gm-Gg: ATEYQzy/ndS+OCNuZzOZRO9rmqCmZPKJyG7W1uVAjJjEaPf7Hl3eRSH0Y3R6lTkrtRi
	dyznDukDOS/QJ80hvxW5lz4G0n5DgSUqaF7fpeHeA7gRu6OQ1SxlU33x+g4RxPDgM85BPM1hQm2
	IZS4EgcoVtgsxxVrEApTSOyfoE+OSyZBQoPx6gx5StVNYf7xv0ZSmo5SuPd9z9eYdHdZ+X0sE03
	AyVKFwmU1bU4aye9c3B84MPWJruWbuJL5flxIQtol7g9UHlcg0/HJXFq2UGxxT0w1dwAxs3QrrF
	lG0BPyvnnO9S5bGC84ZDGAgvr/7P0KunxdQIcBl3woJuXAPw5H03lzK8cxOzueFxyX9em+KYVpZ
	zPYFYhGrVx2iy9GWwQ1f/RBWHlIkbmctfEfT4Jh/F4an8wOY4DYBNN86bRf4+WW661hrelvM9KI
	ygNuVtrWBghPnyPjqpQcb6uy0faloXBg==
X-Received: by 2002:a05:6000:1ac8:b0:43a:c70:6f0d with SMTP id ffacd0b85a97d-43b9e99039fmr23485564f8f.20.1774877033176;
        Mon, 30 Mar 2026 06:23:53 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20825906f8f.6.2026.03.30.06.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:23:52 -0700 (PDT)
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
Subject: [PATCH 2/5] clk: renesas: r9a08g046: Add CA55 core clocks
Date: Mon, 30 Mar 2026 14:23:39 +0100
Message-ID: <20260330132349.149391-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30585-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: B457935C1B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add CA55 core clock entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index d31572a99f73..4618c4d1d503 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -17,6 +17,7 @@
 /* RZ/G3L Specific registers. */
 #define G3L_CPG_PL2_DDIV		(0x204)
 #define G3L_CPG_PL3_DDIV		(0x208)
+#define G3L_CPG_CA55CORE_DDIV		(0x234)
 #define G3L_CLKDIVSTATUS		(0x280)
 #define G3L_CPG_ETH_SSEL		(0x410)
 #define G3L_CPG_ETH_SDIV		(0x434)
@@ -25,15 +26,24 @@
 #define G3L_DIVPL2A		DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
 #define G3L_DIVPL2B		DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
 #define G3L_DIVPL3A		DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
+#define G3L_DIV_CA55_CORE0	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 0, 3)
+#define G3L_DIV_CA55_CORE1	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 4, 3)
+#define G3L_DIV_CA55_CORE2	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 8, 3)
+#define G3L_DIV_CA55_CORE3	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 12, 3)
 #define G3L_SDIV_ETH_A		DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
 #define G3L_SDIV_ETH_B		DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
 #define G3L_SDIV_ETH_C		DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
 #define G3L_SDIV_ETH_D		DDIV_PACK(G3L_CPG_ETH_SDIV, 12, 1)
 
 /* RZ/G3L Clock status configuration. */
+#define G3L_DIVPL1_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 0, 1)
 #define G3L_DIVPL2A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
+#define G3L_DIV_CA55_CORE0_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 12, 1)
+#define G3L_DIV_CA55_CORE1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 13, 1)
+#define G3L_DIV_CA55_CORE2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 14, 1)
+#define G3L_DIV_CA55_CORE3_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 15, 1)
 
 /* RZ/G3L Specific clocks select. */
 #define G3L_SEL_ETH0_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)
@@ -62,6 +72,7 @@ enum clk_ids {
 	CLK_ETH1_RXC_RX_CLK_IN,
 
 	/* Internal Core Clocks */
+	CLK_PLL1,
 	CLK_PLL2,
 	CLK_PLL2_DIV2,
 	CLK_PLL3,
@@ -84,6 +95,16 @@ enum clk_ids {
 };
 
 /* Divider tables */
+static const struct clk_div_table dtable_1_32[] = {
+	{ 0, 1 },
+	{ 1, 2 },
+	{ 2, 4 },
+	{ 3, 8 },
+	{ 4, 16 },
+	{ 5, 32 },
+	{ 0, 0 },
+};
+
 static const struct clk_div_table dtable_2_20[] = {
 	{ 0, 2 },
 	{ 1, 20 },
@@ -134,6 +155,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_INPUT("eth1_rxc_rx_clk", CLK_ETH1_RXC_RX_CLK_IN),
 
 	/* Internal Core Clocks */
+	DEF_G3L_PLL(".pll1", CLK_PLL1, CLK_EXTAL, G3L_PLL1467_CONF(0x4, 0x8, 0x100),
+		    1200000000UL),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
 	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, G3L_PLL1467_CONF(0x54, 0x58, 0),
@@ -153,6 +176,14 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_DIV(".div_eth1_rm", CLK_ETH1_RM, CLK_SEL_ETH1_RM, G3L_SDIV_ETH_D, dtable_2_20),
 
 	/* Core output clk */
+	DEF_G3S_DIV("IC0", R9A08G046_CLK_IC0, CLK_PLL1, G3L_DIV_CA55_CORE0, G3L_DIV_CA55_CORE0_STS,
+		    dtable_1_32, 0, 0, 0, NULL),
+	DEF_G3S_DIV("IC1", R9A08G046_CLK_IC1, CLK_PLL1, G3L_DIV_CA55_CORE1, G3L_DIV_CA55_CORE1_STS,
+		    dtable_1_32, 0, 0, 0, NULL),
+	DEF_G3S_DIV("IC2", R9A08G046_CLK_IC2, CLK_PLL1, G3L_DIV_CA55_CORE2, G3L_DIV_CA55_CORE2_STS,
+		    dtable_1_32, 0, 0, 0, NULL),
+	DEF_G3S_DIV("IC3", R9A08G046_CLK_IC3, CLK_PLL1, G3L_DIV_CA55_CORE3, G3L_DIV_CA55_CORE3_STS,
+		    dtable_1_32, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P0", R9A08G046_CLK_P0, CLK_PLL2_DIV2, G3L_DIVPL2B, G3L_DIVPL2B_STS,
 		    dtable_8_256, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P1", R9A08G046_CLK_P1, CLK_PLL3_DIV2, G3L_DIVPL3A, G3L_DIVPL3A_STS,
-- 
2.43.0


