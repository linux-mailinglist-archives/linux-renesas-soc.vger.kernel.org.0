Return-Path: <linux-renesas-soc+bounces-21017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD54B39F20
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 15:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42586166204
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 13:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4841E25F2;
	Thu, 28 Aug 2025 13:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9Q4yJ2P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD10F18EFD1;
	Thu, 28 Aug 2025 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756388268; cv=none; b=dYKg4Sqs5d7vowzyCI18w+OpWt3QbAhO1fuxekMoV/u5mnGQOanm2Zm1/H4JoGrZR3xKcyoLLpoWXzldSmdJpaNSS1lON3WSRdxdFvaD/6BqIi2Jw9A3tNRbpv//XnAOJrQZp8376Ra7n5k+rqH/0TGKdTkAcwalyb5BfuwNwXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756388268; c=relaxed/simple;
	bh=9Ce/W35oWvelfmkxhoyjQLrtez3p+dryObvreb+8eQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJe5r6hxKyg8KODCctGCL63F97VHgTL5WSdxCynesThziMP/JRkp0DnhCL/PkKtxQtw7gLV6acF8dNwKi/tMl2Kl8R8fgd9UhfI2vF75MEd06b7QBRpcCWlZsgc/2WczgHRUlbmLjIH7pkEgk3cFSrOszv6pUcnTT9s7QEjdmpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9Q4yJ2P; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so927611e87.0;
        Thu, 28 Aug 2025 06:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756388265; x=1756993065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=stnYH4y/xplcMQcZfyhGCy9GfHgrdS4G/f0xvUxV7ZI=;
        b=F9Q4yJ2PsEzp+vwtSUJOpF1Dqd3FANOtZRg9RekIEvMB5mTYd0R1ylM3HW3vnOH6XN
         aXf8fGOW23C8qt0B6c7WmAl+vrtJ277E2xHqqNGVFO5d4aA+CTdBnS2MDedOtzDvG1dj
         aEXaIf3INRiaZICZos/z3oHgTCS3FvcjL97ohhb/OAJ7yQJswUyIOqKapd88twzEDOCT
         hIOeZtP1X3TzoCnfgmyp3Vcyl0UVpq+HLCw/JjMEXSuO7GHi85uZGfLLMewbLQPO8vHb
         ga0zI2eGVvqJEpAXvn6fujJmPbcRLmBHqLbaZpkuMTMJdUuVV/GBtLwPlP/OgM8MyhBI
         V+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756388265; x=1756993065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=stnYH4y/xplcMQcZfyhGCy9GfHgrdS4G/f0xvUxV7ZI=;
        b=YL3zslYercF4DWwlPjlsgLmVxwpVFkERNFoPmG9SMNGPXKdvcEdLPujdjWx3W/Z+IJ
         CtnGgpvqW2GePIELjt2hqegVbx0wlGnjz61U+uVym0W6qmDIaTrCkYcJLvaZxapdujV3
         W6HMm/IsbXuWk0N8gwB3G3YHjI43Kov0oIqQ671twXRdV53GgxB0VJ+xLaxH12uHbRe/
         /MO0YZNQ5zCYv0vmLQOdqI0t1f6onfg5BywdslaVIawhSTL/HZzWlAoUIgetaXwqYq5i
         5aRdIbtxI0DlcPEYhrUupmhW6hXvU7xawyyOfPjOgBwsaTh/K1IOiZtX3gw0m/cH+eyq
         HU4A==
X-Forwarded-Encrypted: i=1; AJvYcCUCxGFkV/QrmMvCQXZoM9TbvO0gdzdz8a+97hgqf6VGHSKIW4fIbwEQKOT8yQ6oZ+9RUkRsHAOXvMBuK/AEx+PjcFM=@vger.kernel.org, AJvYcCXqTcjcq33O5fO38Qkv9w96ZhZCm8/VKz1pTKEmpqdbEEqugRgHw6PBrxs5eOq/J/0etu77VSzb/WuHEik=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVYwUv88L825U2z6ve5vSPNkiSNRf7ngJS/zaX6e8wvKFu8FkX
	h8r26QOW7fCJE3RK8EgPxEw8cN9aXqksJ296EzIY1+d80EYRqQ6ohdN6
