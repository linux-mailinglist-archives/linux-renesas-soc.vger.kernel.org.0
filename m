Return-Path: <linux-renesas-soc+bounces-6832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 158B691A7CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 15:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A728D288C23
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 13:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE2619306C;
	Thu, 27 Jun 2024 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kltSUcUO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339217836E;
	Thu, 27 Jun 2024 13:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719494748; cv=none; b=H2/V9v16IPzIM1v5o2S2ugUusTkKBhEvSsTVg+FmbpGNS8fQiGvvuyv6io1/JhpzETFcuvxtf6Td09coMpxwZoWo2u0hPI15BN7CZhJ4sXJKBPBHOktWBX35sj3PMuMWLEdArwh6q6kQQ00/mt50zwXCSZd5f8mLT2rj2D/mRHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719494748; c=relaxed/simple;
	bh=ajLmLy0AR7TZ6hoXCAWFf0Et4Iq9zEEDSFWkXypmzQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEOeLeTUGdPs3mONGNvCsomi9SLzErvkK+yr86IuS6pSlnSwSBjoDlAckjEIFmybqun5uVczjV2Rn8KxRgbVv4nrDeyqGn8ucZle5ryQwrJSW4LUSMh44e4buOZvkLZYabLuHJjrz9g8d9zdsL0YBPqM8jU9MkqUFobISUiisWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kltSUcUO; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-80f6525a0c2so2288811241.1;
        Thu, 27 Jun 2024 06:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719494746; x=1720099546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah0RENfL/kgATlzLzK8KrOO8AtQ3Ih+2vnb5Lb2t2HU=;
        b=kltSUcUOE1OynJcePSYIqnGS/9iYvcNsCC+pNV72nVIQq7iTRHtI8GrsZP5h2qtznq
         nmeutQetB90dwjZ3IroEeFqADFXrd2QFP2xyCev9Olxka99XN5PWn9Wyw6oRrMz585Ju
         Kw7SG3A2SmA5A9s7fBipMPiMwLWSnJ6pwZoqRDhCmvmIH4dSS1mQ2fnbFUJLyxWYt912
         avVSwP8aQnFiyr4QUtAo/I37B8a1c+DEKixeSQ+GLJAMBeH2cLkP3goYAaeB39aXV08o
         ggafu0TGWycsopXPlsGnryX/fadzYMdHJLEDxHOAE/Q82NVnt37g1dhH7xVX6Dkd7rmf
         pfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719494746; x=1720099546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ah0RENfL/kgATlzLzK8KrOO8AtQ3Ih+2vnb5Lb2t2HU=;
        b=fGmPiM1kWwf0RFIhYBoU/VffNZxKMsW/4tQ7o29wC657NM5yeGPjN0Q9xjmJ91o3C7
         v1vjlTdzx63iY66/wmR3n88HapmPHFaPmaBcdk5AJG1sawgb4PwFP3v4zAzUHPM4QKP1
         ybmKI1OPaMwIGflZRTdXUZ1nekB5qLs3LQ6ZA2NEZRnlSZe9xmMcdvyL3H+p6nou+BBp
         mHOu4OiB0NYmjkb/q+BhwjpDaZUo7JmG/UC0GNJDEjAzVWjANe4q8KYoniBWnAEqPUww
         2jVdE/EaURv6FSsyRQHyk5FtMa01Xt3a+CGyYsycKX3GyNQh3WJjk+mw49hwlXmNuu4C
         azog==
X-Forwarded-Encrypted: i=1; AJvYcCXm3CCPbeN/r6cvK+XxgkGm6vP7ZcFaH9WAeRPxLlTuJw/zQFNSpWb2KjewA64NSBMUVykvVInEaOFBku3lcRO/tAJg8MLrZ6QPNasgSmRxlfBmV9uwMg5EOhk7UzmffSbjWTvgamvrSaUhjnnHuzj+hZ67GRPnstT2lXK05KNHFvA4OyesfkTIuzVYDhOjBhcQbRHr7hR1fwAC6VPlExSi4BCWhKi4
X-Gm-Message-State: AOJu0YyEtWLCoQEsi8ogY4ChrkIRAQE+2cL74rF6iZyDfF5g5kryQcT3
	rBmvpouDTAu/CNBaFbSuWFX9tuouGQBvDKcjMnzdYCerUp8nmJpc8oFvngoIS7zvgNHzMukmes8
	W/n6f3z7GcRNALh8AV15EHeLRfqs=
