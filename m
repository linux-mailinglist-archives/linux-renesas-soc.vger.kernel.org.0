Return-Path: <linux-renesas-soc+bounces-17385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35938AC0E7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AAA51BC7B99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B2428CF60;
	Thu, 22 May 2025 14:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QCvAumpQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8623328C84C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 14:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924794; cv=none; b=oOImiokzew0U5pWdCVhxweBzlZOhNwHWgGwMz82su+C4tW4ZZV87ooX2KLGfe7g9d9e/6HHds/QRPNrDiVF91GMWQxjM6rGUV3Mclixoc5rWUmianDATKnx3o16Z1kY3J6aK3JzHGf1tmtnekuE2kC34Zzp87KtGccAVFiP8vp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924794; c=relaxed/simple;
	bh=YKlbXnURs97TmbTpjUezNbI938aiKGi/vqj82PNrfgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1JTBUyvVYlzxAT3QrNcs+kuM9M7uSIKEUOpSVFUVDT9PAxgVVJ9qYlZSNt7FKHlC2UGBK2X9mqYV2ghsoh8ArK4mbo/xBZ1XXAxyGdvYqX5rNZlXmZvoT0xlCUTtQMaqhZ/kiDd4zM/hUmdFplmr6S0eqsCs8rnsWGDpTo1EQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QCvAumpQ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-601956fa3beso9278653a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747924791; x=1748529591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5dUW3XcT56QSO6IzrjYqsZTqvCBor25DIllhfgnMqf8=;
        b=QCvAumpQmugaw0sbSIj8flMl4Rjm4dyNn71jU06GSadnbIFiluK9vVU1TkWoVf+MM7
         CYLILaNBEi8emIR3xNY6MN/CKcpuGpa549RPt83W0qQLaYSFiVlfZ12vt3i7Selu1Cqy
         fixKIP2nVTwQkLC1hg/vwgQMjat2mBbN3O1EWHvzpMQPWpqg0C6NPVRcARO6g4XuldHs
         a6cjWspkl2+reFmJKmkCkVh945GqIv3HZAMdztT1taodPCzSqOtkrNVBq/JV2YjhcYVu
         uz8BbByVeP+GsJEBQ/HVjBcCnQS2bwkIWr62sXDq3miABZtUMGRiXso7KK54e+2ejKpU
         hUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747924791; x=1748529591;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dUW3XcT56QSO6IzrjYqsZTqvCBor25DIllhfgnMqf8=;
        b=wO+lMYyeU9liPykF50E2akjaHJlMutsKVTTHTEmS0PTNRZA6WIPGXZPnPrsUefnpFI
         cpxr8SPcPkw2daaGsSBXlWG62sEpVGJmb5R09tY7IvA1KD4YasPX3MhB/AWqY1wYNNve
         rwHp43CUXCS1Fi9Q2CBv6rkAIB2YecNjVvhYRI7TKS9f/H3WhkxRmV1MsXKXKvFQpzNq
         mYjG6nhPJVE/oXsqcXb7KWlrFZl04J4aQ0AclU7wMRLkxqZ0zgvghkd34PEJKH4DGpSy
         BwzaWRbALbLzY5ltRQI6GZ5M7dboVRu3AKB2weDZaz3bL9/pypzvyLB0mcQbWmF5HQfK
         DR1A==
X-Forwarded-Encrypted: i=1; AJvYcCV/k7MKUlEXvkqAWORIsoU9PlEDJ/a4aPX7zj0SVhIyJw/ap4T4IdAwLDCXowbykJih/K2TdX0VNlnuoPRGBScn+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9NP7DYPuFbo2rC6gB3BefntGtktD8b0Tu2T3dA2zhnY+oc6U3
	c8mWTDstXTXhXf3HPngXo80jWP/HpbN7FHnyvv7+di8FZKcV+TQp/3SGVTWprAfukls=
X-Gm-Gg: ASbGncvFx9cucSz+9jf6wclL6VodlYzFTYsrn16+aiW6xhfRzmrcG4nd5B5wua7unf9
	yQooeepFomqMlcdqsgfFL3rx3lw3RIh9Y3MXl/YCW0zHvTBb1KDAQuCYAbGxpqeni/o+IedsP7/
	3AW3qYm2V8Ta5b0vms8qOBkqNrnwTt0Qu8cr78dowppyMoUP0FKgHzRjhBHoTqsCUTA+Bdip4bF
	4U6WGmGPSpo6q3Oa29g7EXikS41NN8b3xEGMmNDYj54Yk+ipAQWbtVPLnKFOltUaaD2PEZRqLbE
	JMcaklC0xQSialAIstjzVvUAUJ4W3/8CxizmAx+WpW+hVOFtrxuwcOppk8o=
X-Google-Smtp-Source: AGHT+IE/RdKTMZdYx9F6yx1Kzprvz+cSKkMQRkLYiOsz7mEXFrIWg/Hdk4IKesUgJcilzgg+XPJrLQ==
X-Received: by 2002:a05:6402:34c8:b0:602:4405:777b with SMTP id 4fb4d7f45d1cf-602440578f8mr5149377a12.24.1747924790721;
        Thu, 22 May 2025 07:39:50 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d4f1c7esm10543212a12.14.2025.05.22.07.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 07:39:50 -0700 (PDT)
Message-ID: <797611e1-3786-45c4-9103-3ee8f96cec6d@tuxon.dev>
Date: Thu, 22 May 2025 17:39:47 +0300
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
 <68d83aaf-280a-4c19-becf-c6e1d9c2432b@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <68d83aaf-280a-4c19-becf-c6e1d9c2432b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22.05.2025 15:48, Krzysztof Kozlowski wrote:
> On 22/05/2025 14:46, Krzysztof Kozlowski wrote:
>>>>>  
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            const: renesas,usb2-phy-r9a08g045
>>>>> +    then:
>>>>> +      required:
>>>>> +        - renesas,sysc-signals
>>>>
>>>> That's ABI break.
>>>
>>> There is no in kernel device tree users of "renesas,usb2-phy-r9a08g045"
>>> compatible. It is introduced in patch 11/12 from this series. With this do
>>> you still consider it ABI break?
>>
>> Then this patch cannot be split from binding introducing the user. Don't
>> add unused/undocumented compatibles.
>>
> Or you meant DTS?

Yes, I meant in tree DTS.

> I asked about ABI which is not about in-kernel users.
> You can always change in-kernel users, so what would be any point of a
> binding and its ABI?
> 
> Best regards,
> Krzysztof


