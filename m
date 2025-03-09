Return-Path: <linux-renesas-soc+bounces-14189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF6DA58875
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 22:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A78791885A00
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 21:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB40221554;
	Sun,  9 Mar 2025 21:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmAizCNE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF75220689;
	Sun,  9 Mar 2025 21:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741554870; cv=none; b=f7vPN2aDy8LtsgvqpEqDPE9ed02I9W9VGvrqZWYjTorn5mgRwUiR2h8rSBm2deoEN9fISi1aIdDYJiBzz+Si8qmo3quRtGb2nMh8ixZxb2EVJB8UvsHILInVs8mIk0dBTg5I90V5YXOOPfV7+hVXh5GHCNhObFxO8w+YLUJ/gbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741554870; c=relaxed/simple;
	bh=p4tw7sIno7aVydPLMnfjr/iLNqWWqcNw8pI/a7Z8t+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ELoLpw42cvjFMdDmlVfKI8XN+yi3LtdE44ZU9E/fyj/h27xwf4oQU5DjpEhpub0bQYSfwq3SDyialUxkxDRutBPkxDTYZaTvgaXuFiCRQ08NVTQWALkX+djfgNe0Ygm5+pOsOQmuaWqlGna22wCde3AcTnLTbPhvz+d/sJiBCm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmAizCNE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso2103585e9.0;
        Sun, 09 Mar 2025 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741554867; x=1742159667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrQCeWkox3LKz8pG/0aW5QkQIzDRaa4lkk69wZlu4/0=;
        b=lmAizCNEcRb28vAxmbaC/zFAOgatai4z0VWOZQtxoS25P1HNW1Cp/s3Kh/mmMocgtm
         1Y9dxMMTH64afnoOUeYoellQjAB1fRMeENKoZZ2yXAVAjBr3zdOVnV0Upn4bhWay+4ks
         s0XsElI7WSjM+6PUlRosq92OjASbu03rTRg9mj9J5Pk8ZThqMaCzcSYwvD5N86oyRmms
         ZfsVuaRrRzzAUd2LM1TYF88VYb7Jr2swv4e/5WVClYAa3BCSz5Fq1lbxL+Fw0BFEpfv0
         5FcoyQJWLhPzEWRjbYFqmNWX15iXKytjckGAImj859E8pFMmgIYyqw8a4lUWhELvpXLd
         zPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741554867; x=1742159667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrQCeWkox3LKz8pG/0aW5QkQIzDRaa4lkk69wZlu4/0=;
        b=aBtfCFsS7dsx6JeAsDCWYO8DWgf+V1z9lqtK9TgWi/jWCxreGJ4g4cSxkpP/1UYjiY
         LNa6EfiV0RHEy6n+j3JmAEN84B7BYy6XX0l+U87dtvsb6pcIHlP1TkP8/b8CS5D7SliP
         +turnbrmJnDw5nJwvGMbP4/OLDZAM3X5vjCceGnUPkT/Wykl+CrqLjqApGsUdw8iHy+N
         hiMO7epV86N8q+FRtcGLBV5rqoZA/6IE23nFxjlFJSJ4NpLjzGHHKLO8xWmiVZJNIE+Y
         /kmRMhL02I768Iq8MkVVRGdGsmoKh0Ag8WmG6F++ojgDYOkQ5QsqitUZP7Aup67/NlSZ
         7MqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC7A2dIY2jOFc6/KuA6vypJezRteL2yKKYMnAf5T0KjLL6iiVVlOTR+Pi5FH1Qc2jGt7Jgu5g/WlbUWK16PETr714=@vger.kernel.org, AJvYcCXygWTTDCixYOZgMLPcB54XRe/KheDzLIhCa/nQPgm07bFaUk0mHeZ7zDrrbrsZ15bLE3jYqC9w6otuvUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YywxRvY311N+RDwqQBRYSCVVYiFxphaUDrrAI7/BnHV16Uni5MU
	bORlVTYVUJxWnbfBZXUo8cUZnUr78lSpicJby9/4pvkeUWbNFZyK
