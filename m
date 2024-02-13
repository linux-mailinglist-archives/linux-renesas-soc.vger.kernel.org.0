Return-Path: <linux-renesas-soc+bounces-2665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC2D852B32
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 09:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63FE11F213CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 08:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B32134CB;
	Tue, 13 Feb 2024 08:30:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6729E18AEA;
	Tue, 13 Feb 2024 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707813011; cv=none; b=rLyNVc2pM9ErMql8fyYf+pNrZEI7Z1Xs1A03cl9T/N2fY84kwWGQMF5CvzqIeVUweg+r9QEznWgKGHwPZHhoEUgEJ8z9PQaXzQeW9bWrow+CKViOGKoyqvOUe67qAKyP7V4zkeDSoHX559+zMZUFuP8sQ/2ccWX+l0Ng/o8w08Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707813011; c=relaxed/simple;
	bh=swkjVsrtZC/GxJpxFGctjL9h4eESDQoNBbGe/NRYMJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUpHbU6GYBywRriDGJbIpGiqsaCaRFLANhbMqWmVTxTGa0wnZtb3CubS5qQOlgiqjm5xoRYGw8atube4+AonbcQr/W6IkxWRKLHVIlEaACAIFbezJaXsbpFWcbwvzkGySyldxx8LxedjsUTgVBXxFEzqKQWLZbP8+FuIQsJvaGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6002317a427so36574077b3.2;
        Tue, 13 Feb 2024 00:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707813008; x=1708417808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4+eAeHwRegoemVAl1qDh1VQxi5K9KI30MgGUZ7mnVY=;
        b=E/rUI9BSZAhaLYElPr2a1yvmzsijGWFXaK+u/KGCA3bupehtuibukkamkwM+cK05BL
         uaFNpYHAsnML1Cl+hHtLNCH09MkPjzWGWca8EuzpITY5M0APVeYzhbCM+XKMVlR0OXFG
         Z3mJicc3akfulmxfjV9k7siLw2ljsAW0szerU8aTPUngsgbStkRHTqA1ydn6uVHtTMsO
         68zw3Xu+/b8TBEvqXd5R0RAmFsuZ8xnrF3TFG8RTWrcMsu2BftzbG4Ut0CRXKEysZkCr
         84+KFIZ4U01buMLnF5Bfiq1pDRL0xz7hXs7TUklZy6sIQpfxgeqGEQBn5jp+UO9XN8qU
         WLoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnmKLAIZQI9xNirV6tBh+GdvIyJzWxMSn9xV4ZStdlktarpeuCgCD23XFVkwuhXYum93Hg4+vhNm25KEtkPVMrEspErEBy4dNRXsjjeURbqwDFVpjxksTK/QVy+ZTgtIgR/JzENbbbNZzuC0LQ
X-Gm-Message-State: AOJu0Ywu7WJeqwbOxGkxS2Zt+42jnb1WNg4YTNgdSqdkSAyFE/2R0ON8
	wSWi00EidOSlbKrfrFHHPYVlsrybAhAnIMU/Xopd4Ya3VHl3o+40zokvFs2GWwI=
X-Google-Smtp-Source: AGHT+IE+YMrT5RcjIrNbbMfoyp/nzdSJpVPkJwphGVkBzGb6rjYVkTemAkluEOyHADdecwa8IKbTvg==
X-Received: by 2002:a81:69d4:0:b0:607:92a7:a99b with SMTP id e203-20020a8169d4000000b0060792a7a99bmr135524ywc.8.1707813008007;
        Tue, 13 Feb 2024 00:30:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPZjAKHg2vNIJ0gGtILLnQ8K5ogC/AodXeoDxCw/K0rBXvo1H5pG/IxOt7JfsYDdybRLXbCZyZs1gIGIWwFkM76EZWPW0UJvaPddJkNTn43i0xd1VIJSkVLinGiRZnbcEYzu595T778KEP3IW1
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id a67-20020a0df146000000b006042345d3e2sm1621167ywf.141.2024.02.13.00.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 00:30:07 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so494553276.0;
        Tue, 13 Feb 2024 00:30:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNWsp4RRtmTr5kMfncCxP/BMCRe1t7wRxMmGDYrkAUjICJ4CS8ViKEo/nLermvOYEpvfrwL3Bpdy61onymCCTyemyR2edjBk/ih3asx0Wc9Biju4haXjnqOTzgxNOmdJe/iiJKLxEwSU9dMKfs
