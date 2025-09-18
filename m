Return-Path: <linux-renesas-soc+bounces-21658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40601B4FF17
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 16:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF43E1C211F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 14:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205FE34572A;
	Tue,  9 Sep 2025 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Z1lzB1L3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47404340D84;
	Tue,  9 Sep 2025 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757427334; cv=none; b=QA9tT51t39P79Ty6wkZB8TECa/ujjVjRbtVQUzo8qAZJmSGw/IhwWbRYy+HqT086EDCjSt1l/npO1VUlyhh9l1MD8EyQ1NuaUpnnQPrsni4x5v9FNeaZd9al5dAgbR8gN8x6bgAjNS78ItIX+Dg7iHnvSbkYoPuA5woTawhSKKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757427334; c=relaxed/simple;
	bh=+sieaaYdBb3+CpP3UdC0Oaqa61uzSTyqLloX1M6FBz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tDLf1w+/tkAk5zbbVxOk8rwmOaJYT9sZOFNW3NEBQauu+DhC8e9Zv9vt71LkpDptmvgE7UGgXBYix0b/hxdRUj8VmAZca2OG2ebWVzEfG152wZf706RPzEAoehkMK8NHOT8jyOkySBfPozxaeyQzRwROTI8AaWCxAqnS2RCdFOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Z1lzB1L3; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589EF6C6353469;
	Tue, 9 Sep 2025 09:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757427306;
	bh=xIehkdGRFYsOzCasFfLmxgImeHbAR9fyNRSO5qGmYUs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Z1lzB1L30UDWhCjXdJGwHSlsOsABLblINe2qVwKF6bKXkJI66FdymX2ni0BqEdjXY
	 8ullDUtPE6hGblE/ivtehXjF4aCnUXI0wxhHwZc7IDP3z4OkiPvuGyZmI6MUFDnav2
	 sl8QlZPSSpFfz+laVnSCphR9VQjx/I4xHuW1sqdM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589EF6La3207088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 09:15:06 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 09:15:06 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Tue, 9 Sep
 2025 09:15:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 09:15:06 -0500
