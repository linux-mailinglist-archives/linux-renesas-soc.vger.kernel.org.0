Return-Path: <linux-renesas-soc+bounces-6719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C43B9161D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 11:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FB091F2588D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 09:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9032B1487D8;
	Tue, 25 Jun 2024 09:02:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463FD13B5B9;
	Tue, 25 Jun 2024 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719306153; cv=none; b=BxDy66AoNjMETy9yx875v3O4y1blLjoJMA0qwwq0jszKMQ4+PIyoMVpXbp/joqMUkaWpr32nRqVFkN4PfBE/ZtyPN+yqpY2xVt0PQXTeHpBqMk8feHn8DFZM6NqPE1RU3pTSY9jFrkbuEPCg5l5t1CTXRRz9edYbZBvd8/XmFz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719306153; c=relaxed/simple;
	bh=ASZ8xOSjjqC+LhheUMjLPYNKajs/uctV6iGDq7+TGxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBhmomPPzcE8PVkWx9GDfg9llG5+LJ0vlyHhBzuuCe+MNQeDvF8CxyoQiF5GA9fW0jTenRF57dIJBrPShHAFn5u/Dvoqfket5FkiP9OPwM4sZGgd6tMbznaushC5I3X3ItAR00KpTOh0g+cChh++zdezkKptYn8xqq+gf0s3OXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-643acefd1afso23055097b3.2;
        Tue, 25 Jun 2024 02:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719306149; x=1719910949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIzRRfzG616FLF9ULAjDP/LqW5dqR/4YxaSzimcvAZ8=;
        b=gmHFlL+5vO1aV1wT2D9ZiMlYVDplp3q+vll/L97Mx8j8L5X1bGR9ufkt+xeHvWcyFa
         8ZftiYQPDjl6Gx28C7AFj3Gou9N3Tg/ZxNlg3jJV1TaMRYR4oqS7h+sRbT/3RfYJb7hC
         OJky7pCNfhgb+SZLO5wseETMiYF+bBr2R0ZmSGL5LtvLrHyWa6DQZgc7t4XkCesAldZr
         SldWAhpHBfobZoB3hpbEK4HL7r05KPs3BFnJpDqOh+3NXE+L08Ew+ZRp94GkVbiIjOF2
         AIZ5cw77o1yFDMatS2s3AVB3sjcBrkotuWT4rWq3wSKdZs6dU8eK4OI7x0GQa0MN17K2
         ZpJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcWGjoeQ+wut22qEWsF6QWH09kue8GEBn8zWu88EB1090l20gPcW5oW0Y7rpbwwE23grq7c7xWFKUwP0RTHcCj6oiplMvH7H6l9yo1f5APiNoO5QuER71IphYcxQo9gjJc4K6k/YVwYoDznch/+RJrIPwgHoRz4Gb+rCxRULQJpErC2ppA8pjGgTjDkzmhW0JfCz1cx/ae/2fxxu0uFpjiB+hBYmDl
X-Gm-Message-State: AOJu0YxauWseDfu6FVJd77HIfOZfEHbg7Jaiqi8Q8LzLPICxH9V56PfH
	UcUOMedJJXBjePh8tFFAC9MaYZEwUz8Yfx3cKZXP/rUedMl5A/MKRH5lhgVJ
X-Google-Smtp-Source: AGHT+IFja/+t+hqqgYPMOtipvErUAJlB78kWbLOsnCpsPIEWfYBUW30qmuW/6cw+KKa4wE9I8/8jyQ==
X-Received: by 2002:a05:690c:729:b0:643:50c3:ce1b with SMTP id 00721157ae682-64350c3d6d6mr62345647b3.4.1719306148570;
        Tue, 25 Jun 2024 02:02:28 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f1107db11sm34223017b3.6.2024.06.25.02.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 02:02:28 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfe81d54db9so4873769276.2;
        Tue, 25 Jun 2024 02:02:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWL4hDOZRnQyKBEzxqG5GmdPS95MpgDTur/QKREN6xQv81u2TzFYO2eFLq2WxV4fQWgqewRWM1KNwBrbgk3WaNsGlDMy1gE092GNm8LdckBh7KcIcquQnK8DQIWSakZexWX5MuOd5ouBI8eubhlvN7/ZeCQcj75bE4u5ips8bw+Qi5HDUvaofzqJOCHvvaQX+Q8yDB0q76QlI6uqfulFNGGAVUxBFnc
