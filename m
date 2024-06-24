Return-Path: <linux-renesas-soc+bounces-6704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E3915282
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 17:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E19042846D9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 15:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2612A19D8A4;
	Mon, 24 Jun 2024 15:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/S1X2Ky"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C9619CD14;
	Mon, 24 Jun 2024 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719243187; cv=none; b=R4E7R+zmKNrsIXtbozzN3lypv3Uyx+iWeO3a4jvvdkeQUxFvLqDgcNipJUjYQ1JllJRcbUi7g8KNFBnwIZkcoZ/+SOCIYow6AzickV9AgCBmIt3uM2VYz4I4qKARkQg5m99CIH7DzaEsbDXUX7zeL6ZNIEKL3CUjkLk29y149x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719243187; c=relaxed/simple;
	bh=zP0kPuEKuEZnWU7PzFzntj26nUACdx8OeDT9ZFoml/M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KOeIqToPbTy2vGjP2Indaz0b2e8Ixwgk3ejCwa3WLXSICqWwCLX55qnOWMweYH+nLAu9sw+zplxYcuHv3Xb+htH/2MCZJllyrHah23oHAt/JwmPHgm+yjI4MDXLN33boQemmr2F4ppzzrifv6RNJJXzBVOajfpoWcK3ynGNnpWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/S1X2Ky; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-424720e73e0so39712795e9.0;
        Mon, 24 Jun 2024 08:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719243183; x=1719847983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6Z8ryqQgnC6qLGVmMw/9CWXkFMDVPuyPudJaBkqIo8=;
        b=j/S1X2Kypq/GovUBLezYrP9iu81JYZT79e8NJBUXLgSaucJ/S64+Uc8I1WRYPMOzxE
         jFXm0ssC1tFQRQeJ5c7EjvSWft3M9DX7+uPXNVZrI49WVaPRV+VBu/ug2WLff4UCukdU
         p8vJxhYT76JUg6JrdWP1nqIGi3U39rDANxDvP3RQr/Rtn8cGuGLAD6pObYZqOh+CyqLg
         O7DHzl0FFK/KbE5kVI33k2R2eq4klWbYUwIUEui+dHfm4m/i4SowznraZeVQUkvx+9Fi
         t2wJxYQc6az3XZQvalw3mWAAv2r3ADP+ObS9cgaGgCdU3WJ7Huird3mOgUEBiSilQBJX
         96UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243183; x=1719847983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6Z8ryqQgnC6qLGVmMw/9CWXkFMDVPuyPudJaBkqIo8=;
        b=uhSHqlemqHfRTg++HObyTgZWKC99++8kRk1o8zEVkXQcOpcc6thzX+33jQgTk3XP4c
         jXv9Cn1eN4emL2UE6cJNjPPjaOb3r6AcpQuS8caxyXu2MGntruAn5lr9IMw9B81TEqlW
         9cFKqCiCcw7LlKA3Sw0j7mS3DDYssSBxKzIbRuD91mHkYpXl4X2SLpZHa0+LSaVnzTcD
         MteE2jdPAr2o+pZsAybDlhwx4rdOnru7mHQGO9+6Bm9PFgic4WQ7NSu6W2HXi98lq3Na
         fHhulKfjS1FymMpx1lKpuH0y/bBICDIc3QFu3BVtENDiUT9bj4UXGAKFAwQC9/vp7JWF
         mTTA==
X-Forwarded-Encrypted: i=1; AJvYcCUveVS4wslFBefUzlJi2ZWXfyHEde60zAIoY6cz0vr9m41eeQyONmkLFVsyU7KNGtC7d5tCbnY8RGXUorTea/3e3GVdmHRodJqFWxxEoT8ipz+wQuVwxvGCqtrxE4r5hSaFeX1B52D7Hyl0E8s1tnFqVvLWaxOy/Q8GerRRKADSI8nPUk5Tv6HBT6c=
X-Gm-Message-State: AOJu0YzxyEToGGKRWu/1y4szaMXfpOmCnhwaY99atrWcaevLivqkDsK0
	+6LVpJLuwNtnZnbO8wU7nUIott9EDHASzgxM/rhk6obTydxKB3hM
X-Google-Smtp-Source: AGHT+IFPWtvIz23CbnbM/K4chfbU79GgWPJhsKzN9IG1sC0O3VUjdg9oIjzR3Len6uvUJ646XPbeoQ==
X-Received: by 2002:a05:600c:4f83:b0:424:8c13:edc4 with SMTP id 5b1f17b1804b1-4248c13ee6amr33503815e9.27.1719243183032;
        Mon, 24 Jun 2024 08:33:03 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c315:5cc8:bc92:639])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b6121sm138294675e9.27.2024.06.24.08.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:33:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-mmc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Date: Mon, 24 Jun 2024 16:32:29 +0100
