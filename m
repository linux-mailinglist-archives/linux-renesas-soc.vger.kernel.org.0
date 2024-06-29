Return-Path: <linux-renesas-soc+bounces-6904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2139291CC45
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 13:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAF61282189
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Jun 2024 11:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D284502B;
	Sat, 29 Jun 2024 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jE0sRWgR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52EE4503B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jun 2024 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719659472; cv=none; b=az5Y2JZOvXSmnlyocU223++6zqBvT9292TyRPYgGScVWbA6jG7r7qMj/PoLiYSvMGMKjpg5v7Wr2QLpGBXOgAyndO/fyU0+q9ISYIQhRIuC3WhODbk+4Hk6dx9SuiZ4FuE3MWgnAQzBtkQSm4mnY18EN5N4xENk695BEFMnomZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719659472; c=relaxed/simple;
	bh=vExeczRnVrI7UT25v1lNxQKRkxT3BOGoqkI3DI6fywQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2PTz+PwucoOIfhyrHbu6mwpXipUlX7Ny0/cvw1uuCZ2K3Rt4Eqhk2KXjxaP/qXfNxCklf11fIaN/8lVCSTcvw5GWO3xCKTqkq32oG/Ra3WjxIWZaJ8aYBpi30fSZrLjSEBmHeQRFeojYYQ71yjSwgYMYWsjNnO0izGdRqq4qTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jE0sRWgR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-367339bd00aso1130964f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Jun 2024 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719659468; x=1720264268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Xt/KmvrgieieUb7BSBOgm30lvwqq55l4c9xKge1N7E=;
        b=jE0sRWgRU8OczQsiIUwwAw3w+OCmYdN0L3ChHI/n04+F462FoWmgIx4UPYa0yAnlVF
         TC1/Mwx16aQC0a+CKIlofW4W32YuZIV0ZG1f6J5uiSk/hENlRetq1NtufZONCK/8oDnr
         qrjPeaViTG+OQlbXuzfLaiYPIfTnBwe78iKU2YprE2cR2hL/sxo0Mlp5gM5fazyyZcnz
         11kHafgZ7stqW3HGYOM5PtUlP/Z6TT/40mDgq9iUNhFvO7SlHaMKGhUCOxuluuIaH6Ez
         qpaB1+MZ8AInnHGjfK+gRtZYl2/Z3RJJWBOmTlZtzbzKvy8MhPFsN0fhmKf75o1WX4W3
         9Pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719659468; x=1720264268;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Xt/KmvrgieieUb7BSBOgm30lvwqq55l4c9xKge1N7E=;
        b=l6/8AgpDCwcgMwGWP1mDuwPHvAIW4GD5gL+c1eTbNHiRG9DXaCH3GWZy1pRlHjG+zo
         9F9pS5STPZFQDxlFM3dgCvGhiIF2EyiYog4nRjKZ9iyx3NTVsnycq2b+e/qOzgoACfxA
         5tR9rBOk2I39CS9pNkcoE/l/43QYnt40rQuMkxAPHMtDndIFdjOkqdDxPFFsCPJgfqDq
         yrRUM5N3AVIA81OXjTemQF05uUzhd2tofzrV8acNMtjxyP+ebRAwYOYAB3lfW5pH050X
         pOjjjnFfRj+/fxxJzlI6MON2XNVNJEPkOnGUwoLFyJSIRnnpIHb8zutsKV+bTfuWTKax
         m+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz5bDPFCTWk+zSeG07DNDJLNwzpiQ596Uq0Z7+YRMQNjvTesHxfk14RWrnb2UwNg42/yLGVk+v6rHdRDnM0z19JXgEPrcYzGVM0SVwPd3YCSI=
X-Gm-Message-State: AOJu0YxevhqOYbJ1kwC3fnedHidHre9YNL1XmnpPUahq3AMQGEWu3U7U
	svWsFU9J1NDtO+N4gJ0yYJGpUlIV184ZKNhCIZ3y7reMGK9XmXCeb/0PNby11p4=
X-Google-Smtp-Source: AGHT+IFqpLX+00lyexUlkVp9WFDAXonVuJYiPnYyITmMVz0K/9z+LFGOHYAxHvC+6+cwE40Yy3Dg1Q==
X-Received: by 2002:a5d:4949:0:b0:366:e9f2:a551 with SMTP id ffacd0b85a97d-36775721668mr630762f8f.43.1719659467926;
        Sat, 29 Jun 2024 04:11:07 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fc434sm4581330f8f.76.2024.06.29.04.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 04:11:07 -0700 (PDT)
