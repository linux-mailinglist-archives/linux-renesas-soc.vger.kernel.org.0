Return-Path: <linux-renesas-soc+bounces-2946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F4859E36
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 09:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11F5F1C2095E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 08:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFACE21353;
	Mon, 19 Feb 2024 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UgrZj6Ky"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0B7208B9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708331369; cv=none; b=ZuJKd/8R26++GwYugDlSt7EQGgTpnfPjqwjadHVRtV96RxeCA63CN5PbhWHUAeGbBFHTfesgoGOSO/npBiJLe3dIEXvyb5NbGPQc83qjcjqcHLkxNolE+WQpwT3AyGlS+mqZft1hCmui93SYghArpLIGyanPSCdhDTCqDMaWm0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708331369; c=relaxed/simple;
	bh=uhdC6JFPIGg+KsZnoOpAWCewl/MoAdPwQ2M0i3DpJNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6jgq3DAGB50xuUR2hm/nT+ZM9UGttEzhqSKZxH0gBgMpz6/xNw+O+hkIWbzIJ9pyxDZV5sCPpvYIkh+qD/GI8INHLZhNgVGkosD07qFq/iCfdVyEVdCRS7ZgaLDaBU5okOVqpn9H5al7Niq+wYocWTVkeZptbEwGgrtcGUPr84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UgrZj6Ky; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d0a4e1789cso47832181fa.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 00:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708331365; x=1708936165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kWUWsnfwYVJB3NeJPGabmiQoX5d4BCcDZFFFL55Cbcc=;
        b=UgrZj6KyMkIoaNrtRt8adIqFsfchFQmxiPgEzEAZfss5rCWyQz8DPmeSQJx+lhag6k
         oCYw2YhOVynEz64c99AxdBZUSq9SB7eS8iwGgBDWzsLS8eiBhHACusWTSzvzZIXwNOma
         l0mhn52QL9uKoIUA0DYj/gMtQiYo0FZlwwrNGZnoApK0pe9S/JPbdI+fJqgFfyHQ42LM
         iDtTZF6Ryi2px9OlbcnGokaNnKqtHBRplEn7cArxAUK8/DaJsvyUG7n1fh0O5yseIE8M
         yiC6EJkzm+OOYsCSoG70aF8D9fVH7mQqDeFOpL65q3DolO+26L7F431domELyjncqnws
         0uAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331365; x=1708936165;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWUWsnfwYVJB3NeJPGabmiQoX5d4BCcDZFFFL55Cbcc=;
        b=nwPTFVK5RrF3QKjru8fI2r2dT92/uTR7Wkfa57g4ulDJqucHUNHJAqOSVMF3ongHfA
         TEZuAx/iuNRRv88oaFeGmbOUIuD7uEi/UMOHJCvo7WMPOYKAdJFd3PKDqLndZd+LBxO+
         d67Q/kWArJenR/h7MymRoIOrl0mK3Q6Q/KjsEvEE1V2Z6XFZM7gugNGpWK5ySXYntZCD
         NGqSy1qy1hu2qN1UESk0a4O2edRRdE55KuZAe1jtqtsbZYztslAyOVqyxfhVWFNKLOWh
         ouFuSpo7/TBw2ELvz7YxxGmvGpPf0Q03clbIX2ekPnapfhyYXtG5UTeXC5t7uzu3C7k4
         ErRw==
X-Forwarded-Encrypted: i=1; AJvYcCUs64bskNRDb48wYdtjNBslCC0ap2QknMocE1as0tGBFhGd5X4XsDFy1dUa7K6hplnGXWSNG/u6PgkPrD7Z43tLJ3gPWJ7nE2tLKf1MWEfDCng=
X-Gm-Message-State: AOJu0YwwDYrbGMH13CE7eUg5dygPSr+2cPQT/8iOomvK/bOR/tJ4nW5E
	GtapOKcOVOjIv2O0DNT8wyxWjRfs5oDjnepmjoraIYDBZeqD2RLA9TRPa+dgGGM=
X-Google-Smtp-Source: AGHT+IGJbZ1oXtdXJ0tTWHvHxj794/54tKPc/gXozHxyRNAZCzrqi/Be9hQAFy18RTkyv7AzQAYNmA==
X-Received: by 2002:a05:651c:604:b0:2d2:4314:8c06 with SMTP id k4-20020a05651c060400b002d243148c06mr47798lje.15.1708331365518;
        Mon, 19 Feb 2024 00:29:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id g2-20020a2e9382000000b002d09bdb7e1fsm983394ljh.24.2024.02.19.00.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:29:24 -0800 (PST)
Message-ID: <3c47c45d-be37-415b-b38c-2185a2108d40@tuxon.dev>
Date: Mon, 19 Feb 2024 10:29:21 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] arm64: dts: renesas: rzg3s-smarc-som: Guard the
 ethernet IRQ GPIOs with proper flags
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-13-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdX3=KJ6=qOW__KxWisj7Fguwr=SdP7XGvFD+BKgZbRo9A@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdX3=KJ6=qOW__KxWisj7Fguwr=SdP7XGvFD+BKgZbRo9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16.02.2024 16:17, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Feb 8, 2024 at 1:44 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Ethernet IRQ GPIOs are marked as gpio-hog. Thus, these GPIOs are requested
>> at probe w/o considering if there are other peripherals that needs them.
>> The Ethernet IRQ GPIOs are shared w/ SDHI2. Selection b/w Ethernet and
>> SDHI2 is done through a hardware switch. To avoid scenarios where one wants
>> to boot with SDHI2 support and some SDHI pins are not propertly configured
>> because of gpio-hog guard Ethernet IRQ GPIO with proper build flag.
>>
>> Fixes: 932ff0c802c6 ("arm64: dts: renesas: rzg3s-smarc-som: Enable the Ethernet interfaces")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch! (which was well-hidden between non-fixes ;-)

Sorry about that.

> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.9.
> 
> As Ethernet is enabled by default, I think there is no need to fast-track
> this for v6.8.

Right!

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

