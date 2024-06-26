Return-Path: <linux-renesas-soc+bounces-6781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EE7917A13
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 09:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D547B1F214EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 07:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F33D15CD4D;
	Wed, 26 Jun 2024 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pNSsRvqU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF48219FC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719388152; cv=none; b=N58F27QsRFfbgDTA580jZIBNkNsQhU4/0mlqHhzyrH3DoG1MnsrKe7153uQT0qcHINQNoIt++k/gctiBnDx4ZsR+86CV3NEUj25tZ9s3pe3FQ0Delzh74fLDilajVpwhvFzkyTpdJLvteWw+bxCQZM4khdL48JsKmNVi5cXAmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719388152; c=relaxed/simple;
	bh=l+T4MNtFyExPh+zKNUvsER4toWPlSsyojuHGes8B7JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mdv9Le89MPjnUeRP6ou43/G+0vdJf8aQJpv5R0VwNkXARD5v/8hkQYqgoQ53UKaniOobdm7Qqx5k3Z4f9ABERx3WEAZHH9TqxuJ/jT0r9pNmh6X79nCx27zXjVJESbyfI1DWuyoznbH19o5avS+1Q/RcuuVT7fUNuf6g97DJ9Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pNSsRvqU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-424acf3226fso4654635e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 00:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719388148; x=1719992948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mp/HSpo8A/L6CHJBBx1/j+HqjBNFh2q3JBTiPjt97bI=;
        b=pNSsRvqUQ3GJNrqRw04MWBVW0CeVozfY2ZLkUQCzRpzH+3xdDx7T3YGa0etEusYh58
         DDHgD41ZZXHR1kBGVyzFJNlXqnzOnee4RdnYJaqYdV39YrOUB3UjkobEAPXGJMMOumEX
         HPGcmlIngyo8qHssvheGuIXS6y61hKE024Bwcxq38LvZd3hwcmDGvAsX8CcpJYabSuye
         zEiib1IU21hk09WzK0PnruGv7I+sEUd2PG5aC3AAba03k7itVGch6J3sVuA6FIe3xwbt
         FkfMZvmIkbXTM0klyJq//P8FQIwEm/DQ7Le/3AnPwFxzAqUSsqialTlOfSM4lTiVARbM
         JLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719388148; x=1719992948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mp/HSpo8A/L6CHJBBx1/j+HqjBNFh2q3JBTiPjt97bI=;
        b=JZlSt0Z2UCn/e/1RD9Rrrw38C9KmLrPpefUw6mnP2CfCfRuyLOqgBKG84KX/Wv2h9N
         Y56E0DLF4sXPGg9r/NXhFZanTUAhq6jxrnCk0JRviU1hieDvRTpzPuArqGzLV4mbkUsR
         16YL+78Ng2ngq9lor+/MkLQz/h+16RAXHv9uqQ/rE0IU+0eq+PSrisFdTrQNjsGUDtPx
         f8I0r0gDPGbg4L9DsrSee35SrJNvLeZEZI7bQ9M0gm8PP6RFljY/LalVSR76Ax/j9p5Y
         aXtNwhHQbOChp8zamSdO3sxWNwo1An15ShTFadcP/piBSYx1vqVCLazbNBdy33DGqJo5
         anfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdQB5Q3nQA1RiORW1+JzjVqJgho/JHVn++qyLnlOs/Lo3WOS5VczAxQzD/y4C6B+FPv5u+cimA+DP4HZGdxpwvjahrkziv1hrL9zk/PETADvI=
X-Gm-Message-State: AOJu0Yw35T78IYOMgHUeI/sWetOuxTGKe9fHNu14fnAlbmfYHk94GJmy
	UXAHeLo3jhXPE+LjLMh6uZ6sLEqc3pXPyVshiomLfQwDcMG482zdSXQzQgZ+4fQ=
