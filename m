Return-Path: <linux-renesas-soc+bounces-18313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DADFDAD9245
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 18:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 376B43AF4C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 15:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCE01FCCEB;
	Fri, 13 Jun 2025 15:56:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D631F78E0;
	Fri, 13 Jun 2025 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830217; cv=none; b=XANvaiE35KOUFH74fsw9ANlaFwUKoDyw7tKUijaLIBz1bGIszlgAOy/GwcbYHi0grsFea/2jJqTa8tKYJEV37BMxPA1GFsEoxzKvlGR1fRRRLNx4c/PCnCNmq91Zqs9gby2cs/kC3OBRY5XfxS1HoVRHT97pmQodaSXVYEheEwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830217; c=relaxed/simple;
	bh=Ff/dPe0/zvWzrk9xeulZmVftgbLko5KAXoPZKXcRMS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLAnH54NDXVwomZCAzSWrWXYgi6KjW2QOZ2b57zivxzFrWsxnAN6P3rgL5kKcOJqeTUs1GmGl4NFJTKKCfCUZCLjToY3jSjU8h7CUL68ox84bgMEHmAdYmtXDVH7SJjFRrkQ38mW7z57k1v8OphErZ2VzUjfhCLB4X7DKOQXhFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e7eff460b8so132422137.2;
        Fri, 13 Jun 2025 08:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830213; x=1750435013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XlXJ073zlgCJSvkXiWwOYU53vXHVFN5keh8mZoohvM=;
        b=BOOANyrSmu0Zu7hytGysQOZynrEidR2HWFB1hsWOv/AWHmrMa1Db4nMOo6IyeX9m5Z
         VgkQw6MxHiU1EssDtv71mUb4E61qykoEpap6cIIITTDWjkILRkd6jnadBY9Lhifx4mWu
         fWm7FfGzMGm41rA8zSap7XZxd7PvW/Atl/q4TNsVoGtvNPpu5R33NX5KOZ0q3fpNWCNY
         GNj8k5GbrYoViAc53cGNWMYpaEh3Ef1Jl0/+X3vBPBV2dqps87aoZMp5ZkECfd1SXEDK
         5C1f0FeDzuD+Y+7+hlBTGgM3tGdwfEgPDM7I4YhPuROE+eCLY1HBtWh0Z8HBYjDvb/OB
         B5WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAk6EPrFjt8IQJYsl8FB/o7myVVOEpX7Zhl8Q2cnGj1Y+YFLCaWxEcdCJV5+CVqexZNITWs6gj6Pqaa7n3@vger.kernel.org, AJvYcCVGYlXlB2tZUnJRhajIEiCbID8eP/RDhJmkvs8ScC2o2RC+xllkFB6EzVPuWkaRCZZOSUBpba0JFdBd@vger.kernel.org, AJvYcCVvSn29lhyP8EfZIriYVWqAkdV+YtaKRiK9Pxn/0QSgj2mSSiBtYtw5j4OBYmiUsdHMfQBIKWoPGJdn@vger.kernel.org, AJvYcCW6XQd4two94zy8NNDMY1kspyX+KimdCW0Czkg3lB4rNsdfxoBcBm7H0/uNHLevTyXkhM228xuG1eBDohzwNO+57R0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqlbFqk27v+MEyrkTvll8rdLLmrWXUYv0piU8LgDvUXUiZO9/j
	5EDG/jVQn9iLs78WgN6/STMjykk0Ho8cAh4vxmNOfCsUzZ66SENWNezQ6R6VyN9n
X-Gm-Gg: ASbGncutuzPfZm4HXVERW6WVDHrcZ6vxrt57djmPCUDwq2WTFVj8U7qWyJu5lKvvKwK
	SyWOQbJ/nolyF7wDa34KTsVFhLBf/0TJ3et8HxhNo9C91C4Nzp+L2SzBf7FYnehsVBRRND9eGoS
	I9+YRRvAuOkvnt1mlTFO2UGqepB/i4CRR3DPq+/BDjjgLpyFJIXgHDb3IZrZ6e8+9oba9x8DOBy
	GbomMnG4/RoyV3aNYhxjWODwDbPhIis11Ea959Aao7jK+StNX9DNas504VaS1Jk6i/AMu1bSSJz
	0PnIS/kmBl00vjnPyaxbbgxGKAHRn+kyuqZvukqGzBVeYEamj9zlGmQdeilOjG4Hx/mwgEIyIzh
	PvnJIhclGEgvgcVBtHBfRPBxt
