Return-Path: <linux-renesas-soc+bounces-14301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2141FA5D27A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 23:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D84E3B8BBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 22:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE671266186;
	Tue, 11 Mar 2025 22:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvUL0clV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAAF26563F;
	Tue, 11 Mar 2025 22:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741731474; cv=none; b=p2k0ihEzPuJKAGRpHSTNkSQC59XcmmfzTw1XtsmYKd2WVjekKCCB+jgQCZknCUDzomkkVtE0d6sOkbxDZXcl//1crXJCf61UA48Zy2wFaPKDd0f1w1vDvSYTRI70STKW0sOYfcsXq4KVZNHeY/9js90XTfcKf+vIKALuYPmNobI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741731474; c=relaxed/simple;
	bh=ijsntb4LOi+5NUnt7C/JgeGR/NdZMS/xVpQhimHP3es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYWMLJ7H5Z8VD+ffeFkGyB4kRKmHIz8uXrGVy1vhlKUkGnA2WQTAb1Z5V35/dzg4XzQofwe3+VEhquIvjyvZcO2fZ8gvZqLKrajqlNUG7tSsAqYnNJhFOrLf6gFVQTUHtsUaNE9e4aRcays0HRIMQ9R8VoZNRK/+B1QpOcR+NP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvUL0clV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf848528aso23831615e9.2;
        Tue, 11 Mar 2025 15:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741731471; x=1742336271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8vcyr9TfojxaYrLbC0mKXHL6Mna3sstIQLyMxh6EXA=;
        b=OvUL0clV9d9T6SNHiUzinupVCe1wlpieIOq2Yx/HYIVY3Pn+1n9VoZdQOJSEVFGbaG
         BfUbXcjUlcYmAeDCl7Y03uZUdLhQ5nmnxo/e9X4sQ0U83RWEKT4WkJtlaTTpNl2G7MPY
         H4l5rC5miKuie101wgg1cNZOfs1AI7Ygb1htXX8Qsecwyr34aG/yGvbp2rYRdBfjlYpI
         Tnj2p+ZI2kmYL9SJaWJhcwiVcqyjNJYlHVxCynPel2s4CsQkipBI2dfeacVnOupvW/Yd
         tELetZAOXfmB8FF4Hq+EtyxGPvbNDm4itjRpxbX8RZvbhduDCYEaJseqI7L5Lo4RYQWl
         9KTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741731471; x=1742336271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8vcyr9TfojxaYrLbC0mKXHL6Mna3sstIQLyMxh6EXA=;
        b=bNX3UxJgm2Q7Xjqh6wK5wJBMRo75Kawy7ue3R3hkoxmCT1fkucOO2M+OFtV8fvv9M+
         g78ihMAI9Je1Mj6jtjDGCVdNQ3s4fZH0fxWUPsI7PGLSLaZJqONr5W+eLvv7aQl2nvtX
         6QrRrVP/nYMXwD9p2zB6eUyMJ+jqtagj/S/E+eE/f4SJ3+QQ/CIXOxSiWDXA5T1+/DoM
         TEiahJ5YL0+z6TWHw/C5J0GRj5CFCuVXldjiHb5+01L4s2L7sX7REdhfUOGw78oewjAz
         3BMQOYp/K48R7yLJgejG97jyR5seBW34Z3Gm8N+25FtHO/Iz7EitBDZAq2SoxrWHNSg2
         Bpmg==
X-Forwarded-Encrypted: i=1; AJvYcCUOhkzYhNc04vH5Y4HisdXnxv7di+lHfFx1aX1F+N03s1m7NFqgXH2JrKfUEFkLlKcbZYqZK6oFhZssPWwA2fZEugA=@vger.kernel.org, AJvYcCVtS7OBkjiX3mpqwfAFrdnA5L13Acb8s0LmtD8kyPm+F1ALrvf6aFMDSJAVS5DBggzPA/8d8vGj7LUj@vger.kernel.org, AJvYcCWev4wwGvFHJn4fMdTzYhjbuCgD2BkcMqRkN7mHYEu5Tx8oOd2XEZVSMnOI+z98/s2Vo4xm9p/f9p2XbyuL@vger.kernel.org
X-Gm-Message-State: AOJu0YzAu6mjcynfuJLOuocLySikDfqJwbDCBFjmntoPc/LJNS6Rjr5L
	a9o0We8D1xdMj2gZvroqjmoKGcvFimdtY19OSJaJErx2m5J5eAbS
