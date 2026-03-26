Return-Path: <linux-renesas-soc+bounces-30332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMHvItITxWnr6QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 12:09:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD1133413B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 12:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5A763036A1E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 11:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1253C3CEB95;
	Thu, 26 Mar 2026 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaF5azWm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2217A3C0601
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523219; cv=none; b=DfvVP1KmZgJNidEPUaZSQ68Hpf+OrRypoCrzUz6RRDnIH9X7XP3jyDRYBvMnJ6ABULS7L9HTMBcMW+3HbWS6I3J61VmqXI36JwASueJiG/QNg1J8ql3XpZD9esJ2xV7nsG+VyPQBI/Xx805xessNEUN5r4DV/dKCMJYak1ZFRyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523219; c=relaxed/simple;
	bh=arn5HClnex4ztJY8NzsZOx9RaKBK1AJTWQ4vxAT8AJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZuliL3IjIDlhND+PkEGcBhX4dZQrldO3ihNM9M3n/EF0r6XSusOvSTIm1J3T+Kb69nxPiJPMEISXeRK8wP+Oa+xm5JKeUDBmgLC03vK38DAe4JUH1gjMp4yWAp2Iu+YKNRgPHBvgUP288k6UhaMRyEdvYliH8oECknaAS9ucPPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaF5azWm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b527ac5d0so423997f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523215; x=1775128015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ubjOyfRu2oNNXiTKIdMs7ljhqTbAjL4gFoKhUEC4/k=;
        b=eaF5azWm4CqDhpmM0ttb9UT0k8GKtesjXBJYpBU+TW9KPBnw/VH2XxNww+Z4ziAUNr
         Q4opiKCzhzO/8GraircQ9ktePNI4n2rg48l0RNQT6glfsPtaThfVt8eK1bYtwZ+rariH
         2M5B33/RXRaaNWEjPSwhxlruwS1jsR1votVFd1cb/YXWSfVRPhqbBLM+cblPdzzC5lCl
         tplLlr3rZr2EZTIPA93ghJDcVINyeTcrPn3RwS+zSQ2JMn4UzU7B68pI11SrNcr+3KkS
         cjIPjPX3QK/atmD/hfK+g48grMJcvRQSBsEiw2UJReIoJILo04eVd+tmruJTki2/s/i7
         /qtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523215; x=1775128015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ubjOyfRu2oNNXiTKIdMs7ljhqTbAjL4gFoKhUEC4/k=;
        b=EwZB/UvEx4OqmGQNj72Xq4xkDxJaOp8h83VWoyzDUE0Ab+1IMnJsLbiqMe7SHcstkC
         77cafI6lN3O9i8BZ1Rf4T0QiAeAqqIhuvCs/+A6YcphCPrzpU8y2TVqHz2Dej4a7UU4l
         hCx4omvChJkXI1qWD0JUSwigqYXfzc/u46w2uMPyum7IaktN5LWGJCRQXCcobpFzXu60
         FvnTiDOnjGLL5na01fakONQkJ9JAGfdIJuORiyzRyXPrbos+7JK7PoZGjLVCAv4ree31
         gb32fRj01Kl4gjO9yStjotFzAbBK0Z6Ee2gscpgEdhX0cRtkG0LPZP5q/oFmSSS5zI6r
         LW6A==
X-Forwarded-Encrypted: i=1; AJvYcCV0sLDq6E3vV4opzx1A8kHZfBtlObbW9Sa/pQjgM7ghia6T/OqKEEcJsIUlxBrqEaOIlyPLsFmrOEjch3S4pSDWPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7AUSgOAuJgk2wHwERZvwHLB9LQ3hbZ1vetNhu0VwdgvUWZSDW
	KP2krMfvr7Z13jyHPJt6hucoqm7+ZD5tImSvHOlhNcUPGdCQR1OeBK/g
X-Gm-Gg: ATEYQzy0T+U8/O+fOLMD9dDhYQtnVJ+9T4tg9V9c98+pzzsgyWQ75yINonPa1WAYNdw
	R0AYVhDWeTAg6uvPNIGBWwhYeYziRELQ95/lDmUw/Z50vJ42xhupkjYOE6eQyFTK5PsEpErjC8U
	rhOjMzCQ3nrfP/a3jWa3gPyYdlmhdzrwQvIvGZ20DWouu6W2r4YibqH8RZFvuBigeGiYX4dYNeE
	z7ybENavs4xLWRnBNoTt/Yb+mdx40AEe6LvF0jdU/bpboEPKKa3TIbIrJLYrX5sDrNZdd/4s/fL
	ZXSJhq7z5bQ/AmLMFgl4hvYNIYwXytC9XrCxwzbTi/wKlqy9y3HzmCNH3jijUs4ksrb/T1IOrtR
	urFPtiOq2tFsvcH5ls6CNABWDLGUIYT9fMhSuVUaVTBHSCYG6RswYTDhwsO3HHzt9sVmocYMzan
	XcBkoGC/o7APBjQPp/TjM5+71i7GSJw/HvcEGW/TApyWiqjmfKO37F5QEVq/U=
