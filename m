Return-Path: <linux-renesas-soc+bounces-15266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13651A7813F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 19:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9609168E51
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 17:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C5720FA84;
	Tue,  1 Apr 2025 17:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uli569u9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF6020E334;
	Tue,  1 Apr 2025 17:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527729; cv=none; b=iY+QLwORKuXWqjkoqjtK/Ae9rTFm8XCab7ej/ScDgwhrCVE3zn7dJ5A8AOcfj2cW3pg0KD1tapqQCwW5NXrBhTkIR3BfpoKhLpg6JpGsAoPYVO0R2+8n1oX5dtW+ye60xSazzJ4NE/FikNUFFUCVihAjLLZJAX6zGRGMRtgjsZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527729; c=relaxed/simple;
	bh=YHPGEfE469rQVRmnnRqPn//vMrkL9roqUbQU0/K9SqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=itwLz2UfphjCwWEMhMSmRSXwTWQw+1rT4q0s6INvab5nmNjzcl1CfU8fOKJ6DQ28Dwo0aT6kCNaJlTs84yOmR62/D8qYO/z3yWlLmkSdCmub8x+hhjUxsnE2cUXYwnF28WMK2lUmszD5YKlasvp3BRFKnRl6cRKX4Yp9HLJo2h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uli569u9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a823036so54987365e9.0;
        Tue, 01 Apr 2025 10:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743527725; x=1744132525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MFXX3VPRI7Nq6uujuo0cRZB3JmhIZrDLtfX0a4FSdo=;
        b=Uli569u9Pn+sTl5i8pqXe4o2NgSPLwx5O6gm6tHB1M7z2gTlqzNog/BEHQeg3l0YmS
         bQgW3LAoFvbbu/xsxlAQJ4zS82MUMTCUaSW47jEGJnGL0k6FkCpI1pty4/bFIvUCPKPw
         5PVUPocwV0JuLqFhveBP4VXTjC3oJ3GyiRYtyxn0jPqnPFrODq2WqaCklAi9Cm/9OBKk
         xQS/dk2eBWNwxLcZzzpBXH5A2xr+zJ7VLKFoQCytxfZNYsAZiiSAajj+NNSBIbTbbx+r
         4AjZbjsqojJufyaDcHGVZBvKTe2kCYscBWrSc/T0Nbc0bQDJvOfx05mzfVjjwWvfN1Kw
         iO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743527725; x=1744132525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MFXX3VPRI7Nq6uujuo0cRZB3JmhIZrDLtfX0a4FSdo=;
        b=p/P1LNbgNGETdn1nn3DAuMv1qa2Rxh19zEsGw6brHq2bT+TNXRqvDcho9ZnNBjcYyP
         cyE24FqI60lgbjFinHsfu6AzpvJJ1E3syEF3Rv4ErovEytTYiikK59jh2dZYCzLNVzgi
         7IdiKu3QiU7Fip8UG+TfRULpWPTMNbIBC32POCnmFtrUxbG5pttNgFEr3AaoMQEfSEGQ
         imTDjszwwhhX9v3l3dZd07MdaVuyR2+hSlHfnylEMYkrkk7OtxUYEvR4usWG9yTNkzqu
         dHMZK+fkTs1FhwAzDyDalBFC/ivlOGCszDOP9EwnyZIXBuQNPIr6dxKNfI0Y6vNY/CTN
         XLFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5U+NtlG/NgzEyklu0GY9rBVGz3z9IyFb24tbPKFscXD+yDYl6VU/MeOAaWrra6fa6B7bYx1SP6t7Fmw8a@vger.kernel.org, AJvYcCX6XfLmwWtp1i9NF85AxqfAzrkKPkVFVkORv3rrCUybbfEyIMvfq3Zc9fOib3am7LDHU8uEXY6jrRyv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3NK5W9YiyB8/ZCjBltv+GA4IxBk6MxVV+Fg0669y0pybOApPj
	hirO03HVHghcdwiNe/UOaYcUQ1ndFXLV5pfUPYYzxkg+RUqv+xk2LX7kvA==
