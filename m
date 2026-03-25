Return-Path: <linux-renesas-soc+bounces-30249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBATNgbww2k1vAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:24:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84836326B53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B4D030E6C2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373D93DEAC5;
	Wed, 25 Mar 2026 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4v6m8lI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FF63DE449
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774447979; cv=none; b=FIw/bZHwR/2j3Y6WNqJeJeduU/lxvTzzjBG+tSAzRc96WsMQR2R0cvkQ8EnueU1z8fftrAqm3taFBEDt8jKOcuWtEzSTd5N/GxAn4KrMExABIXpPAe508PDF1vorxtMK8zBVhMQc1RjwWTlf4KzuAI+PfqcN1bKGpJ7Kr1TBpi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774447979; c=relaxed/simple;
	bh=8f5jDgxfOYWKqhtq/LueH8BWKoAZuBfi50Q/okS8QiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3RVq+uBuCTkNF107JQ5bHBHqIpe2dAtmY8GZH/Y+zZQjCuaYX0meqfIJ9Pw9eLRu6j+OXS1PLzDtciXNxsdUv1Hd6MHugjIwtNvc+riFXrrrBnZXAd8B6ED7OYhDgsGxyOyNadTAKX6NEByeE/PNeF6wrw4AczJ3yw45cSfBe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q4v6m8lI; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b4520f6b32so2861847eec.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774447975; x=1775052775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xrtP2XKpL7jnk9JhdiacyJBzRuy/A4bB7Ft+VON4MHk=;
        b=q4v6m8lI793sCfDztVbLSVR/R6uBI5FfHwsTP8o47pSeZoBU2wFGjLElPFBRPXU6A9
         p+ecbpgLl3L1z/7pXvVys8RxMTnd/mmwULHmskjVDjD4ykvs4UkDP4sUPc50CUmf1HqO
         G4Fs6QacoAlY5gm+ZdtEa5MazJP1TpmJkNcFlVZENO5aLig7vuoxvBMZ9GJuP+5gk6ZR
         0CcEDGA2E3+j7d62CPHbZ91SNS75wU3SkrT4V3gxvDq8MWHNDB0OG5HBk4iALIlqfcOv
         7Jr7DaFY1dpO2TG/AWq3Kh1xNBIGBTCGFZOVW6Kro4/ZzDl6wCThvJ/6gz76cQMp+gJJ
         Bdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774447975; x=1775052775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrtP2XKpL7jnk9JhdiacyJBzRuy/A4bB7Ft+VON4MHk=;
        b=ADiBM/KTyAHa6mZGdlvHO/auESBYWgKMi4sHdcmrKgoQiqslQ1tAKzuj0NiNOcRDE+
         y8IAz4+DjCvmK2CtiibxjSx1tpBBCjKOG2q7OC5vmyuG612D8fUudNIK1Mjv8hVgB46E
         g7hyg+7Kr9LL3jlOfKMmHZr6jl2Bdh+j3pzaj2FBFeMNYXcQUxD9jKsapg5W11GgsHJW
         3RqK4QozfbJ0AefRXLp5KVbgxubpOn2eWmrbRVZ9gV0ZhEiI6K3RLbsnDcrPK1mtB42m
         E0DcJTyJbTuzoTwd2zm5XlKqKafHvBnuSPlNzselaObV+c1QtWAUdc8hTm1D2w3LoBBU
         gECg==
X-Forwarded-Encrypted: i=1; AJvYcCXth4ID0QIu+gd4A+pQAZDAFcTBNaXB73inM4dYmZdxmciwOSB/wEXrWPUyF0rn3H8BrKTRnMCNjiv5z9XFi69Bzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhhirDZYF3nTwSqXY7qghJbYyosPcI7djICCg0lA2+LNJndECQ
	UG8FKMhyFrbww9p4ao64sNxUK59j9utTQEU+op+fvlA7o/KWvC/a4vKE