Received: from [10.247.30.162] (ula0226330.dhcp.ti.com [10.247.30.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589EF5rF2750358;
	Tue, 9 Sep 2025 09:15:06 -0500
Message-ID: <84bf99c9-fe23-437f-9c8b-43482b683e4e@ti.com>
Date: Tue, 9 Sep 2025 09:15:05 -0500
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] thermal: renesas: rzg3e: Add thermal driver for
 the Renesas RZ/G3E SoC
To: John Madieu <john.madieu.xa@bp.renesas.com>, <catalin.marinas@arm.com>,
        <conor+dt@kernel.org>, <daniel.lezcano@linaro.org>,
        <geert+renesas@glider.be>, <krzk+dt@kernel.org>, <lukasz.luba@arm.com>,
        <magnus.damm@gmail.com>, <mturquette@baylibre.com>,
        <p.zabel@pengutronix.de>, <robh@kernel.org>, <rui.zhang@intel.com>,
        <sboyd@kernel.org>, <will@kernel.org>
CC: <biju.das.jz@bp.renesas.com>, <devicetree@vger.kernel.org>,
        <john.madieu@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <rafael@kernel.org>
References: <20250909113840.122785-1-john.madieu.xa@bp.renesas.com>
 <20250909113840.122785-3-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250909113840.122785-3-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 9/9/25 6:38 AM, John Madieu wrote:
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
> 
> v2 -> v3: no changes
> 
> v3 -> v4: no changes
> 
> v5: Removed curly braces arround single-line protected scoped guards
> 
> v6: Clarified comments in driver
> 
> v7: Refactored driver structure:
>    - removes splinlock usage
>    - updates polling timeout as per the datasheet
>    - uses average mode to be more accurate
>    - uses polling (faster than irq mode) for get_temp() while keeping IRQ for hw
>    trip-point cross detection.
>    - adds both runtime and sleep PM support
> 
> v8: - Use of_parse_phandle_with_fixed_args() for trim values
>      - Use millidegree computation to for better precision
> 
>   MAINTAINERS                             |   7 +
>   drivers/thermal/renesas/Kconfig         |   7 +
>   drivers/thermal/renesas/Makefile        |   1 +
>   drivers/thermal/renesas/rzg3e_thermal.c | 564 ++++++++++++++++++++++++
>   4 files changed, 579 insertions(+)
>   create mode 100644 drivers/thermal/renesas/rzg3e_thermal.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10614ca41ed0..5480412f556d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21544,6 +21544,13 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/iio/potentiometer/renesas,x9250.yaml
>   F:	drivers/iio/potentiometer/x9250.c
>   
> +RENESAS RZ/G3E THERMAL SENSOR UNIT DRIVER
> +M:	John Madieu <john.madieu.xa@bp.renesas.com>
> +L:	linux-pm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> +F:	drivers/thermal/renesas/rzg3e_thermal.c
> +
>   RESET CONTROLLER FRAMEWORK
>   M:	Philipp Zabel <p.zabel@pengutronix.de>
>   S:	Maintained
> diff --git a/drivers/thermal/renesas/Kconfig b/drivers/thermal/renesas/Kconfig
> index dcf5fc5ae08e..10cf90fc4bfa 100644
> --- a/drivers/thermal/renesas/Kconfig
> +++ b/drivers/thermal/renesas/Kconfig
> @@ -26,3 +26,10 @@ config RZG2L_THERMAL
>   	help
>   	  Enable this to plug the RZ/G2L thermal sensor driver into the Linux
>   	  thermal framework.
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
>   obj-$(CONFIG_RCAR_GEN3_THERMAL)	+= rcar_gen3_thermal.o
>   obj-$(CONFIG_RCAR_THERMAL)	+= rcar_thermal.o
>   obj-$(CONFIG_RZG2L_THERMAL)	+= rzg2l_thermal.o
> +obj-$(CONFIG_RZG3E_THERMAL)	+= rzg3e_thermal.o
> diff --git a/drivers/thermal/renesas/rzg3e_thermal.c b/drivers/thermal/renesas/rzg3e_thermal.c
> new file mode 100644
> index 000000000000..e8c599be0b2c
> --- /dev/null
> +++ b/drivers/thermal/renesas/rzg3e_thermal.c
> @@ -0,0 +1,564 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G3E TSU Temperature Sensor Unit
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation
> + */
> +#include <linux/clk.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/thermal.h>
> +#include <linux/units.h>
> +
> +#include "../thermal_hwmon.h"
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
> +#define TSU_SOSR1_ADCS		BIT(4)
> +#define TSU_SOSR1_OUTSEL	BIT(9)
> +
> +#define TSU_SCRR		0x10
> +#define TSU_SCRR_OUT12BIT_TS	GENMASK(11, 0)
> +
> +#define TSU_SSR			0x14
> +#define TSU_SSR_CONV		BIT(0)
> +
> +#define TSU_CMSR		0x18
> +#define TSU_CMSR_CMPEN		BIT(0)
> +
> +#define TSU_LLSR		0x1C
> +#define TSU_ULSR		0x20
> +
> +#define TSU_SISR		0x30
> +#define TSU_SISR_ADF		BIT(0)
> +#define TSU_SISR_CMPF		BIT(1)
> +
> +#define TSU_SIER		0x34
> +#define TSU_SIER_CMPIE		BIT(1)
> +
> +#define TSU_SICR		0x38
> +#define TSU_SICR_ADCLR		BIT(0)
> +#define TSU_SICR_CMPCLR	BIT(1)
> +
> +/* Temperature calculation constants from datasheet */
> +#define TSU_TEMP_D		(-41)
> +#define TSU_TEMP_E		126
> +#define TSU_CODE_MAX		0xFFF
> +
> +/* Timing specifications from datasheet */
> +#define TSU_POWERUP_TIME_US	120	/* 120T at 1MHz sensor clock per datasheet */
> +#define TSU_CONV_TIME_US	50	/* Per sample conversion time */
> +#define TSU_POLL_DELAY_US	10	/* Polling interval */
> +#define TSU_MIN_CLOCK_RATE	24000000  /* TSU_PCLK minimum 24MHz */
> +
> +/**
> + * struct rzg3e_thermal_priv - RZ/G3E TSU private data
> + * @base: TSU register base
> + * @dev: device pointer
> + * @syscon: regmap for calibration values
> + * @zone: thermal zone device
> + * @rstc: reset control
> + * @trmval0: calibration value 0 (b)
> + * @trmval1: calibration value 1 (c)
> + * @trim_offset: offset for trim registers in syscon
> + * @lock: protects hardware access during conversions
> + */
> +struct rzg3e_thermal_priv {
> +	void __iomem *base;
> +	struct device *dev;
> +	struct regmap *syscon;
> +	struct thermal_zone_device *zone;
> +	struct reset_control *rstc;
> +	u16 trmval0;
> +	u16 trmval1;
> +	u32 trim_offset;
> +	struct mutex lock;
> +};
> +
> +static inline u32 rzg3e_thermal_read(struct rzg3e_thermal_priv *priv, u32 reg)
> +{
> +	return readl(priv->base + reg);

Are these one line functions really saving you anything? They seem to only
add a layer of indiretion.

Regmap might help here also.

> +}
> +
> +static inline void rzg3e_thermal_write(struct rzg3e_thermal_priv *priv,
> +				       u32 reg, u32 val)
> +{
> +	writel(val, priv->base + reg);
> +}
> +
> +static int rzg3e_thermal_power_on(struct rzg3e_thermal_priv *priv)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/* Clear any pending interrupts */
> +	rzg3e_thermal_write(priv, TSU_SICR, TSU_SICR_ADCLR | TSU_SICR_CMPCLR);
> +
> +	/* Disable all interrupts during setup */
> +	rzg3e_thermal_write(priv, TSU_SIER, 0);
> +
> +	/*
> +	 * Power-on sequence per datasheet 7.11.9.1:
> +	 * SOC_TS_EN must be set at same time or before EN_TS and ADC_PD_TS
> +	 */
> +	val = TSU_SSUSR_SOC_TS_EN | TSU_SSUSR_EN_TS;
> +	rzg3e_thermal_write(priv, TSU_SSUSR, val);
> +
> +	/* Wait for sensor stabilization per datasheet 7.11.7.1 */
> +	usleep_range(TSU_POWERUP_TIME_US, TSU_POWERUP_TIME_US + 10);
> +
> +	/* Configure for average mode with 8 samples */
> +	val = TSU_SOSR1_OUTSEL | TSU_SOSR1_ADCT_8;
> +	rzg3e_thermal_write(priv, TSU_SOSR1, val);
> +
> +	/* Ensure we're in single scan mode (default) */
> +	val = rzg3e_thermal_read(priv, TSU_SOSR1);
> +	if (val & TSU_SOSR1_ADCS) {
> +		dev_err(priv->dev, "Invalid scan mode setting\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Wait for any ongoing conversion to complete */
> +	ret = readl_poll_timeout(priv->base + TSU_SSR, val,
> +				 !(val & TSU_SSR_CONV),
> +				 TSU_POLL_DELAY_US,
> +				 USEC_PER_MSEC);
> +	if (ret) {
> +		dev_err(priv->dev, "Timeout waiting for conversion\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void rzg3e_thermal_power_off(struct rzg3e_thermal_priv *priv)
> +{
> +	/* Disable all interrupts */
> +	rzg3e_thermal_write(priv, TSU_SIER, 0);
> +
> +	/* Clear pending interrupts */
> +	rzg3e_thermal_write(priv, TSU_SICR, TSU_SICR_ADCLR | TSU_SICR_CMPCLR);
> +
> +	/* Power down sequence per datasheet */
> +	rzg3e_thermal_write(priv, TSU_SSUSR, TSU_SSUSR_ADC_PD_TS);
> +}
> +
> +/*
> + * Convert 12-bit sensor code to temperature in millicelsius
> + * Formula from datasheet 7.11.7.8:
> + * T(°C) = ((e - d) / (c - b)) * (a - b) + d
> + * where: a = sensor code, b = trmval0, c = trmval1, d = -41, e = 126
> + */
> +static int rzg3e_thermal_code_to_temp(struct rzg3e_thermal_priv *priv, u16 code)
> +{
> +	int temp_e_mc = TSU_TEMP_E * MILLIDEGREE_PER_DEGREE;
> +	int temp_d_mc = TSU_TEMP_D * MILLIDEGREE_PER_DEGREE;
> +	s64 numerator, denominator;
> +	int temp_mc;
> +
> +	numerator = (temp_e_mc - temp_d_mc) * (s64)(code - priv->trmval0);
> +	denominator = priv->trmval1 - priv->trmval0;
> +
> +	temp_mc = div64_s64(numerator, denominator) + temp_d_mc;
> +
> +	return clamp(temp_mc, temp_d_mc, temp_e_mc);
> +}
> +
> +/*
> + * Convert temperature in millicelsius to 12-bit sensor code
> + * Formula from datasheet 7.11.7.9 (inverse of above)
> + */
> +static u16 rzg3e_thermal_temp_to_code(struct rzg3e_thermal_priv *priv, int temp_mc)
> +{
> +	int temp_e_mc = TSU_TEMP_E * MILLIDEGREE_PER_DEGREE;
> +	int temp_d_mc = TSU_TEMP_D * MILLIDEGREE_PER_DEGREE;
> +	s64 numerator, denominator;
> +	s64 code;
> +
> +	numerator = (temp_mc - temp_d_mc) * (priv->trmval1 - priv->trmval0);
> +	denominator = temp_e_mc - temp_d_mc;
> +
> +	code = div64_s64(numerator, denominator) + priv->trmval0;
> +
> +	return clamp_val(code, 0, TSU_CODE_MAX);
> +}
> +
> +static int rzg3e_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct rzg3e_thermal_priv *priv = thermal_zone_device_priv(tz);
> +	u32 status, code;
> +	int ret, timeout;
> +
> +	ret = pm_runtime_resume_and_get(priv->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	/* Clear any previous conversion status */
> +	rzg3e_thermal_write(priv, TSU_SICR, TSU_SICR_ADCLR);
> +
> +	/* Start single conversion */
> +	rzg3e_thermal_write(priv, TSU_STRGR, TSU_STRGR_ADST);
> +
> +	/* Wait for conversion completion - 8 samples at ~50us each */
> +	timeout = TSU_CONV_TIME_US * 8 * 2;  /* Double for margin */
> +	ret = readl_poll_timeout(priv->base + TSU_SISR, status,
> +				 status & TSU_SISR_ADF,
> +				 TSU_POLL_DELAY_US, timeout);
> +	if (ret) {
> +		dev_err(priv->dev, "Conversion timeout (status=0x%08x)\n", status);
> +		goto out;
> +	}
> +
> +	/* Read the averaged result and clear the complete flag */
> +	code = rzg3e_thermal_read(priv, TSU_SCRR) & TSU_SCRR_OUT12BIT_TS;
> +	rzg3e_thermal_write(priv, TSU_SICR, TSU_SICR_ADCLR);
> +
> +	/* Convert to temperature */
> +	*temp = rzg3e_thermal_code_to_temp(priv, code);
> +
> +	dev_dbg(priv->dev, "temp=%d mC (%d.%03d°C), code=0x%03x\n",
> +		*temp, *temp / 1000, abs(*temp) % 1000, code);
> +
> +out:
> +	pm_runtime_mark_last_busy(priv->dev);
> +	pm_runtime_put_autosuspend(priv->dev);
> +	return ret;
> +}
> +
> +static int rzg3e_thermal_set_trips(struct thermal_zone_device *tz,
> +				   int low, int high)
> +{
> +	struct rzg3e_thermal_priv *priv = thermal_zone_device_priv(tz);
> +	u16 low_code, high_code;
> +	u32 val;
> +	int ret;
> +
> +	/* Hardware requires low < high */
> +	if (low >= high)
> +		return -EINVAL;
> +
> +	ret = pm_runtime_resume_and_get(priv->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	guard(mutex)(&priv->lock);
> +
> +	/* Convert temperatures to codes */
> +	low_code = rzg3e_thermal_temp_to_code(priv, low);
> +	high_code = rzg3e_thermal_temp_to_code(priv, high);
> +
> +	dev_dbg(priv->dev, "set_trips: low=%d high=%d (codes: 0x%03x/0x%03x)\n",
> +		low, high, low_code, high_code);
> +
> +	/* Disable comparison during reconfiguration */
> +	rzg3e_thermal_write(priv, TSU_SIER, 0);
> +	rzg3e_thermal_write(priv, TSU_CMSR, 0);
> +
> +	/* Clear any pending comparison interrupts */
> +	rzg3e_thermal_write(priv, TSU_SICR, TSU_SICR_CMPCLR);
> +
> +	/* Set trip points */
> +	rzg3e_thermal_write(priv, TSU_LLSR, low_code);
> +	rzg3e_thermal_write(priv, TSU_ULSR, high_code);
> +
> +	/*
> +	 * Ensure OUTSEL is set for comparison per datasheet 7.11.7.4
> +	 * Comparison uses averaged data
> +	 */
> +	val = rzg3e_thermal_read(priv, TSU_SOSR1);
> +	val |= TSU_SOSR1_OUTSEL;
> +	rzg3e_thermal_write(priv, TSU_SOSR1, val);
> +
> +	/* Enable comparison with "out of range" mode (CMPCOND=0) */
> +	rzg3e_thermal_write(priv, TSU_CMSR, TSU_CMSR_CMPEN);
> +
> +	/* Unmask compare IRQ and start a conversion to evaluate window */
> +	rzg3e_thermal_write(priv, TSU_SIER, TSU_SIER_CMPIE);
> +	rzg3e_thermal_write(priv, TSU_STRGR, TSU_STRGR_ADST);
> +
> +	pm_runtime_mark_last_busy(priv->dev);
> +	pm_runtime_put_autosuspend(priv->dev);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t rzg3e_thermal_irq_thread(int irq, void *data)
> +{
> +	struct rzg3e_thermal_priv *priv = data;
> +
> +	dev_dbg(priv->dev, "Temperature threshold crossed\n");
> +
> +	/* Notify thermal framework to re-evaluate trip points */
> +	thermal_zone_device_update(priv->zone, THERMAL_TRIP_VIOLATED);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t rzg3e_thermal_irq(int irq, void *data)
> +{
> +	struct rzg3e_thermal_priv *priv = data;
> +	u32 status;
> +
> +	status = rzg3e_thermal_read(priv, TSU_SISR);
> +
> +	/* Check if comparison interrupt occurred */
> +	if (status & TSU_SISR_CMPF) {
> +		/* Clear irq flag and disable interrupt until reconfigured */
> +		rzg3e_thermal_write(priv, TSU_SICR, TSU_SICR_CMPCLR);
> +		rzg3e_thermal_write(priv, TSU_SIER, 0);
> +
> +		return IRQ_WAKE_THREAD;
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
> +static const struct thermal_zone_device_ops rzg3e_tz_ops = {
> +	.get_temp = rzg3e_thermal_get_temp,
> +	.set_trips = rzg3e_thermal_set_trips,
> +};
> +
> +static int rzg3e_thermal_get_calibration(struct rzg3e_thermal_priv *priv)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/* Read calibration values from syscon */
> +	ret = regmap_read(priv->syscon, priv->trim_offset, &val);
> +	if (ret)
> +		return ret;
> +	priv->trmval0 = val & GENMASK(11, 0);
> +
> +	ret = regmap_read(priv->syscon, priv->trim_offset + 4, &val);
> +	if (ret)
> +		return ret;
> +	priv->trmval1 = val & GENMASK(11, 0);
> +
> +	/* Validate calibration data */
> +	if (!priv->trmval0 || !priv->trmval1 ||
> +	    priv->trmval0 == priv->trmval1 ||
> +	    priv->trmval0 == 0xFFF || priv->trmval1 == 0xFFF) {
> +		dev_err(priv->dev, "Invalid calibration: b=0x%03x, c=0x%03x\n",
> +			priv->trmval0, priv->trmval1);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(priv->dev, "Calibration: b=0x%03x (%u), c=0x%03x (%u)\n",
> +		priv->trmval0, priv->trmval0, priv->trmval1, priv->trmval1);
> +
> +	return 0;
> +}
> +
> +static int rzg3e_thermal_parse_dt(struct rzg3e_thermal_priv *priv)
> +{
> +	struct device_node *np = priv->dev->of_node;
> +	struct of_phandle_args args;
> +	int ret;
> +
> +	ret = of_parse_phandle_with_fixed_args(np, "renesas,tsu-trim", 1, 0, &args);

priv->syscon = syscon_regmap_lookup_by_phandle_args(np, "renesas,tsu-trim", 1, ...

Then you can skip the below syscon_node_to_regmap().

> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to parse renesas,tsu-trim\n");
> +
> +	priv->trim_offset = args.args[0];
> +	priv->syscon = syscon_node_to_regmap(args.np);
> +	of_node_put(args.np);
> +
> +	if (IS_ERR(priv->syscon))
> +		return dev_err_probe(priv->dev, PTR_ERR(priv->syscon),
> +				     "Failed to get syscon regmap\n");
> +
> +	return 0;
> +}
> +
> +static int rzg3e_thermal_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rzg3e_thermal_priv *priv;
> +	struct clk *clk;
> +	int irq, ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	mutex_init(&priv->lock);

devm_mutex_init()

Andrew

> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	/* Parse device tree for trim register info */
> +	ret = rzg3e_thermal_parse_dt(priv);
> +	if (ret)
> +		return ret;
> +
> +	/* Get clock to verify frequency - clock is managed by power domain */
> +	clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "Failed to get clock\n");
> +
> +	if (clk_get_rate(clk) < TSU_MIN_CLOCK_RATE)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Clock rate %lu Hz too low (min %u Hz)\n",
> +				     clk_get_rate(clk), TSU_MIN_CLOCK_RATE);
> +
> +	priv->rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR(priv->rstc))
> +		return dev_err_probe(dev, PTR_ERR(priv->rstc),
> +				     "Failed to get/deassert reset control\n");
> +
> +	/* Get calibration data */
> +	ret = rzg3e_thermal_get_calibration(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get valid calibration data\n");
> +
> +	/* Get comparison interrupt */
> +	irq = platform_get_irq_byname(pdev, "adcmpi");
> +	if (irq < 0)
> +		return irq;
> +
> +	/* Enable runtime PM */
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	devm_pm_runtime_enable(dev);
> +
> +	/* Initial hardware setup */
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Runtime resume failed\n");
> +
> +	/* Register thermal zone - this will trigger DT parsing */
> +	priv->zone = devm_thermal_of_zone_register(dev, 0, priv, &rzg3e_tz_ops);
> +	if (IS_ERR(priv->zone)) {
> +		ret = PTR_ERR(priv->zone);
> +		dev_err(dev, "Failed to register thermal zone: %d\n", ret);
> +		goto err_pm_put;
> +	}
> +
> +	/* Request threaded IRQ for comparison interrupt */
> +	ret = devm_request_threaded_irq(dev, irq, rzg3e_thermal_irq,
> +					rzg3e_thermal_irq_thread,
> +					IRQF_ONESHOT, "rzg3e_thermal", priv);
> +	if (ret) {
> +		dev_err(dev, "Failed to request IRQ: %d\n", ret);
> +		goto err_pm_put;
> +	}
> +
> +	/* Add hwmon sysfs interface */
> +	ret = devm_thermal_add_hwmon_sysfs(dev, priv->zone);
> +	if (ret)
> +		dev_warn(dev, "Failed to add hwmon sysfs attributes\n");
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	dev_info(dev, "RZ/G3E thermal sensor registered\n");
> +
> +	return 0;
> +
> +err_pm_put:
> +	pm_runtime_put_sync(dev);
> +	return ret;
> +}
> +
> +static int rzg3e_thermal_runtime_suspend(struct device *dev)
> +{
> +	struct rzg3e_thermal_priv *priv = dev_get_drvdata(dev);
> +
> +	rzg3e_thermal_power_off(priv);
> +	return 0;
> +}
> +
> +static int rzg3e_thermal_runtime_resume(struct device *dev)
> +{
> +	struct rzg3e_thermal_priv *priv = dev_get_drvdata(dev);
> +
> +	return rzg3e_thermal_power_on(priv);
> +}
> +
> +static int rzg3e_thermal_suspend(struct device *dev)
> +{
> +	struct rzg3e_thermal_priv *priv = dev_get_drvdata(dev);
> +
> +	/* If device is active, power it off */
> +	if (pm_runtime_active(dev))
> +		rzg3e_thermal_power_off(priv);
> +
> +	/* Assert reset to ensure clean state after resume */
> +	reset_control_assert(priv->rstc);
> +
> +	return 0;
> +}
> +
> +static int rzg3e_thermal_resume(struct device *dev)
> +{
> +	struct rzg3e_thermal_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Deassert reset */
> +	ret = reset_control_deassert(priv->rstc);
> +	if (ret) {
> +		dev_err(dev, "Failed to deassert reset: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* If device was active before suspend, power it back on */
> +	if (pm_runtime_active(dev))
> +		return rzg3e_thermal_power_on(priv);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rzg3e_thermal_pm_ops = {
> +	RUNTIME_PM_OPS(rzg3e_thermal_runtime_suspend,
> +		       rzg3e_thermal_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(rzg3e_thermal_suspend, rzg3e_thermal_resume)
> +};
> +
> +static const struct of_device_id rzg3e_thermal_dt_ids[] = {
> +	{ .compatible = "renesas,r9a09g047-tsu" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzg3e_thermal_dt_ids);
> +
> +static struct platform_driver rzg3e_thermal_driver = {
> +	.driver = {
> +		.name = "rzg3e_thermal",
> +		.of_match_table = rzg3e_thermal_dt_ids,
> +		.pm = pm_ptr(&rzg3e_thermal_pm_ops),
> +	},
> +	.probe = rzg3e_thermal_probe,
> +};
> +module_platform_driver(rzg3e_thermal_driver);
> +
> +MODULE_DESCRIPTION("Renesas RZ/G3E TSU Thermal Sensor Driver");
> +MODULE_AUTHOR("John Madieu <john.madieu.xa@bp.renesas.com>");
> +MODULE_LICENSE("GPL");


