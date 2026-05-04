Return-Path: <linux-renesas-soc+bounces-31950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FsQNzC1+Gm3zAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 17:03:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C96384C0592
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 17:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46E7D3071AEC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 14:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04CD83793B3;
	Mon,  4 May 2026 14:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ms8+S/N/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F5A3DA7EC
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905931; cv=none; b=fel4SbDic6ABfQsbcuPBn5a0w/oaFhN/6NnxsuWXurOmIPKDAW/RD1QWc65wccGWcNGCcHZFeuHQ+bZE58TscSfpp7c4T6sCU/vkw3mDZsb2JTl49VBTP0d5rsjAnaucE+RdnP3eFFklgIH2k39zKR94Anu+aFpJJUsfXq9HtZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905931; c=relaxed/simple;
	bh=DvSb/KRNVV3hvhkSLVMtHE11LLpVX9uZOzPUpgHDgA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+yZtcmtM4YYPNQ7UlWkf/ubf2Iim+Dnl8r4q6vvgitBjbG+O5t+i1fMJOqUvSB08NVZbUI4SZoG/xO/8KqD4e5As9KX/3bzBtT0xrz5oF33hm4giSbsbZAqo4fgcFL352EFR2ZP93VRH65FrTyCvguuw7WhVKnqGOaCvk1QrKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ms8+S/N/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso47638265e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777905928; x=1778510728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuEh6EHtxHCxSq+G/rcSFvtM5yky+sac6bh6RW7yjz0=;
        b=Ms8+S/N/V5tv6cxPhhjjrlBfkCdXMhGPlXZb8BG2oZfBePR/8jfjPUufhk7MBf9UJm
         IJLcVqDhPKcra+CeF1xKdybXxA2NOzoZhvdzgd4Jl9UrBorBErBIFcKfuO01TVt4omCE
         SNIyqy7twcHOoBPgBCCg4BS8xUpXbBgzsjsoC112Xzw9QyeHQiPPoGxCrDhbkXNLkCCt
         GshorA3FT5kY3R7LmrhT1wnzKxF/3yegfNGh8W0DWdSzsJkmvUEc/7NZntKUIheOPCu7
         TrXWS4lOWxQO7QhCgKiTeQsY4jtpBDqtQV4GWR3x5P7px7c5bjZO968DHz6NjbnZjzwv
         b8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905928; x=1778510728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XuEh6EHtxHCxSq+G/rcSFvtM5yky+sac6bh6RW7yjz0=;
        b=D2bXYFTLYv3ysHN8StmzvHvHWazaQyECB8I/eh3HEGzo1fwYtB0VenT/PI14Vz/VRE
         bymcsBe4SiVpZs4KN0oYxlWBAmSemk8zWjwtple2aX68Bw1omYB0qVQ7+QjkeUVdw6aB
         nESgPn8d3rEv7LUdV2BtjjgIpWbNKZC2K1k4BS4cUzkWENYXNeYtf2hiclhLDAsbUFxm
         5wSaYrmccIIVH6eP/pv4pvox3Lawv0GkiuM8y7aolZwuOt/f6WKCuZMP+3ld1haXtmUB
         iishNAiwO4um2B9XSuzykJeBe//X7DU6hNNY5lI4k4KP+CvA4zhG0pCaevrlFnFdvXQn
         WqdA==
X-Forwarded-Encrypted: i=1; AFNElJ+3Pvu26Hp27KxmFlQ/cRUeMDNOH7Ix1QutIrsyjit6cowEhZYHi77pSpS3pLBUOxotuajvXw4LfeyWRUhMba5lPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycy+i6V2bDv9IiK16t5rwYZwvBQ8PK5ws+TBiNc+Lg3+0g3kTX
	1Zo73dIi0xoS+MOlVwf4+yp5p6GVw/GxdKBbKRDMlxZs55sImoy8Zt9U
