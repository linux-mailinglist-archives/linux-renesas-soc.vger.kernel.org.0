Return-Path: <linux-renesas-soc+bounces-10726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB849DA804
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 13:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7B8FB21342
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 12:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B0D1FCCE4;
	Wed, 27 Nov 2024 12:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gy0/+bnN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874F514431B;
	Wed, 27 Nov 2024 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732711307; cv=none; b=ohElj0BL8cPFgpM4l5LZLUnhz++F1SJ0KSAhuztoDErCOS0hBKhD6PoCzkMg8kwcxybsiPHeU4zIVlVMi8XDHOFfnvL9kjHYhkJpwIhEJ3GDL7Dqx73INgRLB+1cEdAwU0HI/bLqsLBiCobtLWLCf2Ylb71Ou55a+wg8phdeEf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732711307; c=relaxed/simple;
	bh=jzwfXMKGFvfliBaBmwCPcdqRJHYyzBv5yI+z5+w7A60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdKpcCSt5255hiocQnySH/jIsyrpz0Fch7nHX6HPTQOczKamL7sZF2OPQKA2BiM01AHducuj7cfpK8KNJL8g+YkUAThmJGLP7eroXAvEYkfooE5xLtCXrxtx0DfUByXVSHWdeCNXqxt3qCILZlgcyhjLtf1oPtW6R8YGQM9gO7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gy0/+bnN; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-856e98ad00bso2219526241.0;
        Wed, 27 Nov 2024 04:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732711304; x=1733316104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16wNQUe4wMRKDkorNrGa0gcC7fienvSCUWfzA3w+ZP8=;
        b=gy0/+bnNMi1jEhu6Bw5uGETuCDULhhILQ0eSrmLIRUbwFl+202QyIGnlbUmZVMkO8e
         EOmHkcb21TN8tvZSBiuqGhiEbMcZx6Bc10WWrQkAAiujYfrpvNS2h7rhfy9MOkH2hX4s
         Nlw+wtEBjlHzYNEBNyiwB9iJVf7fPOrTePh0HBCdrHw9J/6AjRRc9fSCxfaThVKmlfM1
         SNWMK8cQxWTSYLq3pl1XG2LOTMYwVARAhFmxPKIe51z+RJIR82AAt550XnBGRi5NTLFT
         PtjTJ7xyoTQgp99WaFD6oGoSvH1YqITbQnkdHrxBDF/1t150idJUuFHI0gPHU3F+P36c
         QoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732711304; x=1733316104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16wNQUe4wMRKDkorNrGa0gcC7fienvSCUWfzA3w+ZP8=;
        b=asoUgBxc3n592nGNt7PURdYICmUArJReWSUA3Ylk2PRz79EtOH0Y0zZga8o39LGGlP
         FbroQgBpQHE4EVdE3X6pDnvpt/htyErYovTRY4d/MKjCNOddqkYX5kbqwbZ70cWdTldP
         MPFYOJLJyvqgTBQ+zyd5dzNBqGb16MisrNaXdJgYK9wz3z0E+bob4Hpc/ATACgo4m/nO
         hIH9hKPuupg7jIIhbx/Q7JcDCzpTQIbnewMn5kFIx39AXTahBfvR40hEZpW3Ni4DXiaY
         VGRMenZR1f7Ya1XI8hOEN2T4l9LbE3tIDsga+20FxgCcGWsitd2B7J/kPWFEWMeURPjM
         fdCw==
X-Forwarded-Encrypted: i=1; AJvYcCUBRQTpNhNB4SAcRJApjApk8sWQ+52D6zJghXPO/x7TkIZ9puIy6EwtH8bXaGAdRJhnIWwhR0DWm9E=@vger.kernel.org, AJvYcCUvh0g43t7/gWXF6fBhP87uCne5neUJv0Q0/4K/xeQ7FyvevQ6FVEQRQUPVw1/lk2VJX6k8kOrLpWW6YOxuQYK2Ilo=@vger.kernel.org, AJvYcCWuoMyJAKECpKLWaIZrrnUwOjF2kB9i0MkJAcc/ekn8veY2HI6HCtoznRoKunVhP+3uiYnIZfrGuqqHXC5V@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnc+MKL2+Zo5zch5i5wKMenCXhoCO8UJfxa6mFQY5Rm32AOH/H
	3O0sas4ga0mFQg2hwzPpdBIdg4FEX0SBncpNhz5GtZ1FyQtv80vJrbIKdX23d3GXY1xFqVG5oCv
	+uBKFiJrhJM/owTq4t6qPgLtLO1U=
X-Gm-Gg: ASbGncu3WV5ABXaNg/gJs2YP1M0bzux9L/g6sjYOV2QEIF0eYiSm0yo6bILZgF2Zg1+
	tJ5vp3LV+NW6aZupCXQwHU6nY9CIWO6mR1RYSA92GLzjCE4Hr32wVGQxt6dBCmSs=
X-Google-Smtp-Source: AGHT+IGRCpQmXuKz6tAKA4gkXv+3CK8qNDaQFWzjDOELjQFo/h42vbpYfBZ+niAaKrMDSzhaY/pwojvNZQHgrYenixI=
X-Received: by 2002:a05:6122:3d15:b0:50c:4707:df0 with SMTP id
 71dfb90a1353d-515569cc47cmr4013546e0c.5.1732711304318; Wed, 27 Nov 2024
 04:41:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104232401.290423-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241104232401.290423-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX0p4KhTNpNKMfZBjrCDxsyGO7sSwcJZWxBgxoHBZy9jQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX0p4KhTNpNKMfZBjrCDxsyGO7sSwcJZWxBgxoHBZy9jQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Nov 2024 12:41:18 +0000