X-Received: by 2002:a05:6000:4285:b0:43b:4981:1ba3 with SMTP id ffacd0b85a97d-43b889ac081mr10483991f8f.2.1774523215123;
        Thu, 26 Mar 2026 04:06:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:377f:9a3e:6c94:560d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm8626084f8f.10.2026.03.26.04.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:06:54 -0700 (PDT)
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
Subject: [PATCH v5 4/4] clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs
Date: Thu, 26 Mar 2026 11:06:38 +0000
Message-ID: <20260326110648.29389-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-30332-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 2CD1133413B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset entries for the Gigabit Ethernet Interfaces
(GBETH 0-1) IPs found on the RZ/G3L SoC. This includes various dividers
and mux clocks needed by these two GBETH IPs. Also add tx, tx-180, rx,
rx-180, rmii, rmii-tx and rmii-rx clocks to r9a08g046_no_pm_mod_clk
table to avoid enabling both normal and rmii clocks by the PM framework.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Rebased to boot series.
v3->v4:
 * Updated commit description
 * Fixed mstop bit for eth1_clk_chi and eth0_{tx,rx}_i_rmii clocks
 * Added r9a08g046_no_pm_mod_clks to avoid PM framework enabling both
   rgmii and rmii clocks together as they are mutually exclusive.
 * Fixed checkpatch warning for more than 100 columns
v2->v3:
 * Added eth{0,1}_{tx,rx}_i_rmii clocks.
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 147 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |   6 ++
 2 files changed, 153 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 31d800e6bcda..f734e224a434 100644
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
 	{ 1, 8 },
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
@@ -107,6 +187,50 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
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
+					MSTOP(BUS_PERI_COM, BIT(3))),
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
+	DEF_COUPLED("eth0_tx_i_rmii",
+				R9A08G046_ETH0_CLK_TX_I_RMII, R9A08G046_CLK_ETHTX01, 0x57c, 12,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth0_rx_i_rmii",
+				R9A08G046_ETH0_CLK_RX_I_RMII, R9A08G046_CLK_ETHRX01, 0x57c, 12,
+					MSTOP(BUS_PERI_COM, BIT(2))),
+	DEF_COUPLED("eth1_tx_i_rmii",
+				R9A08G046_ETH1_CLK_TX_I_RMII, R9A08G046_CLK_ETHTX11, 0x57c, 13,
+					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_COUPLED("eth1_rx_i_rmii",
+				R9A08G046_ETH1_CLK_RX_I_RMII, R9A08G046_CLK_ETHRX11, 0x57c, 13,
+					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
 };
@@ -117,6 +241,8 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
+	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
 };
 
@@ -131,6 +257,23 @@ static const unsigned int r9a08g046_crit_resets[] = {
 	R9A08G046_DMAC_RST_ASYNC,
 };
 
+static const unsigned int r9a08g046_no_pm_mod_clks[] = {
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_TX_I,
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_TX_180_I,
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_RX_I,
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_RX_180_I,
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_RMII_I,
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_TX_I_RMII,
+	MOD_CLK_BASE + R9A08G046_ETH0_CLK_RX_I_RMII,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_TX_I,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_TX_180_I,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_RX_I,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_RX_180_I,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_RMII_I,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_TX_I_RMII,
+	MOD_CLK_BASE + R9A08G046_ETH1_CLK_RX_I_RMII,
+};
+
 const struct rzg2l_cpg_info r9a08g046_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a08g046_core_clks,
@@ -147,6 +290,10 @@ const struct rzg2l_cpg_info r9a08g046_cpg_info = {
 	.num_mod_clks = ARRAY_SIZE(r9a08g046_mod_clks),
 	.num_hw_mod_clks = R9A08G046_BSC_X_BCK_BSC + 1,
 
+	/* No PM modules Clocks */
+	.no_pm_mod_clks = r9a08g046_no_pm_mod_clks,
+	.num_no_pm_mod_clks = ARRAY_SIZE(r9a08g046_no_pm_mod_clks),
+
 	/* Resets */
 	.resets = r9a08g046_resets,
 	.num_resets = R9A08G046_BSC_X_PRESET_BSC + 1, /* Last reset ID + 1 */
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index ebd612d117c0..0e63b62e8435 100644
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