X-Gm-Gg: AeBDiesEju3rK7tA9Ui6MOmf/4lIxdEN3hTQ7agWMqWvRWR6l5QKhTL2iHe3NdOjSLd
	bSHMEI/vgwmaoELw5Gsn5syMsq9QBcPjzqSpHmqexIVMsKdHKD3pB77HT9NxfhSiU2PBN0rIJyb
	fUNtvEJhWB+OEeLsJpx0mrSppuKNWixeqWHZJPwxa3Jzsaly8tNxQ5NW+Lfd8Airjp0+9Ekz9Lq
	c9AeY1eb0NlS/GjkMVDbE/uKZcz881pC2My2sttsw8fdAmMWCFpFN+STG8thFywqk5KxcSZTimp
	PHCFrpOtwDU7o8xUEu9NtJ8LDkAL/prw5PfKeZMZPJRLr3FcGyHiswHlxd3qNAyphzYl99x8f1W
	TAdUNnVDRRrq7JWwslsrVVyEkIg8rr/wVc9VMDhk+X1RzK6tpMy7Ixeh5DTZPmlk339toam6mjh
	x1xRlzYo0Do+LTHOIn6bT2PD7dNegFo9eoeZZCmsvEtyyDmx3+hum6WW16bdU=
X-Received: by 2002:a5d:648d:0:b0:43f:e571:184d with SMTP id ffacd0b85a97d-44951508317mr19130124f8f.28.1777905928444;
        Mon, 04 May 2026 07:45:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6444:b23f:58b2:338c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defa6sm24371239f8f.24.2026.05.04.07.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:45:28 -0700 (PDT)
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
Subject: [PATCH 3/3] clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros to CPG-prefixed ones
Date: Mon,  4 May 2026 15:45:19 +0100
Message-ID: <20260504144523.153906-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504144523.153906-1-biju.das.jz@bp.renesas.com>
References: <20260504144523.153906-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C96384C0592
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31950-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

Rename RZG3L_PLL_STBY_OFFSET(), RZG3L_PLL_STBY_RESETB,
RZG3L_PLL_STBY_RESETB_WEN, RZG3L_PLL_MON_OFFSET(), RZG3L_PLL_MON_RESETB,
and RZG3L_PLL_MON_LOCK to their CPG_PLL_* equivalents to reflect that
these macros are not RZG3L-specific and are shared across SoCs.

Also fold CPG_PLL_MON_OFFSET() into rzg2l-cpg.c alongside the other
CPG_PLL_*_OFFSET() helpers introduced in previous patches.

No functional changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 7e5173a37f3a..498f2f1030cc 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -62,13 +62,12 @@
 #define CPG_PLL_STBY_OFFSET(conf)	FIELD_GET(GENMASK(23, 12), (conf))
 #define CPG_PLL_CLK1_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x4)
 #define CPG_PLL_CLK2_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x8)
+#define CPG_PLL_MON_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0xc)
 
-#define RZG3L_PLL_STBY_OFFSET(x)	(CPG_PLL1_SETTING_OFFSET(x))
-#define RZG3L_PLL_STBY_RESETB		BIT(0)
-#define RZG3L_PLL_STBY_RESETB_WEN	BIT(16)
-#define RZG3L_PLL_MON_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0xc)
-#define RZG3L_PLL_MON_RESETB		BIT(0)
-#define RZG3L_PLL_MON_LOCK		BIT(4)
+#define CPG_PLL_STBY_RESETB		BIT(0)
+#define CPG_PLL_STBY_RESETB_WEN		BIT(16)
+#define CPG_PLL_MON_RESETB		BIT(0)
+#define CPG_PLL_MON_LOCK		BIT(4)
 
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
@@ -1218,8 +1217,8 @@ static int rzg3l_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
 	struct rzg2l_cpg_priv *priv = pll_clk->priv;
-	u32 val = readl(priv->base + RZG3L_PLL_MON_OFFSET(pll_clk->conf));
-	u32 mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
+	u32 val = readl(priv->base + CPG_PLL_MON_OFFSET(pll_clk->conf));
+	u32 mon_val = CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK;
 
 	/* Ensure both RESETB and LOCK bits are set */
 	return (mon_val == (val & mon_val));
@@ -1229,17 +1228,17 @@ static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
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


