Return-Path: <linux-renesas-soc+bounces-6142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B27990685B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 11:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BE981F246B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 09:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7518140E38;
	Thu, 13 Jun 2024 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2A0ltvk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8B913FD62;
	Thu, 13 Jun 2024 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718270259; cv=none; b=qTxcl/4l8Wj4u2j+0Gbi9+0Q9eeWqbvnaCVkI4Uz/KACPpyPgt/O830m/XurHSamVrRbz5IX2LN3pJ0ntvEi1b+nCEY1qtXqEVHa83Z75B0Er6nCe1p4r6lBK2gz/pNuLutGYY+Gl8TjCiNw4YHFut3RWFiEbF4LwTOD/Odw8+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718270259; c=relaxed/simple;
	bh=PeU2ieI+fpqMnL2X1HxxcfddKAocqzfvYoNvquUW6tM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q6uX63O/8ub3HZnbtAYw0W/SxDM5Z4wzeQHScVp416Fu7qErGSEfJvpDVmcbfjM8dLxZJAt2++xDJZeUcLXkJ8tJayWtxpzVBqEJUt/1KtN8OJf1tdgEf6hdVQc8S89RpoCm6fQV4DH+afdZqRzSRkwn9SSk79Kx7rsOiYLU1E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2A0ltvk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35f06861ae6so770503f8f.2;
        Thu, 13 Jun 2024 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718270256; x=1718875056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCE7I1FXY6ifokBJv+clqaVriBvejP1pFGI8JoNkrfA=;
        b=L2A0ltvkrnjMOx8LFm5Z8emkJif6usI0R3O2vgUxTgkbptDi/4iQAHG0KhbREL5NIP
         Kv5QbbC0wRIfDQkJEbFO9A+IyKhtsQ+U8+MIpbjs7p/6y4lpq/HT83UuyO6B/pddRsUD
         8FdZZlZ2qMqJuJc5HIOOAJFQr6gbvrN6VZGm3pLfjI3sXHpx/5MW4KH2rnpWf/KZl99f
         ysewoFtgMaM5bIdP7VbMcEVL2/NYlQFUqcBGdB25zN/N8OJ3duvEIQo6Eem60iuBj2KP
         S98v0TfGZATKMHC+ckfLa0N6sAUtIGK0cfmzxXgQylpu0gSS1XYFvrkeDNpIR5F5lY6V
         Xcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718270256; x=1718875056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCE7I1FXY6ifokBJv+clqaVriBvejP1pFGI8JoNkrfA=;
        b=NJUj/GHghfc0ar4H165/uHLz6BIYOhlme5fTxSBDLfbH1HQsVx99s8h2TzaXyAJn7n
         xLvNUq7NyKSrADztTlZaNBTSBGncx/jucNJ/BUv6vGgLkzyWNdXz3vq7fzidzgt1y52O
         7xGcGTqpQ3nf7hQv+vDJnHLv2Z3PI4ikvwdFySbBrEc8xpwfS2n2eFmRiF0mWCmGR7AU
         MsDmU0lrlDLxa+FSnrH4qqIcE64cmd9XiYne0td1rnY880i6iz+mQjgUg0UlW7xWzuZs
         Y6uM5cHk+ODfO9GxqasWcCrC7DgqakMyrGZjt0GBiiQ8C7FxCXekLZtwLrgdwQpLgllS
         jabw==
X-Forwarded-Encrypted: i=1; AJvYcCXr7W6fQTPlsKTjW+vPsceAxDZmyef3Ev/I6buhvUc714wHzKgM7cWNr2aCWRRp3ATljJ4cK9UaQihGQNOC/XufGH50+iOqC++5YnwqLxVXD803AU3XeqloaFZuEHghYBofSysOzSG1u8fNKC3C41tPDBqyDCiv2rGeXcDUckgVVKlpy+6f//pI9ug4
X-Gm-Message-State: AOJu0YxG1R6RsrD35JWTUx67qLzRTa6P79U3oZTveANwk9I0/nKbU2cE
	nza9X9mvTrcint0E1lAHvq11MDUYYwehXhPQSTEbrjbxPde7uJKZ
X-Google-Smtp-Source: AGHT+IFmtmtweCyv4BPRzXdZmqetMJ5BHF3wLD3Zu+ZQJN1BVPs52gbIC+ogPNoiyf/GfYEgEZIuyg==
X-Received: by 2002:adf:ea8b:0:b0:35f:2fa7:ef14 with SMTP id ffacd0b85a97d-35fe893752emr2478622f8f.60.1718270256038;
        Thu, 13 Jun 2024 02:17:36 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c79bsm1108122f8f.41.2024.06.13.02.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 02:17:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Date: Thu, 13 Jun 2024 10:17:21 +0100
Message-Id: <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

regulator support is added to control the volatage levels of SD pins
via sd_iovs/sd_pwen bits in SD_STATUS register.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi Wolfram,

- Ive modelled the regulator now to control the PWEN aswell.
- I have still kept regulator bits in quirks I was wondering if I should
  move this to renesas_sdhi_of_data instead?
- I still need to add checks if the internal regulator used and
  only then call regulator_enable/regulator_set_voltage. ATM I am still
  unclear on differentiating if internal/external regulator is used.
  
Please let me know your thoughts.

