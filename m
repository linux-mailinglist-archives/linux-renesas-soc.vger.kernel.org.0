Return-Path: <linux-renesas-soc+bounces-7386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FB1933832
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 09:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAE8EB20CFA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 07:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4B81BDD0;
	Wed, 17 Jul 2024 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oswepofU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D0F1CAB9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jul 2024 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721202394; cv=none; b=Y9RcZJym1eH8EEgcjQC/gggc4qSuQJI9dpaxc5JqEf0yjU1t6pMuEbPJQrf4WsNTpvdAj0BVxnZNVujzVuPQO8uNjyGqYfIdGulXuXWGOgN0nfribJEgORh9rKUMO1VCYTXk6+nnHreNtlL5XpetPn/zrv0ZTF3lCzWqQU20eU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721202394; c=relaxed/simple;
	bh=VjQxQBGSxrzOKfnVurw4YR8PgK6Ja3I4dp+Q7ZlwA5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGguQ2ZFoQuqMaQO9Az12fywqxfvufZmg7xQSCal4ieaaRVdqdk6NbuZ4dNdCJTwgbxFjLjfu1abLUVSMOxt0PMHi2v5NTm7D3LbXYFu1gOoML8GUPpJGyc4IAtOREBiu0D4xJNk/MC7XNmpNNBlvEbE3UkqUypzTnNGDkwCdco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oswepofU; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ea2b6a9f5so6726407e87.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jul 2024 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721202391; x=1721807191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hYmLVYWXk1bMWnCbE/bbshFQAVmL1hOp1kfOD1hykXU=;
        b=oswepofUSVwWMKOA7U2Tv4EOWaSvEuKz1tRYaea2ahcZMTIyXaqv9Kn22GjeeJsn1c
         UGDH8TUFcPjrUAxEJwDOhuOprpeeohcJEnsRCFHCqAU11kKWXuZJnaMRT8nJbJCYMUaQ
         By9PiKf1FSAUMfTgSEkVCMVos5fa8Y5VsXm1SdebDJiBylM0/7LUg9DSr3ipmkcntGC6
         ObgiOmLbmtf9uKrJMKdBCBnbZmV85DTtyWlIOg77DBEFWLm/rZTxq3MmJSGDklvwblxp
         OxXnEswup9pIT6bm+UwA84sMEzOD8fxWICqBjpAdelnLr7BkZ5x/N+AGX7u88cs918N8
         aWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721202391; x=1721807191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hYmLVYWXk1bMWnCbE/bbshFQAVmL1hOp1kfOD1hykXU=;
        b=hRsS4ei0F3m+bNxr0jszWH/1831gShTJQHpYr3GST9eY8ikwDpwVBF5CfMUMRkgANj
         +8hQcHUEoHdmBp+mwJ0z25vaypamieU+aaLQ8RXdA7Ha0weivDboC7CBwcqoWQBwJcHy
         ldpOEVJ/R6BKqdSQ4hy0LmEWfAH9HRB1Fg8lo3hYwMdcIZKeliNnahPU24YoCEaF1CPf
         /1pGx9zoTBAM9qdd2+/9YAbdm8fUFtrMHhlu2UqxVKjCyZOQNozHHb4VF5kyLOOXLf+J
         +gCh0GXbqZ32QwNzZnAVqBySunE8hp4PimXKgOZT3O3zIdUQvZ6LDYPXZTKPn0vk8MfJ
         0WGA==
X-Forwarded-Encrypted: i=1; AJvYcCV3WG741bOWOaFWWM7l2FxpITl8N6IDzhDi9Bz5kytD0jljuKz6xEgOolpqn1QofCI+vW3n3RfYu2uTuf5hLaKo5ur+FD0iBwWgWQZKAAiaO2Y=
X-Gm-Message-State: AOJu0YzKMpkfNm3p+sgN7Nxqx6jMnshyNk4W92RmWgsfwRs3pHH/WQwB
	Zk5o6YTiAG0ESKSK0qKvxGGmnrowGDv8Iqvc9u0iSGY8EjbbBDnKdJjOb8wgqrU=
X-Google-Smtp-Source: AGHT+IGszrXHx0KHBmy0iQwD3ICpkbfColejw+97LZhBsXwp+xoAEe4EMP07eMeEcMWmReOlcLiFBg==
X-Received: by 2002:a05:6512:3a87:b0:52e:7ef1:7c6e with SMTP id 2adb3069b0e04-52ee5429389mr555426e87.51.1721202390445;
        Wed, 17 Jul 2024 00:46:30 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e9a809sm160194035e9.28.2024.07.17.00.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 00:46:29 -0700 (PDT)
