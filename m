Return-Path: <linux-renesas-soc+bounces-18860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E67CAEC10D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 22:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D89B43ADC8A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 20:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F64E22A7E0;
	Fri, 27 Jun 2025 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrDkSTxZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C5D1F17E8;
	Fri, 27 Jun 2025 20:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056453; cv=none; b=RZ73V0MVt1gPUr0Y3O3d3jSuY1hRfvfP29D2nNpG64YxehXmmUOgg38WfH9CflB3/6DvdbfikMlqYaqCdeFlWXkic3yF33DtJTd5JBoMee1LvYmyphwBJT0b0t3uL+aQEYwfr2BURT7Eht/8vx1aj5esrmVCKl1GfNVlIV+hP6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056453; c=relaxed/simple;
	bh=iiUQq76IQA17+Pru1iWcynDOuQvwdeIl3L2j6A40dus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aigt9s9NSUdoP/i9bKv97VNPgxNeegz3AXBhUponb/i1rtfwyiPaqFRNcRDZpIX9jORwG9aoCRrl7vMFN37SAPRxUwZu5zoY5Hf4oZeTacTnLFLH2Y5hZ9IMTsy6UgTCsujL6FjOkp5SUpbUDnl0IAZQYS09rZ/1LYSJHSx4lUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrDkSTxZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453608ed113so3074385e9.0;
        Fri, 27 Jun 2025 13:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751056450; x=1751661250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpiQyytJ0KMzWWY5PNEIWElmrKBfnMQjCYIhq/3zCbQ=;
        b=nrDkSTxZzA5vARAisCFnKvQKIK7+8Xmem8IoBdPjPT/nNTa9pzHr+X+W0XzpwjJJJ2
         6ekvQzIbDKQRyzqxsBxQKe0/VgjXZIHeo3Pavretpj1Z65Z7j9c5xlbyIMObz7ytNzFE
         KU9Mz7z9UAFwUQ8n1patDUh46VBar8G++ZFAWPmmibgL+rbH/uEVr7wwh3fRVr0F5zo0
         1HFMblRF8IF0Q+Usx+KeHrj24Lg3ab84h7OtGL8yrQ6dUfN5xgrXu5+/WU5BmY+lsAaj
         SmqZtJi6MzssFnTcYmQ9IkdAyb0txevWZhkmsqHBIKMa1iIywiBIhoAGguotbcf5p38k
         145Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056450; x=1751661250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpiQyytJ0KMzWWY5PNEIWElmrKBfnMQjCYIhq/3zCbQ=;
        b=a0QwpOxz5rBY3G6ujsiKKdUfjqRefXDl3cKnAINtui/2MxpmgmV7878i93ohmFeQHR
         96/+/zu729/iQpEJ0YshwCYJa9bUG8vfJNCH8DZ31yntVlBHGVRaEg152j+6Mi3XEkbj
         faxyMlG9EsZGponBYMQl8N8IGCJnEpokAvWHgJYrzxNw6clhlsubAcXR6xlP2LxudsyO
         Qgo2VKsGb/3eYu8jCxV0OlScCu2weXj66e4vE2w4SqfKnKKI1i/bFjzPntROObDVK3CX
         5RL5aazZnoC0cs68DTL7mLlPn1x+vDWvQEXfUEmyhv4kCeMNrroKie4qOGC9BDcYZfJU
         675A==
X-Forwarded-Encrypted: i=1; AJvYcCVRGKvQBvBNYc1Uvv4FTak8iXpf88wKA/WZQSF9L5OPe7bvgj0Eyh1UDo0xf5cvx445ORHzAY3KDa+JVX6yAHY6E4k=@vger.kernel.org, AJvYcCW1Owy5GTVhOkPgFNl5I/MCgmh2Ld2CgnDZSzP/8JB7PFdsb9frMab1RddhjZF/rlPkFax1w7ODSbF7QQo1@vger.kernel.org, AJvYcCWnlJ079hqmrCq8zhchqpn9MO12ESI3wcW8f3NEAKFDQfiacsjhW5lhHfdV4qef/LxqaBu/pynSw4Ky@vger.kernel.org, AJvYcCXPdWlPTWEPkmo5UEz7CoQEDwHQd862SGcjtC2BE6yRrKtoJYM318LOitsSZYjpfo3MXewc5cksFbT6@vger.kernel.org
X-Gm-Message-State: AOJu0YxGFYGy0gOF++Jt/OhEbtjMdN3lkCCRzoawqd1U544rXFVBBZny
	a7sy2/8s2aDPlyPebq6hvT2jZhfFvpzRYEYWYVG8B/TzV/DjIQACc6hKYR9dbO1lhewx/bRsRRb
	Tsu1QQ+zHdO12IoX92KGKUjhX8FrHIt8=
