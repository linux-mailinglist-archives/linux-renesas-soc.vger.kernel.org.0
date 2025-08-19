Return-Path: <linux-renesas-soc+bounces-20672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7487B2B90B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 08:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCAC0172C15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 06:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34B92652A4;
	Tue, 19 Aug 2025 06:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="g3Aeuh64"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20841863E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 06:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755583291; cv=none; b=R5w4IE4H4zcJuebh8FnN9MterdPalZYs9j6vvE/OdCi9Xa1IFEHDIQzz84H10MmGbCdBQYqIx41KmRDl9dQao3TcRQU9tHoVm5S7qB8AIsBopL/NofUvWUVY83b+I2553STXmWHkNWElnUdMqdTG5FUoyY5X/CT0NZeOFLFjgys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755583291; c=relaxed/simple;
	bh=d90UlPnb7NvxVKC9yf2/H9lQTofd1mj/OUUr+YCoIPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oP5/2ZbWbM1cvysQ2gLIPx6t3eMdPU4Tsm2pk03slFoFgM1EJu2IosVGhT508jcSLG1PLYPiXkirmjUJGrhh3PhcrBFmIe9m+6QpV4sIbh1Nm5qn4RLRJDKPq5RThJj9dme/eDCARiCDeuu8KXktzNoMeACrKOis32LHp+w/QOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=g3Aeuh64; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b098f43so29764165e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 23:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755583287; x=1756188087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCrxZo4+iFbzWuafqcWchsTA3vFDSS7vqG8us0w6qHw=;
        b=g3Aeuh64z51UVaLG/7lD81owbYC8+gqgmhJa4e4mJy087vjjf3o6MHkwO+vVv8pjVW
         jfOsUaxgQIkDw5jHmGu7/fKPuqxoQEl+vq1qFpLP/KFiod5Yz9MTjfp2kMv/Tbbi4bC8
         1/VZggdudZigJp6NJc/3TkaCsuoIoheD0dnTz89pRCkEBMN1g+ppIGASlW3V1XeuZ9ki
         iol4XojmwaNu2BRYVEZIf76SyoAJ48/tH8MP/C9X3VNLm76vZGdl7ATssaX+MVGYYj2I
         RlwJkaPMAR8JdP3+klDqwyvrGPTMMYQiiQyLaj2ie6Dabo2BG+udYt0kO0Idjh6jPoOZ
         Gz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755583287; x=1756188087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCrxZo4+iFbzWuafqcWchsTA3vFDSS7vqG8us0w6qHw=;
        b=DGJz4Q97QQxlwudFhpuVHtrn5lC4nMqhNxolc2grAoCzAYTTRFvixe6ZbjqHKc+Od9
         vgZBslLb82Ii5qwP8BEOlYEyHjIDCAPsNtIZfcVeH0wUMKFImwfzRwt5KtbjFpnA9vtW
         25zkTPLypks+18CknK2imwnAYf8XGcuNrNXhcx/Q9rDew5C4sWypeAEoto7gFSxRD14y
         ceeaT9kVp5uT6bYpGF69hQmamF6ueySwLseDjHhT1RrFX5ZgHZCnbSkqrWH3OKKsQVge
         95hmXTLKRieNVOOV1RztroGMSIjPYrkXBRJhDOlSj3fSoDeui9rpA4EhlNOjkldc+m6y
         8Hdw==
X-Forwarded-Encrypted: i=1; AJvYcCXVHW1O2cXdOjIw04UUOUcPsAASp0vkXivT3rU5vvY/58b7HU4KRjAH+KQSpEcWaetsuuakfCzJf2ZnOoNcuC5bsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvGCF4l4KahG7ghAak9GAlo8Ytn7pvR638hUeKjVYOC/+5FzKM
	fllG7LaT6by6wVFQZ9mDvV3Yf1qrVYLhjYDzFhdR85bxxkdnYZAzE0uPCuyj3mNnLMU=