X-Gm-Gg: ASbGnctHAqz5IHr/ObmJEvb0mBmKEGfKgUuNJFaxjyUdGrpwLurKCxFqAlOVKgFo1GX
	DduceM2JdGp0lp8oC/TZDs9wdIqaHC3SH3c9D6ysvz/IVNKd6S4b3c3DMdCurtFZfswQCcMkPSN
	aleKNpNaE2iQoGFbvzDWgbh+SS4TrT+1BGrGl3w5j43wp2b/Y2aPUtnKUka34rT7nO2gXJuFTqY
	YHcV5oR0tpqiSpBeJ8TDRRMNlKhfiTYUnkKzVwuLsWW97tJ0ilKW2mwGiImCjI6E5R5F4UveteV
	jSRaIh1osecMjDwbWjRWSDreZfH1Npn9s8knoQ9ND+VR/Sz8i5mXeWOjMeVLLWSszc30LA==
X-Google-Smtp-Source: AGHT+IFK4gECNAmEV7mB2bgi2/MHttiqVonPZXNX4q8PDKxOQCSr0pGnOv5jm/ENSAX7yCAMr6JR0Q==
X-Received: by 2002:a05:600c:30d4:b0:43e:b027:479a with SMTP id 5b1f17b1804b1-43eb02747bamr7977485e9.16.1743527725157;
        Tue, 01 Apr 2025 10:15:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f6ce:ff76:f4b6:b6c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfd9bsm162583555e9.20.2025.04.01.10.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:15:24 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/3] reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)
Date: Tue,  1 Apr 2025 18:14:31 +0100
Message-ID: <20250401171432.101504-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Implement a USB2PHY port reset driver for the Renesas RZ/V2H(P) SoC.
Enable control of USB2.0 PHY reset and power-down operations, including
assert and deassert functionalities for the PHY.

Leverage device tree (OF) data to support future SoCs with similar USB2PHY
hardware but varying register configurations. Define initialization values
and control register settings to ensure flexibility for upcoming platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/reset/Kconfig               |   7 +
 drivers/reset/Makefile              |   1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 241 ++++++++++++++++++++++++++++
 3 files changed, 249 insertions(+)
 create mode 100644 drivers/reset/reset-rzv2h-usb2phy.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5b3abb6db248..c295b16866a6 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -218,6 +218,13 @@ config RESET_RZG2L_USBPHY_CTRL
 	  Support for USBPHY Control found on RZ/G2L family. It mainly
 	  controls reset and power down of the USB/PHY.
 
+config RESET_RZV2H_USB2PHY
+	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	help
+	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
+	  (and similar SoCs).
+
 config RESET_SCMI
 	tristate "Reset driver controlled via ARM SCMI interface"
 	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 677c4d1e2632..34e2ed9c6023 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
 obj-$(CONFIG_RESET_QCOM_PDC) += reset-qcom-pdc.o
 obj-$(CONFIG_RESET_RASPBERRYPI) += reset-raspberrypi.o
 obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
