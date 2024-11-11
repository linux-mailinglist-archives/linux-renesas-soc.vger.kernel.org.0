Return-Path: <linux-renesas-soc+bounces-10444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E0F9C3CC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 12:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FD9F1C2179C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Nov 2024 11:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0166189BB9;
	Mon, 11 Nov 2024 11:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OnwcAa7i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EB315B0EC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323740; cv=none; b=W30qKOCsvGV9HZYGikvmhstekxKV5e7LI/fzTO9jbI6sKU0PCagqcWk1X/E4rNx1Is8efChuyuYM7hU9dYdsYmX96HQ46ReSif7nbQG77b3vYzGDFGrOYSAOkTZE3gWc6mil4fotcIHFssemUh9eYcNRTaszsjQdlVRxdVXnyZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323740; c=relaxed/simple;
	bh=UVMY3jncP8KlbJgHSOQbnrh0HSPCD2duUy36Ssl4JeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Om55O6zpg6JOSox5jJAJArIgNgy455zwz+ULKLjFbtNVLtIQkfxrVlC1OWZ/5a4Pn99P+AvkwoGx7ysazCl9ohJCQTAN7TBSkauOAPys6SyBHvn0Lfh7+g6wEHaHnBC6B0ZNC9j9UhpM6rTBEEL52S/fk5jGMm3RC3HjztTiRqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OnwcAa7i; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so766620566b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Nov 2024 03:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731323737; x=1731928537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bhZZuPjatSrdZhX9k+zXeie/9aFPE96IB3h2Z1yS2Hc=;
        b=OnwcAa7iFccdMPXmNNfuo+XSwSVwwhr08r0lXMAp/OEFWu00qv7wHWnONDdCu/5q7C
         W+/EI+WP3Z4aGv/Ppvei6+w6/cbz/ivJ1SatoGSfcVKgMOCcmzaLKkwV1G11XNH6ap7P
         4csA/TfJeSCCpI9ss7PEYectSu1/wz3ulgSj62rdCy3uN3X/rG3ip6lo302p20aszzWf
         J7j5szIPJqSllJjvLBWecWqsy9XqeDSJLTBldqwznATzvsQT9vUSJGUcbQ6+bY4if8Y4
         HOBtESNHHgYU2Ok3fGARnCPQDliwu771U7Z11sWnW0I+BBPQ1Gd6PZSkb3JN8n72IqO/
         AXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323737; x=1731928537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhZZuPjatSrdZhX9k+zXeie/9aFPE96IB3h2Z1yS2Hc=;
        b=mK6cAZgsR13TUfaYgrA/KfhwCauPV5Y/U1ByaffHLRQr/DhfbxnC//km4UewWOtKV8
         ZjoGZQnTqt3c8Mwb3TqrQYtUIPxAfOZRgypKImaFUu5AbmoX0KpvdL2aAxHqpauVz1eb
         bgtBJGQBW+5ggeeC2PVrMpgQdgVBhDUKsIckPFN5ZKNUn7ezctCkDIvGolNx1eGVstwn
         yJCfBOxkAfoqAi3bQ+tlPJ01zGc8sUVfYwhs2+yrv3OYftOoZwbkAEPV4M8PslzogZwP
         0Kab7f0gHVl9tmaKui+4x8fceHjD2I8n5UicfgYEC5Vy//nYnXzDd1smQcdxjH91LfPX
         awLA==
X-Gm-Message-State: AOJu0YwgxFmvsNmh/oQQdsfaj4ELnihK8Zn7BtQYmSXV0c4LwuRCH2/l
	U2LUj6YJLbyBhmoov+9Qf+kJ2kwmKmnUaV/lF7uv917I3puLttlVyqDWNc1GN9c=
X-Google-Smtp-Source: AGHT+IFbp4VgcqWBYLe3U0yCi4vd7nmqSuzbqzRywA4zlYZMwP+tOs/p2A4kYUW8+VEuOgG9xmufbQ==
X-Received: by 2002:a17:907:6d02:b0:a9a:60c1:136d with SMTP id a640c23a62f3a-a9eeff0e570mr1147950966b.22.1731323736778;
        Mon, 11 Nov 2024 03:15:36 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a176cbsm593593066b.23.2024.11.11.03.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 03:15:36 -0800 (PST)
Message-ID: <9ef0d9df-3d6c-470a-913c-55698148d00e@tuxon.dev>
Date: Mon, 11 Nov 2024 13:15:32 +0200
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
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-7-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB1133233B458F3AC5F7C3602B3865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB1133233B458F3AC5F7C3602B3865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 10.11.2024 10:37, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 08 November 2024 10:50
>> To: geert+renesas@glider.be; mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
>> krzk+dt@kernel.org; conor+dt@kernel.org; Biju Das <biju.das.jz@bp.renesas.com>; Prabhakar Mahadev Lad
>> <prabhakar.mahadev-lad.rj@bp.renesas.com>; lgirdwood@gmail.com; broonie@kernel.org;
>> magnus.damm@gmail.com; linus.walleij@linaro.org; perex@perex.cz; tiwai@suse.com;
>> p.zabel@pengutronix.de
>> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-sound@vger.kernel.org; linux-gpio@vger.kernel.org; Claudiu.Beznea
>> <claudiu.beznea@tuxon.dev>; Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>; stable@vger.kernel.org
>> Subject: [PATCH v2 06/25] ASoC: sh: rz-ssi: Terminate all the DMA transactions
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> In case of full duplex the 1st closed stream doesn't benefit from the dmaengine_terminate_async().
>> Call it after the companion stream is closed.
>>
>> Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
> 
> Maybe add fixes tag for full duplex case as the separation of 
> Playback/ Capture is introduced in that patch.

OK

> 
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Cheers,
> Biju
> 
>> ---
>>
>> Changes in v2:
>> - none
>>
>>  sound/soc/renesas/rz-ssi.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c index 6efd017aaa7f..2d8721156099
>> 100644
>> --- a/sound/soc/renesas/rz-ssi.c
>> +++ b/sound/soc/renesas/rz-ssi.c
>> @@ -415,8 +415,12 @@ static int rz_ssi_stop(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
>>  	rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
>>
>>  	/* Cancel all remaining DMA transactions */
>> -	if (rz_ssi_is_dma_enabled(ssi))
>> -		dmaengine_terminate_async(strm->dma_ch);
>> +	if (rz_ssi_is_dma_enabled(ssi)) {
>> +		if (ssi->playback.dma_ch)
>> +			dmaengine_terminate_async(ssi->playback.dma_ch);
>> +		if (ssi->capture.dma_ch)
>> +			dmaengine_terminate_async(ssi->capture.dma_ch);
>> +	}
>>
>>  	rz_ssi_set_idle(ssi);
>>
>> --
>> 2.39.2
> 