X-Google-Smtp-Source: AGHT+IE6QnqSreWpuJIt25wmG7cNZ2AxsuZT6ndXv/IR0UUG2FAXCqnKtoJc2+WtS65x+aTCg8f9mXmFuqbHDlPKmro=
X-Received: by 2002:a05:6122:3117:b0:4ec:f8f0:7175 with SMTP id
 71dfb90a1353d-4ef6a73183bmr12936975e0c.11.1719494746134; Thu, 27 Jun 2024
 06:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240610233221.242749-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVOvdU4ajB_f9OtQ8ao0Aodg+Rb9eGTmbNGC8o+aW-hzg@mail.gmail.com>
 <CA+V-a8sqJBo2Q7+-_AYtFkmzYrxAjvJ7mLXgpLcmZNuGWi0BDA@mail.gmail.com> <CAMuHMdUryuN9xfYEX_eVGp1hV9zzhw5=bjvJBQb1FwcBcrNs4g@mail.gmail.com>
In-Reply-To: <CAMuHMdUryuN9xfYEX_eVGp1hV9zzhw5=bjvJBQb1FwcBcrNs4g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Jun 2024 14:24:45 +0100
Message-ID: <CA+V-a8vFjZdprmxFyHn1v4Uc7X7ZGhhxTMxXXgrZQTikO50=6w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] clk: renesas: Add family-specific clock driver
 for RZ/V2H(P)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Jun 27, 2024 at 8:01=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Jun 26, 2024 at 7:36=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Wed, Jun 26, 2024 at 11:07=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Tue, Jun 11, 2024 at 1:32=E2=80=AFAM Prabhakar <prabhakar.csengg@g=
mail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add family-specific clock driver for RZ/V2H(P) SoCs.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
>
> > > > +/**
> > > > + * struct mod_clock - Module clock
> > > > + *
> > > > + * @hw: handle between common and hardware-specific interfaces
> > > > + * @off: register offset
> > > > + * @bit: ON/MON bit
> > > > + * @monoff: monitor register offset
> > > > + * @monbit: montor bit
> > > > + * @priv: CPG private data
> > > > + */
> > > > +struct mod_clock {
> > > > +       struct clk_hw hw;
> > > > +       u8 on_index;
> > > > +       u8 on_bit;
> > > > +       u16 mon_index;
>
> BTW, why is this u16? The corresponding member in rzv2h_mod_clk is u8.
>
Oops, I will fix this.

> > > > +       u8 mon_bit;
>
> > > > +static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enabl=
e)
> > > > +{
> > > > +       struct mod_clock *clock =3D to_mod_clock(hw);
> > > > +       unsigned int reg =3D GET_CLK_ON_OFFSET(clock->on_index);
> > > > +       struct rzv2h_cpg_priv *priv =3D clock->priv;
> > > > +       u32 bitmask =3D BIT(clock->on_bit);
> > > > +       struct device *dev =3D priv->dev;
> > > > +       u32 value;
> > > > +       int error;
> > > > +
> > > > +       dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
> > > > +               enable ? "ON" : "OFF");
> > > > +
> > > > +       value =3D bitmask << 16;
> > > > +       if (enable)
> > > > +               value |=3D bitmask;
> > > > +
> > > > +       writel(value, priv->base + reg);
> > > > +
> > > > +       if (!enable)
> > > > +               return 0;
> > > > +
> > > > +       reg =3D GET_CLK_MON_OFFSET(clock->mon_index);
> > >
> > > What if a clock does not have a clock monitor bit?
> > > Clock bits in registers CPG_CLKON_22 and later do not have correspond=
ing
> > > clock monitor bits.
> > >
> > Oops I had missed this case.
> >
> > I'll introduce a macro (NO_MON_REG_INDEX) for clocks which do not have
> > monitor support and add a check above to skip clk monitor operation if
> > clock->mon_index =3D=3D NO_MON_REG_INDEX.
> >
> > /* monitor index for clocks which do not have CLKMON support */
> > #define NO_MON_REG_INDEX    0xff
> >
> > Does this sound OK?
>
> Either that, or make mon_index signed (which would reduce its
> effective range by one bit).
>
Ok I'll make it to s8 instead and add a negative check monitor index.

Cheers,
Prabhakar

