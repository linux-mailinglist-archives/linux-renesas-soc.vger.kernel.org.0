Return-Path: <linux-renesas-soc+bounces-20534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F5DB26B9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 17:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49AC26857AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 15:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2738524167F;
	Thu, 14 Aug 2025 15:50:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A94233710;
	Thu, 14 Aug 2025 15:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755186627; cv=none; b=WXhUesGeYiAhjHuCIf6Ln8ujIH/tEpHT93CGeEq/gcYF5R5XYGH1MCeXGRxEd5H/3oMjz4vo3FQ/LL5zxoMcDNO46uAZMc31zv/cXrrugwhrhigLz2PDGPDrbfro2GWJokTrvVbM4ARQDvsOXxgcbznvZXo9dpJsmwXZmXvhw8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755186627; c=relaxed/simple;
	bh=Z8bEQI00NkbwUdIv/vhnAFw33hHBlPVS4Ot/H8rFDX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRuC7ZcK5L8LoHnkpiLwb6rKxZuCDGx1fpngN1oFI+Z3qtN8NJYC2OYTvzRZiysx8D+A0FCtm7oXBsHFAa0Jsa36KJ6Nnx3xa7ioZDBMr0DAObtg3R149OpYRUKYfrj146gOTt4aVdbmxvC8+vffERuPRn6BPlrIIWIJ8q69ayk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-50f890e9054so670829137.1;
        Thu, 14 Aug 2025 08:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186624; x=1755791424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPxPc5gSPfbsdKnAKMvHjWJ+7kwSju+xPbLU6ci9bXI=;
        b=ndqAdnqeqj7R6w+OH36IkI9E3vh3N4uMeVF3/TwZCdwyglahufIRYbA/wqbr01P418
         3DF1lumkO4f+RjGBoUDo4Q3sm4u0NOzeOFyQcNGfv6t63jOeSggqYTuIHf8QRZ2Ijyvw
         29BWsgnGUy9MtmYdoVxRrIxZcbrmAaGpbuxpfFcpFwiCUE1Z7tefzuVevSGFEslsOOtd
         5vubfz+RCUqc+oxBX/gCZESNFXmbkYrUiE9V0HfYMUezKViIPqSWKX2m3j4KVXf2UPdO
         DR42Nat4bxCzC3PKAaS0X7CiyXyqu8giozgC23kD58z8g7iQ11jgR8ozSxCYM1HeuytH
         xvxw==
X-Forwarded-Encrypted: i=1; AJvYcCVHxZf1LhnKdzrCgnsmNB0PmZrFLP0yI83pLMrlNmPRk+fvt8eROzqEVjfjL64yejPXX0vGFPjNZRvBRYd+qXhYyww=@vger.kernel.org, AJvYcCX1TtezLZtDR3FCRuEelVd8/4UrI+/Ht3Qpt2HKTJcRagy9TYdWSDvhDtEdXXKCkY1Bg442ad0Xmeoy@vger.kernel.org
X-Gm-Message-State: AOJu0YxiCu9VeLiyt4vHBFCTlSKB9vE4yPUsFUIznUcfvD2eX8ne617F
	SfoO8fjSYC9n3dFJFi95UzytH7IsEAuYC3qGZmgwqR101r2lyp3NHcbWF864fTvm
X-Gm-Gg: ASbGncvpUpLR9rWmv8aJDm5KAVt+zv6LH5vTbzeAC1R7XyIhdbA+xaeLgFbMS1UehtZ
	eJHkyDM/826pHoh+fbuOX0gwqWeQIXYfbuqoiy4XSx+xxJuFEJZJQgNV361thWJ5O7huWoe73Kl
	7rS0Trz0AdaOZcZGw639epPlnJrxdp4YgqHCxOZWDm2vHFULX8B8GOBuZJVObp6h02yq1JHsA1T
	O0OWFkYwlZNVILi0FNZEYJaKWUMkS56WMduxnOrGvOU4g4nSr5OeeJUeyktICDQ/OdeYp8ywzFE
	B9xyJqIcXfLx+qFCoLPGfgL9WjVbuXY2DgsEIg7VGgmSGhDZifBb541K3st0Hz6GibE2VeI72mz
	XxzWsKsI/7IZVKauZh+jRLvWg6nkW19AXj15ny0At/P9arPQymik4lTUQHoahI3DHEsxdQJI=
