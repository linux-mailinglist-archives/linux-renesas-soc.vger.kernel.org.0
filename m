Return-Path: <linux-renesas-soc+bounces-26524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FDAD0AAAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 15:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 546BF30A73C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 14:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A35C35FF5C;
	Fri,  9 Jan 2026 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mep/gwjf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55EC35F8DD
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767969433; cv=none; b=jgYvL+E4DOJvsCDsthBHATNLI6SLrGSoJld/s7qYtjclIGpYSzglZ7XjtsisXTZ05U0+AksduNHFx0nDUFJc3QxErUTVhU5jhruwiNGdnfUTR0k+lhRwF8RYa4p0lqrOCxunie/43RHbTz19S2M48FozEYzceuEulMFhtTxD34E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767969433; c=relaxed/simple;
	bh=9UVrFuOdE0n9T0uTC/k3M6/u9RxP8HJw4WF38+TDv9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hr2LVGYPh0ezUYS5AuorFgbUVkIClmvFTu08UAu1cKf/gj+sZ7tB5iBOP9Myotz2qrsXF/RTduSrJdXN3v/msuJTTeoBrPo/gjqgXYMiSSLG26e3ojIgUMWZMdPX7kt5YvbpCqUHNr1QvHz/mkb+4jvWkA+nqD45lfcTflm9z7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mep/gwjf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so40938955e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 06:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767969425; x=1768574225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqdSouMd2yP+Io2gtTHjnphBWXnobFguRezSiLromD8=;
        b=mep/gwjfMMxzpknuBJBwD/4NU4YLgbrTHNmDw5e96u1lVqVHlW0xaWNTquyDjIgfrM
         n5L3yyb58HBKm1zygeiBK2f4hqVufxghC0D/o8Hq+AjrW053VnB16+XeIqd3NJrpYoY2
         bZWCDCMg/Rc8EaGHuYQwfN6yXaGZ8QzTcm+X/sq5IF4ex5SEPEvQZ47mzTtpcB/3saFF
         S6KEXCfO00j9i2O7c6ZRVZRy1X0hjwTpT5vPjB8j14NF4pR8l3mAxHCe6dascxqPhIl9
         snDodz9KSHiOZv4+mJIrHsUl1ZB7v49CusnZGMRbJyYhXBrbPeuEldKPjneUOf5W1J5U
         MUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767969425; x=1768574225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqdSouMd2yP+Io2gtTHjnphBWXnobFguRezSiLromD8=;
        b=i89lwFAAuKUxy49huMsXvqTeo6dg2QboU6r+xmqxp1Kjbd3xMzPY44cc8Nn0JGcxXR
         OpKLZsyL8MmleyMvKf6gCE94I51XJ6i6NuEvV8JJ+BugMLBNLaAjw8leRRFOEqpNwZyN
         SUXzQ43ryfRw7U/unPbqFaljtp1kpJGIBRdCkUhGwQP0QtSL7rxngztKLiNHbwzH3GIu
         E8+TMQXNiDRznfLIvy+OG5LTRLwSX1lRB8jebFcbDItTNlWZLrkg22dRx8tX7pR9WYmq
         Zqu0Gz3ZMVJU7h2UsHiKKa9deSnxlF7xR3nNK95BGlLzaob1c8Ea6qrHVIxaWBINdgQK
         FFaA==
X-Forwarded-Encrypted: i=1; AJvYcCW6VVjLuVVJrLVCke2EArS34ni0q/k1LW2UF2DDK7P14ETTdqSTBXKnM6aWFaj3Ahw8H3pBVDfmcZhbYWOu0NP/XA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzor8w2+GMiptVwjdML/qyxFfv5RQu4Gh5nZ21VTUTGOeeDSqK
	Xd34whql5htYghQK/T9BgsiwGnxq5HaN9ArBv5fqjwQ6dntHHCrt6JR/hSsFH/GQBzc=
X-Gm-Gg: AY/fxX5AvZp6HTvIoOgSvklHKX4n41ysBlGSLAEeR2DUk+sySUVDV6k32bwW+ak7j7F
	3TFnWQbQolSa2QkEFwlfR0RIdYctrE8uMyvu/AsfH88+RO117pL4KPxZbUUBLyEQzd89PoKGws/
	OE84Tb1raSppDqlal4tjuAd8Pa9h31laJ2v68eJGBTe86QeTYD+qU2ikLTu/qfbgw0S354n1nmI
	uW1D5Pt9WC8aOIf9eilnaA71HtXmXbHo19eejFB0IENDpTFnUPL/zDEZVT0aJcpd1+Gz49y3x78
	gwDxw+sfft1iGj67hJvf/mr/jOM7Go2/ArpCxsU0TxinWO8Mk4nX1WbUfRLRn/+3ueGtdlqJwFg
	k10pumvgyJhC1FjvovXZH7tpNg5DuqdpfipqXuy6dyh64tFkzQsvUk6a2uZR1r6OWmD61eCGJDU
	adGfuvprtAtjnKMk6AU16qNa9oa2AStfoZSsRNgh8=
X-Google-Smtp-Source: AGHT+IEupF8eWNAcyYC7iH1qXqE+zpsvrN/76zbiRusCbCQGkNoFeGwL4Y2pZjv5Nh/hxsJJwQIj3Q==
X-Received: by 2002:a05:600c:a406:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47d85bf0627mr97878385e9.6.1767969425038;
        Fri, 09 Jan 2026 06:37:05 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e17aasm23197216f8f.15.2026.01.09.06.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 06:37:04 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v4 2/2] reset: rzg2l-usbphy-ctrl: Add suspend/resume support
Date: Fri,  9 Jan 2026 16:36:59 +0200
Message-ID: <20260109143659.817797-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109143659.817797-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260109143659.817797-1-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- warn when suspending with resets de-asserted
- collected tags

Changes in v3:
- collected tags

Changes in v2:
- used pm_runtime_put_sync() in rzg2l_usbphy_ctrl_suspend()

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 99 +++++++++++++++++++++----
 1 file changed, 84 insertions(+), 15 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 9ce0c1f5d465..32bc268c9149 100644
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
@@ -266,10 +273,72 @@ static void rzg2l_usbphy_ctrl_remove(struct platform_device *pdev)
 	reset_control_assert(priv->rstc);
 }
 
+static int rzg2l_usbphy_ctrl_suspend(struct device *dev)
+{
+	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(dev);
+	u32 val;
+	int ret;
+
+	val = readl(priv->base + RESET);
+	if (!(val & PHY_RESET_PORT2) || !(val & PHY_RESET_PORT1))
+		WARN(1, "Suspend with resets de-asserted\n");
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


