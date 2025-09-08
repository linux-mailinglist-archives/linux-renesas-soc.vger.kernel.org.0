Return-Path: <linux-renesas-soc+bounces-21568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BCDB48E52
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 14:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C3107AE7A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 12:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BA93054FF;
	Mon,  8 Sep 2025 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVGIGWpd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534092FFDFA;
	Mon,  8 Sep 2025 12:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336192; cv=none; b=aibL4qATjT1ne6zFAianodfgTKKnso6Y5EC+N6GGnqMUv/EWt79Y1T4JXvW8LGbUO88iP3vCXA5z6h7Pu674kS/BFzxpa9gIA8fz/jHNObqSIs8otcydCDgYb3VsRNftjvYMoPjM69Njw9ktblXqt+1UnYY2R4/DI7HZiE5RaKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336192; c=relaxed/simple;
	bh=jbX51qGByNPjLHua/AzAs+RNROywrCegbN6XxzHxPY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pOrmGnIH3WmE6o0kE33uFsD915Eip1c0exGtzjZmXoo3tfLnb6+4tNo6u13W+l00wOwkx+3nKn6HSYCdCdXSgkmk5CYRGVPIJMltRbeMLQ5I+5TibfBiKYOs5Wti3n6VKMca2iS1yjzmaf6gTxmY0YJzzRxyGBjjD0L2bdceJho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVGIGWpd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso24363375e9.2;
        Mon, 08 Sep 2025 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757336189; x=1757940989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jXhA/1Ah93+FK7vlJK6L5q5p3lnq6cmyRBA6+5ktw4=;
        b=hVGIGWpdS5+uA6nRdfnZkTKYTDLOJjSNhy5ZN1zd/9IHHO+Cjxxq/A8ThxC7CMb+uw
         h/p1/P8jvJw74fkMs8EJb46YkXgPDE6pextUkHlT3lhq0OxjxrAeUV2Umswwk3qkolzP
         QT290o6AAQlIl5OEGna3YsmkzDXgDqZjJlJne3swUrY4I6YKbLmtz+ChOm2GsySAmk4i
         HNjQGTaAMe1FQT8xXTqQVuPBrQgcmIDLWCXnZ3jbOhCVcoNg2vHopi3z8WSV5S/EtbSp
         CdCWqeors4nvw7q1PraWqj43t/aZuK+17pEnuruEHfIRc+KqYVP7g2fxp7ZsYu/Al6YO
         41/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336189; x=1757940989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jXhA/1Ah93+FK7vlJK6L5q5p3lnq6cmyRBA6+5ktw4=;
        b=ChRUdFC1IwUdGkchwYI7WdVOMFLPugFJ5SbSTSGz50M+AazQZSrkLNrYWGcaxopfMn
         JDcIhGEOpqZdIlrcH9jdxNTZb63B+1penzXjXpfbK6+Scz9aL0fihqP5ak2cD5pLSTqy
         bUlxFwyuAsQJ9yLVv+gEWvAZsGgYuXgf0Ofv1TTD5FIjvTL27ZrfQOySHPI+oNPpC3ZQ
         c/YEV9CZ1iqnZW6Wdr9JFXjo3B4J87hAvqLG4Tt19PdP16xenojF4/yuhAvY4oXoaCkq
         nh6PjPGiy7HBCwrkwIjhcN9z8BGWX1hZCQVfl73esXzCFTt5K/RaJe6nYE4osrFMe0qn
         rUpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyxCF+gpY6+6YwwHYMD7p9ECl9/FH66TaW9kuFYYJm27d/Xl8XgTRL4+/Y/pA7Eknph+T9miv0dku3spzc@vger.kernel.org, AJvYcCWG8e4eVqerY8rOn/SkIQcxj/pkfXPkoRhSiRacIKGnK7tBmX3X/hbuc16I8xi4RJp1itbZPWidI6lJZFyoDxL4qSs=@vger.kernel.org, AJvYcCXfqS+gLyHWqCh7erun6LQhMu6VpAQI7QTnwUTZDB6UQ0YAqoDX2isucEM9Ekd3cYGO9UwtCysN0s8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+18fjBzyUwO2Eo8a+5decj9dq9S0C/EElqebE9N5+2NOHruEC
	+w+qstbLbsW+LFPnYFak2XCtXKeEpifveGwGWUy/uS2tXPSG5sNOKFUXibCT/tPRjHHdmx5V/Dy
	LZgQZO+0IJ4drtpTuByd1f76xOGzMoGA=
