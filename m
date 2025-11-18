Return-Path: <linux-renesas-soc+bounces-24720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B77CEC69EBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A86914FA9B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848843563F3;
	Tue, 18 Nov 2025 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l0WFDpXF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609E02D595A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475221; cv=none; b=GEWLYUe4aGcMnhLHJeIV+xev5I6mySxpgYjH8Fq4ls2Q3QzA2bMWPAMj1ctXmXyEX8LCYVu8XoGImpC3ZoF9C5njSWcMFZgt4eBer9PE+JP647gsphdJtDSg/zg5NiRO8ml0+MlZuZ1hG1yC7sA5XDINbCVdzL/he60mz5T+INw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475221; c=relaxed/simple;
	bh=rp0083s5I4NKgkxKKYCbBvLPiTVc2O9OoM4hZXBN3do=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=US6hPcHYtxj5ebF35R2nwDKknFHfrupefHuxPiXM8+ipZ6WY1pfGpMNpXb2vNfnC2yHpsra25eRv1DE1gFnWPW0pPRKsF8vapRuS9HK8ZC2tRwwg4qZi6q6y2zgzUjlQ95+jKz7sAK0X2B5rRN9yUQO44UWjl/9KXbr4V00z1h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l0WFDpXF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso11736455e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 06:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763475218; x=1764080018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ztfXAVtJF02n2U4iqu1oYXFqjTOpzewfao4XQU6K0fg=;
        b=l0WFDpXF628W55TZoWMA/QzdXgN0JkHgozF7deLA2PRKz9Mj7zAtOe4EzJZ43AiTWL
         s1Y+R6bjglPuSEno50UetWhGFBDRby/aMCABFJB0Gd1fj9l++3ZhMylKHJYaPn42gajL
         UyE3yR8injgH9+A/TXKFpbDkxcrw4gLQkvLp9YFbpbUNSac3ymLAsp6N1vtePjt3mzJq
         73zwGpmVxg3c3tozD4x2jv/kLsCsnpw8l156AFUcugnbUD7KIvV7Vyt3FuboeM0mifWJ
         iCLE/yQJAMhNpMZrt92j7RxOyEqi6Dj/dRZlpuOdFSzwSM8C2keHcil/CnRthZFX1R5k
         Nztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475218; x=1764080018;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ztfXAVtJF02n2U4iqu1oYXFqjTOpzewfao4XQU6K0fg=;
        b=wkaIGPYSf2MIgGDIhcOm5kYtbxQWx8JCdiAfV/55We8AffONNzjMbttJQ4t9sjyAZ5
         lYv5jfTOBF+4IzyzPcY+wv7itQx7HAVVXo3dp680qP0ZX90PeiXTAUnRhjVyXo1WzGx/
         aW1RBGlxjiMlC3JdpfJi8qgwa6yNPxPybFbHAQyDYB5yOQNwqKmqB4u+sOr5+p67OvXi
         6jliHv6X1ErwSIt3lQq0OlvvWNJh4HDftyj/OK4WD7rEz2wh0lvAw1CIbhq67qmKO4bU
         p4qBJo5FhnjNsvUE9lcTR7jVfYn1BwT8tNFIeCw9eI03+qvvFgW4DSODvsJYaugiDWQU
         gRmQ==
X-Gm-Message-State: AOJu0Ywr8lFM44WZgnXm6A+RweH/y/YG53mEjSJJ3r3HzLZ6SQBeyv7T
	7qmrLduaCnIXY9pyecGhtwsyl8mlhYDHtlCyyOdFIQGvxYA50wBC046dPjlrp5mFs/k=
X-Gm-Gg: ASbGnctbyu2D39ms2jdaJk2QDkc2T+LDtiyh6T5msd0PMeyhgs/RC0/iexWAZsR3eMc
	QTm/55iMeiDdDopkefN83wUbtQVChd9y/bWHQeIa6fvYq2quKs7xUaBS40hYLrN2CLVbFAiQ2lU
	ZbMdNN9CVbJhC5F8DO1E2AvSbQWVwnFFtPVvyQy2RqRPZOl1aFdfTHhDHID3fmAfq1sn14j9OfD
	a1ihlPBVQVnVpD346JSdWpBGUGra5vQB0qjQDP821kxcYYNxkn7J5311pghPmFaHcGHkpuRfBgn
	NvP8R3p8yqVvTBwJ6FLq+xWQR2cYsBSKjOn+zyaEurYQE2Q5SBi4cJAdjBPPbOAVa7tq6E+SF+F
	ICSnkUljWywhwTFo3jcoCyUBcqy6cc1FVGXmTAPF7or+UGHtEH6jD2NNFRzR4utRnmrPtacpWhP
	ou1GVohn5Ku+SsIFi1PnpfYPSZCSv+BA==
X-Google-Smtp-Source: AGHT+IGnLLVOgtBb6QoIpnryngoXF9ZsVrA0Hu/BPktiacTI1lwDmiBLrou7m3q1ehoWZoiBVrtp+A==
X-Received: by 2002:a05:600c:6289:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-4778fe62100mr154949795e9.9.1763475216662;
        Tue, 18 Nov 2025 06:13:36 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779a684202sm188236015e9.10.2025.11.18.06.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:13:35 -0800 (PST)
