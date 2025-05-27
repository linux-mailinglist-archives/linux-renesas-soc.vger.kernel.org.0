Return-Path: <linux-renesas-soc+bounces-17550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21562AC4D29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 13:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F4E23BF3BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 11:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEF5262FD2;
	Tue, 27 May 2025 11:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="b9ZgO6Jz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7623C25D200
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 11:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345061; cv=none; b=nolBucwqa7ctIj/DUrxaNwEgY2EseAZZI5RMfN+y8u4H5Sr+uAbWXpn4PJhcf7wXjfZdixZt41zhf6lHOm0Vhu7Smiz68cNYzGMB2rL/OtGk+Dj19SHGfkJPN35rYZ98VUCLAjQlfxLfOonSDUeqnwUYU/LyLc7nzZwMRbV9kro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345061; c=relaxed/simple;
	bh=MsMZDrWBfRsJ8ri3F5X9GfYhbLKkobKeGpts2PRqUWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1JR8v8cxDZMuJtSZ8qI1M7R0ONmorIHJOJntYyk0BmE+rOBi3iduLk0oWL4pDMb3NJY+fPILHAuIFiQ4vw46NzFBwIDIXmjdm5k+S0ElY/2Ro4rsLAUwPrfTjpmP1CrTSH+vZk0BM2V5AbjIiXNyXXuMCA8aw3E+RF6ZhCy0iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=b9ZgO6Jz; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad56e993ae9so649447866b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 04:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748345057; x=1748949857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPvUg+/2vxleBwi64oJRAvieyH+EWPrUyLqwj4qbi9o=;
        b=b9ZgO6Jzjk1B+yKJfVCgTNJ3B4L16OkK7MyvBR9ZWrFjKjI2+Upsh/oIITgSaXvno8
         REKpq/kwSyg4jsZfqsjJHMK26CJyl+h6CejnNBughjbAKbyiXKMZEi5TgQU5Qp8bXUbE
         Y0/b2Dg2kftkkkm5JO73Al7DjS4prrl0Ts0cHT4RZLQuiZDxrkZFEGCbON6PYJm8KKg6
         nSayNy6vxSv5JhKVwoVQ5MF20OTZkTBoOnNZRNlanE7XUEePx9uXQqfS2gPeOG5VY7h8
         TdMIbsCXqdOiOSyp6K7WBaqNaaZFj8jM+wcSZfbwNRqpIfN88QCid4EVfa4rSfu+PA2z
         FvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345057; x=1748949857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPvUg+/2vxleBwi64oJRAvieyH+EWPrUyLqwj4qbi9o=;
        b=SnCzfkDjpePA+l7fZSAIu14abO4tykGZjq/SXGOsEKOexLnjooTMqlCaIwLZyAuIbU
         zLCU/su9Vi8UACE+5/6ywLV5sxC6Cyvd0RHwsxRItJCyg7qHGAl1CcXbarnhXW63b6zz
         hJINx8yfsF4HtMTqt7NrkV9DWN0eTMp0YY8/mcWwvnk7n9CTK6YSx1BWcoL+m32sQdZW
         K2rruTSdb2dY099+/hRjPBuDZMRAen1JebhFpjmrNyYt7aQoR1y/v9xPlP05XhiC5MlC
         eKRba0y/OvTDVcSWTr5gT8ice/gV8KG0HmAFfr0pDyA2b7vWeaSXPDc5MBzHLEYTB7HV
         M3Og==
X-Forwarded-Encrypted: i=1; AJvYcCX+78vXj1nVrjKFBr8GBb6nER2XscuU5IrqZHKnRO3zakH/x+2IVo72C6BZRACj07qiNDGGVVBofcMHhsrPGNnleA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKnyUlmgMiTCo0DtWPDIAFwEQXXZP9PjjQRhBuxPqId1Ef+Hyo
	WZc54gfCQO345rVudvS7Y+GKc7A83lhtffBlOsQFugT7tTZKEiHB3wX3j654e/KwToA=
X-Gm-Gg: ASbGnct3Mpv4GEsEtARthUUygoqtQbmvTEuhHoNuyjuKiBAvyKGNpb2+LhgfWeL1DR7
	VNUkHo+ice7ZyZIRq6FvGUCoTcbhyo5r/aSAG4Gx5re6fD3mBlbFR1VS/SIHoVJFjXUDPeZ/GuW
	/Zg4kQ4dL6XcVJxtgTmMPp2EvQhsxiD3Kkro+nyzxeX7k8LZ/NFp0ezDOFiG3ZoUqfNJlz5ogJ2
	orsq32zs6VMeP5i8UY7J3TCcbo35mmAXxQvrtZ/EgTzMcxM0RmgN5m+MYf6aaW4LOBbPDfCAQ2O
	ZRZMpEkax8R184BsRFSxRmOw6PJOeBNz3VcDVrBT8NUSdR63TTm5GVIHBGHSZH3CYBa0Ef12uxF
	iI0hv
X-Google-Smtp-Source: AGHT+IHY/Diz9puiJs/ElNjkdoO617cGIM4jCQEt8psWKPrvmezd8hjozaZ6JtjNtQfnjY/BaJMwFQ==
X-Received: by 2002:a17:907:3e06:b0:ad5:27f5:7174 with SMTP id a640c23a62f3a-ad85adbbbf7mr1178556966b.0.1748345056522;
        Tue, 27 May 2025 04:24:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438403sm1807297466b.123.2025.05.27.04.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:24:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 3/8] clk: renesas: rzg2l-cpg: Add macro to loop through module clocks
Date: Tue, 27 May 2025 14:23:58 +0300
Message-ID: <20250527112403.1254122-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add a macro to iterate over the module clocks array. This will be useful
in the upcoming commits that move MSTOP support into the clock
enable/disable APIs.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags
- s/for_each_mstp_clk/for_each_mod_clock/g to align with the
  review comments and the discussion here:
  https://lore.kernel.org/all/cb0d43138aa443578dcfdaab146bf9215cde9408.1747927483.git.geert+renesas@glider.be

Changes in v2:
- none; this patch is new

 drivers/clk/renesas/rzg2l-cpg.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 767da288b0f7..e5ad80f35cfd 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1202,6 +1202,13 @@ struct mstp_clock {
 
 #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
 
+#define for_each_mod_clock(mod_clock, hw, priv) \
+	for (unsigned int i = 0; (priv) && i < (priv)->num_mod_clks; i++) \
+		if ((priv)->clks[(priv)->num_core_clks + i] == ERR_PTR(-ENOENT)) \
+			continue; \
+		else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + i])) && \
+			 ((mod_clock) = to_mod_clock(hw)))
+
 static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mstp_clock *clock = to_mod_clock(hw);
@@ -1314,17 +1321,10 @@ static struct mstp_clock
 *rzg2l_mod_clock_get_sibling(struct mstp_clock *clock,
 			     struct rzg2l_cpg_priv *priv)
 {
+	struct mstp_clock *clk;
 	struct clk_hw *hw;
-	unsigned int i;
-
-	for (i = 0; i < priv->num_mod_clks; i++) {
-		struct mstp_clock *clk;
-
-		if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
-			continue;
 
-		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
-		clk = to_mod_clock(hw);
+	for_each_mod_clock(clk, hw, priv) {
 		if (clock->off == clk->off && clock->bit == clk->bit)
 			return clk;
 	}
-- 
2.43.0