X-Gm-Gg: ASbGncttMovLLkeHaodNmtGdRP4Gl3foUxZwSbS9V62lXxgw7r76uET6t4c/TOrfQ0E
	CT0sr2vENZwVlFX/MN90ywLF7hxZEdtSyBMpFchZo+S8nPfdrww402EGPP++RfCatiayzv+x3PH
	p2qG0JdxOmgjWH0XQlUubGJg3PizI2vIkYfOirJ0tVhO3XZSHuwREAphLvs4HSm2oVBTSlSk8kK
	GmKTl0JndYBN/SZE8bk0FARNLfG1Rx8UunnfDd+YgRAOcS33816QaVrowT2e7eDjlXo2tWxkwmK
	oeCnEDucG79r5vGb4+WeYGqA2WouGUQvflau9bzb9zvKYdCSzAy5Xjz/XVqwPd3Um6iFP9n3Vyd
	DrxAfIjo9
X-Google-Smtp-Source: AGHT+IGnmkx/xNxOL/OQ/1kn2+TTCWf85yqTkdX3FkV68fvBFjLQjqET6YPRrfDPu/WR4GmLazuEzA==
X-Received: by 2002:a05:600c:4e8e:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-43c5a60ed21mr71724985e9.15.1741554867009;
        Sun, 09 Mar 2025 14:14:27 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:e951:ba7a:6a53:bac5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce70d13b4sm64443845e9.38.2025.03.09.14.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 14:14:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/5] clk: renesas: rzv2h: Rename PLL field macros for consistency
Date: Sun,  9 Mar 2025 21:14:01 +0000
Message-ID: <20250309211402.80886-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Rename PLL field extraction macros to include the associated register name
(`CPG_PLL_CLK1` or `CPG_PLL_CLK2`) to maintain consistency with other PLL
register macros. Update all corresponding macro references accordingly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- New patch
---
 drivers/clk/renesas/rzv2h-cpg.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 76ad037b4361..a11aa0c4295d 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -48,11 +48,11 @@
 #define CPG_PLL_STBY_RESETB	BIT(0)
 #define CPG_PLL_STBY_RESETB_WEN	BIT(16)
 #define CPG_PLL_CLK1(x)		((x) + 0x004)
-#define KDIV(val)		((s16)FIELD_GET(GENMASK(31, 16), (val)))
-#define MDIV(val)		FIELD_GET(GENMASK(15, 6), (val))
-#define PDIV(val)		FIELD_GET(GENMASK(5, 0), (val))
+#define CPG_PLL_CLK1_KDIV(x)	((s16)FIELD_GET(GENMASK(31, 16), (x)))
+#define CPG_PLL_CLK1_MDIV(x)	FIELD_GET(GENMASK(15, 6), (x))
+#define CPG_PLL_CLK1_PDIV(x)	FIELD_GET(GENMASK(5, 0), (x))
 #define CPG_PLL_CLK2(x)		((x) + 0x008)
-#define SDIV(val)		FIELD_GET(GENMASK(2, 0), (val))
+#define CPG_PLL_CLK2_SDIV(x)	FIELD_GET(GENMASK(2, 0), (x))
 #define CPG_PLL_MON(x)		((x) + 0x010)
 #define CPG_PLL_MON_RESETB	BIT(0)
 #define CPG_PLL_MON_LOCK	BIT(4)
@@ -203,10 +203,10 @@ static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	clk1 = readl(priv->base + CPG_PLL_CLK1(pll.offset));
 	clk2 = readl(priv->base + CPG_PLL_CLK2(pll.offset));
 
-	rate = mul_u64_u32_shr(parent_rate, (MDIV(clk1) << 16) + KDIV(clk1),
-			       16 + SDIV(clk2));
+	rate = mul_u64_u32_shr(parent_rate, (CPG_PLL_CLK1_MDIV(clk1) << 16) +
+			       CPG_PLL_CLK1_KDIV(clk1), 16 + CPG_PLL_CLK2_SDIV(clk2));
 
-	return DIV_ROUND_CLOSEST_ULL(rate, PDIV(clk1));
+	return DIV_ROUND_CLOSEST_ULL(rate, CPG_PLL_CLK1_PDIV(clk1));
 }
 
 static const struct clk_ops rzv2h_cpg_pll_ops = {
-- 
2.43.0