+obj-$(CONFIG_RESET_RZV2H_USB2PHY) += reset-rzv2h-usb2phy.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
new file mode 100644
index 000000000000..737b768829c9
--- /dev/null
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) USB2PHY Port reset control driver
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
+struct rzv2h_usb2phy_reset_of_data {
+	const struct rzv2h_usb2phy_regval *init_vals;
+	unsigned int init_val_count;
+
+	u16 reset_reg;
+	u16 reset_assert_val;
+	u16 reset_deassert_val;
+	u16 reset_status_bits;
+	u16 reset_release_val;
+
+	u16 reset2_reg;
+	u16 reset2_acquire_val;
+	u16 reset2_release_val;
+};
+
+struct rzv2h_usb2phy_reset_priv {
+	const struct rzv2h_usb2phy_reset_of_data *data;
+	void __iomem *base;
+	struct device *dev;
+	struct reset_controller_dev rcdev;
+	spinlock_t lock; /* protects register accesses */
+};
+
+static inline struct rzv2h_usb2phy_reset_priv
+*rzv2h_usbphy_rcdev_to_priv(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct rzv2h_usb2phy_reset_priv, rcdev);
+}
+
+/* This function must be called only after pm_runtime_resume_and_get() has been called */
+static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
+{
+	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
+
+	scoped_guard(spinlock, &priv->lock) {
+		writel(data->reset2_acquire_val, priv->base + data->reset2_reg);
+		writel(data->reset_assert_val, priv->base + data->reset_reg);
+	}
+
+	usleep_range(11, 20);
+}
+
+static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
+{
+	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
+	struct device *dev = priv->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err(dev, "pm_runtime_resume_and_get failed\n");
+		return ret;
+	}
+
+	rzv2h_usbphy_assert_helper(priv);
+
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
+				       unsigned long id)
+{
+	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
+	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
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
+		writel(data->reset_deassert_val, priv->base + data->reset_reg);
+		writel(data->reset2_release_val, priv->base + data->reset2_reg);
+		writel(data->reset_release_val, priv->base + data->reset_reg);
+	}
+
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
+				     unsigned long id)
+{
+	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
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
+	reg = readl(priv->base + priv->data->reset_reg);
+
+	pm_runtime_put(dev);
+
+	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
+}
+
+static const struct reset_control_ops rzv2h_usbphy_reset_ops = {
+	.assert = rzv2h_usbphy_reset_assert,
+	.deassert = rzv2h_usbphy_reset_deassert,
+	.status = rzv2h_usbphy_reset_status,
+};
+
+static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
+					const struct of_phandle_args *reset_spec)
+{
+	/* No special handling needed, we have only one reset line per device */
+	return 0;
+}
+
+static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
+{
+	const struct rzv2h_usb2phy_reset_of_data *data;
+	struct rzv2h_usb2phy_reset_priv *priv;
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
+	/* keep usb2phy in asserted state */
+	rzv2h_usbphy_assert_helper(priv);
+
+	pm_runtime_put(dev);
+
+	priv->rcdev.ops = &rzv2h_usbphy_reset_ops;
+	priv->rcdev.of_reset_n_cells = 0;
+	priv->rcdev.nr_resets = 1;
+	priv->rcdev.of_xlate = rzv2h_usb2phy_reset_of_xlate;
+	priv->rcdev.of_node = dev->of_node;
+	priv->rcdev.dev = dev;
+
+	return devm_reset_controller_register(dev, &priv->rcdev);
+}
+
+/*
+ * initialization values required to prepare the PHY to receive
+ * assert and deassert requests.
+ */
+static const struct rzv2h_usb2phy_regval rzv2h_init_vals[] = {
+	{ .reg = 0xc10, .val = 0x67c },
+	{ .reg = 0xc14, .val = 0x1f },
+	{ .reg = 0x600, .val = 0x909 },
+};
+
+static const struct rzv2h_usb2phy_reset_of_data rzv2h_reset_of_data = {
+	.init_vals = rzv2h_init_vals,
+	.init_val_count = ARRAY_SIZE(rzv2h_init_vals),
+	.reset_reg = 0,
+	.reset_assert_val = 0x206,
+	.reset_status_bits = BIT(2),
+	.reset_deassert_val = 0x200,
+	.reset_release_val = 0x0,
+	.reset2_reg = 0xb04,
+	.reset2_acquire_val = 0x303,
+	.reset2_release_val = 0x3,
+};
+
+static const struct of_device_id rzv2h_usb2phy_reset_of_match[] = {
+	{ .compatible = "renesas,r9a09g057-usb2phy-reset", .data = &rzv2h_reset_of_data },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzv2h_usb2phy_reset_of_match);
+
+static struct platform_driver rzv2h_usb2phy_reset_driver = {
+	.driver = {
+		.name		= "rzv2h_usb2phy_reset",
+		.of_match_table	= rzv2h_usb2phy_reset_of_match,
+	},
+	.probe = rzv2h_usb2phy_reset_probe,
+};
+module_platform_driver(rzv2h_usb2phy_reset_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/V2H(P) USB2PHY Control");
-- 
2.49.0


