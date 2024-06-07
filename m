Return-Path: <linux-renesas-soc+bounces-5956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 483E7900257
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 13:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D893BB24C77
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 11:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A720419007B;
	Fri,  7 Jun 2024 11:38:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501D018FC63;
	Fri,  7 Jun 2024 11:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717760287; cv=none; b=VN6hqIQWK6FJRT6k27y2aM+/bE0fsT/vCJqMz3orucLgbF1tNQfpG3UNt/4LpC7GM7q59m8lU6y8KobCP9Ow5nQPGmshJ3zqAc5wao422Wrc256XhLeKGh90lOhLB5HU0e9xla77RzQcHlCFDnFSxKmShBZcWFk5uFjRpcp5XhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717760287; c=relaxed/simple;
	bh=xPTcRZ3uY6SLDT1LcRQ8G6+MqC270bZyen/hkyz5YkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XH0dnijUWW0UXi6ZTmY3Mdet7uJfbV982mAOAi6/HORx05mbsfreKd7BqIdsSm/6AKuZqoJesdQjPvu6N8m93jCFy8guzb7MIzrhbqP5h/UNXO7otcPNV1CKDQkSe0svCmnAYDI/8Yl2040bljaVZ/3zR4H61zYfL0TK0tv0JVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,220,1712588400"; 
   d="scan'208";a="211042474"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Jun 2024 20:37:58 +0900
Received: from localhost.localdomain (unknown [10.226.92.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8589240071E8;
	Fri,  7 Jun 2024 20:37:53 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	devicetree@vger.kernel.org
Subject: [PATCH RFC v2 1/4] reset: renesas: Instantiate USB VBUS regulator device
Date: Fri,  7 Jun 2024 12:37:42 +0100
Message-Id: <20240607113745.73934-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
References: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per RZ/G2L HW manual, VBUSEN can be controlled by the VBOUT bit of the
VBUS Control Register(VBENCTL) register in the USBPHY Control.

Expose this register as regmap and instantiate the USB VBUS regulator
device, so that consumer can control the vbus using regulator API's.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Instatiated regulator driver 
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 8f6fbd978591..45406d6bbb85 100644
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
@@ -116,6 +128,22 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	regmap = devm_regmap_init_mmio(dev, priv->base + VBENCTL, &rzg2l_usb_regconf);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	vdev = platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
+	if (!vdev)
+		return -ENOMEM;
+	vdev->dev.parent = dev;
+	priv->vdev = vdev;
+
+	error = platform_device_add(vdev);
+	if (error) {
+		platform_device_put(vdev);
+		return error;
+	}
+
 	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->rstc))
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
@@ -160,6 +188,7 @@ static void rzg2l_usbphy_ctrl_remove(struct platform_device *pdev)
 {
 	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(&pdev->dev);
 
+	platform_device_unregister(priv->vdev);
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	reset_control_assert(priv->rstc);
-- 
2.25.1