Message-Id: <20240624153229.68882-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The SDHI/eMMC IPs found in the RZ/V2H(P) (a.k.a. r9a09g057) are very
similar to those found in R-Car Gen3. However, they are not identical,
necessitating an SoC-specific compatible string for fine-tuning driver
support.

Key features of the RZ/V2H(P) SDHI/eMMC IPs include:
- Voltage level control via the IOVS bit.
- PWEN pin support via SD_STATUS register.
- Lack of HS400 support.
- Fixed address mode operation.

internal regulator support is added to control the voltage levels of SD
pins via sd_iovs/sd_pwen bits in SD_STATUS register.

As the users can use GPIO regulator instead of SD_IOVS/PWEN pins
'renesas,sdhi-use-internal-regulator' DT property is used for
special handling of internal regulator.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Moved regulator info to renesas_sdhi_of_data instead of quirks
- Added support to configure the init state of regulator
- Added function pointers to configure regulator
- Added REGULATOR_CHANGE_VOLTAGE mask

v1->v2
- Now controlling PWEN bit get/set_voltage
---
 drivers/mmc/host/renesas_sdhi.h               |  13 ++
 drivers/mmc/host/renesas_sdhi_core.c          |  93 +++++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 150 ++++++++++++++++++
 drivers/mmc/host/tmio_mmc.h                   |   5 +
 4 files changed, 261 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 586f94d4dbfd..377804bbc37e 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -11,6 +11,8 @@
 
 #include <linux/dmaengine.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
 #include "tmio_mmc.h"
 
 struct renesas_sdhi_scc {
@@ -35,6 +37,12 @@ struct renesas_sdhi_of_data {
 	unsigned int max_blk_count;
 	unsigned short max_segs;
 	unsigned long sdhi_flags;
+	struct regulator_desc *rdesc;
+	struct regulator_init_data *reg_init_data;
+	bool regulator_init_state;
+	unsigned int regulator_init_voltage;
+	int (*regulator_force_endis)(struct regulator_dev *rdev, bool enable);
+	int (*regulator_force_voltage)(struct regulator_dev *rdev, unsigned int voltage);
 };
 
 #define SDHI_CALIB_TABLE_MAX 32
@@ -93,6 +101,11 @@ struct renesas_sdhi {
 	unsigned int tap_set;
 
 	struct reset_control *rstc;
+
+	bool use_internal_regulator;
+	struct regulator_dev *internal_regulator;
+	int (*regulator_force_endis)(struct regulator_dev *rdev, bool enable);
+	int (*regulator_force_voltage)(struct regulator_dev *rdev, unsigned int voltage);
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 12f4faaaf4ee..8cf912512f07 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -581,12 +581,50 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 
 	if (!preserve) {
 		if (priv->rstc) {
+			bool regulator_enabled;
+
+			/* to restore back the internal regulator after reset make a copy of it */
+			if (priv->use_internal_regulator)
+				regulator_enabled = regulator_is_enabled(host->mmc->supply.vqmmc);
+
 			reset_control_reset(priv->rstc);
 			/* Unknown why but without polling reset status, it will hang */
 			read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
 					  false, priv->rstc);
 			/* At least SDHI_VER_GEN2_SDR50 needs manual release of reset */
 			sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
+			if (priv->use_internal_regulator) {
+				int voltage;
+
+				/*
+				 * HW reset might have toggled the regulator state in HW
+				 * which regulator core might be unaware of so restore
+				 * back the regulator state in HW bypassing the regulator
+				 * core.
+				 */
+				if (regulator_enabled !=
+				    regulator_is_enabled(host->mmc->supply.vqmmc)) {
+					ret = priv->regulator_force_endis(priv->internal_regulator,
+									  regulator_enabled);
+					if (ret)
+						dev_err(&host->pdev->dev,
+							"Failed to %s internal regulator\n",
+							regulator_enabled ? "enable" : "disable");
+				}
+
+				/* restore back voltage on vqmmc supply */
+				voltage = regulator_get_voltage(host->mmc->supply.vqmmc);
+				if (voltage != host->mmc->ios.signal_voltage) {
+					voltage = host->mmc->ios.signal_voltage ==
+						  MMC_SIGNAL_VOLTAGE_330 ? 3300000 : 1800000;
+					ret = regulator_set_voltage(host->mmc->supply.vqmmc,
+								    voltage, voltage);
+					if (ret)
+						dev_err(&host->pdev->dev,
+							"Failed to set voltage on internal regulator\n");
+				}
+			}
+
 			priv->needs_adjust_hs400 = false;
 			renesas_sdhi_set_clock(host, host->clk_cache);
 
@@ -904,6 +942,29 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
 }
 
+static int renesas_sdhi_internal_dmac_register_regulator(struct platform_device *pdev,
+							 const struct renesas_sdhi_of_data *of_data)
+{
+	struct tmio_mmc_host *host = platform_get_drvdata(pdev);
+	struct renesas_sdhi *priv = host_to_priv(host);
+	struct regulator_config rcfg = {
+		.dev = &pdev->dev,
+		.driver_data = host,
+		.init_data = of_data->reg_init_data,
+	};
+	const char *devname;
+
+	devname = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-vqmmc-regulator",
+				 dev_name(&pdev->dev));
+	if (!devname)
+		return -ENOMEM;
+
+	of_data->rdesc->name = devname;
+	priv->internal_regulator = devm_regulator_register(&pdev->dev, of_data->rdesc, &rcfg);
+
+	return PTR_ERR_OR_ZERO(priv->internal_regulator);
+}
+
 int renesas_sdhi_probe(struct platform_device *pdev,
 		       const struct tmio_mmc_dma_ops *dma_ops,
 		       const struct renesas_sdhi_of_data *of_data,
@@ -970,6 +1031,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (IS_ERR(host))
 		return PTR_ERR(host);
 
+	if (pdev->dev.of_node)
+		priv->use_internal_regulator = of_property_read_bool(pdev->dev.of_node,
+								     "renesas,sdhi-use-internal-regulator");
+
 	if (of_data) {
 		mmc_data->flags |= of_data->tmio_flags;
 		mmc_data->ocr_mask = of_data->tmio_ocr_mask;
@@ -980,6 +1045,18 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->max_segs = of_data->max_segs;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
+		if (priv->use_internal_regulator) {
+			if (!of_data->regulator_force_endis)
+				return dev_err_probe(&pdev->dev, -EINVAL,
+					"missing function pointer to force regulator enable/disable");
+			priv->regulator_force_endis =
+				of_data->regulator_force_endis;
+			if (!of_data->regulator_force_voltage)
+				return dev_err_probe(&pdev->dev, -EINVAL,
+					"missing function pointer to force regulator voltage");
+			priv->regulator_force_voltage =
+				of_data->regulator_force_voltage;
+		}
 		/* Fallback for old DTs */
 		if (!priv->clkh && of_data->sdhi_flags & SDHI_FLAG_NEED_CLKH_FALLBACK)
 			priv->clkh = clk_get_parent(clk_get_parent(priv->clk));
@@ -1051,6 +1128,22 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ret)
 		goto efree;
 
+	if (priv->use_internal_regulator && of_data) {
+		ret = renesas_sdhi_internal_dmac_register_regulator(pdev, of_data);
+		if (ret)
+			goto efree;
+
+		/* Set the default init state for regulator in the HW */
+		ret = priv->regulator_force_endis(priv->internal_regulator,
+						  of_data->regulator_init_state);
+		if (ret)
+			goto efree;
+		ret = priv->regulator_force_voltage(priv->internal_regulator,
+						    of_data->regulator_init_voltage);
+		if (ret)
+			goto efree;
+	}
+
 	ver = sd_ctrl_read16(host, CTL_VERSION);
 	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
 	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 422fa63a2e99..a70a1ae6919c 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -89,6 +89,150 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	},
 };
 
