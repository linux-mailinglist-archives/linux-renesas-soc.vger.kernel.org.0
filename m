Return-Path: <linux-renesas-soc+bounces-32758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIDYNeTeCmqc8wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:41:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D258569EE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3A3430316F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 09:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438B63E833E;
	Mon, 18 May 2026 09:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVzixRLY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9143E7BB6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097238; cv=none; b=NeV7l3sxeJAuW7MPCRxTuniG4Pj0VGLFfT6N8Hby4AS8pQi20RpzBu9HD6V+oNAFbkTjbQtGm+RXgBjFNH78TJfM4eimIxx7NNOyBXAF30ybHdMCbt3rlnHfFWo6mDLhUH4YJLdTW52CqFXHpN+OmrmtQTTkZIB+oKR+pznp8TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097238; c=relaxed/simple;
	bh=PSZvLruQWF9KVcxGgzFEq6toAggI29FIiDOylO9wsB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKKfh+IjnCVmZi+Fkecf457ZJLcwQMpkYHY6+e30FVwU25Vj239yoT1BRueFRKbAa98z257Cm5Sjz8akYabnYH3pdSjCEWWUB2rq7vS+Ug0TRZT714Vsdpzgw0o/vM3hMVUutdp3UCK1Se9xGvCIa9DNVtTA/XkMHaPelL96XcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVzixRLY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso14873475e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 02:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779097234; x=1779702034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/38OFBmgQJL/SrbqQX032t4prIcTBJUh9cxQa+r5c8=;
        b=rVzixRLYxsVjOfUnvWqy35E/Q//MDsTbqGdeF6vWdy9lyOR0X5xlJNoF5+r9IHzl3l
         5s/2fjP11wGKYrr84V4p2syU2e7YQmsZI9mbIgWoP+xlyx51EcZ82lnPtJUB1K4NO7qO
         HkTxHdAOKJ9L36SLqzWWouPgEcn/iWVCHsICMU2bm8NXmjvqrYjs6Q0dms6sg4BpXVTd
         SoqdIlWu6FlroRYS5UANz2zgBjzoW+f6qa1xlFn52azhsFcsTzA031kGaDuCLemwsrEz
         VtgQN81HhxD5lmsiCVnxbqDCqdOYaKpDKxAEdyaqSwR5sSNgfa67ZB3DQpXuiPVqxCJr
         EeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097234; x=1779702034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R/38OFBmgQJL/SrbqQX032t4prIcTBJUh9cxQa+r5c8=;
        b=Stglg1lY/2p4lxBBQA7O3pXdTN4htnbStDWwpI/0YHjKGIobe+AUsCf4Azp60B/WA1
         tq9ps7zE+7M0pMOLIEaC2B+G29+VpxsW47p58Bs8eb9HqTdBDHlr3cVl2b/C8WXKdzYU
         +eYrIPkljgHv5KcGPls3ANK8stP+iWtwj+wpS5vmALnenp1ZRGDGiI3yqu88fsR8A8In
         L4NPy7EMtE5YERFwX44OaLzaeb9ONvYGqCHtER7Y/EUJukSPwEGUlepNABMjIZ+wx+VU
         WiXhqzi8NLjrr+IW7OTtBcleFyqxzogJi1cCp//Y3zIdYK+EBps0ApTJrIM5qAvwvTKx
         i+4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/dFhmnIcajxBqg1lBMt/iRWGWbGWNdHQMAx8SFYj7zUTSidA7L6dNpilF9fte4V22bM+9TozdCzNe3RxMpGXM7hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrRni71W77fw6syiWHKyuj4Ct/3y9LA427FiT2YCiS9b1XW8hX
	Y24kPRaZXTjO5qw9lWxLPQIOaj8W6lm9b4J/ktek/PZZG6azTZt1vH2g
X-Gm-Gg: Acq92OGY49SFcNj4FKu9vFU36UT0/jqmqR/Xhr+mMrCctMzptj/1NSD5S9SJUCrWTMe
	NXN44Z0MnSbiDASfVDDDw4GnxiK+5g26wppVeTpqIe4z3J7AlUSvPMgeN3GozLpugy6naFuL/OE
	IqKocQdZ1nHqj73TpPazrAXgzPGwa/fkmoCoT/fWNbuA9tMRY+a0nFP+rnfBptUurYrAp1euXSx
	MOhGRhDktz9Fz565ETrXFpVCVQdMgoByJYjwvvjPtr5bMhO97846wfznGNag2L+a0fsNRjN2j2E
	UYw/RvpwmKMHy09GurhJFNJpzb3jVxDo8WHM6fD+K5qppqTqdJcBZnxmoJoWtaQfKK2ZG/PsVyT
	Q4YdVpl7dyWJvv5I6aLblY13lK8SDXbO2KNliXopsvjy6P4189WUaSTj63wY/QmB+XsP13moTwv
	qHARvYUi3ofKeB4ZYEiGFGOTAZUGpdMlub16m4NF+lEfmtb38YBJ7ruLe/17Y=
