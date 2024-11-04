Return-Path: <linux-renesas-soc+bounces-10276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B91B9BB49A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 13:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFC151C21BDB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 12:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9441B394D;
	Mon,  4 Nov 2024 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIaxgWpS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C861F1B0F2B;
	Mon,  4 Nov 2024 12:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730723022; cv=none; b=RF/0FABoBPMLlu8ndSHGhHCPbV0yrmF+1e6M504t1tX+vj94+Wx+zDkhHkZTbL0nF95jxrPCxbJrv1YYlLqNDX821l3l10DyxtWOCsPSbPrtdQuf+30+Q3/4CqYJ/PJZ5seitdGdlUesTboJD8PTlbILw2z5AaXiTNW0E2lp3+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730723022; c=relaxed/simple;
	bh=2qd8iYaYOIGx3CqdSiEVjH7CQXkvkkfTBpMxdIIS7cY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6RVXhezzicsVqFTacUXXB7SXCm/IUACdiytWhIvNw2lQe8dTKHPHFTTFtofiNIE1EKuhT3xbNimbo9Hso44yuOVllKXkarjpDa4E94ebNy5Fp25j2OC1h04RLDrTQa7p4V33/ynLZoycIcbwxoRikfVdG4pvnCOgVLA9L89H5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIaxgWpS; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-512259c860eso1065179e0c.2;
        Mon, 04 Nov 2024 04:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730723020; x=1731327820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TRl4SrVbJLp0NkdyFwWuN3vCSTT0PHQ/XYslc8BZOU=;
        b=JIaxgWpS7YPHD2iS8FBw8Gs6rE0k0LtOv1cWJN/wuJWpzXObGheNvmpdFS8Gjy+p5J
         5sMMeqGAwFP2hlNFrch4ntIiShVIJxguCMz/Tcuy4KBxDuauC5O9F1N/Bl8fJ8oom0ZE
         7S5hk/8uZlQteTK9VHG7No7jp9kg746nup3obj0tZEGRWfEjsraVkW5ojNRDN2JDlAeT
         B4u0cYwoJEM2gl6TKUsQ4iamRDHPCoNQy6DbM/O3oKLbnE2pR15YvdVqG32LbiVV6yMy
         k6z5h90eGz0lejjTI4yyAUukSMVuwDX/b3nX4iW8tRHlEalEfHO8kdzoCvnsA+mHVcqm
         XXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730723020; x=1731327820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TRl4SrVbJLp0NkdyFwWuN3vCSTT0PHQ/XYslc8BZOU=;
        b=QJkp5P0MpEfGS5dqT1kpqU8oKdWd4ksOLSvOvX0md1rmyeJThyE84mZ8n61f6YXHc3
         pa0oxhNGsKQ4yQTt4tmQDjuQNh0FsuKOKTSWWMktelsVsFb8qnNBBLz5RHF+X+mBSh54
         fN7t5g7OPbn7k2INGfaK3sVqrB96yKkyNVDL0wN1bakuAjDyKGRE1rTy3w5iMl2RWqwr
         v3Z57sPcQ0QCoFr/VPqpODVI6/eXBEHH7qPWJMlB4rXVwbyMP1bMLPN+B3aBI90+w7aI
         XiKFnDnPPBfsq/X/Ea8U02j0zjz6esltPPg6awfhZ9tMFYJVD7NO4KMaa0Y/jTbeah+J
         /6lw==
X-Forwarded-Encrypted: i=1; AJvYcCWNxJqiKtami/dl7XffsA8CroFRA7+60ivOoR8dlDjMznshtitGQu2KmaXibr8J+sukZRCFea2QiLo=@vger.kernel.org, AJvYcCWbVlXKIglqVDuVTaSW3/2Eqjg/0y0A6c+Ob8gllf0j/xhvkHBt+keM0IWUXfv0TO/9bbiJI7N8Ci4wcZK5@vger.kernel.org, AJvYcCXAPadkdexbcQL0WLhAkYJ4FurdqeiOyt0VkP4p8Wq8H1oQN1pQqFzsMMp8KiZYYHHcb+rYiEwaUvoHN1YMG9mOcKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Z0rNCKtX6vWG0d2E+wuIUhtpgwsvJd2u2TF2193WrcKx9YYn
	pw2yV+BX6AWoyKqBZ4bgVJgFc04XVPvyC5/KfJ2E4MS1y8m894Z+/iyStalGMCOJdApIlE0RCvH
	tq1BmuwcuCfWF10r7Hnl83hGLaO4=
