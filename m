Return-Path: <linux-renesas-soc+bounces-16106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E56A916B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 10:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB56F7AB497
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 08:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726E0229B15;
	Thu, 17 Apr 2025 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/FfWWXV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A86F226D09;
	Thu, 17 Apr 2025 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879325; cv=none; b=SyDN+Fc6lSSZPcAJoGUe9WrPjPf890THYbBGLbBKCweGg1B76YfFN9mHSgklKetS+O1KKuDluX5hiCUZyjsVJO66FGo58QSau6DDqZRWo9Ew7GlN9pzMofsekRmw4mmho7z8IZhm65TvyS6S2xqXTsVXmkLHbQ0dM+Zmp3fsvNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879325; c=relaxed/simple;
	bh=6caOs6U87G0VQ2nA9ev7vB/5SnkwSf+VqKNRgLsq2Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EvkYKvwu6+GTa5RecS3+EWcWJ8I6y/+E0X+9dkKUwN6e4sF5p6wVTOdsVewnbBwMTBqWN5F50m4YIEn0tFY21RHiQKQg44+/ZVQchqvHJfiRQOEdOwbdjQXsvD3QGogDowGGxRgdUPQGc3PlmjzoY4ZAlsTtFMTkYduKcuOyD2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/FfWWXV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so4870745e9.3;
        Thu, 17 Apr 2025 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744879322; x=1745484122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3UVmLbw05nY1bIJLdntt1cb4T+VHhtyOYBFetAFNM8=;
        b=F/FfWWXVB1PHI9r9tEZ9qo02PsxzYE36eco8uAGM6/NHfztdoXXQRhHc4Z4SN5Ug1V
         hnfmZIWtWH2/39sx0XwgxJdZ7CJBt3xynAUBXUyuRkClSw47XptkStnwYSH++7YCRFXC
         xtyhxbHGHS0TSoMV8iMHDljXJ0qdgiqhu+XNTBDBaeLs0W0QpsE2GjrSqVnRX6wZJLdB
         sBAtR2WAGP3ffhLPqXNyAo70T5SxWVEVgGKIMuY+YR6+wMQNDw5P74kV21HqHOLulCby
         E47O0qKM/eDCu+rvtCF8VqMATjWW2aSl/EaynljfWlBi/qmPYqHpwMavaugGIwOMFQgI
         g3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879322; x=1745484122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3UVmLbw05nY1bIJLdntt1cb4T+VHhtyOYBFetAFNM8=;
        b=RJT0WIowZiZHPVQ1wdeanmBhR+ha/9FFDnhSm7ImbTbRxwej3x/3bG5uTqLDPs3NmE
         MV7WsdJTl+gIQGf/sjdHDne12vZBesjFEKh8SdY7ySf92sEidwic8u8OP8GK3MGlBTwd
         /mWmup2/gdVodgZx9/PLhTZPS+f0tTGVD9sC8hZeSLsJSF1dAyy3z2Rx2P3dL55wGIBX
         fhXis5dIjy1t0GQgIr47MHZWlcRGNY+qTC/oV4vVD20VGme89dDlG8UQuY+o/Hbdl2WU
         imv7j81h1ynEPE1edjPbPECX8abGvD5rs92Qlxlum47h+iTCaoKXwM4lY3akzsZuwEQ9
         tGRA==
X-Forwarded-Encrypted: i=1; AJvYcCUudgW1VT96iIJc8WMyA0L90OCo5X/OW+jUNlt4v5WIsTQ3ZbO4V3QWHQbchsd0ISo2CAz1YZFkX1t3hmvWYPgPqBM=@vger.kernel.org, AJvYcCVN9sK6kzwidRh4ftDTxBP6YNHcx662wYJbxA4j14qlUppeRHJ9k54PI0GVBEmE1c8nv1MEYJJmtf5o@vger.kernel.org, AJvYcCX6jMz14vkRX8uFN2OP2DYitOWPEws29Cv55qZaGV18rfvdua4VHQE3nHXIM98yR17cLc8nLHkjc+ZdHyY6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz4s4SSgYALufzOzMdd9FWfEwzzOSWfo6v/xYivxFGfMRLyDlF
	QFAUuZ2sUXZnrWpW521wQKJWyterhZKpsPAibUolbq16JNli0ZIs
