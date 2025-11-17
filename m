Return-Path: <linux-renesas-soc+bounces-24703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF78C661B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 21:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 0E28029773
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 20:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C05234405C;
	Mon, 17 Nov 2025 20:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZSnbNVk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9289233FE00
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 20:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763411140; cv=none; b=el1Rh8fo60DNicScv5JTiC0Tv/axT5AUYXo8rFYEG83qFj0HUs+X1ewy1qy4+TomxgkQZ4irw2ggvTaTfof7xkL7QF2wVrF91Wu9hWgI/aMtj7eVoTxN9aezTvmolvpRZJowt19KjgVUr5hjqnL2NZy7wt+DcEq3m9lBNjOK8Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763411140; c=relaxed/simple;
	bh=cpgqiL5/LaCZUbfB8G72tgBIiB5bJI06pJUi96zR1cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMp8+FgNrDh4lv3Vnf8k4IHSYvqOfhRnBbEX7+iJEcAvybkZTFVNdyxGo+NQNL8BqvtZQl8d/ut8wwFw6c7krFHbvns0m/eUJRP+Sx7EcBCnkSwxYQ2bPFMcA9clUIKie2YJacVuBirG9fTuqAVr9UQiTyVPmCvV6wBr5MLc/nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZSnbNVk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso3841437f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 12:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763411129; x=1764015929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgjjK2XbJQUpqGGoaCrQdhUPKZGbik3QiZYNr8oO2RM=;
        b=lZSnbNVkoTUUfM/d1JAjIfjWTRFJgeRHp+L421tjgsFBm/xdvceW6KlOdF28Pps00I
         ZXZ2ITrfdpJ0dSsUGr1BTjdfkHm4f/UY5WT+yIaNfUtcGTvrMZEAjoPZjciUpDrf2wP9
         wo4N/K/11TbaKU5J/4WuNeJvqlNqLWwJRUAzLJeIL0AepBj5Wu3zRhihHF14Q/D6I0CY
         bVELwCXmL8SvO7+wNOsRc28XHvOsJdG8N5LplvyOw02iBqr3FAVIzlpMlihshTBgmxJP
         2GxWFVJ0lKKp83S0Xodf06YioZaf3rH1Dth0jyn3/F0Fo2ZeM/Ys3biLkVvEg2jAbTMX
         vmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763411129; x=1764015929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KgjjK2XbJQUpqGGoaCrQdhUPKZGbik3QiZYNr8oO2RM=;
        b=QdKs6cHI0/rDZnGK7i3R7fjMYbazOztoKJrKdtD7QU/h4xaHW9LQbzgj0gf5d0thF7
         kadzL6NWgV1AWGh/gaOnS4ZctdFS8iVXGWdESkgDPqNjAjSGElSqY5R3+rT/+Hu5/KT3
         ntCldk5vfhCLcV25SN34rvMcVJAEpnvaetD0KwulmjfGQVuykC2HkC+yH9xZEmhJx3Vx
         HzQWYpZzwL4D0qKQoZxd/0Xdexd7l02y+lOu9Bx1V9cY5VokC/djJ7F68P24xFZQoUZF
         y9RrMs4cmrpwW2qf/pfxNUWnHKBm/kHBtwnnEmO8B+hir0QVexN87qC3Ij/j6+v/unFr
         21Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWcvBQ43ZnR9/AuyiMopfmsGzbd9Tc5MnKbsADBkaqarw2CbpUlrMFfZmcGRsm84KmGcrDGj5FCyie35DWDETy/SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKxpFGLK95BaSkYHUyPyuqLaGvQ5otDiQAgGBi8dQjng7NZj8F
	Q/2e7MyIwA5U1blfMTXEBDNkeoabhW5Z4rx4JyqACLVeXhDnm+5QfYU0VVBEnB2RoPJ89NuTAlC
	YzCx8e0IJJhdzQQ2AZRl8b7uh2eRttb0=