X-Gm-Gg: ASbGnctemjWRcLb9DEpW6ekDx5sIdUH+vJDITJj36nZ8xopAJKuT4yrH/cfZ619i3TQ
	E0/txwPP21bgycqryCV7Q+noqaA7VkQPoWeVGQdNpmxmETAH8SAV2m5LWHG3Hu8xAaJrglAMQns
	RUHjit6vhw57ts/2op/DPH3XfgMx7Ti0wt9Yj3Kwyly7Y7W4Tkx7Kx3mZ9fXUf33JwHB8x/98ns
	9o=
X-Google-Smtp-Source: AGHT+IH1we4l8TSLRHqWA9UawCQgS0sZUtmWk4EfDQsVgWet8wb0/4Ml2IXH7vL2eKFsllpPVAEOxRuEa+K9dz5AeMU=
X-Received: by 2002:a05:6000:20c4:b0:3a4:e7d3:bd9c with SMTP id
 ffacd0b85a97d-3a8f52b64fdmr2956569f8f.17.1751056449449; Fri, 27 Jun 2025
 13:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624173030.472196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250624173030.472196-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWsA4mC+D8ftx74_XeuBjpv-9EQN0rgVLPsxjmrO3+rWg@mail.gmail.com>
In-Reply-To: <CAMuHMdWsA4mC+D8ftx74_XeuBjpv-9EQN0rgVLPsxjmrO3+rWg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 27 Jun 2025 21:33:43 +0100
X-Gm-Features: Ac12FXy9AMVc6a5m4cjCAXc_6PL2PvT_9O5j-pCG6-K-7YQ1SyWLo-YIppgIWEk
Message-ID: <CA+V-a8ubw=1JdnH-Sr0xj222e0-+Q97KYAYqUPMVU4N3siL5jw@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: renesas: rzv2h: Add fixed-factor module clocks
 with status reporting
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

Thank you for the review.

On Thu, Jun 26, 2025 at 2:22=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 24 Jun 2025 at 19:30, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for fixed-factor module clocks that can report their enable
> > status through the module status monitor. Introduce a new clock type,
> > CLK_TYPE_FF_MOD_STATUS, and define the associated structure,
> > rzv2h_ff_mod_status_clk, to manage these clocks.
> >
> > Implement the .is_enabled callback by reading the module status registe=
r
> > using monitor index and bit definitions. Provide a helper macro,
> > DEF_FIXED_MOD_STATUS, to simplify the definition of such clocks.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> One early review comment below...
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +static struct clk_ops rzv2h_clk_ff_mod_status_ops;
>
> This is an empty block of 200 bytes, consuming memory even when running
> on a different platform.
>
Agreed.

> > +static struct clk * __init
> > +rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *cor=
e,
> > +                                       struct rzv2h_cpg_priv *priv)
> > +{
> > +       struct rzv2h_ff_mod_status_clk *clk_hw_data;
> > +       struct clk_init_data init =3D { };
> > +       struct clk_fixed_factor *fix;
> > +       const struct clk *parent;
> > +       const char *parent_name;
> > +       int ret;
> > +
> > +       WARN_DEBUG(core->parent >=3D priv->num_core_clks);
> > +       parent =3D priv->clks[core->parent];
> > +       if (IS_ERR(parent))
> > +               return ERR_CAST(parent);
> > +
> > +       parent_name =3D __clk_get_name(parent);
> > +       parent =3D priv->clks[core->parent];
> > +       if (IS_ERR(parent))
> > +               return ERR_CAST(parent);
> > +
> > +       clk_hw_data =3D devm_kzalloc(priv->dev, sizeof(*clk_hw_data), G=
FP_KERNEL);
> > +       if (!clk_hw_data)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       clk_hw_data->priv =3D priv;
> > +       clk_hw_data->conf =3D core->cfg.fixed_mod;
> > +
> > +       rzv2h_clk_ff_mod_status_ops =3D clk_fixed_factor_ops;
>
> This overwrites rzv2h_clk_ff_mod_status_ops in every call (currently
> there is only one).
>
Good point.

> > +       rzv2h_clk_ff_mod_status_ops.is_enabled =3D rzv2h_clk_ff_mod_sta=
tus_is_enabled;
>
> If there would be multiple calls, there is a short time window where
> rzv2h_clk_ff_mod_status_ops.is_enabled is NULL, possibly affecting
> already-registered clocks of the same type.
>
Yes agreed.

> Hence I think you better store rzv2h_clk_ff_mod_status_ops inside
> rzv2h_cpg_priv (so it is allocated dynamically), and initialize it from
> rzv2h_cpg_probe (so it is initialized once).
>
Sure, I'll update as above, that is allocate only when needed (and only onc=
e).

Cheers,
Prabhakar

