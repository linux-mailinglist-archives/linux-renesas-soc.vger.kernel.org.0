Return-Path: <linux-renesas-soc+bounces-8389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BE29612EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 17:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E4291F23FF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 15:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E88B1C6F40;
	Tue, 27 Aug 2024 15:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfIqNxiH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D942C1C68A6;
	Tue, 27 Aug 2024 15:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724773012; cv=none; b=FufXIbCx/b75BMZbG1Pz2mW9TPaSViFmWtWHXku6hFQI2F8I/wizxpFMikWve7hui4sy3TVgspr9s4gK/Nm+BNScJ1dBKJYFjFXRgTa+y0rq996Gus9w81V18+S9Rv2/6AmGRBKjZa1V6ir3vjft9H735DRnJhr0DY7VS0muurA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724773012; c=relaxed/simple;
	bh=SP/Hfb5YP0Drgap/qxkesUFZQc5ljyFnrfZprrfkE4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQX7BaKkNOyRfHNlTXDsqwj211Utbk4cakff/rGh6c+MPQTYN/pWdPxPsm4VcZxv8k733PDcvOpdFms1GwQlqufVJaDQI2NOKNwIpDFbrpx3xF6TQjAdjuk7QXDaw8WbYPaZX9aLAfJTBawgR5bsr7ICYIH9D1r+ZUXEI2VVhF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfIqNxiH; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-45007373217so54424981cf.0;
        Tue, 27 Aug 2024 08:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724773010; x=1725377810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps7NzLxUjACH4h/42KdNrk0yLnll4rrI6Xt4mw8QvM8=;
        b=OfIqNxiHUFCq/VlbRlOOJtPAsdoZUY4Z4AZatMkffj2+TXqG40KzTZWwG0wDRXOoTU
         vJGd7Zn7jKLdlkfQwPP0KO3A+lPF8TPX4KlO7IYwVabOIUDhsVQpQrnOngZwR3eYYpRH
         1aoTEi/q0AT0Z92OnzHAm9IuO+uF9CGi+ghv3cNWnlNym86wIDuLnOQ6BAr1y5xv4e7f
         hgT/1nlj2ShFhdh8lraImWZcwMUvdGhERpSZMGcdv/cCfgKin99VhlQmcd+aNxtXJezK
         630Qb7e/4rMO6NF0rQq95+tx6vrMDlx7vKkZFAzQIQ6H5APzRxLhNQVyY3a5Vbl4RUV5
         E0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724773010; x=1725377810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ps7NzLxUjACH4h/42KdNrk0yLnll4rrI6Xt4mw8QvM8=;
        b=KoBL3nMNkhwH0hG4Lme9joMdT3H+DnoaK2yZNSlmw/pWAIfJ7PQgUkNbldzBtm6Bc9
         bQcOpEtcbc6Vd1vb8zHD6Iw5c5E0OGxhlAnFVbRVOywHOwNzqfzaUOwMIi11GURv+MkQ
         qkDrNpMVywkA2IwIraN/ZAdbxuaDxT5REjvMtBGfcmvg5ls0sWTkTW9sR7WEshrt6Nkg
         iDKa8n+tBqhr58EAZ5+3pvGjlnRv5cNXJqXkmrFKGHvzk1FqVkA0Hm7Ql5jwRnPqCFbo
         diOx8Fa7Sc3C284yFHm9qCollTvbCLokKkViKWr3bxbU13IoxaviWG2z+c8wtcOezQs2
         5OJw==
