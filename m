Return-Path: <linux-renesas-soc+bounces-20026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC074B1C36C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 11:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AD19189C2B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 09:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6FB21ABDC;
	Wed,  6 Aug 2025 09:35:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBBA2B2D7;
	Wed,  6 Aug 2025 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472934; cv=none; b=FPphLUrpfDbkooiYrVQyJK1MhvzLwJk1sS32M0PwaPImM4Sn1P257AlW945ZG8ztxWIgB7AjdC7lCKRB4HaZI71RBw67qhcK1y0Um3ln4wD2+vgdxkgGyFSZJBvraaVFPGCQvcqSe7HhctqkbkV3my5fZfIHsX2j7S0V6Py4Yrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472934; c=relaxed/simple;
	bh=TiLe8TYKDWkzHthBwCk1ge3ltkHRnATXzDx8yWYiNKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYAhcrHgqM4FdOiMBxTOz23UFJ2N/EqtXVA5ElU9KUeIKoQKuQtT18gCLP2IXMqMEebDGb143qOM6AxvBBSPYZO8mlfTGJnkLUpxyW3xkSD2PJj1EsNOADAkUXvfea2evQq56tyAWqefAOXSgxbBWg5zhd7+2tTLIu7jADl819k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-88dc40608c1so1646463241.2;
        Wed, 06 Aug 2025 02:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472931; x=1755077731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDkF0BLoXFgSE926je2WgpTyIl4N2UFYP5ht23EU0t4=;
        b=f9FObMCh3Nm1/VJ2jAll9jmyNa786VpBWLaMViakQgTkldYgP1SfY02+r39OHpTywX
         BcBX+ux0ahHFkqcNjhpHLYG6JOKSgcZ8h2zrlOdW1YLZGB2SzJ8AKjaQPQ7Y37/kXM1X
         1/sqihdo+5w+Dwwr7GOJb2FVO7ixaOkqsz9eD+YpaBAywajYe0pvkrB0YVOwmzqBGZZN
         qMS4IoK1uySwWsbth6g+plSvLfx/vDBPatjUDZo96pljqwbkPKmzgcIRBTXjX9prf4Jw
         bFSrxMdO0yVou9n/hqn9eRtvmjGHqSCf/H2HAKGHH9fN3Q8F3oHPKQXKrXWq6+QCiMXm
         kfAA==
X-Forwarded-Encrypted: i=1; AJvYcCUZn9eW60el2DKuUXhj36/6IcqiqNlf4LH+i5cn0CWFC9mbZa8Soe9KhLGmFqupvmDy1lk6LDtckbjSj1PByt2HHBk=@vger.kernel.org, AJvYcCXNkEXQ2oAIoar+5tSK+SskMCx0ty75cVF6PLz8mMV86y0pHbAOiF+fYVX8lBu0iTTwOA4zwScoNm/k@vger.kernel.org
X-Gm-Message-State: AOJu0YyNTSembsV8r36M+6JUwf2HB6Jfbn/jN6/Z0gjUyCJGJUcuznZc
	qMuE/LDmZVYqC8De0VIJhbbQwiTJOxXwP4GYSTj2ptDfq2ThAqMv5WqjQd+aMfEs
X-Gm-Gg: ASbGnct8aJ/mUaQ+7Q0WSW7/9/PYrMnq+4jxCYlbAI8yYrkifUEAkJtGcnX8jXoX+Kr
	2XIDHQ8gK4cFfdTwGs0/MG10HatsKu/6/UXLe4xaPwefR7nhZ176NWbwcAjj8bR7y2MfxBBnBhM
	YEXDVW7ugkIj/0mj3olsH+F0caa7br4Q4Cc0k60WeXFnV/EHN/dP4DYh8JV2GsgmgC7sjx5NNeh
	qwyAoJMGxjPtNPYCBJbo8/W11DL7wkiDLZXziS+e1yPFzcXJZNwuZQ/ycSH1Ow/d0ynhqETZukx
	jpUjvgxa6YV64ocnRR2n415Rg7yp5Szr5W2krjSFKXVF8Y2fsfm5TsfOY0wdkclG1ufJWM3dm54
	bzgj29iJPc5mBwTbBW07sNXNuUZ0QD28dQ0ElletG4TNJ+T+TrPoxMSTIZwQpELtTfgBLvgI=
X-Google-Smtp-Source: AGHT+IGbf/AfBDLZOlQ/0VNAyif4Qv030yAe5Bi0UWv2iX5vLQ3m7hwqeouvK+P0YBAzH928TJyKmg==
X-Received: by 2002:a05:6102:1620:b0:4e9:d847:edab with SMTP id ada2fe7eead31-50373e1cc23mr795932137.14.1754472931213;
        Wed, 06 Aug 2025 02:35:31 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88d8f3f0291sm3331923241.16.2025.08.06.02.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:35:30 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4fc1094c24eso3922536137.0;
        Wed, 06 Aug 2025 02:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMqEAtGqmIMHZB0R+iY0cH8zLYbC/OS0Amwv0FrV96aHJPTJ9PzrsmMCamhew6fTJ9hOuxN3XojYn4@vger.kernel.org, AJvYcCX5TUISCzmUI/dIX7Z75ayys2gDqNN3bny/ljmVaeRB1hN7i/ikJZJnKjWg9pDNQ3iNqvbMDGegyEY+xwPI3PGsTC0=@vger.kernel.org
