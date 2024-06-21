Return-Path: <linux-renesas-soc+bounces-6637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 876249126B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 15:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBFA3B27098
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 13:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94871156223;
	Fri, 21 Jun 2024 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="N1g6+9HU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8A155A35
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976590; cv=none; b=BfCJyeIUzipkYw3gshICDbpCO/rugKvXSLcxNTVb7ERSRU82RPKSZ4I5sXWILQFk8iWy1z4sWtL1Wf/lwDRQrsmbkMDa7jIOhyrdsRrKRIMNY6YprjEWJPwMWBeyEx0VjzlGfyNzn/P9HBcnIyeD75AO4+r+kkelg54O4bEg/xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976590; c=relaxed/simple;
	bh=PrpYvrr+lZj/0Jd3AkYhgkAtqFwGNxKdteDQAdEtqEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r95sDk3VvZCZxP5SNyGfQoIdUVUrQCtvr+/CveWqMUcQOBDrrEf/HoyviY/6QrpqqpnE7E4xAl0NltvFr2ynWsRNayjQYTfdKSCORq7MOK+T46aiZydO4QWl7hspo0hvDhRFuqtBWa2o/UZY4WQSme+gINxasPWPCu8rL38gLuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=N1g6+9HU; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6fd4d1c173so69219866b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718976585; x=1719581385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=INoRISBtXksAaYyy0JvylhuhhaTC+YBBST6VNRHIR4w=;
        b=N1g6+9HUkZuIEMIk8r7k57BGHCPOsP5YljHBrK545ZZ3mKktX4GvovEJ/SlifC4k9A
         P09vg2gjtzqXpCRoDcR12a2v4x+s0DCoYAswrgeXKxLSTje14IHb2+W12wym0mXqxiyd
         VK4/yzSpSBlrJFTO9LFXGHHH9cECYHw5oOnmoqURPSLqGXrzncyiq7dD4Y+PDZx+3KhM
         ZtrBJA0y80eDFJTGH12dUg2LBfJITaGauRwQfs7sg4KJwIp1UKA4PBvU7oWAUh8GQLsP
         WN7ZWyMvfJ4OJSiVXONtFUrcgxP3SB6q/A4I6bGEGrrbrHLOpkqFY29ThVfJoh8LW3ty
         q3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718976585; x=1719581385;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INoRISBtXksAaYyy0JvylhuhhaTC+YBBST6VNRHIR4w=;
        b=vRpmhqnnNHnfELZHKafcNLShHWoyTyB/XoAnoZYcHiBA5yc0/Wwt2enYiBfML5D0CQ
         gGpHzJFV+G7FhXLMkMC1vwUb2yNCEWhOIqrERRF7FKD0vbglMhQNJwZeogUrM8G+xi00
         FlsyBw2avFJgGyah48N1R2tE/gULdl8cHFXPqXY/zu3U9dAtFOtPUWHmOLHLqvLgXk0O
         BYGQmqGAcKvObWOo7qTW1/wndYuSJXy/64cnYNZXUi/87RPP+ucV4yl+mvLNH16Yi7ft
         w2Bm+kdwl/7gWxgT8usTrvgLwVkRB21w704/2ijWIDZ33atlbYTxMyM+8JbYCiLP9Et3
         Yztw==
X-Gm-Message-State: AOJu0Yx0trEPe/xE9dNhELbhkRIGNMUbAJmCGtcbg7ph1CMWBCtHqaOv
	LVXT/LrvUhS3aVqeMi6Gttmctc+5FppfdnuWBlfmIHEa1aDyT2YNPNepKiGorog=
X-Google-Smtp-Source: AGHT+IFnJLB1bdpPyMNJb5hUtZ8cwpI1DBnsNCd6rt2DmnH3ISK33RmtfNC2TKx7U0ybwxMCRAAz9w==
X-Received: by 2002:a17:906:f2c3:b0:a6f:15c9:9aa3 with SMTP id a640c23a62f3a-a6fab7d6a99mr477701666b.67.1718976585397;
        Fri, 21 Jun 2024 06:29:45 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf42a650sm84492566b.43.2024.06.21.06.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 06:29:44 -0700 (PDT)