X-Received: by 2002:a25:bf89:0:b0:dff:2f48:5a85 with SMTP id
 3f1490d57ef6-e0300f50333mr6792788276.8.1719306147744; Tue, 25 Jun 2024
 02:02:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU0r+B_Jmh7E6sopRbfzzX7DtZKpY=Xte2vLDC-ORwdVA@mail.gmail.com> <CA+V-a8uhb1Visg9jUV-Te3ZHkfdRonM08s823RYa6k=KAHYgQw@mail.gmail.com>
In-Reply-To: <CA+V-a8uhb1Visg9jUV-Te3ZHkfdRonM08s823RYa6k=KAHYgQw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jun 2024 11:02:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkcJFv3JRUSpgEd4_zTd9dxD9e96JjxSco4tNU-rv6wA@mail.gmail.com>
Message-ID: <CAMuHMdUkcJFv3JRUSpgEd4_zTd9dxD9e96JjxSco4tNU-rv6wA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Jun 25, 2024 at 10:47=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Jun 25, 2024 at 7:57=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, Jun 24, 2024 at 5:33=E2=80=AFPM Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to tha=
t
> > > of the R-Car Gen3, but it has some differences:
> > > - HS400 is not supported.
> > > - It supports the SD_IOVS bit to control the IO voltage level.
> > > - It supports fixed address mode.
> > >
> > > To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g=
057'
> > > compatible string is added.
> > >
> > > A 'vqmmc-regulator' object is introduced to handle the power enable (=
PWEN)
> > > and voltage level switching for the SD/MMC.
> > >
> > > Additionally, the 'renesas,sdhi-use-internal-regulator' flag is intro=
duced
> > > to indicate that an internal regulator is used instead of a
> > > GPIO-controlled regulator. This flag will help configure the internal
> > > regulator and avoid special handling when GPIO is used for voltage
> > > regulation instead of the SD_(IOVS/PWEN) pins.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v2->v3
> > > - Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
> > > - Added regulator-compatible property for vqmmc-regulator
> > > - Added 'renesas,sdhi-use-internal-regulator' property
> >
> > Thanks for the update!
> >
> > > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > @@ -204,6 +207,31 @@ allOf:
> > >          sectioned off to be run by a separate second clock source to=
 allow
> > >          the main core clock to be turned off to save power.
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,sdhi-r9a09g057
> > > +    then:
> > > +      properties:
> > > +        renesas,sdhi-use-internal-regulator:
> > > +          $ref: /schemas/types.yaml#/definitions/flag
> > > +          description:
> > > +            Flag to indicate internal regulator is being used instea=
d of GPIO regulator.
> >
> > Do you really need this?
> For cases where the status is okay for the regulator but still the
> user has phandle for the GPIO regulator or shall I drop this case?

I think that case can be ignored.
The regulator subnode would be disabled by default in the .dtsi, right?

> > The status of the regulator subnode already indicates this.
> You mean to use of_device_is_available() ?

Exactly. I.e. only register the regulator when it is enabled.

> > > +
> > > +        vqmmc-regulator:
> > > +          type: object
> > > +          description: VQMMC SD regulator
> > > +          $ref: /schemas/regulator/regulator.yaml#
> > > +          unevaluatedProperties: false
> > > +
> > > +          properties:
> > > +            regulator-compatible:
> > > +              pattern: "^vqmmc-r9a09g057-regulator"
> > > +
> > > +      required:
> > > +        - vqmmc-regulator
> >
> > I'm not 100% sure this works correctly: does the checker complain if
> > a required subnode is disabled? Note that I haven't checked that.
> >
> Here is the experiment which I tried and the checker didnt complain,
>
> &sdhi1 {
>     status =3D "okay";
> };
>
> &vqmmc_sdhi1 {
>     status =3D "disabled";
> };

OK, thanks for checking!

> But the above is still a valid case where the user wants to use a GPIO
> regulator?

Yes it is.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

