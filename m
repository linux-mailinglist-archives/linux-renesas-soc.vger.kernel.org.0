Return-Path: <linux-renesas-soc+bounces-3653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F98775AF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 09:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A7E8282DD1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 08:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDBE1171C;
	Sun, 10 Mar 2024 08:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+dBkbMq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FB92566
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Mar 2024 08:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710057841; cv=none; b=TslNB+WU8At2YWDLh8nSZJH0/NZfHYuO3HCglRTaFqdtab7Mc6/Ve5+AE9RtWSAnOEDz8qJ6vInMA5qsszoXGCFqUCXuCqjGGZFz9bWgTrL0xn7lo7dBpmAdr1EopacS69EfNrrFyaeDbLPUj1HqLj3pORkEDntupaSpeHZttmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710057841; c=relaxed/simple;
	bh=b/5x30941Si9WGrisieIU/Tr3340nJrtNAJKeQDxhE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0Ocdfgld/qYgHaPmbumPHiy3gPYKpmfSYCqsk7mio6wko1MDeDsy8Kq/QbOjEbIr9NU1K7C/YP6aBrVU5Gmi5hiQ36Viw2wCf0143O+yYVDnSrS39zjDGUoGWNPKBKL1hbXxRJgDPl6gXiScYBh6BX4u+3W3w9m/Wa5NdoybQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+dBkbMq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-413161dae46so17812285e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Mar 2024 00:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710057837; x=1710662637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MIzZj+yLmViWbI2cf5jDtYc8ZmqiawaqDPZ71X1W6O8=;
        b=h+dBkbMq1LfSVrgYcpDrmxgtK7aZLmGsZTABNe6kVndexetZCdWIJambRSLIxwYwuU
         6V47HeFs1qsoqBNSNINnI+WlPDvEUSl1FWfhuUGlPoHr+3dBEi47FqWNFejrZXQnmdPA
         VNEERZPJRdpYXIH7W0NudvdgrV1saNRfgVDvig/98lxyLKU6we8V+SV0Es/LRijxF9WT
         Ix3E9wsfLDRsPmkKyXgOJw8JFQpjZqGbtwtIN3lR0hAvxnIDUVRFz2BegMF3nVNyrNkV
         qJBPqTJjWLhaNTtv7LJKtJcUrRM75eY+M4iiYq1lR1fDo1krb8to7rBGVMtfev62jc5S
         SoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710057837; x=1710662637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MIzZj+yLmViWbI2cf5jDtYc8ZmqiawaqDPZ71X1W6O8=;
        b=Adu0wnaovqMxkeHgw5f1VPnzaZ7S+OZEjlppwpo26/lkH1TVFVhW/O8KdDjip29Hc1
         6wOdDtFUbc+hxxabBrVgAX7zLuzNejBldV3CRrpbW3z29XyYVoWOHiYoUwdjcMw0iCW1
         3ElDfZW18LfBM8ANI3h5fiUFmN3C8MFHyChzq6bTLM2qdSlFBjS6/ot0L7buAZy8qY0k
         9qy/HMkaQ8WoHAwR27j3JLABlYAbSLq0eO+V5OKkEIgX2z8X+CK84XkFFbQ5Ba8+PTWz
         TV8BJqszL+N8SepN+/wvCpsJS3eJXxao+3NjUAr+uLAseKKfVLZGlpXe31SkpU7qvRuy
         i53g==
X-Forwarded-Encrypted: i=1; AJvYcCVxcF2zweePligJflQQCHD07Q4T2Ww8meF9jazP7aPFIhV68WHfBdA7hpuGJOX1xLqyozO5EpZzdeLAk/B/mbZnLuptbnMcb0P8l0nK1I4TTZ0=
X-Gm-Message-State: AOJu0YzAvyLj/SwTAwJ+gDGI8iDsJvR9yy/Hcx9rypmvEsCG06IOMjE/
	OcLRsssKNbVR4hyQgOSb6186fAL3WN37duqt3t4HWKSUVPo72qI0jXklUGlb7Po=
