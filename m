Return-Path: <linux-renesas-soc+bounces-32817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDn0NX9xDGpKhgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:19:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D74E580699
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D523430429AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 14:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE27C4028DD;
	Tue, 19 May 2026 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+04coke"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F2C4028DE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200125; cv=none; b=Az0rbpnJC4EznJl1ITGXaJ0hDKt9fqAcAE8Xdm9k0yare9d+TOYNIB9VPjz+8do7s2qz8uk9jVeLSutuvim4yUaOTKdYaODf4/EhCFEB2s3SQjubol+fixo0TWD23sBVX1q8sCIKLwgCCTi1DgyDoiyooE8FWDfohlzxNpMqRCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200125; c=relaxed/simple;
	bh=pxo7F/tChpy81PH8CXvEavW4XJAGjkb2GYq5cMW9O70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNp5S1r95eUOUDv1o+jGn+R6i23BuIzB7Ut6n/+txaOpfZzMvbQxc+5K96H59ahQAPVU1sa678bHIFxi1oBmZ7us6+yalSlhHf4W2cPIjAssB9GGrVChtKPNbcw1HGcr76Ij/6bQ5HfAGCGGwfCt1yFJCj+zKrEjwxK1spDaC0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+04coke; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488d2079582so35287435e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779200122; x=1779804922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQpJR4lnY8iF+dc/T45GTK0kwfTJMPwYvTImeEo4ULw=;
        b=r+04coke2Fyly1xesVt63TrjEHRxw8LXp/vil3Si/Y/C2tLleU2rBX0V4et1O55hBY
         cRuHUKX/O5ByiB5q6SV78Cji2E2OTRPeflNoZ27Bg6sraPcsxlBH+WpVLvN1B7Ig2Wuc
         y1Df/bahNTAkMNEiaDBUeWJ1PoWNKKxfl/2PxQMMkFf8pXreTNtHfWxpD40Q1EuGtjCx
         JweodHBjsYMLdUQbtrHqMELVB+bW9Bmxr7mrJz4TEFETaiKx0k7IYD5X8OPuUneVN5yR
         mBHvb6hc+dCfci0pauPmSntpEf+3MjcDqPFGQMMnAjvDqKM1E0FUow3POvQJ6mVboj9k
         RiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200122; x=1779804922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tQpJR4lnY8iF+dc/T45GTK0kwfTJMPwYvTImeEo4ULw=;
        b=o+KdjZUMSQtrufZIGh4At+QHASCGHxTvSJWr18mo/I7EA2ghGwQ1HvpLjpVwvsHUQ6
         TKxGkAb2y2b7yAR2UjMRGv8iFESLwILlT+zxPvsGMklqLXl7pBvBJ+l+PHInRMVXsonH
         Bfa52Jx9jbiggYqtFeo9vHmi8T++YtwbpnX6Y3qnIQH17p7iE5/CMfsk7mQ5ZHgMBM7A
         yTZ4Uza47z5ti3cF9z2/o8dcKh1OzVPgiR73eZaQx6ZQipqeNxFm6cmsipDMJ3eHCwRr
         VhMjTRbeNwC7yalT8JLHhgPm6F7J/f/h9cf9ajCCJWT3kwc3SrNsR86MTLuX59FBPwOI
         5S3w==
X-Forwarded-Encrypted: i=1; AFNElJ8hcLk9FrwCm+JjVHos1DKPbCjjtSRiPg16kwN+dCDu3u3tDumcvf6xAqnTL6rinptkSO9iycr4bs44TWcBOan/iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxJkPAM70LAdhsAd4mtKle12G/Ga9sR9I2cVVuqRngFOg4ieRv
	8ZD3oQawvs/AnA0KOmIPceWQIK6MZ8gFYZ+1SGpJIe8I5THAtPydHxoH
