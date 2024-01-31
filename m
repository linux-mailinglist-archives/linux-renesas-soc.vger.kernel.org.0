Return-Path: <linux-renesas-soc+bounces-2131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C2843CBC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 11:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 098DDB29A80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 10:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1CA6A026;
	Wed, 31 Jan 2024 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kimXdde+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E84269DE1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696983; cv=none; b=TGJ3WOi1H1frQ1dLeKpXld6YslbdwadtqKN4yfMNyb7U2PkJ3H2l/glKyh6rnyWlUfpVHydUfZGkSZouC01dCoh5IIwwwPd4rTwxj3emEjSRFi0620PAbL+r9N2QFeI77Vg6Ie+qsFb5l/aySAQ6Zfm0GrhgCbXhjB7OTViLmEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696983; c=relaxed/simple;
	bh=wfSnhN8zYk6e9fyuDQX5EjhWfIYA05oiRWPy+vbfM+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hel0MArP9mtbNBQ0sh/Ft38LUz9cz7FMtqlywhF5oLjr+FysrXeCCxABUqCCD1UoRE1knYBofiKBzrwgzGF1LuRxKZv8Wtb3a7XtgD1tYXpHmwI+WdAKkXFOnevKsNTYHK/tv845kgRb4c3/npjHGJYb8hlX6tiwilN6UFlPmCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kimXdde+; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d05da19a9eso16907171fa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 02:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696979; x=1707301779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkR7rBl2sOafZKXFZdEWG75554ewnQ9UQfMjdvinuXY=;
        b=kimXdde+k6ZW+rN8JpGGAbvybyuXmOtPvU1lrWHp0lMk5p6zJMRKuSuwtmMk5LhP+e
         mMsaDjEtdrZIlkvKnkA6NEniiGXey/kbDmOg31Lg63b9HoED/hnOWvS61H3dA1SMt6bA
         6qzIRihQrdh6IQJxcQlQ21PlXlq0zszUsUUS5Ybn8mSXQOOx5mr2lx7k+obaiFF7Dl0b
         20GPn7VAY4xnLtf5TP15oHeI2tf6jSvyD5oRqZBz/dPUAQQ+dtiNH5yzRLj/OVt+Ekbl
         JGqSpyQzLlciBgE97dN1+avIlDpqYf+oTjoSinEGhco9ZeMn6yQ43FNL0zWX2/oxxzkh
         Oymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696979; x=1707301779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkR7rBl2sOafZKXFZdEWG75554ewnQ9UQfMjdvinuXY=;
        b=J1AOlCKVgGOG+G/Oc+zSVrIbIjeipV61AejsMPzfCxyIU8d8tVERmQstF0fXHdouBb
         j94Y5jGs0/XoNqDzxzim39F+nQIZN6bLzlmKal3NWnJrlssHKOEhToWtyU8HflUiaFbZ
         JDg7t2+ahUqhHZXpxJSpfjuYWYYH2GZ4y+j9NA7aW3JmR6uujaQY5SJQcUYo0sAq5KFZ
         pBkI6K+uB6utRFyLg0ytA3TLN45geLQhUmbp9nnUVHGxPiCqHIr0IBTNwOgt9ww6Vg+7
         XFeDTxtL3+y5v7SMW78DSfyHCypjFmnlRv0qk9uZUk0h19Q3GT1pyLgWdn7g2mjs25gN
         e/hg==
X-Gm-Message-State: AOJu0Yz61+PJnz7AL5AZEkLrVyYKP7G1JQQs9Evza7xcQMjnvRQkkhX/
	6vNztyd4+2frCic1ESgjnLYqEoSQMeBJgJcY54/LVtBwuaIheAFdJegYUw07xSHE8NH7+roz3GR
	+
X-Google-Smtp-Source: AGHT+IECzxjWmJuCXcBxnru2N2Yed5Msw47QZhzqY7xEOuixcReDrQOs+0C06A3Ee5JEJUh3Ph2RAA==
X-Received: by 2002:a2e:ab0d:0:b0:2ce:5524:1d96 with SMTP id ce13-20020a2eab0d000000b002ce55241d96mr830730ljb.51.1706696979692;
        Wed, 31 Jan 2024 02:29:39 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXlwqgqP8/OAq4HWyVx8FiFCUs0NUqVKAOuyPMBmzGN/G9vCE7xfEC7zdcAPomxJ+TXGfMkmDoIl8Bbe24VEaMkkVONUyt1LBQgMHx6t8epOVxnJyWXT8+ayaMXGp0twh6ybHkaXd1k3R91qKfslmQvji4FTXfOtGP0Vbk4x5B5ZzJTQknlX+5LEugPsbC4j5Es8dW3lI8YLIztbtbEmF/UsbchmmytV6qo+009RmIJpjVPefQn/jSNKOqnd8rVevAFzVZ5SDjeCW9KoAIKN9xxyP5RlKBGfdeWmUXPcF4qtfmM2d+AHB52mA==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id p16-20020aa7d310000000b0055f3b11d0adsm1618989edq.55.2024.01.31.02.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:29:39 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Hien Huynh <hien.huynh.px@renesas.com>
Subject: [PATCH 1/2] clk: renesas: r9a08g04{3,4}: Use SEL_SDHI1_STS status configuration for SD1 mux
Date: Wed, 31 Jan 2024 12:29:29 +0200
Message-Id: <20240131102930.1841901-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102930.1841901-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131102930.1841901-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The status configuration for SD1 mux clock is SEL_SDHI1_STS. Fix it.

Fixes: 16b86e5c03c5 ("clk: renesas: rzg2l: Refactor SD mux driver")
Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 2 +-
 drivers/clk/renesas/r9a07g044-cpg.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index b70bb378ab46..075ade0925d4 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -138,7 +138,7 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_FIXED("SPI1", R9A07G043_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
 	DEF_SD_MUX("SD0", R9A07G043_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, sel_shdi,
 		   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
-	DEF_SD_MUX("SD1", R9A07G043_CLK_SD1, SEL_SDHI1, SEL_SDHI0_STS, sel_shdi,
+	DEF_SD_MUX("SD1", R9A07G043_CLK_SD1, SEL_SDHI1, SEL_SDHI1_STS, sel_shdi,
 		   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
 	DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G043_CLK_SD0, 1, 4),
 	DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G043_CLK_SD1, 1, 4),
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 1047278c9079..bc822b9fd7ce 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -178,7 +178,7 @@ static const struct {
 		DEF_FIXED("SPI1", R9A07G044_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
 		DEF_SD_MUX("SD0", R9A07G044_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, sel_shdi,
 			   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
-		DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1, SEL_SDHI0_STS, sel_shdi,
+		DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1, SEL_SDHI1_STS, sel_shdi,
 			   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
 		DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G044_CLK_SD0, 1, 4),
 		DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G044_CLK_SD1, 1, 4),
-- 
2.39.2