Message-ID: <e381e1c0-2e23-4734-a55f-cab6c21f8c5b@tuxon.dev>
Date: Fri, 21 Jun 2024 16:29:41 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346105D3D3DD46AEF8CD44986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <0bc78e5e-de37-4ff6-ac74-571f615b97f9@tuxon.dev>
 <TY3PR01MB1134602C189C6C63C6187840886C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b5a3ef7c-8509-4065-ab0f-efb5a7e5fcbb@tuxon.dev>
 <TY3PR01MB11346D9CF89F7ED9B6A49C61586C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346D9CF89F7ED9B6A49C61586C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.06.2024 16:10, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Friday, June 21, 2024 2:06 PM
>  Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
>>
>>
>>
>> On 21.06.2024 15:56, Biju Das wrote:
>>>
>>> Hi claudiu,
>>>
>>>> -----Original Message-----
>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>> Sent: Friday, June 21, 2024 1:55 PM
>>>> Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document
>>>> the R9A08G045 support
>>>>
>>>>
>>>>
>>>> On 21.06.2024 15:34, Biju Das wrote:
>>>>> Hi Claudiu,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>>>> Sent: Friday, June 21, 2024 12:23 PM
>>>>>> Subject: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
>>>>>> R9A08G045 support
>>>>>>
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible
>>>>>> with the version available on Renesas RZ/V2H (R9A09G075). Most of
>>>>>> the IP variants that the RIIC driver is working with supports fast mode plus.
>>>>>> However, it happens that on the same SoC to have IP instatiations
>>>>>> that support fast mode plus as well as IP instantiation that
>>>>>> doesn't support it. For this, introduced the renesas,riic-no-fast- mode-plus property.
>>>>>>
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 8
>>>>>> ++++++++
>>>>>>  1 file changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git
>>>>>> a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>>>> b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>>>> index 91ecf17b7a81..c0964edbca69 100644
>>>>>> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>>>> @@ -25,6 +25,10 @@ properties:
>>>>>>                - renesas,riic-r9a07g054  # RZ/V2L
>>>>>>            - const: renesas,riic-rz      # RZ/A or RZ/G2L
>>>>>>
>>>>>> +      - items:
>>>>>> +          - const: renesas,riic-r9a08g045   # RZ/G3S
>>>>>> +          - const: renesas,riic-r9a09g057
>>>>>> +
>>>>>>        - const: renesas,riic-r9a09g057   # RZ/V2H(P)
>>>>>>
>>>>>>    reg:
>>>>>> @@ -66,6 +70,10 @@ properties:
>>>>>>    resets:
>>>>>>      maxItems: 1
>>>>>>
>>>>>> +  renesas,riic-no-fast-mode-plus:
>>>>>> +    description: specifies if fast mode plus is not supported
>>>>>> +    type: Boolean
>>>>>
>>>>> Can't this info, as part of device data?? Based on frequency and
>>>>> device data is enough to derive this info??
>>>>
>>>> We can't rely completely on device data because on RZ/G3S we have 2
>>>> RIIC channels that support fast mode plus and 2 that doesn't support it.
>>>
>>> Can't array of bits for this channels won't help??
>>
>> Can you give an example? I'm not sure I understand how you would prefer me to use the array of
>> bits.
> 
> struct riic_of_data {
> 	u8 regs[RIIC_REG_END];
> 	u16 fast_mode_info info; /* 1 means fast mode plus supported, starting with channel 0*/
> };
> 
> .info = 0x3, means channel 0 and 1 has fast mode plus supported
> .info = 0x0, none of the channel supported fast mode plus.

If I understand the proposal correctly, a match b/w struct
riic_of_data::info bit + frequency and the nodes in device tree is still
needed, right? As the RZ/G3S RIIC channels are using the same compatible.
W/o a match how I cannot detect in the driver who is, e.g., channel 1 that
supports FMP w/o hardcoding some RIIC channel data in the driver (e.g. RIIC
channel address)?

Also, for future SoCs that will suffer the same symptom but for different
channels (and channels with different addresses) the driver will have to be
adapted to match b/w the channel bit in struct riic_of_data::info and
channel node from DT.

> 
> Cheers,
> Biju

