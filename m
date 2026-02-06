Return-Path: <linux-renesas-soc+bounces-27995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GODAVXRhWmOGwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:32:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C66EFD46E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 378FD306376F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41F13A0E8F;
	Fri,  6 Feb 2026 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5Fs/cgG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4639C3A1A36
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377419; cv=none; b=T9hcImqgbegDU9ksoHdd/Hu707BeWgqT6lhCHy7kPd0sKfOvOwgSv/CeE3TUOG54r0+gmot6+wKSDw2ghaGqm/WmWD2AbR6Z2fx4YWlLFGLWXkplbjbdtLLXy3Tc6/zVGf4/2oQc2nY73o2np57GtWzEG2cBj5bMQIuXvX/lI7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377419; c=relaxed/simple;
	bh=fRFREbmT01jfYpBr1PG4D6aL8uCT6THD5/lfmNdbvqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKREsCpPAGULGPAHqA7ezThs5qnfZf89KUiI7RfJ0CAw3cAeStjur/1Wx3tX+ThjNN5mxlL7K2xbkLH+ix+xPl/qdTnRZH3i2W6lC9HfSynMNv7cHkNndDF6Ifx2Ceyl9RFh1kUPpczQw3P0bfDLAKReY8UWd7pPTkFTRJlhSnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5Fs/cgG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4362ab556f5so454121f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 03:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770377418; x=1770982218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqVtpir5i9HPxHrDDRZAtkC+rLB9QDEYhWMhLfdT6MI=;
        b=Y5Fs/cgGw+FTsrBzilE6SaoQeVZ6ZxWeOTSFCQ8uVDaXMz5QI/Q/TEQe1EBHw/9Wpz
         irXCXnwPVdEX7pb6PacfdjtIHYH/zbKiKcBzxzbePirLPVGU6cZiQENlmyi0IMpAKVrT
         UWDqHME/nDnG+t25CF4f9GoesWU4t5ta5vjfNda7oCHMXgpNQXMqYY7KWcE+xiHH2JPL
         AtinY/lLxOHtInnqk4bUOyhb9X+X23rtgw2VL0DJfUMpkhVGXcYoVK2vY2eGvBXvYhgy
         FR4QbZgDk4ZVN2Z4NYYUhP/diBcsnBJ7Ot2H5keTrD52a4keY+aCLX0m6DQtI8LZCTt/
         RJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377418; x=1770982218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aqVtpir5i9HPxHrDDRZAtkC+rLB9QDEYhWMhLfdT6MI=;
        b=Um90Ul0zcYDJ0hWi+O9YBdoc3l7HXWrRNz1dLORU04B5voD1LXNf7OGJrZRM34jRqJ
         X5dPmu8bUKEm71uckMkjc7MtbF+A52YvDYMzha7mlqh3PudFdGYRJb2+WWk3nVKgpyi4
         ZrD9cPH1U9sjQdS6qoyf1w9h8AS0Zqqo4VIBmb0oOWvrfuzXJRcenHiSlkewBAft45jk
         k52faSHOZyaHsJugomb0++ELfymNW7aqIkpJKKFcXExlt9jvUWT4bxhucF0deXCzRYBU
         xS/NxZMG9dXeR7/wDIWPPgENFH8SiW1xKxAp/5hRTnKf0Qm5UzR2tvk3flFu1ZxoRIBx
         jBmw==
X-Forwarded-Encrypted: i=1; AJvYcCURp85WiVhE1oL38jfZiXObkdx80libBDz9R+DqKtJPB+yGbkNQXhG3N+2oPcKIwwDOzZ3Ix4hPZdRttESVwjPwmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ZK1uEWn+MoBLGhgCDsfGPSTSwY6L+BHNMzbfDrfTNgHLUtnx
	kfDiuGlQKz6FNl4HNnd3oAowIg52nINXUwa9N0qUy0Jk/k0HtplkeJq+
X-Gm-Gg: AZuq6aKW/ltOJnZE2HOSHBhIhoGBSXKGTb5BG/AXz345ioA7GqoT87E0zYblLZAwogj
	vbBeK9ASGczAwrvIILfYBS5LYMhK6a0XRL62LH8gMy9UT0aqzLUJlrH0NSIy7Fyg+gVn++pWIZe
	fxePswNfGx5whjkeorY00B3X9L+Mk8/JfNYmcnb1H9hrplE0jwQIk1zglq/idbOrh3QWMpP+JLr
	ocZCwSi6+a60ARCoZmGiaw/zR5RnxcGgy9oJQKceDOxfp8YfmEBnmwanNYfvjD9mELad6jhXlc5
	+4NBIOYFQZ2DVLzvCHNM35kuVqYEWmxu6XVFUGSAFekYPhlQqOtpr2l9Qop9faAE8UjcGWngUnz
	uGqDZUasIQ+WQBNjoM0Nq3euYzRaHsLjJahDB3VckwIva+j3l4c/51MUhM7+5okwwiDiPkVWM73
	vf4runfy54BfGGJUMZVg==
X-Received: by 2002:a5d:584e:0:b0:435:8f88:7235 with SMTP id ffacd0b85a97d-4362967dc28mr3473624f8f.33.1770377416936;
        Fri, 06 Feb 2026 03:30:16 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm5309670f8f.28.2026.02.06.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:30:16 -0800 (PST)
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
Subject: [PATCH 1/2] clk: renesas: r9a08g046: Add CA55 core clocks
Date: Fri,  6 Feb 2026 11:30:07 +0000
Message-ID: <20260206113013.233432-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206113013.233432-1-biju.das.jz@bp.renesas.com>
References: <20260206113013.233432-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27995-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 8C66EFD46E
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add CA55 core clock entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index b7753a331772..6cb3991cfeb6 100644
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


