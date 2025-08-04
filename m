Return-Path: <linux-renesas-soc+bounces-19969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD3BB1A70D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 18:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACC0F18A4337
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 16:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71011256C6C;
	Mon,  4 Aug 2025 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JdKd3iN0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC3220E717
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Aug 2025 16:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754323690; cv=none; b=HeNnolCu2MhbwQEoj5yQJJ0ZxXfRsxiHkTjMAa217ew6MneurTtOHZ1AxuRkZEdhe1Gk3bIZsUfCemWP4N3K0FbJHgg29znmVQvoFwUGMCIo05JLWgpEhUIy6T9IpleXSRBtfVz6XGkquI6U3jclTc+TQRnmNYLHJ8q/WWN9z4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754323690; c=relaxed/simple;
	bh=S9yuT+weSY5miLU3AyaItyOypGFL+jNnY+GzO8Hq2NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWSfg03o/ZoW+yqSzwW4rHiInmSsy9sRlh37ri/X80D8q4DVSGqI5Nxg5OzPNpiOYG6aP9bKI5fD+c6mVebS5Co8Ahjpu/dbQr2AhsjmaNlNhL5KDujupgfTcGZuFkGBDLGJRn8hCU3lu3jSoN/iPBGCkgMpzG+V28mwmuKZw84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JdKd3iN0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b8db5e9b35so1622041f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Aug 2025 09:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754323685; x=1754928485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Aaib/NaydwLH1J4xHrdqxdoR2E0SlQgXrBILFXZ4d4=;
        b=JdKd3iN0F98ojpAUOxP6F5XK7x5kAzRZbnev+LQE7f3kHCpw2Kdegg5OYV29nC0h60
         i/BGqcUYJQdldCEw9EcsZGwTTQALi0xq/sImYvFqejqwoGSTosHRd7Sal6Ab7MMN4XHr
         CnRlM9Ylu9URzQQsNoZQHI5T8gkd6CRGBPaVQDahA0XmND8enikY83Uqdbh2x9E95ZhB
         by4zDjpxqSJD/0UX6kN+2UNbO/8nM/cFTu7lODy2Uo/mzoRzZl6mRXH4ueRQQsna+Cf0
         q8P3CGeLN5ybNKGFWhJKFeULNv6Ifb/gj2yN+Py76yExr739oGB41lmNaMDCZlqibiXi
         xjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754323685; x=1754928485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Aaib/NaydwLH1J4xHrdqxdoR2E0SlQgXrBILFXZ4d4=;
        b=X/KIsNmW/dSuRkR0gPrNxdmtHtMIcdcwIyjOUAzQ90zNi3jU4K42ozUA6GyafnDNRV
         UDww7w0EkUpRsFBS3Ap1fYC0JKqPfZmbabIr+Z5cd8kYz2B9Vm07ZuBlpyJDUqer1AqY
         a0Jx8TIehnSXtZDcCmp8DyjZ/jV/6MA6yq/wm9+0gS/ctWCOGhj1q4mxty8R5t6ziKIR
         0F2/Uv0sOQs5o57Gjz2CBpZgxZQRpgrdCUyom3tfpt+0KnOsqIcw9UV0DA4p/YQYXvlE
         8jpgiMTW/ggH3rNI8GN1P92A8fcj/CP4RH3NZFM6yWWhyrZlPm/YX1wiCZxFeUm/LbYS
         OLHg==
X-Forwarded-Encrypted: i=1; AJvYcCXmx4xdFyH1EdA6pMlLHrsK24qOgP1AzrgNAd9LvM1Pn323I3JzNKvkeB0XOnSpyK+YNqE6Z3sjHXLSH2EvSD3+3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcbSPo7Ht6Ztb8/GnfR68G9tdhd5W0yzEDBWNcDAmn0yNCfvvN
	0YYA3EgwPvcai+HmiWKltIaF6g/D2aUj+pPXyvWfsszGcOR2mLPZdCG/dEmbKcvQnIE=
X-Gm-Gg: ASbGncv4GINh4SlgMNb8SfnHYQrAYmnCYI/ou0G/rYxBqHPqnR2B/Er60VWjZ17Fpej
	uNdchJjOdOhAgfIT+3SY5RqdAP2wV2W4NyVHcgiblB52byh2Bo5fpgNHRH0S9LqDVmW2ZX8G7gp
	HGzMzpaVwCk8EU2jB1QGrJzT9vjJIJhqnTixWhgxa4l6WGR+cX9EcBQkGTZGDayRzzQhacF2c50
	BzfL1eoT6yXtimm9Or+DQkK2Oyv0S4jBQdP1oqeDe26TWSZ4m3Akje0GmqByXxDrNj+GM9Yk7xx
	Cf+3vWb/CZPIDNStMuiOTBsPR/NUns5eLKHamGascpRGQPPlnT1Hafs9pNpT0SXArPeEIkeMXAn
	/wZf+9QLwjvFUnpPFu63TBxfSOPspsJ2izpTRb1XmYdRshDievLQYZQ7jgotXPcqPlL++2RiT
