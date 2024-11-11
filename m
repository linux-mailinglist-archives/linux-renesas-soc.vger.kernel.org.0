Return-Path: <linux-renesas-soc+bounces-10445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 824479C3CD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 12:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B48EB1C2162D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 11:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E92189F54;
	Mon, 11 Nov 2024 11:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RFe5ho+3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4A71553BB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323776; cv=none; b=dX85tkN2GIive8FFeBACLK7bUTXU/RACYCOcDCdjk4MMke8A9eB5pRmnROlHGHa+5OhLKp7UBShygafupJLGN/HB6wVZBwWzE8fJKZ/gSFtPc4FDQLTlXvcPVuve16g/m8K10HmeklYr/DiGALjj14+kxS69DxUdRHajowERkwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323776; c=relaxed/simple;
	bh=driMdGrMh2CQU3EhaccQrwFYyIsDDb/uDW3/8Wb/CZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJ62UyDOJE+8aThvqxcFsjl4YsPwvEfTotIzaGQoPlj8yCywNbgIUlb8uSm3OU9gEuTVgWJ8paFUEpPtAT/YgYL8kPCG512jstlawgfyE+LvsJYwty1b+FiBtaPHpzopFI7CqcWLe+XV9MA5Do2Hwiv5SkUjQG7CKtzXWVT2Eto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RFe5ho+3; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9eb68e0bd1so625209666b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 03:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731323772; x=1731928572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ymcL/BmbTqU8qfDUCoVyraAtY6xWOZahvC7lOWoyBMo=;
        b=RFe5ho+3CKXVrNqbTNxvWa0N7t7htxFN003LZo5VhmJnf/rpIjbJlwJSuSDMCk34HT
         ym6NvcChK8jlHp1xmwcUF/sollyFfXuyI2aJhHO5vgEBTZi+hyUNwOdcer02RyNG95rQ
         zkrnQfHhVFxjO2M50eMNe5imd6UR62YiAbwRBK0XrQgv8cB6LEs+MmUel1rsjcmzVkcQ
         Y6B0DI9cIhuakDYR329jKK8rLZOf3kIZScynlsYNig1wh5C+L5G8WjOoeoRtdiwjhaQt
         MLp9Grht7RMNPitkE3Bf8PUAG2IsbGWZdRu3iNcEPZJTKWGdAM8Jp31KdqX/mrg6mkLi
         2hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323772; x=1731928572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymcL/BmbTqU8qfDUCoVyraAtY6xWOZahvC7lOWoyBMo=;
        b=s4knJ5IYioyypgwrbSjHDSVtZzY/2/CLwfjQch8VDyVL+9sJQF16lFGMURlkEekDbJ
         NIg+DuEO4Rvs9FDz9c0kywxCQcl5w4JUY3i/KA4w//dmrY0MSM8ClnM0uuRBh0C/kbpA
         8i2fUiE6BgPp5gP/ymXF2uLiaYxDugxxWwAuw3+JDkzhJevTfk5pHfGP3ZY1kNVoRKsG
         lax976dU4H6Ro2VZwpz27OeGAbak0yjGi5Zg0Jr71MUlKSTJRjCDj1aCSUYOO7838Xw8
         rH4bqlVNNM7XUYvUFKHZyCgwWw5IRoQ2goIE9j1cG5h8dLtmSBduFXhJrRNDtPctpYNi
         asOw==
X-Forwarded-Encrypted: i=1; AJvYcCUsZOiQ5+DQGKTW6JYZd+1KLREjZ79iD1o/ZAVlfrJ2L+Plwq4b5jRgoXC3rU/Hy4nGENWcddADf51AisJeEKzFVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgyUqrVr8Bcb31lMflo6UBq8cnT/7zRpdkGdNGjPy2DFYyS0UZ
	NJNzTYr9tk836f1c4sFsXMXxXheQjgDq43cRnvuZCEo5Ousbnf+RanAkb8r4JQA=
X-Google-Smtp-Source: AGHT+IEIXXKEeW8AK/XEUpMILAea87VIswegaWQL9LSGa2DctrGMApRhmo53B5f76Sl4Kpl0fHqtKw==
X-Received: by 2002:a17:907:94ca:b0:a99:2ab0:d973 with SMTP id a640c23a62f3a-a9ef001b427mr1296793366b.55.1731323771938;
        Mon, 11 Nov 2024 03:16:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a176cbsm593593066b.23.2024.11.11.03.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 03:16:11 -0800 (PST)
Message-ID: <42c5da73-466e-4238-8862-dbe727d3bf3f@tuxon.dev>
Date: Mon, 11 Nov 2024 13:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/25] ASoC: sh: rz-ssi: Terminate all the DMA
 transactions
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com,
 linus.walleij@linaro.org, perex@perex.cz, tiwai@suse.com,
 p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-7-claudiu.beznea.uj@bp.renesas.com>
 <87ldxqmwdc.wl-kuninori.morimoto.gx@renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <87ldxqmwdc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Kuninori,

On 11.11.2024 02:45, Kuninori Morimoto wrote:
> 
> Hi Claudiu
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> In case of full duplex the 1st closed stream doesn't benefit from the
>> dmaengine_terminate_async(). Call it after the companion stream is
>> closed.
>>
>> Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> (snip)
>>  sound/soc/renesas/rz-ssi.c | 8 ++++++--
> 
> We are now using "renesas" dir, so, you want to use "ASoC: renesas:"
> instead of "ASoC: sh:" in Subject ?

You're right! I'll update it.

Thank you,
Claudiu Beznea


> 
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto

