Return-Path: <linux-renesas-soc+bounces-26403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF119D02389
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 11:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECB8D30F2703
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 10:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592AC48D63B;
	Thu,  8 Jan 2026 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l7aIJaq5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE8548DA23
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867972; cv=none; b=E2phEes+hBZjWmEaUO+SArF3cM0Udt1XiYkM1H21HYrGFrUM8HXvHLa27tW1AZ1cOLxSSyY1yb8cDWFajha+VKSlqqfob9JPFilWT1Tv2jQXOaFid6fN6b60+fmpyjzvER27K53yhR5CRBbQ02GzOhSvFa5RpQ+eYQ3fPBUK3eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867972; c=relaxed/simple;
	bh=aud3hA9J+dNP/yaWmli9RR/ktDD7fOSwXxacJ9Zj1/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cknZanBOZkH8zU55yUZuG+jetj1FgPMGSyvs2XVbzqVmTfXoA275IxqH1tm+zVIEjVdwuPGO0iWXuYQH0M+PjiCLD93lt2gEgMvOejk3FnZ+qdphlEwJoddg+EA5YgUSmv5NIVuYjZQuskKt8PcCF5qnjMHgCVQHZtHZIu0Y9A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l7aIJaq5; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-430f57cd471so1559907f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767867965; x=1768472765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKGt+zbBP1z1Ia5xu+9oywwacO9PwHZAgfPXexEJe7M=;
        b=l7aIJaq5CPcgdJLrySghxGV4kWKSFlavhVoxHr5mpsHM5s8kPWCokwtx8zP1ggLvUQ
         W9xF8Me9U3N0dCvVQ7mM+mS7wHKm12h5yojhoplCV9pOv5GUqax+LMdHIh18NORjo4jB
         JKQiy00IpK7h3OJoV0Br8qYC8+G4mu09QLcXoMFk/NSdC9Kq7UZoCG7q9H4vKnqfJosQ
         4r5txZ91gKnLg79vTmMVLMUBSjIuksjeUiKabn15z/EwPSPIKfOPBlCQWB12nfNHlR+1
         QCwb+if2TlImE3v0ZV5TO+4uVXNDX17Dzc9seCn253i1qKo5fGXJQkj6z+MslYfM/jZj
         9OJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867965; x=1768472765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKGt+zbBP1z1Ia5xu+9oywwacO9PwHZAgfPXexEJe7M=;
        b=o+rIRAG1IbZfzojGUjThr1M9VxegCI/oGsqKfGeymfsCzqDikOM3pmnnsDDhqI4Sn4
         rhZc2csLPe1Ak2sqjrl3+IAKwoJLUNh/L/TxZR1lpkjP4krJ97mU1cd/D4sY/lYiwTwR
         bs2GYVnkShj/GUkokuaStHZaCDVVUvVApN9f/OR/ULakWWeU0EsI8JlwTLjeKeF0OQoR
         po+mdPPiIX3PN+ygayJgNcvd2rmQtUYph2SqzKFr/Os858FC4kw/sTEmpHZ/lT6bxURg
         4TLz2/fvMEFmkqcV1pIUbxAobZu3nm/Jok++msBS2sQRoY4+7d4y5eiI0CmrXcjKlpj8
         X7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzsEop8/Ge+zLIK/Kyd8lq4FOVXorbOJ2X7i+GC0HUKtL6sk2W5ot+I6pF1mhymZmknm008IKEeg57lmgk0/pVZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfWm04N899JQBeGT9KrFN4x2JhpHAEGGfCwgwsw+yAzhMCgiOY
	ahorHvgIvNYNao3/e3viMke5bnwZHT6GP0ro+EG9yJEn4FoRB5vxNBOhsuG8WDWkBNI=
X-Gm-Gg: AY/fxX48SiwNH4fW+RavBa4Lq0tVLHBVKyCRowaqbtAD0OeNYeYe1wDqTjfaT8c2p6o
	SRy1+eVqJPqQuDQgzCn3XgpgJvQNtmBoZcd55IzP2IiMItZLNxHjGNzcSyu+psfAzj6GolMe3yD
	akqAivPAlQpmiV1qT+fiYGQU3QfvBKV3PxRhDPiNU+5hLGbAWKngHEY4nKxwGummIvVw1ReWr17
	NkMa4zp0DyXtQcxng+I6rUUxJuDSJMCzJG0xye303PC3PtdR2h2vMQB/nfc4+96zM57m8eRUVkf
	Qrmxqkru0YUEdHS5ZMKWSoD3z0azdWI2YrVPNqKQU7RyAuOQ6QH73w8OqOOT0IOwzbWl9A9HjE3
	pGCzT2gYXsK7vgYJJvaiLt36f2nDje+onJOztzMmFZQKBT3nleYqYzJibKzxDfa/EEb5u6HkKrX
	LZKg2ovKNbR4I41xoCYrA8GG46BMPTcblnR5fjKfw=
X-Google-Smtp-Source: AGHT+IE6zYO5DX+NSREb6ieFD1ZGkz81DazBVs0kBJL/t8pOFQYJ8lc0LFWfcp71Js9AQoleM8JLHw==
X-Received: by 2002:a05:6000:288f:b0:431:4bd:4edf with SMTP id ffacd0b85a97d-432c374fe9bmr7317994f8f.36.1767867964822;
        Thu, 08 Jan 2026 02:26:04 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df90dsm14925966f8f.20.2026.01.08.02.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:26:03 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/2] reset: rzg2l-usbphy-ctrl: Add suspend/resume support
