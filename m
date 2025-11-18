Return-Path: <linux-renesas-soc+bounces-24719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC4C69E8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F3BB04FA64D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F3835C194;
	Tue, 18 Nov 2025 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hQ/fxQdS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBB8359703
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475189; cv=none; b=VfcM57kqT/5tkGyqwM3j48QlIZKB5XRtPO2b7WhFxHybOweuTqp3fotjXabsbVsbLA6O7Qcj+v9xqqyxaUifyJ632hY0W9tFISm9+6+ksBryMYgBbQSaieyDY8fWLgZJq+ZBbhTjVpNE26ag7nwv+8jTtqO2um42rwYvdHaXMUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475189; c=relaxed/simple;
	bh=k9WCGs3RXK6VKNtnPXO/KV9w24oXtIlKbzxstZNqvCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLPLHrH8KlRvqv1bGqZjAil3rj+EBaoCR8nCNvNz0U3XSzGo31j4fOzNToMtJJL3pKVvCdIHdkODH7k68H6wL50iDoxQU3/Rc1FxA3NoguExkcJgD/x6aHx/ZfYyrVFd20rk2BoOy0FXfnwKkTyt57uorFMQmq2jMw+nRsBcvsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hQ/fxQdS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so25462085e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763475184; x=1764079984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lBMakZKxlIHy16Fs9qouAWNB0LpiDg2sSV52gGOgZkc=;
        b=hQ/fxQdSYv+k8Rut+6R8kqDzLUQYadyb5jc58qpV5afsZqut5sY2hfRu8WBxh5Oaci
         o3XLcBLUB0Bb73QT7T+YHSuRRyOGQT7Bob//JsnHS67v+cm9W9wT/Jyz8mexDCwGFKvz
         HCvd4H7eO6+unJXhGnyo3Wj+QzObkn1h1heJoevJE1GpfNdx8hb1m80HUp1+uUX0s9TL
         gGX4nNWZTrDiKIH2C7LxmlWk3trSQ22VLesxVbKX40UoCnxJAdMbHpc3o57yED7fzjy2
         VKsffATmfU/yL0FX64Vs+6KYpgIn6eXetjiVlvoYKjUAA3MuDYMqJAuKxWahlO3oCjHf
         OtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475184; x=1764079984;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBMakZKxlIHy16Fs9qouAWNB0LpiDg2sSV52gGOgZkc=;
        b=Uf0xAaLRAy/ug915T6A/EnDexzXEly0dfk214oibOShBqdAniTreh0AtWnYqHEE3SE
         cndd8MOBCiB4b72wlsrG7QY25YsCgsZgiJ3DmHL7F7geCEF/qHaLZoiSDHYUzjeDlg28
         z0vbSrQQKnjQXxULZOQt14nQIAuTHj3WmLB9U/L7Gatj8iKV3HbAOJ8K5LjY9w9szxGK
         r6DyaG+rZu64zrK7zwHWquA8NOk9rLB3uSJDJJlW5uVwLp/ScaQoI5yGaxLgb5tUyxoN
         GNqUzDBKC6UIlOauYfI69JQBMGO583jrKm6M+80rfn6UQilvNHVxpavkJkeOcd8fbF+5
         D5gA==
X-Gm-Message-State: AOJu0YzpdKqh1hNUbPcGLldsXY3gsw5arRL44lNk5i5skLztIFMKFoKG
	pM+7fj9GHfRNWGlV+nmTQPWp8LOC7mzTKSW5EFo+D5MSkknqDbjo+zcm5eAq0jncahE=
X-Gm-Gg: ASbGncvEDBp9UMLGXHRmZ5WkKfnqx9j2N7uBCzZ8vgena+FClFJSxJN8kXnRvpSzAri
	Z3dl8mi5pzHqXhD5WsP5OS2P94hwvdqyq6MpltHNjMu3/a8GmO/2uORdTFj5/ZbLAMN1DHPTJlc
	hm93ZTX/iDAPJEmPSB71+N+ZXSmPumlt7+wtmSnSyOu7+GeTR/G1A2ns8sSZ+1IycAJFcKUkER6
	2MdBoshwVRoSmnE5mA+KgYmLCOhAS9GTY7c8zKVFRKxe6XP1IaeWK2SIawmSUR25ZNFcVJkSuX0
	vxetrNE2I0DPFLcb8GHhuvOogiJWxNQyoA08205sSaWt5ce0iDOMxHDoaxkInlpqqv/J4UDv5fU
	eQmlygM+92B04BdprcxGnKMUejSbx2F/HrKYv/8D4mHr3U5xEI6kLSJmUxH3ZIMscAxIDBAILRt
	jO6GwrXdRryg/1ybFg6JSg9osD5H6w4A==
