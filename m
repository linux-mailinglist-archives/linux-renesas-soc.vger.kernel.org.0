Return-Path: <linux-renesas-soc+bounces-6810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F669182C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 15:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87649B2A34E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 13:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6BB185E44;
	Wed, 26 Jun 2024 13:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDxcqPSX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27385184125;
	Wed, 26 Jun 2024 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719409087; cv=none; b=IeJ/2DnpH+YUD55WaqiUTWVWpQ6zuaAYyeP4lHfLXa+qiCCG2H74cAo9nY6wWSINv0Ze/Rfs3Oi5CpOkjO0d9JGmzJxfj8BeGUCd2ZrME7p5tZXYaoIoxgY9YH03dVemtbi5kEDu/4ClDQAdxK9z0Cl6JEZKq2Q0YcoNAZixMUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719409087; c=relaxed/simple;
	bh=djKZ+v1GHppH88NjwCWPye3Af8gBi2ndqNTL+misMkA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WHbUVkbPVgmUUPTtYbWio+TrqAx2hHWE9q6MlJQde9uJJRlggQRyaRBZUe0LjDvZDAjFVJ39CEgeRw8ZMAg8bCaAoSictCH3ZAxrDyCBsvTZH5im/9tbf6piRJBiZaLCet7fd6vpdnnbrydyaUAkXKlwtvU0BdAZQAwuDzf2/8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDxcqPSX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4217a96de38so49287025e9.1;
        Wed, 26 Jun 2024 06:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719409083; x=1720013883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtQiSVTHyn0E87pGPyq9bK8IPD+w/DFJJv4T/Qf5KMA=;
        b=NDxcqPSXkdiVr9w3+5WCzeLjSJyr2uYGDuziPwoNXcvV66QwO1sgKSluCeumwT3Ze/
         waUKKMyqlemxXvRZXvfPPpiUDoT23gMJvuZBAI/I0jxfRdhXfaSfl1I5lPAHx5rMQYua
         gRRRLlg06WuLyJXRnjhme2/freIWxIO3D66ncgAHFshP2KCHaTpGshgwCPLGNLHw3NxV
         7R5HF5R03KwIWz3m51uw9gFLFa3cojIlxFixr4B0H+S6D7xJKh3XegDYFfzGB4fjt/5K
         IpAc6013gapps9uVlscAxm93wI8lm4uHSxpX1k4u90v6ZskYqRfvyMyw17IrGSbmux0A
         2SXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719409083; x=1720013883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtQiSVTHyn0E87pGPyq9bK8IPD+w/DFJJv4T/Qf5KMA=;
        b=PhCv5psfpJFR4IZJyeV3zL7xF/65pEGIqzBX8p9mQQ/v4rPe5nzOfbulebm4OILCTn
         n3geyv+DM67lI4+kC4aSI1gtIpmxqq5IpsmKyIazdXBF5v5ZAp6Sk8PtnMYxpPIz+R5U
         CK87xWkBn6vuYh9TWtWllsy//i9OE8eBrH1Yb5dWXPX1cFWpQoVNIkcVg78GYeT1ylRM
         52Li/3oqCJv5SStEbIwbJBwrkqa3tTmdglYtmNsXagnI3p/XyZxOte21P1vxDvTz95yQ
         FYFcVaMcVOdu+VhO5w4i2oHRQONYNQcB1rR5A9VAcjf+qh2fzq/tPsvDlhGoS4OoYs2f
         2urA==
X-Forwarded-Encrypted: i=1; AJvYcCXzZDhpDnAozvrQVoJvu2yNIRYTyUL20opfMmWVriOzCcL94j8C9Gms7nMlL2AcxGgHvs23F6fdEG+zvNl5HV1QMYgBhG/eNjhpY6hwplMKJCze6Ixv8lKRlyy3qclfCUD8ndPZYacjZCgMMCrJ0wX9STwIZlJSfKwtTwawJz2FJUdkuL0jUP0b2fY=
X-Gm-Message-State: AOJu0YwNx0I3by9JgLFRCFXLn9YxquIx17pYY9xrjWYPe2DHhH9tZBsw
	8y8B+NfLpiBeKHOGgEk3wN778W3qMmkK5X6VEXlD6fM3p6FAcLYR
X-Google-Smtp-Source: AGHT+IE3xN3+Ruk9x6fmwLezHJoDXB8J2hyVWJ8djq5p6H8xwI7QG5yN3OzDj5BUrTlnNmW5UR7Htg==
X-Received: by 2002:a05:600c:17d5:b0:425:6171:5d26 with SMTP id 5b1f17b1804b1-42561715d5cmr4412725e9.36.1719409083384;
        Wed, 26 Jun 2024 06:38:03 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8246297sm27107225e9.8.2024.06.26.06.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:38:02 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Date: Wed, 26 Jun 2024 14:23:41 +0100
