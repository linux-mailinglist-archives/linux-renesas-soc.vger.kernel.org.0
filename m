Return-Path: <linux-renesas-soc+bounces-7313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE1892FD59
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 17:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAE3B1F20FDE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170DC16F27E;
	Fri, 12 Jul 2024 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CV5y2iNk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1558821;
	Fri, 12 Jul 2024 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720797356; cv=none; b=QI1p69+CMgobUCouRplBqEIIf/06I7oeCGsiefY4hCQRvrAjCiBwMD5ceYRVu06dAcWjBrh90l2gffWAfNA5w8Qc8zPPHb8QZD2J4LHD3VwoJ1Uj4+hNGr/X4aCa62AA6e+kQpkOi3NKuKZmt3lXiljXX+df/4tE4HW/Fwibyj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720797356; c=relaxed/simple;
	bh=ZMqDCOQzmWQ3vw/EWvNxWWgzx7s6SQPEwN78IR/9lRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZs0tR6JzH0LosJrtUxrwbQhPGjuHduNWhw9DWcAqzSqoUatgoZIZVeBnXdMHw805kgB5ONyEU7oG6SjMUAuXpyghU6KuhPwcS5OxpNuuDIt6Cx8uQye6cvpfyiECVBFRuoCbm+pxmJy6kX9q4gVbGH6ZCS+M0GI4nq8mu2pSaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CV5y2iNk; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4494d41090bso11767941cf.3;
        Fri, 12 Jul 2024 08:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720797353; x=1721402153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL4Tmaqhg4JpjPf66oicYe63pW6/Jp1gnlgfBEo7KYI=;
        b=CV5y2iNksk1tv34sq3yONHSingjafRlalCM1crSarj7WeXRw3z6g338RLql/5fYzRo
         5I+AnUjldkpksoVa80H5QJc6uTlTit2NXBTdR3npgX92YhXpozRz/iDmM6lcClMcP7CM
         /sen7bhjVNGoG6UejzOXJ2KTMlfwLAyaeH/0wUgGQQi7V/h15v3W0NLgyA3sUqLyDASZ
         plV7b9Kx94WN0V93dEAg6dt9R8oAVfrSjaxgPRXIvvjcG2dbcXGT2fMneRTUR7n8dhNB
         m5XY90RKu9IooscWLIuuyhQKDc/n+RqWVM1fedKfftRCeN01gZDJcX7PnFbfvXAcO0Nu
         nccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720797353; x=1721402153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oL4Tmaqhg4JpjPf66oicYe63pW6/Jp1gnlgfBEo7KYI=;
        b=uvTV9YzhMOdBWuZTjohY5VFDd8rewblHyAiVwo/mS7rvJwUJIUMHfdQToQGqCDNn/Z
         s/hS5rR84H7TP7sp2gzib70q1iLPimWSRa4PoMjqlF7XSufTBHhvbdT49gvRETnPw6da
         nLFxZgw7n4JdjV09p2a1WuPLhECRGOmM9GP5xzdD40n81RFVIpsLWqvIJtjyqQOoB06Z
         AuD7JTwh5uS+/uEON0KmGiwlgV0VZ50vWpp9Zlc30BCS+r7rBdyo3PaUOkJdpfWxgu9K
         NVL4Vp4gkQzn5DSj5RmwMHsza4xe2HO2+w0dycg0psHQ8bdelIxe6kPCTCyPS1EyWvKc
         fJrw==
X-Forwarded-Encrypted: i=1; AJvYcCVhK26Umtp4oHVZfkdnz2e/745DMeigLD8hqSZI6eV76QUjPMTbV2vx+hSJom5MwEHZAq7yBAq9cg7MeiUtGxgrGE3EpYgrpdNvQgY/fxr6L77WI87SXfDrBtRc6WE+0bvSrNh68htWIViZrZmOP/oK4rpdkyA1hRon8l2BzKUr8hpyfSKbjzLsdn2eLyRariydMDenzAqOGBgZw8B81HE/NNBvd4TL
X-Gm-Message-State: AOJu0YwgwAmhPXoMORskTjfINwxD8Whdkw8yGqza7RXz6EPLN4CaKAU8
	Bmfju5wsUjh/Oy9qT/JgmrjczSg5qlM1A1BsNIq+2VVdFacHQDn8v3YEvMNdb70u9NR0qM7oyeb
	eL0jIPWtsEiM90fGH0pQkUNtVHGrvaw==
X-Google-Smtp-Source: AGHT+IGVjWLo+lKB3TvjfoMP0SU22yeCt/L73aepvGxfr4vy/U0GgA6MwDR6cKD04/2zYaKmdHL2gegIOQd32s40n30=
X-Received: by 2002:ac8:5a96:0:b0:447:f4e0:8d11 with SMTP id
 d75a77b69052e-447fa918959mr160487831cf.29.1720797353267; Fri, 12 Jul 2024
 08:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240627161315.98143-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV5Pyy=5-N9nUZZSOnnpGf2Kp3miDMM5H3b+ah2QUUMtA@mail.gmail.com>
In-Reply-To: <CAMuHMdV5Pyy=5-N9nUZZSOnnpGf2Kp3miDMM5H3b+ah2QUUMtA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Jul 2024 16:14:23 +0100
Message-ID: <CA+V-a8uVcCkhqA9frCbL5MBO1FfFrj2EssDEDYOMw2AYHMK8Xg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: renesas: Add RZ/V2H(P) CPG driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Jul 12, 2024 at 1:00=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Jun 27, 2024 at 6:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add RZ/V2H(P) CPG driver.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - Added CLK_PLLDTY
> > - Added core clocks sys_0_pclk and iotop_0_shclk
> > - Dropped r9a09g057_crit_mod_clks
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
>
> > +static const struct cpg_core_clk r9a09g057_core_clks[] __initconst =3D=
 {
> > +       /* External Clock Inputs */
> > +       DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
> > +       DEF_INPUT("rtxin", CLK_RTXIN),
> > +       DEF_INPUT("qextal", CLK_QEXTAL),
> > +
> > +       /* PLL Clocks */
> > +       DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
> > +       DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
> > +       DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
> > +
> > +       /* Internal Core Clocks */
> > +       DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, =
16),
> > +
>
> Missing comment "/* Core Clocks */"?
>
Agreed.

> > +       DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1)=
,
> > +       DEF_FIXED("iotop_0_shclk", R9A09G057_IOTOP_0_SHCLK, CLK_PLLCM33=
_DIV16, 1, 1),
> > +};
> > +
> > +static const struct rzv2h_mod_clk r9a09g057_mod_clks[] =3D {
>
> __initconst
>
OK.

> > +       DEF_MOD("scif_0_clk_pck",               CLK_PLLCM33_DIV16, 8, 1=
5, 4, 15),
> > +};
> > +
> > +static const struct rzv2h_reset r9a09g057_resets[] =3D {
> > +       DEF_RST(9, 5, 4, 6),            /* SCIF_0_RST_SYSTEM_N */
> > +};
> >
> > +const struct rzv2h_cpg_info r9a09g057_cpg_info =3D {
>
> With my suggested changes to [2/3], these two can be __initconst, too.
>
Agreed.

Cheers,
Prabhakar

