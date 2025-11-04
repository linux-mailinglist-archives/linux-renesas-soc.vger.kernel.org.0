Return-Path: <linux-renesas-soc+bounces-24072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB832C3122F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 14:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CECB94EB85C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 13:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A392F5A12;
	Tue,  4 Nov 2025 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DeLLo5xm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7442D2F49E3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Nov 2025 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762261755; cv=none; b=bIaFbk/LsihM7G0o0k/ei7rP2dNGyt0OxTocwJSWJaigITvBBRGKjYSQiw6/YwbEi4+YyXai4xGcomF7XCWSanT8SYYXuwEM/yB8UnmtSFiK0j6igwjT2DmObOYoctL0Wn19rzvyHUB6gXrtY7KYeVT91WJtsYxvcR45NTbYmFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762261755; c=relaxed/simple;
	bh=NBuMo3fA0T+jYUYuxAjSnoU2gctigcAN7afLM+xxwVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n7NgoB2N1gH9OEOWgJPiDRbFc8jQQK6DJ3Ms3KgHkfcK9rwc37TovgrrkLfXkp3kW8Vo4S74CRyrRT7a1f77Pm8l8U4W9Y/Kx11jJdJT9UQNWRIwwvfDFjoBpucF3uCiAvPvVaooNYyj7o9hJR6U6NP8ll9GXYBy6h0sZN7VgV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DeLLo5xm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429bcddad32so3279167f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 05:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261752; x=1762866552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeInQQFLiIKx9a2aZ0cucvmhXeQc/nRxrd1ryoO5rZk=;
        b=DeLLo5xm3OAR2rej3QloNmz9nAd9jIHTeVHP+jDZuzzNROyLeAkscZbuMojt6U951+
         JUxck4L8IsY7dur6fFmGzij1hdT0F1CgoWglVZok4QuKBU93FgLr+yOilVto6i4paSq3
         kEcW6QEI+mLK8plhwwWuIFX7JcyCtc2kJdmSiefpfn59s27BFI0ZRPi/RSnzIiUFHf2q
         2hHdT3J9uHB+fnfG0x8Eea4kTyxi6ab3C9Kk6Co0fdYgTLrsgLjVisurjo7lx2ZNJ3Ty
         8IQjMQCfZ8gzCtCNEGGTTCKs6F8nnnvYKojFYKlHqT3AeTAmXGIpahZzRhn7zUbD5xuW
         kyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261752; x=1762866552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeInQQFLiIKx9a2aZ0cucvmhXeQc/nRxrd1ryoO5rZk=;
        b=TzJgFzX826m+uU1aFI+4L3FAptdA8+qABviN+Ig0dsVxjALePVOLVbVoMvFnlvlCd0
         bk44WDzSU1Dl5yDNoZQ2yQEjE5GsEUBhjmMZqUspKEXxi6r5DbHHCqcJgnG1Ysg77M/C
         kN60I7T4hQ/dB0UphKPn9RQtpdUc9iNlC11NwXgAniPiuExUGis/U/+QYqqjaDDiCC1q
         ApeeZv1xoFU/BYyQHPIIoVuEX/L90nOAikn2NwgVQEoI8/ZxHTx1/7jBYRyivJS9BxCw
         WumWy4I5gvDbVzdik4AKJFrEVbUfd4ywxYFGTUi5J23H8UvTI9IBArWZXL03LFiNp/tS
         C+OA==
X-Forwarded-Encrypted: i=1; AJvYcCWHpODnkT/Wnom8lekwxw5Ucqa+93eUsaLQ4h1pqe2V4Buu//cwZq/xqlWJX8qm7dtfRQ6Hfsi5hjFY77kd+NEH3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3A068fabNkeRiVHsLtsjyt0QyoPM02IHV5kMjD4HY0HPKommb
	McVU84Rm4QNQ3gJBD1TCXzw5wXWiM2a020cyzmOQQQj2tWXHfhqLZnMXMuAYW2R1Evc=
