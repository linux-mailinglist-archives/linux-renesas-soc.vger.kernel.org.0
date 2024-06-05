Return-Path: <linux-renesas-soc+bounces-5849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6C08FC506
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 09:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93A582819D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 07:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E70A191462;
	Wed,  5 Jun 2024 07:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9MS58qb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D6018F2CF;
	Wed,  5 Jun 2024 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573794; cv=none; b=JIdldrX/poswf6jp2jVk7oKzKS+R4KlG7B8Gir5TBU7GzFuKSiWpa0YYj61QJmZTnVibUVJXnoosbkpN8YnJ0BbhxTCJfY/q9+MlF+6MGIwQDNkdalIxYDhnsiHoRvrxciCY7BqlI6O63NLEWEYDA4tkrsCWsfERu7EaO2g/ALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573794; c=relaxed/simple;
	bh=ykxUPT80WdLC6iVgJGza9Nht0TsgDhu9nODeCPkaH/M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u4BxqP8UbGEYSK+KlNs2y6soB6G1s6E7QPWGdCn1TB8jbgzB0OCweCjUjIxDYnayykoqlDwS44luRDPyUFFOW0l7xP9AM7BWlH1tb/NPsT3BpEbYi4A9j5PLrYgsGpGLMuzLagdCba1UVfRA+Ss+EroUj6eE2jiQD2TXfsAQb2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9MS58qb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-35e5604abdcso348084f8f.0;
        Wed, 05 Jun 2024 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717573791; x=1718178591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bmzy38dC9NVmz8wfo1K/I35iVA7xhkjqhd0v2ieluDA=;
        b=g9MS58qbwQ+/FLYSms9m1c5qtFhnbzLq8L447tyKjCAbT/QIxo9nKI7G2La9c35MPh
         IkHpVgAbQXOTHR8LDWpqNRqMSVYlzW+I5pXB6RTLi5OZBgKZl4cGQB8ZodIyWPvz3KJC
         SMZt08RxAusy+CdPY/XRcrQcTuU28YrZcLLGD77xGUaCRtqZqm+8l0TEMnghCenvl+e+
         3+eOmXjBCihRlgtO1nLKAyjHAmgc07TCnTIdIiSbXKvuTWcSL7fTnOh1LpMQLiHl7aoC
         +B23DgmVsYqJKwc4hVuUiseMaaGyAKjqaCsxjNYx+5rX/EbG5IJgQg0sohOANfeUwjDq
         Anlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573791; x=1718178591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bmzy38dC9NVmz8wfo1K/I35iVA7xhkjqhd0v2ieluDA=;
        b=M+EKH61BqFyLsd6meAjjtYBYmYpbzYeiETHMzsqtbRDNOrLu+me2moAOBeugeTKR1o
         Mj5dutjMvZpmUXNMr3zXd7VfHnGwmiG+d1YFt1rQcxQTaw2NeWJvP+nVoZIMEDWXzcYl
         UIcIkOFJW4sOzDmHvI49oxB5knkTrLDVy8GMujHaHPZb+dvYW+8acrtOW2MiGyIs15Ct
         OOffC6YIiRH8m18gQ4kRgC0oWruyctFKtoiuajAPzLL1k+6L0om1Ak3ADD0b3tHWXQu8
         /JIKCuR7Ql2hOIXS98dSeF4viqcZi1p6PQT4bsmYgX/xG4odVByemuk7/hi3G4ymA0Cj
         +KgA==
X-Forwarded-Encrypted: i=1; AJvYcCV8gHrGy7I6CZtqiehjv+eZMNWa8As7HQ4ntRbltWxG6/3ACzp/v+IQXtK6k1DOVfD6BJN2SlNm5Vvz7U/UZoFpcl2A1N9y+5evWG8AYrfIQSI31Bw9AAFW22Prth3rqjn05QjiUA02/wspNqNUIYgyHzwTQe+gN+I3QLh5O3xu2PAXez2ejZ758dtC
X-Gm-Message-State: AOJu0YwiF+Sq5QQD2aNw7xMgdmK+4LxB9gn8YNRJmM8i5dPt8ZbCqVMq
	NAMMnq8z/xZqZlg/F3h++qdHduXKn9IKxvefTVtImM8S21z3QSh/
X-Google-Smtp-Source: AGHT+IEN48oPTM78VBqS88rsUuacvp+1LUBIFE6OWkcKa8sDlnvXZz4thNnTaPIhKwhLBPRWQJiCCQ==
X-Received: by 2002:a05:6000:e0b:b0:357:d26a:4f71 with SMTP id ffacd0b85a97d-35e839f4098mr1447649f8f.31.1717573790646;
        Wed, 05 Jun 2024 00:49:50 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd064bbb1sm13527200f8f.101.2024.06.05.00.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:49:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Date: Wed,  5 Jun 2024 08:49:36 +0100
