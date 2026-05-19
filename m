Return-Path: <linux-renesas-soc+bounces-32819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBnaLZFwDGpKhgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:15:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 586FB5805B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96486301586A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 14:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE17644E049;
	Tue, 19 May 2026 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o60kHnXg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71414028EE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200127; cv=none; b=AOD+a6jmNFfebZBjbiCn+o0tNqnY6TSTfUkWDp0+f+hYSTmnNQCjmiBCgUhjk2rEAC+Y29urni1r62qwg81Od0gbPmpPU2P4/v2IaABL4bfwZRUZ1/Qjnh9DpUJu4fQFHBcDgV9qprQlnq9Lf3R7rqpXqqckIW65l8l3fc8XxEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200127; c=relaxed/simple;
	bh=tDYG3+8XiKZlF3E3b3WpE4A3INkHP9bqPVrhIBkxUdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQE/lnKEqJej3aDgF4B5zvjH5fvK27/vhJ2ym+qCjsAWdPmmp1znJPFj/fWntIsbw4fhLd1sTNiZAdP0JvIh0cePcDbAW6DbrZG0OQchYJ+eNVY9iwM/yCzzG0ZYmQYiZKLt97txwoMRPdA+huC7g/QTZ8wM5f6oniMXuLCnS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o60kHnXg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so21345805e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779200124; x=1779804924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYVmVWSUhwTTTImhIixvGMooyyhf3UJ+qaABfiENa7U=;
        b=o60kHnXgWb9eLA6ZdExRjr7HcrasXwQk9YGiQ8SsEevEvsRZL1k3PmrrhAzxWpkJBt
         OM+l+ydWAa5TWquoI0drf3KaWQ8zaYdA2sLjj7846/FDTMASO1UyRlMA7nz/rTgs80aw
         w/vMfYo5xY3ylco88TWQnMW69Bh9oyCYhvpJP+kh1keCaDaeIYKPFxWTATjkV0TQfIa7
         +sp0MWaYzlSWnqrymnnF9tEiY1MyIC1m5BKkXVHiO8Pr4D3g2cCTbNZh0UIEKOHFEC2w
         XtNr/8DVLPMoZCmtGZFvZVc3050gIcTCCyTbBv0TyAASkIKMojKONrt5UyTVNhoK0BNY
         2AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200124; x=1779804924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYVmVWSUhwTTTImhIixvGMooyyhf3UJ+qaABfiENa7U=;
        b=syvHmkD1rpYxS8jhc4zt8tBGs0yCalda+CRFS/Os+QYpg2ZgxJGzsnqWpw9UBnRJ0V
         gJU5s5ru2VcHzWC7Zcx71COsyWo8pX3FvWULiKv3gHvWc2TCgxbpl2ASzIPXYHy581nk
         2m+Qvs9wa+qgvKdyqSxFGZECAovPR4dCpiDS/xZ7qF71yFtdBSrq08aVkzxZ+v7R+Azg
         RY5XHG/DOdCgMLc2y5GLZoZ7FH+SC8NLQH50lB2RrTylKO/WOQdYeXxPjC3dwq6LZKB5
         W9pAoIXAwaUnO3qHrbxiVeqapy87lVR21Ms0ew69IHkL1WQIpyLmk3MUhHWlGZcUqcYp
         tXzg==
X-Forwarded-Encrypted: i=1; AFNElJ/dn9gBvHZkejW33QrKs/KI/2gDiElmVuKcm3obvfldBeoXx1NQCO29U+STdp0onGlNBKbXXExKn8GsXQQ7F8AWZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfn1X7m39tPdkwL5kWK8BPzDTp/Sw/tBItv2D/v8GZGUKP1eHL
	BQ2eFDMGJL2mhlSulym54MC4VgxrUDnk0mqGdPY8ZDomgm8Fmch4B57pKFTO9g==
X-Gm-Gg: Acq92OFUcT5x4rJH18RM3bfGMoTknmsn842iluy0Q+mJM1cs9PkXZbJkQ1CQBigRa4Z
	d7neUvys2B5pYFX5yO48LUFT18QSemdtj3CoYMIRE+U3HIcMZYrefdiDRf38puM04uaKf8/JHmc
	Q/GUszGUDEtJka2/a8WPLQc94HMy1LEDll8YRhxI9M/QjpWOrDChecnf9ywY0o5IY8MJDD9GtHY
	wsnEpjlWUiCIX/lwEltP5SbGlg2DELA0BIVGSjUUnNVaqIkYZoeHsuzYfEitkWJhJkZlpq1/qSp
	ySmWZlvTOpzuTr3VfrFRNWNcqUYsLi13O8+kMtsZvtGbSPto4plOSCP0+S+N7+CFezWB6XNBP2G
	Pzo2DQmiZmqABiWsoEDQC+FFfJmFNu5NW4Ro+qh1Y7yxJ63tk6F9futEJpeBeHIIH/yzfXJumn7
	TAr9+O3FH/IJO7aO97xj2P3fVotSLbl+3Ykldgok4i+Wbuqmom
X-Received: by 2002:a05:600c:8592:b0:48a:7aad:4425 with SMTP id 5b1f17b1804b1-48fe60e5235mr228206945e9.3.1779200124022;
        Tue, 19 May 2026 07:15:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm557912205e9.1.2026.05.19.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:15:23 -0700 (PDT)
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
Subject: [PATCH v3 3/3] clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros to CPG-prefixed ones
Date: Tue, 19 May 2026 15:15:15 +0100
Message-ID: <20260519141518.389670-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519141518.389670-1-biju.das.jz@bp.renesas.com>
References: <20260519141518.389670-1-biju.das.jz@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32819-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,glider.be:email,renesas.com:email]
X-Rspamd-Queue-Id: 586FB5805B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
v2->v3:
 * Rebased to renesas-clk.
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


