Return-Path: <linux-renesas-soc+bounces-1304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E26D824FBF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 09:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E57E1C22C1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 08:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309F221352;
	Fri,  5 Jan 2024 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gz0z3JkX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D724201
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jan 2024 08:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-556eadd5904so1435547a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jan 2024 00:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704443060; x=1705047860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDs9Akz57womT08DVky7rFMtepErNq8iSOIi4YmQXqE=;
        b=gz0z3JkXdw3ziKjIWQv3Mszf6ZW+c+Aom2V903pFx32D7s4lR2I7AuDNqtB/VU/RZu
         c4rAAbfc+thC7JCy97nj+MLldtRlRW8Wamn7KW5wzb6MGYDedKSUz45rnXGse6IeJqN4
         oV1FU8oD6tHcLf/gqG0UzBOjDH1E6v7aTJ4iGWqe4DvyZNSQ4V9gvy8FCUZ/gjDCDRYz
         XQee16CILcuIGjwpwOXczlwGS7g9huy/KBEpdRbY2QaVUIrBDGzrJ3Hr4Kbf1agiacal
         IsnBGo7/wjV1T9sUolRl7YC8ho9+nPYANKIQAit8QKAZvVbCHGJmEGYLifgYDVrqkG/m
         n2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704443060; x=1705047860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDs9Akz57womT08DVky7rFMtepErNq8iSOIi4YmQXqE=;
        b=ulRE1vycd+uTxeLt0s+gTYQEcwFKFLKJkusDQ70RKcCoWYpdCTULYocEkaB3uOF7Q8
         CkyVBUa4ZDTNq1y1P0F4Ai1vg5EExljPs/xRlhpDYabmjOAc+EaMuuXGAitRXU8zxvE/
         Ry26ttLD++17c1uG4k54e8DRNNtAM0GweLKjGSkh2Si/KwF5pAMXXXS3a4H3VWZo02X6
         X5FrgtniMn4WHLdcJCfWk/9PMO2xr7OKC3lMLO+3YtK+JdmyRlFACKFMRrQIsDO3YiOU
         Vj+HDWYbKDB8GlOzFTi7m2Wr7Iug1tleRAqqy4tmJfR4Wo6rfDzjyAs2NfVy1Gz2+ZVm
         DGEg==
X-Gm-Message-State: AOJu0YzbwkR4WWRi5IamascmgYbHUKkfCMB9VbgVuL3FiWeOQdxlcsfm
	VtzTWBFZ+lyU+P2unSE2gSB4kXiBy/AX0w==
X-Google-Smtp-Source: AGHT+IHqmtFCSgw1cONAaBwU1ihmoer/2JeZbk3CuC16uomx3vJtmYsNiYFYhF48+bd8SMaEJXJpQw==
X-Received: by 2002:a17:906:5342:b0:a26:cab1:4076 with SMTP id j2-20020a170906534200b00a26cab14076mr407535ejo.125.1704443059724;
        Fri, 05 Jan 2024 00:24:19 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id j15-20020a1709064b4f00b00a28e759a447sm596198ejv.213.2024.01.05.00.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 00:24:19 -0800 (PST)
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
	wsa+renesas@sang-engineering.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	geert+renesas@glider.be,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v3 04/19] net: ravb: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and pm_ptr()
Date: Fri,  5 Jan 2024 10:23:24 +0200
Message-Id: <20240105082339.1468817-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
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

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/net/ethernet/renesas/ravb_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index ce053047a9f2..53ca5d984e8b 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2971,7 +2971,7 @@ static int ravb_wol_restore(struct net_device *ndev)
 	return disable_irq_wake(priv->emac_irq);
 }
 
-static int __maybe_unused ravb_suspend(struct device *dev)
+static int ravb_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -2993,7 +2993,7 @@ static int __maybe_unused ravb_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused ravb_resume(struct device *dev)
+static int ravb_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -3052,7 +3052,7 @@ static int __maybe_unused ravb_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused ravb_runtime_nop(struct device *dev)
+static int ravb_runtime_nop(struct device *dev)
 {
 	/* Runtime PM callback shared between ->runtime_suspend()
 	 * and ->runtime_resume(). Simply returns success.
@@ -3065,8 +3065,8 @@ static int __maybe_unused ravb_runtime_nop(struct device *dev)
 }
 
 static const struct dev_pm_ops ravb_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ravb_suspend, ravb_resume)
-	SET_RUNTIME_PM_OPS(ravb_runtime_nop, ravb_runtime_nop, NULL)
+	SYSTEM_SLEEP_PM_OPS(ravb_suspend, ravb_resume)
+	RUNTIME_PM_OPS(ravb_runtime_nop, ravb_runtime_nop, NULL)
 };
 
 static struct platform_driver ravb_driver = {
@@ -3074,7 +3074,7 @@ static struct platform_driver ravb_driver = {
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


