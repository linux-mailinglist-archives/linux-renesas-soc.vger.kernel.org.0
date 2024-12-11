Return-Path: <linux-renesas-soc+bounces-11214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 108369ECAC6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 11:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DF16169BB4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 10:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7E9211A00;
	Wed, 11 Dec 2024 10:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="e0FEzTWC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229E71EE7BB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733914721; cv=none; b=OBn+wvds4386EdC3kuv0yRuIM1qDRkzHDEuSYSPe+Lw/1pu8qcz1GCuBBIe3rV+AzBidovRQwOl86H5zgktF5ucsgg7BFelGDzGDylvo0E4Hk5DOQ0NIIaZK5ub5u8eiRArlNw2ekhH8y9KZhJEFgc4Nl/atF9etHxL7gzF+2ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733914721; c=relaxed/simple;
	bh=UU7wGIFVwc7A92weIOxTKl0bgrJSaXpATJdbNVhkJ00=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TH7615/8ap0YegnZj/j1sLwmoSumgdjhXmcK+mk2TaymT6VipdG4Tr05ZonZAyANUnoPVQ1Sx45/Nx4uIKQ4wL+R0JGrypPW8rqqYZ4v9eb8WDVyhsJfzsr+ejeKl5mmB226bCY821yrZLv2srb8G3uHeIVQ0KNVsNZk3JvD5gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=e0FEzTWC; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa68b513abcso565729966b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 02:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733914716; x=1734519516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+QMPoA/1y0fWjReWgsjDWnr3AvpUP6I2Hx7jhli3G4=;
        b=e0FEzTWC85gnHD3xzy9r3jF39i8ONEvYyaktEditbhER4XCDi0gBRRvCb0V19QBaDp
         3Xo7BK7QmTiaG9qEbsyK812bCUFpbgw1+Bf9mZo8b1Ugk01QvFeGzXkos4EiA3WvdMdc
         6kIsgdjYMZj6lO4yZ9IPQvQLyCTmdRwu6uL9eYcMWTpW255bX4OGxpAbYJ5pQCsmlpSD
         jvz1HYaVXBmy2hkL/WQyWlTYC2HBrtAeWd0AbD1h2oL2BGrtFq4xCaoWJjI/OQ7BSJBL
         Lf0bFN+vJBxF+ptMDphGyYR9fUTXk1OMbXCXcpHK+UXuaKbFJdZXuxFF/qc38e/kIh1Z
         hKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733914716; x=1734519516;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B+QMPoA/1y0fWjReWgsjDWnr3AvpUP6I2Hx7jhli3G4=;
        b=VQX60fTdjro6UWLIT5q+ai0eeKubvJFals/WOsX5wPoVEGis7sP17WOt5LmeP0H7OI
         UtofI/I/Jivx9FtOS3gCfwF9K3ocoqc8R/fkELTg4UGJbZlUKPl5Wodb8XynByKgg8Zl
         1zSRty3I+bq0+teeoYpHvRVJ8/jyTriybjQo7Ka6N7G0pSEtVSVQJwUJEHCckKKz0TGr
         XSzIZOFN+gj36o4/z3CSUl1QHL6jj6Gy2oSzGBDq7OMpjaoUAL1tvjt+dIeOzt2S97Hz
         PDoKX5pw471I2oVwTfvdPwmqr72sbSpWZkFo2Aic6gabCZnzmV4gm8MmaNSjSsewyz8f
         2QQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyh8Pafq2wO1cG+00faxf2q17PxJvMrkka1SKtxAiEMiLvj45SWifYDuvM6JxYUmPKR7RWe4DEfFsIIAFxtnUbfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ9ozkpPeo/r35qWiWjT/32tX76uoEhtTADOHzfXXblEqx44bX
	5aPIHDItsid9LVGP7jSqZ8qIXUBsZ+OCgy/ub4t59HmL8vGJfUtcmKKNc6RZ5pY=