X-Gm-Gg: ASbGncvJZdky9hURu8EC6psG3B2HXkF+MX5Vwb2YxUO1yxkGOl2eXZIjfI0h0WJdtx8
	zgiS1Fo8cJ5EAODkLJ+eF4c+GP2YIOlH28yjgLOWPJz5quvxziJ7Dwz3NFX84H6GewEktrL4age
	k1tlbPTJa/Sm6pax29hbZCJd+VeLei+RxPrP6VydCMbN4s4H4LfLkIX4RZXhS03DYqZw4k8xPAm
	aqSb6z/PO56XxCxvffv5WIWuMnay3JWuB36b+wyWjOEHBGcvcUbGloOFkZXTWs9EwXHez2j6lg5
	78iX8TvrRkprq4kwTachbsihzPxfAq09zdbo6/tQC8H/qSgeoSgOQh+rhy58irHdbx1lAsIjWLX
	6q36oYEevMPrbHK2BEWnzh+tL8UtKcUoGvF69YBLXr5LjSRSLiSm+wl+6tNtZ+fpZbYwN1KeIEn
	P3IQ==
X-Google-Smtp-Source: AGHT+IEBenKmHbomfqM7jRrj+OcZnm9VNNe9GX3JYk6fkmpM0P8zqRVhhyCR0kaRAw4wTbU/JEdLvw==
X-Received: by 2002:a05:600c:4750:b0:450:cabd:b4a9 with SMTP id 5b1f17b1804b1-45b43e02bc0mr6688745e9.29.1755583287073;
        Mon, 18 Aug 2025 23:01:27 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:620a:8b00:4343:2ee6:dba1:7917? ([2a02:2f04:620a:8b00:4343:2ee6:dba1:7917])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c5767fsm2102502f8f.62.2025.08.18.23.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 23:01:26 -0700 (PDT)
Message-ID: <bc053bca-8dd9-4a50-a352-290b38a329b0@tuxon.dev>
Date: Tue, 19 Aug 2025 09:01:20 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] phy: renesas: rcar-gen3-usb2: Fix an error
 handling path in rcar_gen3_phy_usb2_probe()
To: Biju Das <biju.das.jz@bp.renesas.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "kishon@kernel.org" <kishon@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm" <magnus.damm@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
 <20250819054212.486426-3-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB1134647BC6436CA61E0A200F98630A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB1134647BC6436CA61E0A200F98630A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 8/19/25 08:49, Biju Das wrote:
> Hi Claudiu, Christophe,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 19 August 2025 06:42
>> Subject: [PATCH v5 2/7] phy: renesas: rcar-gen3-usb2: Fix an error handling path in
>> rcar_gen3_phy_usb2_probe()
>>
>> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>
>> If an error occurs after the reset_control_deassert(),
>> reset_control_assert() must be called, as already done in the remove function.
>>
>> Use devm_add_action_or_reset() to add the missing call and simplify the
>> .remove() function accordingly.
>>
>> Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initialize the bus")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> [claudiu.beznea: removed "struct reset_control *rstc = data;" from  rcar_gen3_reset_assert()]
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v5:
>> - none
>>
>> Changes in v4:
>> - none
>>
>> Changes in v3:
>> - collected tags
>>
>> Changes in v2:
>> - none; this patch is new; re-spinned the Christophe's work at
>>
>> https://lore.kernel.org/all/TYCPR01MB113329930BA5E2149C9BE2A1986672@TYCPR01MB11332.jpnprd01.prod.outloo
>> k.com/
>>
>>
>>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> index 47beb94cd424..d61c171d454f 100644
>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> @@ -699,6 +699,11 @@ static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
>>   	return candidate;
>>   }
>>
>> +static void rcar_gen3_reset_assert(void *data) {
>> +	reset_control_assert(data);
>> +}
>> +
>>   static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)  {
>>   	struct device *dev = channel->dev;
>> @@ -717,6 +722,11 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
>>   	if (ret)
>>   		goto rpm_put;
>>
>> +	ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert,
>> +				       channel->rstc);
> 
> Now 'rstc' can be removed from struct rcar_gen3_chan and use the local rstc pointer
> as context variable here.

I can drop it now but it will be added later (after this series) along with 
suspend to RAM support. That is the reason I preferred to still keep it.

Thank you,
Claudiu

> 
> Cheers,
> Biju
> 
>> +	if (ret)
>> +		goto rpm_put;
>> +
>>   	val = readl(channel->base + USB2_AHB_BUS_CTR);
>>   	val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
>>   	val |= USB2_AHB_BUS_CTR_MBL_INCR4;
>> @@ -860,7 +870,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
>>   	if (channel->is_otg_channel)
>>   		device_remove_file(&pdev->dev, &dev_attr_role);
>>
>> -	reset_control_assert(channel->rstc);
>>   	pm_runtime_disable(&pdev->dev);
>>   };
>>
>> --
>> 2.43.0
> 


