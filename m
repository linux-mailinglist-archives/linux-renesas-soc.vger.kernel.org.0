Return-Path: <linux-renesas-soc+bounces-16035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFF8A8A885
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 21:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38556188DA05
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 19:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349BC2566EE;
	Tue, 15 Apr 2025 19:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADNMYLgV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C546255E39;
	Tue, 15 Apr 2025 19:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746704; cv=none; b=cJ4FWtQNU6ojPBhymLpc0ay6eQJfz51uymDYcoWu8WM2q29Qqd3o8AFEj6YjZJXo9I06WX0s1wqV30p5FEWIuzB7QncBg87Zbu08w+tD78nB0gJ+lnHSIJfFOPeQ2wvFDKlsD3YPX7OUI9uDFT1KBtSgwiD7Sc+aOiuvwQ0063s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746704; c=relaxed/simple;
	bh=XewMIWvw+OSCqxBs2HEwYzd38vDL9PHrApbs+J7UacI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJvnT8eSjNKLhuQbfGkrHffU2gmiT/cQwppOCNVlcu9HPgQXJDEhg/A3UwOYISuskR+qi+CeWHBvzJx+iiCu+o26Bng2fyJP/7RONI0tBWZp2LJeJDXujKMOZiTgZAS3gemp2Qo2CeI885loJcKR2el4H4KxgVkMTRbif57umcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADNMYLgV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so62662335e9.3;
        Tue, 15 Apr 2025 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744746699; x=1745351499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJVE7Wi4eP0vQp2LWsD/67qu5LVe/5oWYJYPf5aDop0=;
        b=ADNMYLgVmJB41WaiK/jJnBi6zU0JubVoMYyooXEQcmX0wBZxbtuvla/MPcsax6HrLB
         V7G2siX3AGv/hB/z4KRngD1dpqgAHzR4ZLpBUSnPT2Na0YgRpdiWnKjGm1T6oMu2GrdZ
         Fp1XfDuNo0R5AkFfkSHiQ+B39nH2uGdFPAVm2qWWSAxzSdD6pQlgTwu4irlKR4cHqJBD
         PIcOhqOBM9hCKNmn0oBOchjpzAJk1ui/Wl9UC5SvrfE+x8ejJasba7CbSXY2nFtOLFfL
         +rvtoFjbAFm50r9AycIpcBZ3+mZeS1tG9v2hiHYacBneDAOTWEgZFB0h2+8iiAB2klw2
         FXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744746699; x=1745351499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJVE7Wi4eP0vQp2LWsD/67qu5LVe/5oWYJYPf5aDop0=;
        b=d5Wp5uUqmujsdOj78397a5C0xdV50hL69yEFjfcJAgZz7RCHzXjA/9O+/bgveeKbnq
         /jg/smFlEVkJD/+ABpsjpCeFRdF5QXS7JzdNtp97V5SqWw5E8iSCaL8Gc47YpYcsRqHr
         YLg/GQdE350AmRutRys5gQD9dfwnbJBW2+TwW4fYFzGgd4sheK5R7eviHlamQ7JIBODE
         IhX6hEydHik7gem/2yEprwPIFhUVeX/4TsFn1prx2pZE3JAVIvfB7bRobjhYzJDswrGl
         xnyedR+VXngu20hKRr9wmOFPHLbRloNqfqwT8fcCFQFNbZE0o7nHn7C4dywxck8hMoEP
         FeXw==
X-Forwarded-Encrypted: i=1; AJvYcCU2jHpjn1DtLVbisWPL5iWgnG8LaE8rzaUjZy4gjEN6bLue1B0cey+kTDeCPrCaWNVA5DajxEYEeWMMqad2@vger.kernel.org, AJvYcCWfV2O6Ge1ma2yxjbf4PHVMliDafNAnya6svOoBY4gnwWRj82orFClfp7yEs+TUIA8nGjHPbzJ7Flm5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg4sLbN7bHkMNgBKDQaInGJxtPLnEoNkXU1JUDFVLVPTV60kVp
	cUKLmYbehf5IlHaMnoBm9QJRhFJi1GlSebXBUwGQqjKX/EKryWN6
X-Gm-Gg: ASbGncufhsDHqxZd1HxsV13mXafGO2gWiuq2wUu34CJjw8BRckGIRtqCjJ0ne3wC5Tk
	/Q0+aKpviOiTcE7UZH0bdPyNqIj9FGMOp/UFPVykgc14vrYFuBqD3Vj7JCsQAZzDV3fZUWjVTfS
	DNR9HAddDtmQVYjE0BCqEVdrY+5N7dMd/Em4uu0+y39wddJqU2fpIuGtOMrXBnH8MD+rPXyd2oA
	xpps5WsYUM6M+67nyTNpNr7RBiriEEbA7FHsovnnRfFyXLw2tH1wPkScIkXxE3MYFi1zsUIoSIR
	D7elk+n+9Nt1hQqF3TGa0r1/nCDzv+CkDCPAwjtxEujEBHBkGc4tsVSUbZg6+myk
X-Google-Smtp-Source: AGHT+IHgw27dk53Q8h3eZVgn1ft0ojQ2vjJ6i8eDLwN63u6KhmSTopXU+TWCeinTuZxmWOhl9XESkA==
X-Received: by 2002:a05:600c:1e27:b0:43c:fbe2:df3c with SMTP id 5b1f17b1804b1-4405a0fab42mr2774055e9.26.1744746699096;
        Tue, 15 Apr 2025 12:51:39 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404451c67dsm14169335e9.3.2025.04.15.12.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:51:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 2/3] reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)
Date: Tue, 15 Apr 2025 20:51:30 +0100
Message-ID: <20250415195131.281060-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415195131.281060-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415195131.281060-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/reset/Kconfig               |   7 +
 drivers/reset/Makefile              |   1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 236 ++++++++++++++++++++++++++++
 3 files changed, 244 insertions(+)
 create mode 100644 drivers/reset/reset-rzv2h-usb2phy.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 11ce86c8156b..d85be5899da6 100644
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
index 6322a191e2a8..91e6348e3351 100644
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
index 000000000000..ae643575b067
--- /dev/null
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -0,0 +1,236 @@
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