Message-ID: <CA+V-a8vMMwyZ0rsdzrMuhvWDXa5dMtgYXf9+6YEAm1dXYUU+DQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzv2h-cpg: Add selective Runtime PM
 support for clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Nov 27, 2024 at 9:54=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> s/rzv2h-cpg/rzv2h/
>
Ok, I'll update the commit header.

> On Tue, Nov 5, 2024 at 12:24=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update `rzv2h_cpg_attach_dev` to prevent external clocks not tied to th=
e
> > power domain from being managed by Runtime PM. This ensures that only
> > clocks originating from the domain are controlled, thereby avoiding
> > unintended handling of external clocks.
> >
> > Additionally, introduce a `no_pm` flag in `mod_clock` and `rzv2h_mod_cl=
k`
> > structures to exclude specific clocks from Runtime PM when needed. Some
> > clocks, such as those in the CRU block, require unique enable/disable
> > sequences that are incompatible with standard Runtime PM. For example,
> > the CSI-2 D-PHY clock initialization requires toggling individual clock=
s,
> > making Runtime PM unsuitable.
> >
> > The helper function `rzv2h_cpg_is_pm_clk()` checks whether a clock shou=
ld
> > be managed by Runtime PM based on this `no_pm` flag. New macros, such a=
s
> > `DEF_MOD_NO_PM`, allow straightforward declaration of clocks that bypas=
s
> > PM.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Updated code to skip external clocks to be controlled from runtime PM
> > - Updated id range check
> > - Updated commit message
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -668,8 +671,38 @@ struct rzv2h_cpg_pd {
> >         struct generic_pm_domain genpd;
> >  };
> >
> > +static bool rzv2h_cpg_is_pm_clk(struct rzv2h_cpg_pd *pd,
> > +                               const struct of_phandle_args *clkspec)
> > +{
> > +       if (clkspec->np !=3D pd->genpd.dev.of_node || clkspec->args_cou=
nt !=3D 2)
> > +               return false;
> > +
> > +       switch (clkspec->args[0]) {
> > +       case CPG_MOD: {
> > +               struct rzv2h_cpg_priv *priv =3D pd->priv;
> > +               unsigned int id =3D clkspec->args[1];
> > +               struct mod_clock *clock;
> > +
> > +               if (id >=3D priv->num_mod_clks)
> > +                       return true;
> > +
> > +               if (priv->clks[priv->num_core_clks + id] =3D=3D ERR_PTR=
(-ENOENT))
> > +                       return true;
>
> Shouldn't this return false for the two invalid cases above?
>
Oops, I agree.

> > +
> > +               clock =3D to_mod_clock(__clk_get_hw(priv->clks[priv->nu=
m_core_clks + id]));
> > +
> > +               return !clock->no_pm;
> > +       }
> > +
> > +       case CPG_CORE:
> > +       default:
> > +               return true;
>
> False? (I know the code treated it is a PM clock before)
>
OK.

> > +       }
> > +}
> > +
> >  static int rzv2h_cpg_attach_dev(struct generic_pm_domain *domain, stru=
ct device *dev)
> >  {
> > +       struct rzv2h_cpg_pd *pd =3D container_of(domain, struct rzv2h_c=
pg_pd, genpd);
> >         struct device_node *np =3D dev->of_node;
> >         struct of_phandle_args clkspec;
> >         bool once =3D true;
> > @@ -679,6 +712,12 @@ static int rzv2h_cpg_attach_dev(struct generic_pm_=
domain *domain, struct device
> >
> >         while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells"=
, i,
> >                                            &clkspec)) {
> > +               if (!rzv2h_cpg_is_pm_clk(pd, &clkspec)) {
> > +                       of_node_put(clkspec.np);
> > +                       i++;
> > +                       continue;
>
> This loop may start to loop nicer using
> "for (i =3D 0; !of_parse_phandle_with_args(...); i++)".
>
Ok, I'll switch to a for loop here.

> > +               }
> > +
> >                 if (once) {
> >                         once =3D false;
> >                         error =3D pm_clk_create(dev);
> > diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2=
h-cpg.h
> > index 819029c81904..0723df4c1134 100644
> > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > @@ -100,6 +100,7 @@ enum clk_types {
> >   * @name: handle between common and hardware-specific interfaces
> >   * @parent: id of parent clock
> >   * @critical: flag to indicate the clock is critical
> > + * @no_pm: flag to indicate PM is not supported
> >   * @on_index: control register index
> >   * @on_bit: ON bit
> >   * @mon_index: monitor register index
> > @@ -109,17 +110,19 @@ struct rzv2h_mod_clk {
> >         const char *name;
> >         u16 parent;
> >         bool critical;
> > +       bool no_pm;
> >         u8 on_index;
> >         u8 on_bit;
> >         s8 mon_index;
> >         u8 mon_bit;
> >  };
> >
> > -#define DEF_MOD_BASE(_name, _parent, _critical, _onindex, _onbit, _mon=
index, _monbit) \
> > +#define DEF_MOD_BASE(_name, _parent, _critical, _no_pm, _onindex, _onb=
it, _monindex, _monbit) \
>
> Note that this series conflicts with "[PATCH 00/12] Add support for
> Renesas RZ/G3E SoC and SMARC-EVK platform", which you are probably
> already aware of.
>
> [1] https://lore.kernel.org/all/20241122124558.149827-1-biju.das.jz@bp.re=
nesas.com/
>
Yep, I'll ask Biju kindly to rebase the changes on top of v3 while he
sends v2. Or do you want me to rebase on the above?

Cheers,
Prabhakar

