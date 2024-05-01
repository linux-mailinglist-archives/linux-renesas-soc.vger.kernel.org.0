Return-Path: <linux-renesas-soc+bounces-5008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0884C8B8B36
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 May 2024 15:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19446B209E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 May 2024 13:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731CE85C66;
	Wed,  1 May 2024 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="tjUJJWYA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DE65029A
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 May 2024 13:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714570268; cv=none; b=hnH20oCgCN4p0lzz6S5USGJjW7uQWILis9bAPrrQexl2gnarLg77YSCVGPYg3rx9LQyn96l+re7f5g75wlq5XAYSatkDCkLPvSkGPyKzXvDZ+gmPr2i7QS9968diKZnnr7e9ntUlEqrrhkoBgaQYHFX9GRDCDqtO3dIWYTjPLdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714570268; c=relaxed/simple;
	bh=GOV9SpBdrbLUHNqrWyub6cb3BrALMYIpAncwmbro2yc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6Vq54QYe2CcwRFw8claHwaVd+c3oTnGez163OYdtJdJt6WJxIjkDpmNpu3zV1ulTAhIYt+oxeZzJFvRNQJfGndls9jZvTlOv88YmtloxvhWMxuc+XUmhZqbU5ZgQ+uruodt71wDvyPYp5jmakVgO9TUh345dQWy2wZNzD2Q2zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=tjUJJWYA; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B9F4E424A0
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 May 2024 13:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714570260;
	bh=c8oK9gFYZNPK8JjkQaEUib/TlJXrHwdRQFsXpehmfQo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=tjUJJWYAm037n+X+UwTKteZdNy6632ZFnwu71KGJdInaF/7ZyZ5OHcbuRmgzITc5D
	 ZBySWeb18UGuT68L6WPUyzb8VsxFARFrkX1CCKY31C7XiWiBiZgcYH43xGVfvUXA0x
	 dends1qVDcrj83j/BNwKJTcFTYLeLCdmYJS6HhoelNxzQmhEOsJFqXn3N15jCsJ8b3
	 29lLID7aDaYIFp745OAylulNt2eibyhj8KjdIeDECREkuF5ocq3Fky3vEWBQTyT9Qo
	 D/pxHrqHK0Q5XsjkrVoS6WOJFdtbS0oZUyGULkZqPkjsZadqYgLBi/l5ADm0yyhWz6
	 lViiOMZM4X7tA==
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2da7cd1400fso2994481fa.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 May 2024 06:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714570258; x=1715175058;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8oK9gFYZNPK8JjkQaEUib/TlJXrHwdRQFsXpehmfQo=;
        b=gSQM8endTx2g52b10/9B4Y3vEtltv7uS2Ofmd16Ptv39/hKsT1D+g9fmvnvh89e8Yr
         vwOVJvp5eN/zgCB72GtPCyfhBOSkXfKKSNvQnlCBAwBj6JJ0P7Px8lTu2r01GFFsUznm
         uxPZd8+0uVrSMhix6UY6FG/3ODYw5xVlJO2cs4/IL4rhVWIRMXN9bPfUQ3OLMIOXH+NT
         sKKJQjJLqyQEvuIWNZy+YqpMYDcAjbFmbJf+lLK/aARTy+KAYNFLPAjk5SSN7sfcKoXX
         hxgS1ISaoTIKQkD9Ka/KOy1F3ONhtmPJENEMDMQZPW4Yxmt7zzB5UN+AsQh7OKKic9Y7
         aJwA==
X-Forwarded-Encrypted: i=1; AJvYcCWOtaqOOEaFk4JaveNsgyJkzpQKUVcPSj827gFcotLYtLa8QzIP7vtsxLc2MBxAj0/y0klvjDzx0hOdqSl3JV4fHJdD1xHj4Nh770ZqD/if2NA=
X-Gm-Message-State: AOJu0Yz1TwIwvCkgm0q53WRKC7xi2YgSD4glcioh7yhGzWOWt1/djcfi
	yXSJtXna5Ghgt8Cw5vxMdtwOggsUq/GmtmkFh3WSIpXD/BF13J6pJs9lhN570ycF6El/8CLStU1
	hbnHB6LZdxKy6wjeICtqEhbLE2C124cWKJnfm7qsIz954eMwBv2CySX9+5VlVMpRIw46Jf+8lDZ
	i3WMqcjf1uSG9vuh9/kLLw7Ccx3eLpWbkf6vIFL+wDUHYrIYRIrHiuTgDzqU8=
X-Received: by 2002:a2e:a7ce:0:b0:2df:8ce6:96cb with SMTP id x14-20020a2ea7ce000000b002df8ce696cbmr955425ljp.8.1714570258101;
        Wed, 01 May 2024 06:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYT+qTSOE1Kr9KmhXevsjrdrGfobx9Pel64hRtY96pMsR8tg00NtEJfiVi5E4mSMS1jyTIKo1grrZjSHhuefw=
