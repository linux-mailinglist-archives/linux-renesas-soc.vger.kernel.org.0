Return-Path: <linux-renesas-soc+bounces-22876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FBBBCC5F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 11:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90F833AF8E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 09:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE38C244675;
	Fri, 10 Oct 2025 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="G4mf+qgG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBED2367D7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760088952; cv=none; b=pQp4Tc+OvdkPny/V0gjYKkbdqB5//RGo0Qf5M4MrMxlnDdEU+xjWFqjXMgbqodVp/hPS+MEFaHvkg+adx96FkUsawP8zorMC+V5wLvhAdeJsNrdPW5XbRehRRNIJr6VfD9uMAxB7yPPSg+AAFB5c9W7y0WnjAhCqaYiD3+jZgB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760088952; c=relaxed/simple;
	bh=zny5wSoIzJoSyo8CorlviCTUvLFpKork/5EFauexRBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tP3tkqxcBLEHvg0TPSJfJbakQraF7xPedaRIn9KPb2TIhuXUQUifTk1t3hNGAWGZKoQmXOGisWq2MiOBwWyFeLQj3ARK1QOZgH59jgXJZY9sEZTZmR/vuSaWa5K7Og0fGGNo8fcfb2pvub0xr2rVANRsOG1gNkB1FbEVj+eA3jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=G4mf+qgG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso1352652f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760088948; x=1760693748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Z7oPxo3msRFw6jTL6tKQQ4wRSt857hLXrO6qMVjK9U=;
        b=G4mf+qgG9JzyBaPPswQwFheyW+46aaTy9Xtm+mb3sGxfq/Q4274e9LBDeOWJ4MAQlS
         vCAM1QJEP2T4nTKUhJfgvndzF4nhtWGb1OtD35bD2rGU6yJAMJLG65AtmEM4WgwoNR9a
         3eStVBVfOnzpkj/54fMWspoaGN4ykxnK9BJcudZJrhfbnOm48sl1TrTk5CfjmiD31qnr
         VZVcwwpJ19RwTGpfT2WHdoDxHoGDOk2cQVkiN1UrkwtiIt/fI+HI7HlMJ6STRwiwk7Kx
         Zixc56kkn5eitR4IkLx7xTZwWWWAVounMLdKa9n7DLrFKOEuvAUnjuacmGs4FHYSMiJ0
         X3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760088948; x=1760693748;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z7oPxo3msRFw6jTL6tKQQ4wRSt857hLXrO6qMVjK9U=;
        b=GtUteXtf3fc7ICOUYMCVP1ovcVtcceDdw6XckVpSfXL1rEd3Ncr/TP7gkzpIR1b56m
         SFGRv9RegrHzgFWfp1kAMCnrix8gEQOonq1s5Vj94Cu70Z/cX4uJQPMQiCUNlzCehlFq
         ni0kRpW1zL05pC/8sG7lQ2vvxYxpVaAox+TWs4umdy3+C43pTVXGOBbCeOunXZ2nmUbz
         /gO4+LA7WsXVOYElaS9ZwMEXAK4lH3nQuRACz4BK65ExXY+eELQof8UVpvIetwkP4LSd
         2kp8YK4/CYqejRtxo+6e4NFfN44DfTzCjWZYaSXa+DOk1YI5qd03NWxuopC4sqvtz4Gd
         /GuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW64J+yOLc7EVTqdnIAqRXp8XAAV73jNZAQamtg311O94O+INQUaIIoamwb+zYj8t3+sasvKdp5e5rrjSwRTEbO5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqM9Z3tdLuw+AEqCdI84nsQbbYLbzCynun0K2uQ35ZMMAfZWd8
	5fgG9BYdQnNhGlDixE4u1+4PujOemnY/2mVBzMhUAQfFLrZG4gmTjR248r9Ob6ZvMY4=
X-Gm-Gg: ASbGncso0Hi++h2+cdgT0roxfdCNAoOHUrVYwb8KPmFU/Q3cjRcXElYiuCoKpJxrObR
	bN/WF3F5INP95S58+W6vfBngJmloxbAMrcVXxBnpHGWauE17CDNoxtd1b3xGYqibgD8qSVOlbL1
	rg6jV4sXG0VhS1Ow+luUzGg1YmJTltyZqrfn3DT3FOjvDrosYqkNHwEOFprjgdSjkhlJc6kym2/
	0HnjNixdfvD22mMFiLIknI9r6Eraqq+zRRXEGCiA9i0p1w7dGE+zK9SSu+rBNcxhnCj/bZLMWwn
	tidrhgPVATxk7NF9YMujSpE69oEjLrrXmK8/9x1xWMB4GaANnWnKaFYENvd1dy3+IEIu30wuubR
	b3v3qjbPB7jbCEooGNZZvMjEtqqRVJY2Qy6LC/1cxjRvk9cU03aGQq5yoSwI=
X-Google-Smtp-Source: AGHT+IHyAlOBieFD9hoZkkNP1XYcHS2L4Rw4LJHk3fKdvO9j6FchF9sThZ4fj1/AGeC/KM4a0dhxkw==
X-Received: by 2002:a05:6000:2584:b0:3ec:c50c:7164 with SMTP id ffacd0b85a97d-4266726c309mr7801633f8f.15.1760088947436;
        Fri, 10 Oct 2025 02:35:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab36a773sm58415965e9.0.2025.10.10.02.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 02:35:47 -0700 (PDT)
Message-ID: <4cd8b624-3830-4989-b287-01e689cdb3df@tuxon.dev>
Date: Fri, 10 Oct 2025 12:35:45 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mmc: renesas_sdhi: Deassert the reset signal on probe
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org,
 p.zabel@pengutronix.de, linux-mmc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
 <20251008042526.3312597-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdW__Nw=oViQSPUb6zKbwRjXC7+6kUevHi1GzTTxrHxKkg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdW__Nw=oViQSPUb6zKbwRjXC7+6kUevHi1GzTTxrHxKkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 10/10/25 10:51, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, 10 Oct 2025 at 07:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Deassert the reset signal of the SDHI controller during probe to avoid
>> relying on the previous bootloaders. Without deasserting the reset signal,
>> the SDHI controller will not function.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/mmc/host/renesas_sdhi_core.c
>> +++ b/drivers/mmc/host/renesas_sdhi_core.c
>> @@ -1103,7 +1103,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>>         if (IS_ERR(priv->clk_cd))
>>                 return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk_cd), "cannot get cd clock");
>>
>> -       priv->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
>> +       priv->rstc = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, NULL);
> 
> Note that this has the side effect of asserting reset again on probe
> failure or unbind.

I agree. I've tested unbind/bind on RZ/G3S and I saw no issue.

>  Also on SoCs that boot with reset already deasserted
> (e.g. R-Car).  I don't know if that would be a problem.

I think all SoCs boot with resets de-asserted as the driver does register
configuration before calling reset_control_reset() in renesas_sdhi_reset(),
e.g:
- one register configuration is just above reset_control_reset()
- one register configuration, through sd_ctrl_write32_as_16_and_16(), in
  renesas_sdhi_probe()
- register writes in tmio_mmc_reset() before host->reset() call

I did bonnie++ tests after boot on RZ/G2{H, M, N, L, UL}, RZ/V2L and saw no
issue.

Thank you for your review,
Claudiu

> 
>>         if (IS_ERR(priv->rstc))
>>                 return PTR_ERR(priv->rstc);
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