X-Gm-Gg: ASbGncuNfC+UfEmY13r0G4PhntH5OdTpLy7sSS+FPkvMPvQbeKg4LssKXStjsreb7hR
	8vI2su3aRIeEZABdoNfWBg1itC5UTE3MwuyxUfSNCj/m6UZEMiG0uE7FozmS4/BzUiI6lnOWpwc
	+OVokpVy/AX7h3bJtTQIGfr6UJo4fQ2hbBzlJH5bBosnstYNewONJh06V8zYoqqbSYreDW/k9BP
	iLmjhZ3D1Ki76rgHwVIGLciG5VDY7SRoWTk1pNHPZbUHOVHqvxEn4uTT83x4Vp9Kauv4xeVzUiL
	n4nKGemkDeO/+J7QzC/U3jNivDQhcoQB0BLYjwNkEOzS4K/Ze0aAwYtLwo99FwOow/eU/2Ao
X-Google-Smtp-Source: AGHT+IFL9v47ApLmQFGG6faV0/iikh5x9sy0+lzUWK1Rr0pkPfRBQmxOn1EYQv8MqkeLXF5PzPBsLA==
X-Received: by 2002:a05:600c:198e:b0:43b:ce08:c382 with SMTP id 5b1f17b1804b1-43d01be6dfbmr73608475e9.16.1741731470778;
        Tue, 11 Mar 2025 15:17:50 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:a6ad:9216:2ab5:120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfcfbsm18782252f8f.28.2025.03.11.15.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 15:17:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Date: Tue, 11 Mar 2025 22:17:30 +0000
Message-ID: <20250311221730.40720-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311221730.40720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250311221730.40720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P)
SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Handle clks from plat_dat
- Replaced STMMAC_FLAG_EN_TX_LPI_CLOCKGATING flag with
  STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP.

v1->v2
- Dropped __initconst for renesas_gbeth_clks array
- Added clks_config callback
- Dropped STMMAC_FLAG_RX_CLK_RUNS_IN_LPI flag as this needs
  investigation.
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 166 ++++++++++++++++++
 3 files changed, 178 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 3c820ef56775..2c99b23f0faa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
 	  This selects the Qualcomm ETHQOS glue layer support for the
 	  stmmac device driver.
 
