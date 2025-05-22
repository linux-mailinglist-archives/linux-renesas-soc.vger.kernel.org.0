Return-Path: <linux-renesas-soc+bounces-17364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ED7AC09B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9697D4A5A34
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2082A265CCF;
	Thu, 22 May 2025 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jW3Arjzp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C72914
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 10:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747909581; cv=none; b=VbMj6TXHVS82ZdLO+VRt/WYS9+DapSWBnbC455OvNGUnwPDCPr+aiII6UoiIgBOzktPW/ibwxuxEYQkrC7ATVkppOCmvyOaTdlMW1UiYvCzuvDwtYOg1bOj0BrW9UjVZiRZVWPKKEGOQxTXCPLmfcp9hNaqZx+e5NXtnycNqvDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747909581; c=relaxed/simple;
	bh=ZAibypLz7SpD/NECdINBzP034MLktmjX8S/ADPCEy7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4nkbe/JHlz6B+cUkZV+DgokcCRsTjYI7gPNUQ6aRrfLB5Xi9pm0Z/h7cu/6JBV9rTxQCF0HXYvFo+17W1/vNdC7JPLKkP1qyee9HGe3TyXLj9HKwszW6hM8Vwq1Pq6lc3KevwUooxzx82nQAbrJnQaKZg45Lb63+FHB+vSQY74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jW3Arjzp; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-601a5747638so8686446a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 03:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747909577; x=1748514377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4caaPIV8qSqyjNDB+/IzXFji0RZ7hdRuW08/jzohm/U=;
        b=jW3ArjzptrQceNz0L44mb3vjvznbdkUVUvKlJBQ82Eop59XSzFPO+haSlfwYOfUUjs
         gwrB8uYVnjIsqabm8W4iv/KBjC08ej6IPtc2UohCfHaCKk5VLbHfm1brhzmsP1oKLb4V
         dJHoJV4g5l5lWhJh57NzaTEGHa6OX+U68EDz+cFY/W2FhguT2zJKpCFBYA/i2b/+ut1F
         EPH3g+XuJQKz4S0ka3DpaRea1Gx1ZW967sJlr5tEx5pqGvfCru8jjDUS11EMjf+pvoMR
         gdsccM6126An1LzYV22CuPeSq8rfqxWlfv7lRhyikE8ZYiV5f0J8YNs3SLlFsIMWRaxV
         gG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747909577; x=1748514377;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4caaPIV8qSqyjNDB+/IzXFji0RZ7hdRuW08/jzohm/U=;
        b=YeGRThzyQPwU7xSk0HHmWu/CNzmfcU/DDlGqbjn7SY4L3JDvbWgGi0gXMIabKaEiLa
         KxCwLehTKiCuczmD/jW/ntDLLvHkBu34acW8B/gFPe3y3goXlfucuw3I2vgxR5Bhip/R
         8f+hrniP7Wq7ONoooyLcHTed3xXW36iQV6Km3rt/NxUexrEN5wC2YQvymcR7zFZgofkf
         0FcZXB7VWrKboYvyxgGla3p8394DeuwehsCvvJg0fVazvCcqnpOvAb8t9WQZ5T+j+4V9
         /+B0h6TjLIFbedtQVsbJZtp2AveF31mpD9yM1rrT4Z1RyMiu1rfcg2EN+KUBqwVypALC
         RTcA==
X-Forwarded-Encrypted: i=1; AJvYcCWzN/DnMyKtEh5W1ELChpMBTWwBSogjxTkCySM39eUMQ2AqJX1BfzGSWpzHPFnq1rDEg75nWe927zGicXkZ/gjwOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQxPdF0ghd1RvSdy1wwkvpsJ8Qy3gegKGIIDSyQDKU5b3Wa4Z1
	PV4h0hF8c6CstCC5xxof1Sg7/rVOzEH+XsDrEKt75ziaQU04V1mNEyr9B/nbbD13zJY=
