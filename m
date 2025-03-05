Return-Path: <linux-renesas-soc+bounces-13998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2489EA4FED3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 13:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 826A916FCAE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 12:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0726F248860;
	Wed,  5 Mar 2025 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3JSQ+Lp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6622459E0;
	Wed,  5 Mar 2025 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741178373; cv=none; b=tU71jywOOC0m88QCwe84sY/pRlNKQUeC5zYEweW9sGTGYd1xq+7NLxJM1ZI9Xb1kEnTrKlFsVNqrnJBT8lOVc6SR41eFfhqlS1UP+obYGcIe8neXZHRbaR/kZllHZiuB6yznGj/14bBSlAGCQP8C0Nze8jLyQZSOAzpuvkSUz78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741178373; c=relaxed/simple;
	bh=6Hpthnt97xW3thf8b4moKs7+DxziCoPXbfbmllxFrTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSB0E7U2u2RVPdt61YV1skmu2EYO1YFxaOJaD1hpGxLbiHINjw5IQunT+su3Y9HofoZkJfPejN94x+lbGSVU0+rNKZwtDRUKmK010+F53GTapw5ZX12L2ucjLE8mfQHRM8RiE74vDhRinNr905MTtjWTHSk5Pdr2vyq4R96GUyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3JSQ+Lp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bc6a6aaf7so25282015e9.2;
        Wed, 05 Mar 2025 04:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741178369; x=1741783169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8vlw32DvAtNWgxBRWlDbcwc6lmjNIf3Cq/JQY18DRc=;
        b=m3JSQ+Lp9Lf7cVsXBW8KneqQybe7RmUl1On8i/nh/VGN94Vs2ejEpIwK4VdtMexA3e
         FMKkjI9v1DWIOOX2l5U33eEzqqTv1ZQVtOHyWco7CvX3FGFhGXAGkhJkPsDOPXfphhtw
         XXNSgCOX+EJ8+PlaGwbasgtE4U04tdDpUv4/dx48jPbRHkSC3tY8e6Gg/Uh2OJG9Py5e
         uBSeRsknlh1IsA0tDcim2dhZghAbLRcmLfk58nMD3IxTRQkbngVWt7ChdiD57x8Kfuo6
         XqNG9tLl/ZNkd3m3hc2B63hR36RBDqnuuOoewK6Om9oAjIwKlzg8t2iB2+bSdynai1+P
         uFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741178369; x=1741783169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8vlw32DvAtNWgxBRWlDbcwc6lmjNIf3Cq/JQY18DRc=;
        b=JVlRN1s4LbmCF0kRbBgduoG0jh78tJypDVMZBUL86nBt+2Z/b/ecxEC0AwtaDbEynC
         iar3YIARHK4NZOnwQ3P0N3GuU2EXHflyzt6J/qpe1BfIwm9iUFWD6BpPQFJEPRH/jUYe
         GdZ7RT2wnHqvrVh50rfO5OqZCN806CscnU4NoH1wVg98DG12PKtnko6sWyibV7L958Sy
         rXb6ZXZOFpbvfHZZXW8JyYI/BjcaqMEp/rUX3tlnXMtjMX0Pm2JEZdGHNc/GCzpBB9Uo
         2FkDbADmAZfCUYnMvauZ2acm6riJuitjW7Gbnljf9pH568q+aHvrBepINAKj+1XCAyhp
         IdhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9KNc/QWtNw1fQL0SY5u6DgFSIRsdOuHTq14Bh59u2r8VMvhp2viLTHE2CEtfz0oc5F0QY6WlZZ78UnFk=@vger.kernel.org, AJvYcCWjxApT0tZgHtjlEjp1n7LcGXkbkU2AYnWQj7ReAhHnR89C7LM2AIr9oG9qhbiFhXggLzhahD+gVjdQV8IjQcpBSuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzxXHcL/cs5k/lvemu9CK97oRvaBsNqPmL2NZGNGwYqbGh14zu
	RBW0wvtsGWDoaPBgKCQfr4HtEjsHi0V2fsv5mrk3vHENKuxMF4ds
X-Gm-Gg: ASbGnctQJFdiADZXA2LkY8BTvKCDY3OZqwhlhJhXZaT0uZcJByeKmjmuiiKiS5l4zb9
	HcfRpsaC906OnuyciI8Pe6Lzo9TNbGxKJa+JaRz77ThzSTOycnnkHPmAYPZLDpljRQld1aJJ+Im
	/IWahOHqJEK/s29wPN7SGXt84Z69N0VgY8JBbqWHGYoJC2gD5CVe4tl/RCrRHuNF5Zjj1UHQwH7
	EZ7JhYnFi5QVZ0hoL5QY8jKFMKrb4PzPpneT7aFbhutYh2szWqLDn8DJPa2cUlbFMgnc05CS06f
	qkJqId2KXqwP3BzfktBm9oDHGaXIZ2NX6hmLEbZOA5gtNn3Quhn+7U8mTTzukWJlKZWhfOw=
