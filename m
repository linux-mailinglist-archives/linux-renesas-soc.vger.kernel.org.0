Return-Path: <linux-renesas-soc+bounces-19572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE7DB07F55
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 23:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375A93A15E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 21:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F65291C06;
	Wed, 16 Jul 2025 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9alFGzo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E61E290DA1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Jul 2025 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752700290; cv=none; b=Th3DfWSZwYHz7utC09vFIXdoQ5NaU/6Za2C+sTdLI9vAh9CKJWdmYdBkIUnPsl/i1xi7rY9yQk+Q9A/XAYy6O8GK8FLZqDWDM8MDQuIHhVclvpLEgaGTzUhZ50a8S7JOWjKx2SpNR4jW4tSOUQ35SVz04CqG7Vz1BS05AdimmI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752700290; c=relaxed/simple;
	bh=khIpO9nEi5JNAN+84qJe8YJsbNQ5sLQK5mEclr5WCkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0cBxMgkWtUOAigwjsPrSteZ0GrEbuQ+dBvdGrzXFJcT+Ql5zdSqjc4RgRnK5s/suordWGQln4gQ4fk72OgbLzEESlq6lgOsg9uE593GFhRYtRc2cb/Js3Nr3F2+eNSUn6K7vJB9hGbkzJ2Xl4nmVilhaSye5yOG9tF/xQgiAss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r9alFGzo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso183247f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Jul 2025 14:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752700287; x=1753305087; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cYWXOrwNiK0Go9DsX9otPJZKea4HQNwTD7zd0doQnOc=;
        b=r9alFGzoDyF+SWoiNWW7rTnTyrWHJDRTjjgITnHFGNik2BqcBAytnnEHgIAIlkuyaq
         YvD4XCJ4cZ9IN3PERGyh2ohEAb4igiMstn+QS5ysHF9eouxyV/7+R4zSLvzgZUfx3QvP
         gAmVkXAua0VaF4zZwPaTtK3bs7p5hp1DbGRwLfnQ18U9OmvrPczc4+yS1SKwacxZ4/Pl
         nt+ty0qpoX1waHsbvJdt3RhRGvIeOyjr1qlKu0mtftCYSw3qUHov2/8SvsPj6OuX9Upb
         oM17Z/WjyiwE/MS6W4FH5p099AhqsNdkhZ+/rY9byA7ZnpUgXG3Ub9+kYB+np8I0CK8G
         PNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752700287; x=1753305087;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cYWXOrwNiK0Go9DsX9otPJZKea4HQNwTD7zd0doQnOc=;
        b=wSu1DFBym9LaE7YHkD78GBpbMo7jKoff/6hT7O0xTzPFm6ER48azMJmOM6zAfVh/rW
         jM6RVqY9QtyEwYWbXjVjfgDuI3l76zo0Zzi183QvPLKDbiOFWbfpoZoBRqQS38cqTv2P
         OYWZ8XY88YVSU5TK2E1paqgnUeLHLdJBVQP4DnVEKDSoKFb4qjzSfjxl8zNzc2LA1pI4
         UadCfvyaUkj3alX3RmYrpfiKjDmp6ROd/guCfqY31PKInuPOfFMxkGiJYf6pJSUku6ft
         jnRmovy0Ux7WuRSewtmnpjRWE8QOCyIj3nZhkET4s/IzbbVyKMip7NuEuiR7GRSwESUq
         oTjw==
X-Forwarded-Encrypted: i=1; AJvYcCVn03J/904/QKT+1csKqavay7u6bwsQXUWXC34jYErjG/KFhBAlTj1wef6Li9fAdz6r17A4XMLoK+Zw0cn0d8wA6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw9yTEYrF/HkOXdCi/ayUWZnwywprMAYejm4Xy6pQhBsgedL3F
	uywIIBYQ/uu9JU5JqhnKfQBqvFMJMjC1nm9pLLIcIZmRFlk3ciUmZgECCbujXsZ8G6g=
