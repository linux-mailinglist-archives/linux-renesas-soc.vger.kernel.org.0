Return-Path: <linux-renesas-soc+bounces-32015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LRxId2Z+Wm2+AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:18:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F128B4C7C6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76A2A30733F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 07:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53433DC4D2;
	Tue,  5 May 2026 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozmHzlqS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB3B3DAC13
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 07:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965352; cv=none; b=ZeWJ21YqJIyHLuNIZpjfxkgddw3k5q5tmLppo6MKV6YGBRSZ1TcsBDuT/PWScx2vUI/O/bigtO/Pq5JrvC8JVRCCbVYhGt0454L9aveu0VxwJwW78et34jPTQMj/dIBk7e7vNRHWzZH06RDj0tFv1shlJnMsw6Gez2V/Q2Izcd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965352; c=relaxed/simple;
	bh=I8W31WgigRN/6bjSE8y2Fb1SfEfu9VSMaoepkFuDn9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IaoRGWzDKtyZRMnsgI1lcuiDB28QExoQrSa6zXDqab0R7swexweoJUcGSe/HCEbaApBGo1xlhk/Q1SfsJphgsDR6oVxz2ZwMnPXv312JShFKHTVcCu8ZzRXQwHqDG3gCAGkykGthaAAO0jodCfsBHbvuyYyyGYOB2zQvo2lxHWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ozmHzlqS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so46175745e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777965349; x=1778570149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ze+hCH6l7h3yY1sFZLeBkLCotjZyqMVrWvmS9n6Skk=;
        b=ozmHzlqSjJc2atKtC2vJbLICNBHhUuwGBe5XkHdVBHY/JsBz6nZ4HaX55qxu/TG360
         bVr3FXyxFQA99agjXjoVR3OV5QZNVLiH4anKTI9EWRFbOL4G89rZj67B/uyW5+fAvhQM
         M7d3LbiPc1FiPR+i2AYf+Cr2Q+v0M2yd6i66C6oHBT6T3mTmxpAd3ClTbQrxTgeoE9RT
         KB/FxAXzy/ku1vq8jsmxMW/hoL3ulB5my2tyrPnCcVKFC1c4UrlsU7VbNnYLKbKalcxv
         xuz0Ps7GEnTLQxFNzHQBeB7UcDdy2Y4Tm1FpNmeWDqZN9REGj9cH6O/mCQZnpMPR4kDj
         R89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777965349; x=1778570149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Ze+hCH6l7h3yY1sFZLeBkLCotjZyqMVrWvmS9n6Skk=;
        b=BNoJjmXkJebxRy8IRA4T78iH88QO2h+BCvvd7BSJG9D2v0uf+64NguodadqvPpTK4N
         2N3adyq0xZp+0c2TzgS9EaVxWd+f63eEEdBLd3+AD2e4Aqw+TdD9F4WBaAe6kKog5ZC7
         ++MRtEM8wKpP1XCJxEzKw97jJhfZYFIC9kgvukqU2qLHaL9DwkBb5+KsSx3XyT3uBQC5
         c3eKih5GILlWFFmdG0gKsecet+aoOUatVjUcbQ/UdoFNFE4kr80CPx2V2aHAv5SbV+Yi
         5Xuxg+z9BOzCTb/QzIXWM1pnLmMqRBNwHODpOll552b5SCl3EcgcRIEUn1iKGdxCvw8D
         /JeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/G7KB4lM9FC/mAvDVUy4mkRA0P+pegEPnpIyyfWDSFSuVrypeTUV4ssl0EBqufH0ClfUvW00fpPuBumgnJqO40Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlYEWCWejXV5joJADKpKaovYtkPCSxwEak1I8XtsEIK6+30O+h
	dQVOpMsttR3r/YVhjDusDFxCYymCGcXMn1cIjrKDvNIGZrzvw6a4aHlI
