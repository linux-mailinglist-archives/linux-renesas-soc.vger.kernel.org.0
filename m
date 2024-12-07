Return-Path: <linux-renesas-soc+bounces-11045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1EC9E7F82
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2024 11:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9439E18841EE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2024 10:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149C013DBB6;
	Sat,  7 Dec 2024 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YTdsj2E4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E132F45005
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Dec 2024 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733566902; cv=none; b=nJzWO9Nb9WGFcPYC1foziHYDq+NAYzui1+jutIP5LXISs649h8rEh5DRc//4H6zJ/Pc/1/pqdmslsqRa7PXV+NTFtjTkpHqBMWOPMNbKqFraEqmbmg5ntHisxGV/0f5jUENxMdTtYIzcTLzotgaJ3iOgMT1yNHgOWtxdbJ4JCLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733566902; c=relaxed/simple;
	bh=QXiSoNTWVCratAFwPXras/dFvgRcZIwl9XGZ8yxUR28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXNDvT5WNZ/K0V4ApiD+Mrobe0vZcmHkH+r3lSACK8XLnu9qYfW7BxAaBtAJLM9DbhZ68gtmdzV/EURFHFEBSi9kffajil/HgBmNpkevglcGI1fz/+DBJFcqgN4jNZ4wgQHBbFrOyqreQY0I/nJJ6sbzmVMHtelyseUOhNcCgG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YTdsj2E4; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso112856a12.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Dec 2024 02:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733566897; x=1734171697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJZayt2vt6q0EzZrV2lCwTY2P8mZkwCpfazLi0rUktQ=;
        b=YTdsj2E4j5omKzpVXO1P02UJZtuXWK1bNkJkND8p3M7IQcTijCV8aKJvIMCyEUaChG
         zVqJ0JKjG+FvGp38ztMHP8Z5g66kKvoM4lMkzhygWWivF3kY+YwboNhNoMta9gIlACFe
         dMc6gUK1q3htJeCpXthGfVgNcmKvAsy07cOMO0i9R2XWGFdD0TgYnjY13NimXhN1iQJ7
         yvv8TlqZS7/EwZp8RbVpyqnT4c0PPPkPWIJsE5AYimD2Uu6qGyfGZLjjz1BSSzz0REju
         nFkpgddk1axVMo2HtTLLIxxbPwtl8mvzKgL2t3Ne5aUISY+R854v/NJQkIRqmZOyCKpO
         SCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733566897; x=1734171697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJZayt2vt6q0EzZrV2lCwTY2P8mZkwCpfazLi0rUktQ=;
        b=rZpTTy9ElWT29WgmrDd3Mb8ublNzUgvJ/ofLAdn/bnC4a0fE+WjVZMwXPf7VHoa5os
         0wQoqHF2bXBzHiT45qmY2IjFcMRyEnt4nBjkqXRSSZ7pZs94woi3cKUAVHyNyFL6AH/r
         bmle2MJ0J0156E1CW0yrIps0XvLffs5OULYwnOtzbDrJjjj0b28qGuVb02bV/D0B9MVz
         5Y+E3zHV7fj2mOE8R7GRA3D7jhNyg1obyHAFzuzVajlwRbt5thVUSEEpt90tpzbHfkVw
         IkqvgHrOCxBmUmk1CRW4ZX1bZuFfS4S2XaeUw8gHjObJxm89VRdrbJkP2LNLqdSxHLJB
         lw3A==
X-Forwarded-Encrypted: i=1; AJvYcCUUJnfE4LKMfn7xDsCjLJ0QH0eWpn2slOCnBQ6//KItDh6SVK5bxHjsKhEj5/ubaUD2ElL2JqkMxU/aHG9M8OChVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXFdj2/AMhW0uGIDXDJrf3qkKYTxE3+gVhGLZvdGEoEp6vS1gf
	4d4FCBjZHIeRZkd9O5FZHS46ZfuJUS9gzj+T+YBB8epmbZdwWFRMes9N7GD7Pjc=
