Return-Path: <linux-renesas-soc+bounces-8846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 522C99701C0
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Sep 2024 12:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3F8FB231E0
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Sep 2024 10:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B1B158541;
	Sat,  7 Sep 2024 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TWIHDdHO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21061494B2
	for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Sep 2024 10:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725706462; cv=none; b=s4MKAO8m3PDSHbQGA+UzEEP8qG1b9AQyQW9Rw8RK0/K1AbTVpVKz+WD+tIXt1g6koEGgVuaj6FTeCCXhuNGKBGmEiARDW4oiEZ0oMjSzV83eOnRtZd/X5sWHgXYzr6BQXgdN0oSiTS8mNRe8re4XPT5swo7HL4Glp3qDorEpoEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725706462; c=relaxed/simple;
	bh=ttz6QujqbcoWK9ZdW9j6fo1xJtej3TvqF5hW95OPix4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t24J0b8eRepMt7Na5H3bq1bPKGLLrz/JrCpW22ElkeDZ1vl+JX1n289v1q8KHwX0krly5mU6z7VEYY5ji+pg/AXs970jxVfv8oiWI3T6OP5ZwzEU4pQJSS9e91AGhVAI8XW6r1c3n4zvtMi2oXXKlbzNPQDKfnSFRSCnOW3UIPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TWIHDdHO; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5365cc68efaso717635e87.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Sep 2024 03:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725706458; x=1726311258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVwVrEOArU7FwpUon+ECV4CIs36srlWh7bgYM3qj5Hc=;
        b=TWIHDdHOVE7JRtJ2bN5jCQP9DxNVHm++2/v0PfcxpdG9Vw+P8fCgoqy0Qth6BuqxiN
         8lCXz3ck7KT536zEkb7lbnoo3V3ly8Z15wcSHQwI/TsA0pzEIlPIvlB9CQBzmHrY+C+u
         4W45aN+YRp6DDWaRc/uo1mUmHk9KjRtsNfGkoMuDtTTBi/HPjAON+wh9VMkceArtgNo3
         t6qY/sCetNRQZtMGa3CIf4vJLEBnCI4dGFeL+79S44/A5YbWnZ1sskTCYoSzgYeaL5sv
         qv4FR04lN/WbJGJ35P63c+Ijsxb+SXM/GoLYRKzcQwax6kubkJBWFKW31IbDGYzd9Ch5
         lmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725706458; x=1726311258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVwVrEOArU7FwpUon+ECV4CIs36srlWh7bgYM3qj5Hc=;
        b=kyX7clLSapesGUQRSLs57aXVyhzGoutlV56chCM0xdCz/MBrC5fhDvb8MfmC8Ew2Rl
         sTRYDD7y4OPqG1HsxhkyxHh8wuE8Tv7RvuVQC83BMFh6dcaa/+W+lQrYyw6ai+Y4p22P
         y/WA75gt+mpFw3E/Bx5iWdshxRx9t05ICoUKYweYTygm/Nz4FO6Kub9NRB+O2Jlp8qgp
         Z2iInX6eeyUUKqJUHI3HdVCUf5738BqjmqPoOjXvYaocDIDZld1cr63/6Mz7PJWFLZas
         LITv5dzcefC96gO9mz17/bm4VF0uqjX/ao/vCjoWhTOWXhe4DSuvFZ14ILethdujmgm0
         RakQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVRwoL1L35KBZa1C/8M6om2ToypL+zE/SXFUq8KVkw3Rkp/tPc4CnLm/m+5ZwQESHjAZwQpMbEmJvi57WbG66rQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR2V0+z5E7e1DVVGwlGil9drAl/9Dw1Qli3b4L8ooXUbDAqG+o
	oQIj0lPrlX8zeMV90FIFjDt58MR/7806fOBuPFbG8Eq+hlBlCYX+nF92TFwCOik=
X-Google-Smtp-Source: AGHT+IEdmtr9x/ifMm5TTSwNlrjIYLdnLwMl83PBidk7vRBxQxPxnHJnEwHzrGxiVKtPznz7zJrBwg==
X-Received: by 2002:a05:6512:6cf:b0:52c:850b:cfc6 with SMTP id 2adb3069b0e04-536587f5c84mr3582231e87.38.1725706457550;
        Sat, 07 Sep 2024 03:54:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835686sm58945766b.18.2024.09.07.03.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2024 03:54:17 -0700 (PDT)
Message-ID: <31112ec9-43cc-403b-a6c0-7e7804fdcda5@tuxon.dev>
Date: Sat, 7 Sep 2024 13:54:15 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Fix an error handling path
 in rcar_gen3_phy_usb2_probe()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org
References: <fc9f7b444f0ca645411868992bbe16514aeccfed.1725652654.git.christophe.jaillet@wanadoo.fr>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <fc9f7b444f0ca645411868992bbe16514aeccfed.1725652654.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Christophe,

On 06.09.2024 22:57, Christophe JAILLET wrote:
> If an error occurs after the rcar_gen3_phy_usb2_init_bus(),
> reset_control_assert() must be called, as already done in the remove
> function.
> 
> Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initialize the bus")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 58e123305152..8577056491de 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -770,7 +770,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  		if (IS_ERR(channel->rphys[i].phy)) {
>  			dev_err(dev, "Failed to create USB2 PHY\n");
>  			ret = PTR_ERR(channel->rphys[i].phy);
> -			goto error;
> +			goto err_control_assert;
>  		}
>  		channel->rphys[i].ch = channel;
>  		channel->rphys[i].int_enable_bits = rcar_gen3_int_enable[i];
> @@ -784,7 +784,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  	if (IS_ERR(channel->vbus)) {
>  		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER) {
>  			ret = PTR_ERR(channel->vbus);
> -			goto error;
> +			goto err_control_assert;
>  		}
>  		channel->vbus = NULL;
>  	}
> @@ -793,15 +793,17 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  	if (IS_ERR(provider)) {
>  		dev_err(dev, "Failed to register PHY provider\n");
>  		ret = PTR_ERR(provider);
> -		goto error;
> +		goto err_control_assert;
>  	} else if (channel->is_otg_channel) {
>  		ret = device_create_file(dev, &dev_attr_role);
>  		if (ret < 0)
> -			goto error;
> +			goto err_control_assert;
>  	}
>  
>  	return 0;
>  
> +err_control_assert:
> +	reset_control_assert(channel->rstc);
>  error:

It would be simpler to fix it by calling here:
	reset_control_assert(channel->rstc);

as it's the case for rcar_gen3_phy_usb2_remove().

Thank you,
Claudiu Beznea

>  	pm_runtime_disable(dev);
>  