X-Gm-Gg: ATEYQzxEr+tuv7+cc9iVLgiyocwQRKToT89Fjgo9enG2yIfAWXBOUMDLsoHMDWoPZsk
	ouqio9mDN1NXo64NXPsCMRYxNI131Vno0FEljR/jeY6HNAfMnjELcXeyfTQ7YXbtpy8ukj1kE5S
	r/33K0AlAh5Pa2G4cDdwMbjdrP7jtRHiWljqFmBMZtj67EZS0D0ThsUY2pAAcKKlFigDdz4YQH5
	pu/W8EXRaAxKbDZ3jsLTD84P9Lfbbay+UcijVKBpZRHjjDc7gKMXU2f7dKV1kzvGQFWmP8cEemS
	SZAaumo0fM9XXG8phmb4afobAMXRwvTPMHUihYw2VexBoymiDiCsJo9BDW94MyDirk9N+EPtmQa
	c/zfpe1RI/EF0Wn3chXMM7z6xSvjaYwshoVnRua5j5516JoHYYMTorZmWWe4QnmBlGu8RNwNvs3
	umgK3bPX8HiInIO8cxZ80wkVMESHHpWImpuy+PTr27GwC1Oy4qnwFhtx1unmpuz7W6WXYbBT74
X-Received: by 2002:a05:7301:d87:b0:2ba:85d6:e777 with SMTP id 5a478bee46e88-2c15d28a868mr1781822eec.2.1774447975226;
        Wed, 25 Mar 2026 07:12:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14bac4sm24526735eec.4.2026.03.25.07.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:12:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <35a21e8c-689c-433b-a4a2-6d7567c09d0b@roeck-us.net>
Date: Wed, 25 Mar 2026 07:12:52 -0700
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/isl68137) Add support for Renesas
 RAA228942 and RAA228943
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Grant Peltier <grant.peltier.jg@renesas.com>,
 Linda Xin <linda.xin.jg@renesas.com>, Tabrez Ahmed <tabreztalks@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260325041728.68-1-dawei.liu.jy@renesas.com>
 <20260325041728.68-3-dawei.liu.jy@renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260325041728.68-3-dawei.liu.jy@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30249-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:mid]
X-Rspamd-Queue-Id: 84836326B53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 21:17, Dawei Liu wrote:
> Add I2C device IDs for Renesas RAA228942 and RAA228943.
> 
> At the Linux PMBus hwmon interface level currently supported by this
> driver, these devices are compatible with the existing 2-rail non-TC
> controllers, so devicetree will use fallback compatibles and no
> dedicated OF match entries are needed.
> 

The AI still has a couple of concerns:

https://sashiko.dev/#/patchset/20260325090208.857-1-dawei.liu.jy%40renesas.com

As it turns out, the concern about i2c_match_id() vs. i2c_get_match_data()
has already been addressed in the hwmon-next branch.

Given that, I'll apply the series and address Krzysztof's feedback to the
first patch. No need to resend.

Thanks,
Guenter

> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
> ---
>   Documentation/hwmon/isl68137.rst | 20 ++++++++++++++++++++
>   drivers/hwmon/pmbus/isl68137.c   |  2 ++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/Documentation/hwmon/isl68137.rst b/Documentation/hwmon/isl68137.rst
> index e77f582c2..0ce20d091 100644
> --- a/Documentation/hwmon/isl68137.rst
> +++ b/Documentation/hwmon/isl68137.rst
> @@ -394,6 +394,26 @@ Supported chips:
>   
>         Provided by Renesas upon request and NDA
>   
> +  * Renesas RAA228942
> +
> +    Prefix: 'raa228942'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Renesas upon request and NDA
> +
> +  * Renesas RAA228943
> +
> +    Prefix: 'raa228943'
> +
> +    Addresses scanned: -
> +
> +    Datasheet:
> +
> +      Provided by Renesas upon request and NDA
> +
>     * Renesas RAA229001
>   
>       Prefix: 'raa229001'
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 3346afdf3..03c9adc0e 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -432,6 +432,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
>   	{"raa228228", raa_dmpvr2_2rail_nontc},
>   	{"raa228244", raa_dmpvr2_2rail_nontc},
>   	{"raa228246", raa_dmpvr2_2rail_nontc},
> +	{"raa228942", raa_dmpvr2_2rail_nontc},
> +	{"raa228943", raa_dmpvr2_2rail_nontc},
>   	{"raa229001", raa_dmpvr2_2rail},
>   	{"raa229004", raa_dmpvr2_2rail},
>   	{"raa229141", raa_dmpvr2_2rail_pmbus},