Cheers, Prabhakar

v1->v2
- Now controlling PWEN bit get/set_voltage
---
 drivers/mmc/host/renesas_sdhi.h               |   8 ++
 drivers/mmc/host/renesas_sdhi_core.c          |  43 +++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 120 ++++++++++++++++++
 drivers/mmc/host/tmio_mmc.h                   |   5 +
 4 files changed, 176 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 586f94d4dbfd..91e42e680dbb 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -11,6 +11,9 @@
 
 #include <linux/dmaengine.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
 #include "tmio_mmc.h"
 
 struct renesas_sdhi_scc {
@@ -49,6 +52,9 @@ struct renesas_sdhi_quirks {
 	bool manual_tap_correction;
 	bool old_info1_layout;
 	u32 hs400_bad_taps;
+	bool internal_regulator;
+	struct regulator_desc *rdesc;
+	struct regulator_init_data *reg_init_data;
 	const u8 (*hs400_calib_table)[SDHI_CALIB_TABLE_MAX];
 };
 
@@ -93,6 +99,8 @@ struct renesas_sdhi {
 	unsigned int tap_set;
 
 	struct reset_control *rstc;
+
+	struct regulator_dev *sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 12f4faaaf4ee..47e99ce0b752 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -587,6 +587,20 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 					  false, priv->rstc);
 			/* At least SDHI_VER_GEN2_SDR50 needs manual release of reset */
 			sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
+			if (sdhi_has_quirk(priv, internal_regulator)) {
+				unsigned int voltage;
+
+				if (!regulator_is_enabled(host->mmc->supply.vqmmc))
+					if (regulator_enable(host->mmc->supply.vqmmc))
+						dev_err(&host->pdev->dev, "Failed to enable internal regulator\n");
+
+				/* restore back voltage on vqmmc supply */
+				voltage = host->mmc->ios.signal_voltage == MMC_SIGNAL_VOLTAGE_330 ?
+					  3300000 : 1800000;
+				regulator_set_voltage(host->mmc->supply.vqmmc,
+						      voltage, voltage);
+			}
+
 			priv->needs_adjust_hs400 = false;
 			renesas_sdhi_set_clock(host, host->clk_cache);
 
@@ -904,6 +918,29 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
 }
 
+static int renesas_sdhi_internal_dmac_register_regulator(struct platform_device *pdev,
+							 const struct renesas_sdhi_quirks *quirks)
+{
+	struct tmio_mmc_host *host = platform_get_drvdata(pdev);
+	struct renesas_sdhi *priv = host_to_priv(host);
+	struct regulator_config rcfg = {
+		.dev = &pdev->dev,
+		.driver_data = host,
+		.init_data = quirks->reg_init_data,
+	};
+	const char *devname;
+
+	devname = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-vqmmc-regulator",
+				 dev_name(&pdev->dev));
+	if (!devname)
+		return -ENOMEM;
+
+	quirks->rdesc->name = devname;
+	priv->sd_status = devm_regulator_register(&pdev->dev, quirks->rdesc, &rcfg);
+
+	return PTR_ERR_OR_ZERO(priv->sd_status);
+}
+
 int renesas_sdhi_probe(struct platform_device *pdev,
 		       const struct tmio_mmc_dma_ops *dma_ops,
 		       const struct renesas_sdhi_of_data *of_data,
@@ -1051,6 +1088,12 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ret)
 		goto efree;
 
+	if (sdhi_has_quirk(priv, internal_regulator)) {
+		ret = renesas_sdhi_internal_dmac_register_regulator(pdev, quirks);
+		if (ret)
+			goto efree;
+	}
+
 	ver = sd_ctrl_read16(host, CTL_VERSION);
 	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
 	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 422fa63a2e99..ee0aafae9661 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -215,6 +215,120 @@ static const struct renesas_sdhi_quirks sdhi_quirks_rzg2l = {
 	.hs400_disabled = true,
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
+static int r9a09g057_regulator_list_voltage(struct regulator_dev *rdev,
+					    unsigned selector)
+{
+	if (selector >= ARRAY_SIZE(r9a09g057_vqmmc_voltages))
+		return -EINVAL;
+
+	return r9a09g057_vqmmc_voltages[selector];
+}
+
+static struct regulator_init_data r9a09g057_regulator_init_data = {
+	.constraints = {
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
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
+static const struct renesas_sdhi_quirks sdhi_quirks_r9a09g057 = {
+	.fixed_addr_mode = true,
+	.hs400_disabled = true,
+	.internal_regulator = true,
+	.rdesc = &r9a09g057_vqmmc_regulator,
+	.reg_init_data = &r9a09g057_regulator_init_data,
+};
+
 /*
  * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
  * So, we want to treat them equally and only have a match for ES1.2 to enforce
@@ -260,6 +374,11 @@ static const struct renesas_sdhi_of_data_with_quirks of_rzg2l_compatible = {
 	.quirks = &sdhi_quirks_rzg2l,
 };
 
+static const struct renesas_sdhi_of_data_with_quirks of_r9a09g057_compatible = {
+	.of_data = &of_data_rcar_gen3,
+	.quirks = &sdhi_quirks_r9a09g057,
+};
+
 static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_compatible = {
 	.of_data = &of_data_rcar_gen3,
 };
@@ -284,6 +403,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
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


