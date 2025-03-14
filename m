Return-Path: <linux-renesas-soc+bounces-14378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 851EDA612FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 14:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEF7B3A8DE5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 13:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7265C1FFC45;
	Fri, 14 Mar 2025 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNs2ne0T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B5712FF6F;
	Fri, 14 Mar 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741960108; cv=none; b=Uur4ZQRM27SK3BuOgMaLRN/TthiSmjLGnm+pf61HT3Lb1aXYnCxqIo8vubSwFxzgLv4a6O8phruPMptr9/pAjJfMLurRWOfCMu2V+ODPIp25ANmGWD1h4ZWoI2MndC7HzGJcMBDheaIcfAwJYeHGhWnRbBBoXSZX9bJpZi04fC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741960108; c=relaxed/simple;
	bh=DcJpMLavxXBrbWP63jqdWzrdPHQX6uw//phd4NHELV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWgrSUutQvbBX+XYvOsV7y9Y9PNn7s5QlRz08BP0fDDspicTDjM6SgGraNf970Rsi2Ny1PLMIFZjf+0esh5sbk18YV6oXcDnjRozcQPUUVIGAgpQkANO3YhjXvdlTy421wYDQcgnE/PYj9aQAPFvbXDY8BPA98kKDQ64ICYAwb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNs2ne0T; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523efb24fb9so866166e0c.3;
        Fri, 14 Mar 2025 06:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741960105; x=1742564905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecTqySc0MfIGymwKrRWSQDioKot3rlYA9RsO/r+ZVQA=;
        b=VNs2ne0TLlIJgGmDxnlxhn3im7LGx4iXtQBIiR+BftpJLsptvGP4U08wJkNsiET4Ff
         ESew01DXBH87F1ae8Z2hZdVmGcfYnDbqNagDbIQsOQwhg+q23OHtDEZ6uE4L+EVrWDwu
         zg7FnjQCZnRPHsEPpptI7RpK8MSQt8cXNKwJT5MDok+4fHFGYzpSj5YkpDMo4EPxBBmg
         /optfKi8Gckt4f37zufhSaGJMWDncJ5GJb6IAKeqvLBfZ6mN7dAOlmI3IivNeZpnu9rc
         xodD2EnFCM8oZFOSpiWPokjSGA7RUXyJe63wI569IfwstgwDAPpMDtsSGc65uvFyoh8z
         gx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741960105; x=1742564905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecTqySc0MfIGymwKrRWSQDioKot3rlYA9RsO/r+ZVQA=;
        b=Yac/zPY2lGfyNuznj4/1KZ42EA0iEoLSitt5AOuyvWyamxS/RXwhKWlvgt451i9BAL
         1J8iB1pz35ULWHU7Qk7S+2uEnjrOwwTAJgVRsv7ULgSLJTs2YeJg4q204Nnq3yBtRwoM
         aQbuWG7ZefutqJfgjCrqGEMbZ5lXV5NDls4cyGUDOXbsD1CRGZzonIu+v97/howSNc3k
         aLZbTWWAzgERDUXokGloFubQTckSGkPo7V5rW96KvylnqfnKu/Us9Ge7Hc1QbyZo6oLE
         tRAnCADHhbGEtbGqPZVN9RONbZpd0O7C97Ya3GwqUW834xQGgTFVlFKbSzEQYQ5zVlZF
         c6dg==
X-Forwarded-Encrypted: i=1; AJvYcCUwNQ3McUoPVtKWDhgKnk/Tkzc7EM8/M3Yxar8Y2fDpozxn+CSO+g30bOkHdaw8bPdOrXVMlfGq2uM=@vger.kernel.org, AJvYcCV+TZ3kE0RuCOH6KTmpKwAcUpqCoHV7dwe9stX+ITchmHfLfgdAx1vxbOu0ORo3PTTQ5+3K3Ox88AzmWq64DDIXSEc=@vger.kernel.org, AJvYcCVNVoqXzK3SXpXwtyupz3AoRXjyv9XwUZ2AImyj+Y022vRVY/aLf2nPsy/rbWsR3pqzwDI4Wb74e3dNBPwJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzTLUmjErhrhDyttXl/t43GVVFuINmIooFwQ0HGmr0EyaHicWZj
	amBWI6Y8OdZfS8nh0M+7ph909u92993aure5LoQKGO90Svb1TLUO17CHGSx9SPvuoH0eGNU2pMT
	6RptR+xoqk9wGDA/mVtd8zEtC7PU=