Date: Thu,  8 Jan 2026 12:26:00 +0200
Message-ID: <20260108102600.3477012-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108102600.3477012-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260108102600.3477012-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G2L USBPHY control driver is also used on the RZ/G3S SoC.
The RZ/G3S SoC supports a power-saving mode in which power to most USB
components (including the USBPHY control block) is turned off. Because of
this, the USBPHY control block needs to be reconfigured when returning
from power-saving mode.

Add suspend/resume support to handle runtime suspend/resume of the device,
assert/deassert the reset signal, and reinitialize the USBPHY control
block.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- used pm_runtime_put_sync() in rzg2l_usbphy_ctrl_suspend()

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 94 +++++++++++++++++++++----
 1 file changed, 79 insertions(+), 15 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 9ce0c1f5d465..1a1581643bf3 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -36,6 +36,7 @@ struct rzg2l_usbphy_ctrl_priv {
 	struct reset_control *rstc;
 	void __iomem *base;
 	struct platform_device *vdev;
+	struct regmap_field *pwrrdy;
 
 	spinlock_t lock;
 };
@@ -92,6 +93,19 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 	return !!(readl(priv->base + RESET) & port_mask);
 }
 
+/* put pll and phy into reset state */
+static void rzg2l_usbphy_ctrl_init(struct rzg2l_usbphy_ctrl_priv *priv)
+{
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(priv->base + RESET);
+	val |= RESET_SEL_PLLRESET | RESET_PLLRESET | PHY_RESET_PORT2 | PHY_RESET_PORT1;
+	writel(val, priv->base + RESET);
+	spin_unlock_irqrestore(&priv->lock, flags);
+}
+
 #define RZG2L_USBPHY_CTRL_PWRRDY	1
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
@@ -131,9 +145,9 @@ static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)
 	rzg2l_usbphy_ctrl_set_pwrrdy(data, false);
 }
 
-static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
+static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
+					 struct rzg2l_usbphy_ctrl_priv *priv)
 {
-	struct regmap_field *pwrrdy;
 	struct reg_field field;
 	struct regmap *regmap;
 	const int *data;
@@ -158,15 +172,15 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
 	field.lsb = __ffs(args[1]);
 	field.msb = __fls(args[1]);
 
-	pwrrdy = devm_regmap_field_alloc(dev, regmap, field);
-	if (IS_ERR(pwrrdy))
-		return PTR_ERR(pwrrdy);
+	priv->pwrrdy = devm_regmap_field_alloc(dev, regmap, field);
+	if (IS_ERR(priv->pwrrdy))
+		return PTR_ERR(priv->pwrrdy);
 
 	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
 	if (ret)
 		return ret;
 
-	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, pwrrdy);
+	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, priv->pwrrdy);
 }
 
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
@@ -175,9 +189,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	struct rzg2l_usbphy_ctrl_priv *priv;
 	struct platform_device *vdev;
 	struct regmap *regmap;
-	unsigned long flags;
 	int error;
-	u32 val;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -191,7 +203,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	error = rzg2l_usbphy_ctrl_pwrrdy_init(dev);
+	error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
 	if (error)
 		return error;
 
@@ -214,12 +226,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 		goto err_pm_disable_reset_deassert;
 	}
 
-	/* put pll and phy into reset state */
-	spin_lock_irqsave(&priv->lock, flags);
-	val = readl(priv->base + RESET);
-	val |= RESET_SEL_PLLRESET | RESET_PLLRESET | PHY_RESET_PORT2 | PHY_RESET_PORT1;
-	writel(val, priv->base + RESET);
-	spin_unlock_irqrestore(&priv->lock, flags);
+	rzg2l_usbphy_ctrl_init(priv);
 
 	priv->rcdev.ops = &rzg2l_usbphy_ctrl_reset_ops;
 	priv->rcdev.of_reset_n_cells = 1;
@@ -266,10 +273,67 @@ static void rzg2l_usbphy_ctrl_remove(struct platform_device *pdev)
 	reset_control_assert(priv->rstc);
 }
 
+static int rzg2l_usbphy_ctrl_suspend(struct device *dev)
+{
+	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	pm_runtime_put_sync(dev);
+
+	ret = reset_control_assert(priv->rstc);
+	if (ret)
+		goto rpm_resume;
+
+	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, false);
+	if (ret)
+		goto reset_deassert;
+
+	return 0;
+
+reset_deassert:
+	reset_control_deassert(priv->rstc);
+rpm_resume:
+	pm_runtime_resume_and_get(dev);
+	return ret;
+}
+
+static int rzg2l_usbphy_ctrl_resume(struct device *dev)
+{
+	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		goto pwrrdy_off;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto reset_assert;
+
+	rzg2l_usbphy_ctrl_init(priv);
+
+	return 0;
+
+reset_assert:
+	reset_control_assert(priv->rstc);
+pwrrdy_off:
+	rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, false);
+	return ret;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rzg2l_usbphy_ctrl_pm_ops,
+				rzg2l_usbphy_ctrl_suspend,
+				rzg2l_usbphy_ctrl_resume);
+
 static struct platform_driver rzg2l_usbphy_ctrl_driver = {
 	.driver = {
 		.name		= "rzg2l_usbphy_ctrl",
 		.of_match_table	= rzg2l_usbphy_ctrl_match_table,
+		.pm		= pm_ptr(&rzg2l_usbphy_ctrl_pm_ops),
 	},
 	.probe	= rzg2l_usbphy_ctrl_probe,
 	.remove = rzg2l_usbphy_ctrl_remove,
-- 
2.43.0


