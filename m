Return-Path: <linux-renesas-soc+bounces-14172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D63A57E01
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 21:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B150916E2AC
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 20:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48C7213E63;
	Sat,  8 Mar 2025 20:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYx76Gmt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF51621322B;
	Sat,  8 Mar 2025 20:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741464595; cv=none; b=NY1qGZtYlYyyfFFDZPZJtUxTgyV9VRvq6T9jDSt6dFb89jIL0RIhSsHEWSe86M2MgK5AC16keltRVtagheeKl1H/Pig7gTJs+usAdaIDN5Eok2FNIeHSYVChoH2M/zhcQ2yj5Yj4VmdZWgX7lO2kX2wLFfAMk0CDZdb0wzsiWis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741464595; c=relaxed/simple;
	bh=zSLd6XCSgFh/OsKaiKGBLgRTJgassQAoGmOnER5bFOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nk+9ug3hiI01Bs3HytjF1K+F52pkdYUkIm6vouQ4jRT+dayWUzgLgdLO0TXJqiGTiFNT41uuZFgncxxZVr2MDrB1eLRHAyFmAV62tSUBP7TkuWwAhFhH7cto0PG5u4av8XRgeS8Te0gQ3LYJF0U/87jexQBEe3mJMcK17xReJd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYx76Gmt; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5e7fd051bso2253375a12.0;
        Sat, 08 Mar 2025 12:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741464591; x=1742069391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7/ejLllOzNbbbunOjthLJ/ntWWASC455I+PdIfIYD8=;
        b=RYx76GmtwwJ8QDwE9ec0uNIIFF0q/6wdb5NkWqDlslOXQDSVPyGJ4GwGxQOhLiottn
         qMXVm2AueZGYH3BxZeAc0nwhVnt2Dk0AxS163DBZZCb3RUjEF925il/4Z3LVzIQoVrJ8
         BNVGIuhrtNwHGCZNPGufRp244KX8cOfziA5Og24+KpOIOmxrOtxDbje97EI44EAnyndC
         gv17F/cRqemPZXj9N1GlsqifJ2Q55Cyc2WU7QwJ3x0TK3He8u21BDFxNci7jeyahrC2O
         XJ4f0EA86bD7jAOVyWt1JEUEuUfTXzPhZ+iPJxZay9IRcy4UVWKvq/ZuuKZv3nkcvRF5
         aZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741464591; x=1742069391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7/ejLllOzNbbbunOjthLJ/ntWWASC455I+PdIfIYD8=;
        b=G6m529QQkK25vG1UwY/udNxZiYFg8pdn/bTeZFmsCKJ/Pcu5AZ6m0GtZl7y0dtGTj7
         yZH6MMTN3jbEFAiZdCZrXZZkYclz5eZ9DOuEOwmQSQLJQ0o4ahtGFzMHsfMBGe+Sw2VB
         LojfqfZPC9tLlF0yqjewcQifwbH0KUh/dorC8umwM18b0ebzxSak6GsiHGUzt//4UbKs
         FZ+Ue02SZsbUByzIMHAwZJeVF9muixqiX3QF7sF7oPZrW35FJ8fOocRSBL76MOVqlv9p
         6A5KQ52/LX91bloiVZXN4XrW7ii5SzGQwHF2HtqrFBK9oiLgpAdLPVvQt4fKoaHUqB4P
         L/Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUB7R605limmlo/Dg4iXWvSehlgdxLWG/sepNFtIAqSnp76gehFWh6MjdF5Q618CI9hmQaLyiZb7uQfsLaFFtwQQEk=@vger.kernel.org, AJvYcCX4Tq7PcSSeVkUJB+wgRSkUoYn96jz1Dpm5IeHq3Ac2EO33JJlQ232xnIjDBFidCA0AR9vuNhYWds9IFSVZ@vger.kernel.org, AJvYcCXwNdJjtM3dsJtup8zZ860AOdH6TQc9yIEvSAPzHLJljm9UrdLsLRjAODFak9GWkUZtiGxMuiUHWk+y@vger.kernel.org
X-Gm-Message-State: AOJu0YxuGclLOsA1Ie8TTpeQI8r3vvuTw8GuGEhsCt28MPIv7y5paNtN
	0qXiKw7FCMZ/FWLjlzQ3umyQP9MJcJTHhJILmTiP6F9gb/ZJmpY5
X-Gm-Gg: ASbGncuxGzyFAwGAcO0mx5LITVaBZ/zUp/63/K2lPxZLjILDnrd0LQivVt46EwuIgtK
	fbZMRCiY9hKvfZyTQ5CgfVcONMFkyVZmBlSiUzcnqwaDyLtzXo3Gfxqh9vhdKVrm8sNzacYGLZ6
	+BR/5alAD0krWrVW6O5tetJVvLP3eCOI8ARvZ1ckEXe3yzTRRWKwHOyRMRmoYIzae3FcyWUOYaq
	cvmjdp/CcD4mB8GAW7HIOzqblGIh2XjDRdmHe/BrscqENioruq2+vdG3QNfq30vfJWynuq7rHOr
	RsvEeh10grWMH4mPlWnTX0BHf61DSCoMS/VcPKCEvOXOOn8R6OW3Y0eMyTAHhCs19fgI1owZ9g=
	=
X-Google-Smtp-Source: AGHT+IHXBcUcFUdg/3NVcwziDvz5jA522KxUEkbhYdbv2qSTswixHVKllrlR8ONE915lVwYKpK76GQ==
X-Received: by 2002:a17:907:7145:b0:abf:fb78:673a with SMTP id a640c23a62f3a-ac2526f0c69mr785369366b.29.1741464590637;
        Sat, 08 Mar 2025 12:09:50 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:238d:d8a2:7f2b:419e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac254346ce8sm340766466b.177.2025.03.08.12.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 12:09:50 -0800 (PST)
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
Subject: [PATCH net-next v2 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Date: Sat,  8 Mar 2025 20:09:21 +0000
Message-ID: <20250308200921.1089980-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 000000000000..7527387f30a0
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
+	struct device *dev;
+	void __iomem *regs;
+	unsigned int num_clks;
+	struct clk *clk_tx_i;
+	struct clk_bulk_data *clks;
+	struct reset_control *rstc;
+};
+
+static const char *const renesas_gbeth_clks[] = {
+	"rx", "rx-180", "tx-180",
+};
+
+static int renesas_gbeth_clks_config(void *priv, bool enabled)
+{
+	struct renesas_gbeth *gbeth = priv;
+	int ret;
+
+	if (enabled) {
+		ret = reset_control_deassert(gbeth->rstc);
+		if (ret) {
+			dev_err(gbeth->dev, "Reset deassert failed\n");
+			return ret;
+		}
+
+		ret = clk_prepare_enable(gbeth->clk_tx_i);
+		if (ret) {
+			dev_err(gbeth->dev, "Tx clock enable failed\n");
+			reset_control_assert(gbeth->rstc);
+			return ret;
+		}
+
+		ret = clk_bulk_prepare_enable(gbeth->num_clks, gbeth->clks);
+		if (ret)
+			clk_disable_unprepare(gbeth->clk_tx_i);
+	} else {
+		clk_bulk_disable_unprepare(gbeth->num_clks, gbeth->clks);
+		clk_disable_unprepare(gbeth->clk_tx_i);
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
+	plat_dat->clk_tx_i = devm_clk_get(dev, "tx");
+	if (IS_ERR(plat_dat->clk_tx_i))
+		return dev_err_probe(dev, PTR_ERR(plat_dat->clk_tx_i),
+				     "error getting tx clock\n");
+
+	gbeth->clk_tx_i = plat_dat->clk_tx_i;
+	gbeth->num_clks = ARRAY_SIZE(renesas_gbeth_clks);
+	gbeth->clks = devm_kcalloc(dev, gbeth->num_clks,
+				   sizeof(*gbeth->clks), GFP_KERNEL);
+	if (!gbeth->clks)
+		return -ENOMEM;
+
+	for (i = 0; i <  gbeth->num_clks; i++)
+		gbeth->clks[i].id = renesas_gbeth_clks[i];
+
+	err = devm_clk_bulk_get(dev, gbeth->num_clks, gbeth->clks);
+	if (err < 0)
+		return err;
+
+	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(gbeth->rstc))
+		return PTR_ERR(gbeth->rstc);
+
+	gbeth->dev = dev;
+	gbeth->regs = stmmac_res.addr;
+	plat_dat->bsp_priv = gbeth;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	plat_dat->clks_config = renesas_gbeth_clks_config;
+	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			   STMMAC_FLAG_EN_TX_LPI_CLOCKGATING |
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


