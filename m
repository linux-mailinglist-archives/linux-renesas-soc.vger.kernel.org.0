Return-Path: <linux-renesas-soc+bounces-11657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F11A9F9565
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 16:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 066E41881C1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 15:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6195215771;
	Fri, 20 Dec 2024 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbtslLst"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1314D215713;
	Fri, 20 Dec 2024 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708290; cv=none; b=CkwfHuxfHasJgkRSHl5jep0agFNC+CUerqCyIAkZZZInj3YmvjaU6NgxLqiO90bmeXjaJYxWPP8sHd/L+TKnpcLKCNfEAE38YU/MOvh0muCjs4zvV++gQSnffqVtG3cTNgsYEe9SjpGl7zyYdpytZwC7x9Fbd2XMhJQMFpozm5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708290; c=relaxed/simple;
	bh=pXikdaJUCLOGzdlawjDnExzmnhDeuW7zWsHS/5fxzrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=in5dwJZYlgo8aX1d+EAIJT1cn670vvlMu+1/2hjeeZx4QtQMT1Czbmex3zqXAh0DF69zy62rM3EU54A669rLcgGzmHRcPshYxjOxEnT3h381bh8Tm6FPMbHceQcEMbKF4Iz0EA8WEYAwmP+y1QR2XncklpjLYsTysnYHl2bBTLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbtslLst; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2163bd70069so19395425ad.0;
        Fri, 20 Dec 2024 07:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734708288; x=1735313088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vaPwXdSGxTikOreprKI54nLBPwiu4ErSEtGhCrMqEGo=;
        b=mbtslLstr1gcNJ48coAMjdb1yjHREOlrANoGQLHkKh+0nKo0Rkqa6gJBXrvvHnt9c1
         a82Xav+6+0Q6B4t+wQ0FFgxzdy20tV7+UvDxjhjQXKkWl2jtC2mDo+zmNMTSeitfpSTt
         AUrabXmKofvpYnefxUmAnSUdxj60LRkHxlOAp5yGpNKpGMAxPGGX7zPY43SPpGxuonF7
         BbYeWUsUH57Y/v2JE9G4Kh/m2uc9+eafjXY6l7Rs7xF7UfK9jLUUecbMbVJ1GKAITrnO
         smFtM1adAAfYmyX+IEWtwcYv+4fEib4E1Dgg7InXWN0JhOMQidxMSRf8t2ZnzTctEc9M
         2siQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734708288; x=1735313088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaPwXdSGxTikOreprKI54nLBPwiu4ErSEtGhCrMqEGo=;
        b=KlqIxdzztVcI8U0XMgA5x7p1TT0lO1s1jac0kkvHcPQLl58tXTe3NPeQOrnSKgrexG
         PatFhYojBDyU7FHvEDoppaUPsh2xp92aLLrNL+Tc00cXaSGGnJkV0z1S11DNc0IfRdfi
         tQ0OnjYAjF5w4PCbOl8GEsKrwMD1gIjzhtXehuZPdI3x3I8HVv8JYPqdwK3fJe0QOddT
         wXm6raH6kUiQeax6Xi+R0GX/W/REg0FskWBbVpGWGi9pR0ice/cpsr0PkD+iLfpoU4EU
         QZlw/2VAya78oXdBXRFa0MAr3nceAk5rO8Im5wlZGvidksZtGoCMx7OjGUw11ZWnHAWX
         HABQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvEE+TpHXcK8QsaP14ymlFJsJwCk0rODNl0fvjZxdgTLI5qDfhZDiUULjbNujVyNrUvUwTH/J1fb6oyRqBNAUU4wo=@vger.kernel.org, AJvYcCXqLljv9nNzSreHZSbbOQJJbrkSTnTH4SCeMzF8vLQE+tHgRCefhPncM8xhHpcH7Y078Vov1Hgr7So1sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwovPwNw+RJ97xcM+p8hFbuWlKjora2Zg8ZenETSg2krrD7AvCn
	PcpX4bgVKC/Sf5Cb/wTHQ8f1fKOcgJcazGkT47WblcpDTD1lLEI/
X-Gm-Gg: ASbGncvaWc+G9LOggtcv0iGjBJg85tM+qoHTNkRbhiTf37IeeyIBQpEvoRg5KpSZAY4
	ItLYtDgy1rUPcdnGiHwvBYOofcI2K2B55J6bihyE8+wHCgZgveD+PqBHdii78APKaz8qCGeeM/Q
	qN/yZZ8Ett9nQ5zywbwg52UhmEaokZg/o8z1PYKUro5s/nhx9Vc6OhwcoC/WkzCohtsA8km7GSM
	VyFmv+ZORROtBvh0B3P+iG37zarELXub2QPE0oqU6qyflQi//M3j6TO6SasfXPRKbbEjmXpaA3v
	g6AbAVaGB9LwLi55hVx1n0sxFHnxLg==
X-Google-Smtp-Source: AGHT+IFc0tDBQIExTRgAU/UOyXBBhZH4Q7YMr6TicyInb9pCbsMo+HAPau1++hfyct8bVkzFIedrww==
X-Received: by 2002:a17:902:cf0e:b0:216:3dc5:1230 with SMTP id d9443c01a7336-219e6f13cb9mr51010145ad.42.1734708288133;
        Fri, 20 Dec 2024 07:24:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962defsm30344895ad.57.2024.12.20.07.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 07:24:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d1d5cfa4-b2b0-470f-a9aa-88f7b1266e5f@roeck-us.net>
Date: Fri, 20 Dec 2024 07:24:46 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT RESEND 2/5] hwmon: (spd5118) Use generic parity
 calculation
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>, linux-i3c@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
 <20241220113335.17937-3-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241220113335.17937-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/24 03:33, Wolfram Sang wrote:
> Make use of the new generic helper for calculating the parity.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>

I just noticed I replied to the original version, so here it is again:

For the record:

Acked-by: Guenter Roeck <linux@roeck-us.net>

I don't care about the function name, so please retain the tags if/when
changing it.

Thanks,
Guenter

> ---
>   drivers/hwmon/spd5118.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 6cee48a3e5c3..07ab3a47b00c 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -291,12 +291,6 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
>   	}
>   }
>   
> -static inline bool spd5118_parity8(u8 w)
> -{
> -	w ^= w >> 4;
> -	return (0x6996 >> (w & 0xf)) & 1;
> -}
> -
>   /*
>    * Bank and vendor id are 8-bit fields with seven data bits and odd parity.
>    * Vendor IDs 0 and 0x7f are invalid.
> @@ -304,7 +298,7 @@ static inline bool spd5118_parity8(u8 w)
>    */
>   static bool spd5118_vendor_valid(u8 bank, u8 id)
>   {
> -	if (!spd5118_parity8(bank) || !spd5118_parity8(id))
> +	if (get_parity8(bank) == 0 || get_parity8(id) == 0)
>   		return false;
>   
>   	id &= 0x7f;