X-Gm-Gg: ASbGncs1RHi+sm0ljUtojFW6EavOkxctRA80iMPcZO6gGG5dVPn6pFPIYV/+8Tu/Aal
	0+HVqri+2j6kWW6LPTLPcpj3gX6irFgrBeDZHyDiDn+A/sV+6KNjZhPRJ2GFIAlrlMdnrhV9VZ0
	YUD7YYiEPppiEV/zfrd2Eeb5848ZzHDwEJG3g7TVZmfJZE19R4XCoHXG/KHEDnnMfiD2dzY7Pgk
	wP6M+rT0zYynzoWbi4PMpq5AOOtfOT5EjhBPDZtn8dKNTLMZ7EZPfBq7RcCy+YHxL+88HsJY0UG
	w2EZrf8ruhf1uWQrZatOsYL5OngM6RZBzrxgwu3fHcJSLslzF3fg3sf4i2LiKQ4Th2XTdpPAmvb
	5X3DElL3uz7WbWCSY+JDp3A0Z3/7+hEPECo7YhtNDqRy0FRjDwRlQlbdBHOYQJKGjWbqy8wucuP
	zMEWAk
X-Google-Smtp-Source: AGHT+IGcNhbfn1Bc8fASS6eSKk4e0Xop0qfGCIwRE1/k0Yqvx634N1auYXoEa1j/HIApoPOin1IaiQ==
X-Received: by 2002:a05:6512:6410:b0:55b:7582:28d0 with SMTP id 2adb3069b0e04-55f0c6b4ed3mr6221401e87.21.1756388264699;
        Thu, 28 Aug 2025 06:37:44 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4609:e730:cf85:492f:8236:ddbf? ([2a00:1fa0:4609:e730:cf85:492f:8236:ddbf])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f3f260c7asm2852684e87.126.2025.08.28.06.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 06:37:44 -0700 (PDT)
Message-ID: <638d337a-6485-4eb3-a53c-c6fd7dadafbc@gmail.com>
Date: Thu, 28 Aug 2025 16:37:42 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 4/4] net: renesas: rswitch: add modifiable
 ageing time
To: Michael Dege <michael.dege@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
References: <20250828-add_l2_switching-v4-0-89d7108c8592@renesas.com>
 <20250828-add_l2_switching-v4-4-89d7108c8592@renesas.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20250828-add_l2_switching-v4-4-89d7108c8592@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/28/25 1:23 PM, Michael Dege wrote:

> This commit allows the setting of the MAC table aging in the R-Car S4

    Please just use the imperative mood: Allow the setting...

> Rswitch using the SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME attribute.
> 
> Signed-off-by: Michael Dege <michael.dege@renesas.com>
> ---
>  drivers/net/ethernet/renesas/rswitch_l2.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
> index 49a24464dbb0cf3f3219a0699fc4671ddd71ef03..c57396af70a4b291746d6451eae7cf60b3f89721 100644
> --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
> @@ -193,6 +193,25 @@ static int rswitch_netdevice_event(struct notifier_block *nb,
>  	return NOTIFY_OK;
>  }
>  
> +static int rswitch_update_ageing_time(struct net_device *ndev, clock_t time)
> +{
> +	struct rswitch_device *rdev = netdev_priv(ndev);
> +	u32 reg_val;
> +
> +	if (!is_rdev(ndev))
> +		return -ENODEV;
> +
> +	if (!FIELD_FIT(FWMACAGC_MACAGT, time))
> +		return -EINVAL;
> +
> +	rdev = netdev_priv(ndev);

   Haven't you already initialized rdev to the same value above?

[...]

MBR, Sergey


