Return-Path: <linux-renesas-soc+bounces-10762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3E89DC104
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 10:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 305EBB234CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 09:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BF6175D5A;
	Fri, 29 Nov 2024 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ob4CVMTj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B431714D3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Nov 2024 09:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732870991; cv=none; b=kFdQC+i0V7qqtzfl7aOa3Z9PUdU1eyyZuM9wMIgzbLJev/K6voTpC3uZlsdaJFl9vn+puVcB5MUJDVn5vWdiB4h7oaYCBDltasw+8g1GCTC6enx5iLBN1jaxxdJRgyI6sSjTMMo9Elg7pkxS0D1pQEempVNiRdlO0sjPRpja71I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732870991; c=relaxed/simple;
	bh=W1YRHieW3uDH5Ei+cdpGwa9M418RG0tOLoVTK/704So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHe2Nn3Bkn6Lo7IhddZUKMAtB2QEwAKRbCcmwRzgySl0UBE6Ai7dWeV756Jx6jtyc1SaXz8jRI24ls5HVCI3Rode9u4As+arC9X0Ef1BSiqmPvs9ua+0Gb5tmDB+AC8js7DTYwWyvhe0ZjvJkQQB3m+J0KHe+X8OAN9rgRAOFjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ob4CVMTj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4349fb56260so14494635e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Nov 2024 01:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732870988; x=1733475788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+rY0dLqM7fvb5GcnSDF7szSVTR/hhqMi8Lj2NDtPS10=;
        b=Ob4CVMTjfTWkwy0KUOOa1XPsTSB79A6Tv986AOs4B8C17c9fyTEQgt9bKUlaS3glFL
         GkrgV2VP4Y6l1pKDvdDxdnhrMS7qvlimpiK3MCqNMrpRR5isqzhEapt3N9W9SHJOxoV/
         67ZJnou+shCZgGres7272zXxGZajpENNxETF+NRWOCkNGINmUQKqKu0+W4U1UdOUpPBx
         vV0Z1WQc1fMvqan+6tuLOAjse+DMGh+14yquufDoPUzTVMyaIU5R5Jwqgg9+rkfG4uGX
         79RiabbnCXI0J9sIEOMgYY1RWQlgZ5DoDBXhnko6Iv1lB6LsHRZK0n8LYPfwXI0AafCg
         fdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732870988; x=1733475788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+rY0dLqM7fvb5GcnSDF7szSVTR/hhqMi8Lj2NDtPS10=;
        b=UtXL9Fa63yCKoc0fm72u5BL70yM3x/C7lexblhQdhRQU7oeqYyHDT72eYmLD4rfdUy
         dMgZSdPrWrU8E5QC0zaAseRPg9xEdGhys9bfUIU8LHkicvGBnfGjzPrv3gupuRZYRsCE
         mtIM3g8YYU0uR+BrnYjVV5HdyoOuz+WGvkgmTQ683u0LdcsTs2LoKkRDsCQkBNa52lFP
         k3xa745Ja1rr93lMDrbjYeEBLErO17/SkQDZsqkPvY+KxA8rJnSSv2SfetH7yLGMfU44
         bVQZuH+Tt4y7PYjmQ3j/usJ+1hMcskoddxEXc9QM87Q93S3sSIYL3WFT2di0vb+9kMrX
         KnYg==
X-Forwarded-Encrypted: i=1; AJvYcCUMf24liTjX5RNNdvv9LM+zuApj1XULZ/pycYt3n6KjUwDDyOgdJXT+2MU06Er8jDGEj9HwzNUQ3g72f2aOUmdSHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyST7yRMlsFNP6+Php3IeTUDO/V1gH7Q9bSgBDC7O8A/9WQvfAY
	RveRtTr+GoKt8HaeCh7p3tKy7agQfzLqQIwqFlL18GsXeC7x6QGGEwsUEo6Okpo=
X-Gm-Gg: ASbGncuHGUv50QuO409L38Kd5ieMTbItd6p9gVMhlICQ1iI9XhLk6rlrSwN+JxQu2VJ
	VK7ObVZTi9lzdjK49KnAxGL00WORd9xLMoPWZePLUVcJ8tXKGXbcXMDLKoCwwI8o9J7qmv4dMCh
	+Oy4FWkYcopOQwsoTDg0iHZtoSP3CgXjt/TJ7uhRx+niXyjeFPn4IYqLwHs0aSXQPOgUGJfVIRv
	bprBCIDIm/8hP5sb9cdzh3bbQFBaYBdQZesMKB46D/+yPBjOWW8n5VZpg==