X-Google-Smtp-Source: AGHT+IG1GG/Lc3OQ6yFwB/cVS3gncB44YkjbBSOLfBMIvngHgP9qsHlG8//49qQycj+dnal+k/mXBQ==
X-Received: by 2002:a05:600c:1d87:b0:412:e244:26fd with SMTP id p7-20020a05600c1d8700b00412e24426fdmr2574708wms.16.1710057837469;
        Sun, 10 Mar 2024 00:03:57 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id g13-20020adfe40d000000b0033e756ed840sm3483724wrm.47.2024.03.10.00.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Mar 2024 00:03:56 -0800 (PST)
Message-ID: <ee9c35cf-2ea9-4430-8f20-ce7e6363c6f5@linaro.org>
Date: Sun, 10 Mar 2024 09:03:55 +0100
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
 <2821f23f-aac1-4b12-ba60-bc60da153d8a@linaro.org>
 <OSAPR01MB1587C505F324B11824AB6AB286262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <OSAPR01MB1587C505F324B11824AB6AB286262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/03/2024 16:43, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Saturday, March 9, 2024 1:30 PM
>> Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs family compatible
>>
>> On 09/03/2024 13:32, Biju Das wrote:
>>> Hi Krzysztof Kozlowski,
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Saturday, March 9, 2024 12:26 PM
>>>> Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}:
>>>> Update usbhs family compatible
>>>>
>>>> On 09/03/2024 13:14, Biju Das wrote:
>>>>> Hi Krzysztof Kozlowski,
>>>>>
>>>>> Thanks for the feedback.
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Sent: Saturday, March 9, 2024 12:08 PM
>>>>>> Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}:
>>>>>> Update usbhs family compatible
>>>>>>
>>>>>> On 08/03/2024 19:09, Biju Das wrote:
>>>>>>> Replace 'renesas,rza2m-usbhs->renesas,rzg2l-usbhs' as family
>>>>>>> compatible for RZ/G2L family SOCs as there is a difference in
>>>>>>> number of pipe buffers compared to RZ/A2M.
>>>>>>>
>>>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>>> ---
>>>>>>>  arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 2 +-
>>>>>>> arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 2 +-
>>>>>>> arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 2 +-
>>>>>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>>>>>>> b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>>>>>>> index 8721f4c9fa0f..766c54b91acc 100644
>>>>>>> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>>>>>>> @@ -812,7 +812,7 @@ usb2_phy1: usb-phy@11c70200 {
>>>>>>>
>>>>>>>  		hsusb: usb@11c60000 {
>>>>>>>  			compatible = "renesas,usbhs-r9a07g043",
>>>>>>> -				     "renesas,rza2-usbhs";
>>>>>>> +				     "renesas,rzg2l-usbhs";
>>>>>>
>>>>>> This looks like ABI break and commit msg is quite vague about it.
>>>>>
>>>>> OK, Will update the commit message as driver is taking care of the
>>>>> backward compatibility.
>>>>
>>>> Ah, I was not precise here, you should consider the impact this is on
>>>> DTB used on other kernels. You guys should really stop using
>>>> imprecise/incorrect generic fallbacks and, since it is usually tricky to know which fallback is
>> correct or not, you should stop using them at all.
>>>
>>> There will be driver change to handle SoC specific compatible.
>>>
>>> So ,
>>>
>>> old DTB + old kernel will have 16 pipe buffers old DTB + newer kernel
>>> will have 9 pipe buffers.
>>> New DTB + new kernel will have 9 pipe buffer.
>>
>> You missed new DTB and old kernel. This breaks all users of DTS. That's the entire point of your broken
>> generic compatibles which you did not address.
> 
> As per my knowledge, there is no user in RZ/G2L is using new DTB and old kernel.
> So, it is safe.

What do you mean? There can be hundreds of users like this, every
company could fork the kernel but use exported DTS. Or every other
open-source project using exported/packaged DTS repo.

Best regards,
Krzysztof