X-Gm-Gg: ASbGncsdhE0tpSMV3WJpfCC3Fhpw8O6zMXOQguPxthU761nsh7suncn9pPlpPhCq5jN
	UFN0SlTOuLptlMubSesz+85qjIzeCZ2gV1GiRV4LisNBhzY6YrYky0cQDRt/5ki8uTDpw4XjIpi
	JtpKa53hnsqnUOlf34oWnvB19YFbl3IaICh6tBw+Tj2f6lTkKjUbdCu45SFx4vXo67bZ2haVJzz
	HFSIjjFWhD7GifyZgU3NJDRKkV7kcO6bsYS/wZhxwSTvGKL/qXvhSvPGFc=
X-Google-Smtp-Source: AGHT+IEUW9q8xF1+fkOhH8DfZdZAdiJH5QSmufreCICdcRy5sNSRiEsOZ1CT8Ac9bQeTafNvpxQjJA==
X-Received: by 2002:a05:6402:11c6:b0:5d0:f9f1:cd73 with SMTP id 4fb4d7f45d1cf-5d3be67cf40mr4595640a12.13.1733566896858;
        Sat, 07 Dec 2024 02:21:36 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c798fbasm3292509a12.59.2024.12.07.02.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 02:21:35 -0800 (PST)
Message-ID: <98d54d6e-4511-49ae-8def-ff711152a3ad@tuxon.dev>
Date: Sat, 7 Dec 2024 12:21:33 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
Content-Language: en-US
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20241206212559.192705-4-john.madieu.xa@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241206212559.192705-4-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, John,

On 06.12.2024 23:25, John Madieu wrote:
> Add SoC detection support for RZ/G3E SoC. Also add support for detecting the
> number of cores and ETHOS-U55 NPU and also detect PLL mismatch for SW settings
> other than 1.7GHz.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  drivers/soc/renesas/Kconfig          |  6 +++
>  drivers/soc/renesas/Makefile         |  1 +
>  drivers/soc/renesas/r9a09g047-sysc.c | 70 ++++++++++++++++++++++++++++
>  drivers/soc/renesas/rz-sysc.c        | 44 +++++++++++------
>  drivers/soc/renesas/rz-sysc.h        |  7 +++
>  5 files changed, 114 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/soc/renesas/r9a09g047-sysc.c
> 
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index a792a3e915fe..9e46b0ee6e80 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -348,6 +348,7 @@ config ARCH_R9A09G011
>  
>  config ARCH_R9A09G047
>  	bool "ARM64 Platform support for RZ/G3E"
> +	select SYSC_R9A09G047
>  	help
>  	  This enables support for the Renesas RZ/G3E SoC variants.
>  
> @@ -386,9 +387,14 @@ config RST_RCAR
>  
>  config SYSC_RZ
>  	bool "System controller for RZ SoCs" if COMPILE_TEST
> +	depends on MFD_SYSCON
>  
>  config SYSC_R9A08G045
>  	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
>  	select SYSC_RZ
>  
> +config SYSC_R9A09G047
> +	bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
> +	select SYSC_RZ
> +
>  endif # SOC_RENESAS
> diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
> index 8cd139b3dd0a..3256706112d9 100644
> --- a/drivers/soc/renesas/Makefile
> +++ b/drivers/soc/renesas/Makefile
> @@ -7,6 +7,7 @@ ifdef CONFIG_SMP
>  obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
>  endif
>  obj-$(CONFIG_SYSC_R9A08G045)	+= r9a08g045-sysc.o
> +obj-$(CONFIG_SYSC_R9A09G047)	+= r9a09g047-sysc.o
>  
>  # Family
>  obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
> diff --git a/drivers/soc/renesas/r9a09g047-sysc.c b/drivers/soc/renesas/r9a09g047-sysc.c
> new file mode 100644
> index 000000000000..32bdab9f1774
> --- /dev/null
> +++ b/drivers/soc/renesas/r9a09g047-sysc.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3E System controller driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +
> +#include "rz-sysc.h"
> +
> +/* Register definitions */
> +#define SYS_LSI_DEVID	0x304
> +#define SYS_LSI_MODE	0x300
> +#define SYS_LSI_PRR	0x308
> +#define SYS_LSI_DEVID_REV	GENMASK(31, 28)
> +#define SYS_LSI_DEVID_SPECIFIC	GENMASK(27, 0)
> +#define SYS_LSI_PRR_CA55_DIS	BIT(8)
> +#define SYS_LSI_PRR_NPU_DIS	BIT(1)
> +/*
> + * BOOTPLLCA[1:0]
> + *	[0,0] => 1.1GHZ
> + *	[0,1] => 1.5GHZ
> + *	[1,0] => 1.6GHZ
> + *	[1,1] => 1.7GHZ
> + */
> +#define SYS_LSI_MODE_STAT_BOOTPLLCA55	GENMASK(12, 11)
> +#define SYS_LSI_MODE_CA55_1_7GHz	0x3
> +
> +static void rzg3e_extended_device_identification(struct device *dev,
> +				void __iomem *sysc_base,
> +				struct soc_device_attribute *soc_dev_attr)

