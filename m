Return-Path: <linux-renesas-soc+bounces-33599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lv9vNsWZIWq9JgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 17:29:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 522946416D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 17:29:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aaVFhz40;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EADC30344E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 15:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212D133A032;
	Thu,  4 Jun 2026 15:19:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2F33E367
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 15:19:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586344; cv=none; b=OMk1xBFJECPv9ds6LC+8SHHQX1BWNfptDFzBMr6vl8LX4jjs9WR12Vq30raoO3Xtfs0PiFbg1Gsuc2F31/PyZ87kuvKOJOMQOLK0tTtvlr8f1DVnntZDWVnodj6NTF9HQ1QRlYkMiMbsUxSVYIy3VvfuwrCDy+imUpzkwbvHVYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586344; c=relaxed/simple;
	bh=Z5tSTWN/uMueVbTuVf6BwdCEA+homFRfdObLsLcdTTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5bKaIVNzDsYGHGZlpCsvoc+0ivomN5KkOCy4SzxtQ2Ss8HZIjYJ1TRCLi/i+Gy4M3kxi+DclfcyzBHAoFcuU/lLHBFYZNybMS+7b6WIQ8+DNp6hn2Qg29/KO/vHs40+OyjBTUxAHoZnfH9//06Epdp+MrIqXE/68BCo2D+Oki4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaVFhz40; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so9822785e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780586340; x=1781191140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxJsqCCxA/3hVeKxVpa9lBlgxY6PEGaxeL9SOjRVsOI=;
        b=aaVFhz40PmvCW2Lt1uPPAp3Xa3/UfaIB/fmxZ0VgMT/cQDLvQw57gkqOZJhTR7xmgY
         MJIfebieVF+zvD9wEnQ4kvK8lJcHFgMhkN9aVVxvbz+HIjtq0WSkizm2ifKa/x/hzV0o
         TRQvHDFzqHqEsqjL7FyQUg4W9D7TzxU9+sJpUqvYrK0nNmZPDEGDWOBjFESRJvM2dlP1
         9vZDjtYyc/BX4ZkksKW+ChFwPCKDJCZOBoN6x+K8mErjwrz4c1XY/mFsPYDxgrAYvsXq
         GHetPaLsatGU9OjDrNr/bH1FbXTf8HSEWPaLxdNVCzZ161S2jXYTZP7VqRzaBRdAmfSM
         HvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586340; x=1781191140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oxJsqCCxA/3hVeKxVpa9lBlgxY6PEGaxeL9SOjRVsOI=;
        b=YQsUlAevNTyiYhmIzmC83wKM1DFR+HWuvApyJYUzlARLeW+rYYnYSpnwTqjwz3CZ0I
         R4lrALQdgbfHrkl3WMSVoI9Euc6VQrNUeCor9Z8T1ouM/n4nOTwh74SCgNC9k+2Jbgjy
         0z3KO/ZU5JvGj48P13KGlXQaRKLBr7u0DY6kTI+wr9jZZaI31SZBgRGVGAVkN40GXzvo
         ElB0xpMqXPqa8WZ/do53DOQxz/GDZffIVGrEZFTSUBO65xPtrfihUWDtLYbGpr4SUU79
         p4I32lw8OYPH7X3zHQPmrFSBYmnkQEl3vl9Bp+d4b1NGxn/kh+TQaApGo1FUTx4KxDmo
         1UBw==
X-Forwarded-Encrypted: i=1; AFNElJ/m2BQ7db7WxJxC+LQV74du8+GRgaAOOoPq7J74TK7SWJgUnzrfz0P+X34DeXrVuNNeclhTWWDopuZ5sn44yNUPaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv/W0LD2XoDwEblbYyzf0Vf/XAy6Pzlm65S2HVW8bi7APVuoQg
	tTwUdM5sy+apK8kHiR4St0xKa6IDzJXMZUx/27ccRCFj3lWP1H+TJMV/
X-Gm-Gg: Acq92OGUqzJxewEkobTGi6nF1ycUcrkBSvFSUfKeQAZhJ9WggLeJu1FxT4dphE7ZG12
	1bzo3R/k6V+jo/KXAYIAH0xEuTQHkgcEEkYoajZumUvFLQ5rKWIIJ/jQcsWlloTD1/uMOucaTBW
	tsxoPQrQA9ETJxi4/418Tk+qxk5H4KFruBMSxV8fnX6tfGaJo87jcDpGebC28JySkju0X6tdIGh
	LFKVXemoIda+R5DWeNzKLn3dolP7rvisAJg+t/TK7+M/YMDHZdRwMlOf4T7/yXYOTw9YJaTZar+
	Sa0YkL25ZGfDgrwWMPDgt1GEawQ8t7ESZfGbuN7UOurnd40QiRqEh6dWM/sjc0qVHqHsAx6IkaO
	WsOmncOoCOERGE+JRUVppPpi5CLvDwsQqGZ9ytJq+yOYAznq5XzfBEPa6xcFy4VwZmu50XO0uVi
	eKTV9K+yi/faVdWuwT0K0izTgMV1dKjElQOUEKIzVWinY9yPURdgCzH5qiV6w=
