Return-Path: <linux-renesas-soc+bounces-6050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49190399C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 13:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 433561C212B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 11:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8371717B42D;
	Tue, 11 Jun 2024 11:04:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520C3179957;
	Tue, 11 Jun 2024 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718103866; cv=none; b=F/pvZjc1l5rbdaiOI5kHYEupsvQbvc8YahVDOkh+D1MIwshd37cdIGXXy6ALO6BDpRy/SY4obB4WD4/7olHk4vhjo2cuMvcN0btaRaD2b43vwVgfYVWrKbtyJuIFC2C0OGW67uuYFwYyTfls/u8KODkZU6lodqrORAEcbxDO0WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718103866; c=relaxed/simple;
	bh=7zo381zbusfk7uNioEqSKWWMc/iP0beX+wXFp1T4+EU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SY5tcOKMRV4bBCnJxk4YbLsBuU5RrDk5JpbbhsDG7PTweBtVH5vzLLgZQcdDOkiwB29nCptlk94UM0H7WhVlHvO7JPmgW3bogavOVYz3rAvmCkWGyy8GX+kYsMz/XHtyY6f3xKkv8npNyPZ/UIkFuixdItGTHc0ZhKJ2jF+DcsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,229,1712588400"; 
   d="scan'208";a="207488191"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2024 20:04:20 +0900
Received: from localhost.localdomain (unknown [10.226.93.49])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 790A3400F953;
	Tue, 11 Jun 2024 20:04:15 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/6] reset: renesas: Add USB VBUS regulator device as child
Date: Tue, 11 Jun 2024 12:03:58 +0100
Message-Id: <20240611110402.58104-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611110402.58104-1-biju.das.jz@bp.renesas.com>
References: <20240611110402.58104-1-biju.das.jz@bp.renesas.com>
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
2.25.1


