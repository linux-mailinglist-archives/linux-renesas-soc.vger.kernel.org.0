Return-Path: <linux-renesas-soc+bounces-10320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3EC9BE05B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 09:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FC782819CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 08:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36091DAC8C;
	Wed,  6 Nov 2024 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SW0ERnKs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345D51DA309
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881173; cv=none; b=THg7uvCJz8V35LpoJxWlAsRc+gK8seQR3kE4oN8M4ApCBesNe54+hlqAjFnjWcixSRyzz68vYeykkAZYLWX+npYIsQe9L5wC929E0Wg/C8rpe+jQCzKW+aIaTwghovuo07Wxxs/wyyHzcvx8ZF8GpnAxK9t/eiHUncpXQcfzsUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881173; c=relaxed/simple;
	bh=/6aTrJTZ4Jidw/36xgtKQTOiFQ2EPWFG5aJ/0JSGVBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lFqkH6r1t+bb2b3q8EJOHXC+waCSYNBxsk98CW9wDN1B+ql0tgSTaI85wtLyAiaI+Xi/DGQRMVJTno5T+CPOIsd+XGRkGGGRMI1xJB9rse2zw534zie0fiI7tF3Qj/JaadLxZoYAKLu6oFULEV/Gaf5HBZhbUaeSH+wIDEZHu7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SW0ERnKs; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so93233131fa.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2024 00:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881170; x=1731485970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs8Ss9deUl5XVYufQusJH2c5geYUc//oteJUW4gxtzA=;
        b=SW0ERnKsIXRWN5mDna/7qX6rZugzUGRRWN/UXG6E9BphUW37mwjhoUxsGiSvQGK78V
         MMCw2fxFxI79yQzDPqTGlOEVWfqaaVnmjFXsVsKJ6UGNNM61rX3RNtMaZEdIYFITGaCs
         LShVwBjwOlKVjIzdXS+n5nvdvi1R4Z4yKA83EthQsDOnaVJS5YdI5nGlhhU0xfkR6GXg
         e4cZ3dlMFLUncHeMpInNEpwVQQB1dXG/t4XfN1j5yFUACRYduGMnVIk/9hql3snS46L+
         0+KWSPsvg0b/45rM3FAdwFdqSO3nyZlvdwISYzBZWGxNV+yfHCOXuOy8p93lqlCxUSP/
         pRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881170; x=1731485970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qs8Ss9deUl5XVYufQusJH2c5geYUc//oteJUW4gxtzA=;
        b=aVWZYUpjD9fblUz7x8morD+425+6VwTBYnUfDI27YAM6UsB7/PJHaPdWsfE6KXZL1p
         eKNicUfcKTyDUFrFHyEbBLtODFXfA/w2VThUMXuisapeb0PTYWVd7oXMXTpGQsetS0/S
         A54ccUp34KKO++QE/76uKnBrsCZPK6RWNZDysWOYvQIQxm2or8sPV3cuT2AIDjdBJMt0
         llDKLJNxKL/8ZwA4EKmUNOUSaeAWmkrayRSQ60Eg0FMXNsICLbupUuBwPfB4NjbN95Wo
         xAwgst2gkitZ4ZdonUqYann6HSVBup7Q64nT7hc3kCIqbcUDCmEWJuBekDdEaTTBxhJF
         befQ==
X-Gm-Message-State: AOJu0YyaExpRSU5zN8UDKb5XEbYg+ki/6OlhgyNxAoTHFhrSEPwT2FFm
	TyOFnc1ZeTlf5A62S4h95VMT23Xv3USpfbdWsiv0oG9s/OmPY1vh9TEBHoNl0SI=
X-Google-Smtp-Source: AGHT+IE6bm+5nSovHMVfHCwPuTVdYgbqN3XXTW2qPIGl/kWKDFvfvED0CYNKOeuBjIaEcKEOrQ/zIw==
X-Received: by 2002:a2e:a98b:0:b0:2f0:27da:6864 with SMTP id 38308e7fff4ca-2fedb7a2d44mr143308401fa.17.1730881170289;
        Wed, 06 Nov 2024 00:19:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:29 -0800 (PST)
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
Subject: [PATCH 07/31] ASoC: sh: rz-ssi: Use only the proper amount of dividers
Date: Wed,  6 Nov 2024 10:18:02 +0200
Message-Id: <20241106081826.1211088-8-claudiu.beznea.uj@bp.renesas.com>
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

There is no need to populate the ckdv[] with invalid dividers as that
part will not be indexed anyway. The ssi->audio_mck/bclk_rate should
always be >= 0.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 2d8721156099..b4439505929f 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -258,8 +258,7 @@ static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
 static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
 			    unsigned int channels)
 {
-	static s8 ckdv[16] = { 1,  2,  4,  8, 16, 32, 64, 128,
-			       6, 12, 24, 48, 96, -1, -1, -1 };
+	static s8 ckdv[] = { 1,  2,  4,  8, 16, 32, 64, 128, 6, 12, 24, 48, 96 };
 	unsigned int channel_bits = 32;	/* System Word Length */
 	unsigned long bclk_rate = rate * channels * channel_bits;
 	unsigned int div;
-- 
2.39.2


