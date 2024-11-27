Return-Path: <linux-renesas-soc+bounces-10742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD4E9DAC53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 18:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C04C116471B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 17:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A845225D6;
	Wed, 27 Nov 2024 17:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JLkdulyq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776CE200BBA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Nov 2024 17:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732728158; cv=none; b=buOj5iKBkZhen2Thlr6VonmnO3/xAHTlIlxkJ3HgQk8fnMo/Js2pGXi4aA6vYIbTzOkNzoGcYUTTqxuy20Cl+rCgAiNILQTiE3fKJgl84VfK/ZEBysYcfmhcWWJe0Vp6rf8RBidv0nycioY/ByQ18hq1pU//sbl4DL9XYUPWVJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732728158; c=relaxed/simple;
	bh=+vUOed904fqCM56GvdT6y2ZFeUnRxD9XR7KdTjK+tA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lsUs4GDfgSNehMRWMsfueZg9HvW12TNjVyjzKam8s7LB/1AlC1gkqIYirpdMQkOdpFhvCpZW70qL6S7g77z+YGX0dR4n1xdZ9maiPW3USt1I/RYb8gpIprkM3ljo74t7L2dGy5SR1AIL24WgjQFJjx3oNPicoMTr3aEc4GDej/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JLkdulyq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a8640763so16383895e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Nov 2024 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732728155; x=1733332955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zos3ZSR+4jZZkxC82FlxJ002wxj7wv8nR00Fq/bmK6A=;
        b=JLkdulyqxb43c14uPF8uuI26xrNrGsYlfXxllhrWCnD1RAhPMGrnv8YdW+0Uvspf5B
         Ftk0/TLpJhYwwT6oQ48h8DEglzYrDyrNGnAvfkgUs6Owg5mpXWVR6y42D3L8BjyprAvU
         xgh6hnA5r0d7gCH/ADoOe9h69Om8aAx8RFGaJpjmyuDL49nZvXtMTQqRNLGozR2DfJX2
         YEiH5+2TYQBI/hMby14P1Wdy7akV3SIAAcON5P0a86ett9HcAUBTazMMblg5fDRSBY1e
         Sz9/uQTRzu7b2dSWJ95bz3iZ4frM7Zoqtd3g+lBI3Rct2+QbXEf87lfYB2+cWkTsVu2Q
         MLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728155; x=1733332955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zos3ZSR+4jZZkxC82FlxJ002wxj7wv8nR00Fq/bmK6A=;
        b=FeWhCEs0HFr6Bb9dhhWGeDUG8djCdyiIx/3EhZ0EI2pINtC+m/oHngf6mY1p0E4ero
         vYgXzh8QJS4beSV8mBasZBM2l1I1zi8j4iRy1afl1Ix5NXZdk8NGpC+DkWg6mrexmjh+
         5Ks4J7jCyNZeURcfVa+nKmBzQI7aTtL9ZU0r7VhhaaFeHSqjrq7nvS3ylSLA+MkL1Zcy
         sTbA7z2g/Gxoi5SCV7G0y6K88u6NQcBmhaaSJxXAURQKxYw0KyNaUUReSX/4pue7q/wn
         k09PA110LIiSRqG4slxawhkDUi5VN3Ka7LERIVyZGiPst+vvztC45QQm4OJ8tkSI6K9A
         ZRWw==
X-Forwarded-Encrypted: i=1; AJvYcCXUKABM2sjhtiiJq2gK8uPJn6QFNtG4lGsXJIvj+35VAB8r65tIrUtJCnAhQMhVt5++I5r4kqs3Yd17zMuzPMDlHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuAglhwBFbjxyRcg1X3EKUnxoD53GCVPk8IMuVZcKjRUNIsSaG
	992ja801kzgF/+0eAPm5VsNeFhycogpbDUxcQwiPYrjR8fTO5dJiGdrAdKnAmeQ=
X-Gm-Gg: ASbGncthnO//oGoNbOkIAAE2mNeXx8AfctdUzamF27ieFwGObymwt8iHDYXTDY0X4bz
	GJIeqKKBdEE+HzfnVa4IF7xHZZjlFidXw1uBVDjMeEiuohPo1wg/uvdeycPyg3uF+lIH8oH4ejm
	HiQXQPHAcCcSpbOVvFIrkeLQb/VQqlUrAZCrl/J2RqYYWZECSm9o9wMO0NGukrcTWVSTdP/ogi+
	L9PDlPlGA+9JANkPSzQOZ7V/Sz/f3SXu18/xxXCNk7/Day9JrVz5yYWCw==
X-Google-Smtp-Source: AGHT+IFFWYbsBo99dq8o9ql/MRkTvADPckRvRFXRTZc5M9tvoTbk1c17SeAXZA4rqQw9msf2bDKKIA==
X-Received: by 2002:a05:600c:1d9d:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-434a9dbf226mr36685565e9.13.1732728153104;
        Wed, 27 Nov 2024 09:22:33 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe3cbsm16741588f8f.38.2024.11.27.09.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 09:22:32 -0800 (PST)
Message-ID: <9bc52590-3f68-423e-8eb6-4a9a06426709@tuxon.dev>
Date: Wed, 27 Nov 2024 19:22:31 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/25] pinctrl: renesas: rzg2l: Add audio clock pins
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com,
 broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org,
 perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-6-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWhBUwWB=8T3TW8osEG+=MaW5bykqZ77V40MVf9GKeCgw@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWhBUwWB=8T3TW8osEG+=MaW5bykqZ77V40MVf9GKeCgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 27.11.2024 16:32, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Nov 13, 2024 at 2:35 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add audio clock pins. These are used by audio IPs as input pins to feed
>> them with audio clocks.
>>
>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - collected tags
> 
> Thanks for the update!
> 
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -2086,6 +2086,8 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
>>                                                       PIN_CFG_SOFT_PS)) },
>>         { "TDO", RZG2L_SINGLE_PIN_PACK(0x1, 1, (PIN_CFG_IOLH_A | PIN_CFG_SOFT_PS)) },
>>         { "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0x6, 0, PIN_CFG_IOLH_A | PIN_CFG_SOFT_PS) },
>> +       { "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x2, 0, PIN_CFG_IEN) },
>> +       { "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x2, 1, PIN_CFG_IEN) },
> 
> I'll move these before WDTOVF_PERROUT# while applying, to preserve
> sort order (by port/pin number).

OK, thank you!

> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v6.14.
> 
>>         { "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0)) },
>>         { "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_B | PIN_CFG_IEN |
>>                                                      PIN_CFG_IO_VMC_SD0)) },
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