+static const unsigned int r9a09g057_vqmmc_voltages[] = {
+	1800000, 3300000,
+};
+
+static int r9a09g057_regulator_disable(struct regulator_dev *rdev)
+{
+	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
+	u32 sd_status;
+
+	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
+	sd_status &=  ~SD_STATUS_PWEN;
+	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
+
+	return 0;
+}
+
+static int r9a09g057_regulator_enable(struct regulator_dev *rdev)
+{
+	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
+	u32 sd_status;
+
+	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
+	sd_status |=  SD_STATUS_PWEN;
+	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
+
+	return 0;
+}
+
+static int r9a09g057_regulator_force_endis(struct regulator_dev *rdev, bool enable)
+{
+	if (enable)
+		return r9a09g057_regulator_enable(rdev);
+
+	return r9a09g057_regulator_disable(rdev);
+}
+
+static int r9a09g057_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
+	u32 sd_status;
+
+	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
+	if (sd_status & SD_STATUS_PWEN)
+		return 1;
+
+	return 0;
+}
+
+static int r9a09g057_regulator_get_voltage(struct regulator_dev *rdev)
+{
+	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
+	u32 sd_status;
+
+	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
+	if (sd_status & SD_STATUS_IOVS)
+		return 1800000;
+
+	return 3300000;
+}
+
+static int r9a09g057_regulator_set_voltage(struct regulator_dev *rdev,
+					   int min_uV, int max_uV,
+					   unsigned int *selector)
+{
+	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
+	u32 sd_status;
+
+	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
+	if (min_uV >= 1700000 && max_uV <= 1950000) {
+		sd_status |=  SD_STATUS_IOVS;
+		*selector = 0;
+	} else {
+		sd_status &=  ~SD_STATUS_IOVS;
+		*selector = 1;
+	}
+	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
+
+	return 0;
+}
+
+static int r9a09g057_regulator_force_voltage(struct regulator_dev *rdev,
+					     unsigned int voltage)
+{
+	unsigned int selector = 0;
+
+	return r9a09g057_regulator_set_voltage(rdev, voltage, voltage, &selector);
+}
+
+static int r9a09g057_regulator_list_voltage(struct regulator_dev *rdev,
+					    unsigned int selector)
+{
+	if (selector >= ARRAY_SIZE(r9a09g057_vqmmc_voltages))
+		return -EINVAL;
+
+	return r9a09g057_vqmmc_voltages[selector];
+}
+
+static struct regulator_init_data r9a09g057_regulator_init_data = {
+	.constraints = {
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS | REGULATOR_CHANGE_VOLTAGE,
+	},
+};
+
+static const struct regulator_ops r9a09g057_regulator_voltage_ops = {
+	.enable = r9a09g057_regulator_enable,
+	.disable = r9a09g057_regulator_disable,
+	.is_enabled = r9a09g057_regulator_is_enabled,
+	.list_voltage = r9a09g057_regulator_list_voltage,
+	.get_voltage = r9a09g057_regulator_get_voltage,
+	.set_voltage = r9a09g057_regulator_set_voltage,
+	.map_voltage = regulator_map_voltage_ascend,
+};
+
+static struct regulator_desc r9a09g057_vqmmc_regulator = {
+	.of_match	= of_match_ptr("vqmmc-r9a09g057-regulator"),
+	.owner		= THIS_MODULE,
+	.type		= REGULATOR_VOLTAGE,
+	.ops		= &r9a09g057_regulator_voltage_ops,
+	.volt_table	= r9a09g057_vqmmc_voltages,
+	.n_voltages	= ARRAY_SIZE(r9a09g057_vqmmc_voltages),
+};
+
+static const struct renesas_sdhi_of_data of_data_r9a09g057 = {
+	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
+			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
+	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
+			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
+	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
+	.bus_shift	= 2,
+	.scc_offset	= 0x1000,
+	.taps		= rcar_gen3_scc_taps,
+	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
+	/* DMAC can handle 32bit blk count but only 1 segment */
+	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
+	.max_segs	= 1,
+	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
+	.rdesc = &r9a09g057_vqmmc_regulator,
+	.reg_init_data = &r9a09g057_regulator_init_data,
+	.regulator_init_state = false,
+	.regulator_init_voltage = 3300000,
+	.regulator_force_endis = r9a09g057_regulator_force_endis,
+	.regulator_force_voltage = r9a09g057_regulator_force_voltage,
+};
+
 static const struct renesas_sdhi_of_data of_data_rza2 = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY,