X-Google-Smtp-Source: AGHT+IEwtu9N8h37RDr9nkP3F3AF88b93osSD1szSGlVJFxRFnc0qpaVTHLY5bpMra+DdoPoEd+BfugMsRi1ljQ7wI0=
X-Received: by 2002:a05:6122:1816:b0:50d:4cb8:5b10 with SMTP id
 71dfb90a1353d-5106ae972ddmr14332885e0c.4.1730723019586; Mon, 04 Nov 2024
 04:23:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028212914.1057715-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241028212914.1057715-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWFiaECzt88fuHVxV1du0i5+4ujs73QciMUszrkYP3Mzw@mail.gmail.com>
In-Reply-To: <CAMuHMdWFiaECzt88fuHVxV1du0i5+4ujs73QciMUszrkYP3Mzw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 4 Nov 2024 12:23:13 +0000
Message-ID: <CA+V-a8tXp=z757===FgBrBCc0Hn1w8yzG-TJzwRkLuz3ttsSUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: rzv2h-cpg: Add support for clocks
 without PM
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

On Wed, Oct 30, 2024 at 4:56=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Oct 28, 2024 at 10:29=E2=80=AFPM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Allow certain CPG_MOD clocks to be excluded from Runtime PM support. So=
me
> > clocks, like those in the CRU block, require specific sequences for
> > enabling/disabling, making them incompatible with standard Runtime PM
> > handling. For instance, initializing the CSI-2 D-PHY involves toggling
> > individual clocks, which prevents the use of Runtime PM.
> >
> > Introduce a `no_pm` flag in the `mod_clock` and `rzv2h_mod_clk` structu=
res
> > to indicate clocks that do not support PM. Add a helper function
> > `rzv2h_cpg_is_pm_clk()` to determine if a clock should be managed by
> > Runtime PM based on this flag. Define new macros like `DEF_MOD_NO_PM` f=
or
> > easier specification of such clocks.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -658,6 +661,32 @@ static int rzv2h_cpg_reset_controller_register(str=
uct rzv2h_cpg_priv *priv)
> >         return devm_reset_controller_register(priv->dev, &priv->rcdev);
> >  }
> >
> > +static bool rzv2h_cpg_is_pm_clk(struct rzv2h_cpg_priv *priv,
> > +                               const struct of_phandle_args *clkspec)
> > +{
> > +       struct mod_clock *clock;
> > +       struct clk_hw *hw;
> > +       unsigned int id;
> > +
>
> Forgot to check clkspec->np?
> Ah, rzg2l_cpg_is_pm_clk() also lacks this.
>
I will add this check for g2l cpg too now.

> > +       if (clkspec->args_count !=3D 2)
> > +               return true;
> > +
> > +       id =3D clkspec->args[1];
> > +       if (clkspec->args[0] !=3D CPG_MOD ||
> > +           id >=3D priv->num_core_clks + priv->num_mod_clks)
>
> Adding "priv->num_core_clks" looks wrong to me.
>
Agreed, I will drop it.

> > +               return true;
> > +
> > +       if (priv->clks[priv->num_core_clks + id] =3D=3D ERR_PTR(-ENOENT=
))
> > +               return true;
> > +
> > +       hw =3D __clk_get_hw(priv->clks[priv->num_core_clks + id]);
> > +       clock =3D to_mod_clock(hw);
> > +       if (clock->no_pm)
> > +               return false;
> > +
> > +       return true;
>
> return !clock->no_pm;
>
Agreed.

> > +}
> > +
> >  /**
> >   * struct rzv2h_cpg_pd - RZ/V2H power domain data structure
> >   * @priv: pointer to CPG private data structure
> > @@ -670,6 +699,8 @@ struct rzv2h_cpg_pd {
> >
> >  static int rzv2h_cpg_attach_dev(struct generic_pm_domain *domain, stru=
ct device *dev)
> >  {
> > +       struct rzv2h_cpg_pd *pd =3D container_of(domain, struct rzv2h_c=
pg_pd, genpd);
> > +       struct rzv2h_cpg_priv *priv =3D pd->priv;
> >         struct device_node *np =3D dev->of_node;
> >         struct of_phandle_args clkspec;
> >         bool once =3D true;
> > @@ -679,6 +710,12 @@ static int rzv2h_cpg_attach_dev(struct generic_pm_=
domain *domain, struct device
> >
> >         while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells"=
, i,
> >                                            &clkspec)) {
>
> So this should have checked that clkspec.np actually points to our
> clock provider.  Else all clocks (e.g. the external CAN clock, or
> external audio clocks) are controlled through Runtime PM.
>
Agreed, I had missed this case, thanks.

Cheers,
Prabhakar

