Return-Path: <linux-renesas-soc+bounces-6531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD659100F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 12:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E8671C20FE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 10:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611F41A8C0D;
	Thu, 20 Jun 2024 10:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h52Acn9m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42CF1A4F2D;
	Thu, 20 Jun 2024 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718877603; cv=none; b=aYuQXv0fFDuvzREfccQTRt8LhRt4JqRHnGLPH9bLK9wvEAH52E6XED/QQoOUfda0opk1vfLXjnZQOIB3N6M/7mnUSfAkYN+h1MCrswJjpk/LmSKw0dPZYRvJ1Kds8sG+YxwPZ5wNNPzBkz0+H0LgXXUkiWhbsMfCglIZRm1N77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718877603; c=relaxed/simple;
	bh=/iZzAiTQ5UNxV0/HtKdwOhMREms4rHsGBjYD5hM252w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FjuZQkG8VgZZbjXXajW1279BtazYbBhntRbcRoEvnTML8F1ChUeXi6N6XeoaySWsgm4m3A2XK7YKsVNGjsLOuov45+r3q9kNYGWykVMHREktOpeKnda+jtbb9nspBRXTDlIkS7LCF3A1Ckyi6EiOa/Oj+WqG8akwWA4u6hegW3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h52Acn9m; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e02bda4aba3so702959276.3;
        Thu, 20 Jun 2024 03:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718877601; x=1719482401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iZzAiTQ5UNxV0/HtKdwOhMREms4rHsGBjYD5hM252w=;
        b=h52Acn9mwzjaU7kooJFt10M1SNBBKkndEx68W13FJ+6Sj6nx3ZeXtUyknIzN0cVYdA
         7xvRK3cQE6uDe2mvYeNx3wYtiOdlrC7tnOnAZ4m3oFu+2ekVtmXAZW5VRj4HMel+7IB6
         M7M5kmFzCRWZS4f/QLpBK1Cd3wJjkLJrSBygAQb+U+vjCmFTYC4JwaksOJ4nz/lI/AnO
         40ntvL6R50PkuqpBENNKn1YU564KEtPy6Fdjqx/6UJhUuPI/ZdPZiC1u4hBpmlXSZlMF
         bYw0kpA42FgubIj0dNeT+Z2iZOa/IkIZo2RdV4mmiRYtTAmyYuyMaoui4lJQ3FXNk5vO
         fglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718877601; x=1719482401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iZzAiTQ5UNxV0/HtKdwOhMREms4rHsGBjYD5hM252w=;
        b=UadjrwNNCTDoOVZXPbQdP4lSAOWfX2y3DOy7FWLtLJLcHN2WdAve1/CvWX5q1x8GQI
         aEY3W5zsUXkDYPtVFIYwUD+ruuCl/LQxZhmvjCBRvGIHXQVzz5nC1NJy/bw5hJPWGwBZ
         2efR/PdIKsQEp7buaTKRs8A+CCOm3I/j6mu5i1UqnUgrxZ5Osn0fJJl7y4g8y+19jwpJ
         tzUJQ6HqTpkRAdK5xF+WVwHHy7WGS5hVa/einOkWZlqRFTFgMwIIq+mthnMkeRsVqXnC
         WpLvgTSgvHqDfKikswG6T4WpeSIh6lDyQI/MUciwoIpbWgHBbLLUcyQpWh2b7LghcmV2
         vRWw==
X-Forwarded-Encrypted: i=1; AJvYcCVVWdjfsrp4wLoVn/SCih11E7ljtMap3Ic7pmJLWdCHPQgK1ElPa148Y6CJXiWRY22FdPzXHIJ4Bjd5mAht4TiZgk0NkTi+TJZuqGXQOozt3mwmi/0aLDqkMIQsf6GDXNUBmNGF9TmJwHqz+HtlX5ccBaF4lZ4g2SmxlWJ5LtUc/sErRFBrZpbLFueJwtI4/JIxGexykJgk4/cqF8xiTUPE/F6RJRvo
X-Gm-Message-State: AOJu0YyfR0nwNwJmy9QuzhCAjSnf15xlV2UghoEeYlLuFMRbL65J+c7A
	bzlzPfvDwPBeKDkigRdDeo5JRBEO6Biw83TLd88V2o0m7sUI9/C0eeMFMtBLlxRQ9qyuPXGeru0
	zCyvUbDo9FLySdK3UWn4wz1C5Now=
