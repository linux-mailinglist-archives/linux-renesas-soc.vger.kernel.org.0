Return-Path: <linux-renesas-soc+bounces-6299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10891909D0D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 12:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC6CE1F210A0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 10:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159CF18732B;
	Sun, 16 Jun 2024 10:54:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA8D1DDC9;
	Sun, 16 Jun 2024 10:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718535262; cv=none; b=Xs47/Zkjmk4MlF3TUVANXm0/xZM6bUo59XseeNMOC16A/fnV9APTHrYhq5OfrpoXfqVWxwwaC0XFp3ooDaoFox1FGx69jO0eoG4iWGbQih7Cku/V6VtkQewRTWpwG9zDsZosKYk+WmgyRNbEVoF1jKop1DFNOZmmvjvNT4bZ074=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718535262; c=relaxed/simple;
	bh=0/iB95fDKCHvXpx7P8ILqmLeMAwPrGjklnk82eCYcP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VouI/8wWGPbAhgN+Ca8c+8r00VTCH3Z7qPnEVsP4PsZzn03fBkNQ1mQpwTIl22SSsvj1tE5d9+k7+pJPWetpOT8+3k82nvaWmxPIuH3nZCp8I1hpjIPdS5u9UI1N7HEn3DuhJgFjpIHB2ekEN9JmG7+dAVEWKTjE5UKcbUjMaAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,242,1712588400"; 
   d="scan'208";a="212062392"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Jun 2024 19:54:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.60])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C87A041FEF44;
	Sun, 16 Jun 2024 19:54:14 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/6] reset: renesas: Add USB VBUS regulator device as child
Date: Sun, 16 Jun 2024 11:53:54 +0100
Message-ID: <20240616105402.45211-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
References: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per RZ/G2L HW manual, VBUS enable can be controlled by the VBOUT bit
of the VBUS Control Register(VBENCTL) register in the USBPHY Control.

Expose this register as regmap and instantiate the USB VBUS regulator
device, so that consumer can control the vbus using regulator API's

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change.
v2->v3:
 * Updated commit description and header
 * Moved regulator device creation and instantiation at the end of probe().
v1->v2:
 * Instantiated regulator driver 
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 8f6fbd978591..c740b3b9599d 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -10,10 +10,12 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 
 #define RESET			0x000
+#define VBENCTL			0x03c
 
 #define RESET_SEL_PLLRESET	BIT(12)
 #define RESET_PLLRESET		BIT(8)
@@ -32,6 +34,7 @@ struct rzg2l_usbphy_ctrl_priv {
 	struct reset_controller_dev rcdev;
 	struct reset_control *rstc;
 	void __iomem *base;
+	struct platform_device *vdev;
 
 	spinlock_t lock;
 };
@@ -100,10 +103,19 @@ static const struct reset_control_ops rzg2l_usbphy_ctrl_reset_ops = {
 	.status = rzg2l_usbphy_ctrl_status,
 };
 
+static const struct regmap_config rzg2l_usb_regconf = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 1,
+};
+
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rzg2l_usbphy_ctrl_priv *priv;
+	struct platform_device *vdev;
+	struct regmap *regmap;
 	unsigned long flags;
 	int error;
 	u32 val;
@@ -116,6 +128,10 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	regmap = devm_regmap_init_mmio(dev, priv->base + VBENCTL, &rzg2l_usb_regconf);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
 	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->rstc))
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
@@ -153,13 +169,34 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	writel(val, priv->base + RESET);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
+	vdev = platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
+	if (!vdev) {
+		error = -ENOMEM;
+		goto err_pm_runtime_put;
+	}
+	vdev->dev.parent = dev;
+	priv->vdev = vdev;
+
+	error = platform_device_add(vdev);
+	if (error)
+		goto err_device_put;
+
 	return 0;
+
+err_device_put:
+	platform_device_put(vdev);
+err_pm_runtime_put:
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	reset_control_assert(priv->rstc);
+	return error;
 }
 
 static void rzg2l_usbphy_ctrl_remove(struct platform_device *pdev)
 {
 	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(&pdev->dev);
 
+	platform_device_unregister(priv->vdev);
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	reset_control_assert(priv->rstc);
-- 
2.43.0


