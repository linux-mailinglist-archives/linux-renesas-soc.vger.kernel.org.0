Return-Path: <linux-renesas-soc+bounces-6177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E41907D24
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 22:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B60B282B67
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 20:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C966A12FB09;
	Thu, 13 Jun 2024 20:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlEuq7k7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9571657C8D;
	Thu, 13 Jun 2024 20:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718309218; cv=none; b=t9IDmMw9zFJEklXjxl6W4GlGnFR+B8uHAAHZn0R4dkx5p/qFQRXbosN0cU3wAA0bk8vCaWA1x+moEc+OxX/qXS9Mqki+PhnQXKoZ75aj/u6fgU68Z10oEKccmB5mulp5g9tdAOZvQAhH3nuuwSSnmD///iz+wX1Uwv4j6Ovzhss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718309218; c=relaxed/simple;
	bh=k7uhUnd2YjV9SjYh5H4FEETcIbU38E9IRN7qo9tzQak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohPbWdsKRmH8cqvbKD2jwGOixTeOZtYNNn3yuNCbbEKM9O2T3iu6rs7jK8jyETQX7NBLJdEVyutTdJdvxp7FA8U/ENbtseckfGiYoaehU1VUvt55Is3fh+in6NGidkY0JBsMxBopwOhB/QFt0uhA17R0y58ddnWXius5CerfRsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlEuq7k7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8A1C4AF1D;
	Thu, 13 Jun 2024 20:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718309218;
	bh=k7uhUnd2YjV9SjYh5H4FEETcIbU38E9IRN7qo9tzQak=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DlEuq7k7xrWfF+/uNxHPvjM8TTeMBhwxJQ8nyfU7Qt4wrrLUOPT8f7o2SJUbi+lXW
	 umpOfL7+joOMEVeowV2j/m+wTJmeSdBV9zubEgsL9wLZxaJJPPIF84ttDeorkEWHHh
	 oakBQMHx+ZsgzZRPETNoukfAl/W+MX7QonMTUtKHkU9QhoTEy7/+e3AJUMxHfGgBID
	 oX8qBbkBFZG0R4awJ9Gczy0UGewwkhvTqZsjwv1oQc6N6WbUwg+180FaME/yKmIh2u
	 3igJcS9QrhVLvmDvQ0DhrIO1E150txoTgq2NoCGlF6E2mMnVVd3ChnFQwxCVlu5Bcn
	 a0psAPDI0+Aeg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ebe785b234so13847661fa.1;
        Thu, 13 Jun 2024 13:06:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyETfAYDEsJr879ZJqipkOGD6JggVww8VXcOT3tQv2gYpitVeJ2IZr93VHoXUn9CjDCI156OomVXG9DbR2neN3AOxdUTYZ+ZuglL654LW0cZcUQJnY821Ejh98mYrUm6eM06nHU4W78M0kRXJ1AlIynnMe/hx/SwQMz9tC4OI5/FkFhqhcqiw5ktkACJwpbEbgDeyIAbOU7/4W/HJu9JZVclELpxKA
X-Gm-Message-State: AOJu0YzgSc349G/OamnWNNY/ZmjOgTnERRbnTc/+oJVnOt52ZAbIoVV0
	3rdX590FuF+2xhHobKcSgveZZjozzoDb6YIM275Xw3E+hD9H9X4kAePYbOxjQc/piP4cc8jzmgO
	PHMZr7bg31Xj9ySoNiz2vvMHUQw==
X-Google-Smtp-Source: AGHT+IFsTzkTtOjxqfkBNekUNSpBS4UpU4fzi8jxmSPav4ifHXSAVrkwliOQ59BFj0yros0YUN2epLKBg7Nd0rOUY60=
X-Received: by 2002:a2e:9dda:0:b0:2e1:2169:a5cc with SMTP id
 38308e7fff4ca-2ec0e46d9e8mr5397851fa.15.1718309216375; Thu, 13 Jun 2024
 13:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240606002646.GA3509352-robh@kernel.org> <CA+V-a8vX5cop1m40mz6ENy=dDcVBniy39mf2tb0erOQJokb+og@mail.gmail.com>
In-Reply-To: <CA+V-a8vX5cop1m40mz6ENy=dDcVBniy39mf2tb0erOQJokb+og@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 13 Jun 2024 14:06:43 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+P3myoPwEJu_TSi6zgSPhjg2QnB5x4hhMeEVGvh1ncyQ@mail.gmail.com>
Message-ID: <CAL_Jsq+P3myoPwEJu_TSi6zgSPhjg2QnB5x4hhMeEVGvh1ncyQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] dt-bindings: mmc: renesas,sdhi: Document
 RZ/V2H(P) support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 3:12=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Rob,
>
> Thank you for the review.
>
> On Thu, Jun 6, 2024 at 1:26=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
> >
> > On Wed, Jun 05, 2024 at 08:49:35AM +0100, Prabhakar wrote:
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
> > > A "vqmmc-r9a09g057-regulator" regulator object is added to handle the
> > > voltage level switch of the SD/MMC pins.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > >  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 20 +++++++++++++++++=
+-
> > >  1 file changed, 19 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml =
b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > index 3d0e61e59856..154f5767cf03 100644
> > > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >            - renesas,sdhi-r7s9210 # SH-Mobile AG5
> > >            - renesas,sdhi-r8a73a4 # R-Mobile APE6
> > >            - renesas,sdhi-r8a7740 # R-Mobile A1
> > > +          - renesas,sdhi-r9a09g057 # RZ/V2H(P)
> > >            - renesas,sdhi-sh73a0  # R-Mobile APE6
> > >        - items:
> > >            - enum:
> > > @@ -118,7 +119,9 @@ allOf:
> > >        properties:
> > >          compatible:
> > >            contains:
> > > -            const: renesas,rzg2l-sdhi
> > > +            enum:
> > > +              - renesas,sdhi-r9a09g057
> > > +              - renesas,rzg2l-sdhi
> > >      then:
> > >        properties:
> > >          clocks:
> > > @@ -204,6 +207,21 @@ allOf:
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
> > > +        vqmmc-r9a09g057-regulator:
> >
> > The node is already conditional on the compatible, so why the chip name=
?
> > Then it doesn't work when the 2nd chip needs this.
> >
> Are you suggesting to use a generic name "vqmmc-regulator"?


Yes, but "regulator-vqmmc" or just "regulator".

>
> Currently depending on the compat value "vqmmc-r9a09g057-regulator" in
> the driver the corresponding OF data is populated. In future if a
> different chip needs a regulator which varies slightly to the
> r9a09g057 chip this will have to have a different OF data. Hence I
> added the chip name in the regulator.

Yes, compatible values distinguish different chips, not node names.

Rob

