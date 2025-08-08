Return-Path: <linux-renesas-soc+bounces-20137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4AEB1E682
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 12:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4490587831
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 10:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBF9274B2E;
	Fri,  8 Aug 2025 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gcBjHvan"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1523D2749F9
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Aug 2025 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754649129; cv=none; b=TzxvNlCprtYJPOIexHjAQRBNIm/U/aBn6Gz2qYPVuX/mMltg76EQPaK6hAKk1BMjLaaYojt5LtYSfvRmZsm6NBvNunvr+7FZJvZGHM8/LMFAS5dqCFOxgNNEZzo8iujqqeQM3a5JzejGCEuWwD4Nflhge5ul8iQR0xLbHh2gA6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754649129; c=relaxed/simple;
	bh=iY75W6j7pIHjhmtkbP1Hku/h+iHCAu+MbBXJB1XzJpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWEVAPJIFJPhWLXc9aTWRvilqZMo6HtQAlFkzpvQlJFvxKogbCCbXii9o/OPvu2aVuD2ZNNcuG9/y3seVGDwmhKKl910TQRZwPTiazNTNZcbY/KbHcX/nvqY7itb61VofxLfkqNe7w+6iCO//10w2lmDbmjfihdWUkR96TMiOqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gcBjHvan; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6154655c8aeso2871257a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Aug 2025 03:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754649125; x=1755253925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c6TSWrBncc/Rhuijv2C5MP7HYYUBAQpR0KYcqpwTlxE=;
        b=gcBjHvan0TL0WQ71RJK73V8Q8fgsp0HctchC6H7lZ5bd7VdlYn81ma8yJLJC5n4yAs
         CSzfjbU3TQcUn+CCBm4sIkpo0XD1GknuAPd1TwRRyxVNmR0eMGNmBWirm6c/Q7p2WCOp
         0wXfhK+E0YGdgZCJTeheCbWA59rHrhlZrPSS6btvSNejE/UTY1r7TE0Adp9qsWC6b9Df
         kObNXWVfC+/iqUSohzbmM4FfyAevE/umFiEMsR0f7gRodjJwARW4ODhw8uzVZva9Ve4D
         CERAk1oUPR+H427r0hj3BYBM4s+Wwr9UolDPJOL5o8aHNpG5J4dmgIx0ElggQemlzyHy
         FaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754649125; x=1755253925;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6TSWrBncc/Rhuijv2C5MP7HYYUBAQpR0KYcqpwTlxE=;
        b=gTPvk7qeYWUXFPhbLnxpl6NvcbI6KG/C2zlPTppOXxf7/fscD8JTRENgngCabOLd1w
         /hUcDhxIFIh2D/dOe6x3De72nWE7/VzJogrVRTc1l/W99CVqrAKsJPk9YYmI4GLNa+om
         kFqVgZCvoorkWqBxocfbif1tBbtMZl8nhDwgT09Yehe4jL9/Z+8529zf8Jlaf8h1dSId
         1qJv4YC3ozM5RIexz5Ktq33P6BREYpTf2iiQg9JkxO+bLwH7+SHjw3qI8941NZhD5+m0
         I1SPKzFEK9TrPJGAutaHUi48Hfzo0h4JXXwiJpndkCksrPPmPc9HRIrUfI1ntwDJbsCO
         7dOw==
X-Forwarded-Encrypted: i=1; AJvYcCVW20RzYAbJeGfCL8QVo08sWfHediO12e85M5qkk0K/u+wAvYKhg4Hhe4phtez4tyCAm2IVI6DbAL+gvizQlFLoOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDWo5m48uETmID8zwJ8rULSEDsCMWixENzyE10L9Z9980Oqs+e
	CXfUwQR40sIf3/oioKHd00PShFmO6Hbo1Cz+ebR90IrEZfB67rLddtsHeBMfFBnMRD4=
