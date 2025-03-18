Return-Path: <linux-renesas-soc+bounces-14609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BF0A67E65
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 21:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4063B17B87D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 20:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439ED2144CD;
	Tue, 18 Mar 2025 20:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKUG50hP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6C2213E81;
	Tue, 18 Mar 2025 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742331478; cv=none; b=Ii5y0vEP7r/qOQL/FPsYP7AZcemhzKjeTCQ/0vvW7VIaC3MJG5UKTwd0kNbbYiSiQIkxkLtQ75GubgrlM/1nMKSh7UN/ePeYSF1ehmlNho6FZj04Nlr3dG/3eOn6nQfJtL0xj27NByUU/p1R5YHY4ldVeOr1iN9vzQnJTdE1Rts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742331478; c=relaxed/simple;
	bh=/ZzZVPTFxEf4L1cxrnhQomHyB3nsg72CEN1d/OvJQMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ULTlEnwGpP5Bx8XBa4ttOui6jHT7mO+2m3aRazoNbfM/jjG0a7SWII1eRSANG5BnrA+YaQn3A56F49dTSHfABzUB373CUSbH13QH9yNPl/5olD5lkuzc1JX1+j7EMSQD53wTCuQTg+aAT3hYZzl2cPDoZ7SrdHzgdE9X8ursDWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKUG50hP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso17926715e9.3;
        Tue, 18 Mar 2025 13:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742331474; x=1742936274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpoJIhKMPnnM9yksAMFgRv5MdInAsPZ0FiZCrfV1NNw=;
        b=IKUG50hPMhZP3iVz4+TwqeXPnPbqHN6rqx7Q1ulzKskpg9Vz8QE+it8M66OOojALKJ
         F8kFdWlOl6eQPyiI7mWLv7TqRuKpouBKSezTu/4F/zPJA0bRaMW/rTSh9MOeuzHB37OJ
         fypfpB2hJQXf+dpB4GUqYXlefkmLiHjkO9VZuKZL4X7X7WqIO1ASnL6X6zJw37p4jgcT
         ZeYUoNYmhQ7PM+XdMXQoBgeF+Lmv4dw0lqQmEsJUz+WM0JqpIdVGCwh29jVojnfHCPcy
         6L2TqEckePKS5URZ0SQViCIarWdR1IgCf6u0J+tFTQUIOcJeixEHHRlyTyfyft14Pkw7
         QL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742331474; x=1742936274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpoJIhKMPnnM9yksAMFgRv5MdInAsPZ0FiZCrfV1NNw=;
        b=HRym0nU+VIq0d8CLL1jpmCisa6vqep/bwQ0dL+Z777SCuaeSbe47SCglXjyP4ZqgPy
         Ldd9tTWvb7hVNBuPuzTcoAdb/JgK7G9yFObnkUMtEsueCJ4/SOISxKp4+Ajs413Cy4oP
         nnjB5l2Y/EJwT1uUDgij3YvX3yw1nDmRDZ9zxO0V0FM4stkPgr36jPtqlohGrAa63pPP
         GXwnuxCQ+VNMnypf4rtm2/zVIjeTtEPqgVLJ64LmOD6NzGqIMvfbAWv2IQSEbqTWyR7B
         8p5DQqueKEMWR29vZPeIiVlbDvtbXd5YNbQkixeOKXYhi+gGqR66p9UHb0QiYMNqJV+K
         VVzA==
X-Forwarded-Encrypted: i=1; AJvYcCUGuTn/Jq4Mgd4/D/caWa3mqCp128j1CXNKD1Gh3HtZH+ysjD21eh7TKk3lfqCRDalbHn40fR/fo5u14SvCrC7mY8o=@vger.kernel.org, AJvYcCV69IXRYfO8/FiHnLqKyVXx9psQ2c++A7mviy/9drKVRqjWs5vgoXpApijlymWEyAdCpMPcF+2E3soUMCk=@vger.kernel.org, AJvYcCWUIMUIfeiJtl/O6ELS6MOQqPYUrRc6WulYf6Uzs/8dH1gwciYVWWnQ+z9IwANTqtKVfZ7VLAKZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe7i9Hv1nc3cpiZxRD9xyCQ/J/Oa61+0zb3zXcNDEiZ1NiWEen
	QOiNnqO/F2/faUqnBv5XgR7q9Bn+1p/k0yhGfAbKwE8cM0DgSrgU
X-Gm-Gg: ASbGncvcpqKwp1RoStaC1iZm6sExurtvwBY7igdj/Hi+3nExzezyp6mAnfj32q0yCH6
	NlL29hjDFZ+zsiY3UtmszcZIsYotUKORTKbB8RNDZIJQ2i4EjhWrRoFiqBbviJRgwk7U0hSJ0lm
	hGdNE7C3WrNknZHWoI8BBHedPb0yQMYmiNElJL5bxzYp2kXA0tS0HQCkgPruJgOKYbN2y5tlY/X
	HK1f9mRhX0tPzfHcAhGBCAoWtUlO1QtBXi0hrpRAEi8J6PZqeasxEjzSlQVymuQjk7bk8bnVF4l
	o2TkMh0agmYPoVaKGUrDOsakZnQrmMVqRfXlE8Thq8OOi8m1w3vFA5ObrI7ESh9MOEQCaSkWJYC
	DswqP
X-Google-Smtp-Source: AGHT+IFQBVuKDQ5gUzwfhz+BtiK96m2NzR/BDMphjisz10gvNtP+w7/6t5edGmm0J4kKTd0rzBmf2Q==
X-Received: by 2002:a5d:5886:0:b0:391:3915:cfea with SMTP id ffacd0b85a97d-39973af6db5mr222148f8f.38.1742331473992;
        Tue, 18 Mar 2025 13:57:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9ebf:9797:69d8:2d33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df3537sm19212864f8f.8.2025.03.18.13.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 13:57:53 -0700 (PDT)
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
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Date: Tue, 18 Mar 2025 20:57:34 +0000
Message-ID: <20250318205735.122590-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250318205735.122590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250318205735.122590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4
- Maintained reverse christmas tree order in renesas_gbeth_clks_config
- Returned err in case of success in renesas_gbeth_probe()

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
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 165 ++++++++++++++++++
 3 files changed, 177 insertions(+)
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
index 000000000000..a0f7cacea810
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -0,0 +1,165 @@
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
+	struct plat_stmmacenet_data *plat_dat;
+	struct renesas_gbeth *gbeth = priv;
+	int ret;
+
+	plat_dat = gbeth->plat_dat;
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
+	if (err)
+		renesas_gbeth_clks_config(gbeth, false);
+
+	return err;
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