X-Google-Smtp-Source: AGHT+IE/souHVrwkNI4H0SszQxPS242fjmLmxDj1CUeCpa2GYkt+I5sMR/FDRRdD3aYX9PRPh+0ikGTF07PKZIxciXM=
X-Received: by 2002:a25:dc51:0:b0:dff:2bae:a0f7 with SMTP id
 3f1490d57ef6-e02be20b9c1mr4819358276.47.1718877600660; Thu, 20 Jun 2024
 03:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <prdvmtsp35yy2naohivbrya3go6vh5ji2cdjoebw3ovditcujo@bhck6tca6mhj>
 <CA+V-a8u6KAFp1pox+emszjCHqvNRYrkOPpsv5XBdkAVJQMxjmA@mail.gmail.com>
 <o7tswznmyk6gxoqfqvbvzxdndvf5ggkyc54nwafypquxjlvdrv@3ncwl5i5wyy3>
 <TY3PR01MB113467E6EF1CFC24154AF73E986C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8s-fCtQ8GKVh_REkPO81v0oCKPGiLJ5aiJOVdVUbvbCzA@mail.gmail.com> <TY3PR01MB1134652A77AFEED63DDEF034886C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134652A77AFEED63DDEF034886C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Jun 2024 10:59:18 +0100
Message-ID: <CA+V-a8thqzvbPf53UnjejN4xO4miXShs5NeHJnsrvngmTUXnUw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Jun 20, 2024 at 10:49=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V=
2H(P) SoC
> >
> > Hi Biju,
> >
> > On Thu, Jun 20, 2024 at 10:30=E2=80=AFAM Biju Das <biju.das.jz@bp.renes=
as.com> wrote:
> > >
> > > Hi Wolfram, Prabhakar,
> > >
> > > > -----Original Message-----
> > > > From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > Sent: Thursday, June 20, 2024 8:40 AM
> > > > Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for
> > > > RZ/V2H(P) SoC
> > > >
> > > > Hi Prabhakar,
> > > >
> > > > > I did give it a try with platform_driver_probe() and failed.
> > > >
> > > > Ok, thanks for trying nonetheless!
> > > >
> > > > > - Firstly I had to move the regulator node outside the SDHI node
> > > > > for
> > > > > platform_driver_probe() to succeed or else it failed with -ENODEV
> > > > > (at
> > > > > https://elixir.bootlin.com/linux/latest/source/drivers/base/platf=
o
> > > > > rm.c
> > > > > #L953)
> > > >
> > > > This makes sense to me because it is just a "regular" regulator.
> > > >
> > > > > - In Renesas SoCs we have multiple instances of SDHI, the problem
> > > > > being for each instance we are calling platform_driver_probe().
> > > > > Which causes a problem as the regulator node will use the first d=
evice.
> > > >
> > > > I see... we would need a reg property to differentiate between the
> > > > internal regulators but that is already used by the parent SDHI nod=
e.
> > > >
> > > > Okay, so let's scrap that idea. However, we need to ensure that we
> > > > can still have an external regulator. Seeing the bindings, it looks
> > > > like you enable the internal regulator with the "vqmmc- r9a09g057-r=
egulator"
> > > > property? I wonder now if we can simplify this to an
> > > > "use-internal-regulator" property because we have 'compatible' alre=
ady to differentiate? Needs
> > advice from DT maintainers, probably.
> > >
> > > Why this cannot be modelled as a regular "regulator" as a child devic=
e of SDHI device?
> > >
> > The current implementation does implement the regulator as a child devi=
ce of the sdhi node [0]
> > itself.
> >
> > Wolfram was suggesting to have the regulator outside and use platform_d=
river_probe(), which caused
> > an issue as mentioned above.
>
> You, mean standalone node with a device compatible for each SDHI device n=
odes(Assuming 3 sdhi devices)?
>
Yep.

> 3 SDHI devices nodes(stand alone) + 3 regulator device nodes (stand alone=
) ?
>
This one (since as per the HW we have three SDHI instances and 3
internal regulators) so we need to describe the same in DT.

Cheers,
Prabhakar