X-Gm-Gg: ASbGncsJVOeeTuc1FYSPv3LuW8jWS7y1Q97+L0tYx8648w9ZCVmvdwCgEvp6ZyRfgWm
	UysIFsH9mHioIbZarxJ23eSZkUsO2QLnh1UUH4t8w1/nuzYWbEdFB+T8rrhOl9cVWgbsVZArDwk
	lqkj45Tt7Cmnj0Bft2ujD7H+VZedmtkTgxGk8/E4B0SREliOZewYuzWSk3OeKbb6vh/1fZpnDMh
	5Oi/7zqFDEqiv+D4fA7DmgF9+bMrsD/Z+/v2mplC0LIbDrCksp+FfbVE67YXfQ=
X-Google-Smtp-Source: AGHT+IHboENFUeCz1S8YpLyRolieL5N9mA97YUKKuxLi+L7mSNc3bXrTRTxR7tmo3UlKFMHhDNoW8A==
X-Received: by 2002:a17:906:cd2:b0:aa6:730c:acf with SMTP id a640c23a62f3a-aa6b11b2777mr175222066b.13.1733914716389;
        Wed, 11 Dec 2024 02:58:36 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa689a0a6fcsm428156066b.30.2024.12.11.02.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 02:58:35 -0800 (PST)
Message-ID: <e55dab68-fccc-4239-8368-94f942a50218@tuxon.dev>
Date: Wed, 11 Dec 2024 12:58:32 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] arm64: dts: renesas: r9a08g045: Update
 #power-domain-cells = <1>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, magnus.damm@gmail.com, ulf.hansson@linaro.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240422105355.1622177-1-claudiu.beznea.uj@bp.renesas.com>
 <20240422105355.1622177-9-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWhRRdfoqg_o6bU7jjt5_Di0=z7MJ4fMh=MJ0m8=u4tgg@mail.gmail.com>
 <80d56236-2499-4c89-8044-6a271e47515d@tuxon.dev>
 <CAMuHMdXOztsoKp=9-TDXirJN8voRy0O5mYXcVy=Uz-GX0B2N_Q@mail.gmail.com>
 <CAMuHMdXXTRUiToA3r8+xgS0uUrrfOF8iZA58_na0V9+JB6hg6Q@mail.gmail.com>
 <a1b60809-cf72-4d4d-91f4-468a47900ca5@tuxon.dev>
In-Reply-To: <a1b60809-cf72-4d4d-91f4-468a47900ca5@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11.12.2024 12:50, Claudiu Beznea wrote:
> Hi, Geert,
> 
> On 11.12.2024 12:31, Geert Uytterhoeven wrote:
>> Hi Claudiu,
>>
>> On Thu, Aug 1, 2024 at 7:34 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> On Thu, Aug 1, 2024 at 7:28 PM claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>>>> On 01.08.2024 19:13, Geert Uytterhoeven wrote:
>>>>> On Mon, Apr 22, 2024 at 12:54 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> Update CPG #power-domain-cells = <1> and move all the IPs to be part of the
>>>>>> IP specific power domain as the driver has been modified to support
>>>>>> multiple power domains.
>>>>>>
>>>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> Now the watchdog fixes are in v6.11-rc1, I will queue this in
>>>>> renesas-devel for v6.12.
>>>>
>>>> Only the RZ/G3S support has been merged.
>>>>
>>>> The watchdog fixes that allows us to use this patch were submitted as RFC
>>>> but got no input from Ulf, yet.
>>>
>>> Oops, postponing.
>>
>> The watchdog fix is now commit bad201b2ac4e238c ("watchdog: rzg2l_wdt:
>> Power on the watchdog domain in the restart handler") in v6.13-rc2,
>> so it is time to revisit this (and rebase my renesas-dts-for-v6.1
>> branch to v6.13-rc2)?
> 
> In the meantime, we got some input from HW team that particular order might
> need to be followed b/w MSTOP and CPG setup that doesn't align with having

s/CPG/CPG_CLKON_<IP>.CLKx_ON

> MSTOP handled through power domains. There are some contradictions (AFAICT)
> b/w that and the conclusions that one might draw from the HW manual, so we
> are in the process of clarifying.
> 
> For that I would propose to postpone it until further clarifications.
> 
> Thank you,
> Claudiu
> 
>>
>> Thanks!
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>