Not strong preference here, I think it can still be aligned to (

> +{
> +	u32 prr_val, mode_val;
> +	bool is_quad_core, npu_enabled;

Reverse christmass tree order?

> +
> +	prr_val = readl(sysc_base + SYS_LSI_PRR);
> +	mode_val = readl(sysc_base + SYS_LSI_MODE);
> +
> +	/* Check CPU and NPU configuration */
> +	is_quad_core = !(prr_val & SYS_LSI_PRR_CA55_DIS);
> +	npu_enabled = !(prr_val & SYS_LSI_PRR_NPU_DIS);
> +
> +	dev_info(dev, "Detected Renesas %s Core %s %s Rev %s  %s\n",

I think you have an extra space towards the end: "%s  %s"

> +		 is_quad_core ? "Quad" : "Dual",
> +		 soc_dev_attr->family,
> +		 soc_dev_attr->soc_id,
> +		 soc_dev_attr->revision,
> +		 npu_enabled ? "with Ethos-U55" : "");
> +
> +	/* Check CA55 PLL configuration */
> +	if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHz)
> +		dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
> +}
> +
> +static const struct rz_sysc_soc_id_init_data rzg3e_sysc_soc_id_init_data __initconst = {
> +	.family = "RZ/G3E",
> +	.id = 0x8679447,
> +	.offset = SYS_LSI_DEVID,
> +	.revision_mask = SYS_LSI_DEVID_REV,
> +	.specific_id_mask = SYS_LSI_DEVID_SPECIFIC,
> +	.extended_device_identification = rzg3e_extended_device_identification,
> +};
> +
> +const struct rz_sysc_init_data rzg3e_sysc_init_data = {
> +	.soc_id_init_data = &rzg3e_sysc_soc_id_init_data,
> +};
> diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
> index d34d295831b8..515eca249b6e 100644
> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -231,7 +231,7 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
>  
>  	soc_id_start = strchr(match->compatible, ',') + 1;
>  	soc_id_end = strchr(match->compatible, '-');
> -	size = soc_id_end - soc_id_start;
> +	size = soc_id_end - soc_id_start + 1;

This may worth a different patch.