X-Gm-Gg: AeBDieuOfrnSvunw7XnWbPep1uImbe8LwOZ9kfE6OAqwil0emM9TQ8oGbKLc5QFXdcP
	Oi0qm/jN0Dbtvn/ARTY9HJjVGZHjWUjGJGavMoQ8Y1wnFOFVhfHzunhjU6BM7XWKjtSlhECUZB5
	RmIAmeKxlGoDJS1eEzLHG9v2E9WuaKW6qMQL7WRs6EGGRYRRkSg4wzTjaQW0XRTMRazWOH0H+Fy
	55iHmSr4yXb1E7jCtJUFx63uex8YCzUA5c5sBuW73K2o4pCyUuCnO/1fYSeYPtBkOEnlQZouLD1
	bHJSoTjAgifdtoSYWyGgHD4J2enraAImBmxE1LrpqFno6Z73KgFR/8/2oRTRI7FcUaUSGOyNnqy
	j8blODfNh9qr+JuuMei9C3GZQP5lmhpm8PyxvXLlajzIsI7kVgslrced3cumfb6NrleEpnNfuwL
	BfywnZEg7u9Ie+1Db3T/tNXcINn/olA2Lza+Q/WtuuUVRt4o9xDtIWCXnG3UY=
X-Received: by 2002:a05:600d:8496:10b0:48a:5970:1fe1 with SMTP id 5b1f17b1804b1-48a9887166emr125289515e9.4.1777965349059;
        Tue, 05 May 2026 00:15:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm352005845e9.3.2026.05.05.00.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:15:48 -0700 (PDT)
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
Subject: [PATCH 3/3] clk: renesas: r9a08g046: Add RSPI clock and reset support
Date: Tue,  5 May 2026 08:15:39 +0100
Message-ID: <20260505071544.8965-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505071544.8965-1-biju.das.jz@bp.renesas.com>
References: <20260505071544.8965-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F128B4C7C6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32015-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset definitions for the three RSPI (Serial
Peripheral Interface) channels on the RZ/G3L (R9A08G046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 50 +++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index d843629ffe47..f5952c9f73c2 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -19,9 +19,11 @@
 #define G3L_CPG_PL3_DDIV		(0x208)
 #define G3L_CPG_CA55CORE_DDIV		(0x234)
 #define G3L_CPG_RSCI_DDIV		(0x238)
+#define G3L_CPG_RSPI_DDIV		(0x23c)
 #define G3L_CLKDIVSTATUS		(0x280)
 #define G3L_CPG_ETH_SSEL		(0x410)
 #define G3L_CPG_RSCI_SSEL		(0x414)
+#define G3L_CPG_RSPI_SSEL		(0x418)
 #define G3L_CPG_ETH_SDIV		(0x434)
 
 /* RZ/G3L Specific division configuration.  */
@@ -36,6 +38,9 @@
 #define G3L_DIV_RSCI1		DDIV_PACK(G3L_CPG_RSCI_DDIV, 2, 2)
 #define G3L_DIV_RSCI2		DDIV_PACK(G3L_CPG_RSCI_DDIV, 4, 2)
 #define G3L_DIV_RSCI3		DDIV_PACK(G3L_CPG_RSCI_DDIV, 6, 2)
+#define G3L_DIV_RSPI0		DDIV_PACK(G3L_CPG_RSPI_DDIV, 0, 2)
+#define G3L_DIV_RSPI1		DDIV_PACK(G3L_CPG_RSPI_DDIV, 2, 2)
+#define G3L_DIV_RSPI2		DDIV_PACK(G3L_CPG_RSPI_DDIV, 4, 2)
 #define G3L_SDIV_ETH_A		DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
 #define G3L_SDIV_ETH_B		DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
 #define G3L_SDIV_ETH_C		DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
@@ -53,6 +58,9 @@
 #define G3L_DIV_RSCI1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 17, 1)
 #define G3L_DIV_RSCI2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 18, 1)
 #define G3L_DIV_RSCI3_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 19, 1)
+#define G3L_DIV_RSPI0_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 20, 1)
+#define G3L_DIV_RSPI1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 21, 1)
+#define G3L_DIV_RSPI2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 22, 1)
 
 /* RZ/G3L Specific clocks select. */
 #define G3L_SEL_ETH0_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)
@@ -69,6 +77,9 @@
 #define G3L_SEL_RSCI1		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 2, 2)
 #define G3L_SEL_RSCI2		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 4, 2)
 #define G3L_SEL_RSCI3		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 6, 2)
+#define G3L_SEL_RSPI0		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 0, 2)
+#define G3L_SEL_RSPI1		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 2, 2)
+#define G3L_SEL_RSPI2		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 4, 2)
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
@@ -103,6 +114,9 @@ enum clk_ids {
 	CLK_SEL_RSCI1,
 	CLK_SEL_RSCI2,
 	CLK_SEL_RSCI3,
+	CLK_SEL_RSPI0,
+	CLK_SEL_RSPI1,
+	CLK_SEL_RSPI2,
 	CLK_ETH0_TR,
 	CLK_ETH0_RM,
 	CLK_ETH1_TR,
@@ -113,6 +127,14 @@ enum clk_ids {
 };
 
 /* Divider tables */
+static const struct clk_div_table dtable_1_8[] = {
+	{ 0, 1 },
+	{ 1, 2 },
+	{ 2, 4 },
+	{ 3, 8 },
+	{ 0, 0 },
+};
+
 static const struct clk_div_table dtable_1_32[] = {
 	{ 0, 1 },
 	{ 1, 2 },
@@ -168,6 +190,7 @@ static const char * const sel_eth1_tx[] = { ".div_eth1_tr", "eth1_txc_tx_clk" };
 static const char * const sel_eth1_rx[] = { ".div_eth1_tr", "eth1_rxc_rx_clk" };
 static const char * const sel_eth1_rm[] = { ".pll6_div10", "eth1_rxc_rx_clk" };
 static const char * const sel_rsci[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };
+static const char * const sel_rspi[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };
 static const char * const sel_eth0_clk_tx_i[] = { ".sel_eth0_tx", ".div_eth0_rm" };
 static const char * const sel_eth0_clk_rx_i[] = { ".sel_eth0_rx", ".div_eth0_rm" };
 static const char * const sel_eth1_clk_tx_i[] = { ".sel_eth1_tx", ".div_eth1_rm" };
@@ -199,6 +222,9 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_MUX(".sel_rsci1", CLK_SEL_RSCI1, G3L_SEL_RSCI1, sel_rsci),
 	DEF_MUX(".sel_rsci2", CLK_SEL_RSCI2, G3L_SEL_RSCI2, sel_rsci),
 	DEF_MUX(".sel_rsci3", CLK_SEL_RSCI3, G3L_SEL_RSCI3, sel_rsci),
+	DEF_MUX(".sel_rspi0", CLK_SEL_RSPI0, G3L_SEL_RSPI0, sel_rspi),
+	DEF_MUX(".sel_rspi1", CLK_SEL_RSPI1, G3L_SEL_RSPI1, sel_rspi),
+	DEF_MUX(".sel_rspi2", CLK_SEL_RSPI2, G3L_SEL_RSPI2, sel_rspi),
 	DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
 	DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
 	DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),
@@ -233,6 +259,12 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    dtable_2_16, 0, 100000000UL, 0, NULL),
 	DEF_G3S_DIV("P16", R9A08G046_CLK_P16, CLK_SEL_RSCI3, G3L_DIV_RSCI3, G3L_DIV_RSCI3_STS,
 		    dtable_2_16, 0, 100000000UL, 0, NULL),
+	DEF_G3S_DIV("P17", R9A08G046_CLK_P17, CLK_SEL_RSPI0, G3L_DIV_RSPI0, G3L_DIV_RSPI0_STS,
+		    dtable_1_8, 0, 200000000UL, 0, NULL),
+	DEF_G3S_DIV("P18", R9A08G046_CLK_P18, CLK_SEL_RSPI1, G3L_DIV_RSPI1, G3L_DIV_RSPI1_STS,
+		    dtable_1_8, 0, 200000000UL, 0, NULL),
+	DEF_G3S_DIV("P19", R9A08G046_CLK_P19, CLK_SEL_RSPI2, G3L_DIV_RSPI2, G3L_DIV_RSPI2_STS,
+		    dtable_1_8, 0, 200000000UL, 0, NULL),
 	DEF_FIXED("HP", R9A08G046_CLK_HP, CLK_PLL6_DIV10, 1, 1),
 	DEF_MUX_FLAGS("ETHTX01", R9A08G046_CLK_ETHTX01, G3L_SEL_ETH0_CLK_TX_I, sel_eth0_clk_tx_i,
 		      CLK_SET_RATE_PARENT),
@@ -342,6 +374,18 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_MCPU2, BIT(5))),
 	DEF_MOD("scif5_clk_pck",	R9A08G046_SCIF5_CLK_PCK, R9A08G046_CLK_P0, 0x584, 5,
 					MSTOP(BUS_MCPU3, BIT(4))),
