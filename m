Return-Path: <linux-renesas-soc+bounces-10330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CFB9BE090
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 09:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E445E1F24A73
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 08:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708C91DE3D0;
	Wed,  6 Nov 2024 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="A1x1Nyyq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C52F1DE3D1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881195; cv=none; b=gcfxn4p5wUr8ACVIxMjaOasFD8jw3lxjO8OGa5murNO/YJu2YcErjaAcIeFRBiwabveDq3TvSNFwwCmjL7/4vdp8ZE+UEUKyHCoufSQXuTVWM1CxVd/EZqAX3KwJ9ep5Rk5npwQa8RB5nbZonWyGuNjtPtJ1oiaadhYhprX3PiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881195; c=relaxed/simple;
	bh=Vy8q8hLeLN/uSjTjj1O6cVO0bfFoNiDhs2RJ5weaqXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RZdnhVJfYRIGYLPXAHVG5rWVdzDicL6CkQf6+GwJFJyA48+zduUWZVKxPOz5YSRH1ZeVFFJD+Ff/mrBVRqGPFtVSMFvm42rGeR5XA2zL6sf8hsA7IFKl5h7jCQ35j06wEP0CTs3ZAtzuQgF7h2bAcWYgUgbSYZhMFquVmiDZMes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=A1x1Nyyq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so824948566b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Nov 2024 00:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881192; x=1731485992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBGr+/CU5GKrA75XPsK9kUx9Q7JVQRjFQnq3d+qtODI=;
        b=A1x1NyyqyLY/LcC6DKLayttBkZ8jtAx37pzJGnSpxVuZRdE/y6jw6aI5X3NXkVSA/e
         fSFdYtxUlJiPTaQMln3O9A0bo9X6pMbNlEjbPk1JUOP/RQOF+jMSFJS9ZboAGsqtZOCP
         /famd5BcrEHFgfrEtXKLUCiEjYvYa0BmzEAAfZFNom5iuy2xb8NkVMychF9q3d9hWTwx
         qmri4GsaGL3HBPZ6AWqwQ5kBoTxnPjTSdNWZnZF+RCRORpenuM3VVwyLmy+/jqHC45Qj
         IUroCiQsjj7RuZqkTw7z09Uh034Khk+qL6P4nql5fNNnzF1vmNxhMmi0idKnO75+j63J
         ag8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881192; x=1731485992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBGr+/CU5GKrA75XPsK9kUx9Q7JVQRjFQnq3d+qtODI=;
        b=r36QwQMi5ZX7nQ1mQ6AKdFJ2ivc6/hzA/Y++CRMyp53hv13PgV2iQQbV/uu6TCKK+e
         hyudElrubDcHnSDi+tLY+KV/H4/wadErUyXvZ1R+4d3AQNWxrJ1ARJz97it+w1FH6Vd3
         mqQWsA1vO+YmSCYVzdph03M6ngipJ+k7+duEeB5amzXjzfei5wC0CVHPvI4t83dg9oML
         nrtKZRGrpSmTWYP1BUljMqGhe6V66EYtQgN5mg2uINAXZB22S87P6ifKgablp9GdLumt
         lj+LF5/DTRwR0jq8vpDpsZ0H14u53sLZeTsYlgjRMavuyeZhu6wsQBqNF/CTmcOedUB2
         R/WA==
X-Gm-Message-State: AOJu0YwWBnhMuaOdKAQ1SwVAsQoYgJOJQ9zw3nFRY2SYKlu6gH4+YjcP
	ykpnwevaPrSIzrJeCINlra7e3W7PVB9VH/60brvApOdUc+rdYUsTL4Nt+aiZoos=
X-Google-Smtp-Source: AGHT+IHkrgvVybjiJt178ijNfP0NNcD+icE3rT0yU79Y+ArFB4PmGtvQCUZWvV3EcRLAXzj7ZqkSBQ==
X-Received: by 2002:a17:906:7310:b0:a99:f779:ae0c with SMTP id a640c23a62f3a-a9e50916803mr2296299666b.25.1730881191714;
        Wed, 06 Nov 2024 00:19:51 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:51 -0800 (PST)
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
Subject: [PATCH 17/31] ASoC: sh: rz-ssi: Enable runtime PM autosuspend support
Date: Wed,  6 Nov 2024 10:18:12 +0200
Message-Id: <20241106081826.1211088-18-claudiu.beznea.uj@bp.renesas.com>
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

Enable runtime PM autosuspend support. The chosen autosuspend delay is
zero for immediate autosuspend. In case there are users that need a
different autosuspend delay, it can be adjusted through sysfs.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index e17dc1c0bd47..be96376dcd0f 100644
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