X-Received: by 2002:a25:db4b:0:b0:dc6:ff66:87a8 with SMTP id
 g72-20020a25db4b000000b00dc6ff6687a8mr7314237ybf.51.1707813007096; Tue, 13
 Feb 2024 00:30:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127121937.2372098-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUJ0U9qnxtdJmVUJQqRhbmu0rmOxpyDZ8Lp=+hv=Oe4Og@mail.gmail.com> <20240212233836.GE1870743@ragnatech.se>
In-Reply-To: <20240212233836.GE1870743@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Feb 2024 09:29:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBYfi==T_EzbagJFVYkvYU=usEsru1T7Z=rBHFHt-CMg@mail.gmail.com>
Message-ID: <CAMuHMdXBYfi==T_EzbagJFVYkvYU=usEsru1T7Z=rBHFHt-CMg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: renesas: Document preferred compatible naming
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Feb 13, 2024 at 12:38=E2=80=AFAM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-02-12 20:36:12 +0100, Geert Uytterhoeven wrote:
> > On Sat, Jan 27, 2024 at 1:20=E2=80=AFPM Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > Compatibles can come in two formats. Either "vendor,ip-soc" or
> > > "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> > > policy and enforcing it for all new compatibles, except few existing
> > > patterns.
> > >
> > > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> > > ---
> > > * Changes since v1
> > > - Split the "SoC agnostic compatibles" section into two to make it's
> > >   intent clearer.
> > > - Improved the documentation for each group of compatibles.
> > > - Reduced the number of regexp to create a larger target area. As
> > >   suggested by Krzysztof the goal is not to validate each SoC name bu=
t
> > >   check for the correct order of SoC-IP.
> >
> > Thanks for the update!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml

> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      # Preferred naming style for compatibles of SoC components
> > > +      - pattern: "^renesas,emev2-[a-z0-9-]+$"
> > > +      - pattern: "^renesas,r(7s|8a|9a)[a-z0-9]+-[a-z0-9-]+$"
> > > +      - pattern: "^renesas,rcar-[a-z0-9-]+$"
> > > +      - pattern: "^renesas,rz[a-z0-9]*-[a-z0-9-]+$"
> > > +      - pattern: "^renesas,sh-[a-z0-9-]+$"
> > > +      - pattern: "^renesas,sh7[a-z0-9]+-[a-z0-9-]+$"
> >
> > I guess it's not worth adding rmobile and shmobile prefixes?
>
> Maybe we start with this and see how it goes?

Sure.

>
> >
> > > +      # Fixed legacy compatibles
> > > +      #
> > > +      # List cannot grow with new bindings.
> > > +      - enum:
> > > +          - renesas,bsc-r8a73a4
> > > +          - renesas,bsc-sh73a0
> > > +          - renesas,dbsc-r8a73a4
> > > +          - renesas,dbsc3-r8a7740
> > > +          - renesas,em-gio
> > > +          - renesas,em-sti
> > > +          - renesas,em-uart
> >
> > Perhaps combine these three: "renesas,em-(gpio|sti|usrt)"?
>
> Will do.

That does mean these lines need to use

  - pattern: "^renesas,em-(gpio|sti|uart)$"

right?

> > Now, how do I trigger violations?
> >
> > I added the following to a binding file:
> >
> >           - enum:
> >               - renesas,bogus-r8a7778
> >               - renesas,bogus-r8a7779
> >           - const: renesas,bogus
> >
> > but nothing happened with "make dt_binding_check".
> >
> > I added the following to a DTS file:
> >
> >         compatible =3D "renesas,bogus-r8a7778", "renesas,bogus";
> >
> > again, nothing happened with "make dtbs_check".
> >
> > What am I missing?
>
> Hum, this is odd. I have confirmed your finding that
>
>     compatible =3D "renesas,bogus-r8a7778", "renesas,bogus";
>
> or
>
>     compatible =3D "renesas,bogus-r8a7778", "renesas,bogus-bar";
>
> Do not trigger an issue, but a single compatible,
>
>     compatible =3D "renesas,bogus-r8a7778";
>
> Do trigger.
>
> I tested this before I reduced the regexp and IIRC it worked as expected
> for the RFC. Not sure if I have updated dt-schema since, but I know I
> rebased the branch for v2. I will try to figure out what have gone
> wrong, if anyone know if something changed in this area pleas let me
> know.

Thanks for confirming, and for looking into this!

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

