Return-Path: <linux-renesas-soc+bounces-1044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58634812F23
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 690F61C215A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7CD4176D;
	Thu, 14 Dec 2023 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Txa6w5xm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B35F123
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:26 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-550dd0e3304so7460797a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554385; x=1703159185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PL5VROIQlUnuTnBZqVb2KKr5+vHUGpVIHNw8m0ZONHU=;
        b=Txa6w5xmmyEoli356lA+ucuv/peYFuyf6grVed9GrzHIrbYFN9wvFUpFBLvkgXD2VD
         S3GYhVrmlzbZ7PuHcjxFe/p+uSjt/R+JkAu4XzYjLQv3p6nMpoXMaNgbcWuVdLB7JF50
         F9myfw4fw1ZnAaX1gVQOzMe+nsCjqxU8Z7c3/G2V24AJuqx4D+DXfCi/w/+KnBeHmt9K
         l3NwvkEIffbtRaI992uEXd9XwyJUPdbtWrddjQ3Pp0GbtqY1R6WbJPTUgAWKHM7kULrw
         9uch6FJX8JNqjPIKKqE534aKOHHQLTxBAL/ghku6XV6unQdbng5vaTkO1w7/tC1xanGQ
         6tRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554385; x=1703159185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PL5VROIQlUnuTnBZqVb2KKr5+vHUGpVIHNw8m0ZONHU=;
        b=IGMDYXjWrWD24B3fyf/+TkUf4M3X4aYm2o0UszMQQl1ZdSdOovEXJySXoHn2sRvZNu
         0sDtYa6Jz8CBqvczKbz7X5YpPH6C9Nh4nDqAqHW10ErZ3NLVMdphGJeJ2H4ZMUKYBARD
         vhFC5Dgm8ox++hHSK2FsBwFR2cfwGLbPsq+6ygcBSnAIvVXa+9xVoKFKj3Yg4YO4wpDz
         rqetyHNKu54vy061OvbP4ZEXNO02sC6Tv9qIKllzI5lRlylIDeci/5YlnWZ5L/5uDl/L
         /EcksvTstajXtP7cR1B2bJCku6OVHd+nTkfdHmB0oH4JklRHwqV+/8P0nS3r/7X3X+QE
         eVZQ==
X-Gm-Message-State: AOJu0YwJYYW2W3THTTvfw2sqS8GeQ/Yen5t0qW+uzOyK9ZSD6yZnGPbJ
	bRoX4qzNKJ3pHGstHqkgTUC8gQ==
X-Google-Smtp-Source: AGHT+IFilY+iQeeK0x22eHDsUc6bGf7W5xarJ763eOpTEUGRRm8kqwNrurYkInmGp1MIRP3FbelzjA==
X-Received: by 2002:a17:906:5350:b0:9b2:c583:cd71 with SMTP id j16-20020a170906535000b009b2c583cd71mr5817776ejo.50.1702554384854;
        Thu, 14 Dec 2023 03:46:24 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:24 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	wsa+renesas@sang-engineering.com,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v2 04/21] net: ravb: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and pm_ptr()
Date: Thu, 14 Dec 2023 13:45:43 +0200
Message-Id: <20231214114600.2451162-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() are deprecated now
and require __maybe_unused protection against unused function warnings.
The usage of pm_ptr() and SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() allows
the compiler to see the functions, thus suppressing the warning. Thus
drop the __maybe_unused markings.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v2:
- collected tags

 drivers/net/ethernet/renesas/ravb_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index b4d5a14ac4e5..82085bb9b7a3 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2978,7 +2978,7 @@ static int ravb_wol_restore(struct net_device *ndev)
 	return disable_irq_wake(priv->emac_irq);
 }
 
-static int __maybe_unused ravb_suspend(struct device *dev)
+static int ravb_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -3000,7 +3000,7 @@ static int __maybe_unused ravb_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused ravb_resume(struct device *dev)
+static int ravb_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -3063,7 +3063,7 @@ static int __maybe_unused ravb_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused ravb_runtime_nop(struct device *dev)
+static int ravb_runtime_nop(struct device *dev)
 {
 	/* Runtime PM callback shared between ->runtime_suspend()
 	 * and ->runtime_resume(). Simply returns success.
@@ -3076,8 +3076,8 @@ static int __maybe_unused ravb_runtime_nop(struct device *dev)
 }
 
 static const struct dev_pm_ops ravb_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ravb_suspend, ravb_resume)
-	SET_RUNTIME_PM_OPS(ravb_runtime_nop, ravb_runtime_nop, NULL)
+	SYSTEM_SLEEP_PM_OPS(ravb_suspend, ravb_resume)
+	RUNTIME_PM_OPS(ravb_runtime_nop, ravb_runtime_nop, NULL)
 };
 
 static struct platform_driver ravb_driver = {
@@ -3085,7 +3085,7 @@ static struct platform_driver ravb_driver = {
 	.remove_new	= ravb_remove,
 	.driver = {
 		.name	= "ravb",
-		.pm	= &ravb_dev_pm_ops,
+		.pm	= pm_ptr(&ravb_dev_pm_ops),
 		.of_match_table = ravb_match_table,
 	},
 };
-- 
2.39.2