Message-ID: <40d1bb5b-f8ff-4fdc-a2b3-b51ca8b11c10@tuxon.dev>
Date: Wed, 17 Jul 2024 10:46:28 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the
 Renesas VBATTB IP
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>, "lee@kernel.org" <lee@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-3-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346E71D18A145DA70441CF786A22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346E71D18A145DA70441CF786A22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 16.07.2024 14:07, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Tuesday, July 16, 2024 11:30 AM
>> Subject: [PATCH v2 02/11] mfd: renesas-vbattb: Add a MFD driver for the Renesas VBATTB IP
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Renesas VBATTB IP has logic to control the RTC clock, tamper detection and a small 128B memory. Add a
>> MFD driver to do the basic initialization of the VBATTB IP for the inner components to work.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - none; this driver is new
>>
>>  drivers/mfd/Kconfig          |  8 ++++
>>  drivers/mfd/Makefile         |  1 +
>>  drivers/mfd/renesas-vbattb.c | 78 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 87 insertions(+)
>>  create mode 100644 drivers/mfd/renesas-vbattb.c
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig index bc8be2e593b6..df93e8b05065 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1383,6 +1383,14 @@ config MFD_SC27XX_PMIC
>>  	  This driver provides common support for accessing the SC27xx PMICs,
>>  	  and it also adds the irq_chip parts for handling the PMIC chip events.
>>
>> +config MFD_RENESAS_VBATTB
>> +	tristate "Renesas VBATTB driver"
>> +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
>> +	select MFD_CORE
>> +	help
>> +	  Select this option to enable Renesas RZ/G3S VBATTB driver which
>> +	  provides support for the RTC clock, tamper detector and 128B SRAM.
>> +
>>  config RZ_MTU3
>>  	tristate "Renesas RZ/G2L MTU3a core driver"
>>  	depends on (ARCH_RZG2L && OF) || COMPILE_TEST diff --git a/drivers/mfd/Makefile
>> b/drivers/mfd/Makefile index 02b651cd7535..cd2f27492df2 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -186,6 +186,7 @@ pcf50633-objs			:= pcf50633-core.o pcf50633-irq.o
>>  obj-$(CONFIG_MFD_PCF50633)	+= pcf50633.o
>>  obj-$(CONFIG_PCF50633_ADC)	+= pcf50633-adc.o
>>  obj-$(CONFIG_PCF50633_GPIO)	+= pcf50633-gpio.o
>> +obj-$(CONFIG_MFD_RENESAS_VBATTB)	+= renesas-vbattb.o
>>  obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
>>  obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
>>  obj-$(CONFIG_MFD_DB8500_PRCMU)	+= db8500-prcmu.o
>> diff --git a/drivers/mfd/renesas-vbattb.c b/drivers/mfd/renesas-vbattb.c new file mode 100644 index
>> 000000000000..5d71565b8cbf
>> --- /dev/null
>> +++ b/drivers/mfd/renesas-vbattb.c
>> @@ -0,0 +1,78 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * VBATTB driver
>> + *
>> + * Copyright (C) 2024 Renesas Electronics Corp.
>> + */
>> +
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/reset.h>
>> +
>> +static int vbattb_probe(struct platform_device *pdev) {
>> +	struct device *dev = &pdev->dev;
>> +	struct reset_control *rstc;
>> +	int ret;
>> +
>> +	rstc = devm_reset_control_array_get_exclusive(dev);
>> +	if (IS_ERR(rstc))
>> +		return PTR_ERR(rstc);
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret)
>> +		return ret;
> 
> Maybe as an optimization drop pm calls and use "devm_clk_get_enabled"
> instead as it perfectly fits in this scenario??

VBATTB is still part of a PM domain. That needs to be enabled as well.
pm_runtime_* APIs takes care of both clock enable and power domain on
operations.

One thing to notice is that on RZ/G3S the VBATTB clock is CRITICAL (thus
enabled in the probe of the clock driver), the PM domain is always ON (and
also enabled by clock driver). We can get rid of pm_runtime_* at all for
RZ/G3S but I think it would be better to have it here as well for future
platforms and to emphasize from driver that these resources are needed by
the VBATTB. The same approach is used for  other RZ/G2 drivers that
declares critical clocks/always-on domains (e.g. dma driver, IA55 driver).

Thank you,
Claudiu Beznea

> 
>> +
>> +	ret = reset_control_deassert(rstc);
>> +	if (ret)
>> +		goto rpm_put;
>> +
>> +	platform_set_drvdata(pdev, rstc);
>> +
>> +	ret = devm_of_platform_populate(dev);
>> +	if (ret)
>> +		goto reset_assert;
>> +
>> +	return 0;
>> +
>> +reset_assert:
>> +	reset_control_assert(rstc);
>> +rpm_put:
>> +	pm_runtime_put(dev);
>> +	return ret;
>> +}
>> +
>> +static void vbattb_remove(struct platform_device *pdev) {
>> +	struct reset_control *rstc = platform_get_drvdata(pdev);
>> +
>> +	reset_control_assert(rstc);
>> +	pm_runtime_put(&pdev->dev);
>> +}
>> +
>> +static const struct of_device_id vbattb_match[] = {
>> +	{ .compatible = "renesas,r9a08g045-vbattb" },
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, vbattb_match);
>> +
>> +static struct platform_driver vbattb_driver = {
>> +	.probe = vbattb_probe,
>> +	.remove_new = vbattb_remove,
>> +	.driver = {
>> +		.name = "renesas-vbattb",
>> +		.of_match_table = vbattb_match,
>> +	},
>> +};
>> +module_platform_driver(vbattb_driver);
>> +
>> +MODULE_ALIAS("platform:renesas-vbattb");
>> +MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
>> +MODULE_DESCRIPTION("Renesas VBATTB driver"); MODULE_LICENSE("GPL");
>> --
>> 2.39.2
>>
> 

