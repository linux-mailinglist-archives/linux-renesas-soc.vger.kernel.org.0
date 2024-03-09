Return-Path: <linux-renesas-soc+bounces-3636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1934877161
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 14:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 543ECB20A7D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 13:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EEF3BBE4;
	Sat,  9 Mar 2024 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EAStPMOa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C553F3BBD4
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Mar 2024 13:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709991030; cv=none; b=tNXy6riSk7R01p3/Nh+1EUlCk+qGoKT30vgkyJaUAw6Ek6Xrs5hrLzAVR2ehL2i+/zF1WHz/2oYI1LEsOQpYrF3s6qgj+KqzKkuCuDYYDIlpyU/9Q6VWtotfoNoJi0vMHkWq0k1mQncst/M8fCL92cR2I9gxtJ2bS7WgFeRmqZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709991030; c=relaxed/simple;
	bh=hpTYtSHVtN/vzLg7QKJi3LIKXnrpHbWK6gwtNIxfpyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1aXpoaO8gNj4FmIv13m2Tzfh+ufFAc89ovbjCeK9P1CgWM3arjZWj85m3brTg7NBnBkcGuPoH84rLf9LmBmweLeDZPlMQO9E3RP6r/lB9I1Z3y9M+ez20IPelm7O8PMzVTGiWD20RY8Hs2tfq4pqVSGhvPEt9c3pqzMo5QV850=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EAStPMOa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512b3b04995so2540111e87.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Mar 2024 05:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709991027; x=1710595827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7d8tURN7bnHW6ly3WmFNxh7nOEu4El6eZw0a/wSGB4=;
        b=EAStPMOaoxoyjbltDui9P/DsdO/EUePkkutWqIVnAfs071wgYmDI9Ysv9gxMwwwD1b
         1stG/hsbDBE0T75HdEg8lisGjMpjxTdz1IevMzmYWQ1xP/FCFADa1dITXqfVWfj1ekoJ
         3NwuRePpq9EXAlLiUqNWF//cjXf2LZ38uTRDEa7ma8MrNBPgszxLu1sJ1Keeg4xrVr7Q
         pOMbIrgYogIfarOLm86z0DYKgl3RRc2DBFqnfyIWCf+aFnjV9kyOyo5e18ti2OSHJS/q
         KW0G48sVp4kC2Yb3VEbf6TsimsZf9dhtenHkp66XlLRA3WqxieW0rHN+yZc0RjKxRqac
         Jo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709991027; x=1710595827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7d8tURN7bnHW6ly3WmFNxh7nOEu4El6eZw0a/wSGB4=;
        b=d4Y04B3XLHVV12v+KRzlUJZjfOY78W2Vij2Z/gVEBahva3QeXXg/vCKoRnKBoYTqAd
         lWGs3+9P/1F0RXT1PxSd68yWxmzQyvXhchu8+8Ut7lu0kF2P/MUkw5+BTKF5bZE+tTYP
         de3FAEHOanYH/qmuXL0q7LboLn4aVCxMibHUgGWCNM5N2bpRKBVTXjbNmduQ4qKEtyOc
         +7Tqak533+Ba4snMX51ASCnBKATrYETaoM2hS1mRdCuqWIWhOqztz9XuKo7pczjFU4Ae
         l58eVGEwU1RUXzKPFejy26temQLudXUlBSm5c9TH1GmDiWeTZ0FYUK4f9+b2wQbIt6G0
         XmIA==
X-Forwarded-Encrypted: i=1; AJvYcCX+WrOPjOk+sjVR+Dhrbyk9LyZwaZeq2SCbKY/A/c60wSPnQpaIrnYlSn7UjN6Ww6oMNZKSbpt89zDEH/iLgQ+fPNKOD+T5ZiwxbioVDkEDWiE=
X-Gm-Message-State: AOJu0YzacLfB/esYKjDL6TFrMu9035kp30OKfJqVUjF1E5DCmNBbHb51
	AdYJTbGxmxn4SKmi1Nwigf+6F/xTpsN3cPGQQhcw72Bksb4ZSFwCquC9ygXU5cyKPa6XmXmb7PY
	Y
X-Google-Smtp-Source: AGHT+IEudTtoGW7ofW6Bva2zDxUhoEgeoYTzSiQeHXzpeayRMFjIe4sJ6OCfoqMKI1oT9swpgaGGDg==
X-Received: by 2002:a05:6512:e83:b0:513:3d4d:b7d4 with SMTP id bi3-20020a0565120e8300b005133d4db7d4mr1294091lfb.11.1709991026987;
        Sat, 09 Mar 2024 05:30:26 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id ko1-20020a170906aa0100b00a450c790080sm874546ejb.156.2024.03.09.05.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Mar 2024 05:30:26 -0800 (PST)
Message-ID: <2821f23f-aac1-4b12-ba60-bc60da153d8a@linaro.org>
Date: Sat, 9 Mar 2024 14:30:24 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs
 family compatible
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
 <20240308180919.6603-5-biju.das.jz@bp.renesas.com>
 <67819907-4366-483d-b71b-2646ffb076fd@linaro.org>
 <OSAPR01MB15874E48DD2269C2593DB55A86262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <ff569d52-f68f-410d-9897-9e1102171a1b@linaro.org>
 <OSAPR01MB15874A9DB0CE13AB0440242186262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <OSAPR01MB15874A9DB0CE13AB0440242186262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/03/2024 13:32, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Saturday, March 9, 2024 12:26 PM
>> Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs family compatible
>>
>> On 09/03/2024 13:14, Biju Das wrote:
>>> Hi Krzysztof Kozlowski,
>>>
>>> Thanks for the feedback.
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Saturday, March 9, 2024 12:08 PM
>>>> Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}:
>>>> Update usbhs family compatible
>>>>
>>>> On 08/03/2024 19:09, Biju Das wrote:
>>>>> Replace 'renesas,rza2m-usbhs->renesas,rzg2l-usbhs' as family
>>>>> compatible for RZ/G2L family SOCs as there is a difference in number
>>>>> of pipe buffers compared to RZ/A2M.
>>>>>
>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 2 +-
>>>>> arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 2 +-
>>>>> arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 2 +-
>>>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>>>>> b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>>>>> index 8721f4c9fa0f..766c54b91acc 100644
>>>>> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>>>>> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>>>>> @@ -812,7 +812,7 @@ usb2_phy1: usb-phy@11c70200 {
>>>>>
>>>>>  		hsusb: usb@11c60000 {
>>>>>  			compatible = "renesas,usbhs-r9a07g043",
>>>>> -				     "renesas,rza2-usbhs";
>>>>> +				     "renesas,rzg2l-usbhs";
>>>>
>>>> This looks like ABI break and commit msg is quite vague about it.
>>>
>>> OK, Will update the commit message as driver is taking care of the
>>> backward compatibility.
>>
>> Ah, I was not precise here, you should consider the impact this is on DTB used on other kernels. You
>> guys should really stop using imprecise/incorrect generic fallbacks and, since it is usually tricky to
>> know which fallback is correct or not, you should stop using them at all.
> 
> There will be driver change to handle SoC specific compatible.
> 
> So ,
> 
> old DTB + old kernel will have 16 pipe buffers
> old DTB + newer kernel will have 9 pipe buffers.
> New DTB + new kernel will have 9 pipe buffer.

You missed new DTB and old kernel. This breaks all users of DTS. That's
the entire point of your broken generic compatibles which you did not
address.

Best regards,
Krzysztof


