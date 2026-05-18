Return-Path: <linux-renesas-soc+bounces-32756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SITWAujgCmrU8wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:50:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D7756A117
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B108E301AF1B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 09:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0363E7BA9;
	Mon, 18 May 2026 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN9AI7+R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938723E3DB2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097236; cv=none; b=dcZgUUMp55+WOk8aZPRX4e7at54zwH1UucfpwqKKDsHSnD62/SoV5bt8emJW/x1D9n6ySwyfkow+fbFPG58lSSyjShDfXrxJJMUh6pCPgno8aywhfLgPsZrz2TTJ6GAfvaVQx8k5+d/3lbVZXhDJDU/LloJPrAl41VhfGZ0r0H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097236; c=relaxed/simple;
	bh=vFnnStHDXR8ewaWHn4g4+Xi5ZJmWAMSw7S7Lo5Rskho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lilFlL/2Exp7c0iefgb9dNiUPL/aMi9/gOX6PFmJx/9kX84TSgMS+iAJQxDJ4INjOyJRnNksjG+1fhepiRkcdHfTyzGUJ2UT2MjtKWLL0bzVp/fXCADamB++1f5uV/lhTrpNR6hS9M4K/k0T+y4gS+lJa31vvraeApexvQkju5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN9AI7+R; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so11204335e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 02:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779097232; x=1779702032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmDVl5NDDpXc8T5NYdMw3tjaV+BZGsR3SiZ89rjc2Rw=;
        b=dN9AI7+RwiO0pcQdm1HdX+Yt5f0a4rZgRCHRiRa1Yg+mQOycdVpfL7r6hrnCsnqWyl
         4X36rkHQ4DAhqbk+o36iXraSIbnfFbDf9kX/vyVUOtPjUQB7u9AkUQX8iRXhgRPw79i4
         /RjaHRA/nxI8hVw5yoUDTPyhNPJU6ji/Pu7q7YqIcWYZs92huJbQlY9A1jNhhNSwJO3Z
         J+LNPvEyc9r1eeg+LoYWpVIItejyRiHLmRiu7PmREZBlxUIJnrayjwJ+vNS93JF/QhKA
         ZhAtFhee7d76gKftOEP67i2Yjld1Gu/Uwz3TdyqheFdIpPl/PF7J4W0QXff6462aQ9zP
         4bgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097232; x=1779702032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmDVl5NDDpXc8T5NYdMw3tjaV+BZGsR3SiZ89rjc2Rw=;
        b=FHnIzKIFuWoue7R/heF63gFhmcPPLj8H0IOd/KJUtJxGxihuT65cFzIVTJqw28uz0o
         843aPc+0wMV1O/NKoEXXDGMStpc0HVos88fWhUDaYlGrgOTx+0WwovqW8Rif9kmdjos3
         o844enjP6w1VF3hFl3LECYfvFyeBMLa8NhnLHeGxPhQ1+L6mtlAIGjDsdn+dRzvMNNgt
         cZVbKkMDY4A5+Zsl5IGLOx+4sX4OT4zEnaYITl/fOh42HLiEA+A6gybcM9KRPuh0LX85
         IE4SIpbTNdf0NTCTOiMwp0nF/LyEbjF1LAl9ciNhxbF2xzGngbRqU7wOYxFBd0Y218WV
         vqqg==
X-Forwarded-Encrypted: i=1; AFNElJ+J1VHJHERttRG41RS90OzopmN+BuDGYt63q/3EZHyTCohMi6y0wX05IVVNJ2XbwFhrK0kuhkQH5/tL3AHYyT1N8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8tnVILP9sO1sN0+Mp6tYi1uAOXTjr+8YWLV1KEawrtNmZqSeB
	5pv5Hs+FDvzs3v3JOdUnOr9bnjp1/nC8DsrtNkG449EdZ/Tupmu1DyG7
X-Gm-Gg: Acq92OF9Cv6cZ8vcVuIRph1V5AN3mKeHYJRTy8MMUlBFTjNh9QLh1cs7yPbUvlwm88M
	XjZzlYVz7CX7Ec8VeGQmjGZCTV+Ay7Tz6HCBDcNT3lZbZmYZToGTgd3xwor/HhXPNyG2hn9rnX7
	ty2VOLUJnMTJWGBS5l6qGn3QMaJxe5+GOZs7Up5dSkfI+jHbECl9mJ2h4iih3919ZKLL8FDlNLd
	ck1D2TnHp9Hl+3i/QnoWHQctfUU7vkfup4CS+ByggeZQRCYHEHhr2Q8ktJBAnsYOtWM4EwZhG09
	DtbtOkokTAL0XE9r5OjShSecIMWdAhi++xSoD9oO+1V9rJ9LZKFzkXRz2+OAwoYij7lXHOxHCUP
	m54C8UlPcPMwCgi5GDQhXvglvprULrvEH2V08S6I2O5ZCddlJLDGqiMr1yyJSWD2ey45xuZCoGO
	tlIodyjUc7QQUuUjmpVyRj+zmzZK57dWjICWueWKDUOkdwoQh97oDvLDJ7Z4E=
X-Received: by 2002:a05:600c:4fd4:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48fe60ed7b7mr191916225e9.10.1779097231774;
        Mon, 18 May 2026 02:40:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:cd4f:119b:90b0:3b9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm127975135e9.2.2026.05.18.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:40:31 -0700 (PDT)
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
Subject: [PATCH v2 1/3] clk: renesas: rzg2l: Simplify SAM PLL configuration macro
Date: Mon, 18 May 2026 10:40:14 +0100
Message-ID: <20260518094027.95700-2-biju.das.jz@bp.renesas.com>
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
X-Rspamd-Queue-Id: F2D7756A117
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
	TAGGED_FROM(0.00)[bounces-32756-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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


