Return-Path: <linux-renesas-soc+bounces-11179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC059EB81C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 040291883266
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CEF23A580;
	Tue, 10 Dec 2024 17:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EGQjxsQc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163FC2343B9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850626; cv=none; b=qXdizhqrG/yEq9odzAftrjY99ASv1stZIlTJijRVqy7VoQBNY28Ett589xPfVU2C4P2ZwWrPsXe+KlXhOXMbHUv1boNE4lGI2Rt5bCNgV+HVoebOjRRwCrUJls006a//X7jZjf70uwCQ75vzF1NA2ULhy+bFoyYF+8sgAPiwBtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850626; c=relaxed/simple;
	bh=RalPxCPilUWbjYvZHpa4B7ebOphri7Uk5DSwxD2axvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LS0cqxXXokkz5ZLMGjh3JL2BLiG2rtVOV7NLK5Cuwqoa6fa8JwzvnymcsT7mAASMS/7/tJPDYCyv9R7Xg4H2H7RfM2z69ELaf9732xlWcsLQNiFUcp2pXrae7fGxzii3DuXSxaWvJzQT9qA07KaO43hI/NmeVh3m11TLlBulWcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EGQjxsQc; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cf6f367f97so8533283a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850622; x=1734455422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quo1xBiWZKYYPo7MUB0R0AMbPr7YypV5dW0W8isrnRE=;
        b=EGQjxsQcO50WGgYmy6Zfh/+57aYcCdg7phDM3bX4pHrdJ37AUoYs2w6rYlD3P/XnRK
         vbL4L65+v1Vs8/KJ6KMpaAyDEC3qzyhLAgeaE8b3jPpr5Sp0/bkbIKVdJwAWc8tRUM2s
         e176Of272Zl/+1F40fo8kkusiwXkwbrKNL/BAsJiIYuXe2GcdgzbDM1m0h0F6nroiCsZ
         joj7pJLA3cycvZ3GPh0FWXDgEcNH1zATjoJsy/jd3R4HboJBtquK5AAXIz78ftY6qrsr
         gOFAOI3bx1NzbuB8EsLg2Q/0peDZCDQLDozqftozXP4vufrfhcgScr5Var4YdT3at6Xq
         Qu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850622; x=1734455422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quo1xBiWZKYYPo7MUB0R0AMbPr7YypV5dW0W8isrnRE=;
        b=aU/zty/+Ny3AdK4vNsTw2RuEYD7KCsvWsDPrTibP78J2gOCNE55Agq1dMeaRLpgm87
         BloejSrIf+w1GGTB0NYc45Uu/I+GfCRibZe60Ki+Nb+jFvpY6gr+839pu+NEA2+GaAWz
         gpeBtpKbdNNnoVX/bMKpv0mz8PwA6//9wTfZxbwRw5hDZVi2JekGbtQVF1GenzFLOsg1
         BKkB4tgWHd1sblLr/hMO/fabR0DSkKZzCHgNJIl+jQ0Ygm6K6WSwSl8ZoGdUdze6nhLc
         9K23XXt/PhZrfxiNZADdMqI7PevZnFM6Pgh0INsMzqIDHrZku4rvzgwwpEZcFcPvOtrx
         gehA==
X-Forwarded-Encrypted: i=1; AJvYcCWyMOA5lHhtQtwY8zvLX/wDodFJF4o9/a/B3Whc5Kb8LU3RRncY/IquAQyTvsnko+Dc4DXpwkBAHvkW5kLXlUyidA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYxUfOIFLau8et3dIJtqMBF/I6hZGlqv1OAabgPdKWDu9GGTQs
	HxzLHYAXnqJnk3E/aT6Z95ma+Vgr9s2Yp4cH8aRsWI6pNJfbP5sPqmVL9YnX+wU=
X-Gm-Gg: ASbGncvaF1WwCAY/lzbRguVrD4fr3av0YlyYBLFkPC3m62tDygbZ773vEhmrT0l7Vf8
	Cvj9rftmXgujx44OcVzXV7L1P3KFvphTyLu0IyEeA54Q8+6s63/L+g2i2Y5QzAe6LELCfGa/n+F
	xcm/dAQYokN3RuKc3AOv6yqfqZwPOw4pp8TWdyHgMIwW7ZKs3g/fHCx0Acy1x7Ceu3B/okb+8Z5
	1lkM6vd0CnEXy4k1TzaznSdi6GSiCZUfn9opqkZ8K0ldq5d/qoAuB06ldQpUch0PO4x5k3Omomp
	3ZwRxevj
X-Google-Smtp-Source: AGHT+IEVq5G+gawrHiPzQYVclV2UevSYSlAdxNYl7RmLq5d6hxx+eXzeCUIVNOyKC/W4oWQ1f5HO/Q==
X-Received: by 2002:a05:6402:1cc1:b0:5d0:ee52:353e with SMTP id 4fb4d7f45d1cf-5d41862ed58mr5867285a12.29.1733850622148;
        Tue, 10 Dec 2024 09:10:22 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:20 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 07/24] ASoC: renesas: rz-ssi: Remove pdev member of struct rz_ssi_priv
Date: Tue, 10 Dec 2024 19:09:36 +0200
Message-Id: <20241210170953.2936724-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove the pdev member of struct rz_ssi_priv as it is not used.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 35929160a8a5..b24c323ee05f 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -99,7 +99,6 @@ struct rz_ssi_stream {
 
 struct rz_ssi_priv {
 	void __iomem *base;
-	struct platform_device *pdev;
 	struct reset_control *rstc;
 	struct device *dev;
 	struct clk *sfr_clk;
@@ -1043,7 +1042,6 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	if (!ssi)
 		return -ENOMEM;
 
-	ssi->pdev = pdev;
 	ssi->dev = &pdev->dev;
 	ssi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(ssi->base))
-- 
2.39.2


