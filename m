Return-Path: <linux-renesas-soc+bounces-6833-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4391A7D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 15:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAA091C20964
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 13:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49B7193071;
	Thu, 27 Jun 2024 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC4qJacV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A7A13E41F;
	Thu, 27 Jun 2024 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719494917; cv=none; b=W24xOQJSfbLtyeRri7EGkkkM0VGSpTUaMgoyYZnKotQ0ZhDcanNEHEr8BpS9ar1U5apFJvRgYirk/QHrfQPWtbOr24gx3pc5XVh1GCIxNSTWRt42/BRKbwUWwonpev3NcClKwhnmuHkl5xhAg/n/fAvrlPPdQlC910rDn3kYoPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719494917; c=relaxed/simple;
	bh=CMhrV/EMQKNc8DtgP3zQLWPt79Mu0mM42/Fm/p1zdyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIpNBr5GrBMKdiYqiZqK9glXKgu3hNR6gDfFVl58Co2iOLpfikEL6OfD8WL8DJ9hJrKDZ+J2YNllJ5SQJvisqaHS4PBRI3Nownzw40r4CmcWtqAuLUBEOsSYHlsvcifC8WCDLLEmzqCgPGa1PNASFOeE938F87H+e87pHhJnMBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC4qJacV; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-43fdb797ee2so34574191cf.3;
        Thu, 27 Jun 2024 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719494915; x=1720099715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+hil9WY35Wa1ionYQXEruNPelQjjvx4CcxfPHHuzI4=;
        b=BC4qJacVxclMTQ+Ewl3SlTZCRC2MNdSUQzSlXLY1fOe6/s59KuTnz+2rFw9jm2yDxS
         pUO0STSnit4q67KcQaDm3YTGyEeKKzSB01YfJbflOmoMXp/n0XBIcW3zxNGPge709RUh
         4sTbtad0dA9V7KxBawFoDG4v7thKz5d6cHRmKksrqn2oXG3mybnfTYpAmNicqTvITeQ5
         snk23ui/jTkez3BTz/pu18Oah6LzwZ2oFo0fbNUhaxg7mAzjWOWGeW14duf15qGxizF8
         RdRkMdYVmlByuD0Gdw+wVO1lVHOz42aBjPN4nQR8bwDtuMxhDWL5TF8LRWQTyzIVrJf0
         1E+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719494915; x=1720099715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+hil9WY35Wa1ionYQXEruNPelQjjvx4CcxfPHHuzI4=;
        b=icYYzZe1MNT3OSin1q3ZuMT5uCxKKsX15UUbw1K1hMfUr3zDrxQf07DiIOjjfLt7jq
         9o2e9XFpMlOOyRe+2Ripq0zF52vTdMI8EYhMB1UnWJeZSN6DpsO4IZRRkj3No93mQrXY
         pDUoBG8iBwvK92MRZ9ElC8VdO/XTzdhOLp9eTeW8IH8G3mVDpCPKyn86GED8ibZ78idm
         5SBHHeITIKAn6qIHf+roxmP9vQwtoBL9EvGozesP2ljAg7K+WLgP22VuIrAiRBeFqc+V
         HmDWFpwXW6fAFRq091Y4PAzoRkkCETNcHvF5jR1pAVhUjhR0SSfGF4aZinGBbykItOo4
         Dk1A==
X-Forwarded-Encrypted: i=1; AJvYcCUHS91BqvtrLoqktjLZmULjh/3c3QpTLJqLNeNWFzk1xgEZIU3aYlg20LS1fjZ1bn6Wae9B3wlmjGpBMty0WE+dp68u5WGH8skxmhhYSeIZPsv3PMLd5Hdd/ODcCLcYhoJ0KluZIs1GMaohLH4fiP8RkCEdr1lyndKG8cax9XQvgPPeheXwCI4xRG8+x9i1ZQRz4LWttT1vpJtyGlyuVYlswsoOsKkm
X-Gm-Message-State: AOJu0YxJQh4be5NlBOVPSIXBIQ3ZDNmRU4Pl7+rkQGP7ulHoUc1MiaaD
	rhLoNp+9mR9uPmrGXEbF+xg22/a1NcrkeefcTqB6+kFwvMrH9J9DfiuOR6QzZgv0jUZW1QO1kXc
	tqyxyeY+WXO4cDuOXON/gUCC1keA=
