Return-Path: <linux-renesas-soc+bounces-13865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B41A4B403
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 19:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08D437A4B1A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 18:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464281EE010;
	Sun,  2 Mar 2025 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jg2MVzJQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DC41EDA02;
	Sun,  2 Mar 2025 18:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740939517; cv=none; b=NpYXTVewt7ioZMeZps+IFiMpBkJFD78KZhIkw9hHt2vMXyBuoXdCdgdHF3QNIZW4uyG/KOwkB5pa3xXVl18lq/TwpAHn5u++3+kCvh415BRHh8EGfeD/7ZjqcF/KdtYxZkvG47QxzNYc2kXKe+WwPdFZR7HPcnM8SnyO7JWwnww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740939517; c=relaxed/simple;
	bh=nOKQ3T06ASD3n6RbNMNaNwyyDehvkI6u37JJBOeEPFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIAWL9yyNFJkQ2d0/5TEx6OsBdsW2VthRCFne9JSJ5pEpxy2DWcZC4jn8PdTVThErD2nU+yGkIP6xNhfPxGFjAGNY/KQAc2NC9vK1Wa+DNOshw1o/NzQmQTOYvTKvzaLUOCtAdqz+yVsQbhaQp/vld73l501ENCR1i6BxqO67vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jg2MVzJQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bc31227ecso337835e9.1;
        Sun, 02 Mar 2025 10:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740939513; x=1741544313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9v5Djznbvh5rEo/m4dpK/thS4HECpXn+zTnrZnqFH4=;
        b=jg2MVzJQ8mw79w4imVWG31b6H1u9uQFIGsMOsni6MDvjStM7LMgbIkZzefYa8GRnAy
         5TBU9XarqE39RqtXMpGHzKLNuIfv+MiK4Emk7z33NveItj57+98YWNOgDRsGoL/gl+mQ
         6WNWaLDxkfQnOT+kZc2Dn8frSRZoPYKHhVjYFGBvimzYm3aroCZT1kJ23dUtrZH0KQRm
         wXVfXGgiln3ZA3ZYFwLd7rh6Lip8yb3RWcFIrbp+RaKhFP/2E/HUuK+oAjToRlpyXZJc
         p9a+nQf5a8gtgDhgjpjwL3F15cQudnOqzG+wdfhkrq4MNbPWbyxxNiww8FabFGweW8mx
         fJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740939513; x=1741544313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9v5Djznbvh5rEo/m4dpK/thS4HECpXn+zTnrZnqFH4=;
        b=vX8XpPWYfFhhI8AB37Tdyx6r+nFDu86x97yMRq8Gw8KPVXiIgocAIgELYrG2akttSe
         dQrJKSuJvsk47N19SrAxHfajz1lOV9PWVszvjswkG6mWn6xASiZuIwfPCNRti47JKPu+
         SeA+zvd9vo6oE1x8XGQ9660N6qKaw6S1ijVwwSZ2twMXQG3Sgfg8B8q5SAXIF4Uokxtz
         t+N0G0QPwhGL9baCCCoIvTko7vL1Udr0rIbunmjKXPJSrxZUs7J5I2hJ1vz1YnthaT+S
         WB7jszSMm6DQjsZnCyMyZyI/cN6em76iVayI7Q+tAOb3NwGCurItqsvOVetDjlqK71r2
         G+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR24G1xSxnQPg4jFqbXK3uuIWhqTyW0hG1txia6e1Ofosoq1vmxrswpRilqhH8TyAq6NTtaw4N/3y1@vger.kernel.org, AJvYcCX/NKeWEZbQLB3qZGpbrc6vIuAtrZcHwKrbii+qJ/tV+AaopqMb/9coX9w228dFqTDOxpOubyIxYfy54W99MWiFQ9g=@vger.kernel.org, AJvYcCX86878pDY1EPNVwrBjoV8Opv2r/Y5EPksYoaoE9VQsFrrUESwgMuC32zBZkp7sigijEFCdzbCwZJVYTyDe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjv7beB+l67FAcFyIpcqK2PALPq5Qg2Qg5+VDyJ3N763WzSunU
	chR9h8V8ZWwJObV0Fdc+tvCfYOOhswbLW8M+r9Hy4484cXWLgeiz