X-Gm-Gg: ASbGncsaWdAUYMR4+UuAZk1y1NxrGohgW2WUVGkG+v93RHNMXwDCYDD0wDchqkHPk4P
	fmwi+FfSg10C9a0VPdDlQNpwuxDkhMXdGf7FVWHAxzD8ro14gwY/duHbbQttau5hFlWRrQd8IPI
	r6SuvnR++juOEbSmOtLu2KVp+7QjG5DGRIDT+/9mh6eo2muUoPIX7G/KsgbE1pLwWekKjwAZut8
	65JZnsSYBuFZEYCI8NY2ej1Fb4GEupzPzVLuwNb/S/8VmSt68YdofRahTS7QPXcDB23pePe8Zdk
	0T1QRWPa/Ef7BlZOa/JkkmtaEPq1dOi1vk7OF5Emr6c1LHNVozrPhM5qaRc=
X-Google-Smtp-Source: AGHT+IFNGKRAQxDRw8YM6Df3ufbn3AseFb7JOrrDRAzOp7oR4YS6S6ab1Ixfj0XButiJTgZDbSswiw==
X-Received: by 2002:a17:907:6eaa:b0:ad2:238e:4a1b with SMTP id a640c23a62f3a-ad52d498e5dmr2363750366b.15.1747909577064;
        Thu, 22 May 2025 03:26:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4cadc5sm1046004466b.167.2025.05.22.03.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 03:26:16 -0700 (PDT)
Message-ID: <b22e7a46-7e35-4840-aae3-a855c97fbde4@tuxon.dev>
Date: Thu, 22 May 2025 13:26:15 +0300
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
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250522-evasive-unyielding-quoll-dbc9b2@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Krzysztof,

On 22.05.2025 10:03, Krzysztof Kozlowski wrote:
> On Wed, May 21, 2025 at 05:09:36PM GMT, Claudiu wrote:
>>  .../bindings/phy/renesas,usb2-phy.yaml        | 22 +++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
>> index 12f8d5d8af55..e1e773cba847 100644
>> --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
>> @@ -86,6 +86,16 @@ properties:
>>  
>>    dr_mode: true
>>  
>> +  renesas,sysc-signals:
>> +    description: System controller phandle, specifying the register
>> +      offset and bitmask associated with a specific system controller signal
> 
> This is 100% redundant information. system controller specifying system
> controller signal.
> 
> Drop.
> 
> 
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: system controller phandle
> 
> What for? Explain the usage. How is ut used by this hardware.

OK, I though I've explained in the renesas,sysc-signals description
section. I'll adjust it and move it here.

> 
>> +          - description: register offset associated with a signal
> 
> What signal? That's a phy.

Would you like me to specify here exactly the signal name? I tried to made
it generic as the system controller provides other signals to other IPs,
the intention was to use the same property for other IPs, if any. And kept
it generic in the idea it could be used in future, if any, for other
signals provided by the system controller to the USB PHY.

As explained in the commit description, on the Renesas RZ/G3S SoC, the USB
PHY receives a signal from the system controller that need to be
de-asserted/asserted when power is turned on/off. This signal, called
PWRRDY, is controlled through a specific register in the system controller
memory space.

With this property the intention is to specify to the USB PHY driver the
phandle to the SYSC, register offset within SYSC address space in charge of
controlling the USB PWRRDY signal and the bitmask within this register.

The PHY driver parse this information and set the signal at proper moments.


> 
>> +          - description: register bitmask associated with a signal
>> +
>>  if:
>>    properties:
>>      compatible:
>> @@ -117,6 +127,18 @@ allOf:
>>        required:
>>          - resets
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: renesas,usb2-phy-r9a08g045
>> +    then:
>> +      required:
>> +        - renesas,sysc-signals
> 
> That's ABI break.

There is no in kernel device tree users of "renesas,usb2-phy-r9a08g045"
compatible. It is introduced in patch 11/12 from this series. With this do
you still consider it ABI break?

Thank you for your review,
Claudiu