X-Google-Smtp-Source: AGHT+IGrvZVXxfNu1o20h9Kybj8hYHPurBZ1cstXJctpcFMN9kT8IeM34VlywuTyJrD3RJE0bhbHzw==
X-Received: by 2002:a05:600c:17d7:b0:424:a49a:ff0a with SMTP id 5b1f17b1804b1-424a49affc2mr23264655e9.15.1719388148172;
        Wed, 26 Jun 2024 00:49:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8280a87sm15146925e9.24.2024.06.26.00.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 00:49:07 -0700 (PDT)
Message-ID: <868638e9-02e9-485a-a0d2-cdb652a2d072@tuxon.dev>
Date: Wed, 26 Jun 2024 10:49:06 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-mmc@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240624153229.68882-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240624153229.68882-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 24.06.2024 18:32, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The SDHI/eMMC IPs found in the RZ/V2H(P) (a.k.a. r9a09g057) are very
> similar to those found in R-Car Gen3. However, they are not identical,
> necessitating an SoC-specific compatible string for fine-tuning driver
> support.
> 
> Key features of the RZ/V2H(P) SDHI/eMMC IPs include:
> - Voltage level control via the IOVS bit.
> - PWEN pin support via SD_STATUS register.
> - Lack of HS400 support.
> - Fixed address mode operation.
> 
> internal regulator support is added to control the voltage levels of SD
> pins via sd_iovs/sd_pwen bits in SD_STATUS register.
> 
> As the users can use GPIO regulator instead of SD_IOVS/PWEN pins
> 'renesas,sdhi-use-internal-regulator' DT property is used for
> special handling of internal regulator.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

Some minor comments above. Feel free to address them or not.

Thank you,
Claudiu Beznea