Message-ID: <e2a3672a-5f1b-4969-8ddb-aad63a776db3@tuxon.dev>
Date: Sat, 29 Jun 2024 14:11:05 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
 <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
 <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev>
 <CAMuHMdXJ8eKLzMqCPR2ewS9gr_m5OQPneETPMC-rOOmW+--f5A@mail.gmail.com>
 <7c542f46-c644-4f22-bbc4-408b7dad8273@tuxon.dev>
 <CAMuHMdUmiQjsKt93jM62V5YR_NdtUDXhcxFs+F+BCu3NTNsx8Q@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdUmiQjsKt93jM62V5YR_NdtUDXhcxFs+F+BCu3NTNsx8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28.06.2024 14:39, Geert Uytterhoeven wrote:
> On Fri, Jun 28, 2024 at 12:29 PM claudiu beznea
> <claudiu.beznea@tuxon.dev> wrote:
>> On 28.06.2024 12:13, Geert Uytterhoeven wrote:
>>> On Fri, Jun 28, 2024 at 10:12 AM claudiu beznea
>>> <claudiu.beznea@tuxon.dev> wrote:
>>>> On 28.06.2024 11:09, Biju Das wrote:
>>>>>> -----Original Message-----
>>>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>>>> On 28.06.2024 10:55, Biju Das wrote:
>>>>>>>> -----Original Message-----
>>>>>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>>>>>> Patch 09/12 "i2c: riic: Add support for fast mode plus" adds a new member to struct
>>>>>> riic_of_data.
>>>>>>>> That new member is needed to differentiate b/w hardware versions
>>>>>>>> supporting fast mode plus based on compatible.
>>>>>>>
>>>>>>> Are we sure RZ/A does not support fast mode plus?
>>>>>>
>>>>>> From commit description of patch 09/12:
>>>>>>
>>>>>> Fast mode plus is available on most of the IP variants that RIIC driver is working with. The
>>>>>> exception is (according to HW manuals of the SoCs where this IP is available) the Renesas RZ/A1H.
>>>>>> For this, patch introduces the struct riic_of_data::fast_mode_plus.
>>>>>>
>>>>>> I checked the manuals of all the SoCs where this driver is used.
>>>>>>
>>>>>> I haven't checked the H/W manual?
>>>>>>
>>>>>> On the manual I've downloaded from Renesas web site the FMPE bit of RIICnFER is not available on
>>>>>> RZ/A1H.
>>>>>
>>>>> I just found RZ/A2M manual, it supports FMP and register layout looks similar to RZ/G2L.
>>>>
>>>> I introduced struct riic_of_data::fast_mode_plus because of RZ/A1H.
>>>
>>> Do you need to check for that?
>>>
>>> The ICFER_FMPE bit won't be set unless the user specifies the FM+
>>> clock-frequency.  Setting clock-frequency beyond Fast Mode on RZ/A1H
>>> would be very wrong.
>>
>> I need it to avoid this scenario ^. In patch 09/12 there is this code:
>>
>> +       if ((!info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
>> +           (info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
>> +               dev_err(dev, "unsupported bus speed (%dHz). %d max\n", t->bus_freq_hz,
>> +                       info->fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
>> +                       I2C_MAX_FAST_MODE_FREQ);
>>                 return -EINVAL;
>>

FTR, the full context of this change is (from patch 09/12):

@@ -315,11 +319,13 @@ static int riic_init_hw(struct riic_dev *riic)
 	int total_ticks, cks, brl, brh;
 	struct i2c_timings *t = &riic->i2c_t;
 	struct device *dev = riic->adapter.dev.parent;
+	const struct riic_of_data *info = riic->info;

-	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
-		dev_err(dev,
-			"unsupported bus speed (%dHz). %d max\n",
-			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
+	if ((!info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
+	    (info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
+		dev_err(dev, "unsupported bus speed (%dHz). %d max\n", t->bus_freq_hz,
+			info->fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
+			I2C_MAX_FAST_MODE_FREQ);
 		return -EINVAL;
 	}

Thank you,
Claudiu Beznea

>> to avoid giving the user the possibility to set FM+ freq on platforms not
>> supporting it.
>>
>> Please let me know if I'm missing something (or wrongly understood your
>> statement).
> 
> Wolfram/Andi: what is your view on this?
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

