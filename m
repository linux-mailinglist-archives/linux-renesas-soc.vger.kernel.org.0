Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE47F37666
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 16:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbfFFOWR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 10:22:17 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:44117 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728950AbfFFOWN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 10:22:13 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1BC8C2000D;
        Thu,  6 Jun 2019 14:22:09 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/20] drm: rcar-du: Add support for CMM
Date:   Thu,  6 Jun 2019 16:22:14 +0200
Message-Id: <20190606142220.1392-15-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a driver for the R-Car Display Unit Color Correction Module.

Each DU output channel is provided with a CMM unit to perform image
enhancement and color correction.

Add support for CMM through a driver that supports configuration of
the 1-dimensional LUT table. More advanced CMM feature could be
implemented on top of this basic one.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/Kconfig    |   7 +
 drivers/gpu/drm/rcar-du/Makefile   |   1 +
 drivers/gpu/drm/rcar-du/rcar_cmm.c | 197 +++++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_cmm.h |  38 ++++++
 4 files changed, 243 insertions(+)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 1529849e217e..539d232790d1 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -13,6 +13,13 @@ config DRM_RCAR_DU
 	  Choose this option if you have an R-Car chipset.
 	  If M is selected the module will be called rcar-du-drm.
 
+config DRM_RCAR_CMM
+	bool "R-Car DU Color Management Module (CMM) Support"
+	depends on DRM && OF
+	depends on DRM_RCAR_DU
+	help
+	  Enable support for R-Car Color Management Module (CMM).
+
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car DU Gen3 HDMI Encoder Support"
 	depends on DRM && OF
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 6c2ed9c46467..4d1187ccc3e5 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -15,6 +15,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
 
+obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
new file mode 100644
index 000000000000..5d9d917b91f4
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rcar_cmm.c -- R-Car Display Unit Color Management Module
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
+#include <drm/drm_atomic.h>
+
+#include "rcar_cmm.h"
+
+#define CM2_LUT_CTRL		0x00
+#define CM2_LUT_CTRL_EN		BIT(0)
+#define CM2_LUT_TBLA		0x600
+
+struct rcar_cmm {
+	struct clk *clk;
+	void __iomem *base;
+	bool enabled;
+
+	/* LUT table scratch buffer. */
+	struct {
+		bool restore;
+		unsigned int size;
+		uint32_t table[CMM_GAMMA_LUT_SIZE];
+	} lut;
+};
+
+static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
+{
+	return ioread32(rcmm->base + reg);
+}
+
+static inline void rcar_cmm_write(struct rcar_cmm *rcmm, u32 reg, u32 data)
+{
+	iowrite32(data, rcmm->base + reg);
+}
+
+int rcar_cmm_setup(struct platform_device *pdev, struct rcar_cmm_config *config)
+{
+	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
+	unsigned int i;
+
+	if (config->lut.size > CMM_GAMMA_LUT_SIZE)
+		return -EINVAL;
+
+	/*
+	 * As cmm_setup is called by atomic commit tail helper, it might be
+	 * called before the enabling the CRTC (which calls cmm_enable()).
+	 *
+	 * Store the LUT table entries in the scratch buffer to be later
+	 * programmed at enable time.
+	 */
+	if (!rcmm->enabled) {
+		if (!config->lut.enable)
+			return 0;
+
+		for (i = 0; i < config->lut.size; ++i) {
+			struct drm_color_lut *lut = &config->lut.table[i];
+
+			rcmm->lut.table[i] = (lut->red & 0xff) << 16 |
+					     (lut->green & 0xff) << 8 |
+					     (lut->blue & 0xff);
+		}
+
+		rcmm->lut.restore = true;
+		rcmm->lut.size = config->lut.size;
+
+		return 0;
+	}
+
+	if (rcar_cmm_read(rcmm, CM2_LUT_CTRL) & CM2_LUT_CTRL_EN &&
+	    !config->lut.enable) {
+		rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
+		return 0;
+	}
+
+	/* Enable LUT and program the new gamma table values. */
+	rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_EN);
+	for (i = 0; i < config->lut.size; ++i) {
+		struct drm_color_lut *lut = &config->lut.table[i];
+		u32 val = (lut->red & 0xff) << 16 | (lut->green & 0xff) << 8 |
+			  (lut->blue & 0xff);
+
+		rcar_cmm_write(rcmm, CM2_LUT_TBLA + i * 4, val);
+	}
+
+	return 0;
+}
+
+int rcar_cmm_enable(struct platform_device *pdev)
+{
+	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
+	unsigned int i;
+	int ret;
+
+	if (rcmm->enabled)
+		return 0;
+
+	ret = clk_prepare_enable(rcmm->clk);
+	if (ret)
+		return ret;
+
+	/* Apply the LUT table values saved at cmm_setup time. */
+	if (rcmm->lut.restore) {
+		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_EN);
+		for (i = 0; i < rcmm->lut.size; ++i)
+			rcar_cmm_write(rcmm, CM2_LUT_TBLA + i * 4,
+				       rcmm->lut.table[i]);
+
+		rcmm->lut.restore = false;
+		rcmm->lut.size = 0;
+	}
+
+	rcmm->enabled = true;
+
+	return 0;
+}
+
+void rcar_cmm_disable(struct platform_device *pdev)
+{
+	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
+
+	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
+
+	clk_disable_unprepare(rcmm->clk);
+
+	rcmm->lut.restore = false;
+	rcmm->lut.size = 0;
+	rcmm->enabled = false;
+}
+
+static int rcar_cmm_probe(struct platform_device *pdev)
+{
+	struct rcar_cmm *rcmm;
+	struct resource *res;
+	resource_size_t size;
+
+	rcmm = devm_kzalloc(&pdev->dev, sizeof(*rcmm), GFP_KERNEL);
+	if (!rcmm)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, rcmm);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	size = resource_size(res);
+	if (!devm_request_mem_region(&pdev->dev, res->start, size,
+				     dev_name(&pdev->dev))) {
+		dev_err(&pdev->dev,
+			"can't request region for resource %pR\n", res);
+		return -EBUSY;
+	}
+
+	rcmm->base = devm_ioremap_nocache(&pdev->dev, res->start, size);
+	if (IS_ERR(rcmm->base))
+		return PTR_ERR(rcmm->base);
+
+	rcmm->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(rcmm->clk)) {
+		dev_err(&pdev->dev, "Failed to get CMM clock");
+		return PTR_ERR(rcmm->clk);
+	}
+
+	rcmm->lut.restore = false;
+	rcmm->lut.size = 0;
+	rcmm->enabled = false;
+
+	return 0;
+}
+
+static const struct of_device_id rcar_cmm_of_table[] = {
+	{ .compatible = "renesas,cmm-gen3" },
+	{ .compatible = "renesas,cmm-gen2" },
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
diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/rcar-du/rcar_cmm.h
new file mode 100644
index 000000000000..da61a145dc5c
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * rcar_cmm.h -- R-Car Display Unit Color Management Module
+ *
+ * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
+ */
+
+#ifndef __RCAR_CMM_H__
+#define __RCAR_CMM_H__
+
+#include <linux/platform_device.h>
+
+#define CMM_GAMMA_LUT_SIZE		256
+
+struct drm_color_lut;
+
+/**
+ * struct rcar_cmm_config - CMM configuration
+ *
+ * @lut:	1D-LUT configuration
+ * @lut.enable:	1D-LUT enable flag
+ * @lut.table:	1D-LUT table entries.
+ * @lut.size	1D-LUT number of entries. Max is 256
+ */
+struct rcar_cmm_config {
+	struct {
+		bool enable;
+		struct drm_color_lut *table;
+		unsigned int size;
+	} lut;
+};
+
+int rcar_cmm_enable(struct platform_device *);
+void rcar_cmm_disable(struct platform_device *);
+
+int rcar_cmm_setup(struct platform_device *, struct rcar_cmm_config *);
+
+#endif /* __RCAR_CMM_H__ */
-- 
2.21.0