X-Gm-Gg: ASbGncsjc9Jo0ydyWvXuMU0dCE32j+zD7cKKC3+9wsSP1q/78HxYunQIibZxD6O6oyG
	hcmCN71ZbmqXvenUXPQ4mLu+wuPMpLf/XIXDC32fMK90anCO56XHZHb8RjLr988Zh3qtUrpkfuW
	Pud7dZz8YxNSfG+g/wztw7T/hcRK2NAdCHqthqEWl+9dgstXot5qpCGF/KGVcKDoG6+v+xf9srF
	siQVBAYuU2KfxmjQ3ed76eQlOMRf2vZIKmabjWT
X-Google-Smtp-Source: AGHT+IGY1jzDRZi2Wskrzmk/TCj2Wvk6ycmAbE+QBLmwJDwerxrBcm81T83/8uxrQUEUnY/wgbQPLteMTkKXRCWJ4ZE=
X-Received: by 2002:a05:600c:1f90:b0:45b:8f11:8e00 with SMTP id
 5b1f17b1804b1-45dddee8f49mr56317535e9.37.1757336188244; Mon, 08 Sep 2025
 05:56:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905114558.1602756-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <b48fafecc821d2099ff7e84477f36161bae13293.camel@pengutronix.de>
In-Reply-To: <b48fafecc821d2099ff7e84477f36161bae13293.camel@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 8 Sep 2025 13:56:01 +0100
X-Gm-Features: AS18NWCR810txavqIvzGyO0m0U2VPwblF8nB49EFnPnspe4V1qWZ9wraLcnzMI0
Message-ID: <CA+V-a8t46mQ29Qa4EqBDkiRhCEB-fFzWQNRqMvQhNdwix8=ePQ@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

Thank you for the review.

On Fri, Sep 5, 2025 at 3:46=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
>
> On Fr, 2025-09-05 at 12:45 +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for module reset handling on the RZ/T2H SoC. Unlike earlier
> > CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Control
> > Registers (MRCR) where both reset and deassert actions are done via
> > read-modify-write (RMW) to the same register.
> >
> > Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and assig=
n
> > it to reset_regs. For this SoC, the number of resets is based on the
> > number of MRCR registers rather than the number of module clocks. Also
> > add cpg_mrcr_reset_ops to implement reset, assert, and deassert using R=
MW
> > while holding the spinlock. This follows the RZ/T2H requirements, where
> > processing after releasing a module reset must be secured by performing
> > seven dummy reads of the same register, and where a module that is rese=
t
> > and released again must ensure the target bit in the Module Reset Contr=
ol
> > Register is set to 1.
> >
> > Update the reset controller registration to select cpg_mrcr_reset_ops f=
or
> > RZ/T2H, while keeping the existing cpg_mssr_reset_ops for other SoCs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Simplifed the code by adding a common function cpg_mrcr_set_bit() to =
handle
> >   set/clear of bits with options for verify and dummy reads.
> > - Added a macro for the number of dummy reads required.
> >
> > v1->v2:
> > - Added cpg_mrcr_reset_ops for RZ/T2H specific handling
> > - Updated commit message
> > ---
> >  drivers/clk/renesas/renesas-cpg-mssr.c | 112 ++++++++++++++++++++++++-
> >  1 file changed, 108 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renes=
as/renesas-cpg-mssr.c
> > index 5ff6ee1f7d4b..81206db2b873 100644
> > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > @@ -40,6 +40,8 @@
> >  #define WARN_DEBUG(x)        do { } while (0)
> >  #endif
> >
> > +#define RZT2H_RESET_REG_READ_COUNT   7
> > +
> >  /*
> >   * Module Standby and Software Reset register offets.
> >   *
> > @@ -137,6 +139,22 @@ static const u16 srcr_for_gen4[] =3D {
> >       0x2C60, 0x2C64, 0x2C68, 0x2C6C, 0x2C70, 0x2C74,
> >  };
> >
> > +static const u16 mrcr_for_rzt2h[] =3D {
> > +     0x240,  /* MRCTLA */
> > +     0x244,  /* Reserved */
> > +     0x248,  /* Reserved */
> > +     0x24C,  /* Reserved */
> > +     0x250,  /* MRCTLE */
> > +     0x254,  /* Reserved */
> > +     0x258,  /* Reserved */
> > +     0x25C,  /* Reserved */
> > +     0x260,  /* MRCTLI */
> > +     0x264,  /* Reserved */
> > +     0x268,  /* Reserved */
> > +     0x26C,  /* Reserved */
> > +     0x270,  /* MRCTLM */
> > +};
> > +
> >  /*
> >   * Software Reset Clearing Register offsets
> >   */
> > @@ -736,6 +754,73 @@ static int cpg_mssr_status(struct reset_controller=
_dev *rcdev,
> >       return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & bitmas=
k);
> >  }
> >
> > +static int cpg_mrcr_set_bit(struct reset_controller_dev *rcdev, unsign=
ed long id,
> > +                         bool set, bool verify, bool dummy_reads, cons=
t char *op_name)
>
> This function is inappropriately named, it does more than just set a
> bit.
>
Ok, I will rename it to `cpg_mrcr_set_reset_state`.