X-Google-Smtp-Source: AGHT+IEpYivVPI51DbvGmylHBYfhDe4Uycc76I2dwHRWAQvwreeK0ql2q/ejAMGxQU/Hivf5lR/7Y1abomaQquPY9VU=
X-Received: by 2002:a05:622a:11d1:b0:446:3b38:345f with SMTP id
 d75a77b69052e-4463b384243mr42068181cf.10.1719494915149; Thu, 27 Jun 2024
 06:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240610233221.242749-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUErrk1nq78vyvYoj4TkBiDhjMtbHExF3c2u9q5kWPH9A@mail.gmail.com>
In-Reply-To: <CAMuHMdUErrk1nq78vyvYoj4TkBiDhjMtbHExF3c2u9q5kWPH9A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Jun 2024 14:27:34 +0100
Message-ID: <CA+V-a8t3VXvgnh50RftSPA7tYAipfuMC1E0gBfYD6etWqOGHRg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/4] clk: renesas: Add RZ/V2H(P) CPG driver
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

Thank you for the review.

On Wed, Jun 26, 2024 at 11:14=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Tue, Jun 11, 2024 at 1:32=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add RZ/V2H(P) CPG driver.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Updated commit description
> > - Dropped pll_clk1/clk2_offset
> > - Made r9a09g057_mod_clks/r9a09g057_resets as static const
> > - Now using register indexes
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
>
> > +static const struct rzv2h_mod_clk r9a09g057_mod_clks[] =3D {
> > +       DEF_MOD("scif_0_clk_pck", CLK_PLLCM33_DIV16, 8, 15, 4, 15),
>
> So this relates to module clock 8 * 16 + 15 =3D 143 in DTS...
>
Yep.

> > +};
> > +
> > +static const struct rzv2h_reset r9a09g057_resets[] =3D {
> > +       DEF_RST(9, 5, 4, 6),            /* SCIF_0_RST_SYSTEM_N */
> > +};
> > +
> > +static const unsigned int r9a09g057_crit_mod_clks[] __initconst =3D {
> > +       MOD_CLK_BASE + 5,               /* ICU_0_PCLK_I */
> > +       MOD_CLK_BASE + 19,              /* GIC_0_GICCLK */
>
> So these relate to module clocks 5 and 19 in DTS.
>
> Actually none of these clocks are created in the driver yet, so I think
> these critical clocks belong to the patch that will introduce them.
>
> I am wondering if critical clocks should just use a flag in DEF_MOD()
> instead...
>
Agreed, I will add a flag for it and have two macros like below,

#define DEF_MOD_BASE(_name, _parent, _id, _critical, _onindex, _onbit,
_monindex, _monbit) \
    { \
        .name =3D (_name), \
        .parent =3D (_parent), \
        .id =3D (_id), \
        .critical =3D (_critical), \
        .on_index =3D (_onindex), \
        .on_bit =3D (_onbit), \
        .mon_index =3D (_monindex), \
        .mon_bit =3D (_monbit), \
    }

#define MOD_CLK_ID(x)    (MOD_CLK_BASE + (x))
#define MOD_ID(x, y)    ((((x) * 16)) + (y))

#define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit)      =
  \
    DEF_MOD_BASE(_name, _parent, MOD_CLK_ID(MOD_ID(_onindex, _onbit)),    \
             false, _onindex, _onbit, _monindex, _monbit)

#define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex,
_monbit)    \
    DEF_MOD_BASE(_name, _parent, MOD_CLK_ID(MOD_ID(_onindex, _onbit)),    \
             true, _onindex, _onbit, _monindex, _monbit)


Cheers,
Prabhakar