+	DEF_MOD("rspi0_pclk",		R9A08G046_RSPI0_PCLK, R9A08G046_CLK_P3, 0x590, 0,
+					MSTOP(BUS_MCPU1, BIT(14))),
+	DEF_MOD("rspi1_pclk",		R9A08G046_RSPI1_PCLK, R9A08G046_CLK_P3, 0x590, 1,
+					MSTOP(BUS_MCPU1, BIT(15))),
+	DEF_MOD("rspi2_pclk",		R9A08G046_RSPI2_PCLK, R9A08G046_CLK_P3, 0x590, 2,
+					MSTOP(BUS_MCPU2, BIT(0))),
+	DEF_MOD("rspi0_tclk",		R9A08G046_RSPI0_TCLK, R9A08G046_CLK_P17, 0x590, 8,
+					MSTOP(BUS_MCPU1, BIT(14))),
+	DEF_MOD("rspi1_tclk",		R9A08G046_RSPI1_TCLK, R9A08G046_CLK_P18, 0x590, 9,
+					MSTOP(BUS_MCPU1, BIT(15))),
+	DEF_MOD("rspi2_tclk",		R9A08G046_RSPI2_TCLK, R9A08G046_CLK_P19, 0x590, 10,
+					MSTOP(BUS_MCPU2, BIT(0))),
 	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
 					MSTOP(BUS_PERI_CPU, BIT(6))),
 	DEF_MOD("rsci0_pclk",		R9A08G046_RSCI0_PCLK, R9A08G046_CLK_P0, 0x618, 0,
@@ -385,6 +429,12 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_SCIF3_RST_SYSTEM_N, 0x884, 3),
 	DEF_RST(R9A08G046_SCIF4_RST_SYSTEM_N, 0x884, 4),
 	DEF_RST(R9A08G046_SCIF5_RST_SYSTEM_N, 0x884, 5),
+	DEF_RST(R9A08G046_RSPI0_PRESETN, 0x890, 0),
+	DEF_RST(R9A08G046_RSPI1_PRESETN, 0x890, 1),
+	DEF_RST(R9A08G046_RSPI2_PRESETN, 0x890, 2),
+	DEF_RST(R9A08G046_RSPI0_TRESETN, 0x890, 8),
+	DEF_RST(R9A08G046_RSPI1_TRESETN, 0x890, 9),
+	DEF_RST(R9A08G046_RSPI2_TRESETN, 0x890, 10),
 	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
-- 
2.43.0


