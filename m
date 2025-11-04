Return-Path: <linux-renesas-soc+bounces-24074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA021C3125C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 14:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04E99426985
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 13:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11712FB987;
	Tue,  4 Nov 2025 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eE3tATwB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32E72FABFA
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Nov 2025 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762261774; cv=none; b=ruLjW1f4MQobvWC4YS+/IpXAzCQeOJnwxKTGKFdnYdqNlQ5xH1jlgkPmKPhyRvI0uuvwYuY40/ogCQEuJuRt3wGTW9hTh1LE2MwXhj8p0hNwaw+99UbmPFe6sIGj1PAyYCK0KsmLOI5O6OJZ5S9B5IEc2bqVADbgW3zcJ8yzaNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762261774; c=relaxed/simple;
	bh=bf3B5kwYVwr169/W9UlPMIlu2CzILnodl9pD3IyD0h4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdEQzj/JFeC1CFEma4ffWu1qf+yNhmYjxiGRYSOgCEiWvyddnWSl4Ov63rPtSOeESTVwuwSNWWm/LcefrZOPY/EOEKIA0mIzvvQL6lx9PWx7N8PBUJJm+RHI+E71WP2nStO8py/3VtvBJXNlxEXGsJ9NEgN6A9VQ4k3Szc2yhAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eE3tATwB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429b7eecf7cso3924768f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 05:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261769; x=1762866569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6g7dsZ8u0SOZn4ZdglRbxzgGZbve11SxESJzoyiLLfA=;
        b=eE3tATwBJ2TcDjRBZGY3K0Ds1/h4/UEKoNPBZb+46dYMmi+ttxr7DJCX1DVmv9NV5U
         FxA+YyWZS50ghHRmIHrdaH6g6PWAiHiw3wDMUCBv23ue/EHr/bgLuHSeN/ZRyhCNkT/4
         +clG7rkwsl8ej/0joCa46adSq8gByHFpcreqG3CQgdI7JAOUSgeW7bkICKL4SQym38yh
         FJdsjIeNwupWBrXiOyqyhJg5FqfwB8+Rnt7cWYV+UAjtzo6/QxZQ+MX5g+imBdKlppjq
         AseAhgUeCnHLmMLiI8R+sVjNTQkCjTw7/cWmxffJ46NUmHIe0K99ulZoc8CLNgNZY/nx
         obYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261769; x=1762866569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6g7dsZ8u0SOZn4ZdglRbxzgGZbve11SxESJzoyiLLfA=;
        b=dwz99cfHJHMT7LCDlnGOwH4qNU8FVVTt/9cJ1H8zEfc67BQpitfQJ+xXJ+KC3ucYn7
         rmHzHUt05qMq59fgCokAHemZcPRRXOUQTNt7WF5tDMEuGRNreflXQXQqUbqhuwBkktT1
         VZHKm+okQewFDMBF2lpuH8z1Ku4l+HotwqrfNODlQJqcyX4npxDb9wtbJ1I/6Ht3G2Bo
         dNaX+Y1PMfZZMNg3SeUxhsWkX8GoesmEkzuvJW/shkRsR+K5J0sQDualgCgDQqygL8+0
         H9cRR6ixwzJzsY0iEATdzNIrGbbvOnnUGmkAndn17Mq/8M1P1utpCmFLuqSCGFBL4Lxu
         nj4A==
X-Forwarded-Encrypted: i=1; AJvYcCUkRjV+gSL2blX8Gk8FrNPb8ON/8zsgONdLRlNTzQABJs+3Z6nhugJATG8A/xXPhZWvhJPDG+PoN8z9zfugNPJ9nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwARapG/EuNGNrvDFiH+tHMMyJCUlAj1I/XfCuDKpeT2lNZ5jHS
	PPc1JHoiiSZSuRy2waz9QwMtRQmax8tT56KyhsSMgcdCPQ2HJSgps2CY/nj29OSd1bI=
