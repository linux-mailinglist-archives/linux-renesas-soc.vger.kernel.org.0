Return-Path: <linux-renesas-soc+bounces-10417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7969C1B6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 11:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FB18B25359
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2024 10:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0691F585B;
	Fri,  8 Nov 2024 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KamFqlYV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C71E3DF4
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Nov 2024 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063055; cv=none; b=G6kyHIMc4dydBEiyhOA3BAO2O+jfC85syEmy9or2lFFWs5NhvH7ElsyQwyMULNT+Iu7xRGhr/zaXx+yB4DzcJTC8A6Ht8DKQlcZmSI6BHoe92+FchW2NjqrB0m40qKd/yiRM0td5jX53EFiFDYVVxLUqBbSaHM+AQbXe4D3ImJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063055; c=relaxed/simple;
	bh=2PCe0KPg32gqCcVNDQNhmzPO/yYVoFRK2EiIUxDhWkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tROkdlfkmmUUWmyhKDUk/ptnhWhRLA8Zg5PvESnXKOkv+mTgdgu53eyIs97nJAnqdZmcpPGDIH08dsKQqU9+NWS8kF3F+zlOp75XxcSjhUcX9JXwDXHdjx/Xt13bQyWw9EU9+C+9yh7MKw+EH8SaGcmMzlGwZprDpYonD3H1qVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KamFqlYV; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1e63so2404598a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Nov 2024 02:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063052; x=1731667852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmXGRhaJRnp01BXYlkVN8dDsItsXKSTOjtaKujO1eXw=;
        b=KamFqlYV9JlAW+XHxAl6rRaYQcLltnlvvdChnHEPdIDryzoZgfpW1rikgD1G2XbXPz
         8zcG9XmpqzAztxSr6Tlmf7k82J1n3z2mqY/gq/3OJdA83BY71mt5lkZGaXhtF0nJOogk
         +VJcBsLd347llcisAq1STTOff5j1gSocziQeVYyNZdVp6VS1nbmcyEtgAIbtbM25gK8d
         Y1QqISNPu6ZTyl2tM0FJGowtTMf1/YSKEpGgIE+A8QFf+sCJsKdh+eyeJqYGpmR/I8zL
         KlVIeBmyBb2JzTi6WKiuOL2X43IW4D3AziFYU2rDGDTPpVfPF5Aieq2hSThU/bzFgBYJ
         Ugsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063052; x=1731667852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmXGRhaJRnp01BXYlkVN8dDsItsXKSTOjtaKujO1eXw=;
        b=rFt7WSqXRjujfHNJGSFSdm0CC3MvxZ/3y1038Blo/9UNE0wpT5KAfj3AU+dOnw9C1V
         7KwAbt93uRpwbzGVL4gIP7Je+drLTwQJtZPbVseSn4kmGI+TsIn6KIjmLa55zLbGouLG
         u6V+1NhyRcp4K4GZdmRRLNuNSi0M5pNHNMUF+n2BX0WSlZRyOozG477bTSFhpicBuKUS
         QP58CdKa9iS2g3c/fKWuzfBd+EEGY2nUxUkPEmQ9Na3+bxECuyvYUEaw72z1jMFxnj2v
         Zj2j53ZYHNp0HuO9wbAUBz3NmbFcHFt7iuaBwaVbU1v9gnc8NDqrK93TcZqdKoMIohzF
         YBeg==
X-Gm-Message-State: AOJu0YwcE1cd+qJuPlFwh744L14hos9OOgIJPh9AQJBXeIgg8ZaxIPBw
	XZDoWymhyZndxIlYurk2n4fJa52fWXBBfbez1NLt3XNUELPyAt4hqO5xJ1dKldc=
X-Google-Smtp-Source: AGHT+IH0r5miaDDJh3qcrxQ3YOXZk9cffFGfj/2dKrk6beHOdzL6PXB1jZMLS7FCEfSw8jKUBbjkGw==
X-Received: by 2002:a17:907:6d0d:b0:a9a:61d:7084 with SMTP id a640c23a62f3a-a9ef00234b8mr199857766b.50.1731063052126;
        Fri, 08 Nov 2024 02:50:52 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:51 -0800 (PST)
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
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 16/25] ASoC: sh: rz-ssi: Enable runtime PM autosuspend support
Date: Fri,  8 Nov 2024 12:49:49 +0200
Message-Id: <20241108104958.2931943-17-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable runtime PM autosuspend support. The chosen autosuspend delay is
zero for immediate autosuspend. In case there are users that need a
different autosuspend delay, it can be adjusted through sysfs.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 35172630be8b..01e8b6a4e8a8 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1140,6 +1140,9 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	}
 
 	reset_control_deassert(ssi->rstc);
+	/* Default 0 for power saving. Can be overridden via sysfs. */
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable runtime PM!\n");
-- 
2.39.2