X-Google-Smtp-Source: AGHT+IHZR7ob/jujrmswE0cAQJxf7IbgGSFq65obOJ+avq/wEO0vXFB9U/oe4/s6WYfLXyLxKo4eLQ==
X-Received: by 2002:a05:600c:1d0b:b0:43b:c0fa:f9eb with SMTP id 5b1f17b1804b1-43bd29a12e7mr21232735e9.17.1741178368906;
        Wed, 05 Mar 2025 04:39:28 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:8fc2:ef5:605a:34d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd426d32dsm16851495e9.7.2025.03.05.04.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 04:39:28 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] reset: Add USB2PHY control driver for Renesas RZ/V2H(P)
Date: Wed,  5 Mar 2025 12:39:14 +0000
Message-ID: <20250305123915.341589-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the USB2PHY control driver on the Renesas RZ/V2H(P) SoC.
Make the driver handle reset and power-down operations for the USB2PHY.

Pass OF data to support future SoCs with similar USB2PHY hardware but
different register configurations. Define device-specific initialization
values and control register settings in OF data to ensure flexibility
for upcoming SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/reset/Kconfig                    |   7 +
 drivers/reset/Makefile                   |   1 +
 drivers/reset/reset-rzv2h-usb2phy-ctrl.c | 223 +++++++++++++++++++++++
 3 files changed, 231 insertions(+)
 create mode 100644 drivers/reset/reset-rzv2h-usb2phy-ctrl.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5b3abb6db248..bac08dae8905 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -218,6 +218,13 @@ config RESET_RZG2L_USBPHY_CTRL
 	  Support for USBPHY Control found on RZ/G2L family. It mainly
 	  controls reset and power down of the USB/PHY.
 
+config RESET_RZV2H_USB2PHY_CTRL
+	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY control driver"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	help
+	  Support for USB2PHY Control found on the RZ/V2H(P) SoC (and similar SoCs).
+	  It mainly controls reset and power down of the USB2 PHY.
+
 config RESET_SCMI
 	tristate "Reset driver controlled via ARM SCMI interface"
 	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 677c4d1e2632..3cb3df018cf8 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
 obj-$(CONFIG_RESET_QCOM_PDC) += reset-qcom-pdc.o
 obj-$(CONFIG_RESET_RASPBERRYPI) += reset-raspberrypi.o
 obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