X-Google-Smtp-Source: AGHT+IGbC6O9pnhUIODkWNTe8O4zW3OeWDg6dGpEYrD5ocj+VR6CZwaraSr+g992dClkTbqsxXj6yg==
X-Received: by 2002:a05:6102:30ca:10b0:511:db31:acc2 with SMTP id ada2fe7eead31-511db41e87cmr181400137.4.1755186623733;
        Thu, 14 Aug 2025 08:50:23 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e0268d423sm3083400241.2.2025.08.14.08.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:50:23 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-89018ec3597so602313241.0;
        Thu, 14 Aug 2025 08:50:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7VZjyh+fAarSo9Rml2hNxpd59nmMEWmIHcgr7wHCdm/bwvo/6JIsW8TXQB8gG0GXVCnHzT8/nQ7LEX9MWaf9e/NQ=@vger.kernel.org, AJvYcCVqfT9ka3gf4bKPD5YyQ9bYcpbACr7Wx6Xn/q3yUa9yme42vFDwgFfRwcSJDWNIs0xyQv2IaOjwVgvW@vger.kernel.org
X-Received: by 2002:a05:6102:e09:b0:4fc:b033:cdc5 with SMTP id
 ada2fe7eead31-50fe9974df5mr1403773137.22.1755186623090; Thu, 14 Aug 2025
 08:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com> <e1d465f7-43d7-471b-b8a7-7d24428bac4c@mailbox.org>
In-Reply-To: <e1d465f7-43d7-471b-b8a7-7d24428bac4c@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:50:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6naFbq-5LyuC4n+JRPTXGSSohKDTf95=MS_SMyHqfng@mail.gmail.com>
X-Gm-Features: Ac12FXzUlAeFho5ry-hkAttyLSDTpbx1Nmmf3I2qDfLxTUJAEpDknPJ7TslWclQ
Message-ID: <CAMuHMdX6naFbq-5LyuC4n+JRPTXGSSohKDTf95=MS_SMyHqfng@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip points
 on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 6 Aug 2025 at 17:23, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 8/6/25 11:35 AM, Geert Uytterhoeven wrote:
> >> +/* THS sensor in SoC near CA76 cores does more progressive cooling. */
> >> +&sensor_thermal_ca76 {
> >> +       critical-action = "shutdown";
> >> +
> >> +       cooling-maps {
> >> +               /*
> >> +                * The cooling-device minimum and maximum parameters inversely
> >> +                * match opp-table-0 {} node entries in r8a779g0.dtsi, in other
> >> +                * words, 0 refers to 1.8 GHz OPP and 4 refers to 500 MHz OPP.
> >> +                * This is because they refer to cooling levels, where maximum
> >> +                * cooling level happens at 500 MHz OPP, when the CPU core is
> >> +                * running slowly and therefore generates least heat.
> >
> > That applies to cooling-device = <&a76_[0-3] ...>...
>
> Do you want me to add this line into the comment ?

I don't think that is really needed (see below)

> >> +                */
> >> +               map0 {
> >> +                       /* At 68C, inhibit 1.7 GHz and 1.8 GHz modes */
> >> +                       trip = <&sensor3_passive_low>;
> >> +                       cooling-device = <&a76_0 2 4>;
> >> +                       contribution = <128>;
> >> +               };
> >> +
> >> +               map1 {
> >> +                       /* At 72C, inhibit 1.5 GHz mode */
> >> +                       trip = <&sensor3_passive_mid>;
> >> +                       cooling-device = <&a76_0 3 4>;
> >> +                       contribution = <256>;
> >> +               };
> >> +
> >> +               map2 {
> >> +                       /* At 76C, start injecting idle states */
> >> +                       trip = <&sensor3_passive_hi>;
> >> +                       cooling-device = <&a76_0_thermal_idle 0 80>,
> >> +                                        <&a76_1_thermal_idle 0 80>,
> >> +                                        <&a76_2_thermal_idle 0 80>,
> >> +                                        <&a76_3_thermal_idle 0 80>;
> >
> > ... but what do "0 80" refer to? I couldn't find in the thermal-idle
> > bindings what exactly are the minimum and maximum cooling states here.
>
> The comments in drivers/thermal/cpuidle_cooling.c clarify that, it is
> the idle injection rate in percent, in this case the cooling can inject
> idle states up to 80% of time.

OK, so I will add "(0-80%)" to the idle states comment, and sort
the nodes while queuing in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

