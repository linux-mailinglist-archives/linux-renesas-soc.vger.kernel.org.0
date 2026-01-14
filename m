Return-Path: <linux-renesas-soc+bounces-26735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D78DD1EFE6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 14:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 301FB3063253
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 13:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F2C39A7E8;
	Wed, 14 Jan 2026 13:08:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583A6396D36
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396084; cv=none; b=U3GDjkjpvAf5Vr6xS1hGpqZ6Ve6e+9HCeDsgDHyWJ9ktrwVaxddcOREc8+NcRoOXECyuSXEjQjUgSJb6tVu9Jpz8asjcXruzGrQQkoqP5OkLmvXwSh3/3N4yI3oWiJ+t7Lxz2sOwjOLtacgXZ6jGWYFepM9+ipd7+djJmHRH81A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396084; c=relaxed/simple;
	bh=SgYrcZGPiUp1pJDcapGaJzmL2NW2465UduC8O2fyutI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skfmWljotTBG2FrDLbBfX5CnBDGmjgP8XPM+8jtdTwk9TOnLw3+y7vZYrG3cemPVQlDrS0uw73o/aIJGouiymVs4tP5/kG8yKesh5lvebmZSigPWoK9bPeDsMLhdq1MSNi5NYVyvKi5yM6pUC80ArtuS+iPu82V+gYZ0A2fAh+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-941275fece4so2210214241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 05:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396082; x=1769000882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOnvgxequhkaVjnrcP/Abcj5FnEjgQ9Z6oOwYXqR9LY=;
        b=kW52UiuUKosMhyQbqZi0PYDRfRScNuNEFJqufsEzUJYsHyV3q749CXyODkHfymjbXB
         jv5/kTfIg/5GU++X8mnX05S0YtLctSPCpnONmYcf8i3N/4GL+UearZbw2imt7ocMZBmp
         lo5suMmQFgAKXEEyv8lKTekzuTvsEqzoQfwcpt+wKzK++qy0O6hHW5A9qaJXLvIfoFgy
         V3H7dysPAuha6v1KczyOnhkDVDl5YIBrJj0ZUP0wf3VEgz5cnzRiJe9+eJU67Tvwr8oO
         KZfTCjYp4Vj0BCDgp2auVEX1rhLB6LkpIemG/cqZrtpBzsQyo63p5Ba3jkhL0Aek/tGe
         JsHg==
X-Forwarded-Encrypted: i=1; AJvYcCXAXePdgR7WCEaZRm/cKElpPRzxrsM24Gj8lKKgZck+VFqFu+JWpXCmms+9bCsvW3gC4PBoKDunVSWWojjmbbDMPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw75RtQEys5gWB5o5pl5LkZHZOE+eOggJLjNthSQ9N7AieyvjFE
	PJvb/ySFhNrNHCLvSeFeJ2pbP/pX3Kt3cOsYGyDpcjL+U6Qouxq3KsIxU/OndNMP
X-Gm-Gg: AY/fxX7FDqPFq9JWVO5rbyZ3od3h5esATQHc3AvdGMSvnilugUM+TKBGmD3+4FXnjQU
	HaCRBDqPe8ihMqgs+yxFW/du+7YbtFBQIK38sXXeaAzQs6TLKqN30phgNgNUdK12F9DNIEJ0Vj0
	GQ/UPdm5u/S1YfY/XjN7Q1BBxl5d9LTQIwj0Li17t0IfS/sMQZOeKSFGMpDnllfiQ75lprnMjYs
	Zvigz8yfdCq1Q6NP+bf7wS23FhyoxCCSklDq/ITGvZqMhNDmLSOrUrReU5dy4p8FBgIEqZYJlNu
	YuHoBEs2R4pktC4TcDIqFFphh7NUZjMJG3fksvNeA+eqY7/YTuYxwqNNEieY80eHnfcnS0wpNtV
	/v2XHQftc/1BNrFhYNkZCBYFsBrAe1obEm+ESazhUYurFWBIlyjfBpAk2MbRayRG1oAPyvSr47j
	eSkMhnlL+U/I+hUhOYcLGYp6txeSQvO2VqDoLiX7NBe28kVNIl
X-Received: by 2002:a05:6102:3e1b:b0:5db:d60a:6b24 with SMTP id ada2fe7eead31-5f17f5c43cdmr843777137.22.1768396082203;
        Wed, 14 Jan 2026 05:08:02 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124a378csm22028933241.9.2026.01.14.05.08.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 05:08:00 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ef5c04151dso1923421137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 05:08:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVc5cmJC7DDnhfvAXYcsOr/mBJMGXoTPP34RXkkslR7vF0lv7ZA+8rUgPsUn4QWDFt9IYCpXqNwparT8V5+wP6J+g==@vger.kernel.org