Message-Id: <20240626132341.342963-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
---
v3->v4
- Dropped using 'renesas,sdhi-use-internal-regulator' property
- Now using of_device_is_available() to check if regulator is available and enabled
- Dropped extra spaces during operations 
- Included tested by tag from Claudiu
- Rebased patch on top of https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240626085015.32171-2-wsa+renesas@sang-engineering.com/

v2->v3
- Moved regulator info to renesas_sdhi_of_data instead of quirks
- Added support to configure the init state of regulator
- Added function pointers to configure regulator
- Added REGULATOR_CHANGE_VOLTAGE mask

v1->v2
- Now controlling PWEN bit get/set_voltage
---
 drivers/mmc/host/renesas_sdhi.h               |  13 ++
 drivers/mmc/host/renesas_sdhi_core.c          |  98 ++++++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 147 ++++++++++++++++++
 drivers/mmc/host/tmio_mmc.h                   |   5 +
 4 files changed, 263 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index f12a87442338..cd509e7142ba 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -11,6 +11,8 @@
 
 #include <linux/dmaengine.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
 #include <linux/workqueue.h>
 #include "tmio_mmc.h"
 
@@ -36,6 +38,12 @@ struct renesas_sdhi_of_data {
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
@@ -95,6 +103,11 @@ struct renesas_sdhi {
 
 	struct reset_control *rstc;
 	struct tmio_mmc_host *host;
+
+	bool use_internal_regulator;
+	struct regulator_dev *internal_regulator;
+	int (*regulator_force_endis)(struct regulator_dev *rdev, bool enable);
+	int (*regulator_force_voltage)(struct regulator_dev *rdev, unsigned int voltage);
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 0fc159b52fa9..6f8e745477b5 100644
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
 
@@ -904,12 +942,36 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
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
 		       const struct renesas_sdhi_quirks *quirks)
 {
 	struct tmio_mmc_data *mmd = pdev->dev.platform_data;
+	struct device_node *internal_regulator;
 	struct tmio_mmc_data *mmc_data;
 	struct renesas_sdhi_dma *dma_priv;
 	struct tmio_mmc_host *host;
@@ -972,6 +1034,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	priv->host = host;
 
+	if (pdev->dev.of_node) {
+		internal_regulator = of_get_child_by_name(pdev->dev.of_node, "vqmmc-regulator");
+		if (internal_regulator) {
+			priv->use_internal_regulator = of_device_is_available(internal_regulator);
+			of_node_put(internal_regulator);
+		}
+	}
+
 	if (of_data) {
 		mmc_data->flags |= of_data->tmio_flags;
 		mmc_data->ocr_mask = of_data->tmio_ocr_mask;
@@ -982,6 +1052,18 @@ int renesas_sdhi_probe(struct platform_device *pdev,
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
@@ -1053,6 +1135,22 @@ int renesas_sdhi_probe(struct platform_device *pdev,
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
index d4b66daeda66..991e832821af 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -89,6 +89,147 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
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
+	sd_status &= ~SD_STATUS_PWEN;
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
+	sd_status |= SD_STATUS_PWEN;
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
+	return !!(sd_status & SD_STATUS_PWEN);
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
+		sd_status |= SD_STATUS_IOVS;
+		*selector = 0;
+	} else {
+		sd_status &= ~SD_STATUS_IOVS;
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
@@ -260,6 +401,11 @@ static const struct renesas_sdhi_of_data_with_quirks of_rzg2l_compatible = {
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
@@ -284,6 +430,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
 	{ .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
+	{ .compatible = "renesas,sdhi-r9a09g057", .data = &of_r9a09g057_compatible, },
 	{ .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,rcar-gen4-sdhi", .data = &of_rcar_gen3_compatible, },
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 63000d9c7030..2648f444daa2 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -44,6 +44,7 @@
 #define CTL_RESET_SD 0xe0
 #define CTL_VERSION 0xe2
 #define CTL_SDIF_MODE 0xe6 /* only known on R-Car 2+ */
+#define CTL_SD_STATUS 0xf2 /* only known on RZ/G2L and RZ/V2H(P) */
 
 /* Definitions for values the CTL_STOP_INTERNAL_ACTION register can take */
 #define TMIO_STOP_STP		BIT(0)
@@ -103,6 +104,10 @@
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


