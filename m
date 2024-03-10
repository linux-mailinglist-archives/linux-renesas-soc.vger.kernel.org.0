Return-Path: <linux-renesas-soc+bounces-3655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316988775B7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 09:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A55D0B2142A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 08:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6480A11CA9;
	Sun, 10 Mar 2024 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CRc1Ue76"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C071DFD2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Mar 2024 08:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710057978; cv=none; b=k4U7J+xQ99fLRuMrzOoAzOapztbPBAUi8MRBoCWttytA3bUbTKeLgXFiWGyjew+m2Xo62cdM7mEu76v0RnaujHF7CZ3RvNBtdmZ3ULmsOwrFcfFcPkJ/zth/pWnTFXzc6yd5qgxlzTwpE3JexUkaI3avk6Dcl/KNOE3q1GoP/Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710057978; c=relaxed/simple;
	bh=YviNjC4rlbgFeqQhtPPzuiEtOgKFl0bcwADAcNkJyZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKoC83GZYJufNb5eeAR9E6Q3lqhZm4lKqjAMJkDZXPubCUYTXwPKtPQOxj4c0poTPA5xg+ywQ/ygQ9ig0eg0aerk1njxhSF7JDvbx1G/8dvZNWj5A8xH8KMzDsAlI6714i480CXKP8OK9JDx+tKfEQ/h6nXgHiInSnyF+yKgiWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CRc1Ue76; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d094bc2244so50352911fa.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Mar 2024 00:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710057974; x=1710662774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ri6wAYmPsCxBEtXahbDDZVJ8dLOoYr7Bl7jfY9m7Z6s=;
        b=CRc1Ue76WELFMqkReBasbYOd88l6eRsUAoK02da/qum3rdHNPl/6UR3RPyNx2jFZSW
         ekUvmIwt7DP6H4IDiRONd50SroU3qgoYGZnM/JeAnbF/1vwsBlOJSs80q7GNgaitfZUu
         i+/DTc/FT8uDvxQSmRsi5EBQsHuD6t3wQb0dy30Fqgz2R9Xn6xj9aotnYUf57l8sKZ5z
         I0KMJVBHua6JTTAgQe/jQne4+kbaq1lO5CvRB0BWi1ada471G5czMm1h7xXOMuwJaDEQ
         5+3T6TRot1kW0YZXolDPRwuYWZg2hsgczjAV9nQhyJxwtoTkmoo/7h8MYvcjZvQPomOQ
         nAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710057974; x=1710662774;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri6wAYmPsCxBEtXahbDDZVJ8dLOoYr7Bl7jfY9m7Z6s=;
        b=uR6LSziyoNz9QXvWvEebBbDy6PGjbRZ+WejB5pghFDGuZAfsw/KZoPTREwm8aV6//f
         krJKzKJedpjFi9ckH5WuoyCOicetitOKhmdZitr1tl3/ghbiukg3ovT706GwA30A+HJo
         Y23ijMmNNFRq6dAkz/berY7ruqIUzcEW9+nPnNGbjGE7w2ha9y0dbbuqRp0tNHB8y5RR
         f4IVEpf48NtuIMhjXhBKebMTOi47QqK7t/ot3HEwEk6yo1kNF3dJl95ozPS76+5iSR5O
         256X62BiI1NCeR7FeD2finY2j1GJfPrpAwrbEvUhS4w7NZt06Wto2IMxvQqH+Qx6EJmW
         MWNw==
X-Forwarded-Encrypted: i=1; AJvYcCWhzpJsZES9aIVFYp586YRo9Kr4yxvolvKT8DcyFL4h4W/Z3hHDo9BjG6Z4PQQQsRMe7aGPIpaGGiNUabr7nBzDmvg3P0zsA7P2bbNHhqDWnSo=
X-Gm-Message-State: AOJu0Yz+WH29IzScBL8q32kB0haSgOhAkWK6wBaXtkQoT7TaCUpX/G96
	lgnXIbfVCEaxQYEp+9OIYh7s975KmugHGVV/TShF/aytIjywit33V9+534OfP3c=
X-Google-Smtp-Source: AGHT+IF2MHa6Ke34aYB8TAKjplsnBzP6H2kD9YaZ9vgKjsyQw+s3LuSAFQd1b+817X9YivfTsTH82g==
X-Received: by 2002:ac2:4288:0:b0:512:da6d:23aa with SMTP id m8-20020ac24288000000b00512da6d23aamr2276077lfh.67.1710057974508;
        Sun, 10 Mar 2024 00:06:14 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id be6-20020a05600c1e8600b00412f6c695d1sm5045805wmb.43.2024.03.10.00.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Mar 2024 00:06:13 -0800 (PST)
Message-ID: <ed77f6a1-70a5-455f-a6d5-34ebfa931279@linaro.org>
Date: Sun, 10 Mar 2024 09:06:12 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <OSAPR01MB158719BA384CA9E730D051F786252@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/03/2024 08:57, Biju Das wrote:
>>>>> old DTB + old kernel will have 16 pipe buffers old DTB + newer
>>>>> kernel will have 9 pipe buffers.
>>>>> New DTB + new kernel will have 9 pipe buffer.
>>>>
>>>> You missed new DTB and old kernel. This breaks all users of DTS.
>>>> That's the entire point of your broken generic compatibles which you did not address.
>>>
>>> As per my knowledge, there is no user in RZ/G2L is using new DTB and old kernel.
>>> So, it is safe.
>>
>> If there is a user for such change, we could use
>>
>> 	compatible = "renesas,usbhs-r9a07g043",
>> 	             "renesas,rzg2l-usbhs",
>> 			 "renesas,rza2-usbhs";
>>
>> Or
>>
>> 	compatible = "renesas,usbhs-r9a07g043",
>> 			 "renesas,rza2-usbhs";
>>
>>
>> The former consumes less memory compared to the later.
>>
>> As later requires, 3 platform structures for rz/g2l, rz/v2l and rz/gul whereas the former requires just
>> 1.
> 
> Another way is using RZ/G2L SoC fallback compatible for both RZ/V2L and RZ/Five varients
> 
> 	compatible = "renesas,usbhs-r9a07g043",
> 	             "renesas, usbhs-r9a07g044",

How does it solve anything? Nothing binds to this.

> 			 "renesas,rza2-usbhs";
> 
> This will fit into all ABI combinations with optimized memory usage in driver related to platform structure.
> 
> old DTB + old kernel will have 16 pipe buffers
> old DTB + new kernel will have 9 pipe buffers
> New DTB + old kernel will have 16 pipe buffers
> New DTB + new kernel will have 9 pipe buffers

Maybe just drop incorrect generic compatibles since you are breaking
users? You did not provide any rationale against my arguments.

Best regards,
Krzysztof


