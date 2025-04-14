Return-Path: <linux-renesas-soc+bounces-15909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B09A880F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5D0D1897096
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 13:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3100C78F43;
	Mon, 14 Apr 2025 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljxzSUfW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255721EB36;
	Mon, 14 Apr 2025 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635630; cv=none; b=JkAlACjEzvFnlUa3PMsoXIXme3Z2/gT+jWaosoOFcpiIgFy+obvLdfiOqzHWYcOUctNynr3HunIK9m8bJxSJ30RsaBIGaFjC13zyU3NIzK+kFQiM8lPZYBJ5e24DFPl99pxZdEeaQ5bHiuj/rzxU+jcJkTiVtFw2J4S6HPumWp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635630; c=relaxed/simple;
	bh=wzSitwedtw9xNDLPCXhBB9iD0tisj5xlZIUNyCvBXcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VuTTnxOEawnUGEfBo8StZQ/V3VF9THOgJPgz9V0fSgjzIc5nNXK1jvtOe2IlA0omrc/q2uVTCCP5Fphvn9ujtb91DFLMeEyDxlAI60nsi9Bu/Smf8hqGGWeoxIXv3f3JMJy71LJms+IYCGmB75RZF8UiEkTFGezzw2tNF3DFU6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljxzSUfW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c14016868so3942664f8f.1;
        Mon, 14 Apr 2025 06:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744635626; x=1745240426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CV7p10zKNb8WhsH7g4dc5YsLzrHpuCUEgSJUjbNBRI=;
        b=ljxzSUfWJQLWJ9WxvG48U48jzzQMUmMZYjHr67/25/rzVK2k3ktWnuNLCgyElJNWf3
         SyH5EhOHtUreW2oELkAIx4mdoRxHR7yYOKJltkFQPsLudqXX+OJs8xMLWZQ61upxI97R
         GXs9VyURGaB5bu+eW1Zna6WRqpbSIPPmMf/dgOU/JhnnKUgpB7A5fJFejFfjt+30PeAg
         OOos5VnG3jiXOVuVdmffQCJNJMM/o6kO94tkmVgF6UPc8cIKhN1ix8TzuVzFtJgZ0Wd1
         5G2amlyPdxTuGbC4vL2Ggtp8hZA+JAykJQFAXZfG23M8KntXAu6uz5cWAkA95czaGICb
         dy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744635626; x=1745240426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CV7p10zKNb8WhsH7g4dc5YsLzrHpuCUEgSJUjbNBRI=;
        b=peLo9VYpUvLa5AnqCB3kURPn9BQzuJeL3/D3Wz/O6ZEbZi4smHl68WnDpBDq+o317z
         YOen8uANnGBknU+OHgojWSStfab7pVTyF2EWyOcCXUeEa3LxdDdIRhgeRy91UJDxpoTD
         egG0tFDs3qNFg2AiSLHToMivA2z56fnfbEF8LEbWeiY6ta4cvqM4H3/zcQM/wGnk93/V
         cppGjyJtIwSg97wTaJvgcRULV0cZe4jus3CSQ9oekPEhtSb5waSnDBY3Ljy43cXwwVB8
         yWAmmcIc6M0cCGXc1merkBDtjnctXrW+fwZ05ME4zDI44Uqe9jF5Z4dBjyvwRhKFIXMk
         /TIw==
X-Forwarded-Encrypted: i=1; AJvYcCUsUCfDNwDjDWnF3YoGMSyjKJUuFMJFhoqiYyFMqXsRj9z3miE8qCG2sKEEewJBHrmMvt3tD9X8NCel@vger.kernel.org, AJvYcCX6jAwDGmkkjsiZxWqhWieaeTCGbuxoHfjQUcARCvrGqq7JbUftlShfk0EE4s4AdmSwakhW1yGmntHQcJ6h@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfVlJup9ccFieoksc1BJ+z2JV6BNdAPAolr8jfd0x/0FmlMPE
	YaC2h/f4UTvm/XNmwcjNJGkIdGUR6rXZiRqJsj+ReF92V5e/tF59
X-Gm-Gg: ASbGncta/aFyghfGoaVbWxNDnt8S3ZmvHLEdNJdFdC+Tsoc6S8fpzdbDHSk6r6OkL0i
	xeqGTgGvFhwyVQk3kwUf/VA4/76/RBHpDg9pApp3AkcD2MI1ppFtAteeC3OV+KtI1lvr4q0Zkns
	Hcqnnxpw1rBJQgOAaDuBtsS+AeXa127RqXdqzlJuxMzUCzs0oxLgm9wlo3Qt2RvPpdubKM6A2JM
	oBqhEZvaOfd90Q6Ba4PlFTDWBjiuxmsPn7PguQz7RceyHypemb0eEMTHOmk7sg0qtrpH/t+5GNL
	JkF1JgIAcebuohJe4rn/haqad4aJg0qmMNSoOtvkHirpIJP1HSadExRJ2gaYCudF
X-Google-Smtp-Source: AGHT+IGZ1ZQz88ZONpfCKHuYX6abKvCA2CvJM0svob3Y4lMtrlrjd1nMgwVDa1rVNIEz5KGiLmJccg==
X-Received: by 2002:a05:6000:2282:b0:39c:30f9:1e57 with SMTP id ffacd0b85a97d-39ea5203576mr9852364f8f.18.1744635626057;
        Mon, 14 Apr 2025 06:00:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:eb55:397c:6c6:e937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979663sm11214681f8f.51.2025.04.14.06.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 06:00:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)
Date: Mon, 14 Apr 2025 14:00:19 +0100
Message-ID: <20250414130020.248374-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 99f6f9784e68..6c7dbd8ca580 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -225,6 +225,13 @@ config RESET_RZG2L_USBPHY_CTRL
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
index 31f9904d13f9..30d0fb4ac965 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
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