> ---
> v2->v3
> - Moved regulator info to renesas_sdhi_of_data instead of quirks
> - Added support to configure the init state of regulator
> - Added function pointers to configure regulator
> - Added REGULATOR_CHANGE_VOLTAGE mask
> 
> v1->v2
> - Now controlling PWEN bit get/set_voltage
> ---
>  drivers/mmc/host/renesas_sdhi.h               |  13 ++
>  drivers/mmc/host/renesas_sdhi_core.c          |  93 +++++++++++
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 150 ++++++++++++++++++
>  drivers/mmc/host/tmio_mmc.h                   |   5 +
>  4 files changed, 261 insertions(+)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 586f94d4dbfd..377804bbc37e 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -11,6 +11,8 @@
>  
>  #include <linux/dmaengine.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
>  #include "tmio_mmc.h"
>  
>  struct renesas_sdhi_scc {
> @@ -35,6 +37,12 @@ struct renesas_sdhi_of_data {
>  	unsigned int max_blk_count;
>  	unsigned short max_segs;
>  	unsigned long sdhi_flags;
> +	struct regulator_desc *rdesc;
> +	struct regulator_init_data *reg_init_data;
> +	bool regulator_init_state;
> +	unsigned int regulator_init_voltage;
> +	int (*regulator_force_endis)(struct regulator_dev *rdev, bool enable);
> +	int (*regulator_force_voltage)(struct regulator_dev *rdev, unsigned int voltage);
>  };
>  
>  #define SDHI_CALIB_TABLE_MAX 32
> @@ -93,6 +101,11 @@ struct renesas_sdhi {
>  	unsigned int tap_set;
>  
>  	struct reset_control *rstc;
> +
> +	bool use_internal_regulator;
> +	struct regulator_dev *internal_regulator;
> +	int (*regulator_force_endis)(struct regulator_dev *rdev, bool enable);
> +	int (*regulator_force_voltage)(struct regulator_dev *rdev, unsigned int voltage);
>  };
>  
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 12f4faaaf4ee..8cf912512f07 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -581,12 +581,50 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
>  
>  	if (!preserve) {
>  		if (priv->rstc) {
> +			bool regulator_enabled;
> +
> +			/* to restore back the internal regulator after reset make a copy of it */
> +			if (priv->use_internal_regulator)
> +				regulator_enabled = regulator_is_enabled(host->mmc->supply.vqmmc);
> +
>  			reset_control_reset(priv->rstc);
>  			/* Unknown why but without polling reset status, it will hang */
>  			read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
>  					  false, priv->rstc);
>  			/* At least SDHI_VER_GEN2_SDR50 needs manual release of reset */
>  			sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
> +			if (priv->use_internal_regulator) {
> +				int voltage;
> +
> +				/*
> +				 * HW reset might have toggled the regulator state in HW
> +				 * which regulator core might be unaware of so restore
> +				 * back the regulator state in HW bypassing the regulator
> +				 * core.
> +				 */
> +				if (regulator_enabled !=
> +				    regulator_is_enabled(host->mmc->supply.vqmmc)) {
> +					ret = priv->regulator_force_endis(priv->internal_regulator,
> +									  regulator_enabled);
> +					if (ret)
> +						dev_err(&host->pdev->dev,
> +							"Failed to %s internal regulator\n",
> +							regulator_enabled ? "enable" : "disable");
> +				}
> +
> +				/* restore back voltage on vqmmc supply */
> +				voltage = regulator_get_voltage(host->mmc->supply.vqmmc);
> +				if (voltage != host->mmc->ios.signal_voltage) {
> +					voltage = host->mmc->ios.signal_voltage ==
> +						  MMC_SIGNAL_VOLTAGE_330 ? 3300000 : 1800000;
> +					ret = regulator_set_voltage(host->mmc->supply.vqmmc,
> +								    voltage, voltage);
> +					if (ret)
> +						dev_err(&host->pdev->dev,
> +							"Failed to set voltage on internal regulator\n");
> +				}
> +			}
> +
>  			priv->needs_adjust_hs400 = false;
>  			renesas_sdhi_set_clock(host, host->clk_cache);
>  
> @@ -904,6 +942,29 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
>  	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
>  }
>  
> +static int renesas_sdhi_internal_dmac_register_regulator(struct platform_device *pdev,
> +							 const struct renesas_sdhi_of_data *of_data)
> +{
> +	struct tmio_mmc_host *host = platform_get_drvdata(pdev);
> +	struct renesas_sdhi *priv = host_to_priv(host);
> +	struct regulator_config rcfg = {
> +		.dev = &pdev->dev,
> +		.driver_data = host,
> +		.init_data = of_data->reg_init_data,
> +	};
> +	const char *devname;
> +
> +	devname = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-vqmmc-regulator",
> +				 dev_name(&pdev->dev));
> +	if (!devname)
> +		return -ENOMEM;
> +
> +	of_data->rdesc->name = devname;
> +	priv->internal_regulator = devm_regulator_register(&pdev->dev, of_data->rdesc, &rcfg);
> +
> +	return PTR_ERR_OR_ZERO(priv->internal_regulator);
> +}
> +
>  int renesas_sdhi_probe(struct platform_device *pdev,
>  		       const struct tmio_mmc_dma_ops *dma_ops,
>  		       const struct renesas_sdhi_of_data *of_data,
> @@ -970,6 +1031,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  	if (IS_ERR(host))
>  		return PTR_ERR(host);
>  
> +	if (pdev->dev.of_node)
> +		priv->use_internal_regulator = of_property_read_bool(pdev->dev.of_node,
> +								     "renesas,sdhi-use-internal-regulator");
> +
>  	if (of_data) {
>  		mmc_data->flags |= of_data->tmio_flags;
>  		mmc_data->ocr_mask = of_data->tmio_ocr_mask;
> @@ -980,6 +1045,18 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  		mmc_data->max_segs = of_data->max_segs;
>  		dma_priv->dma_buswidth = of_data->dma_buswidth;
>  		host->bus_shift = of_data->bus_shift;
> +		if (priv->use_internal_regulator) {
> +			if (!of_data->regulator_force_endis)
> +				return dev_err_probe(&pdev->dev, -EINVAL,
> +					"missing function pointer to force regulator enable/disable");
> +			priv->regulator_force_endis =
> +				of_data->regulator_force_endis;
> +			if (!of_data->regulator_force_voltage)
> +				return dev_err_probe(&pdev->dev, -EINVAL,
> +					"missing function pointer to force regulator voltage");
> +			priv->regulator_force_voltage =
> +				of_data->regulator_force_voltage;
> +		}
>  		/* Fallback for old DTs */
>  		if (!priv->clkh && of_data->sdhi_flags & SDHI_FLAG_NEED_CLKH_FALLBACK)
>  			priv->clkh = clk_get_parent(clk_get_parent(priv->clk));
> @@ -1051,6 +1128,22 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  	if (ret)
>  		goto efree;
>  
> +	if (priv->use_internal_regulator && of_data) {
> +		ret = renesas_sdhi_internal_dmac_register_regulator(pdev, of_data);
> +		if (ret)
> +			goto efree;
> +
> +		/* Set the default init state for regulator in the HW */
> +		ret = priv->regulator_force_endis(priv->internal_regulator,
> +						  of_data->regulator_init_state);
> +		if (ret)
> +			goto efree;
> +		ret = priv->regulator_force_voltage(priv->internal_regulator,
> +						    of_data->regulator_init_voltage);
> +		if (ret)
> +			goto efree;
> +	}
> +
>  	ver = sd_ctrl_read16(host, CTL_VERSION);
>  	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
>  	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 422fa63a2e99..a70a1ae6919c 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -89,6 +89,150 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
>  	},
>  };
>  
> +static const unsigned int r9a09g057_vqmmc_voltages[] = {
> +	1800000, 3300000,
> +};
> +
> +static int r9a09g057_regulator_disable(struct regulator_dev *rdev)
> +{
> +	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
> +	u32 sd_status;
> +
> +	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> +	sd_status &=  ~SD_STATUS_PWEN;

There is an extra space after =

> +	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
> +
> +	return 0;
> +}
> +
> +static int r9a09g057_regulator_enable(struct regulator_dev *rdev)
> +{
> +	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
> +	u32 sd_status;
> +
> +	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> +	sd_status |=  SD_STATUS_PWEN;

Same here.

> +	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
> +
> +	return 0;
> +}
> +
> +static int r9a09g057_regulator_force_endis(struct regulator_dev *rdev, bool enable)
> +{
> +	if (enable)
> +		return r9a09g057_regulator_enable(rdev);
> +
> +	return r9a09g057_regulator_disable(rdev);
> +}
> +
> +static int r9a09g057_regulator_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
> +	u32 sd_status;
> +
> +	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> +	if (sd_status & SD_STATUS_PWEN)
> +		return 1;
> +
> +	return 0;

