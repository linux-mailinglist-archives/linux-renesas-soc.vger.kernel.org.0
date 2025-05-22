Return-Path: <linux-renesas-soc+bounces-17381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4EBAC0E6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C38DA40932
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F11028CF6B;
	Thu, 22 May 2025 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="G8IEigfM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4E928CF6A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 14:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924706; cv=none; b=IBK1F+mI27vvG4h+8UnT8w6iH8GSSchUC058FkDoCKwYcLTnDF+wvzmowExkcazvgBVIVoXeRfajJoG88gjUUMwTO5ttF1cKsNFFS9SQXUDBJSr6xjmEPCUPlGrCRrFKZVhbAFIpRjWFkRECRPoV7ClIDdk8YbZtdG9FezRab1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924706; c=relaxed/simple;
	bh=tSFOd0ob9YqFivKamN62b7ff1HRgQHWdM4cS+PZ7hGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QW291BkUUf0QGZS6zQgeLZ/Ztm85O06rvh3ixP7sjo1NK9fh9wT60TmsX6hZITesiIv6gc6NPiMbYqC4RjlLlsGDsRc+SOW3dt+9CVto5o2il9kWvHvIz6mlKjm2udHOeLLYbmgEixZ3rrS7Eb6GMWsMAPOmydkA1NWswcCifBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=G8IEigfM; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1374196866b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747924702; x=1748529502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o1xKktQ42UkJnkq9jbHipgrEK5NcK05/3GPTCixG9Do=;
        b=G8IEigfMQxwQs7FwttfbWKAOT/AMNt8pVgHQMGDa/xJhyFlHta2Yfa1tSN+yFae0on
         xm9P6MJvAUWHrQduidusttp+4QBwd4oTfApW6gAY2wIHwTC4LEcV1yn2+w518lyYD9/M
         9to6lQ7E9xgdbpS/vVmZzvPDUNMXl9OSTKiEb22ePqxIKe2OOGtnC9lKe6/ccvCNS6rw
         Ao4ZLjWVnm74RnMkRy2vWQ4IS45Im1M0QxsshB9/J9x531zy7m8qDJe/N3Ghl1TUijqy
         SQEgyeNk7ER7QvojQksDmehQftNRMZppDh4kDEkNakKMrLUwFPNHZPsc8a+j+OlPMWr6
         HiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747924702; x=1748529502;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1xKktQ42UkJnkq9jbHipgrEK5NcK05/3GPTCixG9Do=;
        b=iNo0L0+6fjz/DwkxAbX0JBGs9OZkrz0PVUnAcSC5AKV1fwLl2IU3446xWblp9QRGek
         LG5PqmJlMI09s6xAjJOrZXUi8FxuTaH/ZXqGCKEfJ2Jlip0U347+Ls69hDcwNsmLeM3j
         O1EqYp/Ko2N6YBWbwernl56/9Nz1B/sfrxMzEJdQHo2iNwqjXiPZ1PdwUzJnQFmAQBu+
         UaUMgMaijpB5aqWMc2nSOcSQL7jBwozVWpS6k54h8nBMM8KHCvBh7A+skx9nUdBBWcPF
         CNfsD6zSWCtei5US3aiA8yhJ5lI9s9j26cFlKlJPKmt6caVy9T622wV9zKeOk6T1gScV
         Ndyg==
X-Forwarded-Encrypted: i=1; AJvYcCUfEJFomY4Ks9kuGeOpV28OE3L3l0rly+sdWUZSlNqQO5rO1Ge3u/h2Z/O5dJZwQ629xcY+R4a9qjoOTDugM9WStg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8CngzO8mYkU/vv8aUs00/9SXj1xRTXkYU4IEB2TyleSSmafcI
	ZjdcWgtfeQ5azAkV48/IMJmtsfFfQk/51TYMY+3LFOsa10C0e1YXFCcYK4n3a5QlDag=