Message-ID: <3054e8f6-a11f-4278-a27b-1a868699b958@tuxon.dev>
Date: Tue, 18 Nov 2025 16:13:34 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Add suspend/resume support
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org, kishon@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251106144148.3051962-1-claudiu.beznea.uj@bp.renesas.com>
 <4d486bd8-9e87-4bf2-a96f-38aa0f701c45@linaro.org>
 <047df95e-b1b6-4e7b-89f7-d7cb69559a49@tuxon.dev>
Content-Language: en-US
In-Reply-To: <047df95e-b1b6-4e7b-89f7-d7cb69559a49@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/18/25 16:13, Claudiu Beznea wrote:
> Hi, Neil,
> 
> On 11/18/25 15:54, Neil Armstrong wrote:
>> On 11/6/25 15:41, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The Renesas RZ/G3S supports a power saving mode where power to most of the
>>> SoC components is turned off. The USB PHY is among these components.
>>> Because of this the settings applied in driver probe need to be executed
>>> also on resume path. On suspend path only reset signal need to be asserted.
>>> Add suspend/resume support.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>> ---
>>>
>>> This patch is built on top of patches 1/7, 2/7 at [1]
>>>
>>> [1] https://lore.kernel.org/all/20251023135810.1688415-2-
>>> claudiu.beznea.uj@bp.renesas.com
>>>
>>>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 66 +++++++++++++++++-------
>>>   1 file changed, 47 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/
>>> renesas/phy-rcar-gen3-usb2.c
>>> index a38ead7c8055..3c063e4dea41 100644
>>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> @@ -132,6 +132,7 @@ struct rcar_gen3_chan {
>>>       struct device *dev;    /* platform_device's device */
>>>       const struct rcar_gen3_phy_drv_data *phy_data;
>>>       struct extcon_dev *extcon;
>>> +    struct reset_control *rstc;
>>>       struct rcar_gen3_phy rphys[NUM_OF_PHYS];
>>>       struct regulator *vbus;
>>>       struct work_struct work;
>>> @@ -778,35 +779,24 @@ static void rcar_gen3_reset_assert(void *data)
>>>   static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
>>>   {
>>>       struct device *dev = channel->dev;
>>> -    struct reset_control *rstc;
>>>       int ret;
>>>       u32 val;
>>>   -    rstc = devm_reset_control_array_get_shared(dev);
>>> -    if (IS_ERR(rstc))
>>> -        return PTR_ERR(rstc);
>>> +    if (!channel->phy_data->init_bus)
>>> +        return 0;
>>>         ret = pm_runtime_resume_and_get(dev);
>>>       if (ret)
>>>           return ret;
>>>   -    ret = reset_control_deassert(rstc);
>>> -    if (ret)
>>> -        goto rpm_put;
>>> -
>>> -    ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert, rstc);
>>> -    if (ret)
>>> -        goto rpm_put;
>>> -
>>>       val = readl(channel->base + USB2_AHB_BUS_CTR);
>>>       val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
>>>       val |= USB2_AHB_BUS_CTR_MBL_INCR4;
>>>       writel(val, channel->base + USB2_AHB_BUS_CTR);
>>>   -rpm_put:
>>>       pm_runtime_put(dev);
>>>   -    return ret;
>>> +    return 0;
>>>   }
>>>     static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>>> @@ -846,6 +836,18 @@ static int rcar_gen3_phy_usb2_probe(struct
>>> platform_device *pdev)
>>>           }
>>>       }
>>>   +    channel->rstc = devm_reset_control_array_get_optional_shared(dev);
>>> +    if (IS_ERR(channel->rstc))
>>> +        return PTR_ERR(channel->rstc);
>>> +
>>> +    ret = reset_control_deassert(channel->rstc);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert, channel-
>>>> rstc);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>>       /*
>>>        * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>>>        * And then, phy-core will manage runtime pm for this device.
>>> @@ -861,11 +863,9 @@ static int rcar_gen3_phy_usb2_probe(struct
>>> platform_device *pdev)
>>>       platform_set_drvdata(pdev, channel);
>>>       channel->dev = dev;
>>>   -    if (channel->phy_data->init_bus) {
>>> -        ret = rcar_gen3_phy_usb2_init_bus(channel);
>>> -        if (ret)
>>> -            goto error;
>>> -    }
>>
>> I don't see why you changed the logic of calling
>> rcar_gen3_phy_usb2_init_bus(),
>> moving the reset setup and handling should be enough, no ?
>>
> Sorry, I missed to mention it. I did it like this just to avoid this pattern:
> 
> 	if (channel->phy_data->init_bus) {
> 		ret = rcar_gen3_phy_usb2_init_bus(channel);
> 		if (ret)
> 			return ret;
> 	}
> 
> in both probe and resume path. The channel->phy_data->init_bus check is not

s/not/now

> embedded in rcar_gen3_phy_usb2_init_bus(). Please let me know if you want
> me to revert it.
> 
> Thank you,
> Claudiu