X-Gm-Gg: ASbGncug4jEjlcxNGebJTwz+4FCjQvnuDYVxJfOB5x/l4Eml789PubL1Ify8Cumd5Au
	2SLFXzKcEO6XH0Sj3WJUlpKFO9Ee4M4VIZrjl/SUbg5VkFFEHLJqWN5cI3ckuQpnIMXcPCFv4G/
	eNPhlzSB/cZD88CErLYFP9YsJRXOJ7XZzRSvsSDEMbQCrcxNNjc6yeGRvIuZMJT8yeUBnuZeetD
	51sgTFksqpb0b6b5aiMC4XbVaQIjdPo5A1nspclZwMmPoImjFkUFxmdnmmxeuok2beA+TBvNhiE
	5yCttmBKLL6n3iTslJgnasCciEnvoOC85Hn+5O/dtnLGRpfIbqOCxwyrTCEglCsiluFQ+NoTGVR
	B6A+mFUanPbdKuqT0gqnVvRt376BUetRN+Poo6MuaxwrCih30700xV6TLlgPNMgeQyFKKsw==
X-Google-Smtp-Source: AGHT+IHlxOoZ7XT18Vfvo/agko5vs85w5rmhUqZJanFIi/Ov8ICdgLA4arr6qqZL3+QQYmU0g/EvZw==
X-Received: by 2002:a05:6000:2082:b0:429:cff0:1929 with SMTP id ffacd0b85a97d-429dbcf3cebmr3258016f8f.29.1762261767675;
        Tue, 04 Nov 2025 05:09:27 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:19 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 04 Nov 2025 14:08:55 +0100
Subject: [PATCH v4 4/8] net: stmmac: qcom-ethqos: wrap emac driver data in
 additional structure
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-qcom-sa8255p-emac-v4-4-f76660087cea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5646;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FNtfWUOF4aoHZQXzUDVa1raYDkAAFgkdXVleG8nnhtM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfrtSGh3xeSD73y28qW6sUz2LCQZ1x8oxw6JE
 fCMYH3pXYKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn67QAKCRARpy6gFHHX
 cmFRD/9LIoa+4RVvj1jMsRAZr0/STyyV46NfgKs3xsOc2YEHRAOz2IvLEFMPEMLqGj35lZVCPH9
 jSRQFfOKzF3nMtH4xjV+Cu4LwiaQXQE28lacAeiJV8FD9Rr+XOXXHX8Df3qgei9pQZuEJt0uVkA
 HGEhoQvCaamAtctMzCIKPxswzYgQgcm8KTsDBVkzcosF51LvOUGM3FU5AsMSTJ+y5EYbl79fmQO
 abIWx1tVli4V8gDjjPI9lvvUDrFDLMWvKV1+4NLJDXP3WG9L3ZtqcReQEeppHQNo7eNh8vK51dG
 9mYIWUmoSSjdt9U01SFnNuJi4L7iH8fwfXfUXUP/8ySl2NSjbnmRFsXlTNh/F8eLnrP5HnQ7GAr
 lKbOKr0Gm5PxGJihrQIPoYClyEsmvSqkQzH85jCCbGK2CMEXliO9skRMOMzzmNMVHXQ5A7FDWjH
 Z7GnY4CHNagb6JYWOcYgXoqtlBh0LMp6KakWtYUs27PIoya8RT79KggmxQbICmRIorN3qe5vlp+
 wwkxd1TdsI43sAz4xSAxc/GoWdCaR8tXJ5Gsfbqj6uvhuKjlMlMQc9e2edLCuyibRZ6ZvLxaXTO
 QGBkyWgH37pg6K7DXvtn+mg8uVLIttlIbPNO2NQRWJRlIYs4y5Kkh6fO/AG5Mfq8pSTnTRGgrd/
 IiSxjqDYR86AsmA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 51 ++++++++++++++++------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8493131ca32f5c6ca7e1654da0bbf4ffa1eefa4e..9cafe101049d5412d649b3beaca350c497ffc981 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -97,6 +97,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -214,6 +218,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -230,6 +238,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -262,6 +274,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -297,6 +313,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -750,7 +770,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -801,13 +822,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->mac_base = stmmac_res.addr;
 
 	data = device_get_match_data(dev);
-	ethqos->por = data->por;
-	ethqos->num_por = data->num_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	drv_data = data->drv_data;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	ethqos->por = drv_data->por;
+	ethqos->num_por = drv_data->num_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -835,14 +858,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -857,10 +880,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.51.0


