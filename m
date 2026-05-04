Return-Path: <linux-renesas-soc+bounces-31948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GtXFlmy+GkdzAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:51:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 041624C0152
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCFD33024D77
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 14:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1893E0C40;
	Mon,  4 May 2026 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVsX76bA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B242B3DEFE7
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905930; cv=none; b=bg3H5GyVXL0+MvFXcNNtL/4Z8kmRadGOpUdx0Up4YusuRVg1LAjiCJEUXR5nYvPCo1bbZ9HrVGexOXCMf2ODIRevyw64DhEEc/Os8Zh27mxxyPM+TJJsG30lahNWTm5wCB0E7JD74Xg3aff+hZaxAeaOBizdxq8WDD/HoT1E/0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905930; c=relaxed/simple;
	bh=S4XEGtlNjs4KB5nnF1CUR8Rj9qdHG0xcI+F14IrksYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AT6KkKjYGTsuwQuP9ur8DnXmUOCR3QGK52J5YcTxkqgqg6rOBxKKgp3aBrHGCTuY6Ea8s0OV38CEDlhCLy6lhC89NetI+JaoHqd1WNwf3/IeueBT0XsZnRcoOkY+rzyWoOHbsp0aEMAMLjINUGte7oU9GL6vfkOqPdBosHYO2zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVsX76bA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a786a9a35so1973775f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777905927; x=1778510727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE4Gzu5dGAIOYMTkBgHkZPHEG0/JctFS3nbLSj6XV0w=;
        b=DVsX76bApjsIdq8RgiTz/ErCXxVY/OR8ldBAdr6acBEADa/bM4fAv/tIuSVlv6yUSe
         qI0zsLcQph81QEMgN0oHqe+ljSqqnT/fR0+OVR5knc6mBF/rRXsG8JIkvHJxC4wNgj0O
         f9QvWxincoLwU/TeoyYLy9Pl6kL4vWcAJK6wdnAuWntjRop2yeRSzkS28MPvqrau0a0b
         7f8GaFuGLId6A+pN9IXJsBv02DXBJNRe/wbVpPzOKcCQe1TfCgUNyR55gsQQhLNtiRwh
         CjsfT9yYPpXinvl3sLLm4TDDn2SwzgbmC3o3x7cAjyLEymL2+DeFj+KcgaRn/uVl7mR9
         eBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905927; x=1778510727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NE4Gzu5dGAIOYMTkBgHkZPHEG0/JctFS3nbLSj6XV0w=;
        b=BvCEQqjcXrb6sEpfQONRxazfBdHYjXYJB+0hIjdEfzClOdMO0RJP187b5OCkXQ9Y3a
         +8T3PsM/i5t6r+H4L3ox4XtCx8VCReDqk+cL4wJkYoTEwpMCeOhR8lDFJCMXUgsbA8Iq
         sFP/Uyo5wA1tX8m/XISMiFWXhQXDgba5bDikaTdPmO+lH/XuN0KHWjrFvyESNmd2bl42
         mdVfs1fWCkfM9XUWYplrwaLvG/m0PyOgMItGM8QUPH5lJAx+PWJHngChoX7m2hIw9xwD
         nErUzVHCf+64dqy7BxCq4Ds0Rtj0A76ESa/Bm0ZpXi8+cSnZ6cTvnB1WFQ3q+uZDdlEf
         ytMw==
X-Forwarded-Encrypted: i=1; AFNElJ8+G/BDg2tIBXGZDTiUDBcWgIUaNr6LHU2VILp4InXcNGZnRTHO+wUb/isLujmpZYCyzkq60W1QRlGptPGCXmwipQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydFqruqk0VNIRRUYI/MZASiUGThmtXR4M4q4/vEmxO8milg2tF
	QcDjofpLjWoxlf6rtYOwOotr53nXvzEHh684jX7iBXZZxBPN0sFMT62M
X-Gm-Gg: AeBDievszPZwIwgEqYfpI0shkScZTh4MHTb9mpSwV6KlChD4X3wQOm3bm8GKl5fwA6+
	tD7CgjLPebWrObIWkvmoSjz8fLUm6MJbXm3KaC8/v5QffnJPLnGrbUhcgbxUnIMj1K+4GCE5uFi
	Drm5pTh8BS00Wye2dj7VW1blsBAeqBWoH72pX2RUid85cT+m5uDPQ93w1cpEeajpy8dwkqTMTc/
	3L4dycjCJpNammTeeWTC6jlPBkCIiVTffz8dWApyeTx6EK+1vcKuRKQk9C6LMOxGlwxu0dZ8PH4
	Wf/wShwxIx3ZGm9FAbBBOK55q5OHkts9da9RUS8k3sVn4mNhhZ9+E4HiwuA/P3R8YlZswZhEiAQ
	l9N692pASt5XdLq9PELtoApQXQ9WqIwyDVaupYzzBbhy/iwmJ70W4gKnJ8/c04hqgURd0DmS6DW
	jQ3yiw4sp+fAOKlOSLnexTdkW94hKb+fhFjOBziFd16JygQL9t5COTi/awFjA=
X-Received: by 2002:a05:6000:228a:b0:43c:fd7e:72eb with SMTP id ffacd0b85a97d-44bb6ab1cb0mr15924375f8f.41.1777905926793;
        Mon, 04 May 2026 07:45:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6444:b23f:58b2:338c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defa6sm24371239f8f.24.2026.05.04.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:45:26 -0700 (PDT)
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
Subject: [PATCH 1/3] clk: renesas: rzg2l: Simplify SAM PLL configuration macro
Date: Mon,  4 May 2026 15:45:17 +0100
Message-ID: <20260504144523.153906-2-biju.das.jz@bp.renesas.com>
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
X-Rspamd-Queue-Id: 041624C0152
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31948-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the PLL146_CONF() macro and its associated CPG_SAMPLL_CLK{1,2}(n)
helpers with a single CPG_SAM_PLL_CONF(stby) macro that takes the PLL
standby register offset directly.

This removes the implicit coupling between PLL index n and register layout
and eliminates the now-redundant GET_REG_SAMPLL_CLK2() macro. The RZ/V2M
PLL4 definition is also updated to use the new macro with its explicit
standby offset (0x100), removing the local PLL4_CONF define.

No functional changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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
index 03658ba012ea..c6f9f3417ce9 100644
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
@@ -1123,8 +1126,8 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
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