X-Gm-Gg: ASbGncvi0JE7+IQkoCS5+UFlrslsRB5LoG6Fvhg+ipOYTxXe84JFmDcYQ6/AWbi6PCJ
	hiFeHRC0cDscu27YIuS08KeVcVNzpVSfTIYVpxSEHawdHg4yR40QufVQJn7Lmq7ZwTXt5EW11O0
	TmzaOa6rGpxOFT52rSOtYJmLO5KvZwwmw/fjvHqNqmC7sfTXPrtWT9KMp4pAGSDQYMNRd2tN666
	WsFZJ1F14feYcMaa9Y265z90CBL35quQ32AzN/Rmzj4wiRvDFrHk/Pk9gqatjr1HbcozpWuIYdS
	tlHoiOQmJwKp/7eHGGFnQ7y19robR4ERdUcq/YDMDMd4h0dMysNoy3Spddqh
X-Google-Smtp-Source: AGHT+IEG+aF2dwCSgK6oB5qEOwvTBM24ZBhpeHRDai5TxbtUYEK0l2B7md0rwDsEmyVRM67U8IFhNeR262uFVjgaGM0=
X-Received: by 2002:a05:6000:1ace:b0:42b:41d3:daf1 with SMTP id
 ffacd0b85a97d-42b59377e6amr12836453f8f.38.1763411128508; Mon, 17 Nov 2025
 12:25:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251028165127.991351-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWSB4OvS5AeWqOBQPNG2J9VMYe9YUeXAp9kPjcJEQm3+g@mail.gmail.com>
 <CA+V-a8sC44HeShCFdk2xwTHMdcOo+8btNh9i0hthTEUMdnhqAQ@mail.gmail.com> <CAMuHMdV+7cvwxGVYGUd_nV3sUZ60YWzsWr_Ec6RJToPttUfKRA@mail.gmail.com>