X-Received: by 2002:a05:6102:1497:b0:5d5:dbbb:5b86 with SMTP id
 ada2fe7eead31-5f17f5c4c63mr892720137.25.1768396080489; Wed, 14 Jan 2026
 05:08:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdXU6traB73KaFj0kRtdo4NDT4ynUyfd-4L36=D6cUUd6A@mail.gmail.com> <aWSs75UPtTezytxQ@tom-desktop>
In-Reply-To: <aWSs75UPtTezytxQ@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 14:07:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9G4an1nhPoHvXa5RtrAw+-tP=VrEz4YFNnE7-MD-Vrw@mail.gmail.com>
X-Gm-Features: AZwV_QjFXX-xMGPOrl95tfVFxAWP1NtPnSeHetQ4hnMLWm1TvwJXuiUd8szKzi8
Message-ID: <CAMuHMdV9G4an1nhPoHvXa5RtrAw+-tP=VrEz4YFNnE7-MD-Vrw@mail.gmail.com>
Subject: Re: [PATCH 01/22] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 12 Jan 2026 at 09:13, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Fri, Jan 09, 2026 at 07:27:04PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > Add PLLDSI clk mux support to select PLLDSI clock from different clock
> > > sources.
> > >
> > > Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> > > them in the clock driver.
> > >
> > > Extend the determine_rate callback to calculate and propagate PLL
> > > parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> > > using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> >
> > [...]
> >
> > >  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
> > >  {
> > >         struct pll_clk *pll_clk = to_pll(hw);
> > > @@ -1085,6 +1213,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
> > >         case CLK_TYPE_PLLDSI_DIV:
> > >                 clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
> > >                 break;
> > > +       case CLK_TYPE_PLLDSI_SMUX:
> > > +               clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
> > > +               break;
> > >         default:
> > >                 goto fail;
> > >         }
> > > diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
> > > index dc957bdaf5e9..5f6e775612e7 100644
> > > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > > @@ -203,6 +203,7 @@ enum clk_types {
> > >         CLK_TYPE_SMUX,          /* Static Mux */
> > >         CLK_TYPE_PLLDSI,        /* PLLDSI */
> > >         CLK_TYPE_PLLDSI_DIV,    /* PLLDSI divider */
> > > +       CLK_TYPE_PLLDSI_SMUX,   /* PLLDSI Static Mux */
> > >  };
> > >
> > >  #define DEF_TYPE(_name, _id, _type...) \
> > > @@ -241,6 +242,13 @@ enum clk_types {
> > >                  .dtable = _dtable, \
> > >                  .parent = _parent, \
> > >                  .flag = CLK_SET_RATE_PARENT)
> > > +#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
> > > +       DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
> > > +                .cfg.smux = _smux_packed, \
> > > +                .parent_names = _parent_names, \
> > > +                .num_parents = ARRAY_SIZE(_parent_names), \
> > > +                .flag = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, \
> > > +                .mux_flags = CLK_MUX_HIWORD_MASK)
> > >
> > >  /**
> > >   * struct rzv2h_mod_clk - Module Clocks definitions
> >
> > Why do you need a completely new clock type, and can't you just use
> > the existing CLK_TYPE_SMUX?
>
> From reference manual (Table 4.4-10 Specifications of the CPG_SSELm
> Registers)
>
> We have the following:
>
>  - SMUX2_DSI0_CLK*2
>         0b: CDIV7_DSI0_CLK (default)
>         1b: CSDIV_2to16_PLLDSI0
>
>  - SMUX2_DSI1_CLK*2
>         0b: CDIV7_DSI1_CLK (default)
>         1b: CSDIV_2to16_PLLDSI1
>
> Note 2.If LVDS0 / LVDS1 is used, be sure to set 0b.
>
> For this reason these clocks needs an ad hoc determine_rate function:
>         - rzv2h_cpg_plldsi_smux_determine_rate()
>
> For that CLK_TYPE_PLLDSI_SMUX has been introduced.
> What do you think?

OK, your solution sounds good to me.  Still, as this is used from the
DRM driver, I would like to get some feedback from the DRM people, too.

BTW, I just noticed in the RZ/G3E clock system diagram that
CDIV7_DSI0_CLK has a duty cycle "DUTY H/L=4/3", while all other clocks
use the symmetrical 50%.  Perhaps the DRM driver can request a duty
cycle of 4/7 when using LVDS? Currently the DRM driver communicates
its requirements by explicitly setting the parent.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