X-Gm-Gg: Acq92OG8Hm9FBMMX842sRwD/vsB/y7tDVbQKY0Dy6WvE7JySrQfWeZmS8V8JeSRJVcJ
	u/yCS0VuVHBDHIcE8tChpYRRbkYciVuJ7ckF+S7El/7WssDVRgX6cHVODr1FqX8oqAVrjlxrT5o
	H4NGSn05RtLuLZBogfccrpLQdsz2MpbUQTZFCB9kphHz9yF2vH42viPIXYBnXunaS6FvvRA68/a
	mrTKyYnPnRMS+Mbc0IHt3Zvo8i3FCj3C7ne2jxJ4cRN5DBpozXsRmZhziJGmbT5By1jexSiQzlu
	HCj8yrvYqhV8k0UWQoU3KzaOBkKWPZmN6bnb0IGbRXC2y2xShHhk6HwyeH8r/eF5jyujTYhwxn2
	q2fHEGbPmbLVFwE8X0TUrI2nHWmTR7wddnGW0qN5KosG9Ok36+Wsf/qSnSkfoTKe1s4toLUrwG2
	kCCssf4d/Zx2/tEBoSmDRtC/UFjJNJrbrf5YXh0NxJFeErxzNX
X-Received: by 2002:a05:600c:a309:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48fe61f20a7mr252146205e9.15.1779200122174;
        Tue, 19 May 2026 07:15:22 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm557912205e9.1.2026.05.19.07.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:15:21 -0700 (PDT)
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
Subject: [PATCH v3 1/3] clk: renesas: rzg2l: Simplify SAM PLL configuration macro
Date: Tue, 19 May 2026 15:15:13 +0100
Message-ID: <20260519141518.389670-2-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32817-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 5D74E580699
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the PLL146_CONF() macro and its associated CPG_SAMPLL_CLK{1,2}(n)
helpers with a single CPG_SAM_PLL_CONF(stby) macro that takes the PLL
standby register offset directly.

This removes the implicit coupling between PLL index n and register layout
and eliminates the now-redundant GET_REG_SAMPLL_CLK2() macro. The RZ/V2M
PLL4 definition is also updated to use the new macro with its explicit
standby offset (0x100), removing the local PLL4_CONF define.

No functional changes.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Rebased to renesas-clk.
v1->v2:
 * Collected the tag.
---
 drivers/clk/renesas/r9a07g043-cpg.c | 2 +-
 drivers/clk/renesas/r9a07g044-cpg.c | 2 +-
 drivers/clk/renesas/r9a09g011-cpg.c | 7 +------
 drivers/clk/renesas/rzg2l-cpg.c     | 9 ++++++---
 drivers/clk/renesas/rzg2l-cpg.h     | 6 +-----
 5 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 70944ef8c5b8..59d6ee2e888f 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -103,7 +103,7 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	/* Internal Core Clocks */
 	DEF_FIXED(".osc", R9A07G043_OSCCLK, CLK_EXTAL, 1, 1),
 	DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
-	DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
+	DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, CPG_SAM_PLL_CONF(0)),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".clk_800", CLK_PLL2_800, CLK_PLL2, 1, 2),
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 2d3487203bf5..913cca6dd46f 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -159,7 +159,7 @@ static const struct {
 		/* Internal Core Clocks */
 		DEF_FIXED(".osc", R9A07G044_OSCCLK, CLK_EXTAL, 1, 1),
 		DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
-		DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
+		DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, CPG_SAM_PLL_CONF(0)),
 		DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 		DEF_FIXED(".pll2_533", CLK_PLL2_533, CLK_PLL2, 1, 3),
 		DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
index ba25429c244d..a99ab1375f07 100644
--- a/drivers/clk/renesas/r9a09g011-cpg.c
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -16,11 +16,6 @@
 
 #include "rzg2l-cpg.h"
 
-#define RZV2M_SAMPLL4_CLK1	0x104
-#define RZV2M_SAMPLL4_CLK2	0x108
-
-#define PLL4_CONF	(RZV2M_SAMPLL4_CLK1 << 22 | RZV2M_SAMPLL4_CLK2 << 12)
-
 #define DIV_A		DDIV_PACK(0x200, 0, 3)
 #define DIV_B		DDIV_PACK(0x204, 0, 2)
 #define DIV_D		DDIV_PACK(0x204, 4, 2)
