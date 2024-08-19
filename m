Return-Path: <linux-renesas-soc+bounces-7902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E02F956C9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 16:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF3F1F239AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 14:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C734616C86A;
	Mon, 19 Aug 2024 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvBDv6bT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A12F16C857;
	Mon, 19 Aug 2024 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724076141; cv=none; b=HkmpFIZ7OG8P0/4xSz4+4yWyG2KLeMfGFbgAe3h4gsKsOgNVp8RwseZRqHfo0Mgi8hIUVcsg27pPjxevZG2Jp3J1WxvVTHRiMkUEJoDa7c7gWaQOvUFvu/6aT566z/43kha+BUAw1OZEP3EUGLHGo+1/NqkDSX+cy31HW6LAMIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724076141; c=relaxed/simple;
	bh=wJq+/oTJd3U73muV/YqAysaynAZF/3PbjjgDaVnNlIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ez76NgywAb3CoAGabGeNSQli5/99kYARJPZttBmNcHu7skFjCsKQYTM2h6IHDmIpRTNRk8LbqsLwIVEb1PYHFCop0AC/RMk6M/RG04Oz8A61e/ayNW2O5pOhJPzKENjNw/ms1PcSZmfsY7OeX/CB238yKyEW0uO3vFeFIzL/f/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvBDv6bT; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a1e31bc1efso283870785a.3;
        Mon, 19 Aug 2024 07:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724076139; x=1724680939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmRjqnwnkFNeq8AIY1pnvOXUvrNwL/Khx3jg3s6Lcto=;
        b=TvBDv6bTqPboE53VH3/kejzLUG0zoHFYdbM+Mpq1aBZDffyNnmmEAFQAvtryRHi2OP
         VR3S79Xy4eWgJ8JV2GYJJHWpx0/W0rd6NXK6bmceAPi+X9qnKDddEi+wcuK5CQFGwD0D
         xwJbD4JiZfmbJhGxpvpx+KzUREfzHXDV/QTZzU5RKyAKjppYSpkUmOtPlcfFu68iJ40T
         3iu/IB5Yf29nr6uUAQkfo2vrnaBfBts/DglSX4kic3/bYINP9ymIUVSk7lfnU21xpCLY
         aFLuzdKJcUlB3YWctY0MZsCYHnkzWxNl8Cg5M1xLUl81E5M7PXXhhUG+/rLCxsZ0T0eY
         LYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724076139; x=1724680939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmRjqnwnkFNeq8AIY1pnvOXUvrNwL/Khx3jg3s6Lcto=;
        b=YLlwmEvzIGdlakzNGqGfC8kgtGapIpmtC6g9cAnI4ETypInZw7gscOOROMvgDRd/DM
         5eiKPJctdnEMuauPahT8tqWQGQVZeVewJOIe7lQB/uVaqPxgLKMCm9P0+454ng00Jj3S
         i/byvMaGIDT1tMG3mBMwU1UhnjFpkAdmmxiivw+Ruv9SVE417M5jrkEp4wQPFDkW11/z
         PXEB5L7ktgQQJlUmJVkgkyEpLcaZ0jQqTVSFORQ2M28MrXc1bxvYpJVwHe4nWTmPsv7E
         fszVbyxdg2+VMnS3cz36UPO30leVX7jAOVkS/grdQvZX2lx/nP79zcbStBNyd9fjrPpx
         ggWw==
X-Forwarded-Encrypted: i=1; AJvYcCVhgxQcFfP8uYT0K0X948mn0SvFubSq3upCvJWUuiBz4Yjbxy/M+729b9RH+bZsnRSsMyxaVKz/X9gm/UpoEw06ZUlHYEvIjW0mYtZe2oBfmnvZ4ddTPCFDomdt3+69+w7QFnwL2+VgThWBcScgXpy855kRM/sMiyi5KPYtu5TrgkMYuhZnkwxR/KvA
X-Gm-Message-State: AOJu0YxpsYuKA7MLAcMJaBoAG+mYn/eBtbG7kRZrTzxUpOR0koQLYUHD
	tiaET1ZKysbBtJOSu2igTPsP9qACjJCcGxWJBtoan9PmI+Rc3bz8OIhXyRmAvyBr7n/GbeMYGeS
	ZLvld3esHpSUIeYMph1WwNQJZAqwgGdkC