X-Gm-Gg: ASbGncukzpm6YfJ3+M3scE8kBGX7Is5M4wuKTYVXGwO7umti5z6070RYv8UE35gP/A5
	6Zw3Fc05pnOuLGRCDRTVJI/2hDv218ZIyXSPs63p3VEkBsyH/YxjOFVJaqs7/A0/wNIwzCJm+/K
	GjlapNtlZDoVVeeMMrkoNFmfsqTpuLRevt+hKp28NYV4xVeSy3Lw7cfhuARS+7AmSuN2RM4ng48
	eNoqDeaoDdyxr5VRq702OauTIPDi2tzM7yhfe+UvJwQfkRrX/t8jaqyGEjsbwD+U6lVaGH6YPKn
	mm1wdRseX+vLuR2LyNlIdFyB6MZU2kQWFhoBlXm+Vn5A9jqbBl+o57x0tB9zuB1dXWNqPABdp5z
	BY5rG1oGafMXdksHf/JOZoC5izi7RTaI=
X-Google-Smtp-Source: AGHT+IFiaq/Bs2HBuHCkLqYo5m9SoJu+9pxruSdi2P+MSc/rxt4OTN3JPa39G9gTH7FXPIDev3nAkA==
X-Received: by 2002:a05:6402:5216:b0:612:a86b:ac79 with SMTP id 4fb4d7f45d1cf-617e2b77876mr1905662a12.2.1754649125126;
        Fri, 08 Aug 2025 03:32:05 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff596sm13341214a12.5.2025.08.08.03.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 03:32:04 -0700 (PDT)
Message-ID: <cbdfa6fd-e65b-45d7-a21f-3bfdd46af332@tuxon.dev>
Date: Fri, 8 Aug 2025 13:32:03 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] soc: renesas: rz-sysc: Add syscon/regmap support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 John Madieu <john.madieu.xa@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
 <20250808061806.2729274-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUsFFd+orb17oQqoEidzYWMRjPoqMyzpgrdnicc=MRSYQ@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdUsFFd+orb17oQqoEidzYWMRjPoqMyzpgrdnicc=MRSYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 08.08.2025 12:29, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, 8 Aug 2025 at 08:18, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: John Madieu <john.madieu.xa@bp.renesas.com>
>>
>> The RZ/G3E system controller has various registers that control or report
>> some properties specific to individual IPs. The regmap is registered as a
>> syscon device to allow these IP drivers to access the registers through the
>> regmap API.
>>
>> As other RZ SoCs might have custom read/write callbacks or max-offsets,
>> register a custom regmap configuration.
>>
>> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
>> [claudiu.beznea:
>>  - do not check the match->data validity in rz_sysc_probe() as it is
>>    always valid
>>  - dinamically allocate regmap_cfg]
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v4:
>> - adjusted the patch description by dropping "add" from
>>   "add register a custom regmap configuration"
>> - updated the list of changes from Claudiu Beznea
>> - dynamically allocate the regmap_config as proposed at [2]
>> - this patch is needed for proper function of USB (as proposed in this
>>   series) that being the reason it is introduced here, as well
>>
>> [2] https://lore.kernel.org/all/CAMuHMdVyf3Xtpw=LWHrnD2CVQX4xYm=FBHvY_dx9OesHDz5zNg@mail.gmail.com/
> 
> Thanks for the update!
> 
>> --- a/drivers/soc/renesas/rz-sysc.c
>> +++ b/drivers/soc/renesas/rz-sysc.c
> =
>> @@ -117,7 +125,26 @@ static int rz_sysc_probe(struct platform_device *pdev)
>>                 return PTR_ERR(sysc->base);
>>
>>         sysc->dev = dev;
>> -       return rz_sysc_soc_init(sysc, match);
>> +       ret = rz_sysc_soc_init(sysc, match);
>> +       if (ret)
>> +               return ret;
>> +
>> +       regmap_cfg = devm_kzalloc(dev, sizeof(*regmap_cfg), GFP_KERNEL);
>> +       if (!regmap_cfg)
>> +               return -ENOMEM;
> 
> Is there any specific reason you decided to allocate regmap_cfg
> separately, instead of embedding it into struct rz_sysc?

Sorry, I missed to mention.

I chose to have it like this as the regmap_cfg is not used anywhere else
(through rz_sysc) except in probe.

Thank you for your review,
Claudiu

> 
> The rest LGTM.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


