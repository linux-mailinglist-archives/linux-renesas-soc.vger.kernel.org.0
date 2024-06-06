Return-Path: <linux-renesas-soc+bounces-5908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A91398FE253
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 11:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32EBF1F23822
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 09:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4A613E054;
	Thu,  6 Jun 2024 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPXw5OTu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B113E035;
	Thu,  6 Jun 2024 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717665154; cv=none; b=ZG1TxfBw6fLOwwoFi5KkrVEmLbQyiaqj0AK0ZU8Sop9ehbYV0AqySYZDqFdmQBQQ2FuFnWvXE8kPXcNhUBe5QMwU1gz4U4J8cWpbs95J1ox+Ll5CVisf424U9kxCG9Muu9lEts0ukkz2vpMj5EF4pyS6KbjlrefZx816XMNSz+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717665154; c=relaxed/simple;
	bh=dDDQHCIrnaIoKGZa+oQXHQxgs/K97cc3WjBuqeuiQwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7OokNALBXTbZJb8AqEaYmpG/10ptlx8C76vjTZW9k1tPZX+CZUslu26faG+KlH1IHs8wFcoR30q2fAv9oGVi8Rvqgeys09ataftAB8BmrNMxZLCUl8M8R26bY8+FNM5p9u/ya1TrFkKBVtwzzMYuyVy+brof8+Wzl4773bFlyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPXw5OTu; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4eb0f868f2aso236185e0c.3;
        Thu, 06 Jun 2024 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717665152; x=1718269952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vs1gSr2gcN7YL6jwC97RJ5EF+Tcm7IMeKJzckbTjqSY=;
        b=lPXw5OTuhYRFzEFz4L+CLKv+Pc/rOd1O6uQZOQCbzOcRkU0B0JSiLR+fXMwwEgD/Sk
         BrVqVUHX3NISeMQbJijMPtOTDBrC1BS/OUvILnDeXRxsshb9qS8uOs96s3aLGto8stlF
         sQY8u8deyltpIXG2AXXmaxt3HiY3i28aFONE1wygi2KG7hikJ/zjWmrqveiRrVP9M9s+
         rcf8yAdvohy8XaS1MJgqqS8Z28HXobzzVj+nfnI5mNlepSaW7BOPFSO/h/bpJKGjMrD9
         eOtDYxGZA1WepdlyyqlKjbpp6WeaeSGWaP0LcI4ilx2taDLzdSVwT4nSUs9KSIFzEd4u
         SGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665152; x=1718269952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vs1gSr2gcN7YL6jwC97RJ5EF+Tcm7IMeKJzckbTjqSY=;
        b=DSY5C5lp20SHloPPmp323TEJmp8QppbUY5dizOJcktJv+g4PUtEK7b8UtgiVxlSQpA
         Gz2WaxLiee4u+QbQRzk5k5K0Tm2zSVJXnIQ8kkCgkDN/TPP9ezmilQZ8ZSar+yj3IsAc
         QFWW8j4Y1CipPK/YCBy7k0xn8/h85kJ9C+yEmne8g3u1Zu00mfcp3GsQl7W+gMo/GWk/
         5la0rUkD5RP8GwOrsSBOLBqrYglMKCGK2RrsBi4kgDcbkGlohodgZPgRwgz3Felxsb+u
         r1AsMCJjOGfLXmGxqC68nL9YfliaR5MbDihUpOrXXg/VTGVNe0smmLoMQb+iwvu6ZZPN
         MLtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFl5ShbDgXftkh5SXSJAm1MitMgofaQaHwbY7ASQEQ1a7+V9SmyFx1Imopdzx+AKYTEzvvdskXR5s87sD6XL/ERs/t2MYZA4TSEA/FWliqRuCpOjr9RMrKAjqXBHxSlEFkxCBDVuFlcrh1KNQzUxs44QACGVdoLxgeorIl1m++Gox/EuBrkjPTSo46tezSg2KywJjlPWtWzpB5TbLihNLewgLIIjDt
X-Gm-Message-State: AOJu0YyYr8yBbYkhjFFJir9JkxqViPihn78YIQkvCiE+YdW+E8aiksKI
	K0k/1uCxr+zO+rLuXowLse+rWXzTjKZuFBKw2EnmvW7IKzZ2G4LJ7S1d5D76Y3tmeEHiynDsH8v
	VHlefYJRgEm+vJ1dvVaabgHYWxhnV4cP+KDU=
X-Google-Smtp-Source: AGHT+IG6BUnn1y4MUOJo2gc/O5wv9uayuAPG+KzNpfzr4zp44qmS1XtofTE0NECtPIE2+zk2Ox/c35WimSINB+0ZOKI=
X-Received: by 2002:a05:6122:a0a:b0:4e9:7e39:cc9f with SMTP id
 71dfb90a1353d-4eb3a4a95c3mr6295283e0c.11.1717665150553; Thu, 06 Jun 2024
 02:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240606002646.GA3509352-robh@kernel.org>
In-Reply-To: <20240606002646.GA3509352-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Jun 2024 10:12:04 +0100
Message-ID: <CA+V-a8vX5cop1m40mz6ENy=dDcVBniy39mf2tb0erOQJokb+og@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] dt-bindings: mmc: renesas,sdhi: Document
 RZ/V2H(P) support
To: Rob Herring <robh@kernel.org>
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

Hi Rob,

Thank you for the review.

On Thu, Jun 6, 2024 at 1:26=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jun 05, 2024 at 08:49:35AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
> > of the R-Car Gen3, but it has some differences:
> > - HS400 is not supported.
> > - It supports the SD_IOVS bit to control the IO voltage level.
> > - It supports fixed address mode.
> >
> > To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g05=
7'
> > compatible string is added.
> >
> > A "vqmmc-r9a09g057-regulator" regulator object is added to handle the
> > voltage level switch of the SD/MMC pins.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 20 ++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/=
Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > index 3d0e61e59856..154f5767cf03 100644
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
> > @@ -204,6 +207,21 @@ allOf:
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
> > +        vqmmc-r9a09g057-regulator:
>
> The node is already conditional on the compatible, so why the chip name?
> Then it doesn't work when the 2nd chip needs this.
>
Are you suggesting to use a generic name "vqmmc-regulator"?

Currently depending on the compat value "vqmmc-r9a09g057-regulator" in
the driver the corresponding OF data is populated. In future if a
different chip needs a regulator which varies slightly to the
r9a09g057 chip this will have to have a different OF data. Hence I
added the chip name in the regulator.

Cheers,
Prabhakar