+obj-$(CONFIG_RESET_RZV2H_USB2PHY_CTRL) += reset-rzv2h-usb2phy-ctrl.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
diff --git a/drivers/reset/reset-rzv2h-usb2phy-ctrl.c b/drivers/reset/reset-rzv2h-usb2phy-ctrl.c
new file mode 100644
index 000000000000..a6daeaf37e1c
--- /dev/null
+++ b/drivers/reset/reset-rzv2h-usb2phy-ctrl.c
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) USB2PHY control driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/reset-controller.h>
+
+struct rzv2h_usb2phy_regval {
+	u16 reg;
+	u16 val;
+};
+
+struct rzv2h_usb2phy_data {
+	const struct rzv2h_usb2phy_regval *init_vals;
+	unsigned int init_val_count;
+
+	u16 ctrl_reg;
+	u16 ctrl_assert_val;
+	u16 ctrl_deassert_val;
+	u16 ctrl_status_bits;
+	u16 ctrl_release_val;
+
+	u16 ctrl2_reg;
+	u16 ctrl2_acquire_val;
+	u16 ctrl2_release_val;
+};
+
+struct rzv2h_usb2phy_ctrl_priv {
+	const struct rzv2h_usb2phy_data *data;
+	void __iomem *base;
+	struct device *dev;
+	struct reset_controller_dev rcdev;
+	spinlock_t lock;
+};
+
+#define rcdev_to_priv(x) container_of(x, struct rzv2h_usb2phy_ctrl_priv, rcdev)
+
+static int rzv2h_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	struct rzv2h_usb2phy_ctrl_priv *priv = rcdev_to_priv(rcdev);
+	const struct rzv2h_usb2phy_data *data = priv->data;
+	struct device *dev = priv->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, "pm_runtime_resume_and_get failed\n");
+		return ret;
+	}
+	scoped_guard(spinlock, &priv->lock) {
+		writel(data->ctrl2_acquire_val, priv->base + data->ctrl2_reg);
+		writel(data->ctrl_assert_val, priv->base + data->ctrl_reg);
+	}
+
+	/* The reset line needs to be asserted for more than 10 microseconds. */
+	udelay(11);
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static int rzv2h_usbphy_ctrl_deassert(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	struct rzv2h_usb2phy_ctrl_priv *priv = rcdev_to_priv(rcdev);
+	const struct rzv2h_usb2phy_data *data = priv->data;
+	struct device *dev = priv->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, "pm_runtime_resume_and_get failed\n");
+		return ret;
+	}
+
+	scoped_guard(spinlock, &priv->lock) {
+		writel(data->ctrl_deassert_val, priv->base + data->ctrl_reg);
+		writel(data->ctrl2_release_val, priv->base + data->ctrl2_reg);
+		writel(data->ctrl_release_val, priv->base + data->ctrl_reg);
+	}
+
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static int rzv2h_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	struct rzv2h_usb2phy_ctrl_priv *priv = rcdev_to_priv(rcdev);
+	struct device *dev = priv->dev;
+	int ret;
+	u32 reg;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, "pm_runtime_resume_and_get failed\n");
+		return ret;
+	}
+
+	scoped_guard(spinlock, &priv->lock)
+		reg = readl(priv->base + priv->data->ctrl_reg);
+
+	pm_runtime_put(dev);
+
+	return (reg & priv->data->ctrl_status_bits) == priv->data->ctrl_status_bits;
+}
+
+static const struct reset_control_ops rzv2h_usbphy_ctrl_reset_ops = {
+	.assert = rzv2h_usbphy_ctrl_assert,
+	.deassert = rzv2h_usbphy_ctrl_deassert,
+	.status = rzv2h_usbphy_ctrl_status,
+};
+
+static int rzv2h_reset_of_xlate(struct reset_controller_dev *rcdev,
+				const struct of_phandle_args *reset_spec)
+{
+	/* No special handling needed, we have only one reset line per device */
+	return 0;
+}
+
+static int rzv2h_usb2phy_ctrl_probe(struct platform_device *pdev)
+{
+	const struct rzv2h_usb2phy_data *data;
+	struct rzv2h_usb2phy_ctrl_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct reset_control *rstc;
+	int error;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return dev_err_probe(dev, -ENODEV,
+				     "failed to match device\n");
+
+	priv->data = data;
+	priv->dev = dev;
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	rstc = devm_reset_control_get_shared_deasserted(dev, NULL);
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc),
+				     "failed to get deasserted reset\n");
+
+	spin_lock_init(&priv->lock);
+	dev_set_drvdata(dev, priv);
+
+	error = devm_pm_runtime_enable(dev);
+	if (error)
+		return dev_err_probe(dev, error, "Failed to enable pm_runtime\n");
+
+	error = pm_runtime_resume_and_get(dev);
+	if (error)
+		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n");
+
+	for (unsigned int i = 0; i < data->init_val_count; i++)
+		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
+
+	pm_runtime_put(dev);
+
+	priv->rcdev.ops = &rzv2h_usbphy_ctrl_reset_ops;
+	priv->rcdev.of_reset_n_cells = 0;
+	priv->rcdev.nr_resets = 1;
+	priv->rcdev.of_xlate = rzv2h_reset_of_xlate;
+	priv->rcdev.of_node = dev->of_node;
+	priv->rcdev.dev = dev;
+
+	return devm_reset_controller_register(dev, &priv->rcdev);
+}
+
+static const struct rzv2h_usb2phy_regval rzv2h_init_vals[] = {
+	{ .reg = 0xc10, .val = 0x67c },
+	{ .reg = 0xc14, .val = 0x1f },
+	{ .reg = 0x600, .val = 0x909 },
+};
+
+static const struct rzv2h_usb2phy_data rzv2h_of_data = {
+	.init_vals = rzv2h_init_vals,
+	.init_val_count = ARRAY_SIZE(rzv2h_init_vals),
+	.ctrl_reg = 0,
+	.ctrl_assert_val = 0x206,
+	.ctrl_status_bits = BIT(2),
+	.ctrl_deassert_val = 0x200,
+	.ctrl_release_val = 0x0,
+	.ctrl2_reg = 0xb04,
+	.ctrl2_acquire_val = 0x303,
+	.ctrl2_release_val = 0x3,
+};
+
+static const struct of_device_id rzv2h_usb2phy_ctrl_match_table[] = {
+	{ .compatible = "renesas,r9a09g057-usb2phy-ctrl", .data = &rzv2h_of_data },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzv2h_usb2phy_ctrl_match_table);
+
+static struct platform_driver rzv2h_usb2phy_ctrl_driver = {
+	.driver = {
+		.name		= "rzv2h_usb2phy_ctrl",
+		.of_match_table	= rzv2h_usb2phy_ctrl_match_table,
+	},
+	.probe = rzv2h_usb2phy_ctrl_probe,
+};
+module_platform_driver(rzv2h_usb2phy_ctrl_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/V2H(P) USB2PHY Control");
-- 
2.43.0