X-Google-Smtp-Source: AGHT+IEohChU750lDHoZ0kT83zI/nxMNcmkkIL5wgE8PiBZtIvHt4vP9RiqS9PltkOKHSOsX9HxMyw==
X-Received: by 2002:a05:6000:2f85:b0:3b7:9c28:f856 with SMTP id ffacd0b85a97d-3b8d94c3f4bmr6867167f8f.48.1754323685345;
        Mon, 04 Aug 2025 09:08:05 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-459a1c79b0asm39287285e9.3.2025.08.04.09.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 09:08:04 -0700 (PDT)
Message-ID: <64622ffd-05d1-43c3-85d0-cf98f3012477@linaro.org>
Date: Mon, 4 Aug 2025 18:08:03 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] thermal: renesas: rzg3e: Add thermal driver for
 the Renesas RZ/G3E SoC
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "john.madieu@gmail.com" <john.madieu@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "lukasz.luba@arm.com" <lukasz.luba@arm.com>,
 "magnus.damm" <magnus.damm@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "niklas.soderlund+renesas@ragnatech.se"
 <niklas.soderlund+renesas@ragnatech.se>
References: <20250522182252.1593159-1-john.madieu.xa@bp.renesas.com>
 <20250522182252.1593159-4-john.madieu.xa@bp.renesas.com>
 <aHgVe0YwPWapIYed@mai.linaro.org>
 <OSCPR01MB14647DE009925C982AE6BB5D2FF27A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <OSCPR01MB14647DE009925C982AE6BB5D2FF27A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/07/2025 19:19, John Madieu wrote:
> Hi Daniel,
> 
> Thanks for your review.
> 
>> -----Original Message-----
>> From: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Sent: Wednesday, July 16, 2025 11:11 PM
>> To: John Madieu <john.madieu.xa@bp.renesas.com>
>> Subject: Re: [PATCH v6 3/5] thermal: renesas: rzg3e: Add thermal driver
>> for the Renesas RZ/G3E SoC
>>
>> On Thu, May 22, 2025 at 08:22:46PM +0200, John Madieu wrote:
>>> The RZ/G3E SoC integrates a Temperature Sensor Unit (TSU) block
>>> designed to monitor the chip's junction temperature. This sensor is
>>> connected to channel 1 of the APB port clock/reset and provides
>> temperature measurements.
>>>
>>> It also requires calibration values stored in the system controller
>>> registers for accurate temperature measurement. Add a driver for the
>> Renesas RZ/G3E TSU.
>>>
>>> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
>>> ---

[ ... ]

>>> +static int rzg3e_thermal_get_temp(struct thermal_zone_device *zone,
>>> +int *temp) {
>>> +	struct rzg3e_thermal_priv *priv = thermal_zone_device_priv(zone);
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	if (priv->mode == THERMAL_DEVICE_DISABLED)
>>> +		return -EBUSY;

[ ... ]

>>> +	reinit_completion(&priv->conv_complete);
>>> +
>>> +	/* Enable ADC interrupt */
>>> +	writel(TSU_SIER_ADIE, priv->base + TSU_SIER);
>>
>> Why enable irq here ?
>>
> 
> I did it this way because, in 'set_trips' callback, the
> driver does trigger conversion to check whether the current
> temperature is part of the window or not, and triggers the
> comparison interrupt accordingly. Because of that, I did not
> want the conversion-complete interrupt to also be triggered.
> 
> That's the reason why I enable conversion-complete interrupt
> in 'get_temp', to make sure its interrupt is being triggered
> only when the thermal core calls it.
> 
> Should I do it another way ?

I don't ATM, the approach is very unusual so I'm still trying to figure 
out what is this completion approach and readl_poll_timeout_atomic. At 
the first glance I would say it is wrong.


>>> +	/* Verify no ongoing conversion */
>>> +	ret = readl_poll_timeout_atomic(priv->base + TSU_SSR, val,
>>> +					!(val & TSU_SSR_CONV_RUNNING),
>>> +					TSU_POLL_DELAY_US, TSU_TIMEOUT_US);
>>> +	if (ret) {
>>> +		dev_err(priv->dev, "ADC conversion timed out\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	/* Start conversion */
>>> +	writel(TSU_STRGR_ADST, priv->base + TSU_STRGR);
>>> +
>>> +	if (!wait_for_completion_timeout(&priv->conv_complete,
>>> +					 msecs_to_jiffies(100))) {
>>> +		dev_err(priv->dev, "ADC conversion completion timeout\n");
>>> +		return -ETIMEDOUT;
>>> +	}
>>
>> Can you explain what is happening here ?
>>
> 
> I might not get what you are asking, but since I compute the
> temperature in the hard IRQ handler, I just wait for it to complete
> and notify the completion so I can grab the processed value to notify
> the thermal core.
> 
> Please let me know if this does not answer your question.

Can you describe how the sensor works ? And perhaps if you have a 
pointer to some documentation ?
  [ ... ]

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

