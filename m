Return-Path: <linux-renesas-soc+bounces-24408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B905BC46E2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 14:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B07334E6D40
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8E03126AC;
	Mon, 10 Nov 2025 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qgB+TNbf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF0231077A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781248; cv=none; b=VMDtbuIOUC/rylHhgBIRh+aoL0JvmlYzWiHbGPX7fLKruU4b/zPmCTo401EC6t5AIz0AlVJmpVfP9y1ZiGX2nQMaLy4Xoty0rVc1deBx+VlN4TUKd5fxtbkN7PADagbWmQIs+u6/2QzcGgX67B01hAitGtrB+sU81g1tPl/FxjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781248; c=relaxed/simple;
	bh=TNNxYK3T1LesHUiKkkc62rb2lyUrHowMxIOE0Fzvr1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BS5GL5+ro5Ti043iMz9HsD7o5pkIblnLg05AWwSIdi2yoj7MQsJo7bfBSyXyAsZv3znUbAugdzZU9x+t0GNEEHdXDKNghzPkvAufzYlZK2LXFhYPAwliUoNzicvNqBbUIAO8p7k8pwLskGmewvE3tDaRuXa+kVSzdQzwB6EWqR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qgB+TNbf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477632b0621so20428165e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 05:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762781245; x=1763386045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEKHdph/WkH43nf5jAqWm3Jj7AehjNEpo+rsk0PXjA8=;
        b=qgB+TNbfZF9U1IM8b75xOOQz9jiLpqnsCDHeQxOchWFOCf157vmDuriBcJ6KYlbGZC
         Mq5RcGNWOC3sY/GtQnItgyn5jMPh6Jj7uycAy6Cu68Wp8r0ND8DIL2tsQyvKqdjvLe8a
         bVyGEN6ioj4mVq7dmTOsKgtsZClRhcfoVTPifZsQDMV3j9eI9fzR/ySEaM2MJG7NYlny
         JpplK7kruk/Tl2P5ZBZu617jZZA6ufduM5rwtW97YFls+g6LaFZWJvbhgdLhj+ATkXMf
         PXZ/tRplmnJ5x4RSLkQStUdCR0hyMoiOjODuWWp0ynpiWWW4CI/Z8BES+RlsZT7+ZEQI
         +vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781245; x=1763386045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KEKHdph/WkH43nf5jAqWm3Jj7AehjNEpo+rsk0PXjA8=;
        b=BqI6/ALpybvuugdFTZ2XZGT48aDZll/3DonUpgW9XLpLktgIecsuzL9XY8TCHOiKSu
         AeTCsLDMtQq25onDMAzQ+Bd9JzYekKdASpxinimeZCzoCY+/ReKF2lhmD2g0+9AKK27x
         mUgLaXU17vTLrfxkB2dQTgPBcVLjfxqCKLq2fmxrw2v9F4EuQ/vrkwcSByMb9x9bB1Uv
         MAIdaibEru3kofdIe2iiJG2dsjzpxSek7BmmCembW93LefL1uE5yXHgspCOoqjT9SA9c
         LjCf7sZGtUMpoP8Ixx2gAolwmMhIB0+Q7i27JPT55K8+9DEhx045W2X1w7e5t58Fpt7G
         lgfw==
X-Forwarded-Encrypted: i=1; AJvYcCVbmZHf+m/Yu49UZyAW09HRfUQThi4hsWVr53OHYGSs2lgeFwmrsL5vKSkVXdEW+v0tcBvFw1/dNK5PgoOUVtsmbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfJAWARsml9czByw9p0oitBGsW7XOnOstuK03jNwRzMXiRr+/3
	COUH+OGkLAT0mvKRznwSdbcCELRpMys0c4LobyDWJQs9uxXMUftU3xJnYT7s3pF11I0=
X-Gm-Gg: ASbGncvya6hs2x8fR/Ew+W8XDII97kYG3TD/kIUTJgdVG7J1Cm+y7fJkZ9+fuJse/fe
	zuHpYNL4O+Qunvxiz/lrne5Y8HtQjBe0h+STmWvjHeWzOdGL6v/MXoHnTQTA8Aq9vWfDmIFYIJ9
	Wl6tPARyP5IqQPOTmnAopaDrt/pG8f5ZLy9HOeLo6kSUxNz0BmnbLiIv8lRYrpsf3YGcoJrefcz
	Leb1ax5tmJaut9ak9WkXsVoWYCVKptP55LNWkeA8twq+Or46Xk/To9pyi5kPepGHdeZJhLFew7b
	mOfF2FmlFR8t0YlesKcqLMDAzSaw9hmV7De/N4BigQy+5ew/p3IRYxn0hfW1H6ApkRfUncoqofU
	xeX7yNwtgSuaSmYvTTliFfsQhtbLVLKhB59S01MT+vWYqxp0zN78X2ua+RL2M6Ch4CRkDTRgRt5
	cCU9Zb+CEwlJBpT8vMW6qqBwQ0DWwn9Q==
X-Google-Smtp-Source: AGHT+IFhl3c4iCtHodk43UgsCfNECHTTD7HFqnVEaFyJK0ZGhO7Kf5HnGp+KCrAr9ZV+4q93j9k8yw==
X-Received: by 2002:a05:600c:46ce:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-47773288bbfmr84548275e9.31.1762781244682;
        Mon, 10 Nov 2025 05:27:24 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47778daf2c3sm94207025e9.10.2025.11.10.05.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 05:27:24 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/2] reset: rzg2l-usbphy-ctrl: Add suspend/resume support
Date: Mon, 10 Nov 2025 15:27:15 +0200
Message-ID: <20251110132715.724084-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


