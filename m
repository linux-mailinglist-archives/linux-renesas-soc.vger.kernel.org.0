Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 578009C421
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Aug 2019 15:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbfHYNvE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Aug 2019 09:51:04 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:58841 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728577AbfHYNvE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Aug 2019 09:51:04 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.homenet.telecomitalia.it (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DEEF2C0005;
        Sun, 25 Aug 2019 13:50:58 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie, daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/14] drm: rcar-du: Add support for CMM
Date:   Sun, 25 Aug 2019 15:51:48 +0200
Message-Id: <20190825135154.11488-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a driver for the R-Car Display Unit Color Correction Module.

In most of Gen3 SoCs, each DU output channel is provided with a CMM unit
to perform image enhancement and color correction.

Add support for CMM through a driver that supports configuration of
the 1-dimensional LUT table. More advanced CMM feature will be
implemented on top of this basic one.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/Kconfig    |   7 +
 drivers/gpu/drm/rcar-du/Makefile   |   1 +
 drivers/gpu/drm/rcar-du/rcar_cmm.c | 262 +++++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_cmm.h |  38 +++++
 4 files changed, 308 insertions(+)
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
index 000000000000..55361f5701e8
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * rcar_cmm.c -- R-Car Display Unit Color Management Module
+ *
+ * Copyright (C) 2019 Jacopo Mondi <jacopo+renesas@jmondi.org>
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_color_mgmt.h>
+
+#include "rcar_cmm.h"
+
+#define CM2_LUT_CTRL		0x0000
+#define CM2_LUT_CTRL_LUT_EN	BIT(0)
+#define CM2_LUT_TBL_BASE	0x0600
+#define CM2_LUT_TBL(__i)	(CM2_LUT_TBL_BASE + (__i) * 4)
+
+struct rcar_cmm {
+	void __iomem *base;
+	bool enabled;
+
+	/*
+	 * @lut:		1D-LUT status
+	 * @lut.enabled:	1D-LUT enabled flag
+	 * @lut.size:		Number of entries in the LUT table
+	 * @lut.table:		Table of 1D-LUT entries scaled to HW support
+	 *			precision (8-bits per color component)
+	 */
+	struct {
+		bool enabled;
+		unsigned int size;
+		u32 table[CMM_GAMMA_LUT_SIZE];
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
+/*
+ * rcar_cmm_lut_extract() - Scale down to hw precision the DRM LUT table
+ *			    entries and store them.
+ * @rcmm: Pointer to the CMM device
+ * @size: Number of entries in the table
+ * @drm_lut: DRM LUT table
+ */
+static void rcar_cmm_lut_extract(struct rcar_cmm *rcmm, size_t size,
+				 const struct drm_color_lut *drm_lut)
+{
+	unsigned int i;
+
+	for (i = 0; i < size; ++i) {
+		const struct drm_color_lut *lut = &drm_lut[i];
+
+		rcmm->lut.table[i] = drm_color_lut_extract(lut->red, 8) << 16
+				   | drm_color_lut_extract(lut->green, 8) << 8
+				   | drm_color_lut_extract(lut->blue, 8);
+	}
+
+	rcmm->lut.size = size;
+}
+
+/*
+ * rcar_cmm_lut_load() - Write to hw the LUT table entries from the local table.
+ *
+ * @rcmm: Pointer to the CMM device
+ */
+static void rcar_cmm_lut_load(struct rcar_cmm *rcmm)
+{
+	unsigned int i;
+
+	for (i = 0; i < rcmm->lut.size; ++i) {
+		u32 entry = rcmm->lut.table[i];
+
+		rcar_cmm_write(rcmm, CM2_LUT_TBL(i), entry);
+	}
+}
+
+/**
+ * rcar_cmm_setup() - configure the CMM unit
+ *
+ * @pdev: The platform device associated with the CMM instance
+ * @config: The CRTC-provided configuration.
+ *
+ * Configure the CMM unit with the CRTC-provided configuration.
+ * Currently enabling, disabling and programming of the 1-D LUT unit is
+ * supported.
+ */
+int rcar_cmm_setup(struct platform_device *pdev,
+		   const struct rcar_cmm_config *config)
+{
+	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
+
+	if (config->lut.size > CMM_GAMMA_LUT_SIZE)
+		return -EINVAL;
+
+	/*
+	 * As rcar_cmm_setup() is called by atomic commit tail helper, it might
+	 * be called when the CMM is disabled. As we can't program the hardware
+	 * in that case, store the configuration internally and apply it when
+	 * the CMM will be enabled by the CRTC through rcar_cmm_enable().
+	 */
+	if (!rcmm->enabled) {
+		if (!config->lut.enable)
+			return 0;
+
+		rcar_cmm_lut_extract(rcmm, config->lut.size, config->lut.table);
+		rcmm->lut.enabled = true;
+
+		return 0;
+	}
+
+	/* Stop LUT operations if requested. */
+	if (!config->lut.enable) {
+		if (rcmm->lut.enabled) {
+			rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
+			rcmm->lut.enabled = false;
+			rcmm->lut.size = 0;
+		}
+
+		return 0;
+	}
+
+	/*
+	 * Enable LUT and program the new gamma table values.
+	 *
+	 * FIXME: In order to have stable operations it is required to first
+	 * enable the 1D-LUT and then program its table entries. This seems to
+	 * contradict what the chip manual reports, and will have to be
+	 * reconsidered when implementing support for double buffering.
+	 */
+	if (!rcmm->lut.enabled) {
+		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_LUT_EN);
+		rcmm->lut.enabled = true;
+	}
+
+	rcar_cmm_lut_extract(rcmm, config->lut.size, config->lut.table);
+	rcar_cmm_lut_load(rcmm);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rcar_cmm_setup);
+
+/**
+ * rcar_cmm_enable() - enable the CMM unit
+ *
+ * @pdev: The platform device associated with the CMM instance
+ *
+ * Enable the CMM unit by enabling the parent clock and enabling the CMM
+ * components, such as 1-D LUT, if requested.
+ */
+int rcar_cmm_enable(struct platform_device *pdev)
+{
+	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
+	int ret;
+
+	if (!rcmm)
+		return -EPROBE_DEFER;
+
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Apply the LUT table values saved at rcar_cmm_setup() time. */
+	if (rcmm->lut.enabled) {
+		rcar_cmm_write(rcmm, CM2_LUT_CTRL, CM2_LUT_CTRL_LUT_EN);
+		rcar_cmm_lut_load(rcmm);
+	}
+
+	rcmm->enabled = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rcar_cmm_enable);
+
+/**
+ * rcar_cmm_disable() - disable the CMM unit
+ *
+ * @pdev: The platform device associated with the CMM instance
+ *
+ * Disable the CMM unit by stopping the parent clock.
+ */
+void rcar_cmm_disable(struct platform_device *pdev)
+{
+	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
+
+	rcar_cmm_write(rcmm, CM2_LUT_CTRL, 0);
+
+	pm_runtime_put(&pdev->dev);
+
+	rcmm->lut.enabled = false;
+	rcmm->lut.size = 0;
+
+	rcmm->enabled = false;
+}
+EXPORT_SYMBOL_GPL(rcar_cmm_disable);
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
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+static int rcar_cmm_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id rcar_cmm_of_table[] = {
+	{ .compatible = "renesas,cmm-r8a7795", },
+	{ .compatible = "renesas,cmm-r8a7796", },
+	{ .compatible = "renesas,cmm-r8a77965", },
+	{ .compatible = "renesas,cmm-r8a77990", },
+	{ .compatible = "renesas,cmm-r8a77995", },
+	{ .compatible = "renesas,rcar-gen3-cmm", },
+	{ .compatible = "renesas,rcar-gen2-cmm", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, rcar_cmm_of_table);
+
+static struct platform_driver rcar_cmm_platform_driver = {
+	.probe		= rcar_cmm_probe,
+	.remove		= rcar_cmm_remove,
+	.driver		= {
+		.name	= "rcar-cmm",
+		.of_match_table = rcar_cmm_of_table,
+	},
+};
+
+module_platform_driver(rcar_cmm_platform_driver);
+
+MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org>");
+MODULE_DESCRIPTION("Renesas R-Car CMM Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/rcar-du/rcar_cmm.h
new file mode 100644
index 000000000000..b0bb7349ebaa
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
+#define CMM_GAMMA_LUT_SIZE		256
+
+struct drm_color_lut;
+struct platform_device;
+
+/**
+ * struct rcar_cmm_config - CMM configuration
+ *
+ * @lut:	1D-LUT configuration
+ * @lut.enable:	1D-LUT enable flag
+ * @lut.table:	1D-LUT table entries
+ * @lut.size:	Number of 1D-LUT (max 256)
+ */
+struct rcar_cmm_config {
+	struct {
+		bool enable;
+		struct drm_color_lut *table;
+		unsigned int size;
+	} lut;
+};
+
+int rcar_cmm_enable(struct platform_device *pdev);
+void rcar_cmm_disable(struct platform_device *pdev);
+
+int rcar_cmm_setup(struct platform_device *pdev,
+		   const struct rcar_cmm_config *config);
+
+#endif /* __RCAR_CMM_H__ */
--
2.22.0

