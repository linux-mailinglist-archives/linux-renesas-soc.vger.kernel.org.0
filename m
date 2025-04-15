Return-Path: <linux-renesas-soc+bounces-16004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8CAA89EC3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EB1E4436F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2890D29A3CC;
	Tue, 15 Apr 2025 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjGLSACL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA1F297A5D;
	Tue, 15 Apr 2025 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721816; cv=none; b=XIG6pNkqXh225vaZeAc2tnTj+qGEx7fAXlaKCp6pq/DwyWlqspI6OX5Y1kV0IV6sqGrV+9XHjeUtIdSaXdtk2rWuDJuNlorWe0+bzGcus4/MYrmuBVIIOMBFHMEgjjurZLmbfuD8BADHw0Hyq0rlmw0bR7gTH70GT4sW3oMqolQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721816; c=relaxed/simple;
	bh=aABG160iPkttRbzQvTne5eKaMCxjrJNVzk7fpnwaoco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A1Phv+ODZ5/GDngJVnA9kdjCqOLZssfXR5S1Ng6QZGirc9E5sdyg6yosktI6lXtrfe+nz+L8lSgM44yYFd9k/hwZ/FtIxJbHcuonbvkj8e3rE4JTNpE3MOav81fsctru572AsXns+A8mK0IG6hTeAH5hcElj97XoN/f+9bnW+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjGLSACL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso60168365e9.3;
        Tue, 15 Apr 2025 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744721812; x=1745326612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=os69xApG4J/eUJVtkfaP7Pm1DMV7TS+WoXn/btx4EnY=;
        b=NjGLSACLeCV1DZFViK4k73ULM+xbtI2K08PNIio4gbGhYwRnntbsRSsf2dBIJl3XP8
         qLRv4eKB0gddeTUwv8QfUf4WIHdzFvhUPW4eELu2nrAK16wL+epPu39hEf8NsXEfwWXF
         7LHONIKdW/KpLPn+Ib104NfEB4VAdpWJFrTfJghoyxaQdJ6v7eMbzz81hcuTBmEJtH4u
         43lIpah++1EZqhnhUsF9a/jCVAAmdlEi6rzAiTfEF33g0ue/e984NouyjLSNAOkSO0xx
         30AFn/OEyGZpIB69fDv9TVts1zIB0BC3HYIxqhTEdzRYfgWiujQxPEKZY/3C7/w2W11J
         12DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721812; x=1745326612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=os69xApG4J/eUJVtkfaP7Pm1DMV7TS+WoXn/btx4EnY=;
        b=uwCXdDJmU9W9ABiv6+Jar6IKfsJCOlaztUN+54EqS8TNh/Ql/AcxmOj5Hageyg7Cf5
         UxtDs+9Vo0jcbr+gXhnBHqVgvTLq0ffW0nwXjy8kMwwduMXhrlYucLCAUQACvMmQp4p4
         ov/dtWaa/nSM+z+gR5q2HFMhtbKjV7+kSXVpJOh0mIWwlmV4YnQc6NePs2aKgWDoJOLd
         SZFNTlXkn4y+3FdVeVgxpdF8wvHBf7zpSsDfsCpGMqbNqD9BrpZ49ddguh1QbRkaNOYK
         0UMNFCkBqqsy/1s4crApHZ9WL2gonz6uMEV9oSmdfgugn5PuzJnSnQjGOSa93Bc5aZVE
         7MRA==
X-Forwarded-Encrypted: i=1; AJvYcCVoEhcOxwzc6GxgAm5/cWeeeSnSRBHBZXvSOZvrP1L9F5zMpIFnf0aoIVyVun01UxPaiPZmLuSgTs2oGrqjtK6YUkA=@vger.kernel.org, AJvYcCX0Xb4Bu96mt63SVimK1wmn+BWKx7kyJ93fG/Os/HjzdsJFB1rilmuuHPfDSMmFzw/qnE9H6yRbDD6x@vger.kernel.org, AJvYcCXO/w71vKhtGZSk+GsAeqHM3QQkohQF5Er9RR/IGpXv4ZonFdThFq6csbCnow5tCRrtP+RplzLUwgNrJodg@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJClt/jgcTTWUa8/MK2e7KlEtXgmEiyReWOZs2y0Wkqmfy2y1
	gsd+fIKTkhHaaoj2UDsVH2XDwYjUBhv9ZVasiZpUcAu1phsg0rma
X-Gm-Gg: ASbGncsBEug2oVIekax0h03P9gNvEfHoUftNfYhS91q/vylLhqMeATKCDdWFG46j6GY
	wH7LW9PXRcBBdI3Pc8COhbAzfumMGtwOrxP/zwO6tTVQooCw5GvXhLFnjIhhhXZwYkIlVcSV9V3
	WElKNqd66hfUxcO0IuSRmoNeXLWgcxOuaxFKHdlBLyz74wQnBFiGJJwPL3t5IPQttUtNjoIkHJo
	iaCERyKwvyMgZF+xdh81hg2t2LwS9VLaDkCVn7xd+ESZnD9fmVOpJLcwu0YWPERdt++XHu52nLi
	2Itf02jcos5F2PQSyKU0zjuu98+S/6Zu114d6A7bUqlEEIF8TXT+lCGwYVbqYtPz
X-Google-Smtp-Source: AGHT+IHM99iCt9uGoM1ut7bwj22u5iPsrbMzCmzAjPLvhvpnLXPGkQlOQNK8dR5lm5kw+uFojdnLkg==
X-Received: by 2002:a05:600c:674a:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43f4da84f37mr86587135e9.14.1744721812206;
        Tue, 15 Apr 2025 05:56:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:56:51 -0700 (PDT)
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
Subject: [PATCH net-next v6 3/4] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Date: Tue, 15 Apr 2025 13:56:41 +0100
Message-ID: <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 148 ++++++++++++++++++
 3 files changed, 160 insertions(+)
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
index 000000000000..8674b7605d83
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -0,0 +1,148 @@
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
+	void __iomem *regs;
+};
+
+static const char *const renesas_gbeth_clks[] = {
+	"tx", "tx-180", "rx", "rx-180",
+};
+
+static int renesas_gbeth_clks_config(struct renesas_gbeth *gbeth, bool enabled)
+{
+	struct plat_stmmacenet_data *plat_dat;
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
+		ret = clk_bulk_prepare_enable(plat_dat->num_clks,
+					      plat_dat->clks);
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
+static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
+{
+	return renesas_gbeth_clks_config(priv, true);
+}
+
+static void renesas_gbeth_exit(struct platform_device *pdev, void *priv)
+{
+	renesas_gbeth_clks_config(priv, false);
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
+	gbeth->regs = stmmac_res.addr;
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


