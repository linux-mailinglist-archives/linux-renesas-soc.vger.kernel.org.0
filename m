Return-Path: <linux-renesas-soc+bounces-8861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C91970EC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2024 09:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9D621F22812
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2024 07:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F071AE020;
	Mon,  9 Sep 2024 07:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JreNt7ly"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090391AD9F1
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Sep 2024 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725865676; cv=none; b=hOn796tc86MPZ/D6CIL35uGJVWZYCgvk1qG4N0zvo6vnnzSDs9/I8sayo3WGpuEqrmmExcwZqjhwWZk894I13LSE4Hw/cyFG7dN1LeBPEpzKnddEOi/OFfaOTjyda0qxFdL93AU+A+vY1PSs9AS/mhAPEeX4/3mOmzd/HkK94zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725865676; c=relaxed/simple;
	bh=5HdLRdwgILWy7NijZoXcTvZcLW7MCGW7u1wIqNnq2HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBED/4BzzEiau7fixKtbNjE+IdKFjTwYUXRbcc8mNaR8kBEAZhvU+vZWG6a7FHBQS4TtNHalCgayeXg1+zvLof8K42Sgx6tXDru+WE+adlNsiWsqth6wWL9U4IUjtgQSKeJKyS8sBj4iaObAoIvjc7nUkgiXgqK0NaoXrv4jU04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JreNt7ly; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so5350335a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Sep 2024 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725865671; x=1726470471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pO9t18GD+i5fBFY4VXd+D6OTewDWbOLXCFnosdNxa/U=;
        b=JreNt7lyzxS0F0xzkYhAojq1HAEl5JY5kGxT+3lsH3yItYb+MJ3v8a9fEcTVtJREzl
         2B6Zau+t47PzUzM7j8E6ISifRPDq3l/sbD17EKaFRuTFqch/k3fIERrYo4C6NR+SNT5p
         fnRMnpoIF6HdSsRs2zwNRJSvJdVIf23PFKra0ASGl3/9qzZJhO/4DoHRtKr8+xJ0pn57
         QHdxGSA0rgy3k85PT5sGmPpM9sGlu8V0Tft+oAhVszv9sWRdV5u4jpkFFbJpJTsqc/BX
         IZkK9gv3tEWw+yqu0c8N0sibPmwjypeo8+FCJkRK4B7jzKeJBvqObELKU1fM3oliVpEl
         KblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865671; x=1726470471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pO9t18GD+i5fBFY4VXd+D6OTewDWbOLXCFnosdNxa/U=;
        b=PQPRHZv6rL/qRxFPXYq0e882TMoBhZ7bjbTqKCl34IWy1fRZSFUSidAEmN823qUBkX
         RoROdf8l+svFRP0WOiRC0FadsnfI0EHQk3u2dqu0JxOf7FjM2BUa8ApQhYif6LYYfu7D
         7D+MqDf+V4+z0rs08XFGtgjxWCGOHLtRWyi03t9OVtJZuST8OsoS03CJL83Qj3d7MMaB
         QeORSLUouZ3qzNpvgl9N76q6Jinx63DT+ot8wjx99ECgsrSzoeqecLVa+sD6Y6vMriFx
         qiAaq6v36aHF8+VzPXKFSsH+biWWvSQQNgIWSJF8CSaRCxGsSUKJOQIOFfFFIsIKeaur
         zrgw==
X-Forwarded-Encrypted: i=1; AJvYcCXgT8eq6TYaAosfkBYO6686TlRnyYY1rAFajpNrQTWU89nYeNnEkz0aKixbTrYEGZZsiw4zlqDjzv9DFtfEmAqtRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5wh6n+IdoyI6EG5F77Zff+cKPvByrLFlq7Fw7JjNWW7cV2/Mw
	UUdccD+J5uDI6olBoh38XTV9wPuiE0nxoD2WPVlIfMRRsDyO6gSJCRKgeAajBe0=
X-Google-Smtp-Source: AGHT+IEzFtJpDjpFcpaOK3zi2wC6+pmxuHOiV7xQ9M52ggf8MDENIzb7c111uhTAimm5UAc+Fb65+g==
X-Received: by 2002:a17:907:7421:b0:a8a:8d81:97a8 with SMTP id a640c23a62f3a-a8a8d81aa63mr707722566b.1.1725865670935;
        Mon, 09 Sep 2024 00:07:50 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d40064sm297908166b.190.2024.09.09.00.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 00:07:50 -0700 (PDT)
Message-ID: <503ed037-a16c-41b0-bb13-4ea11fcd2362@tuxon.dev>
Date: Mon, 9 Sep 2024 10:07:48 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: renesas: rcar-gen3-usb2: Fix an error handling
 path in rcar_gen3_phy_usb2_probe()
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
References: <4efe2d0419cbe98163e2422ebe0c7896b8a5efed.1725717505.git.christophe.jaillet@wanadoo.fr>
 <TY3PR01MB113468D1573C1E50AC9F97DCF86982@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <d01bed96-7811-4ace-8b92-1ee9fafac649@wanadoo.fr>
 <TY3PR01MB113466A2B99EE80E8BB0A94AD86992@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113466A2B99EE80E8BB0A94AD86992@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09.09.2024 09:00, Biju Das wrote:
> Hi Christophe JAILLET,
> 
>> -----Original Message-----
>> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> Sent: Sunday, September 8, 2024 5:59 PM
>> Subject: Re: [PATCH v2] phy: renesas: rcar-gen3-usb2: Fix an error handling path in
>> rcar_gen3_phy_usb2_probe()
>>
>> Le 08/09/2024 à 18:39, Biju Das a écrit :
>>> Hi Christophe JAILLET,
>>>
>>> Thanks for the patch.
>>>
>>>> -----Original Message-----
>>>> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>>> Sent: Saturday, September 7, 2024 2:59 PM
>>>> Subject: [PATCH v2] phy: renesas: rcar-gen3-usb2: Fix an error
>>>> handling path in
>>>> rcar_gen3_phy_usb2_probe()
>>>>
>>>> If an error occurs after the rcar_gen3_phy_usb2_init_bus(),
>>>> reset_control_assert() must be called, as already done in the remove function.
>>>>
>>>> This is fine to re-use the existing error handling path, because even
>>>> if "channel->rstc" is still NULL at this point, it is safe to call reset_control_assert(NULL).
>>>>
>>>> Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to
>>>> initialize the bus")
>>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>>> ---
>>>> Changes in v2:
>>>>    - Re-use 'error' to simplify the patch   [claudiu beznea]
>>>>    - Update the commit description to explain why it is safe.
>>>>
>>>> v1:
>>>> https://lore.kernel.org/all/fc9f7b444f0ca645411868992bbe16514aeccfed.
>>>> 1725652654.git.christophe.jaillet
>>>> @wanadoo.fr/
>>>> ---
>>>>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>>> b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>>> index 58e123305152..ccb0b54b70f7 100644
>>>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>>> @@ -803,6 +803,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>>>>   	return 0;
>>>>
>>>>   error:
>>>> +	reset_control_assert(channel->rstc);
>>>
>>> This will result in either kernel crash [1] or reset usage count
>>> imbalance in case of error [2] and [3] in
>>> rcar_gen3_phy_usb2_init_bus() see [4]. Also reset control API is not
>>> respected for SoCs other than RZ/G3S. For those SoC's reset assert is
>>> called without calling a get(). Maybe add a check (phy_data->init_bus)
>>> for assert api's, that guarantees assert is called after calling a get() as it valid only for
>> RZ/G3S??
>>>
>>> [1]
>>> channel->rstc = devm_reset_control_array_get_shared(dev);
>>> 	if (IS_ERR(channel->rstc))
>>> 		return PTR_ERR(channel->rstc);
>>>
>>> [2]
>>> ret = pm_runtime_resume_and_get(dev);
>>> 	if (ret)
>>> 		return ret;
>>> [3]
>>> ret = reset_control_deassert(channel->rstc);
>>> 	if (ret)
>>> 		goto rpm_put;

Indeed, I missed that. Thank you, Biju, for pointing it out.

>>>
>>> [4]
>>> https://elixir.bootlin.com/linux/v6.11-rc6/source/drivers/reset/core.c
>>> #L483
>>
>> So, if I understand correctly, v1 [5] was correct. :)
> 
> Yes, I agree v1 [5] is correct, if we ignore "reset control API is not respected for SoCs".
> 
> Another solution could be using action_or_reset() for cleanup for
> rcar_gen3_phy_usb2_init_bus(), so that it is applicable only for RZ/G3S??

That seems like a cleaner solution to me.

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju
> 
>>
>>
>> I don't think that [1] would crash, because of [6]. It would only WARN_ON. But with v1, it is not
>> called.
>>
>> With v1, reset_control_assert() is not called if
>> rcar_gen3_phy_usb2_init_bus() fails. So [2] and [3] can't occur.
>>
>> I can send a v3, which is the same of v1, or you can pick v1 as-is (if I'm correct... :)) or you can
>> just ignore it if "reset control API is not respected for SoCs".
>>
>>
>> If of interest, I spotted it with one of my coccinelle script that compares functions called
>> in .remove function, but not in error handling path of probe.
>>
>>
>> CJ
>>
>> [5]:
>> https://lore.kernel.org/all/fc9f7b444f0ca645411868992bbe16514aeccfed.1725652654.git.christophe.jaillet
>> @wanadoo.fr/
>>
>> [6]:
>> https://elixir.bootlin.com/linux/v6.11-rc6/source/drivers/reset/core.c#L473
>>
>>>
>>> Cheers,
>>> Biju
>>>
>>>>   	pm_runtime_disable(dev);
>>>>
>>>>   	return ret;
>>>> --
>>>> 2.46.0
>>>>
>>>
>>>
>>>
> 

