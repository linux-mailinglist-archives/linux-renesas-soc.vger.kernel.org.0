Return-Path: <linux-renesas-soc+bounces-3658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9428775D3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 09:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E63601F22A91
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 08:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EB11EA8A;
	Sun, 10 Mar 2024 08:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VF00FWx/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D71EA71
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Mar 2024 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710059978; cv=none; b=hkZ4yZg5oIR1LjK57KV6O/IXU0gG4RBiNCovQm+tcxXCdx4nivDK1g5q9SDWZiPdQqWUu1dKDb6kcCSeJ57Hvi7tVgatU4H4FqaEndflyGlZ/ZeM6LUQrp6+Rd8Pj1ZWaI+hRwz6g3ykubzEekm3T8WjvlE1HD9w0EaZ6xsGqNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710059978; c=relaxed/simple;
	bh=hV7IG7a9TO3Hx+th7unCGTPRkfOV0VeA2+7hwna2h/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bllA1SuCqA6cOYAFws4izoVZzsLnFFM7MnQ2EaG/kjLNktwUDGgjYoAEoTrFwGUBBIGLcFbw7x2Kb7+z0yMuRK8hXAkhjhD2/HshDVMFkoiHYuwZJCMR/iyourccBOOvTh+8ohkZH9SqawLUKCCbnOFlEM7YvEXJY0mJjAwaayY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VF00FWx/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33e2248948bso2127145f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Mar 2024 00:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710059975; x=1710664775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I9+BywTavDVW+75vEhluhWscYFZyqArmdAzgA4HfNH0=;
        b=VF00FWx/BxMCvmcmto1+W/ksFEwNphaa3Gvk8ajgr+7BIxWAHDs77QWnm/bZkCdRyZ
         xFhT8JyY61eS2DYHeXxtN4stMhRM8WfIryZUCwsRjUimonCu6jsme4984K/mTia4PUA4
         CbGMNFjT/AQ2wgKMaezP7N6VJ83DbcOV78qQ7EXcs7DvEw+6R+im1p0JETpxQSJTMwnJ
         F1wp+dzcyynunR9bW6SKhuNhxeIx7DEyczqeumsRhRwn+DEgTRGBuqk8Q58fxnLDElYW
         9IBTuNeQPdJ6dYZZ8lV4yxDodaSMXAd+j+/8/QcM9ErsINLgk9b7fqkBEp1912RUJDsa
         vN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710059975; x=1710664775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9+BywTavDVW+75vEhluhWscYFZyqArmdAzgA4HfNH0=;
        b=r9ZmOclNhqtxIjiXqq1EC7IaomlqlhXa6EfQZYl2F4WThN4TjD/4kzAiLQ9OWn9LQT
         UOgmdw6KlT/TE7qymCwhDczOC7OZ5JYGuSwbFn0bsM6bIeTTGoDjS0OoXpVK9jUl0iCa
         qGUBiLxXgAvRydey/O2ix63YG27sdITjeTBm6FCVVvpxGQeL5qHoYBIeeHkntGa5WkXQ
         gPd7f7aRbYYoHP22WxwhysltdhUAeXC8c5DFn29Yz8Vn5XU/UmmcOwCPj1+alnEYscDD
         QRy28gAMiCOBidaeBjN3Is/YaVvBluvNHs2qiuxnJjvkrUNmKnd30Lv9bz/bEk5xk+tZ
         B2pw==
X-Forwarded-Encrypted: i=1; AJvYcCVhifumnT29Jf8tJ8uZIiUazRUzfgccEpFoRAPbgEdgVWjEsGenE4mgic2Wewh+qjT1gXpzSEi6SLjviaWUtogBVxhLo4+426FqyPzZfi5d6eo=
X-Gm-Message-State: AOJu0YzyKVog89aM85owOAMuyOjeDwX2W91EZstwPv5pyXb/IfsbclCI
	9rB1xWyEEFNQiltQ4gGa8sBvTSIhKYt3Esi1WQdKIuPnR3KnBJFl696p4yendyg=
X-Google-Smtp-Source: AGHT+IGmhoMOrmrvQWYL0M27tSiAg5qUb/5xyYCWN/R9QxLASq/nmkKGu2uEvEjNYnJM0AGUen1Hiw==
X-Received: by 2002:a05:600c:1daa:b0:413:1784:33c0 with SMTP id p42-20020a05600c1daa00b00413178433c0mr2792180wms.13.1710059975045;
        Sun, 10 Mar 2024 00:39:35 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b00412b4dca795sm5138534wmo.7.2024.03.10.00.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Mar 2024 00:39:34 -0800 (PST)
Message-ID: <5d43aaa3-04ff-4936-a752-7bfb29204eec@linaro.org>
Date: Sun, 10 Mar 2024 09:39:32 +0100
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
 <OSAPR01MB158700437A1D57805BAF349686262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <OSAPR01MB158719BA384CA9E730D051F786252@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <ed77f6a1-70a5-455f-a6d5-34ebfa931279@linaro.org>
 <OSAPR01MB158788EC4F6CFD47406AB9FA86252@OSAPR01MB1587.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <OSAPR01MB158788EC4F6CFD47406AB9FA86252@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/03/2024 09:16, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Sunday, March 10, 2024 8:06 AM
>> Subject: Re: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs family compatible
>>
>> On 10/03/2024 08:57, Biju Das wrote:
>>>>>>> old DTB + old kernel will have 16 pipe buffers old DTB + newer
>>>>>>> kernel will have 9 pipe buffers.
>>>>>>> New DTB + new kernel will have 9 pipe buffer.
>>>>>>
>>>>>> You missed new DTB and old kernel. This breaks all users of DTS.
>>>>>> That's the entire point of your broken generic compatibles which you did not address.
>>>>>
>>>>> As per my knowledge, there is no user in RZ/G2L is using new DTB and old kernel.
>>>>> So, it is safe.
>>>>
>>>> If there is a user for such change, we could use
>>>>
>>>> 	compatible = "renesas,usbhs-r9a07g043",
>>>> 	             "renesas,rzg2l-usbhs",
>>>> 			 "renesas,rza2-usbhs";
>>>>
>>>> Or
>>>>
>>>> 	compatible = "renesas,usbhs-r9a07g043",
>>>> 			 "renesas,rza2-usbhs";
>>>>
>>>>
>>>> The former consumes less memory compared to the later.
>>>>
>>>> As later requires, 3 platform structures for rz/g2l, rz/v2l and
>>>> rz/gul whereas the former requires just 1.
>>>
>>> Another way is using RZ/G2L SoC fallback compatible for both RZ/V2L
>>> and RZ/Five varients
>>>
>>> 	compatible = "renesas,usbhs-r9a07g043",
>>> 	             "renesas, usbhs-r9a07g044",
>>
>> How does it solve anything? Nothing binds to this.
> 
> This will solve all the issues.

That's not really the answer, but I see you plan to keep old fallback.
So this means old fallback is correct and entire patchset does not make
sense.

This is confusing.

Best regards,
Krzysztof


