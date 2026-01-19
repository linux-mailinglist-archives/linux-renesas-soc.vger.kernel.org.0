Return-Path: <linux-renesas-soc+bounces-27076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AD1D3B7A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 20:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 737BD301D60D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBDB2DB7A3;
	Mon, 19 Jan 2026 19:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="D7ymDlD2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CF42DC792
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 19:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852404; cv=none; b=MbkEWwvjHkC1rEtbCMcoAQ5VcILFjI3ZNGRudfN3jon0fbl/jAFCLnxYErZSWdahRRG71Om9mHMHuTtlS9h2CLlRB4uSvj0jW4gPL2abKYTgl23qpHicOH16CiElPNiqAliWGwbeFd5oJPTl1hvLzJ6run6XT4O5NSkUPDu3Eeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852404; c=relaxed/simple;
	bh=OkSIcX1TDdic1UCogaglUYNDHLLvjkuOMxDbsuQWufY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pL2VH6nHQlsyWRLUdlxJgD/NXC21yU6Rn1MCOs+SraOC3tkNoorWYZyZTEreP8J86L1rQ6bg/+0KiLqk8UEhEV9WGizL+QH/gN5M/jmnuR168hCdq3UrIzp81YcmbmU7v3ASRrWW3sAPTwxpwnZv+BPomKG1usnyYG/4LhgqmkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=D7ymDlD2; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b9230f564so6127062a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 11:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768852394; x=1769457194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFLMF0ktRrYnvXvDNuXEPfc/Kts5kt/g8ss5+3byzFE=;
        b=D7ymDlD20jDqkMCgzVm6nMMpmIFYd5wNCzelk/+ogD0CxY3Rn2Yq3Y+LPWw4opHe6A
         gIosvZdxmi3la82fQSuILCEW4tNtwfCbwwQ4h57ZqllJB7YAhLtsiSzWIVbJGJjXz7nn
         G1ouviBl2A9nhoNm+EidcStHPgKF+WhwQ2miJHp0UTlyLSQXwrHx52VvZancaoavvcA5
         M+YAmhHypEfJny0UWBbry9Fq3jixOVBIK6On6WvUraPk0uBFL3t/N8KRZ4k3QJM401Cy
         PSnmt5HazzxHM0VSWE4vypKGYYS/3dZJfcLq2dlvqZ5cjoLnqNsgo03LEffCyfthlx0x
         00nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768852394; x=1769457194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jFLMF0ktRrYnvXvDNuXEPfc/Kts5kt/g8ss5+3byzFE=;
        b=FwJKIr59Xod5WGFD9BPGvdMBaIsR4IiCeiOGsqtQK/M4ESwxYx9wLyJrLFGn5rwpsj
         ShgCdMnTYy/edeoyRY8Tx30lKij2shtjml7BIEhnUdSOSOJ08EWdG5oJK/i1ANRjFcpO
         gF2By4CUCxVAgfvJieyndInjl6PLkb+hqYydqsIB1sLAj6uEfHt+c6OHs7BDHAPeXDzN
         ZmbEd933cB48WChPdHpt4PfkqMafuhScFFa/URTlOO3m+/zScvoc9Od1QgunYZEMJTS+
         tW2GxM+NWcHeyKvDS+FDKo92Zc5W4xH4m3dQirdLhhZCBQT54j7LrMaoweKi5n490Wxh
         XDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHztx5zgOy/LTuVY86A2gIwuAihT/Cy4/v8oVs86fYUuECDl3sUsDpCYf4YC7dA1NcoCcyBluBp6Wj5i3AH6H1Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzENwV6T363nho/y6/PrKxgYaKNS4zkF/WkQCGHd8HltxZwM9MC
	ElfbqZV7ESrVoCx4vvH7loEYbJwva9xZgjzh6oQv+Cm8Zltjq5vG8wKe2wo9ZNGC17A=
X-Gm-Gg: AZuq6aLvvG7t9Nik92FtqrW/oZKSNMdcf4mMIK7tdc1aL0H+VJ4Ir5vKGRwpb5jPn9a
	PRMenGiU5h9+pqy0jmOKh9WSjZCiniNK5t/AAC7Pp1NFhP6oj8nIFwLvYpuh4lW2mhpVk5Tclaa
	E4/Ry3T7eBwsx7roCEHUV9al9XIij5XAATFMkY2xzDz2XOrVxoO9Nc/xi/l5NVBOhbsIkG6GynM
	UH7JPYAwJ0PdUKk6T7lKC6nglsW+QUbOlS2cfUSDDYD5ZEHbXP+a8f4damUm7bHb8ZjZpnOmCGC
	4HOorPldM9jF4xnQO+7JPeXriDmoW6l/CjaITb2Qi+o18lIMMUEza8NVz9g0EBmVAXSCR2cuSJW
	TV56aCYlihshRiE3kkdeL1osMoSAgbcBaBmur+HbRuaUDdHJtGXBZH8dJUJLVur9KfgZwtIhKzh
	iV9m/AT8oQvL0HmrdE44WoXsMcfaTuQreCKqwkbFU=
X-Received: by 2002:a17:907:74e:b0:b87:2579:b6cf with SMTP id a640c23a62f3a-b8792fc4376mr1132619266b.41.1768852394000;
        Mon, 19 Jan 2026 11:53:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1167248266b.52.2026.01.19.11.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:53:13 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/4] ASoC: renesas: rz-ssi: Drop the & operator in front of function name
Date: Mon, 19 Jan 2026 21:52:51 +0200
Message-ID: <20260119195252.3362486-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need for & operator in front of the function name. Drop it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 694b32214109..76e7f0fe9df9 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1188,7 +1188,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		goto err_release_dma_chs;
 	}
 
-	ret = devm_request_irq(dev, ssi->irq_int, &rz_ssi_interrupt,
+	ret = devm_request_irq(dev, ssi->irq_int, rz_ssi_interrupt,
 			       0, dev_name(dev), ssi);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "irq request error (int_req)\n");
@@ -1205,7 +1205,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
 				return ssi->irq_rt;
 
 			ret = devm_request_irq(dev, ssi->irq_rt,
-					       &rz_ssi_interrupt, 0,
+					       rz_ssi_interrupt, 0,
 					       dev_name(dev), ssi);
 			if (ret < 0)
 				return dev_err_probe(dev, ret,
@@ -1218,14 +1218,14 @@ static int rz_ssi_probe(struct platform_device *pdev)
 				return ssi->irq_rx;
 
 			ret = devm_request_irq(dev, ssi->irq_tx,
-					       &rz_ssi_interrupt, 0,
+					       rz_ssi_interrupt, 0,
 					       dev_name(dev), ssi);
 			if (ret < 0)
 				return dev_err_probe(dev, ret,
 						"irq request error (dma_tx)\n");
 
 			ret = devm_request_irq(dev, ssi->irq_rx,
-					       &rz_ssi_interrupt, 0,
+					       rz_ssi_interrupt, 0,
 					       dev_name(dev), ssi);
 			if (ret < 0)
 				return dev_err_probe(dev, ret,
-- 
2.43.0


