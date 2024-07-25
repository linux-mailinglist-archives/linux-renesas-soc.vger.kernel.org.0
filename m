Return-Path: <linux-renesas-soc+bounces-7525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 862FC93C476
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 16:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 418D3284B7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 14:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9BC19D091;
	Thu, 25 Jul 2024 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XiE51TIG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BAC19D066
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jul 2024 14:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721918399; cv=none; b=G41aDOIZg54tqBONtcutzdeQyMIgq/Gizo7Q6fHQZXOi7iQigh5U9GgQV0IhbJkLsJbZ/s8lXtE9/LyBxd4ONZVdSaPFYjQehnWPFfHwHW5QSZQZM4uDxHbgHh9860zjEUtaH+uGvICQfUTohvlfM4rE9SBj07xhkfNTwN4hCwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721918399; c=relaxed/simple;
	bh=0jprevtwm97HPlvDbJ8iak+QX7zBxOzWXvkyqSqMkaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RjVdJawGOaGVXcqNV7YbYP/z6i5eONKZq60cPRLQpXN8394IozLP+tQHb1mXf5IePsmHuz82qeBMkuA08gxykzyghhcs6odfu/mkg55HnUvIlBuVqAxRKXRmGHa6nCM270ONLBefh5787aZkU6Fys/g7rxDiBw3DczDU1sBeEfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XiE51TIG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3683178b226so606815f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jul 2024 07:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721918396; x=1722523196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EmNcaMBYjNffFp8Y9eqYmsbKgIfRFa8ntga4/Bnlk8U=;
        b=XiE51TIG0QSwxM6R7gAJhuGIKhU8Wwv8LqrMssvrQkEr9uGbDiE2G6iX5nrP6LGlVR
         YjfWORVvdZzJJBiIMFOoW3I1dZdcBxoAm1XqJ/NQJ1ulUKmYi8UAkvhswnD6NQNryhDy
         Oa4/mk+XZxRMPm05/HOalEMueflQllHl1JTSXhKOgZt2auJez+pYDWLS8Gcfl/E8fN+L
         BZS1nZ+3Y+jCvbX26wUwkE6BsZcvAMuH25wjjebmIOeUV2l0Y4FAiI9gOrNLudTElrtv
         YbUAJxJznlKZidOwZFj4ctT7xQ4hr5EpWmdAJcB89SPA4gpmqwdhh69R7qHyJVQqnzJL
         outQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721918396; x=1722523196;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EmNcaMBYjNffFp8Y9eqYmsbKgIfRFa8ntga4/Bnlk8U=;
        b=DGqIUy0P2MoezuJklZKvxvSZdlW3ojT0ztHoIavoFVsFoTjcGkGhIE4Dhunmtv2jrf
         xtcGSopy5VeoxSA15PWr1nkv5idTw+yllx7+2ikX9KYZQmUZ/By9knIuB7HkyEK7xOuX
         Ff/8eszLdsxjoSi+w923wZ4vEVTU97Wy7Xpf808zq5ke4vBXt/4hPYmCF28+S25B1PTQ
         GsayZJc5gyIthgOQxBp1AZB2F64uCvCV/Cwrsl1K4pvnXPdojE8WsfSATBvQZHsohtBq
         HAUOGT1FQmPv7/2ph/cTNIX3Ythrku5qPl67f8hu++7qEaLeSeQf6Ev6G8DuQVuRcPJd
         TVGw==
X-Gm-Message-State: AOJu0YzYZi6uWbHVSVQtu3zki+bSzYoYzY41fHuol8Qd9yrgieuk7emR
	98LZzyynRJzecPh0PItfw0LwZaYkoZEylRiEJfjHf9rww/2XGmGUnuaxoV2xT6A=
X-Google-Smtp-Source: AGHT+IGf7oywhAAEa3IVVaOAoTIXoWXB5zTQ9uLQU8Ixr/J7YCMLGoCiSQGBGBt7sL48QVY7/UM+8A==
X-Received: by 2002:adf:fe0c:0:b0:368:6596:c60c with SMTP id ffacd0b85a97d-36b3639dc76mr1767102f8f.30.1721918395512;
        Thu, 25 Jul 2024 07:39:55 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857dc2sm2403560f8f.77.2024.07.25.07.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 07:39:55 -0700 (PDT)
Message-ID: <97233c2e-78ff-40a0-b808-6929deff4427@tuxon.dev>
Date: Thu, 25 Jul 2024 17:39:53 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Return -EINVAL if the pin
 doesn't support PIN_CFG_OEN
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240723164744.505233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240723164744.505233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23.07.2024 19:47, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the rzg2l_pinctrl_pinconf_get() function to return -EINVAL for
> PIN_CONFIG_OUTPUT_ENABLE config if the pin doesn't support the PIN_CFG_OEN
> configuration.
> 
> -EINVAL is a valid error when dumping the pin configurations. Returning
> -EOPNOTSUPP for a pin that does not support PIN_CFG_OEN resulted in the
> message 'ERROR READING CONFIG SETTING 16' being printed during dumping
> pinconf-pins.
> 
> For consistency do similar change in rzg2l_pinctrl_pinconf_set() for
> PIN_CONFIG_OUTPUT_ENABLE config.
> 
> Fixes: a9024a323af2 ("pinctrl: renesas: rzg2l: Clean up and refactor OEN read/write functions")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 632180570b70..3ef20f2fa88e 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1261,7 +1261,9 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>  		break;
>  
>  	case PIN_CONFIG_OUTPUT_ENABLE:
> -		if (!pctrl->data->oen_read || !(cfg & PIN_CFG_OEN))
> +		if (!(cfg & PIN_CFG_OEN))
> +			return -EINVAL;
> +		if (!pctrl->data->oen_read)
>  			return -EOPNOTSUPP;
>  		arg = pctrl->data->oen_read(pctrl, _pin);
>  		if (!arg)
> @@ -1402,7 +1404,9 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
>  
>  		case PIN_CONFIG_OUTPUT_ENABLE:
>  			arg = pinconf_to_config_argument(_configs[i]);
> -			if (!pctrl->data->oen_write || !(cfg & PIN_CFG_OEN))
> +			if (!(cfg & PIN_CFG_OEN))
> +				return -EINVAL;
> +			if (!pctrl->data->oen_write)
>  				return -EOPNOTSUPP;
>  			ret = pctrl->data->oen_write(pctrl, _pin, !!arg);
>  			if (ret)

