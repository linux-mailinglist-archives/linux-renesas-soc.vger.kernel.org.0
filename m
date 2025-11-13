Return-Path: <linux-renesas-soc+bounces-24591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BF23CC598F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 19:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 967584ED662
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 18:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9307C312829;
	Thu, 13 Nov 2025 18:39:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669CA30C612
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 18:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763059180; cv=none; b=ZcKdlB6fdholF2HuAEr8dlMesm6g22OZy4D0Mn7AQP8PH3fFPN1t1q5DY120Dtf0JgVHqMYIEEXPVTtosObkslHqoqv2lDNKrI5BkI1U9a/f1ON3sDcwEOgZ1RfmlFD2FZmd45d+GyoQNjvl/8U+LHaUR9Uv5Fn0LmzdFU38PI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763059180; c=relaxed/simple;
	bh=3c0sAkDQu1qBVzE7td1x+QSCl8WUFk7pNS0yIvPZ3RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1cAsXty1Awvj7k/4P9otn+i0Q2cZKp4e7g3FdYd0cSEg0QIFN6I0mHfZqv/zGz/696mWD68kCfpz1cjZ/j+1MjqItvs9EREq69myJWN7HlM1N3ui28hDXAF4eKaNBb3/627EVNHFzm0OafWrM5Yzt+h12ZxVJ9kNIXaGqk/U7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-559876b6514so278115e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 10:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763059176; x=1763663976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fn33ddPk9bS9PgY509eYuCfPPBWfLh0ylYRDGrpE/Zo=;
        b=JwMYGN1B94uk8s1d6S7o/ge3NA4oYf/XwJpbqxkYq3VBehvbxog6G+fXWP5Dc+br2L
         DaQyjFYnFq7SJYBYitlsp2QSYPOGn9CA+agBRKO1tgaiJerwmVq3kVecJoejY2N/nIbA
         XR/qGNe8JVg3ovHbjIkv1ug5zqdP9wHFpcqFIzUkf9nPuXXVMBEjznXsRrGBTDzaxyVX
         rQmoIiVDB1G2EXL9vXzoJuoi2TUt77mChuvU+GH31Le5aLhaO+7BEo8WH4EufzV9nzpj
         zKPwuolx+5XDDNUXW4r3hh9OeXvhXOCoqbUdypCqaWkM+QHSft5mEl3ILqVoItvCwdPC
         oZPw==
X-Forwarded-Encrypted: i=1; AJvYcCXmmavfEpVjaugCcTxIhraS+qkfkdvb0uekq4F6PdyEBe4jc2cJbQeQ8b/z6LZVF0qzdm01R3C0rUGxVOYQ4BiqPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo0doO3b388RakBp4qHFa6qT44r9DQ0q+RIF67CbIUsywV5OGS
	IQ53OIth4L4WAfQV/5IZM/qOy3cpEZdKnOHEk3hEFsFqA8lmNYLnMHDxx/8yRIwD2/0=
X-Gm-Gg: ASbGncuWiNxyA+0OGQUG6nLW2bv92rvxGLsPhhNwbS9+yHFsv5+JFEUZ2Mf5SSttOBU
	1UXg+JfEaV9ifEDK6MBpfni6N62NeHiyGRuF3n9H0In08OPLE/Etxtdc4Eba7Phu4i9XS+LrPdt
	dexvUd0gPBkvUhX/gm7dNA61SNzCmWcF4my9klElPk1nY5/dguuAbj18awFNxOJhAoEGFsO7k1S
	P6AoxvNI9bc9+lbeHx0IDPO0Vv0pcLnzPJjsk8f2lqCpWv6YhsCX2SSAQsKMcVKYpnY9P4XjQko
	Zpd9F0yfUrNATWTVplq1L9ie1fxvwPiE54sOkf+5K8W2LcEoOsbvDPk2zpia3q/PDdfnCLZnyjs
	aeWAVaOW7uoaPgWubMIrpD65X6/P2UHVCttEHl6HHffuGI0b1MOI6WqxazIpGvz4oSdqJzwdTBV
	2Jzgo4xZVcAs4mrC4De9KQbltFHuKOjblw+xc5T4/i2s+CuQbw
X-Google-Smtp-Source: AGHT+IH3YNuImRnqtsSueECXyACguFPCxEVdrYJZ8mNIdl7qoxCjShRsWeiQvK8VPepNRE4lCavwnA==
X-Received: by 2002:a05:6122:3285:b0:559:b2cb:5dad with SMTP id 71dfb90a1353d-55b1bd889ecmr362658e0c.3.1763059175960;
        Thu, 13 Nov 2025 10:39:35 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f499dc9sm915606e0c.23.2025.11.13.10.39.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 10:39:35 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9371f7571cfso398729241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 10:39:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXBfKcQt/3ASkhB1FIcQPm7/N47GaUDRjI96SBiIy0RYj5gB0oLjXjZCJa/+UeBKxCC+f5hUxPF4bFCvAE0LNe9MQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4b88:b0:5db:eeb6:812c with SMTP id
 ada2fe7eead31-5dfc5b96e0amr374019137.43.1763059175404; Thu, 13 Nov 2025
 10:39:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105104151.1489281-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251105104151.1489281-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251105104151.1489281-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 19:39:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEjnPWzwLF49ryooEUPNeLtXEuHDipcCMq=wsXN=zD_Q@mail.gmail.com>
X-Gm-Features: AWmQ_blsF688r-SQvCXnNFqKgHzgSK8u69yJh9wFop3IkqSYjXU8VHfHFzFl3OY
Message-ID: <CAMuHMdXEjnPWzwLF49ryooEUPNeLtXEuHDipcCMq=wsXN=zD_Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] clk: renesas: r9a09g077: add SPI module clocks
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Wed, 5 Nov 2025 at 11:43, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have four SPI
> peripherals, each with their own clock divider, which divides PLL4 by
> either 24, 25, 30 or 32, similar to the SCI peripheral.
>
> The dividers feed into the usual module clocks.
>
> Add them all.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c
> @@ -54,6 +54,11 @@
>  #define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
>  #define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
>
> +#define DIVSPI0ASYNC   CONF_PACK(SCKCR3, 0, 2)
> +#define DIVSPI1ASYNC   CONF_PACK(SCKCR3, 2, 2)
> +#define DIVSPI2ASYNC   CONF_PACK(SCKCR3, 4, 2)
> +#define DIVSPI3ASYNC   CONF_PACK(SCKCR2, 16, 2)

I'll move these up while applying, so all SCKCR2 and SCKCR3 definitions
are grouped and sorted.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

