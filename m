Return-Path: <linux-renesas-soc+bounces-6722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D743B91622F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 11:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 075C11C21144
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 09:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBB61494C8;
	Tue, 25 Jun 2024 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XuyqlRbx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7FF49656;
	Tue, 25 Jun 2024 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719307173; cv=none; b=paCbu35EEDkIyE9rVduUS92YR8RnrCrgT3rzLQ0hdmQkYsysXuLdbHcxJunJAPeWIMe1wb+pWBzX7J4OFkzzzektQpVtm+0IZ30aXnsmnI3usqMew3PaUKhvgul9xOpiJ4m5bq4f5F07keOhFPLnJaz6eYBcwH2w4ZO/2oB3CVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719307173; c=relaxed/simple;
	bh=aGPVJbx0IRNRp7GfM3OyTXLbeNN3XX7hcCQatxJWnAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsrpg66lJlCcVAXMb9tIqyHoeSKl0LAD9xbVKk84NgijsbiMmBjQTO5VTggK9DF9aj0yJdL6jgc1r1QgGGWu+O4+YcId/fX9e2eAp7OOCPE1XUrBP3N+2p5SqA42/m14bpt34deXJHtivBeHBAOLc++Sk14OIqSxWkdvBMVfFwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XuyqlRbx; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4ef561f77eeso1183656e0c.0;
        Tue, 25 Jun 2024 02:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719307170; x=1719911970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfMzg+YAUQEHpywJnHYxN8X4b8BgXjU2WPrlmq2wzO0=;
        b=XuyqlRbxoA4ekbXntaR9+JS8805pC1QqJznytpuDKRS3ohZGGULxpHSF5IXqwrNiKe
         YayiPLmhzwwfkYp6agfSdu93rwYHtoHQN0r5C6katBMo0dcYHIcb1/yii5dudP1AcJTI
         cjYJUVzmMdcO9J2UgCgQbd6deMIwkbFa4zu5IzMrd+byVmrXDZHohzkbbEhf1dtYGWyl
         fwl76pYo+v9mY04ho+q/9V+rEMI5K0aXmExqofpVkWE1ehDG6ehW2eGM7AtzBvhejwVP
         gJwUoGWdOI2ZoCJhY01z5+buvZbtPgJT/5wKHu4Wq8GPjyVF6Xoq9Coq4rse2EtTG3TR
         qsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719307170; x=1719911970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfMzg+YAUQEHpywJnHYxN8X4b8BgXjU2WPrlmq2wzO0=;
        b=E0O0kUqIZKg/+H0NDydT6wj30INWeylj7YB+eEgXVptix38Q/KvGy61jRQpaTGUaHL
         3yrR6rhSJze2NRG7+uoXxPYekAaP44fQ4uPARycrj7Y2HOc8ujiywbG+onhU4109o1/F
         6DUxdndYcDQXiqm4EXFu7FJuGZZ3oOYFSfVW0QZC2pfbAfSDIGwYNM2Jr/hOdCF7XdT9
         zqQ9mxMzzdnq1BmcoLT/88qcj1+PKrLhAhu3aXPt83cy5+vzkTY6Xb0/X2FCjY8mohmX
         Dq5zoiM4vbuXWu/ioLwt+ijmvQFCY2DoVVUkzBgvPTbwXTC4jK3JBzd/OWpQMhNcKrMD
         ly1A==
X-Forwarded-Encrypted: i=1; AJvYcCXDug1Qi9XWiEFNE2bydkLAGGH4zKk1Jmq2RTokv2RrUVZN50mDevw8CwgFXs4cnLr0gYMzxJ+5sEZ+KoQgQWYv1tcLGCGHJ0mFtdlg2AKgpN1NVBUi2MEMOh8ZNKfjV+HjlCmrrOE71Jf6YV4wATdBgE0y8u6jZJMVwRg2LJJ4Z9byMsU/gLNocMrmPCw7Ey7uNdyfWC2exK+kOblDYsGppbeqUTz+
X-Gm-Message-State: AOJu0YwurnmdugX84TE5ScESGmXC+Xt2PlGiFC8RH/cpqui0YveTHQdv
	7FWDGPNHaR0AZWN8Olac2HwY3w/GRqnU+uO3Mdv/n85soZDcm3jJiXEMFgH83qjkYnostWxBtTd
	6E3Ll1yVQubMevQbt8NAe63anJPst3JRDAEQ=