static int cpg_mrcr_set_reset_state(struct reset_controller_dev
*rcdev, unsigned long id, bool assert)

> Why are there three boolean parameters if there are only ever two
> combinations of them used? Just have a single bool assert.
>
> Drop the op_name parameter.
>
OK.

> > +{
> > +     struct cpg_mssr_priv *priv =3D rcdev_to_priv(rcdev);
> > +     unsigned int reg =3D id / 32;
> > +     unsigned int bit =3D id % 32;
> > +     u32 bitmask =3D BIT(bit);
> > +     void __iomem *reg_addr;
> > +     unsigned long flags;
> > +     unsigned int i;
> > +     u32 val;
> > +
> > +     dev_dbg(priv->dev, "%s %u%02u\n", op_name, reg, bit);
>
> Replace op_name with set ? "assert" : "deassert".
>
OK.

> You could later add a str_assert_deassert() helper in string_choices.h.
>
Ok.

> > +
> > +     spin_lock_irqsave(&priv->pub.rmw_lock, flags);
> > +
> > +     reg_addr =3D priv->pub.base0 + priv->reset_regs[reg];
> > +     /* Read current value and modify */
> > +     val =3D readl(reg_addr);
> > +     if (set)
> > +             val |=3D bitmask;
> > +     else
> > +             val &=3D ~bitmask;
> > +     writel(val, reg_addr);
> > +
> > +     /* Verify the operation if requested */
> > +     if (verify) {
> > +             val =3D readl(reg_addr);
> > +             if ((set && !(bitmask & val)) || (!set && (bitmask & val)=
)) {
> > +                     dev_err(priv->dev, "Reset register %u%02u operati=
on failed\n", reg, bit);
> > +                     spin_unlock_irqrestore(&priv->pub.rmw_lock, flags=
);
> > +                     return -EIO;
> > +             }
> > +     }
> > +
> > +     /* Perform dummy reads if required */
> > +     for (i =3D 0; dummy_reads && i < RZT2H_RESET_REG_READ_COUNT; i++)
> > +             readl(reg_addr);
>
> Both verify and dummy reads could just live in a single if (!assert) {}
> block.
>
I'll move the bit checking after dummy reads.

val =3D readl(reg_addr);
if ((assert && !(bitmask & val)) || (!assert && (bitmask & val))) {
dev_err(priv->dev, "Reset register %u%02u operation failed\n", reg, bit);
spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
return -EIO;
}

> > +
> > +     spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> > +
> > +     return 0;
> > +}
> > +
> > +static int cpg_mrcr_reset(struct reset_controller_dev *rcdev, unsigned=
 long id)
> > +{
> > +     int ret;
> > +
> > +     /* Assert reset */
> > +     ret =3D cpg_mrcr_set_bit(rcdev, id, true, true, false, "reset");
> > +     if (ret)
> > +             return ret;
>
> No delay necessary for any of the modules that can be reset?
>
Currently the HW manual doesn't mention any delays.

> > +     /* Deassert reset with dummy reads */
> > +     return cpg_mrcr_set_bit(rcdev, id, false, false, true, "reset");
>
> Copy & paste error in op_name, but that is fixed if you drop it.
>
Ok.

Cheers,
Prabhakar

