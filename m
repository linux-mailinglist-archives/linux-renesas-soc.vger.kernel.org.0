Return-Path: <linux-renesas-soc+bounces-11086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 947139E8DD6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 09:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 568772815A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 08:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1D9215F4D;
	Mon,  9 Dec 2024 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CnU1vpov"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3A2215715
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Dec 2024 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733734276; cv=none; b=K7j3DI3utRRjlcixdeIn32zmTr19KUEH6aXubltkSSrNitUb7MTI6LmfL64z3kS6/xkDuFI0/cbBr0ScUJWZoVeAN1yi1nXgH+/HOC/DsqQjKw/ULKV2YhgQlJ/QTQr9o19P22LiCofMxdkS9xqNNr2lv42jk9c5NpNNmgdS92Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733734276; c=relaxed/simple;
	bh=3vFC/T8pkufuXOBciI8qpD+8xiXD21BBWbTTY8D6JZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hN6LIphSn4h3TbBSrEnGiW1hJF2pTdLrNP5XGGlOep/k2QpvyBtWToDTGD8Lwpnv88RcSE0pRS1rGX3eZTdG3VxgbJ0uatr+go7bxX+wDjdG1SK57IzPLQA0tydEa0LWrDhWafaMq155V7JyE6J2OH9W8SpN67iP8FXK9VWGWRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CnU1vpov; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa6413fc7c5so339329566b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Dec 2024 00:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733734272; x=1734339072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9Hc3xjrHfup8nIdLq37wXKGA2i5zetjweZEAd4L3ro=;
        b=CnU1vpov7xBbpEGwTJbU8CkxZi8+sm7IyAmZZQN2YcGWHEm1U9S2bMMfCy3ctyIhiZ
         VEGsKfDeeBFnapxVW7Uf9Vg4qtOB+YS87uyb2BrY5gSjtH2+HLc4LuWxXSRwt7corkTc
         hkRLdKdT3jmd3p4eeQZhL4xIqrow4K8qZnK26LR0HpfOranSlXR0XssI+NDjtdtzAzkK
         Ci2dmwShiwTea/4iwUUb24823K2RUKJMhd08+Yavy/g5/RI/JHRB2mr46PgQR9UwaXgw
         0SPDn8uzdhWY+6a3e6k6ni6Gstw1nVDmlEusA433fE1DuEjg76Zw2rAUUuvlJsDJLNlG
         t8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733734272; x=1734339072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9Hc3xjrHfup8nIdLq37wXKGA2i5zetjweZEAd4L3ro=;
        b=wQz+nkqvzr7Fsf6CaXiqzcMoGc/hoyKmRZzS2bkbnqPQHNc2Wt3SqKd1F6qLeIjMNT
         V2UGClXIa1sMpIFOhfubQGQouPPs91R/DXE5n/GQHEHpsrOF4vWAZ4caF5mCPwfXFr7o
         FqZaIbJMwD0Nihc8wlOqp6js7RWgeq1GBOH3lAo1O/rSL6ObfLGrRC9Ho2yMjUV7p6F8
         JUksAK8aW3wTY1GoqFxdJoRpM+WPTeEDiHia5NvsQrC7zPiB+60isD6kXAuZNonHvJH0
         FJgDQmWy5lEXb6cp7wC5N912mpyBx+YypuzCt3DJmi+K7HL+4pInk42FVQVAiNdQEsAX
         OWdA==
X-Forwarded-Encrypted: i=1; AJvYcCV0zdfjdo5lMradk2yFpNJntnWCCtSoPPx33QSd8+9U1Q+RcP2Cw8wFR90tJlCojIdfA2VmDgriD07pFPxBohiIVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy16rEayIm6KQKONdQ6ucZ6FQvAaFqWynasssMlHLd5JJJ0UxqE
	iqKaKFg7IuZoXl7lQwDnEI8fYdITpWK88k3GaHh1/BphVgw6ixv2myuNT+lsF5U=
X-Gm-Gg: ASbGncthD/Sr1YAnRs9WlfcFdAGnBDmOTIW24qWzVMA3FI3BWnmHvN2g4SXZDsaXT1F
	UTbiKMgnX2R04lwjW1WvonScyEYnPmnvml1WCQT5eUrhuuntkOmjZ8liqQfYnHv75UvHjftZeG4
	GDOjBepFcCZE7/H9NCrAlACwdGWL3HCxOzgwcxcWGNJnoTa1/fv+gAzlHL8oHCBK53fTl1zGiHK
	rCgZ+RJuGalO8OsuqqO6eoHoJsGQ9+tHEqU4sA4RvEIndT+gQhRu1eLsODvH/Y=
X-Google-Smtp-Source: AGHT+IGTTSAOMWti4zwyd2JGUoVCQStjHBohMUQcMUwJfOa0IHr7CHbtGAw0XbsqZPj/g1XSSxcatA==
X-Received: by 2002:a05:6402:1d55:b0:5d0:ea4f:972f with SMTP id 4fb4d7f45d1cf-5d3be68007emr30680021a12.8.1733734272022;
        Mon, 09 Dec 2024 00:51:12 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d76f3892sm3614673a12.28.2024.12.09.00.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 00:51:11 -0800 (PST)
Message-ID: <7857083f-e138-48f2-ab86-abb80173cc24@tuxon.dev>
Date: Mon, 9 Dec 2024 10:51:09 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] iio: adc: rzg2l_adc: Add support for Renesas
 RZ/G3S
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, lars@metafoo.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
 <20241206111337.726244-14-claudiu.beznea.uj@bp.renesas.com>
 <20241207183423.4af1f988@jic23-huawei>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241207183423.4af1f988@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Jonathan,

On 07.12.2024 20:34, Jonathan Cameron wrote:
> On Fri,  6 Dec 2024 13:13:35 +0200
> Claudiu <claudiu.beznea@tuxon.dev> wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add ADC support for the Renesas RZ/G3S SoC. The key features of this IP
>> include:
>> - 9 channels, with one dedicated to reading the temperature reported by the
>>   Thermal Sensor Unit (TSU)
>> - A different default ADCMP value, which is written to the ADM3 register.
>> - Different default sampling rates
>> - ADM3.ADSMP field is 8 bits wide
>> - ADINT.INTEN field is 11 bits wide
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Hi Claudiu
> 
> As my comments were all minor stuff, I have applied this.
> However they were the sort of minor changes that result in lots of
> fuzz and hand editing when applying so please check the result.
> Applied to the testing branch of iio.git.

I checked and tested testing branch at iio.git. Everything is good.

Thank you for taking care of this,
Claudiu


> 
> Thanks,
> 
> Jonathan