X-Gm-Gg: ASbGncut/wyH49+q0e3RO5wQTi+p3OYarYRMi/YgkxNasHCyyGWHiILpZJmcinGrLW8
	Ok48j42r02ro9LvhpPiPGdjCgkmC4IpPGle16ZAY+XUIr+GDzrgjhyddIRy30r+3hLoI9/wwurz
	TaXtTe0I41zz1u7e1v6qSNMwrHw9HASV2go/rytK8x9UuxeRTsy/nVy4q/oTuvpgsrbqwCMXD6S
	DWT/9D4e9oVvnmYMiShXcnTUEu9STaRF79UTFCsbW1Vc4SMQ1ndD/cyBR5/GUxHEFyCGtkbAE6R
	Dm0gTDbYl5YLCoZ6ttTd6+Tu79OEbt1i8ZZE/MQDrjo0cKRtGrznA1M8xUg+VsMVga4IFG1d+Q=
	=
X-Google-Smtp-Source: AGHT+IFeLKzh/t8caXl5PXM7tYKFiHLD+x29jEZXNZzCtnPcMOOIPBKLd0dTlHk6ocpsFuBggJLKKA==
X-Received: by 2002:a05:600c:4f0d:b0:439:5766:7232 with SMTP id 5b1f17b1804b1-43ba674776amr74665865e9.21.1740939513346;
        Sun, 02 Mar 2025 10:18:33 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:989f:3a70:8430:2268])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc1b5db02sm9552655e9.19.2025.03.02.10.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 10:18:32 -0800 (PST)
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
Subject: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Date: Sun,  2 Mar 2025 18:18:08 +0000
Message-ID: <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Renesas RZ/V2H(P) SoC is equipped with Synopsys DesignWare Ethernet
Quality-of-Service IP block version 5.20. This commit adds DWMAC glue
layer for the Renesas GBETH found on the RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 118 ++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 4cc85a36a1ab..6e52a27f01b5 100644
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
index b26f0e79c2b3..91bf57fa3de4 100644
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
index 000000000000..f4488dc51b27
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
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
+	struct clk_bulk_data *clks;
+};
+
+static const char *const renesas_gbeth_clks[] __initconst = {
+	"rx", "rx-180", "tx-180",
+};
+
+static int renesas_gbeth_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	struct renesas_gbeth *gbeth;
+	struct reset_control *rstc;
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
+	plat_dat->clk_tx_i = devm_clk_get_enabled(dev, "tx");
+	if (IS_ERR(plat_dat->clk_tx_i))
+		return dev_err_probe(dev, PTR_ERR(plat_dat->clk_tx_i),
+				     "error getting tx clock\n");
+
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
+	err = clk_bulk_prepare_enable(gbeth->num_clks, gbeth->clks);
+	if (err)
+		return err;
+
+	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rstc))
+		return PTR_ERR(rstc);
+
+	gbeth->dev = dev;
+	gbeth->regs = stmmac_res.addr;
+	plat_dat->bsp_priv = gbeth;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			   STMMAC_FLAG_EN_TX_LPI_CLOCKGATING |
+			   STMMAC_FLAG_RX_CLK_RUNS_IN_LPI |
+			   STMMAC_FLAG_SPH_DISABLE;
+
+	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+}
+
+static void renesas_gbeth_remove(struct platform_device *pdev)
+{
+	struct renesas_gbeth *gbeth = get_stmmac_bsp_priv(&pdev->dev);
+
+	stmmac_dvr_remove(&pdev->dev);
+
+	clk_bulk_disable_unprepare(gbeth->num_clks, gbeth->clks);
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