X-Received: by 2002:a05:600c:4691:b0:490:bcf6:469f with SMTP id 5b1f17b1804b1-490bcf647e6mr67405455e9.0.1780586339683;
        Thu, 04 Jun 2026 08:18:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm82776805e9.1.2026.06.04.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:18:59 -0700 (PDT)
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
Subject: [PATCH 1/3] clk: renesas: r9a08g046: Add clock and reset entries for GE3D
Date: Thu,  4 Jun 2026 16:18:49 +0100
Message-ID: <20260604151855.307772-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604151855.307772-1-biju.das.jz@bp.renesas.com>
References: <20260604151855.307772-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-33599-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 522946416D8

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset entries for GE3D.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon [1]
[1] https://lore.kernel.org/all/20260603065731.93243-3-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/r9a08g046-cpg.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 272922b76e1e..edc83a4104b2 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -18,12 +18,14 @@
 #define G3L_CPG_PL2_DDIV		(0x204)
 #define G3L_CPG_PL3_DDIV		(0x208)
 #define G3L_CPG_SDHI_DDIV		(0x218)
+#define G3L_CPG_GE3D_DDIV		(0x224)
 #define G3L_CPG_CA55CORE_DDIV		(0x234)
 #define G3L_CPG_RSCI_DDIV		(0x238)
 #define G3L_CPG_RSPI_DDIV		(0x23c)
 #define G3L_CPG_SDHI_DSEL		(0x244)
 #define G3L_CLKDIVSTATUS		(0x280)
 #define G3L_CLKSELSTATUS		(0x284)
+#define G3L_CPG_GE3D_SSEL		(0x40c)
 #define G3L_CPG_ETH_SSEL		(0x410)
 #define G3L_CPG_RSCI_SSEL		(0x414)
 #define G3L_CPG_RSPI_SSEL		(0x418)
@@ -36,6 +38,7 @@
 #define G3L_DIV_SDHI0		DDIV_PACK(G3L_CPG_SDHI_DDIV, 0, 2)
 #define G3L_DIV_SDHI1		DDIV_PACK(G3L_CPG_SDHI_DDIV, 4, 2)
 #define G3L_DIV_SDHI2		DDIV_PACK(G3L_CPG_SDHI_DDIV, 8, 2)
+#define G3L_DIV_GE3D		DDIV_PACK(G3L_CPG_GE3D_DDIV, 0, 3)
 #define G3L_DIV_CA55_CORE0	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 0, 3)
 #define G3L_DIV_CA55_CORE1	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 4, 3)
 #define G3L_DIV_CA55_CORE2	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 8, 3)
@@ -74,6 +77,7 @@
 #define G3L_SEL_SDHI0_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 16, 1)
 #define G3L_SEL_SDHI1_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 17, 1)
 #define G3L_SEL_SDHI2_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 18, 1)
+#define G3L_DIV_GE3D_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 27, 1)
 
 /* RZ/G3L Specific clocks select. */
 #define G3L_SEL_SDHI0		SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 0, 2)
@@ -89,6 +93,7 @@
 #define G3L_SEL_ETH1_RM		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 10, 1)
 #define G3L_SEL_ETH1_CLK_TX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 11, 1)
 #define G3L_SEL_ETH1_CLK_RX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 12, 1)
+#define G3L_SEL_GE3D		SEL_PLL_PACK(G3L_CPG_GE3D_SSEL, 0, 2)
 #define G3L_SEL_RSCI0		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 0, 2)
 #define G3L_SEL_RSCI1		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 2, 2)
 #define G3L_SEL_RSCI2		SEL_PLL_PACK(G3L_CPG_RSCI_SSEL, 4, 2)