X-Google-Smtp-Source: AGHT+IEJHDWH1Fae3/yN6gXmKBcHgNkPk//e7Gf28ESAA4YG8kyfSJzXoCeg0TUAJyoB85KPPd4xVZtf8fHKcaYqi60=
X-Received: by 2002:a05:6122:208a:b0:4ec:f7d0:e71c with SMTP id
 71dfb90a1353d-4ef6a5dd33emr5390804e0c.4.1719307169681; Tue, 25 Jun 2024
 02:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346BEEDB2125402E8A489E086D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346BEEDB2125402E8A489E086D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Jun 2024 10:19:02 +0100
Message-ID: <CA+V-a8vJdUCY4xBwm56C2A3w-gYOWo3MtoMMMfdcDwwsQWY4Gg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Jun 25, 2024 at 10:12=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Monday, June 24, 2024 4:32 PM
> > Subject: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H=
(P) support
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that =
of the R-Car Gen3, but it
> > has some differences:
> > - HS400 is not supported.
> > - It supports the SD_IOVS bit to control the IO voltage level.
> > - It supports fixed address mode.
> >
> > To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g05=
7'
> > compatible string is added.
> >
> > A 'vqmmc-regulator' object is introduced to handle the power enable (PW=
EN) and voltage level
> > switching for the SD/MMC.
> >
> > Additionally, the 'renesas,sdhi-use-internal-regulator' flag is introdu=
ced to indicate that an
> > internal regulator is used instead of a GPIO-controlled regulator. This=
 flag will help configure
> > the internal regulator and avoid special handling when GPIO is used for=
 voltage regulation instead
> > of the SD_(IOVS/PWEN) pins.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
> > - Added regulator-compatible property for vqmmc-regulator
> > - Added 'renesas,sdhi-use-internal-regulator' property
> >
> > v1->v2
> > - Moved vqmmc object in the if block
> > - Updated commit message
> > ---
> >  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 30 ++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > index 3d0e61e59856..20769434a422 100644
> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > @@ -18,6 +18,7 @@ properties:
> >            - renesas,sdhi-r7s9210 # SH-Mobile AG5
> >            - renesas,sdhi-r8a73a4 # R-Mobile APE6
> >            - renesas,sdhi-r8a7740 # R-Mobile A1
> > +          - renesas,sdhi-r9a09g057 # RZ/V2H(P)
> >            - renesas,sdhi-sh73a0  # R-Mobile APE6
> >        - items:
> >            - enum:
> > @@ -118,7 +119,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: renesas,rzg2l-sdhi
> > +            enum:
> > +              - renesas,sdhi-r9a09g057
> > +              - renesas,rzg2l-sdhi
> >      then:
> >        properties:
> >          clocks:
> > @@ -204,6 +207,31 @@ allOf:
> >          sectioned off to be run by a separate second clock source to a=
llow
> >          the main core clock to be turned off to save power.
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,sdhi-r9a09g057
> > +    then:
> > +      properties:
> > +        renesas,sdhi-use-internal-regulator:
> > +          $ref: /schemas/types.yaml#/definitions/flag
> > +          description:
> > +            Flag to indicate internal regulator is being used instead =
of GPIO regulator.
> > +
> > +        vqmmc-regulator:
> > +          type: object
> > +          description: VQMMC SD regulator
> > +          $ref: /schemas/regulator/regulator.yaml#
> > +          unevaluatedProperties: false
> > +
> > +          properties:
> > +            regulator-compatible:
> > +              pattern: "^vqmmc-r9a09g057-regulator"
> > +
> > +      required:
> > +        - vqmmc-regulator
>
> Maybe we can drop required to make it optional, so that one has the
> option to select between { vqmmc-regulator, gpio regulator}??
>
I think making the regulator node optional isn't correct here as this
internal regulator is always present in the SoC and this has to be
described in the DT no matter if it's being used or not.

Users can always switch between internal regulator and GPIO regulator.
I have provided an example here [0] for both the cases.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/2024062415=
3229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

