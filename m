Return-Path: <linux-renesas-soc+bounces-24309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0A6C3F7A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 11:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA3113B4DD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 10:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF25F30ACFA;
	Fri,  7 Nov 2025 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xTGGjj62"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618743191BE
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511415; cv=none; b=Rj1tLDz+MIWyt7I4lV42BlbFDxxjsgfTpY9wWBkmFwnBMfQgUBVRlgMD+Kx23zHffkx147Cuthjjm/15YcYPfJdOsPdu4fA1odsjSSC0iYOk97w109Vw//spYeTifaSMN4bTh4oZl8URE6QAR3PJ8u7JIrncuzZUXb/V6K9xqv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511415; c=relaxed/simple;
	bh=NBuMo3fA0T+jYUYuxAjSnoU2gctigcAN7afLM+xxwVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkH0HqAfSJCzwb67/zZVQw9mw6iaXyg6Ib9uzYbFxH8Kn6eU3cgPJWijs++Kx21dxm7QohXYZo2rgSV92pJMzhgPrTV16K1rNkM9o9quhCGUXO1pzSqo5I2jfDFs8FbUW1+YnkdBR37PulD0qBU19Oy8BDnYPOYTg271nH7P6DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xTGGjj62; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429bccca1e8so311756f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 02:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511409; x=1763116209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeInQQFLiIKx9a2aZ0cucvmhXeQc/nRxrd1ryoO5rZk=;
        b=xTGGjj625Ktt1pRh7L7DUQU6VNYkb8RqVk/N9fZHWUrJcbemwQwjaRbMJUqm37K0kD
         Av4qPo6Oo+5/VSpGKU9q5oMeGJAlJd7/zX2eC/phF0FTCj6rnLErErbbYiQsfpz9g0LN
         emJdyKqVolhpCsugr4Z6Z+FJiT5Y883Ay0eIQmsBs0a1jcrjExtOlhnU1L20ATsPIu4z
         kQwXivsZi8W/E+Dq6S2Dp1f6tfBX1qd4lH9Cjq3mTgQ3DnA+BW2VSl4r+idS/FJs2yIr
         llVoJUR2tNFIIbiWJk+Rv9RyKp8QvyvYV2HyyNmDqBlRKp9fVnBc0V3ibluBmz3bCuYp
         ckzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511409; x=1763116209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EeInQQFLiIKx9a2aZ0cucvmhXeQc/nRxrd1ryoO5rZk=;
        b=k+oqA5MldjXoVVK49a83Obywer4zLSK649/5VnCOI7Ivqmp79eEwLxwEQah6TULv/g
         bQIS/yGBrhaI7X73ltiHGf8EHsGvrlg5RBsPKstNxMvXXlMrh1etdcKDHNYIAdEJFR+v
         0qH3H45THJwbbHivuKe0CXcrfD3ZjSH0Ty1ibk4BtroRYLnlUI2EvXJvfTYPE3nzWd3b
         uNQgk1yafpzCfIxwCzxqa7GqpbTk1BvCzboNLU38Lg7gCjZ48MxpgwA/VTfdYoh36mtp
         bF/9P1ryv8Lt07VCoZHc3DTEauFKk22xbBk+n+BpO4mW0olQlpLi7Fk5okUhKkZB/VST
         /4wg==
X-Forwarded-Encrypted: i=1; AJvYcCUHXJ2YLKAA/qEpdxTDqSOWTMgYPM0opG8eBrk/uQ2244mI50W4Gc/v21omfpsZ3y+MfEW3xNqrRC5qW8W86nEdDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyXZHpOvjUga094rTGAHsqQn9P8VxBRgW+cXhx0gXWqGrx+eKb
	PjwsB64V8LxCJkDgT8UluuUZRObUBwDSJP0iPfWtmUAhEUlT8rTRHHumVqC05edq3fA=
X-Gm-Gg: ASbGnct4FVDqNYpaAkoJop83kiA0mhEqzU9kti70Ll05R3vPxNQ5hx/U4cmudKeAuzh
	hJtPByJ4uqlZN7JPgOGlZLTZerSZHfBxY2BqlMipl29ufnORmkaz2zyQkxeEx5Kn8bhbnrVArTJ
	J4J3lGJlLA/z0KDR03VAWQ1MlF33RjDlz7YrfU8ozFCIjCcmgVFJvLFVcagjZz/piNyKhuwELGO
	p2HJog4vWNY8t6KNJPQ14OLEhCZX68Fecf06TH9Cst2GhpE+dDLI9DdF4WQiWs8eLvyJsc7vOD8
	MI+p0XwGqy3KuggxAO6sHcq0mDtWEODp7AWx3SzPidb6BoXkmk9R5JHQpr9e3J0cPEnReX6/k6m
	3IrKk6x1FiXSZv23e7BsM9pY1lI58dnCQQVxNiSLLbmWrL2jJyvRi1hGtBs1Sqmbn+rNT9hB+12
	qp3co=
X-Google-Smtp-Source: AGHT+IFWpZ4poiZ9SDXbV8ON2MHdizseFiZAt8VOLHhvPsXxDGeYll4+fwCN9jkQCS4Zle5ZwgVqIg==
X-Received: by 2002:a05:6000:4285:b0:429:c774:dc08 with SMTP id ffacd0b85a97d-42ae5aebaf5mr2437383f8f.53.1762511409391;
        Fri, 07 Nov 2025 02:30:09 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:08 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:52 +0100
Subject: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcon0J86/ZOn2V7ZnaixLSQbUE+OOX0GyGHbN
 J0IncBZa6SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KJwAKCRARpy6gFHHX
 ciIrEADVzOpNMnNgNcWPwGlAIVMHEpqCfHtBeXPJvQn07MHtxYl3U9LGnzv620nVLy60nQXmdAj
 pl3ZH62GP+XUvTaa+j/Z2gCKkYsYElWtU+zFXoq3HYslfFES+CnYlKKCUmQophJ5kf0OtQCt7fO
 5abxCLdbNTLSvsEW8oVYqioJeULR4+HfOiPNUiahqO/7PrqApBkNAhtmqdbVH+Y/EeNbiYnOCf2
 ZE6sCBDEzpxLPiYAwB0GUT6G6dzFKvCnBMKGLQ8w7g0Y2Ir6rZD+Un4BWa0CNrGKvNHwo5xO8bo
 nGfuSWFYUqibed/x5q6cbRcrqIv4AmIJq3gc7On4l7G7nPtxCppRhvhSChUmt0Gwl3nU7ag+EdT
 9+tJ2dVjWe5HNxZ6uYIO5iCQkTDt3zHGuEI7sIwGGyMuQUb7feOaRdvBOk3Uzk12VujF7tf0KFh
 b+OPkxYIl6dR2V2vM6Iltg5uvz1odCEojGxY4X1ssONLOPT4Io72HgrU4Ic0feuQA8hwoch6sR/
 FRi9jKn6EJVxMvcjNsmigzOuuZ657/JCBDLfzmcsTY+k/jtVm8lTErQTHQN+xZDKdPke/55kcro
 7TpPf1P6vZKDWhTuWJQrIlPA/9Y2Tcn9d3fifuHIRnt/DqPTlrMScJeQkcUIZjtMw0xYQmGCR4I
 ViImRD8T6UC/KGg==
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