@@ -260,6 +404,11 @@ static const struct renesas_sdhi_of_data_with_quirks of_rzg2l_compatible = {
 	.quirks = &sdhi_quirks_rzg2l,
 };
 
+static const struct renesas_sdhi_of_data_with_quirks of_r9a09g057_compatible = {
+	.of_data = &of_data_r9a09g057,
+	.quirks = &sdhi_quirks_rzg2l,
+};
+
 static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_compatible = {
 	.of_data = &of_data_rcar_gen3,
 };
@@ -284,6 +433,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
 	{ .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
+	{ .compatible = "renesas,sdhi-r9a09g057", .data = &of_r9a09g057_compatible, },
 	{ .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,rcar-gen4-sdhi", .data = &of_rcar_gen3_compatible, },
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index de56e6534aea..1a3172786662 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -43,6 +43,7 @@
 #define CTL_RESET_SD 0xe0
 #define CTL_VERSION 0xe2
 #define CTL_SDIF_MODE 0xe6 /* only known on R-Car 2+ */
+#define CTL_SD_STATUS 0xf2 /* only known on RZ/G2L and RZ/V2H(P) */
 
 /* Definitions for values the CTL_STOP_INTERNAL_ACTION register can take */
 #define TMIO_STOP_STP		BIT(0)
@@ -102,6 +103,10 @@
 /* Definitions for values the CTL_SDIF_MODE register can take */
 #define SDIF_MODE_HS400		BIT(0) /* only known on R-Car 2+ */
 
+/* Definitions for values the CTL_SD_STATUS register can take */
+#define SD_STATUS_PWEN		BIT(0) /* only known on RZ/V2H(P) */
+#define SD_STATUS_IOVS		BIT(16) /* only known on RZ/V2H(P) */
+
 /* Define some IRQ masks */
 /* This is the mask used at reset by the chip */
 #define TMIO_MASK_ALL           0x837f031d
-- 
2.34.1