+config DWMAC_RENESAS_GBETH
+	tristate "Renesas RZ/V2H(P) GBETH support"
+	default ARCH_RENESAS
+	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
+	help
+	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
+	  RZ/V2H(P) SoCs.
+
+	  This selects the Renesas RZ/V2H(P) Soc specific glue layer support
+	  for the stmmac device driver.
+
 config DWMAC_ROCKCHIP
 	tristate "Rockchip dwmac support"
 	default ARCH_ROCKCHIP
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 594883fb4164..91050215511b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
+obj-$(CONFIG_DWMAC_RENESAS_GBETH) += dwmac-renesas-gbeth.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
new file mode 100644
index 000000000000..c5710e59323e
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
+ *
+ * The Rx and Tx clocks are supplied as follows for the GBETH IP.
+ *
+ *                         Rx / Tx
+ *   -------+------------- on / off -------
+ *          |
+ *          |            Rx-180 / Tx-180
+ *          +---- not ---- on / off -------
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include "dwmac4.h"
+#include "stmmac_platform.h"
+
+struct renesas_gbeth {
+	struct plat_stmmacenet_data *plat_dat;
+	struct reset_control *rstc;
+	struct device *dev;
+	void __iomem *regs;
+};
+
+static const char *const renesas_gbeth_clks[] = {
+	"tx", "tx-180", "rx", "rx-180",
+};
+
+static struct clk *renesas_gbeth_find_clk(struct plat_stmmacenet_data *plat_dat,
+					  const char *name)
+{
+	for (unsigned int i = 0; i < plat_dat->num_clks; i++)
+		if (!strcmp(plat_dat->clks[i].id, name))
+			return plat_dat->clks[i].clk;
+
+	return NULL;
+}
+
+static int renesas_gbeth_clks_config(void *priv, bool enabled)
+{
+	struct renesas_gbeth *gbeth = priv;
+	struct plat_stmmacenet_data *plat_dat = gbeth->plat_dat;
+	int ret;
+
+	if (enabled) {
+		ret = reset_control_deassert(gbeth->rstc);
+		if (ret) {
+			dev_err(gbeth->dev, "Reset deassert failed\n");
+			return ret;
+		}
+
+		ret = clk_bulk_prepare_enable(plat_dat->num_clks, plat_dat->clks);
+		if (ret)
+			reset_control_assert(gbeth->rstc);
+	} else {
+		clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
+		ret = reset_control_assert(gbeth->rstc);
+		if (ret)
+			dev_err(gbeth->dev, "Reset assert failed\n");
+	}
+
+	return ret;
+}
+
+static int renesas_gbeth_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	struct renesas_gbeth *gbeth;
+	unsigned int i;
+	int err;
+
+	err = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "failed to get resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "dt configuration failed\n");
+
+	gbeth = devm_kzalloc(dev, sizeof(*gbeth), GFP_KERNEL);
+	if (!gbeth)
+		return -ENOMEM;
+
+	plat_dat->num_clks = ARRAY_SIZE(renesas_gbeth_clks);
+	plat_dat->clks = devm_kcalloc(dev, plat_dat->num_clks,
+				      sizeof(*plat_dat->clks), GFP_KERNEL);
+	if (!plat_dat->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < plat_dat->num_clks; i++)
+		plat_dat->clks[i].id = renesas_gbeth_clks[i];
+
+	err = devm_clk_bulk_get(dev, plat_dat->num_clks, plat_dat->clks);
+	if (err < 0)
+		return err;
+
+	plat_dat->clk_tx_i = renesas_gbeth_find_clk(plat_dat, "tx");
+	if (!plat_dat->clk_tx_i)
+		return dev_err_probe(dev, -EINVAL,
+				     "error finding tx clock\n");
+
+	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(gbeth->rstc))
+		return PTR_ERR(gbeth->rstc);
+
+	gbeth->dev = dev;
+	gbeth->regs = stmmac_res.addr;
+	gbeth->plat_dat = plat_dat;
+	plat_dat->bsp_priv = gbeth;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	plat_dat->clks_config = renesas_gbeth_clks_config;
+	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
+			   STMMAC_FLAG_SPH_DISABLE;
+
+	err = renesas_gbeth_clks_config(gbeth, true);
+	if (err)
+		return err;
+
+	err = stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+	if (err) {
+		renesas_gbeth_clks_config(gbeth, false);
+		return err;
+	}
+
+	return 0;
+}
+
+static void renesas_gbeth_remove(struct platform_device *pdev)
+{
+	stmmac_dvr_remove(&pdev->dev);
+
+	renesas_gbeth_clks_config(get_stmmac_bsp_priv(&pdev->dev), false);
+}
+
+static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,rzv2h-gbeth", },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, renesas_gbeth_match);
+
+static struct platform_driver renesas_gbeth_driver = {
+	.probe  = renesas_gbeth_probe,
+	.remove = renesas_gbeth_remove,
+	.driver = {
+		.name		= "renesas-gbeth",
+		.pm		= &stmmac_pltfr_pm_ops,
+		.of_match_table	= renesas_gbeth_match,
+	},
+};
+module_platform_driver(renesas_gbeth_driver);
+
+MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas GBETH DWMAC Specific Glue layer");
+MODULE_LICENSE("GPL");
-- 
2.43.0


