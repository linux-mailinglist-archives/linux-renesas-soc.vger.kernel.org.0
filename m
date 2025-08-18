Return-Path: <linux-renesas-soc+bounces-20638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B65B2AD30
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 17:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D9F6254CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6D727875C;
	Mon, 18 Aug 2025 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPab/nMh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A7026F2A0;
	Mon, 18 Aug 2025 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531778; cv=none; b=p8pA4MpOOeILTB7tkLWpeFw/gqKjls9l834QppRQubkju6kEHTyQYoPorUYo1KEULuh/jGOnGWpqpxFRc7G8uqwlfhTJANSWc/q32yNRasivw92ziptUtoA8Ca3OHiFwTJjDqA4WH5l8uQX97bU2JPXQTmHSpHa1loTte17xwZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531778; c=relaxed/simple;
	bh=ywxn1I3UFav5YpSH6HiZZsgW4lu/1x9L2oITTIpfdSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfotIgsTwov5+GQ5mixev3pRIwP16c6t4XvJKlhSeDvDTwgKf82xPTS8j2A1gV/TANvx8YwUJPHCEFg2bbMP5DM7sHX4wpQ32rYK1wpUN+TR7G4IODbwwox1zhEo/e2AQTLMRxgvrzGSbg/X8s3G5681o2vbsWOQW7KtXQbJ674=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPab/nMh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a286135c8so8602575e9.0;
        Mon, 18 Aug 2025 08:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755531775; x=1756136575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gyvbgaSN+DdftJLQegwXsb0dx1vRQ+9T7q/7QFLbTM=;
        b=QPab/nMhLAXjtO+H4r4np1+L2J3rkT/dz0EPKOMSMybDAQIE6+oq7RVILlzboZZW8a
         zJz63rBAGW7LF1FY+E6E+UbeXhTBNL7zey+a1ityb/2dbwQFSK51/12Kwgc65YB6cu/K
         Of2JGHydWbad67bNuo/iHJa6Gtywc6AEOpKmcodJOk67O3v4z8nyWxr0bJ3WoUM3MdHJ
         K9G/ZI+AgP/4sHfON+2y6WbtRrzrppM0R/LCXYRNPrt00JtxJBQKPg/ji8IsWvEE5iUM
         zEWdmub9TqowlH6HM1No45fRlpD5Bz2k1VZEQIzDK5Sz6cPxBqeNx0uj3pyoP0Jr2wpj
         XU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531775; x=1756136575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gyvbgaSN+DdftJLQegwXsb0dx1vRQ+9T7q/7QFLbTM=;
        b=mRAtRUjGYjfCJ7I2SNe7TOODxFc3LnRqdkJ54CTozzop+DjviJZ7zviAbc0QCKrxXA
         a8HMipNmw5x2E93B2qvO7PdrgyKe44OyZSMmbwHwBq0ph1J+g36BU9MBgE/8p35pVz1R
         9tDG7EuDq/PNsyHE+pA+Pm6+9kEQcylpYb4KtFquIEyEzaglOl3w4Qxp1l/h/5AvNT14
         YECNKHz4vDpTjKyfCrRjdffbcHMiYg5Pzm9Z1Va/l4i/5XkD6Ha1T8FCRDbdP4LhziRs
         UR1gS6bWFHSKIbw1fEzwSpLFkVMfuLsUQmlbT4RNUtK4kH74Z4nGzv1dBY0r29sgniLl
         eg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuxHhYUJEw47OPfZDrn29tvflyzNXmE+pBDCUReYgYeUQzMvvriCqM91m4+58Zi5+7CZ4xsmrM7xP6NINm@vger.kernel.org, AJvYcCXJ98G163Bn8y5YG3dCOfkCkV87y09mg0+mSvowJrbMc+sTiwMyj87P+NWXFuBMm6QG7QApdsO+bmxA@vger.kernel.org, AJvYcCXeVbmNZ0bZ8qLW/fSxredS7hhDJAc1/LdqNmviUOakyag41UCIT2YnDPPUwBtQdv1ssdL67t7uXU71FIvNvVrNlVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV804qv51fmjNfzkyZJk/u5EVtDi4ZMoJanEDm/bEryBfq/Jkw
	YtDub9Rwiw6NkvM4mrY1hP/SzO5GTVET2MH/uKF1VkV4fyH5xWKtwB+JfwRyCOIblb5XDJVgWVl
	jUpR4FGoGMyWx1r6TuYkSMbr2NGs/49M=
X-Gm-Gg: ASbGnctCr5TYiW//FQGSzaNDCQnALjlBQFMN+bnPeRQW0A1SPIRYUzuF8isxYtsIUpR
	OGZlN8qMj6Uko10YiQOdqUtAjELLnKzxCWkhsTc/OzUA1vjwjI6iHDzpYA49fJq+cpM5CmQyDSi
	IW7JGPngw/vAmhLQkZ2gEXycPgibAe1vRfdNlLmOm3hm2V7QBPaYCBUoOxvJT8rrzb7CcxRMZGg
	w73mQN8
X-Google-Smtp-Source: AGHT+IHQxy71eKVswqjSB+EWt0jvak8QLroDu9U+V2MUxGuUazy9fqZ1XyPoThe6gHHo4dc/jyIiM1bKrCh+LvruC6I=
X-Received: by 2002:adf:a294:0:b0:3a4:e231:8632 with SMTP id
 ffacd0b85a97d-3c0717875c8mr44401f8f.12.1755531775254; Mon, 18 Aug 2025
 08:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250812200344.3253781-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVRwZ6PNt6LDi-NZWiUH_eNtw026UscwF9pZTjObVU6fA@mail.gmail.com>
In-Reply-To: <CAMuHMdVRwZ6PNt6LDi-NZWiUH_eNtw026UscwF9pZTjObVU6fA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 18 Aug 2025 16:42:28 +0100
X-Gm-Features: Ac12FXwvD1Y2I1zcj77wMk2tnlBtbcSQpP4J6u7-3UVfTZIal_2quD9wJyYlw6g
Message-ID: <CA+V-a8sNAnZnmn-Gwx_Kn98G6RR+4Qsy6ag+9cef922bUtcAyQ@mail.gmail.com>
Subject: Re: [PATCH 09/13] arm64: dts: renesas: r9a09g087m44-rzt2h-evk: Enable
 I2C0 and I2C1 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 18, 2025 at 3:00=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable I2C0 and I2C1 on the RZ/N2H evaluation board.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
>
> > +       /*
> > +        * I2C1 Pin Configuration:
> > +        * ------------------------
> > +        * Signal | Pin     | DSW7
> > +        * -------|---------|--------------
> > +        * SCL    | P03_3   | 3: ON, 4: OFF
>
> 1: ON, 2: OFF
>
> > +        * SDA    | P03_4   | 1: ON, 2: OFF
>
> 3: ON, 4: OFF
>
Agreed, I will fix it in v2.

Cheers,
Prabhakar

> > +        */
> > +       i2c1_pins: i2c1-pins {
> > +               pinmux =3D <RZN2H_PORT_PINMUX(3, 3, 0x17)>,
> > +                        <RZN2H_PORT_PINMUX(3, 4, 0x17)>;
> > +       };
> > +};
>
> The rest LGTM.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>