Could be re-written as:

	return !!(sd_status & SD_STATUS_PWEN)

> +}
> +
> +static int r9a09g057_regulator_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
> +	u32 sd_status;
> +
> +	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> +	if (sd_status & SD_STATUS_IOVS)
> +		return 1800000;
> +
> +	return 3300000;
> +}
> +
> +static int r9a09g057_regulator_set_voltage(struct regulator_dev *rdev,
> +					   int min_uV, int max_uV,
> +					   unsigned int *selector)
> +{
> +	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
> +	u32 sd_status;
> +
> +	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> +	if (min_uV >= 1700000 && max_uV <= 1950000) {
> +		sd_status |=  SD_STATUS_IOVS;
> +		*selector = 0;
> +	} else {
> +		sd_status &=  ~SD_STATUS_IOVS;
> +		*selector = 1;
> +	}
> +	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
> +
> +	return 0;
> +}
> +
> +static int r9a09g057_regulator_force_voltage(struct regulator_dev *rdev,
> +					     unsigned int voltage)
> +{
> +	unsigned int selector = 0;
> +
> +	return r9a09g057_regulator_set_voltage(rdev, voltage, voltage, &selector);
> +}
> +
> +static int r9a09g057_regulator_list_voltage(struct regulator_dev *rdev,
> +					    unsigned int selector)
> +{
> +	if (selector >= ARRAY_SIZE(r9a09g057_vqmmc_voltages))
> +		return -EINVAL;
> +
> +	return r9a09g057_vqmmc_voltages[selector];
> +}
> +
> +static struct regulator_init_data r9a09g057_regulator_init_data = {
> +	.constraints = {
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS | REGULATOR_CHANGE_VOLTAGE,
> +	},
> +};
> +
> +static const struct regulator_ops r9a09g057_regulator_voltage_ops = {
> +	.enable = r9a09g057_regulator_enable,
> +	.disable = r9a09g057_regulator_disable,
> +	.is_enabled = r9a09g057_regulator_is_enabled,
> +	.list_voltage = r9a09g057_regulator_list_voltage,
> +	.get_voltage = r9a09g057_regulator_get_voltage,
> +	.set_voltage = r9a09g057_regulator_set_voltage,
> +	.map_voltage = regulator_map_voltage_ascend,
> +};
> +
> +static struct regulator_desc r9a09g057_vqmmc_regulator = {
> +	.of_match	= of_match_ptr("vqmmc-r9a09g057-regulator"),
> +	.owner		= THIS_MODULE,
> +	.type		= REGULATOR_VOLTAGE,
> +	.ops		= &r9a09g057_regulator_voltage_ops,
> +	.volt_table	= r9a09g057_vqmmc_voltages,
> +	.n_voltages	= ARRAY_SIZE(r9a09g057_vqmmc_voltages),
> +};
> +
> +static const struct renesas_sdhi_of_data of_data_r9a09g057 = {
> +	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> +			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
> +	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> +			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
> +	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
> +	.bus_shift	= 2,
> +	.scc_offset	= 0x1000,
> +	.taps		= rcar_gen3_scc_taps,
> +	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
> +	/* DMAC can handle 32bit blk count but only 1 segment */
> +	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
> +	.max_segs	= 1,
> +	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
> +	.rdesc = &r9a09g057_vqmmc_regulator,
> +	.reg_init_data = &r9a09g057_regulator_init_data,
> +	.regulator_init_state = false,
> +	.regulator_init_voltage = 3300000,
> +	.regulator_force_endis = r9a09g057_regulator_force_endis,
> +	.regulator_force_voltage = r9a09g057_regulator_force_voltage,
> +};
> +
>  static const struct renesas_sdhi_of_data of_data_rza2 = {
>  	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
>  			  TMIO_MMC_HAVE_CBSY,
> @@ -260,6 +404,11 @@ static const struct renesas_sdhi_of_data_with_quirks of_rzg2l_compatible = {
>  	.quirks = &sdhi_quirks_rzg2l,
>  };
>  
> +static const struct renesas_sdhi_of_data_with_quirks of_r9a09g057_compatible = {
> +	.of_data = &of_data_r9a09g057,
> +	.quirks = &sdhi_quirks_rzg2l,
> +};
> +
>  static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_compatible = {
>  	.of_data = &of_data_rcar_gen3,
>  };
> @@ -284,6 +433,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
>  	{ .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
>  	{ .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
>  	{ .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
> +	{ .compatible = "renesas,sdhi-r9a09g057", .data = &of_r9a09g057_compatible, },
>  	{ .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
>  	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
>  	{ .compatible = "renesas,rcar-gen4-sdhi", .data = &of_rcar_gen3_compatible, },
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index de56e6534aea..1a3172786662 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -43,6 +43,7 @@
>  #define CTL_RESET_SD 0xe0
>  #define CTL_VERSION 0xe2
>  #define CTL_SDIF_MODE 0xe6 /* only known on R-Car 2+ */
> +#define CTL_SD_STATUS 0xf2 /* only known on RZ/G2L and RZ/V2H(P) */
>  
>  /* Definitions for values the CTL_STOP_INTERNAL_ACTION register can take */
>  #define TMIO_STOP_STP		BIT(0)
> @@ -102,6 +103,10 @@
>  /* Definitions for values the CTL_SDIF_MODE register can take */
>  #define SDIF_MODE_HS400		BIT(0) /* only known on R-Car 2+ */
>  
> +/* Definitions for values the CTL_SD_STATUS register can take */
> +#define SD_STATUS_PWEN		BIT(0) /* only known on RZ/V2H(P) */
> +#define SD_STATUS_IOVS		BIT(16) /* only known on RZ/V2H(P) */
> +
>  /* Define some IRQ masks */
>  /* This is the mask used at reset by the chip */
>  #define TMIO_MASK_ALL           0x837f031d

