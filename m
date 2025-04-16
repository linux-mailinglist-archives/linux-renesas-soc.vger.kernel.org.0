Return-Path: <linux-renesas-soc+bounces-16058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF80A8B6F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 12:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E633A4456E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 10:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A9E2417D7;
	Wed, 16 Apr 2025 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OU0vRNfC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9710F23D2A5;
	Wed, 16 Apr 2025 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800031; cv=none; b=TNfhq93V4nM0bi3CCNxAiAfgu0pWO4QQ7bg/pQVcw8vtFV//vtIohhKQZc3sbQEZcJTwTXfZfjNgrW3wFsWZzUdfb7tDgLMrLTDTBHuidSPRE//pOHY2YO9KPByN1Iz9ajb47+h9Kwue7FKd6h0pYSR5w+HmzteHTfu0Xn5UvPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800031; c=relaxed/simple;
	bh=zXqFtKpyvstBvAJTePCNceBbLCIU2ZnBnr2A7aBGglw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2OxSRqzvzFekB+FRgRVC9eNwEvpMEiDWLBkIrrlH4UnrgqfPmvg2lwFk/vEYJu8o8ymkL4prT7G35A+pKFeVDl49cQDtXgC0qTcoeT3FtY4TJWdTfsEMvUQabRaRlnl33GzV3P/aK+NT5Fny3nXRNDAy+hTYJVwMyF8eez9qjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OU0vRNfC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so68524675e9.3;
        Wed, 16 Apr 2025 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744800028; x=1745404828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sSRptEAxDY3WWStbtus0C6jLgMOjLMObJPkck05Llw=;
        b=OU0vRNfCH05eTzA3GldgpqCpEk2KcdYIFq+QzamFDugmwrEAcHYIW37m6mSGPMMorP
         2h8hKJHAN16QjDcyVSk9HvZncnMP+kEUdXKS4HE765o5Jdq+rrUAQijqfbOnFJazBr5I
         KbHyZxQ0KdU1ECGV28kjDKNZNguPCR0jml26rjp/T52WjL27EtyUuVekCEbaottvOqMb
         qtNkx1W5E4bqO+FG13m97PSa7g3sMc/In1nIwCt3wEQUfivTzzMtzC+NjBLaTZvV+VDg
         kjY4czGmsFn5c0bqdzRzo5YgV4WpbPXwX9TU0+C+3zjpDs6+M2CAOODTTOKiLw4WPZ8q
         p3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800028; x=1745404828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sSRptEAxDY3WWStbtus0C6jLgMOjLMObJPkck05Llw=;
        b=Yt8Qb58yB2n+GoCX7VvXvyNT9++JCr03GxyZwJsIt+IeB13LNv2+2PSa3tiM1XmSCQ
         gf9zlFch6LQ4+rv96n5YuhvLCSLSYe9snuhMyVh5FccprbGRZfjcd1VdOgBPXEixM6/n
         nPAgXEhNCzPtam1smnzK2ht+7wEu0YGJ1B818HX5nEn5tbAKwc1IxsvPPHH2NAGGF89I
         9l68xh4D7eF/wfSaMwEeplraC0CxpWihNnr/GWC+groduZBIKfpc/o6+UrHG47xzoIWs
         5Ojs6kk42nc5acgm0QQN1i4fKCKmvIXzh4Qbhz7hUaJYCoLJAvSSJNpFpiIJvHfczyM9
         ritQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoh6Gtc90OEs8Ct8iXTuqJEhPUT/Jtid5i0w0ejqZ0SeKtx+9wBmzQ4MHh8dR+Ub4TjUiriuljpaKsuThJ@vger.kernel.org, AJvYcCWDfkXau02kl9mS2kPMO+ZIaoc17Ztx3mEb0DD28tgUFGodM7n1zZknL9/xAwnWFl8Fm6issPGPbwfVs76PXjdDVuk=@vger.kernel.org, AJvYcCWldVTyp9CG508oI0F+lJJoexyChxK+brpCnSf+0sA+D1mLIfxwm9DTXZC+e71xwzLUJ+yfLeTQMmf/@vger.kernel.org
X-Gm-Message-State: AOJu0YwhDYvnq4zvWyU31KEoOdaGzonVYw9Bg7g6xBOnp5uEGFeC+MBQ
	TH3WH4zstbM+fv2nrUSU0p2q+JcJJzZN3013t4+1x/iUFVsgTyWj
X-Gm-Gg: ASbGncvuoqjWjj5idpQm5nq4rWoBtUCapEyh0WhzX2oXV4WreZd7s6USlHu6oSA0AMt
	cF/pMDB5S97+M2QmYBLHuAYLbgzs4CPx/halIylvPhdxILRoMSngP2i729i37ZxmgCmeWAYhp+7
	uGLkEbfkV5rtnMrWufSgnd6gqhS4Mu+HTP1IusKCqPqvUnK+/XM0QwTysCZzl0QhooJcblkAFs0
	2gbHh1/vhygcEwjtefFgWmAlLBc9j7uukR2Iqsgi3Eg+DyTTgLfMfmERnYLGSfq14r2lHXRSF12
	t2aLDqEC48u/hEZfXZM9S2Kg3HnLIjZKzWmkVaMMK1dcPYzR3PHGP6+kbsvLVcOPL1+peQVmRGp
	+
X-Google-Smtp-Source: AGHT+IGEL3Pp3mbrj+nVUUZlaXJhgEY3QOvjhSWV1xB2P4G/JfTlrzfYZcUaGQqA3XZfYt4lD2UCXw==
X-Received: by 2002:a05:600c:1e12:b0:43c:e481:3353 with SMTP id 5b1f17b1804b1-4405d6276a5mr14269195e9.17.1744800027384;
        Wed, 16 Apr 2025 03:40:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b4a2:e121:10d6:ac54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964089sm16824975f8f.15.2025.04.16.03.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:40:26 -0700 (PDT)
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
Subject: [PATCH net-next v7 3/4] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Date: Wed, 16 Apr 2025 11:40:14 +0100
Message-ID: <20250416104015.47788-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 000000000000..f34bec7794e2
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
+	return 0;
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