X-Gm-Gg: ASbGncvC5vXmyfuL5zt+tNYrbaQRRtM91EinpIyL42p3n3lTCUtq+ENoc0o26rlnpOs
	9m5TpD7BZr6Tk0dFLeO4vSYZ8EVrJViXVwTSf8/J7Z75Ul+PyIv4XO2QLBMhC1XL6vnJG4pEFJM
	mxAU2NuvygQX1hxlj2mGKCpTkkyA==
X-Google-Smtp-Source: AGHT+IFUxWa24oSLt6X5iPrPFl8XNSeRTGltOaDZSPlLElE/bpgdT7c7FT43YLQGQ7+Q2i6NTpqb6xalSzXXDy9lIZA=
X-Received: by 2002:a05:6122:3221:b0:520:5a87:66ed with SMTP id
 71dfb90a1353d-52449919aecmr1656975e0c.5.1741960105518; Fri, 14 Mar 2025
 06:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250309211402.80886-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8sqJy1HJYkxZONqSEsFuCmENgbs_ofLyaUChtRJpj_ebg@mail.gmail.com> <CAMuHMdXkwUXn0tVVg6BzUbtnSzENGokSY7oXPQW2fuX9QiZz0w@mail.gmail.com>
In-Reply-To: <CAMuHMdXkwUXn0tVVg6BzUbtnSzENGokSY7oXPQW2fuX9QiZz0w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 14 Mar 2025 13:47:59 +0000
X-Gm-Features: AQ5f1JpUNF2L-fj2KIf8O_J9i451Mk6ntzmoe-XbZYNGI4nU5kLPcRLmKA4EZpI
Message-ID: <CA+V-a8vM+jcs3j6MYfM1tUK7USvSrCBYqh+hRFnaPq9d_jRdwQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: renesas: rzv2h-cpg: Add support for enabling PLLs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Mar 14, 2025 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 10 Mar 2025 at 19:22, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Sun, Mar 9, 2025 at 9:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Some RZ/V2H(P) SoC variants do not have a GPU, resulting in PLLGPU be=
ing
> > > disabled by default in TF-A. Add support for enabling PLL clocks in t=
he
> > > RZ/V2H(P) CPG driver to manage this.
> > >
> > > Introduce `is_enabled` and `enable` callbacks to handle PLL state
> > > transitions. With the `enable` callback, PLLGPU will be turned ON onl=
y
> > > when the GPU node is enabled; otherwise, it will remain off. Define n=
ew
> > > macros for PLL standby and monitor registers to facilitate this proce=
ss.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v1->v2
> > > - Updated macros to get PLL offsets
> > > - Switched to readl_poll_timeout_atomic() and updated the timeout
>
> Thanks for the update!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > > +static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
> > > +{
> > > +       struct pll_clk *pll_clk =3D to_pll(hw);
> > > +       struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> > > +       struct pll pll =3D pll_clk->pll;
> > > +       u32 stby_offset;
> > > +       u32 mon_offset;
> > > +       u32 val;
> > > +       int ret;
> > > +
> > > +       if (rzv2h_cpg_pll_clk_is_enabled(hw))
> > > +               return 0;
> > > +
> > > +       stby_offset =3D CPG_PLL_STBY(pll.offset);
> > > +       mon_offset =3D CPG_PLL_MON(pll.offset);
> > > +
> > > +       writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
> > > +              priv->base + stby_offset);
> > > +
> > > +       /* ensure PLL is in normal mode */
> > > +       ret =3D readl_poll_timeout_atomic(priv->base + mon_offset, va=
l,
> > > +                                       (val & (CPG_PLL_MON_RESETB | =
CPG_PLL_MON_LOCK)) =3D=3D
> > > +                                       (CPG_PLL_MON_RESETB | CPG_PLL=
_MON_LOCK), 10, 100);
> > This timeout didnt work when I power cycled after a complete shutdown o=
vernight.
> >
> > I will update the timeout as below, this Ive made sure the below delay
> > works OK after complete shutdown.
> >
> > /*
> > * Ensure PLL enters into normal mode
> > *
> > * Note: There is no HW information about the worst case latency.
> > *
> > * Since this value might be dependent on external xtal rate, pll
> > * rate or even the other emulation clocks rate, use 2000 as a
> > * "super" safe value.
> > */
> > ret =3D readl_poll_timeout_atomic(priv->base + mon_offset, val,
> >                                                     (val &
> > (CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK)) =3D=3D
> >
> > (CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK), 200, 2000);
> >
> > Please let me know shall I send v3 with this change or wait for your re=
view.
>
> I can incorporate this fix while queuing in renesas-clk for v6.16.
> But, please explain what is "the other emulation clocks rate"?
>
I got carried away referring to R-Car code, let's drop the `or even
the other emulation clocks rate`. Thank you for taking care of it.

Cheers,
Prabhakar