X-Gm-Gg: ASbGncs7kUkrSXg+E8tvUKxgLygdxGd5/X2Ud+o0fBZXvPx2M/3CWuL3IMcQ5w34Ti9
	RjPAnBcbW/9AgoEFpTbRE/dM9Z5Boat/++LYb95w1+PoT1VzlJxpr2K3GTsu4H2Lpun74yxpQxj
	t3TrzVxj+YnUZoFfBQQLBsL3R4e2UQlX307eFEp0sxy2ZMPpanIsFaPbvAZiLFXllOt5+g4Mbaw
	/T5r0zBMWCOMrcUY/LBiKbjwjM37SFxP5Jlls10navjsV+e1ovyHfhbGX03fJM/XvO2mL+gXW1K
	K9oiTkr56PVGcxCtBd1urJ9g+nWIppglSm//xJegokbRIE6SPU6QuDKXfV/T6Ie6L0uXIS9atRn
	VjJyW0zItzgeFkqwumK2WSGBtNbYrBHI/eh9q6ChuBF0Pe/u5x+t7O7TEa02m3X8uY5+e3Q==
X-Google-Smtp-Source: AGHT+IEazXC1/4e+3C9LIKFv0ME+i45XzCYX35RlKHJ+lvSQy9CFk/4mRB0TKiPc1PmCBPTWdT7aKw==
X-Received: by 2002:a5d:5f87:0:b0:429:d565:d7b0 with SMTP id ffacd0b85a97d-429d565da79mr4914264f8f.40.1762261751551;
        Tue, 04 Nov 2025 05:09:11 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:10 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 04 Nov 2025 14:08:53 +0100
Subject: [PATCH v4 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-qcom-sa8255p-emac-v4-2-f76660087cea@linaro.org>
References: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
In-Reply-To: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=POv+vDF2xSPchjLMqtdcREByAr5wVSRC/4xfmqCj4bM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfrsfPxny4b8sz641T3T8EFvMTQx5kwO1QGOR
 8pb8GTd+BeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn67AAKCRARpy6gFHHX
 cnqVD/97NywmsMZe+hTiJ7jxCsNyrWnMcFO+7cIL2RPel3gou8gIXIQsX7ETeIUDtcJzTZ1KqSm
 agsydioe3Mk2/PKY0XdQxNxEpMu65rEETgcwAzTyKgoU/GZTN7LqKeqxXx3S8aUCDiwGkjQifN8
 X2v8MajyRTcRmY6D54ypAgNEnFYJkeXukrUxi75A6NLw5DrkAJXiElFKV8Tfmc35UABzpEhoqVE
 T88M2BP+jZLRswE6QrLutFh322QPaF+UjIRKHUaSw4FFBTZTy5aDvugwNG/kaGN3HopwyUXjCRf
 ErGV9fj5k1xKzd0LYxkqFzXGd+anLTeceuPdxnQBJJS1WQStSlyRM8YM9o7iyG6Vpn9AwHwPQOX
 IG1GY+EPViR2egEOTkA05k9276NPSpxVnYXxSiEq5Qbk35L4ZJDO96QF/G7uILkWr5coGWSSms/
 P4UoZRGYq4KVQ/m8Q+r5upzCzXVqfEDAyKuhITS4g84ORbRJEezl5MXDte+IYVB+qcRrWEmXjBz
 8g60W21TaM8AfbRDvZtWVjkNzCIlUv68U1HsXEpCg7dJiPHZYMpZeM6sgFYNYCONcr/XTMwTODa
 ar4PeVg5WExRCx2+/p2gUOp1THWngsIY51xRK43VP8GvryZCHp/WVW7HF7s7bCwOHAoLr0/70vM
 g1Xe3JNSs8RSY5w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 87c5bea6c2a243f3be998b2c3935bc1dc23bfe22..22d0eaab35eaffac0bca58f8625ecc5c955b6631 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1a616a71c36ace29a74a0aa23fc8173443aa49a5..8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -748,7 +748,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -799,7 +798,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -836,9 +835,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.51.0