X-Received: by 2002:a67:e715:0:b0:4e5:fe5e:2be4 with SMTP id
 ada2fe7eead31-50374836fa4mr834200137.22.1754472930463; Wed, 06 Aug 2025
 02:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 11:35:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com>
X-Gm-Features: Ac12FXxkFhtyguB3aGvA7SYrNZpS8Rh9K4bGzADHoB8_URkfClNeKozYh9_ZFkU
Message-ID: <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip points
 on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Wed, 25 Jun 2025 at 12:03, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Since the Sparrow Hawk has a smaller PCB than the White Hawk, it tends
> to generate more heat. To prevent potential damage to the board, adjust
> the temperature trip points.
>
> Add four "passive" trip points which increasingly throttle the CPU to
> prevent overheating. The first trip point at 68=C2=B0C disables the 1.8 G=
Hz
> and 1.7 GHz modes and limits the CPU to 1.5 GHz frequency. The second
> trip point at 72=C2=B0C disables the 1.5 GHz mode and limits the CPU to 1=
.0
> GHz frequency. The third trip point at 76=C2=B0C uses thermal-idle to sta=
rt
> inserting idle cycles into the CPU instruction stream to cool the CPU
> cores down. The fourth and last trip point at 80=C2=B0C disables the 1.0 =
GHz
> mode and limits the CPU to 500 MHz frequency.
>
> In case the SoC heats up further, in case either of the thermal sensors
> readings passes the 100=C2=B0C, a thermal shutdown is triggered to preven=
t
> any damage to the hardware.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> @@ -38,6 +38,7 @@
>
>  /dts-v1/;
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/thermal/thermal.h>
>
>  #include "r8a779g3.dtsi"
>
> @@ -797,3 +798,139 @@ &rwdt {
>  &scif_clk {    /* X12 */
>         clock-frequency =3D <24000000>;
>  };
> +
> +/* thermal-idle cooling for all SoC cores */
> +&a76_0 {

Please keep nodes sorted (alphabetically by label).

> +       #cooling-cells =3D <2>;

This is only present for the first CPU core, and map{0,1,3} refer
only to a76_0, because all four CPU cores are driven by a single clock
(Z0), right?

> +
> +       a76_0_thermal_idle: thermal-idle {
> +               #cooling-cells =3D <2>;
> +               duration-us =3D <10000>;
> +               exit-latency-us =3D <500>;
> +       };
> +};

> +/* THS sensor in SoC near CA76 cores does more progressive cooling. */
> +&sensor_thermal_ca76 {
> +       critical-action =3D "shutdown";
> +
> +       cooling-maps {
> +               /*
> +                * The cooling-device minimum and maximum parameters inve=
rsely
> +                * match opp-table-0 {} node entries in r8a779g0.dtsi, in=
 other
> +                * words, 0 refers to 1.8 GHz OPP and 4 refers to 500 MHz=
 OPP.
> +                * This is because they refer to cooling levels, where ma=
ximum
> +                * cooling level happens at 500 MHz OPP, when the CPU cor=
e is
> +                * running slowly and therefore generates least heat.

That applies to cooling-device =3D <&a76_[0-3] ...>...

> +                */
> +               map0 {
> +                       /* At 68C, inhibit 1.7 GHz and 1.8 GHz modes */
> +                       trip =3D <&sensor3_passive_low>;
> +                       cooling-device =3D <&a76_0 2 4>;
> +                       contribution =3D <128>;
> +               };
> +
> +               map1 {
> +                       /* At 72C, inhibit 1.5 GHz mode */
> +                       trip =3D <&sensor3_passive_mid>;
> +                       cooling-device =3D <&a76_0 3 4>;
> +                       contribution =3D <256>;
> +               };
> +
> +               map2 {
> +                       /* At 76C, start injecting idle states */
> +                       trip =3D <&sensor3_passive_hi>;
> +                       cooling-device =3D <&a76_0_thermal_idle 0 80>,
> +                                        <&a76_1_thermal_idle 0 80>,
> +                                        <&a76_2_thermal_idle 0 80>,
> +                                        <&a76_3_thermal_idle 0 80>;

... but what do "0 80" refer to? I couldn't find in the thermal-idle
bindings what exactly are the minimum and maximum cooling states here.

> +                       contribution =3D <512>;
> +               };

The rest LGTM, so with the sort order fixed, and the thermal-idle
states clarified:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