Message-Id: <20240605074936.578687-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

sd_iovs and sd_pwen quirks are introduced for SoCs supporting this bit
to handle voltage level control and power enable via SD_STATUS register.

regulator support is added to control the volatage levels of SD pins
via sd_iovs bit in SD_STATUS register.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi.h               |  7 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 67 +++++++++++++++++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 45 +++++++++++++
 drivers/mmc/host/tmio_mmc.h                   |  4 ++
 4 files changed, 118 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 586f94d4dbfd..9ef4fdf44280 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -11,6 +11,8 @@
 
 #include <linux/dmaengine.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
 #include "tmio_mmc.h"
 
 struct renesas_sdhi_scc {
@@ -49,6 +51,11 @@ struct renesas_sdhi_quirks {
 	bool manual_tap_correction;
 	bool old_info1_layout;
 	u32 hs400_bad_taps;
+	bool sd_iovs;
+	bool sd_pwen;
+	struct regulator_desc *rdesc;
+	const struct regmap_config *rdesc_regmap_config;
+	unsigned int rdesc_offset;
 	const u8 (*hs400_calib_table)[SDHI_CALIB_TABLE_MAX];
 };
 
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 12f4faaaf4ee..2eeea9513a23 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -248,6 +248,19 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 		 TMIO_STAT_DAT0);
 }
 
+static void renesas_sdhi_sd_status_pwen(struct tmio_mmc_host *host, bool on)
+{
+	u32 sd_status;
+
+	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
+	if (on)
+		sd_status |=  SD_STATUS_PWEN;
+	else
+		sd_status &=  ~SD_STATUS_PWEN;
+
+	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
+}
+
 static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
 						    struct mmc_ios *ios)
 {
@@ -587,6 +600,9 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 					  false, priv->rstc);
 			/* At least SDHI_VER_GEN2_SDR50 needs manual release of reset */
 			sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
+			if (sdhi_has_quirk(priv, sd_pwen))
+				renesas_sdhi_sd_status_pwen(host, true);
+
 			priv->needs_adjust_hs400 = false;
 			renesas_sdhi_set_clock(host, host->clk_cache);
 
@@ -904,6 +920,34 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
 }
 
+static int renesas_sdhi_internal_dmac_register_regulator(struct platform_device *pdev,
+							 const struct renesas_sdhi_quirks *quirks)
+{
+	struct tmio_mmc_host *host = platform_get_drvdata(pdev);
+	struct renesas_sdhi *priv = host_to_priv(host);
+	struct regulator_config rcfg = {
+		.dev = &pdev->dev,
+		.driver_data = priv,
+	};
+	struct regulator_dev *rdev;
+	const char *devname;
+
+	devname = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-vqmmc-regulator",
+				 dev_name(&pdev->dev));
+	if (!devname)
+		return -ENOMEM;
+
+	quirks->rdesc->name = devname;
+	rcfg.regmap = devm_regmap_init_mmio(&pdev->dev, host->ctl + quirks->rdesc_offset,
+					    quirks->rdesc_regmap_config);
+	if (IS_ERR(rcfg.regmap))
+		return PTR_ERR(rcfg.regmap);
+
+	rdev = devm_regulator_register(&pdev->dev, quirks->rdesc, &rcfg);
+
+	return PTR_ERR_OR_ZERO(rdev);
+}
+
 int renesas_sdhi_probe(struct platform_device *pdev,
 		       const struct tmio_mmc_dma_ops *dma_ops,
 		       const struct renesas_sdhi_of_data *of_data,
@@ -1051,6 +1095,15 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ret)
 		goto efree;
 
+	if (sdhi_has_quirk(priv, sd_iovs)) {
+		ret = renesas_sdhi_internal_dmac_register_regulator(pdev, quirks);
+		if (ret)
+			goto efree;
+	}
+
+	if (sdhi_has_quirk(priv, sd_pwen))
+		renesas_sdhi_sd_status_pwen(host, true);
+
 	ver = sd_ctrl_read16(host, CTL_VERSION);
 	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
 	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
