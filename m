Return-Path: <linux-renesas-soc+bounces-15442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FACDA7DD1A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 14:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5448F16DE01
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 12:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A25824EA8F;
	Mon,  7 Apr 2025 12:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NS3nrsPW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA7524A041;
	Mon,  7 Apr 2025 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027414; cv=none; b=EWplwRSjtpGOFoAv6vt5sE4zu7r6LZ9C0QIRbfpRNW2EXjFE6yG/0hTTFxFeweGv7zPfZKRj1HOA40hyzrCoR5wYPc/6ikX25ufF5Nr5NxEa4TDbjzf4hD7Snvwxds8kLTopK4b5llMTgMzy7XSIsrjlkU2GfMsGrbDr1YieGvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027414; c=relaxed/simple;
	bh=XDIKwYmYHGQ2b/el+QvziXPsq3LTw/P1t5tMGx3sEro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m37+BJV9S53K7T+wGO20PweyVvrjXPVkzodBVGOhemADLQMfsSi+f38qYAiX8Qst7IZ/voLQyhRX8Vrcuuc7A6epB6k/UCgh5Krdtckd18/AW/2aEekvcdK+ckwlPLWqNoROjgzX2ezJY/Nm1G9TX0ve9P9LSQ2lLGnng0XD0yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NS3nrsPW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso21812695e9.0;
        Mon, 07 Apr 2025 05:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744027410; x=1744632210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jlNLcnvNhGWozOP5TrJtnP4GKF2MIUGeUULPGVlJT8=;
        b=NS3nrsPW33/JEJLYTISARNPbtcLJMUOpLMl77pDPz9AOoSrOdBW2Vop25oLEd4NYbO
         T8N85PY+DHm24aBbwHfZGTsidGcXIKCZXkGa3WnoYj4qHVJfTphC2XAByRtL5UbTUvgK
         xnIbQloAooV/r/E9rnkrsbcsPBJo18Smg1aHcD5ci1uPdRRWlE1zXTIMq93e+SUNmdrJ
         W2JhMG0lLMI7xrs/bPxtUbUykxAqJ3uGghD0FOaD3iT5D88RjRn56SIqzi4+BV77C6O4
         BsbjDoJZ8mX6WQTjqsrCnaRdRJkS1cL7aNuHzy2mYWQsU5mIpUn0/95HqYTrytcFoVkv
         +pZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027410; x=1744632210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jlNLcnvNhGWozOP5TrJtnP4GKF2MIUGeUULPGVlJT8=;
        b=alFlWkiUvcN0cbdqIHO/62t9goC6gj04exVD0R4utqyFL4VZTyTRTgqOlEqzJ6x9b5
         pUVmDMD3EEmyikE/BQGosnU0fkB0bXhEsHPpll48aXssiNLqg9vdvlbqj3zdODS+/lhY
         gJhS0g7r+2lykGxGAaSLI04eBKc2xEe60MNPdQx2V4t40dToz0P9Q1ajFGdH6ah7Jkz8
         aUbxW3pfFzU45h6Bkqd+p00kCzpujzotAOuZS1Uyt/hfT9CimWBq2V4zqENIPB9FN3ja
         TUSrrqUEWB424hl2IBH3YWxFRbgIpPYcPJ+fuhJZf4z2+e1v+Fy2nr01UXCKPa6p1b86
         ucyw==
X-Forwarded-Encrypted: i=1; AJvYcCUtSRqsYHejpluG/lgbocsmONajRzb0PIGC24xRxKtiBMyTXhVndKDGcQ4aEAf0DONZAx8/hf6AUpqKFEKF@vger.kernel.org, AJvYcCV5JcHLOw/W/tQbd7gA3Ez27nUscjHDlU3mQj0RQOd9LovV5h/459l1tlW3ScZ8cf7pJv0jGl2M2tDZs9OIFkYZD8A=@vger.kernel.org, AJvYcCWxZA3PsjaPyPn5RfCu0d7/36O6TTX5EAXcqyX6TU8ukmQpGK1cBC9TA05IYX13ydM+QxSY8Zzxxq3p@vger.kernel.org
X-Gm-Message-State: AOJu0YyRwEafQ++GNTQE6U9RbJ4ryh5ftvAj/pHZVMai2qnT94TE+7tB
	9tXaBLDkqHF8WKG+kpsJ6hQJ4ocelGY52SPbNp81MRCQL6YyD0hS
X-Gm-Gg: ASbGnctzfsCoUxnk2aoq5kdckAke+rfdVhKL16stPlYw5JT9Lh0FS3Ms/m1NoKyxcgl
	z8UCmkZpS473QXjNpyhkWvphHUeC8iWIbnnPd+fyiRULIvlY+sYb2edzJFWrYcjwXMH9lSHgHEp
	Cv4Q+1af9I7wGTtnSpn7O8RyaLGTgdtkUsPjKX07gjeAodcVM9KB+LHcO6Kvfa1/TJyzY+OycSc
	Zp5d6h3Sg/qGzynye7HVX+KSOE1LccG3Mn5amczhEV4sLlfhqf7Sw5RMUC/Qbb0geBjek6fdwWm
	U84j8blBe3vsFF8FiofkP0+iFadn3ZMI7QOYUlqw4NiGgtJY7LT1i42FmtgsvntK6h0dzg==
X-Google-Smtp-Source: AGHT+IGjyUFck3wj/SREofHb8DcLu2Hm+aJoMFoZTMjKyCtTdhHd82E1VavPVf6TKGM9uUY5c0MBiw==
X-Received: by 2002:a05:600c:1e13:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-43ecf8d0b48mr110786015e9.19.1744027409649;
        Mon, 07 Apr 2025 05:03:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d943sm11986976f8f.74.2025.04.07.05.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:03:28 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Date: Mon,  7 Apr 2025 13:03:17 +0100
Message-ID: <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v4->v5
- No change

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
2.49.0