@@ -131,7 +126,7 @@ static const struct cpg_core_clk r9a09g011_core_clks[] __initconst = {
 	DEF_FIXED(".pll2_400",	CLK_PLL2_400,	CLK_PLL2_800,	1,	2),
 	DEF_FIXED(".pll2_200",	CLK_PLL2_200,	CLK_PLL2_800,	1,	4),
 	DEF_FIXED(".pll2_100",	CLK_PLL2_100,	CLK_PLL2_800,	1,	8),
-	DEF_SAMPLL(".pll4",	CLK_PLL4,	CLK_MAIN_2,	PLL4_CONF),
+	DEF_SAMPLL(".pll4",	CLK_PLL4,	CLK_MAIN_2,	CPG_SAM_PLL_CONF(0x100)),
 
 	DEF_DIV_RO(".diva",	CLK_DIV_A,	CLK_PLL1,	DIV_A,	dtable_diva),
 	DEF_DIV_RO(".divb",	CLK_DIV_B,	CLK_PLL2_400,	DIV_B,	dtable_divb),
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 426e93dc7a98..ad9aab2ecc62 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -58,6 +58,10 @@
 #define RZG3S_DIV_NF		GENMASK(12, 1)
 #define RZG3S_SEL_PLL		BIT(0)
 
+#define CPG_PLL_STBY_OFFSET(conf)	FIELD_GET(GENMASK(23, 12), (conf))
+#define CPG_PLL_CLK1_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x4)
+#define CPG_PLL_CLK2_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x8)
+
 #define RZG3L_PLL_STBY_OFFSET(x)	(GET_REG_SAMPLL_CLK1(x) - 0x4)
 #define RZG3L_PLL_STBY_RESETB		BIT(0)
 #define RZG3L_PLL_STBY_RESETB_WEN	BIT(16)
@@ -72,7 +76,6 @@
 
 #define GET_REG_OFFSET(val)		((val >> 20) & 0xfff)
 #define GET_REG_SAMPLL_CLK1(val)	((val >> 22) & 0xfff)
-#define GET_REG_SAMPLL_CLK2(val)	((val >> 12) & 0xfff)
 #define GET_REG_SAMPLL_SETTING(val)	((val) & 0xfff)
 
 #define CPG_WEN_BIT		BIT(16)
@@ -1093,8 +1096,8 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	if (pll_clk->type != CLK_TYPE_SAM_PLL)
 		return parent_rate;
 
-	val1 = readl(priv->base + GET_REG_SAMPLL_CLK1(pll_clk->conf));
-	val2 = readl(priv->base + GET_REG_SAMPLL_CLK2(pll_clk->conf));
+	val1 = readl(priv->base + CPG_PLL_CLK1_OFFSET(pll_clk->conf));
+	val2 = readl(priv->base + CPG_PLL_CLK2_OFFSET(pll_clk->conf));
 
 	rate = mul_u64_u32_shr(parent_rate, (MDIV(val1) << 16) + KDIV(val1),
 			       16 + SDIV(val2));
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 33f54ba0e64e..17ec6f285c21 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -58,11 +58,7 @@
 #define CPG_CLKSTATUS_SELSDHI0_STS	BIT(28)
 #define CPG_CLKSTATUS_SELSDHI1_STS	BIT(29)
 
-/* n = 0/1/2 for PLL1/4/6 */
-#define CPG_SAMPLL_CLK1(n)	(0x04 + (16 * n))
-#define CPG_SAMPLL_CLK2(n)	(0x08 + (16 * n))
-
-#define PLL146_CONF(n)	(CPG_SAMPLL_CLK1(n) << 22 | CPG_SAMPLL_CLK2(n) << 12)
+#define CPG_SAM_PLL_CONF(stby)		((stby) << 12)
 
 #define DDIV_PACK(offset, bitpos, size) \
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
-- 
2.43.0