X-Google-Smtp-Source: AGHT+IFyqJfzakIXR+t0AgFWjrDkLx25IQZZUyzHUFHHX3vPDAz5QlMs2PDokF29MSSQ/p28MKoXCA==
X-Received: by 2002:a05:600c:3b0c:b0:477:7d94:5d0e with SMTP id 5b1f17b1804b1-4778feb18abmr150205545e9.27.1763475184383;
        Tue, 18 Nov 2025 06:13:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a0f4ff42sm130392035e9.12.2025.11.18.06.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:13:03 -0800 (PST)
Message-ID: <047df95e-b1b6-4e7b-89f7-d7cb69559a49@tuxon.dev>
Date: Tue, 18 Nov 2025 16:13:02 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Add suspend/resume support
To: Neil Armstrong <neil.armstrong@linaro.org>,
 yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org, kishon@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251106144148.3051962-1-claudiu.beznea.uj@bp.renesas.com>
 <4d486bd8-9e87-4bf2-a96f-38aa0f701c45@linaro.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <4d486bd8-9e87-4bf2-a96f-38aa0f701c45@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Neil,

On 11/18/25 15:54, Neil Armstrong wrote:
> On 11/6/25 15:41, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S supports a power saving mode where power to most of the
>> SoC components is turned off. The USB PHY is among these components.
>> Because of this the settings applied in driver probe need to be executed
>> also on resume path. On suspend path only reset signal need to be asserted.
>> Add suspend/resume support.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> This patch is built on top of patches 1/7, 2/7 at [1]
>>
>> [1] https://lore.kernel.org/all/20251023135810.1688415-2-
>> claudiu.beznea.uj@bp.renesas.com
>>
>>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 66 +++++++++++++++++-------
>>   1 file changed, 47 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/
>> renesas/phy-rcar-gen3-usb2.c
>> index a38ead7c8055..3c063e4dea41 100644
>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> @@ -132,6 +132,7 @@ struct rcar_gen3_chan {
>>       struct device *dev;    /* platform_device's device */
>>       const struct rcar_gen3_phy_drv_data *phy_data;
>>       struct extcon_dev *extcon;
>> +    struct reset_control *rstc;
>>       struct rcar_gen3_phy rphys[NUM_OF_PHYS];
>>       struct regulator *vbus;
>>       struct work_struct work;
>> @@ -778,35 +779,24 @@ static void rcar_gen3_reset_assert(void *data)
>>   static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
>>   {
>>       struct device *dev = channel->dev;
>> -    struct reset_control *rstc;
>>       int ret;
>>       u32 val;
>>   -    rstc = devm_reset_control_array_get_shared(dev);
>> -    if (IS_ERR(rstc))
>> -        return PTR_ERR(rstc);
>> +    if (!channel->phy_data->init_bus)
>> +        return 0;
>>         ret = pm_runtime_resume_and_get(dev);
>>       if (ret)
>>           return ret;
>>   -    ret = reset_control_deassert(rstc);
>> -    if (ret)
>> -        goto rpm_put;
>> -
>> -    ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert, rstc);
>> -    if (ret)
>> -        goto rpm_put;
>> -
>>       val = readl(channel->base + USB2_AHB_BUS_CTR);
>>       val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
>>       val |= USB2_AHB_BUS_CTR_MBL_INCR4;
>>       writel(val, channel->base + USB2_AHB_BUS_CTR);
>>   -rpm_put:
>>       pm_runtime_put(dev);
>>   -    return ret;
>> +    return 0;
>>   }
>>     static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>> @@ -846,6 +836,18 @@ static int rcar_gen3_phy_usb2_probe(struct
>> platform_device *pdev)
>>           }
>>       }
>>   +    channel->rstc = devm_reset_control_array_get_optional_shared(dev);
>> +    if (IS_ERR(channel->rstc))
>> +        return PTR_ERR(channel->rstc);
>> +
>> +    ret = reset_control_deassert(channel->rstc);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert, channel-
>> >rstc);
>> +    if (ret)
>> +        return ret;
>> +
>>       /*
>>        * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>>        * And then, phy-core will manage runtime pm for this device.
>> @@ -861,11 +863,9 @@ static int rcar_gen3_phy_usb2_probe(struct
>> platform_device *pdev)
>>       platform_set_drvdata(pdev, channel);
>>       channel->dev = dev;
>>   -    if (channel->phy_data->init_bus) {
>> -        ret = rcar_gen3_phy_usb2_init_bus(channel);
>> -        if (ret)
>> -            goto error;
>> -    }
> 
> I don't see why you changed the logic of calling
> rcar_gen3_phy_usb2_init_bus(),
> moving the reset setup and handling should be enough, no ?
> 
Sorry, I missed to mention it. I did it like this just to avoid this pattern:

	if (channel->phy_data->init_bus) {
		ret = rcar_gen3_phy_usb2_init_bus(channel);
		if (ret)
			return ret;
	}

in both probe and resume path. The channel->phy_data->init_bus check is not
embedded in rcar_gen3_phy_usb2_init_bus(). Please let me know if you want
me to revert it.

Thank you,
Claudiu