In-Reply-To: <CAMuHMdV+7cvwxGVYGUd_nV3sUZ60YWzsWr_Ec6RJToPttUfKRA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 17 Nov 2025 20:25:02 +0000
X-Gm-Features: AWmQ_bnT3iDZtN9BTK7GhNdRI2SP9L9Joge1rJBp7r_hZwF1SU7_dr9fgFWwKMc
Message-ID: <CA+V-a8vWCV8UuKwTaYU7dY7nPwHiMr-6chz498BqvAfaFWisJw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: renesas: r9a09g077: Add xSPI core and module clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Nov 17, 2025 at 1:32=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 10 Nov 2025 at 22:38, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Nov 10, 2025 at 1:48=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Tue, 28 Oct 2025 at 17:52, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add core clocks and module clock definitions required by the xSPI
> > > > (Expanded SPI) IP on the R9A09G077 SoC.
> > > >
> > > > Define the new SCKCR fields FSELXSPI0/FSELXSPI1 and DIVSEL_XSPI0/1 =
and
> > > > add two new core clocks XSPI_CLK0 and XSPI_CLK1. The xSPI block use=
s
> > > > PCLKH as its bus clock (use as module clock parent) while the opera=
tion
> > > > clock (XSPI_CLKn) is derived from PLL4. To support this arrangement
> > > > provide mux/div selectors and divider tables for the supported
> > > > XSPI operating rates.
> > > >
> > > > Add CLK_TYPE_RZT2H_FSELXSPI to implement a custom divider/mux clock
> > > > where the determine_rate() callback enforces the hardware constrain=
t:
> > > > when the parent output is 600MHz only dividers 8 and 16 are valid,
> > > > whereas for 800MHz operation the full divider set (6,8,16,32,64) ma=
y
> > > > be used. The custom determine_rate() picks the best parent/divider =
pair
> > > > to match the requested rate and programs the appropriate SCKCR fiel=
ds.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v1->v2:
> > > > - Added custom divider clock type for XSPI clocks to enforce hardwa=
re
> > > >   constraints on supported operating rates.
>
> > > > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > > > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
>
> > > > @@ -264,6 +305,116 @@ r9a09g077_cpg_mux_clk_register(struct device =
*dev,
> > > >         return clk_hw->clk;
> > > >  }
> > > >
> > > > +static int r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw=
,
> > > > +                                                struct clk_rate_re=
quest *req)
> > > > +{
> > > > +       struct clk_divider *divider =3D to_clk_divider(hw);
> > > > +       unsigned long parent_rate, best =3D 0, now;
> > > > +       const struct clk_div_table *clkt;
> > > > +       unsigned long rate =3D req->rate;
> > > > +       int div =3D 0;
> > > > +
> > > > +       if (!rate)
> > > > +               rate =3D 1;
> > > > +
> > > > +       for (clkt =3D divider->table; clkt->div; clkt++) {
> > > > +               parent_rate =3D clk_hw_round_rate(req->best_parent_=
hw, rate * clkt->div);
> > >
> > > I had expected the use of some *_determinate_rate_*() helper, as the
> > > parent can be changed to find a better clock rate?
> > > Perhaps you should use a composite clock for that?
>
> OK, so per your test results, the core clock code does try
> various parents.
>
> > >
> > > > +               /*
> > > > +                * DIVSELXSPIx supports 800MHz and 600MHz operation=
.
> > > > +                * When the parent_rate is 600MHz, only dividers of=
 8 and 16
> > > > +                * are supported otherwise dividers of 6, 8, 16, 32=
, 64 are supported.
> > > > +                * This check ensures that FSELXSPIx is set correct=
ly.
> > > > +                */
> > > > +               if (parent_rate =3D=3D DIVSELXSPI_RATE_600MHZ &&
> > >
> > > Does this actually work as expected? I doubt parent_rate is guarantee=
d
> > > to be exactly 600 or 800 MHz, and expect it can differ slightly due
> > > to rounding.  Hence I would look at clk_fixed_factor.div instead.
> > >
> > With below diff, Ive got the below results for the various freqs
> > requested where appropriate parent and divider clocks are picked.
> >
> > @@ -317,6 +317,7 @@ static int
> > r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
> >
> >         for (clkt =3D divider->table; clkt->div; clkt++) {
> >                 parent_rate =3D clk_hw_round_rate(req->best_parent_hw,
> > rate * clkt->div);
> > +               pr_err("parent_rate=3D%lu, req-rate=3D%lu div=3D%u\n",
> > parent_rate, rate, clkt->div);
> >                 /*
> >                  * DIVSELXSPIx supports 800MHz and 600MHz operation.
> >                  * When the parent_rate is 600MHz, only dividers of 8 a=
nd 16
>
> > Case 2# assigned-clock-rates =3D <75000000>;
> > [   12.288507] parent_rate=3D800000000, req-rate=3D75000000 div=3D64
> > [   12.310528] parent_rate=3D800000000, req-rate=3D75000000 div=3D32
> > [   12.318426] parent_rate=3D800000000, req-rate=3D75000000 div=3D16
> > [   12.326361] parent_rate=3D600000000, req-rate=3D75000000 div=3D8
> > [   12.341540] parent_rate=3D0, req-rate=3D75000000 div=3D6
> > [   12.347546] parent_rate=3D800000000, req-rate=3D75000000 div=3D64
> > [   12.357593] parent_rate=3D800000000, req-rate=3D75000000 div=3D32
> > [   12.367148] parent_rate=3D800000000, req-rate=3D75000000 div=3D16
> > [   12.418871] parent_rate=3D600000000, req-rate=3D75000000 div=3D8
> > [   12.433560] parent_rate=3D0, req-rate=3D75000000 div=3D6
> [...]
>
> Thanks for checking!
>
> > Looking at the logs I think I could optimize the code to continue when
> >  parent_rate =3D=3D 0
>
> Do you know why it gets called with parent_rate =3D=3D 0?
>
When it doesnt find the best parent, parent_rate =3D=3D 0.

> > Based on the above logs, would you prefer me to represent it as a
> > composite clock?
>
> Given the core code does try the various parent clocks, there is
> no need to model it as a composite clock.
>
Ok.

> However, I still think you should look at the parent's divider value
> (clk_fixed_factor.div) instead of at the actual clock rate, as that
> may not be 600 or 800 MHz exactly (e.g. when underclocking the SoC
> on a custom board using a 24 instead of a 25 MHz crystal).
>
Ok, I will have to iterate over the parents to determine the divider value.

Cheers,
Prabhakar