X-Gm-Gg: ASbGncucb4KVCEFGXjBaylQqHStGVmPjUtTKqQf/QHAElH+zqmSO6EpBX5ucfcIS55D
	1Mvo7ofUFo9q9bn9gNkwdTN/RqHOCZgZkx37NAe2/3gpECOIxA6YqgXmv/1romvnskiCF6bKyhx
	nUcKwO+sfS1nKUMIETg2ax7P39m7ryk6FsitsybZJZ9Sj4W4O0fmJ+R0HeCNngxG5UasEOuJE7K
	K71RltL0ncNo14o01iLGL9hXhaCAvaFbyc/uRG740dp5aUqjHW8omZ5DOuBmTTg28QabGA8tG0n
	frJOEUOHkDB3UeFSizmoR3yXXcxNqTD1CrqmRk+cXC2hYN5S1TnfMGfwUWWppP1KRsMbBUeG3KI
	=
X-Google-Smtp-Source: AGHT+IEKs+6jhZ985uIK+btCMwuIhDugVlaE5upqmp/6lm+E6MjhS8dGU3Cbrgnk209p7sVuYILBsg==
X-Received: by 2002:a05:600c:a110:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-4406815ee8cmr323245e9.21.1744879321536;
        Thu, 17 Apr 2025 01:42:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f0f:d684:f4a:34e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96cf1asm19657712f8f.39.2025.04.17.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:42:00 -0700 (PDT)
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v8 3/4] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Date: Thu, 17 Apr 2025 09:40:14 +0100
Message-ID: <20250417084015.74154-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 146 ++++++++++++++++++
 3 files changed, 158 insertions(+)
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
index 000000000000..9a774046455b
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -0,0 +1,146 @@
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
+#include "stmmac_platform.h"
+
+struct renesas_gbeth {
+	struct plat_stmmacenet_data *plat_dat;
+	struct reset_control *rstc;
+	struct device *dev;
+};
+
+static const char *const renesas_gbeth_clks[] = {
+	"tx", "tx-180", "rx", "rx-180",
+};
+
+static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct renesas_gbeth *gbeth = priv;
+	int ret;
+
+	plat_dat = gbeth->plat_dat;
+
+	ret = reset_control_deassert(gbeth->rstc);
+	if (ret) {
+		dev_err(gbeth->dev, "Reset deassert failed\n");
+		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(plat_dat->num_clks,
+				      plat_dat->clks);
+	if (ret)
+		reset_control_assert(gbeth->rstc);
+
+	return ret;
+}
+
+static void renesas_gbeth_exit(struct platform_device *pdev, void *priv)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct renesas_gbeth *gbeth = priv;
+	int ret;
+
+	plat_dat = gbeth->plat_dat;
+
+	clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
+
+	ret = reset_control_assert(gbeth->rstc);
+	if (ret)
+		dev_err(gbeth->dev, "Reset assert failed\n");
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
+	plat_dat->clk_tx_i = stmmac_pltfr_find_clk(plat_dat, "tx");
+	if (!plat_dat->clk_tx_i)
+		return dev_err_probe(dev, -EINVAL,
+				     "error finding tx clock\n");
+
+	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(gbeth->rstc))
+		return PTR_ERR(gbeth->rstc);
+
+	gbeth->dev = dev;
+	gbeth->plat_dat = plat_dat;
+	plat_dat->bsp_priv = gbeth;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	plat_dat->init = renesas_gbeth_init;
+	plat_dat->exit = renesas_gbeth_exit;
+	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
+			   STMMAC_FLAG_SPH_DISABLE;
+
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
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
+	.driver = {
+		.name		= "renesas-gbeth",
+		.of_match_table	= renesas_gbeth_match,
+	},
+};
+module_platform_driver(renesas_gbeth_driver);
+
+MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas GBETH DWMAC Specific Glue layer");
+MODULE_LICENSE("GPL");
-- 
2.49.0