X-Received: by 2002:a2e:a7ce:0:b0:2df:8ce6:96cb with SMTP id
 x14-20020a2ea7ce000000b002df8ce696cbmr955417ljp.8.1714570257684; Wed, 01 May
 2024 06:30:57 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 May 2024 08:30:56 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240501-pinctrl-cleanup-v1-5-797ceca46e5c@nxp.com>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com> <20240501-pinctrl-cleanup-v1-5-797ceca46e5c@nxp.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 1 May 2024 08:30:56 -0500
Message-ID: <CAJM55Z9RuobAMR4EaevhTPRsJe3vuruV7-_DTQYpH_w8_azkcA@mail.gmail.com>
Subject: Re: [PATCH 05/21] pinctrl: starfive: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 27 +++++++++-------------
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 18 +++++++--------
>  2 files changed, 19 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 6df7a310c7ed..27f99183d994 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -480,7 +480,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  {
>  	struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
>  	struct device *dev = sfp->gc.parent;
> -	struct device_node *child;
>  	struct pinctrl_map *map;
>  	const char **pgnames;
>  	const char *grpname;
> @@ -492,20 +491,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>  	nmaps = 0;
>  	ngroups = 0;
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npinmux = of_property_count_u32_elems(child, "pinmux");
>  		int npins   = of_property_count_u32_elems(child, "pins");
>
>  		if (npinmux > 0 && npins > 0) {
>  			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: both pinmux and pins set\n",
>  				np, child);
> -			of_node_put(child);
>  			return -EINVAL;
>  		}
>  		if (npinmux == 0 && npins == 0) {
>  			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: neither pinmux nor pins set\n",
>  				np, child);
> -			of_node_put(child);
>  			return -EINVAL;
>  		}
>
> @@ -527,14 +524,14 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	nmaps = 0;
>  	ngroups = 0;
>  	mutex_lock(&sfp->mutex);
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npins;
>  		int i;
>
>  		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", np, child);
>  		if (!grpname) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pgnames[ngroups++] = grpname;
> @@ -543,18 +540,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  			if (!pins) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  			if (!pinmux) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			ret = of_property_read_u32_array(child, "pinmux", pinmux, npins);
>  			if (ret)
> -				goto put_child;
> +				goto free_map;
>
>  			for (i = 0; i < npins; i++) {
>  				unsigned int gpio = starfive_pinmux_to_gpio(pinmux[i]);
> @@ -570,7 +567,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  			if (!pins) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			pinmux = NULL;
> @@ -580,18 +577,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>  				ret = of_property_read_u32_index(child, "pins", i, &v);
>  				if (ret)
> -					goto put_child;
> +					goto free_map;
>  				pins[i] = v;
>  			}
>  		} else {
>  			ret = -EINVAL;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinctrl_generic_add_group(pctldev, grpname, pins, npins, pinmux);
>  		if (ret < 0) {
>  			dev_err(dev, "error adding group %s: %d\n", grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinconf_generic_parse_dt_config(child, pctldev,
> @@ -600,7 +597,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		if (ret) {
>  			dev_err(dev, "error parsing pin config of group %s: %d\n",
>  				grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		/* don't create a map if there are no pinconf settings */
> @@ -623,8 +620,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	mutex_unlock(&sfp->mutex);
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index 9609eb1ecc3d..4ce080caa233 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -150,7 +150,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	nmaps = 0;
>  	ngroups = 0;
>  	mutex_lock(&sfp->mutex);
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npins = of_property_count_u32_elems(child, "pinmux");
>  		int *pins;
>  		u32 *pinmux;
> @@ -161,13 +161,13 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  				"invalid pinctrl group %pOFn.%pOFn: pinmux not set\n",
>  				np, child);
>  			ret = -EINVAL;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", np, child);
>  		if (!grpname) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pgnames[ngroups++] = grpname;
> @@ -175,18 +175,18 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  		if (!pins) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  		if (!pinmux) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = of_property_read_u32_array(child, "pinmux", pinmux, npins);
>  		if (ret)
> -			goto put_child;
> +			goto free_map;
>
>  		for (i = 0; i < npins; i++)
>  			pins[i] = jh7110_pinmux_pin(pinmux[i]);
> @@ -200,7 +200,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  						pins, npins, pinmux);
>  		if (ret < 0) {
>  			dev_err(dev, "error adding group %s: %d\n", grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinconf_generic_parse_dt_config(child, pctldev,
> @@ -209,7 +209,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		if (ret) {
>  			dev_err(dev, "error parsing pin config of group %s: %d\n",
>  				grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		/* don't create a map if there are no pinconf settings */
> @@ -233,8 +233,6 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	*num_maps = nmaps;
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);
>
> --
> 2.37.1
>

