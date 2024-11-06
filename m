Return-Path: <linux-renesas-soc+bounces-10326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AC09BE079
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 09:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 788F81C221F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 08:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A351DDC12;
	Wed,  6 Nov 2024 08:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FDzcQ/iO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECED1DDA14
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 08:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881186; cv=none; b=ceUo7XagfP8DnEHb7SDlHKe3v96rlWbB5po54DyGsXA+FG1jJxifaLHFqXRNlbmtl0qy0kpjieabP3RISfCsuB17ezLR5S88VeIbPrJFmDLkWdcwnjUeIjKkrIQo62SGxULhWv7rfpxcwkWun6+DmpKWCOYe9I8vP8SoiudjeLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881186; c=relaxed/simple;
	bh=6zsnUxSYKp1CaHE5aCUM6dFjvDbABs3X9HX/f33Y/kY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mvXSXwGxHNIMoqLYF1rEJ7bZreMbS0d656eyCVsUOG7fGYeAlhqRLwE6rTOEosU11nWKN0OXFj8sIHdZrXY/cNYc2X8o1wjNj5jxZRL4VNugxZIC22SFmR6Bv31Znk7vaOxE4qjUch+8ri86pQKPB0MPrYpnB4GPh8cSQDgIrH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FDzcQ/iO; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso812900066b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2024 00:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881183; x=1731485983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVeD83iYkyS0FEe3667snnbzghOUUmW96GqGfRItNjo=;
        b=FDzcQ/iOuSqeErffVMon15CZOFH1E0zedl7AyLmyYZHELuaIvo6ktSkhLbk/dIQYYt
         n0m1PTvSEnPyV33toG+T1vSIyga09yi8zRVTsWX9ei5yeEtw2dOaNOJmt4DjiPYvm2BX
         VtIcewXbxKpWvg0v36iXVm665CEEOXBsP8l6gDXQ55bHuD/sESkzyc5ymykKyLNj/c98
         ZiFAruSGAzM3KBWvc+MFxW1+zlgaX4WPRrhv/1jtVG438k7gTskQHE290fHIZp4QXQP9
         EggAAKmP3CexLKG8ODnPZaQ8w0RwQynpzFgx7RD+G4ts1GfDbLtEFSduLgESglVmAx0L
         CVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881183; x=1731485983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVeD83iYkyS0FEe3667snnbzghOUUmW96GqGfRItNjo=;
        b=fsT9aawn57pRw/UdOPoK4GjoG9dSPfU7E3OfISjWVAp/m0r8ctOQIP7p4Nbxw/ew7S
         y/9fU6t5NnGlchA78NQkwW7Ylu4sVKxHEZEsbPe7OLEkQeU5iud+ANwNP+Ky93LsNZCe
         RgzIaUEVVJp7pEsGlTd1/uo/zlnREJom27Plb/b7g9KuBcrM+B6wVpjnbmCgRBFsDCJZ
         qE+z3x+zjXdS2bhoHndS7lH8SN67ubfp0/E/ZPN9vwz0oz+xMr7cQofC9lvlmnHfiCt7
         MCHfmktI35wzlptk4A2Nhu9WskWBxNNGIRznc2F5oHkC1XT57KPAQbrVHILu8fWzOjkz
         /21w==
X-Gm-Message-State: AOJu0YxJ6rglogr9xcw/LWrQXEnYKMMs4exk2EBkbG5wkWo6YzgZQTFb
	PIb7U7XAjR74XK96vg4zMUMnch6Aqxh0uTlezVhgxiWeTnAfBDczxVEdEpZIUrQ=
X-Google-Smtp-Source: AGHT+IFHoE3pwazDx8B7UaCg0uzFJmbGifNHvIHNA59h4tWY69aWJr1VbGxezG1RaS/c+8FOH4/G1Q==
X-Received: by 2002:a17:907:7ba7:b0:a9a:46f5:d6d7 with SMTP id a640c23a62f3a-a9e508a0631mr2127784466b.5.1730881182914;
        Wed, 06 Nov 2024 00:19:42 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:42 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 13/31] ASoC: sh: rz-ssi: Use readl_poll_timeout_atomic()
Date: Wed,  6 Nov 2024 10:18:08 +0200
Message-Id: <20241106081826.1211088-14-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use readl_poll_timeout_atomic() instead of hardcoding something similar.
While at it replace dev_info() with dev_warn_ratelimited() as the
rz_ssi_set_idle() can also be called from IRQ context and if the SSI
idle is not properly set this is at least a warning for user.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 47b82fe549ac..14d1edac6c34 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -307,7 +308,8 @@ static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 
 static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 {
-	int timeout;
+	u32 tmp;
+	int ret;
 
 	/* Disable irqs */
 	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TUIEN | SSICR_TOIEN |
@@ -320,15 +322,9 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 			      SSISR_RUIRQ), 0);
 
 	/* Wait for idle */
-	timeout = 100;
-	while (--timeout) {
-		if (rz_ssi_reg_readl(ssi, SSISR) & SSISR_IIRQ)
-			break;
-		udelay(1);
-	}
-
-	if (!timeout)
-		dev_info(ssi->dev, "timeout waiting for SSI idle\n");
+	ret = readl_poll_timeout_atomic(ssi->base + SSISR, tmp, (tmp & SSISR_IIRQ), 1, 100);
+	if (ret)
+		dev_warn_ratelimited(ssi->dev, "timeout waiting for SSI idle\n");
 
 	/* Hold FIFOs in reset */
 	rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_FIFO_RST, SSIFCR_FIFO_RST);
-- 
2.39.2


