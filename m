Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049C717F20
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 19:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbfEHRdu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 13:33:50 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:58361 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbfEHRdt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 13:33:49 -0400
X-Originating-IP: 93.56.79.2
Received: from uno.localdomain (unknown [93.56.79.2])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E09FA1BF203;
        Wed,  8 May 2019 17:33:46 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 3/9] [TODO] drm: rcar-du: Add basic support for CMM
Date:   Wed,  8 May 2019 19:34:22 +0200
Message-Id: <20190508173428.22054-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a driver skeleton for the R-Car Display Unit Color Correction
Module.

Each DU output channel is provided with a CMM unit to perform image
enhancement and color correction.

Add support for CMM through a skeleton driver to be later expanded to
support setting color correction tables through the DRM/KMS properties
framework.

As of now, the driver is only useful to demonstrate the integration with
the DU driver.

Not-Yet-Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/Kconfig       |  7 +++
 drivers/gpu/drm/rcar-du/Makefile      |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_cmm.c | 78 +++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_cmm.h | 23 ++++++++
 4 files changed, 109 insertions(+)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_cmm.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_cmm.h

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 1529849e217e..820f2b85a073 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -13,6 +13,13 @@ config DRM_RCAR_DU
 	  Choose this option if you have an R-Car chipset.
 	  If M is selected the module will be called rcar-du-drm.
 
+config DRM_RCAR_CMM
+	bool "R-Car DU Color Correction Module Support"
+	depends on DRM && OF
+	depends on DRM_RCAR_DU && ARCH_RCAR_GEN3
+	help
+	  Enable support for R-Car Gen3 Color Correction Module (CMM).
+
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car DU Gen3 HDMI Encoder Support"
 	depends on DRM && OF
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 6c2ed9c46467..ae26d465d421 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -15,6 +15,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
 
+obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_du_cmm.o
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_cmm.c b/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
new file mode 100644
index 000000000000..63f545830bb9
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_cmm.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rcar_du_cmm.c -- R-Car Display Unit Color Management Module
+ *
+ * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "rcar_du_cmm.h"
+#include "rcar_du_crtc.h"
+
+struct rcar_cmm {
+	struct clk *clk;
+	void __iomem *base;
+};
+
+int rcar_du_cmm_setup(struct platform_device *pdev, struct rcar_du_crtc *rcrtc)
+{
+	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = clk_prepare_enable(rcmm->clk);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int rcar_cmm_probe(struct platform_device *pdev)
+{
+	struct rcar_cmm *rcmm;
+	struct resource *res;
+
+	rcmm = devm_kzalloc(&pdev->dev, sizeof(*rcmm), GFP_KERNEL);
+	if (!rcmm)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, rcmm);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	rcmm->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(rcmm->base))
+		return PTR_ERR(rcmm->base);
+
+	rcmm->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(rcmm->clk)) {
+		dev_err(&pdev->dev, "Failed to get CMM clock");
+		return PTR_ERR(rcmm->clk);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id rcar_cmm_of_table[] = {
+	{ .compatible = "renesas,cmm" },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, rcar_cmm_of_table);
+
+static struct platform_driver rcar_cmm_platform_driver = {
+	.probe		= rcar_cmm_probe,
+	.driver		= {
+		.name	= "rcar-cmm",
+		.of_match_table = rcar_cmm_of_table,
+	},
+};
+
+module_platform_driver(rcar_cmm_platform_driver);
+
+MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org");
+MODULE_DESCRIPTION("Renesas R-Car CMM Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_cmm.h b/drivers/gpu/drm/rcar-du/rcar_du_cmm.h
new file mode 100644
index 000000000000..be9ac1a091b0
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_cmm.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * rcar_du_cmm.c -- R-Car Display Unit Color Management Module
+ *
+ * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
+ */
+
+#ifndef __RCAR_DU_CMM_H_
+#define __RCAR_DU_CMM_H_
+
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+struct rcar_du_crtc;
+
+struct rcar_du_cmm {
+	struct device_node *np;
+	unsigned int crtc;
+};
+
+int rcar_du_cmm_setup(struct platform_device *, struct rcar_du_crtc *);
+
+#endif /* __RCAR_DU_CMM_H_ */
-- 
2.21.0