>  	if (size > 32)
>  		size = 32;
>  	strscpy(soc_id, soc_id_start, size);
> @@ -257,8 +257,16 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
>  		return -ENODEV;
>  	}
>  
> -	dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n", soc_dev_attr->family,
> -		 soc_dev_attr->soc_id, soc_dev_attr->revision);
> +	/* Try to call SoC-specific device identification */
> +	if (soc_data->extended_device_identification) {
> +		soc_data->extended_device_identification(sysc->dev, sysc->base,
> +							 soc_dev_attr);
> +	} else {
> +		dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n",
> +			 soc_dev_attr->family,
> +			 soc_dev_attr->soc_id,
> +			 soc_dev_attr->revision);
> +	}
>  
>  	soc_dev = soc_device_register(soc_dev_attr);
>  	if (IS_ERR(soc_dev))
> @@ -283,6 +291,9 @@ static struct regmap_config rz_sysc_regmap = {
>  static const struct of_device_id rz_sysc_match[] = {
>  #ifdef CONFIG_SYSC_R9A08G045
>  	{ .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
> +#endif
> +#ifdef CONFIG_SYSC_R9A09G047
> +	{ .compatible = "renesas,r9a09g047-sys", .data = &rzg3e_sysc_init_data },
>  #endif
>  	{ }
>  };
> @@ -315,20 +326,25 @@ static int rz_sysc_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	data = match->data;
> -	if (!data->max_register_offset)
> -		return -EINVAL;

The idea with this was to still have the syscon regmap registered no matter
the signals are available or not. This may be needed for other use cases.

> +	if (data->signals_init_data) {

I'd prefer to have this check in rz_sysc_signals_init(). In this way you
have everything signal init specific in a single function.

> +		if (!data->max_register_offset)
> +			return -EINVAL;
>  
> -	ret = rz_sysc_signals_init(sysc, data->signals_init_data, data->num_signals);
> -	if (ret)
> -		return ret;
> +		ret = rz_sysc_signals_init(sysc, data->signals_init_data, data->num_signals);
> +		if (ret)
> +			return ret;
> +
> +		rz_sysc_regmap.max_register = data->max_register_offset;
> +		dev_set_drvdata(dev, sysc);

Why changed the initial order?

Thank you,
Claudiu

>  
> -	dev_set_drvdata(dev, sysc);
> -	rz_sysc_regmap.max_register = data->max_register_offset;
> -	regmap = devm_regmap_init(dev, NULL, sysc, &rz_sysc_regmap);
> -	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> +		regmap = devm_regmap_init(dev, NULL, sysc, &rz_sysc_regmap);
> +		if (IS_ERR(regmap))
> +			return PTR_ERR(regmap);
>  
> -	return of_syscon_register_regmap(dev->of_node, regmap);
> +		return of_syscon_register_regmap(dev->of_node, regmap);
> +	}
> +
> +	return 0;
>  }
>  
>  static struct platform_driver rz_sysc_driver = {
> diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
> index babca9c743c7..2b5ad41cef9e 100644
> --- a/drivers/soc/renesas/rz-sysc.h
> +++ b/drivers/soc/renesas/rz-sysc.h
> @@ -8,7 +8,9 @@
>  #ifndef __SOC_RENESAS_RZ_SYSC_H__
>  #define __SOC_RENESAS_RZ_SYSC_H__
>  
> +#include <linux/device.h>
>  #include <linux/refcount.h>
> +#include <linux/sys_soc.h>
>  #include <linux/types.h>
>  
>  /**
> @@ -42,6 +44,7 @@ struct rz_sysc_signal {
>   * @offset: SYSC SoC ID register offset
>   * @revision_mask: SYSC SoC ID revision mask
>   * @specific_id_mask: SYSC SoC ID specific ID mask
> + * @extended_device_identification: SoC-specific extended device identification
>   */
>  struct rz_sysc_soc_id_init_data {
>  	const char * const family;
> @@ -49,6 +52,9 @@ struct rz_sysc_soc_id_init_data {
>  	u32 offset;
>  	u32 revision_mask;
>  	u32 specific_id_mask;
> +	void (*extended_device_identification)(struct device *dev,
> +		void __iomem *sysc_base,
> +		struct soc_device_attribute *soc_dev_attr);
>  };
>  
>  /**
> @@ -65,6 +71,7 @@ struct rz_sysc_init_data {
>  	u32 max_register_offset;
>  };
>  
> +extern const struct rz_sysc_init_data rzg3e_sysc_init_data;
>  extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
>  
>  #endif /* __SOC_RENESAS_RZ_SYSC_H__ */

