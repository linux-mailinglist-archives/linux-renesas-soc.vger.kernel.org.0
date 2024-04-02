Return-Path: <linux-renesas-soc+bounces-4209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 591B5895338
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 14:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D15E285EA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 12:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2267182881;
	Tue,  2 Apr 2024 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bLKFkQg6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B8E7A705;
	Tue,  2 Apr 2024 12:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712061405; cv=none; b=iXtnEW5UmpetOUorKUwkjPiDn4YCTU4XsuIkCFYauX1+P45X+PhPaW4xIE3V8XXEv6mtgiKGT32MD7QTnjqmLqetmuQ5VJyZrcKZ6e4lKVobWexvW2gFQOYe4Ydb15tpL1azt/sxQrt4aUwWGXWDxoPGUbKVVQU+7tmOdCepvH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712061405; c=relaxed/simple;
	bh=lL/Tu2fsutOUz8wbOQN7LJzCTy4+NavJvT9XOLT0kas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rIhEaDPa3I74Udo6v4AR14BjWKaFwvKk2TSlanFsyrJaL7qmbpNIHf6LwIgoWabSWKc7bxFt33wSNEDopV+phW7FO8wQZIO7gNGqs8cOUzIzb2XEUQMFzETudIE206Hjp+SppFuMV6ZCa6/enMNH17col6qHRXYnoHAypiSAhzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bLKFkQg6; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 749A6FF803;
	Tue,  2 Apr 2024 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712061395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8eZGom4lJ/2vq7Fb0GKSBtwzNIXefxMh/vevbKO2dJA=;
	b=bLKFkQg65g3DQJelCfYzZp63szWlRNCqvZW/begB0//siysVvBHd5ieeNdiz53q6m13fxm
	5gpnXDF4kia8vUEKdu42mc9A5476fDbT8E2n2M0KTe2D4L16gROOmoeDx2/fC1cezsYPt2
	/qqcjWBNyJotlpC0wYtv4lJxvqXDhP2YW49B5Wm6nP2gvi3ffuzWOlqiSFcdvG5oVHTC98
	aoApqwHPEG6AWAfNoWTzPOM8msNtUqwvtHbegDUzFdFDToh5gIFHkh8XYjjkRW7Zf+A78Z
	Yt887YQiGUmjSQYrCqxz6rXERPQdrdvYQ3NPlTy9v4vbdA9Ee6gR6B6ZRLK+lA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 02 Apr 2024 14:37:01 +0200
Subject: [PATCH net-next 2/3] net: stmmac: add support for RZ/N1 GMAC
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240402-rzn1-gmac1-v1-2-5be2b2894d8c@bootlin.com>
References: <20240402-rzn1-gmac1-v1-0-5be2b2894d8c@bootlin.com>
In-Reply-To: <20240402-rzn1-gmac1-v1-0-5be2b2894d8c@bootlin.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com

From: Clément Léger <clement.leger@bootlin.com>

Add support for the Renesas RZ/N1 GMAC. This support can make use of a
custom RZ/N1 PCS which is fetched by parsing the pcs-handle device tree
property.

Signed-off-by: "Clément Léger" <clement.leger@bootlin.com>
Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 MAINTAINERS                                      |  6 ++
 drivers/net/ethernet/stmicro/stmmac/Kconfig      | 12 ++++
 drivers/net/ethernet/stmicro/stmmac/Makefile     |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c | 87 ++++++++++++++++++++++++
 4 files changed, 106 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a233e1a3cf2..9735c7d2ee38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18833,6 +18833,12 @@ F:	include/dt-bindings/net/pcs-rzn1-miic.h
 F:	include/linux/pcs-rzn1-miic.h
 F:	net/dsa/tag_rzn1_a5psw.c
 
+RENESAS RZ/N1 DWMAC GLUE LAYER
+M:	Romain Gantois <romain.gantois@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
+
 RENESAS RZ/N1 RTC CONTROLLER DRIVER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 L:	linux-rtc@vger.kernel.org
diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 4ec61f1ee71a..05cc07b8f48c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -142,6 +142,18 @@ config DWMAC_ROCKCHIP
 	  This selects the Rockchip RK3288 SoC glue layer support for
 	  the stmmac device driver.
 
+config DWMAC_RZN1
+	tristate "Renesas RZ/N1 dwmac support"
+	default ARCH_RZN1
+	depends on OF && (ARCH_RZN1 || COMPILE_TEST)
+	select PCS_RZN1_MIIC
+	help
+	  Support for Ethernet controller on Renesas RZ/N1 SoC family.
+
+	  This selects the Renesas RZ/N1 SoC glue layer support for
+	  the stmmac device driver. This support can make use of a custom MII
+	  converter PCS device.
+
 config DWMAC_SOCFPGA
 	tristate "SOCFPGA dwmac support"
 	default ARCH_INTEL_SOCFPGA
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 26cad4344701..c2f0e91f6bf8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
+obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
new file mode 100644
index 000000000000..5216d7890992
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 Schneider-Electric
+ *
+ * Clément Léger <clement.leger@bootlin.com>
+ */
+
+#include <linux/of.h>
+#include <linux/pcs-rzn1-miic.h>
+#include <linux/phylink.h>
+#include <linux/platform_device.h>
+
+#include "stmmac_platform.h"
+#include "stmmac.h"
+
+static int rzn1_dwmac_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	struct device_node *pcs_node;
+	struct stmmac_priv *priv;
+	struct phylink_pcs *pcs;
+	struct net_device *ndev;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return ret;
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return PTR_ERR(plat_dat);
+
+	plat_dat->bsp_priv = plat_dat;
+
+	ret = stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
+
+	ndev = platform_get_drvdata(pdev);
+	priv = netdev_priv(ndev);
+
+	pcs_node = of_parse_phandle(np, "pcs-handle", 0);
+	if (pcs_node) {
+		pcs = miic_create(dev, pcs_node);
+		of_node_put(pcs_node);
+		if (IS_ERR(pcs))
+			return PTR_ERR(pcs);
+
+		priv->hw->phylink_pcs = pcs;
+	}
+
+	return 0;
+}
+
+static void rzn1_dwmac_remove(struct platform_device *pdev)
+{
+	struct net_device *ndev = platform_get_drvdata(pdev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	stmmac_pltfr_remove(pdev);
+
+	if (priv->hw->phylink_pcs)
+		miic_destroy(priv->hw->phylink_pcs);
+}
+
+static const struct of_device_id rzn1_dwmac_match[] = {
+	{ .compatible = "renesas,rzn1-gmac" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rzn1_dwmac_match);
+
+static struct platform_driver rzn1_dwmac_driver = {
+	.probe  = rzn1_dwmac_probe,
+	.remove_new = rzn1_dwmac_remove,
+	.driver = {
+		.name           = "rzn1-dwmac",
+		.of_match_table = rzn1_dwmac_match,
+	},
+};
+module_platform_driver(rzn1_dwmac_driver);
+
+MODULE_AUTHOR("Clément Léger <clement.leger@bootlin.com>");
+MODULE_DESCRIPTION("Renesas RZN1 DWMAC specific glue layer");
+MODULE_LICENSE("GPL");

-- 
2.44.0


