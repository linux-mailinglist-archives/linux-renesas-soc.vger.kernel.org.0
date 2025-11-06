Return-Path: <linux-renesas-soc+bounces-24258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A821C3BCF6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 15:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF689502FB2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 14:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A37341663;
	Thu,  6 Nov 2025 14:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aXJF+Ob7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EB3345CBC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439628; cv=none; b=cc2FUsSAXPAymv5hp3tThqlzu8VV7Yl7M1HEU+wqXc78TmLZPBLLyjvLhB9TGpdamC6eCi7PK/tWgYHLGrzLZ8HOF+90VFKSbmNuMTy792itnMHYdIpbxJRF/alwvPj48PFMoWRbWBeJTkWiTQPIUaP+yd4KMBzqHnq/UK4B43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439628; c=relaxed/simple;
	bh=z2GOCEOnAx9dkquP8SXwErYfO6hYTMVFav1I4Zw5hag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMm7jJWlSaAvSAKEEye0Ii3QAc3Y7x7OJOkLWfIbG7u9bI6EP8qNAHOKgwbRzsQPySCuyd/kJokR7djC9zsjtCX0vlsvpZ8u8+g/w3QPRN1qhTKE//WGs+vTxPty22Lr4i3wipuZGJ8461Jo2ridG/18jok0uPI+NkdttV8hmT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aXJF+Ob7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-471191ac79dso11740735e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 06:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762439624; x=1763044424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3IgvEQIjogJMzucfOGmuNQecQ5evfCfXzAa1sQFsLM=;
        b=aXJF+Ob7EYYhQs7R7mIDIV2RlAmeZ0OUdtxNkuH71DQ3d6ObuLE4JCohcBCsgvmJ8Q
         uzS6hQ0XiF4SyN/XLOlFl/yyU78pdcV36NLncCR3/NBprLRr8O7x1abLyBBZYtHwmG4Z
         XOFYHrKQpy2FrhTsfTI+GcS3/Vur/Xm7JuyXmf9nnnT7QC16v5pbc7HMqef3Jdtd9Omd
         X3VyaLyOzhnSWr2Y6cmQKV2cdgSqbXsvtbVMQ8rEMEB8X0oKAdYr/EBt+55X+QmV1BpJ
         R6jOS1h4KgzvmAqZeaJnL4YMpzW4XupsbFPWg+PXfIDCbapnMX4pEY9S2l+Mw54ac/XM
         UUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439624; x=1763044424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3IgvEQIjogJMzucfOGmuNQecQ5evfCfXzAa1sQFsLM=;
        b=jcNx1vbz89K3u+NN9EVDV9v+gtegL/wLoWGaazEjsjSutiuwi0zMzVcTLHWhcMrgN8
         /S7vC45hH3K+AU1qFxR2ysdPYgDxSudmm5Xws/ETd2l1nr/EVbXLRUWNx9L4lMB2X72h
         P4wSt7eLKTnbP6KwoDn9j8H7cjx7kKECerHu2jnX7PZpIC5ZDSfV6e3VDkrGn8pWoEPL
         9WI62IFzsUJmV7uAEuziJmttg1YHQHZ1LLdrXMNifAXvpO6Uuuwvw29KwrvxkGswh++n
         0RvMQ7QtxBL0qFW4L+Z0pF8HhTCCly8k5T8T0ifz6yICGButzqX/1IxrO9n1Nq2fE/BU
         f3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7TtrJnlPRNozFSxxNO3+ditgqS+5mJeJHxPnlRCq9w3aGNMAgteRdznt3baMKVxL/a08bcjUFqwAyLL/7Bxzmsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmbFgMtl1Q6ZMSlsfbumASzHJW0xicWnp7UYReiqlZvFdb2BDI
	w0RlQIYe5evXsv4A5PjRZd714Q3s5JVw5i4HMcbflmdf8YbNqpMehjVPAuhb7OAd7rE=
X-Gm-Gg: ASbGnct6TlBOkq5AkUg1fs78pogEhB5HRhbFWRow8G1A5zyCskhpK8Td+1ZgUhtAe3a
	8kLWW2u7GFxY5TRVx3Yx86Jo8yOQP6re/W3n3ptUHAuvIk3p37jc2Rz2q9kt9hngr5cBYrVGl6C
	YSKNAy+f9KZGjkruiSuh+Eg31ecfzWiWmGDtTu1oFCm25uiY5mZz4fdrDToE0cunjOUQacS+5Vt
	muZJcV2W/gZ9HrblzSdbM98SaboU4fV1kgSL20KPXdCia8jAHvdMAyw4byjXBr/ekV1Cs4xFgHH
	9Dq8tm/KFJKvdwKhAjUZdt3o9Hfoh99KwBtCHvZmOY5glkYyvwlPamct72xNHzgVvkS+UIgfru7
	wr8SHsZL1glrSdHN6czH42iYoQaOwlg291IrlbhdRT0GcCqmWfzNWIz4ah/9LCIWpJKv9+vr3Kt
	Sjjpf0Z0mBk5tGmqlu3jf35FGxS/PLGRg0JCGR2Bw9
X-Google-Smtp-Source: AGHT+IEnd0KVbCubO7pySQ4P5IiZ1ER4hHEn7mesMiVdofrqd1TkOsvZkySnJp/aB+1oHXM+Li+8iQ==
X-Received: by 2002:a05:600c:530d:b0:46d:5189:3583 with SMTP id 5b1f17b1804b1-4775cd39de3mr70324795e9.0.1762439624219;
        Thu, 06 Nov 2025 06:33:44 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477622661c4sm50001595e9.0.2025.11.06.06.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:33:43 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/2] reset: rzg2l-usbphy-ctrl: Add suspend/resume support
Date: Thu,  6 Nov 2025 16:33:27 +0200
Message-ID: <20251106143327.3049052-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106143327.3049052-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251106143327.3049052-1-claudiu.beznea.uj@bp.renesas.com>
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
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 94 +++++++++++++++++++++----
 1 file changed, 79 insertions(+), 15 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 9ce0c1f5d465..8ba65839f6e4 100644
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
+	pm_runtime_put(dev);
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


