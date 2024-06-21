Return-Path: <linux-renesas-soc+bounces-6609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 752C591234C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 13:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FD2F2855FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 11:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9A217556E;
	Fri, 21 Jun 2024 11:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Vpd8Nudd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7322175544
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 11:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969003; cv=none; b=VgEaEtMO5PBzBheTs2YOo3n4+W+blB9XbeotXgQJf5uHq6pN8G5qyTjL3QO1UJdUwM/G9qG+4zKWpulhkz/BXhgvdiRLPMgfMiSEWP9ofJ1ejdbiJ1Gk1WjkSIWtorPFooKNJhI3v+TfIgOKKy2FI7G2BZzezwJXowxppjsv9w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969003; c=relaxed/simple;
	bh=NQzIWHZbQOQ5hZWT2KZyCkN3O4AwH2pGjBQniFQN5pM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QEvQSyQM0NvPOL8zBaCFpWDNZP/e3Q0eUKQSAO8TATqzEnWzYBgArsXKjQNYCOXZo7bI8kw5RC/p22viF5P+oku8PwIpbjlt9wn2FS2AiA2BgDYicvenUUS0bkTLlxoZcpt6mKuu9WM7AJ5ksEeYJzlm/ZNokmprV0iRMrRkGHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Vpd8Nudd; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a63359aaaa6so266654866b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 04:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718969000; x=1719573800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0bK5sELhW9b20RoSzNu6z24gTPhP8Pd9YLVyDsBpSI=;
        b=Vpd8NuddfU3hYmAsYrmQjUyfigmwDidsq10zMqD4nDZOEIH19NUoCE36RyWvLqFGbs
         gmjnxRqAFzvNZ2/4PeDTs6y5KchXLY6uP4hIIjmPEljXRa+uYt8kmFVYr9/A9LUjS9Db
         sguWhi/FssnW9TONpiF2EqMU9Wasi0n6kxWXz8gevLFditWhbUB/PCK/ntGMDMy1gOwQ
         qeCR248ZM47wWVYCSeaXhXmTYm7osLOhJAY2CJTFTx/oGb+VKTvOQJJGkp+4HC1QtHQX
         HhiR5SwzCKy5cCbO0J0c91P9yVzAvVNrV+ymyA2CCGT4yNPxSHCTUoykGAMTbwof3ouw
         P4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969000; x=1719573800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0bK5sELhW9b20RoSzNu6z24gTPhP8Pd9YLVyDsBpSI=;
        b=vca0BDiXaSHcnSXyLB4Thb0WpkJE6RCTIZxLQG/1oeDb3xlicGQTQSpUBTyXULpevh
         z3+Y+AWntPdYozU5Yjeh3l6EiV6ZS5J9bFx49SH1xLHWaSo4/1afZxtMdTJMdkJ3pTOa
         +uEn50vKfV7pjDQ2m7VNG8vvd4x/ttUtmgx4R1xFHTFsn+SK/Rs3p+Bn8Wg+zlacuQfY
         dF2HBZSrbablxYU+iqd2N+Vh/bSe9+OxmLnTbGVO8JQ2vZl888QEGWf7tJjo7Ogakco4
         Pd3uwT501pafFABsrcD9uPdGJORmxDF4+Y63ddQezT0CXjA9ZZQTwLQp/JOlSnd4v2r4
         8tfA==
X-Gm-Message-State: AOJu0YydP2OjWAaKk6bPcEPmrSyqw82J+l41JDbMvceRRqccgOddMjxI
	4LSSSiTfQNo9arP6zrBIwhEQKWlhKo2zgK1WIeaiaKnBZCIVcGyb5oBSD36YrO8=
X-Google-Smtp-Source: AGHT+IGllrhtLTISfndDW1RoyJxEoneoZGKfLjhvsC7mU4Me34BDPAm0LGxD7vGESeYf1S8qDoqr7g==
X-Received: by 2002:a17:906:bf45:b0:a6e:f91e:efd0 with SMTP id a640c23a62f3a-a6fab779a0fmr562920966b.56.1718969000335;
        Fri, 21 Jun 2024 04:23:20 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd0838345sm64498466b.99.2024.06.21.04.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:23:19 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 03/12] i2c: riic: Call pm_runtime_get_sync() when need to access registers
Date: Fri, 21 Jun 2024 14:22:54 +0300
Message-Id: <20240621112303.1607621-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to runtime resume the device as long as the IP registers
are not accessed. Calling pm_runtime_get_sync() at the register access
time leads to a simpler error path.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index c08c988f50c7..83e4d5e14ab6 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -301,19 +301,15 @@ static const struct i2c_algorithm riic_algo = {
 
 static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 {
-	int ret = 0;
 	unsigned long rate;
 	int total_ticks, cks, brl, brh;
 	struct device *dev = riic->adapter.dev.parent;
 
-	pm_runtime_get_sync(dev);
-
 	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
 		dev_err(dev,
 			"unsupported bus speed (%dHz). %d max\n",
 			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	rate = clk_get_rate(riic->clk);
@@ -351,8 +347,7 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 	if (brl > (0x1F + 3)) {
 		dev_err(dev, "invalid speed (%lu). Too slow.\n",
 			(unsigned long)t->bus_freq_hz);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	brh = total_ticks - brl;
@@ -384,6 +379,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 		 t->scl_fall_ns / (1000000000 / rate),
 		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
 
+	pm_runtime_get_sync(dev);
+
 	/* Changing the order of accessing IICRST and ICE may break things! */
 	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
 	riic_clear_set_bit(riic, 0, ICCR1_ICE, RIIC_ICCR1);
@@ -397,9 +394,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
-out:
 	pm_runtime_put(dev);
-	return ret;
+	return 0;
 }
 
 static struct riic_irq_desc riic_irqs[] = {
-- 
2.39.2