X-Google-Smtp-Source: AGHT+IEbRlT0EZTld8vtI2CUwfirFSZUSDQJUBfCyE6HL76dTp2pgSj2eXvcdp4J27Oyu2Vowr5k+A==
X-Received: by 2002:a05:6102:54a3:b0:4e7:cdaa:ed60 with SMTP id ada2fe7eead31-4e7f610dc44mr189647137.6.1749830212778;
        Fri, 13 Jun 2025 08:56:52 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f0fa11ab8sm271506241.13.2025.06.13.08.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:56:52 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e7f38440fcso78545137.1;
        Fri, 13 Jun 2025 08:56:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2NGiGlJvE7Dpz99EatmkpGYxs6QUyi2mbonFfyPtna24WeydtjapfV5Bo2xv6pUdS5uJ6XZjrbfVu@vger.kernel.org, AJvYcCWujii3I2+UZxdX7fxzaCjGRUgqJznHmHSd1/or8PAUOTOe59182GA7iNSXi5LUyNGumYJApnf7sz35YdEABNkF1Ts=@vger.kernel.org, AJvYcCWwdOky0uXot5tTJbjIR2uhDIkW8A800qxW4Jt71sTwnFQOCQFi4rL4bHgXusEw6UKB/iOAMMGRkW/qIvRo@vger.kernel.org, AJvYcCXLcei/ezZM+s2FAedOcldJe9BjRmV3jCy6wlhWIy/EPp6TnGIgfqLMpXD/6PN3h/JN4aFBWSCIlIb/@vger.kernel.org
X-Received: by 2002:a05:6102:d93:b0:4e1:52fa:748d with SMTP id
 ada2fe7eead31-4e7f61dd543mr147284137.15.1749830211882; Fri, 13 Jun 2025
 08:56:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609232253.514220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWoWqrMKgNSYN_NDOtROD-SAq7ProhREPJTEBTOPCeH=A@mail.gmail.com> <CA+V-a8sBhF-FwV0BXCxpHkuhdAg5YcwDsWPFRPSV_BdmNpLWYA@mail.gmail.com>
In-Reply-To: <CA+V-a8sBhF-FwV0BXCxpHkuhdAg5YcwDsWPFRPSV_BdmNpLWYA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jun 2025 17:56:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBVuHf91r_O6w9Ez0ixF_DE+h8_xHYSkiGeNyBPCkTyg@mail.gmail.com>
X-Gm-Features: AX0GCFvpcxNhFEcSLddXXsBx8E4K3kmXoVbDymGrFdqESl4Zx-GJ_1Z3U5ra0WE
Message-ID: <CAMuHMdUBVuHf91r_O6w9Ez0ixF_DE+h8_xHYSkiGeNyBPCkTyg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document RZ/T2H and
 RZ/N2H support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, 13 Jun 2025 at 17:38, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
>
> Hi Geert,
>
> Thank you for the review.
>
> On Thu, Jun 12, 2025 at 4:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Tue, 10 Jun 2025 at 01:23, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add SDHI bindings for the Renesas RZ/T2H (a.k.a R9A09G077) and RZ/N2H
> > > (a.k.a R9A09G087) SoCs. Use `renesas,sdhi-r9a09g057` as a fallback si=
nce
> > > the SD/MMC block on these SoCs is identical to the one on RZ/V2H(P),
> > > allowing reuse of the existing driver without modifications.
> > >
> > > Update the binding schema to reflect differences: unlike RZ/V2H(P),
> > > RZ/T2H and RZ/N2H do not require the `resets` property and use only a
> > > single clock instead of four.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > @@ -129,59 +131,75 @@ allOf:
> > >          compatible:
> > >            contains:
> > >              enum:
> > > -              - renesas,sdhi-r9a09g057
> > > -              - renesas,rzg2l-sdhi
> > > +              - renesas,sdhi-r9a09g077
> > > +              - renesas,sdhi-r9a09g087
> > >      then:
> > >        properties:
> > > +        resets: false
> > >          clocks:
> > > -          items:
> > > -            - description: IMCLK, SDHI channel main clock1.
> > > -            - description: CLK_HS, SDHI channel High speed clock whi=
ch operates
> > > -                           4 times that of SDHI channel main clock1.
> > > -            - description: IMCLK2, SDHI channel main clock2. When th=
is clock is
> > > -                           turned off, external SD card detection ca=
nnot be
> > > -                           detected.
> > > -            - description: ACLK, SDHI channel bus clock.
> > > +          description: ACLK, SDHI channel bus clock.
> >
> > According to the documentation, this is the SDHI high speed clock...
> >
> Agreed, I will update it to `CLKHS, SDHI channel High speed clock.`
>
> > > +          maxItems: 1
> > >          clock-names:
> > > -          items:
> > > -            - const: core
> > > -            - const: clkh
> > > -            - const: cd
> > > -            - const: aclk
> > > -      required:
> > > -        - clock-names
> > > -        - resets
> > > +          const: aclk
> >
> > ... i.e. clkhs.
> s/clkhs/clkh

The documentation calls it "clkhs".
In addition, calling it "clkh" may confuse the driver if it turns out to be
identical to the main (first, unnamed) clock:

    priv->clk =3D devm_clk_get(&pdev->dev, NULL);
    if (IS_ERR(priv->clk))
            return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk),
"cannot get clock");

    priv->clkh =3D devm_clk_get_optional(&pdev->dev, "clkh");
    if (IS_ERR(priv->clkh))
            return dev_err_probe(&pdev->dev, PTR_ERR(priv->clkh),
"cannot get clkh");

    ...

    if (priv->clkh) {
            /* HS400 with 4TAP needs different clock settings */
            ...
    }

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