@@ -119,6 +124,8 @@ enum clk_ids {
 	CLK_PLL2_DIV7,
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
+	CLK_PLL3_DIV2_2,
+	CLK_PLL3_DIV3,
 	CLK_PLL6,
 	CLK_PLL6_DIV10,
 	CLK_SEL_ETH0_TX,
@@ -127,6 +134,7 @@ enum clk_ids {
 	CLK_SEL_ETH1_TX,
 	CLK_SEL_ETH1_RX,
 	CLK_SEL_ETH1_RM,
+	CLK_SEL_GE3D,
 	CLK_SEL_RSCI0,
 	CLK_SEL_RSCI1,
 	CLK_SEL_RSCI2,
@@ -219,6 +227,7 @@ static const char * const sel_eth0_rm[] = { ".pll6_div10", "eth0_rxc_rx_clk" };
 static const char * const sel_eth1_tx[] = { ".div_eth1_tr", "eth1_txc_tx_clk" };
 static const char * const sel_eth1_rx[] = { ".div_eth1_tr", "eth1_rxc_rx_clk" };
 static const char * const sel_eth1_rm[] = { ".pll6_div10", "eth1_rxc_rx_clk" };
+static const char * const sel_ge3d[] = { ".pll1_div2", ".pll3_div3", ".pll6", ".pll3_div2_2" };
 static const char * const sel_rsci_rspi[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };
 static const char * const sel_sdhi[] = { ".pll2_div2", ".pll1_div2",  ".pll6", ".pll2_div6" };
 static const char * const sel_eth0_clk_tx_i[] = { ".sel_eth0_tx", ".div_eth0_rm" };
@@ -251,6 +260,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED(".pll2_div6", CLK_PLL2_DIV6, CLK_PLL2, 1, 6),
 	DEF_FIXED(".pll2_div7", CLK_PLL2_DIV7, CLK_PLL2, 1, 7),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
+	DEF_FIXED(".pll3_div2_2", CLK_PLL3_DIV2_2, CLK_PLL3_DIV2, 1, 2),
+	DEF_FIXED(".pll3_div3", CLK_PLL3_DIV3, CLK_PLL3, 1, 3),
 	DEF_FIXED(".pll6_div10", CLK_PLL6_DIV10, CLK_PLL6, 1, 10),
 	DEF_SD_MUX(".sel_sdhi0", CLK_SEL_SDHI0, G3L_SEL_SDHI0, G3L_SEL_SDHI0_STS, sel_sdhi,
 		   mtable_sd, 0, NULL),
@@ -258,6 +269,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		   mtable_sd, 0, NULL),
 	DEF_SD_MUX(".sel_sdhi2", CLK_SEL_SDHI2, G3L_SEL_SDHI2, G3L_SEL_SDHI2_STS, sel_sdhi,
 		   mtable_sd, 0, NULL),
+	DEF_MUX(".sel_ge3d", CLK_SEL_GE3D, G3L_SEL_GE3D, sel_ge3d),
 	DEF_MUX(".sel_rsci0", CLK_SEL_RSCI0, G3L_SEL_RSCI0, sel_rsci_rspi),
 	DEF_MUX(".sel_rsci1", CLK_SEL_RSCI1, G3L_SEL_RSCI1, sel_rsci_rspi),
 	DEF_MUX(".sel_rsci2", CLK_SEL_RSCI2, G3L_SEL_RSCI2, sel_rsci_rspi),
@@ -332,6 +344,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_SEL_ETH1_RM, 1, 1),
 	DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
 	DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX, 1, 1),
+	DEF_G3S_DIV("G", R9A08G046_CLK_G, CLK_SEL_GE3D, G3L_DIV_GE3D, G3L_DIV_GE3D_STS,
+		    dtable_1_32, 0, 0, 0, NULL),
 	DEF_FIXED("OSCCLK", R9A08G046_OSCCLK, CLK_EXTAL, 1, 1),
 };
 
@@ -380,6 +394,12 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(11))),
 	DEF_MOD("sdhi2_iaclkm",		R9A08G046_SDHI2_IACLKM, R9A08G046_CLK_P1, 0x554, 14,
 					MSTOP(BUS_PERI_COM, BIT(11))),
+	DEF_MOD("ge3d_clk",		R9A08G046_GE3D_CLK, R9A08G046_CLK_G, 0x558, 0,
+					MSTOP(BUS_PERI_VIDEO, BIT(12))),
+	DEF_MOD("ge3d_axi_clk",		R9A08G046_GE3D_AXI_CLK, R9A08G046_CLK_P1, 0x558, 1,
+					MSTOP(BUS_PERI_VIDEO, BIT(12))),
+	DEF_MOD("ge3d_ace_clk",		R9A08G046_GE3D_ACE_CLK, R9A08G046_CLK_P1, 0x558, 2,
+					MSTOP(BUS_PERI_VIDEO, BIT(12))),
 	DEF_MOD("ssi0_pclk2",		R9A08G046_SSI0_PCLK2, R9A08G046_CLK_P0,	0x570, 0,
 					MSTOP(BUS_MCPU1, BIT(10))),
 	DEF_MOD("ssi0_pclk_sfr",	R9A08G046_SSI0_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 1,
@@ -504,6 +524,9 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_SDHI1_IXRSTAXIS, 0x854, 6),
 	DEF_RST(R9A08G046_SDHI2_IXRSTAXIM, 0x854, 7),
 	DEF_RST(R9A08G046_SDHI2_IXRSTAXIS, 0x854, 8),
+	DEF_RST(R9A08G046_GE3D_RESETN, 0x858, 0),
+	DEF_RST(R9A08G046_GE3D_AXI_RESETN, 0x858, 1),
+	DEF_RST(R9A08G046_GE3D_ACE_RESETN, 0x858, 2),
 	DEF_RST(R9A08G046_SSI0_RST_M2_REG, 0x870, 0),
 	DEF_RST(R9A08G046_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A08G046_SSI2_RST_M2_REG, 0x870, 2),
-- 
2.43.0