X-Gm-Gg: ASbGncvL2XMwvLQz+xAN3WfjrSEfiMqalmWphY+sTqDUVym/LefhoWO8fpM8m07OyUb
	dyhflGbgsmgwdp8fLxoCPM5+EBIbHbhcDKbBGvJyF4XnY7jwYZGM0BFPpW53uSuawwR2pRlO8+J
	VsHE+067pG2tbaBNNQfzThRl4ysbab3BAulU1CegL1KiCgO7so0fX1tqBKXWJfFuUfOFDi4Ih15
	ygnE7sh3tqBwRJt0YoWT7sWCDCwj3h5KzmYhyD0ohwjGXLJV/a0Oe0cwLB97wmrui4NtG5wrYpt
	Xcn//aijLbxKBTju6IyZgRHyqYznd5z8Pxc+rkgL0h942zfej+eExzbmFu4=
X-Google-Smtp-Source: AGHT+IEBMGy/caB/YGy4M4swW5helGIU87znZK31jj9gb2P5heCvBRIIdKeIeqDBJ6ZvmzSBH3j+6w==
X-Received: by 2002:a17:907:2d1f:b0:ad2:425c:27ce with SMTP id a640c23a62f3a-ad536b57a4bmr2090211066b.2.1747924701738;
        Thu, 22 May 2025 07:38:21 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4d27e8sm1092538966b.174.2025.05.22.07.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 07:38:20 -0700 (PDT)
Message-ID: <a83317dc-093d-4b7f-b22e-1ccb74ed2350@tuxon.dev>
Date: Thu, 22 May 2025 17:38:19 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] dt-bindings: phy: renesas,usb2-phy: Add
 renesas,sysc-signals
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com, kees@kernel.org,
 gustavoars@kernel.org, biju.das.jz@bp.renesas.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-hardening@vger.kernel.org, john.madieu.xa@bp.renesas.com,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
 <20250521140943.3830195-6-claudiu.beznea.uj@bp.renesas.com>
 <20250522-evasive-unyielding-quoll-dbc9b2@kuoka>
 <b22e7a46-7e35-4840-aae3-a855c97fbde4@tuxon.dev>
 <4a07048a-c55a-4fd3-b4e5-7f9d218de76f@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <4a07048a-c55a-4fd3-b4e5-7f9d218de76f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22.05.2025 15:46, Krzysztof Kozlowski wrote:
> On 22/05/2025 12:26, Claudiu Beznea wrote:
>> Hi, Krzysztof,
>>
>> On 22.05.2025 10:03, Krzysztof Kozlowski wrote:
>>> On Wed, May 21, 2025 at 05:09:36PM GMT, Claudiu wrote:
>>>>  .../bindings/phy/renesas,usb2-phy.yaml        | 22 +++++++++++++++++++
>>>>  1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
>>>> index 12f8d5d8af55..e1e773cba847 100644
>>>> --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
>>>> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
>>>> @@ -86,6 +86,16 @@ properties:
>>>>  
>>>>    dr_mode: true
>>>>  
>>>> +  renesas,sysc-signals:
>>>> +    description: System controller phandle, specifying the register
>>>> +      offset and bitmask associated with a specific system controller signal
>>>
>>> This is 100% redundant information. system controller specifying system
>>> controller signal.
>>>
>>> Drop.
>>>
>>>
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +    items:
>>>> +      - items:
>>>> +          - description: system controller phandle
>>>
>>> What for? Explain the usage. How is ut used by this hardware.
>>
>> OK, I though I've explained in the renesas,sysc-signals description
>> section. I'll adjust it and move it here.
> 
> That description did not explain me at all. I mean really, which parts
> explains the usage by hardware?

OK, I'll detail it.

> 
> 
>>
>>>
>>>> +          - description: register offset associated with a signal
>>>
>>> What signal? That's a phy.
>>
>> Would you like me to specify here exactly the signal name? I tried to made
>> it generic as the system controller provides other signals to other IPs,
>> the intention was to use the same property for other IPs, if any. And kept
>> it generic in the idea it could be used in future, if any, for other
>> signals provided by the system controller to the USB PHY.
> 
> Bindings are not generic, so yes, you must explain here what hardware
> aspect this is relevant to. What signal? Between whom?