X-Received: by 2002:a05:600c:1d99:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48fe631389bmr202326865e9.26.1779097233874;
        Mon, 18 May 2026 02:40:33 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:cd4f:119b:90b0:3b9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm127975135e9.2.2026.05.18.02.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:40:33 -0700 (PDT)
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
Subject: [PATCH v2 3/3] clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros to CPG-prefixed ones
Date: Mon, 18 May 2026 10:40:16 +0100
Message-ID: <20260518094027.95700-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518094027.95700-1-biju.das.jz@bp.renesas.com>
References: <20260518094027.95700-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6D258569EE3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32758-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Rename RZG3L_PLL_STBY_OFFSET(), RZG3L_PLL_STBY_RESETB,
RZG3L_PLL_STBY_RESETB_WEN, RZG3L_PLL_MON_OFFSET(), RZG3L_PLL_MON_RESETB,
and RZG3L_PLL_MON_LOCK to their CPG_PLL_* equivalents to reflect that
these macros are not RZG3L-specific and are shared across SoCs.

Also fold CPG_PLL_MON_OFFSET() into rzg2l-cpg.c alongside the other
CPG_PLL_*_OFFSET() helpers introduced in previous patches.

No functional changes.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Moved CPG_PLL_STBY_{RESETB_WEN,RESETB} near to CPG_PLL_STBY_OFFSET.
 * Reorderd the above macros
 * Moved CPG_PLL_MON_{LOCK,RESETB} near to CPG_PLL_MON_OFFSET.
 * Reorderd the above macros
 * Dropped a blank line.
 * Retained the tag as it is trivial changes.
---
 drivers/clk/renesas/rzg2l-cpg.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 096901e25317..0abe00e2960b 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -60,15 +60,13 @@
 
 #define CPG_PLL1_SETTING_OFFSET(conf)	FIELD_GET(GENMASK(11, 0), (conf))
 #define CPG_PLL_STBY_OFFSET(conf)	FIELD_GET(GENMASK(23, 12), (conf))
+#define CPG_PLL_STBY_RESETB_WEN		BIT(16)
+#define CPG_PLL_STBY_RESETB		BIT(0)
 #define CPG_PLL_CLK1_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x4)
 #define CPG_PLL_CLK2_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x8)
-
-#define RZG3L_PLL_STBY_OFFSET(x)	(CPG_PLL_STBY_OFFSET(x))
-#define RZG3L_PLL_STBY_RESETB		BIT(0)
-#define RZG3L_PLL_STBY_RESETB_WEN	BIT(16)
-#define RZG3L_PLL_MON_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0xc)
-#define RZG3L_PLL_MON_RESETB		BIT(0)
-#define RZG3L_PLL_MON_LOCK		BIT(4)
+#define CPG_PLL_MON_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0xc)
+#define CPG_PLL_MON_LOCK		BIT(4)
+#define CPG_PLL_MON_RESETB		BIT(0)
 
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
@@ -1188,8 +1186,8 @@ static int rzg3l_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
 	struct rzg2l_cpg_priv *priv = pll_clk->priv;
-	u32 val = readl(priv->base + RZG3L_PLL_MON_OFFSET(pll_clk->conf));
-	u32 mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
+	u32 val = readl(priv->base + CPG_PLL_MON_OFFSET(pll_clk->conf));
+	u32 mon_val = CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK;
 
 	/* Ensure both RESETB and LOCK bits are set */
 	return (mon_val == (val & mon_val));
@@ -1199,17 +1197,17 @@ static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
 	struct rzg2l_cpg_priv *priv = pll_clk->priv;
-	u32 mon_mask = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
-	u32 val = RZG3L_PLL_STBY_RESETB_WEN;
+	u32 mon_mask = CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK;
+	u32 val = CPG_PLL_STBY_RESETB_WEN;
 	u32 stby_offset, mon_offset;
 	u32 mon_val = 0;
 	int ret;
 
-	stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
-	mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
+	stby_offset = CPG_PLL_STBY_OFFSET(pll_clk->conf);
+	mon_offset = CPG_PLL_MON_OFFSET(pll_clk->conf);
 
 	if (enable) {
-		val |= RZG3L_PLL_STBY_RESETB;
+		val |= CPG_PLL_STBY_RESETB;
 		mon_val = mon_mask;
 	}
 
-- 
2.43.0