X-Gm-Gg: ASbGncuf1fdajRJ5YUBFTkGn+XSRVR733KBicVooRSX3UF+NjGF6jJru00m0CWz4VbT
	bwv6O/9W2/Vi+B0QdFPHOrLq+9tqiLBonreEO45kMH249eRUu4C9xLsiXFsC2rzGNJfxMM/dlrp
	xYBLWZsqJmLh4hU2wTJsaQ1XJyl+mPxVzVeJH3TW2vfFmXvC/rtKUzvt68hG66zNFPj2XOe/TuC
	87Zzlzf0UyuDSemr8tChdx4QqiEuoeACBp5P28ua6bm08pDGqpAQs2gFPpECOycswVWWldUFGe3
	m3qIOdgiKVsv6CBUTU0v2MdGfoNfieuT7wtZ4ohW0AsIR5knYKfjgX+cwofwvnJvtlK1s6dhavE
	51KNGn9Hv+6nGu1unruQRLmFHxAp/pe2+v6kiWz4SVMzxW5pH6EDdcfUrU5t2
X-Google-Smtp-Source: AGHT+IEbtnGkx+XfY6oPS27DeBh2gAEVWp32K89aS6BpC+8luM0wQ46Jt/i5p231dSJ/9oZhKVLoBg==
X-Received: by 2002:a5d:5f02:0:b0:3a4:f520:8bfc with SMTP id ffacd0b85a97d-3b613e984aemr311543f8f.36.1752700286621;
        Wed, 16 Jul 2025 14:11:26 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1e4fsm18700417f8f.21.2025.07.16.14.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 14:11:25 -0700 (PDT)
Date: Wed, 16 Jul 2025 23:11:23 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org,
	rafael@kernel.org, biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org, john.madieu@gmail.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, lukasz.luba@arm.com,
	magnus.damm@gmail.com, robh@kernel.org, rui.zhang@intel.com,
	sboyd@kernel.org, niklas.soderlund+renesas@ragnatech.se
Subject: Re: [PATCH v6 3/5] thermal: renesas: rzg3e: Add thermal driver for
 the Renesas RZ/G3E SoC
Message-ID: <aHgVe0YwPWapIYed@mai.linaro.org>
References: <20250522182252.1593159-1-john.madieu.xa@bp.renesas.com>
 <20250522182252.1593159-4-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250522182252.1593159-4-john.madieu.xa@bp.renesas.com>