OK

> 
>>
>> As explained in the commit description, on the Renesas RZ/G3S SoC, the USB
>> PHY receives a signal from the system controller that need to be
> 
> Interrupt? Some pin changes state? What is a signal? This property is in
> the USB PHY device, not system controller.

It's just a generic signal (a line b/w 2 HW blocks, internal to the SoC)
that need to be controlled before/after power to the USB PHY block was
turned on/off.

The above schema is from cover letter a bit simplified. It details the
relation b/w USB blocks (USB CH0 uses PHY0 from USB PHY, USB CH1, uses PHY1
from USB PHY, SYSC controls and provides the PWRRDY signal that is
connected to the USB PHY):

                                   ┌──────────────────────────────┐
                                   │                              │
                                   │     USB CH0                  │
    ┌──────────────────────────┐   │┌───────────────────────────┐ │
    │                 ┌────────┐   ││host controller registers  │ │
    │                 │        │   ││function controller registers│
    │                 │ PHY0   │◄──┤└───────────────────────────┘ │
    │     USB PHY     │        │   └──────────────────────────────┘
    │                 └────────┘
    │                          │
    │┌──────────────┐ ┌────────┐
    ││USBPHY control│ │        │
    ││  registers   │ │ PHY1   │   ┌──────────────────────────────┐
    │└──────────────┘ │        │◄──┤     USB CH1                  │
    │                 └────────┘   │┌───────────────────────────┐ │
    └─▲────────────────────────┘   ││ host controller registers │ │
      │                            │└───────────────────────────┘ │
      │                            └──────────────────────────────┘
      │
      │
      │PWRRDY
      │
      │
      │
      │
    ┌────┐
    │SYSC│
    └────┘

Setting the bits at address specified by the renesas,sysc-signals allows
the SYSC to assert/de-assert the PWRRDY signal. Any settings on USB PHY
need to be done after this signal was de-asserted. It's like a reset signal
(in previous versions it was modeled as such but it wasn't accepted:
https://lore.kernel.org/all/20240822152801.602318-5-claudiu.beznea.uj@bp.renesas.com/).

I'll detailed in the next version. Do you prefer to have the above diagram
in the schema itself? Or maybe in patch description?

> 
>> de-asserted/asserted when power is turned on/off. This signal, called
>> PWRRDY, is controlled through a specific register in the system controller
>> memory space.
>>
>> With this property the intention is to specify to the USB PHY driver the
>> phandle to the SYSC, register offset within SYSC address space in charge of
> 
> This is obvious from the schema and I asked to drop redundant parts.
> 
>> controlling the USB PWRRDY signal and the bitmask within this register.
> 
> So basically this last piece describes what this hardware needs to do
> with system controller? Change some register?

Yes

> 
>>
>> The PHY driver parse this information and set the signal at proper moments.
>>
>>
>>>
>>>> +          - description: register bitmask associated with a signal
>>>> +
>>>>  if:
>>>>    properties:
>>>>      compatible:
>>>> @@ -117,6 +127,18 @@ allOf:
>>>>        required:
>>>>          - resets
>>>>  
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: renesas,usb2-phy-r9a08g045
>>>> +    then:
>>>> +      required:
>>>> +        - renesas,sysc-signals
>>>
>>> That's ABI break.
>>
>> There is no in kernel device tree users of "renesas,usb2-phy-r9a08g045"
>> compatible. It is introduced in patch 11/12 from this series. With this do
>> you still consider it ABI break?
> 
> Then this patch cannot be split from binding introducing the user. Don't
> add unused/undocumented compatibles.

The initial documentation patch was accepted from previous iterations (from
v1 [1]). At that time we didn't know the full picture above.

Thank you,
Claudiu

[1]
https://lore.kernel.org/all/20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com/

