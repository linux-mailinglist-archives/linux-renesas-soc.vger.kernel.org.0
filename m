Return-Path: <linux-renesas-soc+bounces-2318-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9898493C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 07:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D65BC2821F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 06:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA62CBE62;
	Mon,  5 Feb 2024 06:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DDn5VN55"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F8C11184
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Feb 2024 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707113667; cv=none; b=b8HgmDckOb3veIBYd0IQiO6Z0WrY5AjIXkkT9hkYreLAEMkfmaJktXFvSGRFpT0+7pP6/t13R1rHNlWC4aSQuBAtqb3EfB+pRCpJehEKNOIoH+Za6Hv4YomGY5nhrjrkKmb4SWltGIZ4MnMEiHlh7pw6WhpPF6FBWPWJTlTENvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707113667; c=relaxed/simple;
	bh=+p/STyxDPjJDvaoBmR5G/pcONapAVcCcjPa053nv36Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HA9FYGdkDtazO4i8EDPl0qD+kUJVYxUth+UUolHY19tVUGvhmSmoQILsU74wceguuDG8JuBHSa3cCOMIsg0En2P19aDeXy+x7gbdw10R9ZzeCWSwwc7/dd2gwcL4FewupzVfOu+CIB8qAzsLiYZf7OMUQwe72hYlKUbFiOCHnX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DDn5VN55; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40fccd090c2so17470915e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 04 Feb 2024 22:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707113663; x=1707718463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXNjA0jCo0RhVXWoi0/uFUF+3PzRgw5jaCUFs8H5gr8=;
        b=DDn5VN55ShrDpiNtD9Tm68ZzBvA6AQZdXA+05GvLFOdKudEhRlNllDcqOaW8uC0Vqo
         RrkfiyDX+jlHQdqqHJRuos9WLnYMzDCcarcp9C/eFDt1xQEEjw4P2pYe2fME8dBodKSV
         rw0Xdry66fMLXP193HmcRshzTaI5U9rYdCeu7XYPXoBli8eB0KNNX4zmJiPnP++h1DuD
         46qbrOWOPtWzHXFTeeJHD9rluPjzS2qsconDMR4LGMgH6CjF7RtG2QFJL8UKHYC9H5gd
         7oEM2yGo7dk5oo6kQcM8dv2000mAqa8U00O0V1KD12GGN6PpGCfLu4jh0kl38qWr5kek
         1vHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707113663; x=1707718463;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXNjA0jCo0RhVXWoi0/uFUF+3PzRgw5jaCUFs8H5gr8=;
        b=Q9o5Q83/0Folffd29FXHnab7623PRmSKG37fOgEVQ86Ryvq+z6LnDUhMoVRLRjMpRz
         ENPkhQvFyF4aQkBJFwKizUKasp7rcGtOf+fcZdeBunxVsCmfwsHbIxSVV1qmBhs7MBuV
         MlzmfxcdlhAeTp8SdivcE2wxQA/NvWFYmiuurz57bUPqqtqrKRZNDWAElBkb+rMH4Tl2
         sAuSmNI6AagaGjOEAZC8Lr0vGa68oEhSuyECTcZIVq88YahXiCRSbBusd4GoIDGhrp22
         uMiOmtS3XIw+ufpLP6tIhEr4zCz7eHiFjpDESbPP67wtR12WhcKTPTwV/Jn33B2OQu0Q
         yBLQ==
X-Gm-Message-State: AOJu0Ywq5Ke7CjNaBAv+brTvyRWysIyZinTND78s9MyoW3eVh8+cKhRf
	nP/GMs6QBqR+vm2qvngHVvERDrzTIrGhRcDZUZRULpq2PdiXPIiOlp3bfWSivgc=
X-Google-Smtp-Source: AGHT+IEFbZDLfPGLIhwSaOx/UzHmnYO1cy2CXFd42reBwvJ866yaQVjO9qSFVFBHWoo/MB3tJCHTLw==
X-Received: by 2002:a5d:6948:0:b0:33b:228c:da8d with SMTP id r8-20020a5d6948000000b0033b228cda8dmr4970493wrw.24.1707113663123;
        Sun, 04 Feb 2024 22:14:23 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWiu4eKPlxVKS0UsM8dt9UJOJZPEXF+zuP0SOqaJDbxYyWtN+Vs5u6B6kJY4dVYe4byEmNPa0ttUWFrK9Yzii9cdLclbeuCbKFD019QSBfsaQmmMlCZ1TgUuzaRBU/SOFJiGKjBKsPIeYDWYJoa7gXXVVRYTkdcn7jK34uPt+GIuMyBXvp70eRTh0zpvwFsCxgQg19QCsGuAJuRrSwBWs2mFWMm/em71WbdjXgwMMlGJYSFtS+wZAwxwMztEM3k+eR7IC212wSXDezwv1OJDG4s7nKCcIqne0vgT4/KSte2VoYqxdWcde5MmwMFnVzhf5LdOC9fCz3QP05kiXd58EmfrYLEKO//gMiU/OdHfnC8KhmIrjm944Nsx8KQTIl5Xa0PfPaFp0SzdfYqBPgQDY0xFPwDYILZVQ3651u4ptOtVYG7tyA6s/emASZlZth9x1Is7tbJhUPOkCYTkETcDWtqHwKJI620BKD9ryRpykTe/h+FHrgtFOauTMs0+3LOSUOhJwT+8aJpIc8YXAKeojQtVIxjYFIGCDn+rAlP/jwKRz8cQPh0FhXwPSGlbzkyKg==
Received: from [192.168.50.4] ([82.78.167.154])
        by smtp.gmail.com with ESMTPSA id v23-20020adfa1d7000000b0033b37fe0577sm2604930wrv.54.2024.02.04.22.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Feb 2024 22:14:22 -0800 (PST)
Message-ID: <d37b87c6-b4d7-43e8-994a-d7bbddbec319@tuxon.dev>
Date: Mon, 5 Feb 2024 08:14:20 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] dt-bindings: watchdog: renesas,wdt: Document
 RZ/G3S support
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, geert+renesas@glider.be, magnus.damm@gmail.com,
 biju.das.jz@bp.renesas.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240202075849.3422380-1-claudiu.beznea.uj@bp.renesas.com>
 <20240202075849.3422380-9-claudiu.beznea.uj@bp.renesas.com>
 <20240202-bacteria-genre-aeb373023f4b@spud>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240202-bacteria-genre-aeb373023f4b@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02.02.2024 18:40, Conor Dooley wrote:
> On Fri, Feb 02, 2024 at 09:58:49AM +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Document the support for the watchdog IP available on RZ/G3S SoC. The
>> watchdog IP available on RZ/G3S SoC is identical to the one found on
>> RZ/G2L SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>
>> Changes in v3:
>> - re-arranged the tags as my b4 am/shazam placed previously the
>>   Ab, Rb tags before the author's Sob
> 
> What's wrong with that?

Nothing, I was just used to do it this way.

> You resent the patch, so I don't think there's any chain of custody
> issues there.
> 
> Cheers,
> Conor.