On Thu, May 22, 2025 at 08:22:46PM +0200, John Madieu wrote:
> The RZ/G3E SoC integrates a Temperature Sensor Unit (TSU) block designed
> to monitor the chip's junction temperature. This sensor is connected to
> channel 1 of the APB port clock/reset and provides temperature measurements.
> 
> It also requires calibration values stored in the system controller registers
> for accurate temperature measurement. Add a driver for the Renesas RZ/G3E TSU.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v1 -> v2: fixes IRQ names
> v2 -> v3: no changes
> v3 -> v4: no changes
> v5: removes curly braces arround single-line protected scoped guards
> v6: Clarified comments in driver
> 
>  MAINTAINERS                             |   7 +
>  drivers/thermal/renesas/Kconfig         |   7 +
>  drivers/thermal/renesas/Makefile        |   1 +
>  drivers/thermal/renesas/rzg3e_thermal.c | 443 ++++++++++++++++++++++++
>  4 files changed, 458 insertions(+)
>  create mode 100644 drivers/thermal/renesas/rzg3e_thermal.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 79a8e2c73908..eb11494795e8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21161,6 +21161,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/potentiometer/renesas,x9250.yaml
>  F:	drivers/iio/potentiometer/x9250.c
>  
> +RENESAS RZ/G3E THERMAL SENSOR UNIT DRIVER
> +M:	John Madieu <john.madieu.xa@bp.renesas.com>
> +L:	linux-pm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> +F:	drivers/thermal/renesas/rzg3e_thermal.c
> +
>  RESET CONTROLLER FRAMEWORK
>  M:	Philipp Zabel <p.zabel@pengutronix.de>
>  S:	Maintained
> diff --git a/drivers/thermal/renesas/Kconfig b/drivers/thermal/renesas/Kconfig
> index dcf5fc5ae08e..10cf90fc4bfa 100644
> --- a/drivers/thermal/renesas/Kconfig
> +++ b/drivers/thermal/renesas/Kconfig
> @@ -26,3 +26,10 @@ config RZG2L_THERMAL
>  	help
>  	  Enable this to plug the RZ/G2L thermal sensor driver into the Linux
>  	  thermal framework.
> +
> +config RZG3E_THERMAL
> +	tristate "Renesas RZ/G3E thermal driver"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	help
> +	  Enable this to plug the RZ/G3E thermal sensor driver into the Linux
> +	  thermal framework.
> diff --git a/drivers/thermal/renesas/Makefile b/drivers/thermal/renesas/Makefile
> index bf9cb3cb94d6..5a3eba0dedd0 100644
> --- a/drivers/thermal/renesas/Makefile
> +++ b/drivers/thermal/renesas/Makefile
> @@ -3,3 +3,4 @@
>  obj-$(CONFIG_RCAR_GEN3_THERMAL)	+= rcar_gen3_thermal.o
>  obj-$(CONFIG_RCAR_THERMAL)	+= rcar_thermal.o
>  obj-$(CONFIG_RZG2L_THERMAL)	+= rzg2l_thermal.o
> +obj-$(CONFIG_RZG3E_THERMAL)	+= rzg3e_thermal.o
> diff --git a/drivers/thermal/renesas/rzg3e_thermal.c b/drivers/thermal/renesas/rzg3e_thermal.c
> new file mode 100644
> index 000000000000..348229da9ef4
> --- /dev/null
> +++ b/drivers/thermal/renesas/rzg3e_thermal.c
> @@ -0,0 +1,443 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G3E TSU Temperature Sensor Unit
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation
> + */
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/thermal.h>
> +#include <linux/units.h>
> +
> +#include "../thermal_hwmon.h"
> +
> +/* SYS Trimming register offsets macro */
> +#define SYS_TSU_TRMVAL(x) (0x330 + (x) * 4)
> +
> +/* TSU Register offsets and bits */
> +#define TSU_SSUSR		0x00
> +#define TSU_SSUSR_EN_TS		BIT(0)
> +#define TSU_SSUSR_ADC_PD_TS	BIT(1)
> +#define TSU_SSUSR_SOC_TS_EN	BIT(2)
> +
> +#define TSU_STRGR		0x04
> +#define TSU_STRGR_ADST		BIT(0)
> +
> +#define TSU_SOSR1		0x08
> +#define TSU_SOSR1_ADCT_8	0x03
> +#define TSU_SOSR1_OUTSEL_AVERAGE	BIT(9)
> +
> +/* Sensor Code Read Register */
> +#define TSU_SCRR		0x10
> +#define TSU_SCRR_OUT12BIT_TS	GENMASK(11, 0)
> +
> +/* Sensor Status Register */
> +#define TSU_SSR			0x14
> +#define TSU_SSR_CONV_RUNNING	BIT(0)
> +
> +/* Compare Mode Setting Register */
> +#define TSU_CMSR		0x18
> +#define TSU_CMSR_CMPEN		BIT(0)
> +#define TSU_CMSR_CMPCOND	BIT(1)
> +
> +/* Lower Limit Setting Register */
> +#define TSU_LLSR		0x1C
> +#define TSU_LLSR_LIM		GENMASK(11, 0)
> +
> +/* Upper Limit Setting Register */
> +#define TSU_ULSR		0x20
> +#define TSU_ULSR_ULIM		GENMASK(11, 0)
> +
> +/* Interrupt Status Register */
> +#define TSU_SISR		0x30
> +#define TSU_SISR_ADF		BIT(0)
> +#define TSU_SISR_CMPF		BIT(1)
> +
> +/* Interrupt Enable Register */
> +#define TSU_SIER		0x34
> +#define TSU_SIER_ADIE		BIT(0)
> +#define TSU_SIER_CMPIE		BIT(1)
> +
> +/* Interrupt Clear Register */
> +#define TSU_SICR		0x38
> +#define TSU_SICR_ADCLR		BIT(0)
> +#define TSU_SICR_CMPCLR		BIT(1)
> +
> +/* Temperature calculation constants */
> +#define TSU_D		41
> +#define TSU_E		126
> +#define TSU_TRMVAL_MASK	GENMASK(11, 0)
> +
> +#define TSU_POLL_DELAY_US	50
> +#define TSU_TIMEOUT_US		10000
> +#define TSU_MIN_CLOCK_RATE	24000000
> +
> +/**
> + * struct rzg3e_thermal_priv - RZ/G3E thermal private data structure
> + * @base: TSU base address
> + * @dev: device pointer
> + * @syscon: regmap for calibration values
> + * @zone: thermal zone pointer
> + * @mode: current tzd mode
> + * @conv_complete: ADC conversion completion
> + * @reg_lock: protect shared register access
> + * @cached_temp: last computed temperature (milliCelsius)
> + * @trmval: trim (calibration) values
> + */
> +struct rzg3e_thermal_priv {
> +	void __iomem *base;
> +	struct device *dev;
> +	struct regmap *syscon;
> +	struct thermal_zone_device *zone;
> +	enum thermal_device_mode mode;
> +	struct completion conv_complete;
> +	spinlock_t reg_lock;
> +	int cached_temp;
> +	u32 trmval[2];
> +};
> +
> +static void rzg3e_thermal_hw_disable(struct rzg3e_thermal_priv *priv)
> +{
> +	/* Disable all interrupts first */
> +	writel(0, priv->base + TSU_SIER);
> +	/* Clear any pending interrupts */
> +	writel(TSU_SICR_ADCLR | TSU_SICR_CMPCLR, priv->base + TSU_SICR);
> +	/* Put device in power down */
> +	writel(TSU_SSUSR_ADC_PD_TS, priv->base + TSU_SSUSR);
> +}
> +
> +static void rzg3e_thermal_hw_enable(struct rzg3e_thermal_priv *priv)
> +{
> +	/* First clear any pending status */
> +	writel(TSU_SICR_ADCLR | TSU_SICR_CMPCLR, priv->base + TSU_SICR);
> +	/* Disable all interrupts */
> +	writel(0, priv->base + TSU_SIER);
> +
> +	/* Enable thermal sensor */
> +	writel(TSU_SSUSR_SOC_TS_EN | TSU_SSUSR_EN_TS, priv->base + TSU_SSUSR);
> +	/* Setup for averaging mode with 8 samples */
> +	writel(TSU_SOSR1_OUTSEL_AVERAGE | TSU_SOSR1_ADCT_8, priv->base + TSU_SOSR1);
> +}
> +
> +static irqreturn_t rzg3e_thermal_cmp_irq(int irq, void *dev_id)
> +{
> +	struct rzg3e_thermal_priv *priv = dev_id;
> +	u32 status;
> +
> +	status = readl(priv->base + TSU_SISR);
> +	if (!(status & TSU_SISR_CMPF))
> +		return IRQ_NONE;
> +
> +	/* Clear the comparison interrupt flag */
> +	writel(TSU_SICR_CMPCLR, priv->base + TSU_SICR);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static irqreturn_t rzg3e_thermal_cmp_threaded_irq(int irq, void *dev_id)
> +{
> +	struct rzg3e_thermal_priv *priv = dev_id;
> +
> +	thermal_zone_device_update(priv->zone, THERMAL_EVENT_UNSPECIFIED);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t rzg3e_thermal_adc_irq(int irq, void *dev_id)
> +{
> +	struct rzg3e_thermal_priv *priv = dev_id;
> +	u32 status;
> +	u32 result;
> +
> +	/* Check if this is our interrupt */
> +	status = readl(priv->base + TSU_SISR);
> +	if (!(status & TSU_SISR_ADF))
> +		return IRQ_NONE;
> +
> +	/* Disable all interrupts */
> +	writel(0, priv->base + TSU_SIER);
> +	/* Clear conversion complete interrupt */
> +	writel(TSU_SICR_ADCLR, priv->base + TSU_SICR);
> +
> +	/* Read ADC conversion result */
> +	result = readl(priv->base + TSU_SCRR) & TSU_SCRR_OUT12BIT_TS;
> +
> +	/*
> +	 * Calculate temperature using compensation formula
> +	 * Section 7.11.7.8 (Temperature Compensation Calculation)
> +	 *
> +	 * T(°C) = ((e - d) / (c -b)) * (a - b) + d
> +	 *
> +	 * a = 12 bits temperature code read from the sensor
> +	 * b = SYS trmval[0]
> +	 * c = SYS trmval[1]
> +	 * d = -41
> +	 * e = 126
> +	 */
> +	s64 temp_val = div_s64(((TSU_E + TSU_D) * (s64)(result - priv->trmval[0])),
> +				priv->trmval[1] - priv->trmval[0]) - TSU_D;
> +	int new_temp = temp_val * MILLIDEGREE_PER_DEGREE;
> +
> +	scoped_guard(spinlock_irqsave, &priv->reg_lock)
> +		priv->cached_temp = new_temp;
> +
> +	complete(&priv->conv_complete);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int rzg3e_thermal_get_temp(struct thermal_zone_device *zone, int *temp)
> +{
> +	struct rzg3e_thermal_priv *priv = thermal_zone_device_priv(zone);
> +	u32 val;
> +	int ret;
> +
> +	if (priv->mode == THERMAL_DEVICE_DISABLED)
> +		return -EBUSY;

Why ?

> +	reinit_completion(&priv->conv_complete);
> +
> +	/* Enable ADC interrupt */
> +	writel(TSU_SIER_ADIE, priv->base + TSU_SIER);

Why enable irq here ?

> +	/* Verify no ongoing conversion */
> +	ret = readl_poll_timeout_atomic(priv->base + TSU_SSR, val,
> +					!(val & TSU_SSR_CONV_RUNNING),
> +					TSU_POLL_DELAY_US, TSU_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(priv->dev, "ADC conversion timed out\n");
> +		return ret;
> +	}
> +
> +	/* Start conversion */
> +	writel(TSU_STRGR_ADST, priv->base + TSU_STRGR);
> +
> +	if (!wait_for_completion_timeout(&priv->conv_complete,
> +					 msecs_to_jiffies(100))) {
> +		dev_err(priv->dev, "ADC conversion completion timeout\n");
> +		return -ETIMEDOUT;
> +	}

Can you explain what is happening here ?

> +	scoped_guard(spinlock_irqsave, &priv->reg_lock)
> +		*temp = priv->cached_temp;
> +
> +	return 0;
> +}
> +
> +/* Convert temperature in milliCelsius to raw sensor code */
> +static int rzg3e_temp_to_raw(struct rzg3e_thermal_priv *priv, int temp_mc)
> +{
> +	s64 raw = div_s64(((temp_mc / 1000) - TSU_D) *
> +			  (priv->trmval[1] - priv->trmval[0]),
> +			  (TSU_E - TSU_D));
> +	return clamp_val(raw, 0, 0xFFF);
> +}
> +
> +static int rzg3e_thermal_set_trips(struct thermal_zone_device *tz, int low, int high)
> +{
> +	struct rzg3e_thermal_priv *priv = thermal_zone_device_priv(tz);
> +	int ret;
> +	int val;
> +
> +	if (low >= high)
> +		return -EINVAL;
> +
> +	if (priv->mode == THERMAL_DEVICE_DISABLED)
> +		return -EBUSY;

That is not supposed to happen. set_trips is called from
thermal_zone_device_update but the thermal zone is disabled, the
function bails out, thus it should not call this callback.

> +	/* Set up comparison interrupt */
> +	writel(0, priv->base + TSU_SIER);
> +	writel(TSU_SICR_ADCLR | TSU_SICR_CMPCLR, priv->base + TSU_SICR);
> +
> +	/* Set thresholds */
> +	writel(rzg3e_temp_to_raw(priv, low), priv->base + TSU_LLSR);
> +	writel(rzg3e_temp_to_raw(priv, high), priv->base + TSU_ULSR);
> +
> +	/* Configure comparison:
> +	 * - Enable comparison function (CMPEN = 1)
> +	 * - Set comparison condition (CMPCOND = 0 for out of range)
> +	 */
> +	writel(TSU_CMSR_CMPEN, priv->base + TSU_CMSR);
> +
> +	/* Enable comparison irq */
> +	writel(TSU_SIER_CMPIE, priv->base + TSU_SIER);
> +
> +	/* Verify no ongoing conversion */
> +	ret = readl_poll_timeout_atomic(priv->base + TSU_SSR, val,
> +					!(val & TSU_SSR_CONV_RUNNING),
> +					TSU_POLL_DELAY_US, TSU_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(priv->dev, "ADC conversion timed out\n");
> +		return ret;
> +	}
> +
> +	/* Start a conversion to trigger comparison */
> +	writel(TSU_STRGR_ADST, priv->base + TSU_STRGR);
> +
> +	return 0;
> +}
> +
> +static int rzg3e_thermal_get_trimming(struct rzg3e_thermal_priv *priv)
> +{
> +	int ret;
> +
> +	ret = regmap_read(priv->syscon, SYS_TSU_TRMVAL(0), &priv->trmval[0]);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(priv->syscon, SYS_TSU_TRMVAL(1), &priv->trmval[1]);
> +	if (ret)
> +		return ret;
> +
> +	priv->trmval[0] &= TSU_TRMVAL_MASK;
> +	priv->trmval[1] &= TSU_TRMVAL_MASK;
> +
> +	if (!priv->trmval[0] || !priv->trmval[1])
> +		return dev_err_probe(priv->dev, -EINVAL, "invalid trimming values");
> +
> +	return 0;
> +}
> +
> +static int rzg3e_thermal_change_mode(struct thermal_zone_device *tz,
> +				     enum thermal_device_mode mode)
> +{
> +	struct rzg3e_thermal_priv *priv = thermal_zone_device_priv(tz);
> +
> +	if (mode == THERMAL_DEVICE_DISABLED)
> +		rzg3e_thermal_hw_disable(priv);
> +	else
> +		rzg3e_thermal_hw_enable(priv);
> +
> +	priv->mode = mode;
> +	return 0;
> +}
> +
> +static const struct thermal_zone_device_ops rzg3e_tz_of_ops = {
> +	.get_temp = rzg3e_thermal_get_temp,
> +	.set_trips = rzg3e_thermal_set_trips,
> +	.change_mode = rzg3e_thermal_change_mode,
> +};
> +
> +static int rzg3e_thermal_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rzg3e_thermal_priv *priv;
> +	struct reset_control *rstc;
> +	char *adc_name, *cmp_name;
> +	int adc_irq, cmp_irq;
> +	struct clk *clk;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return dev_err_probe(dev, PTR_ERR(priv->base),
> +				"Failed to map I/O memory");
> +
> +	priv->syscon = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						       "renesas,tsu-calibration-sys");
> +	if (IS_ERR(priv->syscon))
> +		return dev_err_probe(dev, PTR_ERR(priv->syscon),
> +				"Failed to get calibration syscon");
> +
> +	adc_irq = platform_get_irq_byname(pdev, "adi");
> +	if (adc_irq < 0)
> +		return adc_irq;
> +
> +	cmp_irq = platform_get_irq_byname(pdev, "adcmpi");
> +	if (cmp_irq < 0)
> +		return cmp_irq;
> +
> +	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc),
> +				     "Failed to acquire deasserted reset");
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	spin_lock_init(&priv->reg_lock);
> +	init_completion(&priv->conv_complete);
> +
> +	clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "Failed to get and enable clock");
> +
> +	if (clk_get_rate(clk) < TSU_MIN_CLOCK_RATE)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Clock rate too low (minimum %d Hz required)",
> +				     TSU_MIN_CLOCK_RATE);
> +
> +	ret = rzg3e_thermal_get_trimming(priv);
> +	if (ret)
> +		return ret;
> +
> +	adc_name = devm_kasprintf(dev, GFP_KERNEL, "%s-adc", dev_name(dev));
> +	if (!adc_name)
> +		return -ENOMEM;
> +
> +	cmp_name = devm_kasprintf(dev, GFP_KERNEL, "%s-cmp", dev_name(dev));
> +	if (!cmp_name)
> +		return -ENOMEM;
> +
> +	/* Unit in a known disabled mode */
> +	rzg3e_thermal_hw_disable(priv);
> +
> +	ret = devm_request_irq(dev, adc_irq, rzg3e_thermal_adc_irq,
> +			       IRQF_TRIGGER_RISING, adc_name, priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request ADC IRQ");
> +
> +	ret = devm_request_threaded_irq(dev, cmp_irq, rzg3e_thermal_cmp_irq,
> +					rzg3e_thermal_cmp_threaded_irq,
> +					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					cmp_name, priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request comparison IRQ");
> +
> +	/* Register Thermal Zone */
> +	priv->zone = devm_thermal_of_zone_register(dev, 0, priv, &rzg3e_tz_of_ops);
> +	if (IS_ERR(priv->zone))
> +		return dev_err_probe(dev, PTR_ERR(priv->zone),
> +				"Failed to register thermal zone");
> +
> +	ret = devm_thermal_add_hwmon_sysfs(dev, priv->zone);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add hwmon sysfs");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rzg3e_thermal_dt_ids[] = {
> +	{ .compatible = "renesas,r9a09g047-tsu" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzg3e_thermal_dt_ids);
> +
> +static struct platform_driver rzg3e_thermal_driver = {
> +	.driver = {
> +		.name	= "rzg3e_thermal",
> +		.of_match_table = rzg3e_thermal_dt_ids,
> +	},
> +	.probe = rzg3e_thermal_probe,
> +};
> +module_platform_driver(rzg3e_thermal_driver);
> +
> +MODULE_DESCRIPTION("Renesas RZ/G3E TSU Thermal Sensor Driver");
> +MODULE_AUTHOR("John Madieu <john.madieu.xa@bp.renesas.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

