Return-Path: <linux-renesas-soc+bounces-11235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2369ECDAE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 14:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18440162F40
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 13:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBD72368E8;
	Wed, 11 Dec 2024 13:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="We7Ro6Qp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F964230274
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925208; cv=none; b=FPt0gRVjYNZJla9d7arSuIEV+uEkYq3IIiwKFbHEgx/X6Sr5JnLAwOazuBsYjy8yQqiDP+ZH237Mj/ua5q2rauhsl0FVblVQFU62Vs+Zi2uw6mgXMZIVegIvD1WWlwah/bOhOyJgbZuxoAfJPTctVNPQgoGXr9QhU8yrMr5KiJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925208; c=relaxed/simple;
	bh=YSdh0Mm0FonlMgaa3imnf9PPReZOary7MqBo29RKeZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKxF6cpuxg+xr5FqZozoRLPGtc8ha8e6lJI98fXeT0Mj0Q54YecZ+61YDbRN0JmPgV6wBPPdLZM3k/9EMJFi/QcFSUDA6DC53xCskMto9YyRlHpxl4UAj0rbNAi43tpCg18u3ygtU2jXgGekxETrJ5+nJH6JIZbZceCms3x8fro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=We7Ro6Qp; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa66c1345caso294647866b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 05:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733925205; x=1734530005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JAQ94DgwmZTsFqQuFhEr5XjtlJo5Liq/MWFSbEP7oQ=;
        b=We7Ro6QpXdFqx1EZCLNk/BGMGe7KhGl6PAlNriTd27U4td+pcYwIjAR39eWjr3fQV3
         hbwqiaKicF/joN8+62DAYg8Wf9/MURxT8V6z8bGdUlL0iV0Y0xNXupuRo9OjB3QYbfXB
         csYSDW2tU10Y1v8TLomFlX/NG62h5wyDlxRXMB8/GWwUj6vIlZrublRxbyO8JQNTZs1M
         OcPBeDjVKdSmVLyG3jFTn0n0XIj0HAlr/ZL0YbhyX4t0B5HGjOtgCwRfE8wv4qfhgf1p
         XHhWsm3/GVeyw5+QUaPsEKGZ4IfFzeXu8dZNVG5Z9qY2DOR51vj1yLn1M/mVxfIyXI4X
         sg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925205; x=1734530005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JAQ94DgwmZTsFqQuFhEr5XjtlJo5Liq/MWFSbEP7oQ=;
        b=UPo2we7c+Tze0kvRWdL4TAXdPwla64ciCFOV2EUp0ujJlZBWsbalimiEb5GmIe7oiJ
         xLEkxFHw6BOmReptiOCS06+qeaqgl4x3htgMVImJArg3/zGihERAK5yddR6EZ0Nr+NvB
         cOnwDQPeYJkoXTMO5fdR5KbAIqaO0SU7hN7gAt64xJ9Ex5PFzJeJWgdfOO8cZbgxCCQ5
         eAi1RhGDFb7rML5LgwegLf3S/rNaBB/msq02dxFvtSNYjUhrNZKQqFuM4divYsTzo8Gb
         ZUxS97cYJqwNvS9YrNFIX7Ysk/Kot/OIq1DygfG2SRoTfJTG7N065M1FLmtDBZjt3fEw
         kOKA==
X-Forwarded-Encrypted: i=1; AJvYcCV8/wXItradVp3UrnJCJaFt9FGNSdpNKQNOVJ3VVeCxIXMZN8gNuXh/IxcGu/jiOWwnwdJdrX1Z70IbmaHyCIdyOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTuUxqbpSSa1hqQoO1KMxKPN0LbuGwCRMTiV9434jgmojQ1d0f
	RAIwA8L9bJGpEV816kBMJspCGJ8bGL1GC+t5K0l7auAcMdAYMSisVCyJxDn84C0=
X-Gm-Gg: ASbGncsDPgaHE4FXoOvjdDoxansfhQTGWgd9rg/lHKOgKV2dY6R1/tI5/ekhk4kBUDs
	zJaTwPpFdoigJ79lOmT9HDJqnmOdCreyhbJbKCa/BDemtb13JkeR8DjMPQE2doO3hyQv2jlsKUP
	xhmTdg67lgU7hqYxx5xVrTZhTd85bqLE7EGS9M1Qa+nBo/zpKC5nhEuU9H1XRL2ly9Z6Q+l8y7o
	FIDajV9batoqF9M+ctQa+wleMbqVFQWcXDypYqThA+NS5ruI2LPM6xksJ+VYQE=
X-Google-Smtp-Source: AGHT+IHhR+q/yjOR8fMgpp+HvsWmN+ncd/5Lo5Mk+pkPGE0cvah/TqVw4ZywcOYOxY2cukLaXrgmug==
X-Received: by 2002:a17:906:b3a1:b0:aa6:75e1:186c with SMTP id a640c23a62f3a-aa6b1505cf0mr213318566b.50.1733925205362;
        Wed, 11 Dec 2024 05:53:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa653d1df95sm682900766b.98.2024.12.11.05.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 05:53:24 -0800 (PST)
Message-ID: <5e7d316d-2e13-436d-8474-48411e2a12d9@tuxon.dev>
Date: Wed, 11 Dec 2024 15:53:22 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] arm64: dts: renesas: r9a08g045: Add ADC node
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, jic23@kernel.org,
 lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
 <20241206111337.726244-15-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVMQr9RhG7v32vQeSrepmdh2VdzzwF5obJUpdGNotGV7Q@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVMQr9RhG7v32vQeSrepmdh2VdzzwF5obJUpdGNotGV7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 11.12.2024 15:27, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, Dec 6, 2024 at 12:14 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add the device tree node for the ADC IP available on the Renesas RZ/G3S
>> SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> @@ -87,6 +87,59 @@ rtc: rtc@1004ec00 {
>>                         status = "disabled";
>>                 };
>>
>> +               adc: adc@10058000 {
>> +                       compatible = "renesas,r9a08g045-adc";
>> +                       reg = <0 0x10058000 0 0x400>;
> 
> Table 5.1 ("Detailed Address Space") says the size is 4 KiB.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.14, with the above fixed.

Thank you!

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