X-Google-Smtp-Source: AGHT+IGn4KfgQp4Jfyu+GvOPXdC+V+OEzLbqPwvEmPXwNGCdcvSKrtHa3NmhvV4KSV2GNcyr7vAJATKyFxw1rOIBkwk=
X-Received: by 2002:a05:620a:800f:b0:7a6:62cc:d325 with SMTP id
 af79cd13be357-7a662ccd34fmr157000185a.15.1724076138836; Mon, 19 Aug 2024
 07:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240811204955.270231-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346E95ED1171818488EFEFA86852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sR1Lu1FYMQbDXzzi19ShF-RLkwirF-51aWp1bjwG8LXw@mail.gmail.com> <CAMuHMdUw7ZLvtbmTN=g-Xh3RLWSVH3U0VpbehREyNcYypHnDsQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUw7ZLvtbmTN=g-Xh3RLWSVH3U0VpbehREyNcYypHnDsQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 19 Aug 2024 15:01:52 +0100
Message-ID: <CA+V-a8sZM3tJhPBT_pCQZYZ3vNjWwxHutZxTiyyySuL+=aBZug@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Aug 19, 2024 at 2:58=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Aug 12, 2024 at 2:32=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Aug 12, 2024 at 1:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > > -----Original Message-----
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: Sunday, August 11, 2024 9:50 PM
> > > > Subject: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WD=
T3 nodes
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add WDT0-WDT3 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v1->v2
> > > > - New patch
> > > > ---
> > > >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 44 ++++++++++++++++++=
++++
> > > >  1 file changed, 44 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm6=
4/boot/dts/renesas/r9a09g057.dtsi
> > > > index 435b1f4e7d38..7f4e8ad9b0a5 100644
> > > > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > @@ -184,6 +184,17 @@ scif: serial@11c01400 {
> > > >                       status =3D "disabled";
> > > >               };
> > > >
> > > > +             wdt0: watchdog@11c00400 {
> > > > +                     compatible =3D "renesas,r9a09g057-wdt";
> > > > +                     reg =3D <0 0x11c00400 0 0x400>;
> > > > +                     clocks =3D <&cpg CPG_MOD 75>,
> > > > +                              <&cpg CPG_MOD 76>;
> > > > +                     clock-names =3D "pclk", "oscclk";
> > > > +                     resets =3D <&cpg 117>;
> > > > +                     power-domains =3D <&cpg>;
> > > > +                     status =3D "disabled";
> > > > +             };
> > > > +
> > > >               ostm4: timer@12c00000 {
> > > >                       compatible =3D "renesas,r9a09g057-ostm", "ren=
esas,ostm";
> > > >                       reg =3D <0x0 0x12c00000 0x0 0x1000>;
> > > > @@ -224,6 +235,28 @@ ostm7: timer@12c03000 {
> > > >                       status =3D "disabled";
> > > >               };
> > > >
> > > > +             wdt2: watchdog@13000000 {
> > > > +                     compatible =3D "renesas,r9a09g057-wdt";
> > > > +                     reg =3D <0 0x13000000 0 0x400>;
> > > > +                     clocks =3D <&cpg CPG_MOD 79>,
> > > > +                              <&cpg CPG_MOD 80>;
> > > > +                     clock-names =3D "pclk", "oscclk";
> > > > +                     resets =3D <&cpg 119>;
> > > > +                     power-domains =3D <&cpg>;
> > > > +                     status =3D "disabled";
> > > > +             };
> > >
> > > I guess same group(all wdt together) arranged together?? Not sure.
> > >
> > I think Geert prefers it to be sorted based on unit address. So I'll
> > let Geert make a decision on this (and the rest of the similar patches
> > where nodes are sorted based on unit address and not grouped based on
> > IP).
>
> Sorted based on unit-address, but keep all nodes of the same type togethe=
r.
> I.e.:
>     wdt0: watchdog@11c00400 { ... };
>     wdt2: watchdog@13000000 { ... };
>     wdt3: watchdog@13000400 { ... };
>     wdt1: watchdog@14400000 { ... };
>
Got you, I will update the patches with above sorting and send a v3.

Cheers,
Prabhakar