X-Forwarded-Encrypted: i=1; AJvYcCUbJQ1BLJY9rb1PWqd7oaz8ZUZ9Vr8FVOJqh1SpstMQJwggWxlPerfW1IPWChY368/IY3dUiM47QaesZIiT7RIiaHM=@vger.kernel.org, AJvYcCV1f3XKriXalBsW1iTrCkQRfEfeWSdEvxoUyVDXUXFBZG3iDQgZLig67XvkmGVmdHT4Pg2aFgMT1faKcHvQ@vger.kernel.org, AJvYcCVp8aAKK4tU3+ExxJm2y/WGBKa5IiImNnm2A3u03z1lmyWv4sTHAEAQsOVN/7sDZRqQG3Snyv6EGN4m@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ofSuKneAirRLpJVn6GprhVi4AqxDtrWkJ0XZmzp10KSkRP7S
	hcS5kzpbkmTbMHMsCH/gXI+NPv3ZnUYK/4oi28rSelzzskHBk5kEtdfdWvoaSklxyQYEdslRpVm
	BQN5P0+I0b4+ESafS8O7FzSu7yYAjzw==
X-Google-Smtp-Source: AGHT+IEWuHNQtUbcd+wK8yyWcQn1WgLVVifyQ39JiGJxTL6QT+BG4r5nonk9fu+bvD6/iY+IOnLjgHKFEvK8scM0Sy4=
X-Received: by 2002:a05:622a:20e:b0:44f:e11c:b0d8 with SMTP id
 d75a77b69052e-4565ff987bdmr55397961cf.7.1724773009665; Tue, 27 Aug 2024
 08:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240821085644.240009-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUYYPj6JD-aLkriYB59OnHir_ec=xLo7fUbASggKetfpw@mail.gmail.com>
In-Reply-To: <CAMuHMdUYYPj6JD-aLkriYB59OnHir_ec=xLo7fUbASggKetfpw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 Aug 2024 16:36:22 +0100
Message-ID: <CA+V-a8sgsu=Tdyg1pCSs+cZfbb38j0ASXH1FWzSO_+gQLNV0Lw@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm64: dts: renesas: r9a09g057: Add OSTM0-OSTM7 nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 26, 2024 at 1:14=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Aug 21, 2024 at 10:56=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add OSTM0-OSTM7 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - Grouped the OSTM nodes
>
> Thanks for the update!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -121,6 +121,86 @@ sys: system-controller@10430000 {
> >                         status =3D "disabled";
> >                 };
> >
> > +               ostm0: timer@11800000 {
> > +                       compatible =3D "renesas,r9a09g057-ostm", "renes=
as,ostm";
> > +                       reg =3D <0x0 0x11800000 0x0 0x1000>;
> > +                       interrupts =3D <GIC_SPI 17 IRQ_TYPE_EDGE_RISING=
>;
> > +                       clocks =3D <&cpg CPG_MOD 67>;
> > +                       resets =3D <&cpg 109>;
> > +                       power-domains =3D <&cpg>;
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               ostm1: timer@11801000 {
> > +                       compatible =3D "renesas,r9a09g057-ostm", "renes=
as,ostm";
> > +                       reg =3D <0x0 0x11801000 0x0 0x1000>;
> > +                       interrupts =3D <GIC_SPI 18 IRQ_TYPE_EDGE_RISING=
>;
> > +                       clocks =3D <&cpg CPG_MOD 68>;
> > +                       resets =3D <&cpg 110>;
> > +                       power-domains =3D <&cpg>;
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               ostm4: timer@12c00000 {
>
> Usually we sort the instances within a group by instance number, i.e.
>
>     ostm0: timer@11800000 {
>     ostm1: timer@11801000 {
>     ostm2: timer@14000000 {
>     ostm3: timer@14001000 {
>     ostm4: timer@12c00000 {
>     ostm5: timer@12c01000 {
>     ostm6: timer@12c02000 {
>     ostm7: timer@12c03000 {
>
> See e.g. the scif nodes in arch/arm64/boot/dts/renesas/r8a77951.dtsi:
>
>     scif0: serial@e6e60000 {
>     scif1: serial@e6e68000 {
>     scif2: serial@e6e88000 {
>     scif3: serial@e6c50000 {
>     scif4: serial@e6c40000 {
>     scif5: serial@e6f30000 {
>
> scif3 and scif4 have lower base addresses than scif0.
>
OK, I'll update the nodes based on the instance number.

Cheers,
Prabhakar

