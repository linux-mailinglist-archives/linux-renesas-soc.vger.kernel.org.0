Return-Path: <linux-renesas-soc+bounces-4946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 526DA8B6BBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2024 09:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE6661F2217A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2024 07:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5FC199E96;
	Tue, 30 Apr 2024 07:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ODpWQ9Lx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28F57E0E9;
	Tue, 30 Apr 2024 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714462156; cv=none; b=QEjFSLlnA7lWK+/J+Rg5IHqq/AvQe3tzlmlJ6vA2c+CP0OqAZQL9PHKcCXxuZ28KcKS9GMN6sPsMjd7UJ6r2gKLbQtjc0O1ePu61MS3SdrdSECfdhyapLj1Gf9lF0uyL5Op1pFJQI27j3RdK1JAXusGtyK4QYoOcVoPXmT4t24g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714462156; c=relaxed/simple;
	bh=prboNH2I0lgTATOkd5wdZBo9Kv5Eb8na8JYr0O80vI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WkNK1zqa5ly/Fa5VRCXnSG21rKk8DTGDSUFTGeESl36Z5f7YqUBym5pJd4uGScZZNK3go+XQvbWaXNuFzvsYVkvEM8lvzmx/99PsETUuAVNFP8RSMc1xPh3YUH9V1AnS2HkrckX1aaVkmMPiOTtrHG+bmhv3Jbkw6NjE98SLLXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ODpWQ9Lx; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FC38240004;
	Tue, 30 Apr 2024 07:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714462152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fcmojma0CqiLBLuzAbfh8W/Rg3aQQZKZHQ/Lzjv/9/s=;
	b=ODpWQ9LxdiKo+32uZDAR3/KIZ5aLGnf0oMEQow/9ZRFwydDl2m1b4tspRIGBeu8z62Js5J
	sH7IG5nC9ASj5BHy13Hd8ZY7XOzat/c2NpEkvt1OJKxMqEYqbZpWnTy3dMOqv2Yd4c7yp7
	+GEN8LMfmqdHZDLpHMK0+oJRiwH/hKiqraimQXvmph6Jdkg6UO/3y2qZOgand5LVL79K1Z
	WPlWoIzborFGsnTbJ6ikVdlr0/eEmRE5f9XqgGyVeaTw4mhPU4OE754q++pRS4cywBQp66
	yevGUiAvRgbgnAVgAq1pPWHkhcO2IZs9BeDF1dPYHV8FH71tqf66UorqCtI5aw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 30 Apr 2024 09:29:46 +0200
Subject: [PATCH net-next v5 6/7] net: stmmac: add support for RZ/N1 GMAC
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240430-rzn1-gmac1-v5-6-62f65a84f418@bootlin.com>
References: <20240430-rzn1-gmac1-v5-0-62f65a84f418@bootlin.com>
In-Reply-To: <20240430-rzn1-gmac1-v5-0-62f65a84f418@bootlin.com>
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
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Serge Semin <fancer.lancer@gmail.com>
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c | 86 ++++++++++++++++++++++++
 4 files changed, 105 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 943921d642add..b65e9908f8532 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18876,6 +18876,12 @@ F:	include/dt-bindings/net/pcs-rzn1-miic.h
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
index 4ec61f1ee71a2..05cc07b8f48c0 100644
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
index 26cad4344701e..c2f0e91f6bf83 100644
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
index 0000000000000..848cf3c01f4ab
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
@@ -0,0 +1,86 @@
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
+static int rzn1_dwmac_pcs_init(struct stmmac_priv *priv)
+{
+	struct device_node *np = priv->device->of_node;
+	struct device_node *pcs_node;
+	struct phylink_pcs *pcs;
+
+	pcs_node = of_parse_phandle(np, "pcs-handle", 0);
+
+	if (pcs_node) {
+		pcs = miic_create(priv->device, pcs_node);
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
+static void rzn1_dwmac_pcs_exit(struct stmmac_priv *priv)
+{
+	if (priv->hw->phylink_pcs)
+		miic_destroy(priv->hw->phylink_pcs);
+}
+
+static int rzn1_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
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
+	plat_dat->pcs_init = rzn1_dwmac_pcs_init;
+	plat_dat->pcs_exit = rzn1_dwmac_pcs_exit;
+
+	ret = stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
+
+	return 0;
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
+	.remove_new = stmmac_pltfr_remove,
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