@@ -1110,26 +1163,26 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	num_irqs = platform_irq_count(pdev);
 	if (num_irqs < 0) {
 		ret = num_irqs;
-		goto eirq;
+		goto epwen;
 	}
 
 	/* There must be at least one IRQ source */
 	if (!num_irqs) {
 		ret = -ENXIO;
-		goto eirq;
+		goto epwen;
 	}
 
 	for (i = 0; i < num_irqs; i++) {
 		irq = platform_get_irq(pdev, i);
 		if (irq < 0) {
 			ret = irq;
-			goto eirq;
+			goto epwen;
 		}
 
 		ret = devm_request_irq(&pdev->dev, irq, tmio_mmc_irq, 0,
 				       dev_name(&pdev->dev), host);
 		if (ret)
-			goto eirq;
+			goto epwen;
 	}
 
 	ret = tmio_mmc_host_probe(host);
@@ -1141,7 +1194,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	return ret;
 
-eirq:
+epwen:
+	if (sdhi_has_quirk(priv, sd_pwen))
+		renesas_sdhi_sd_status_pwen(host, false);
 	tmio_mmc_host_remove(host);
 edisclk:
 	renesas_sdhi_clk_disable(host);
@@ -1157,6 +1212,8 @@ void renesas_sdhi_remove(struct platform_device *pdev)
 	struct tmio_mmc_host *host = platform_get_drvdata(pdev);
 
 	tmio_mmc_host_remove(host);
+	if (sdhi_has_quirk(host_to_priv(host), sd_pwen))
+		renesas_sdhi_sd_status_pwen(host, false);
 	renesas_sdhi_clk_disable(host);
 	tmio_mmc_host_free(host);
 }
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 422fa63a2e99..f824d167bb09 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -215,6 +215,45 @@ static const struct renesas_sdhi_quirks sdhi_quirks_rzg2l = {
 	.hs400_disabled = true,
 };
 
+static const unsigned int r9a09g057_vqmmc_voltages[] = {
+	3300000, 1800000,
+};
+
+static const struct regulator_ops r9a09g057_regulator_voltage_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_descend,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+};
+
+static struct regulator_desc r9a09g057_vqmmc_regulator = {
+	.of_match	= of_match_ptr("vqmmc-r9a09g057-regulator"),
+	.owner		= THIS_MODULE,
+	.type		= REGULATOR_VOLTAGE,
+	.ops		= &r9a09g057_regulator_voltage_ops,
+	.volt_table	= r9a09g057_vqmmc_voltages,
+	.n_voltages	= ARRAY_SIZE(r9a09g057_vqmmc_voltages),
+	.vsel_mask	= 0x10000,
+	.vsel_reg	= 0,
+};
+
+static const struct regmap_config r9a09g057_vqmmc_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 1,
+};
+
+static const struct renesas_sdhi_quirks sdhi_quirks_r9a09g057 = {
+	.fixed_addr_mode = true,
+	.hs400_disabled = true,
+	.sd_iovs = true,
+	.sd_pwen = true,
+	.rdesc = &r9a09g057_vqmmc_regulator,
+	.rdesc_regmap_config = &r9a09g057_vqmmc_regmap_config,
+	.rdesc_offset = 0x3C8,
+};
+
 /*
  * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
  * So, we want to treat them equally and only have a match for ES1.2 to enforce
@@ -260,6 +299,11 @@ static const struct renesas_sdhi_of_data_with_quirks of_rzg2l_compatible = {
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
@@ -284,6 +328,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
 	{ .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
+	{ .compatible = "renesas,sdhi-r9a09g057", .data = &of_r9a09g057_compatible, },
 	{ .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,rcar-gen4-sdhi", .data = &of_rcar_gen3_compatible, },
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index de56e6534aea..d03aedf61aa3 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -43,6 +43,7 @@
 #define CTL_RESET_SD 0xe0
 #define CTL_VERSION 0xe2
 #define CTL_SDIF_MODE 0xe6 /* only known on R-Car 2+ */
+#define CTL_SD_STATUS 0xf2 /* only known on RZ/G2L and RZ/V2H(P) */
 
 /* Definitions for values the CTL_STOP_INTERNAL_ACTION register can take */
 #define TMIO_STOP_STP		BIT(0)
@@ -102,6 +103,9 @@
 /* Definitions for values the CTL_SDIF_MODE register can take */
 #define SDIF_MODE_HS400		BIT(0) /* only known on R-Car 2+ */
 
+/* Definitions for values the CTL_SD_STATUS register can take */
+#define SD_STATUS_PWEN		BIT(0) /* only known on RZ/V2H(P) */
+
 /* Define some IRQ masks */
 /* This is the mask used at reset by the chip */
 #define TMIO_MASK_ALL           0x837f031d
-- 
2.34.1


