Return-Path: <linux-renesas-soc+bounces-3715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B1E879294
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 11:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC15F1C21FAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 10:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB0C69D19;
	Tue, 12 Mar 2024 10:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O8xAwA6x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1067867B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710241100; cv=none; b=s6UBVg4zRawa1vdzhq0XXKey18Jo/x36x7Fu2tGYbQ+LJpLlvHZHcRUNy/83H1/uTfOHuEb3KRiR2N960UdPqHLWEuOtPXCEoluTmSY0Z6lwF3cRlVmM2ph+sY2aLSqcYPlJ/gJ6PWtwuETPEVNq3VJBduu83Ix2b4ejDw27K9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710241100; c=relaxed/simple;
	bh=u6UBLG12TsLUYwyzdey4WAgdO+/xG1IV6fiRzxPmsuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKBsaSNZXzZQqz0arulacBUwUJosm0n4rD02ugLk7WmY3Ms9rJvaM+bCyosd09bumprsPnz9uZCqr0xcFRLHkXCYdPl1yZ+HdSQF4fjWUg+HXWJofgvn1bAeLqSsw/b6DcQZ6js06frqOdo3NaYiS+H+DRCgdRbVd+sEWJ58BGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O8xAwA6x; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-513bf5a2555so485167e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 03:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710241097; x=1710845897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gRVR+6aUyXT43N6negjR73pDc0xpJGWR4HUehYRr1eo=;
        b=O8xAwA6xrvCBsLfUHLsXEInbcU+vGFTgjFE+fc331i9W1ZVK+9Vl0h3yKZKrpunWL3
         q/hAgeouSwp8pwKuN1slNpCKEoO5cKzXCW4qdR2evyF20bf4J8vykCohOeFt7jFtHnQh
         3PmSyHjKyc7mNjtW69MbMR1en31IRnTrK5sd4ADP2/dUJ6j0YSOsNm7Ff16VXwW+MzAU
         P86+Jpltybtv0A0jF4PRiWOG6XZKoaQOUmqJcz1jSeT0UkHy8nsYO8NA3wRDQZUcTTOQ
         yXrDbxfE8a/bWpTZRs+y9aaAVH6eNfGeFowtPLb3Gm+DPwloL49I88sqFW3IxwDcohLP
         8tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710241097; x=1710845897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRVR+6aUyXT43N6negjR73pDc0xpJGWR4HUehYRr1eo=;
        b=HHevFgw2m5THUkDmQLKiSonGYubLDkORfTd+5ObmEQJHc+k78PfQzK5fpdBqdDK2YU
         6JTVpRi5ga8AjKoFxTF0EFRX1/tzi7r/3Acs8ADAwhRcevQcDW8AhUN4ZckV2U5nqyk/
         VcdLjpBJI3qzQBAyziVXiH5wfjQxt5Dq8pAtKaTb25IcEXsEJFSEBsAT4a7mkkmngR1+
         buv/0rzF+UPFklB0FTtiLk2cZh8Xk9UHw/zB4mXI4flUvIdvUR62UwvAS2d18gPKAtcB
         35WF/HPL1TnPEsfR/jzSVI/Ia7q8pk9OI3Z3V6m2gRwO2Skb2k4P+jjDV4VbllkRN/2T
         FhZA==
X-Forwarded-Encrypted: i=1; AJvYcCX1Bjfn6nOyTJe8ZypU3fZ6+EAqZ1WIqnkA73ilWrdts/VCLdBjgy49q6mGXbmMvD7wdXXwHQJUogbPsXUPKUTdl8WtKx3N6pOb8HmLJfigmLM=
X-Gm-Message-State: AOJu0YxTTAGvXsjDPNCsaKqz8OCfFUEFL/cYmHojah438Dn8y+Fq8wqA
	y5crx+7LnnX8RS04tXmhGUQCiTPZT5l3jSSdXZPYarQNhbAfEPD+KO68BUoEgT4=
X-Google-Smtp-Source: AGHT+IGcmozAe9BnHyGs4JXLn25wt4vjZdy81Yj7YMetCWT793Dvg/Z+YbTPkXnv7PDLCNpWYXDzLA==
X-Received: by 2002:a19:9104:0:b0:513:bf8a:bd2e with SMTP id t4-20020a199104000000b00513bf8abd2emr885957lfd.17.1710241096816;
        Tue, 12 Mar 2024 03:58:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id p10-20020a05600c1d8a00b0041338ee69f3sm1521678wms.41.2024.03.12.03.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 03:58:16 -0700 (PDT)
Message-ID: <e627dbae-82b4-49ef-8c6e-8ddc989ad10c@linaro.org>
Date: Tue, 12 Mar 2024 11:58:14 +0100
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
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
 <CAMuHMdWezORx9NCdjnj5r4pGdRQX8f6vVkYRFCRUMf7e_bfdrQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMuHMdWezORx9NCdjnj5r4pGdRQX8f6vVkYRFCRUMf7e_bfdrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/03/2024 10:03, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Sat, Mar 9, 2024 at 2:30 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 09/03/2024 13:32, Biju Das wrote:
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> This looks like ABI break and commit msg is quite vague about it.
>>>>>
>>>>> OK, Will update the commit message as driver is taking care of the
>>>>> backward compatibility.
>>>>
>>>> Ah, I was not precise here, you should consider the impact this is on DTB used on other kernels. You
>>>> guys should really stop using imprecise/incorrect generic fallbacks and, since it is usually tricky to
>>>> know which fallback is correct or not, you should stop using them at all.
>>>
>>> There will be driver change to handle SoC specific compatible.
>>>
>>> So ,
>>>
>>> old DTB + old kernel will have 16 pipe buffers
>>> old DTB + newer kernel will have 9 pipe buffers.
>>> New DTB + new kernel will have 9 pipe buffer.
>>
>> You missed new DTB and old kernel. This breaks all users of DTS. That's
>> the entire point of your broken generic compatibles which you did not
>> address.
> 
> Doesn't DT guarantee only forward compatibility?

If by DT you mean DTS, then:
The DTS is exported from kernel since long time and (might be|is used)
in other projects, like recently in U-Boot. Therefore dropping
compatible from DTS, which is used for binding, might affect these 3rd
party projects.

While you are right that we do not guarantee such compatibility, we also
might want to have it.

Best regards,
Krzysztof


