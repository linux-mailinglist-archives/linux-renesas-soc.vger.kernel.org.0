Return-Path: <linux-renesas-soc+bounces-7002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD69246CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 20:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A22C81C220D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 18:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259991BE22B;
	Tue,  2 Jul 2024 18:00:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB7616B394;
	Tue,  2 Jul 2024 18:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943253; cv=none; b=p97+zY2j5YLWMsYfbeOnaRmFd4xi44R6Q7WPiEhbAk5Hmz4UFBT12/mTKDFxLAFSub+nP30WeJHReHsBTOTCSlKQQTtbYKne7j/wfdZEoqln44msxmTXZL45vUk8/npSVcphhAgElOlnZg0Iz4XP2oGgjWjnIL1Raul4PAjh26E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943253; c=relaxed/simple;
	bh=Qn6GVN5V5dsvZWx3tw+gxKmINsSrlmy3jozazREv2j8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orqjDp5WSJ/04cpe4w1pDj/ejlpreLKJrdpsH5I0fXFjZeko6cSBVC75fbWX1v8NTES8LIuDo7q1ELT/5GJYozoswljmBc8zFwnx/McsCOqxrcNNP5xn/cZUwpdTlRO3a/UM9dUEdzzHM+zSLIP7Aa/ZOJx9C+OAwmmODTZvpAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,178,1716217200"; 
   d="scan'208";a="210052559"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Jul 2024 03:00:50 +0900
Received: from localhost.localdomain (unknown [10.226.93.72])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 44746400294B;
	Wed,  3 Jul 2024 03:00:45 +0900 (JST)
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
Subject: [PATCH v5 2/4] reset: renesas: Add USB VBUS regulator device as child
Date: Tue,  2 Jul 2024 19:00:16 +0100
Message-ID: <20240702180032.207275-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702180032.207275-1-biju.das.jz@bp.renesas.com>
References: <20240702180032.207275-1-biju.das.jz@bp.renesas.com>
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
v4->v5:
 * Rebased and fixed the merge conflicts.
v3->v4:
 * No change.
v2->v3:
 * Updated commit description and header
 * Moved regulator device creation and instantiation at the end of probe().
v1->v2:
 * Instantiated regulator driver 
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 29b852a8ac5a..1cd157f4f03b 100644
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
@@ -152,8 +168,22 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (error)
 		goto err_pm_runtime_put;
 
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
 
+err_device_put:
+	platform_device_put(vdev);
 err_pm_runtime_put:
 	pm_runtime_put(&pdev->dev);
 err_pm_disable_reset_deassert:
@@ -166,6 +196,7 @@ static void rzg2l_usbphy_ctrl_remove(struct platform_device *pdev)
 {
 	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(&pdev->dev);
 
+	platform_device_unregister(priv->vdev);
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	reset_control_assert(priv->rstc);
-- 
2.43.0