X-Google-Smtp-Source: AGHT+IFxOAosMgPH1DwOz8xTdL/bhhh3JSxfGeV4SlShXIcXyV3NM5UKte4f3H7kmldw1sZye0/6SA==
X-Received: by 2002:a05:600c:4f0e:b0:434:9cf0:d23d with SMTP id 5b1f17b1804b1-434a9deca10mr83604355e9.25.1732870988339;
        Fri, 29 Nov 2024 01:03:08 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7d25d1sm78181295e9.31.2024.11.29.01.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 01:03:07 -0800 (PST)
Message-ID: <61e2fd80-d47f-4116-8dfe-fc27a58c8241@tuxon.dev>
Date: Fri, 29 Nov 2024 11:03:05 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] phy: renesas: rcar-gen3-usb2: Add support for
 PWRRDY
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, gregkh@linuxfoundation.org,
 yoshihiro.shimoda.uh@renesas.com, christophe.jaillet@wanadoo.fr,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-usb@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-11-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdX9ZB5ec4g+Gs37U+oH4XPDv8DLoA63oxh4o8gj-N+sNw@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdX9ZB5ec4g+Gs37U+oH4XPDv8DLoA63oxh4o8gj-N+sNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 28.11.2024 17:07, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, Nov 26, 2024 at 10:21 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> On the Renesas RZ/G3S SoC, the USB PHY has an input signal called PWRRDY.
>> This signal is managed by the system controller and must be de-asserted
>> after powering on the area where USB PHY resides and asserted before
>> powering it off.
>>
>> The connection b/w the system controller and the USB PHY is implemented
>> through the renesas,sysc-signal device tree property. This property
>> specifies the register offset and the bitmask required to control the
>> signal. The system controller exports the syscon regmap, and the read/write
>> access to the memory area of the PWRRDY signal is reference-counted, as the
>> same system controller signal is connected to both RZ/G3S USB PHYs.
>>
>> Add support for the PWRRDY signal control.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> @@ -707,6 +718,55 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
>>         return ret;
>>  }
>>
>> +static void rcar_gen3_phy_usb2_set_pwrrdy(struct rcar_gen3_chan *channel, bool power_on)
>> +{
>> +       struct rcar_gen3_pwrrdy *pwrrdy = channel->pwrrdy;
>> +
>> +       /* N/A on this platform. */
>> +       if (!pwrrdy)
>> +               return;
> 
> This cannot happen?

You're right, currently it can't happen.

It might be useful for the suspend to RAM support (that will be posted
after initial support will be integrated) to have this function called
unconditionally on suspend/resume APIs.

I can drop it if it's preferred.

Thank you for  your review,
Claudiu

> 
>> +
>> +       regmap_update_bits(pwrrdy->regmap, pwrrdy->offset, pwrrdy->mask, !power_on);
>> +}
>> +
>> +static void rcar_gen3_phy_usb2_pwrrdy_off(void *data)
>> +{
>> +       rcar_gen3_phy_usb2_set_pwrrdy(data, false);
>> +}
>> +
>> +static int rcar_gen3_phy_usb2_init_pwrrdy(struct rcar_gen3_chan *channel)
>> +{
>> +       struct device *dev = channel->dev;
>> +       struct rcar_gen3_pwrrdy *pwrrdy;
>> +       struct of_phandle_args args;
>> +       int ret;
>> +
>> +       pwrrdy = devm_kzalloc(dev, sizeof(*pwrrdy), GFP_KERNEL);
>> +       if (!pwrrdy)
>> +               return -ENOMEM;
>> +
>> +       ret = of_parse_phandle_with_args(dev->of_node, "renesas,sysc-signal",
>> +                                        "#renesas,sysc-signal-cells", 0, &args);
>> +       if (ret)
>> +               return ret;
>> +
>> +       pwrrdy->regmap = syscon_node_to_regmap(args.np);
>> +       pwrrdy->offset = args.args[0];
>> +       pwrrdy->mask = args.args[1];
>> +
>> +       of_node_put(args.np);
>> +
>> +       if (IS_ERR(pwrrdy->regmap))
>> +               return PTR_ERR(pwrrdy->regmap);
>> +
>> +       channel->pwrrdy = pwrrdy;
>> +
>> +       /* Power it ON. */
>> +       rcar_gen3_phy_usb2_set_pwrrdy(channel, true);
>> +
>> +       return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_pwrrdy_off, channel);
>> +}
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

