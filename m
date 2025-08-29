Return-Path: <linux-renesas-soc+bounces-21066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 338ABB3B890
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 12:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45A2E7BE425
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 10:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501E530E0D5;
	Fri, 29 Aug 2025 10:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKB5dFnz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B00279DD6;
	Fri, 29 Aug 2025 10:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756462602; cv=none; b=tXNUBMF4mKtV3kUT+qicTUgx/dkENDhu84eGHRKgTE7I3GBCMwyciwfjQxSUoEHR4Q18kHC/EbLc9B1kMD36jOcnTLqkNqbUwM6gjxeQbvhcUpCxiSHd9woAX1qNZHPdSqJFYUguiyYq9g4br9j2e7kwzx7pr7V5Xqgv9CKSg9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756462602; c=relaxed/simple;
	bh=Fo2BSo1uuGZPD8/kbpcTgSnb4bvZP0cwCSjGbYafPC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kIFRJraauo9Xs4DKmj5i2qabyiCgN4M9zEEH/mjxvcXmoCcVM1VErIeUB3lV+Z9oeoqTQ3UtSIc/Ig6sYgjRxhFxI+tuN3YT0EDyIxZlm7QgfJEcORhZwgEgckfy6tVgDJLJ3v1izIdEf3Tb+VvvxYMcheA/FPTwb1qZyXPHMk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKB5dFnz; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3c7ba0f6983so1185495f8f.0;
        Fri, 29 Aug 2025 03:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756462597; x=1757067397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNjJcb/AnhYp3bRUecCJOkXacIhhMtPAM2CmxFDzs84=;
        b=aKB5dFnz3WYs1tX1SCUFaM1GcbW/Ka5DPhhrjMvK7QhhM2gnrw0ayWaCa08fLTSBcE
         jS69j34QEKcwJuJr7zR4bsT7lQ8LDGqlBueHlhbnYGf+wsAK8m+tD5GdzX6oA3U9hCgx
         kisWW/tMwQmwYpdBbn92gvzU8eqihtEQFk9GVTy1MbB1RAy3evNpIgh2zbA0Rt9ayYgl
         bt6QKUR/qwU0D5312NYtDSDr8y5PwYK0ZoPUx+gi3UW9UWaiOR1MEMA1F9amtqYaqFaW
         f3Ova7sjCaxoPI8xkVYVKxy3xyXs1uwcFVncsieMWPjSevLmjv1wxBbDnQzGsD0BldDC
         LVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462597; x=1757067397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNjJcb/AnhYp3bRUecCJOkXacIhhMtPAM2CmxFDzs84=;
        b=w8FgnCOC0tNQSa7v0pR3KT+YQm9msAu8AcCzQRf4PuyncWyUyKU27N3D6lEi5tavdO
         NTzlkEZyNjmxSv46CZZ9wXu80XmrBmHRSWLLCTYR/5Zu2eEIMS01hRFNvsZp7c5JXXLy
         vZe4UUSTewROKHtuwFVwheWvt6+g4cJYezkIIyRQ1j60qTKxoEeF9EMARx8H6XZCJasF
         N9aanqEftFWuIto/Tu8WzaERgsrhJqGgeX9EfZtfWPy3ZZB35eBVDSG7ZkTcmQEwDNcx
         eJJQiGOM6AoRrPsSf/Wcu7KBI3vTEI84GLIITwyT2/1S44cbvJ3SAjKhtfKYa2Dc8k3q
         okOA==
X-Forwarded-Encrypted: i=1; AJvYcCU2eQg7p46uWSbkeKgyfkMMNT5SvG1JDVZqkaUl222Y6Rs7nXfIN4aUYE33qpgnO23YiCQ9xJ5h087RPyiN@vger.kernel.org, AJvYcCWTK8HlFVJM8+2Hvt30XbCHrsZG7+88XqEehg3J7xYcgboSPPga+NIFQytPhdDOef8fCOPn4nLvbX/ZKp14R9CobfE=@vger.kernel.org, AJvYcCXtPSbq2NIgfDDQVRRV+9FsTRWUUW7fswVNKYfWNGF9lZSU2IbMaUtQToW/8b+Yux3YXF6VfSOWHTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9IAC6lWxumJNX6OpTuUpjBJLpbDDitT113A/IMrJR6FgLMoXn
	eg9XkBQDRkxzkQjHjW8KrFYupkIOgwBrU3xJqgFZEpskOqq/y6qNk6JpyEi3tB7HoNAtjj4HKMr
	IFvf68EAOKoSCdTVKYqM8uXHHgt51kpg=
X-Gm-Gg: ASbGncu3qyeHl/mf7aBeWallNYVO2FPn9wFLSFsu/8u3Ui3UTuIAbsGRXeR0CxhGIMj
	ajirQnWxbNPhNpEmcApugml378f727SGX0f6hkn4w79xCxRtEOhfcAvMDjPTlthueuSr3D73C4p
	smZx007fGj6C7hrJjOisi8D60MgrUIjO40VcBIfu71LU0qMq2FEIoPfFlt+eHZ1fs+koCYV7HYz
	ZGTePJK
X-Google-Smtp-Source: AGHT+IESXEGfmQuLFsgsjcdDhNuOM2wd/ylN9NiufcjNfGjJ1YHgIqENqbfoiK/ve4RGkN//ckte3YYhYKSCRByp8w4=
X-Received: by 2002:a05:6000:40c8:b0:3ce:caa7:d7f1 with SMTP id
 ffacd0b85a97d-3cecaa7d9e6mr3049546f8f.27.1756462596628; Fri, 29 Aug 2025
 03:16:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820204810.2328183-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <d0a4368ce2f4743457f98d8559aaeee097b78d3e.camel@pengutronix.de>
In-Reply-To: <d0a4368ce2f4743457f98d8559aaeee097b78d3e.camel@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 29 Aug 2025 11:16:10 +0100
X-Gm-Features: Ac12FXw6RPfl2JpQBCT71xLJj0ymVoY-LxhRk5xnoQ1_I5nqlBqI0b1GzPhqj9Q
Message-ID: <CA+V-a8t0Q9+wUh0wOaz=2nd0=8p3XiVpxcejQiTgee1+LD282g@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
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

On Fri, Aug 29, 2025 at 10:46=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix=
.de> wrote:
>
> On Mi, 2025-08-20 at 21:48 +0100, Prabhakar wrote:
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
> > v1->v2:
> > - Added cpg_mrcr_reset_ops for RZ/T2H specific handling
> > - Updated commit message
> > ---
> >  drivers/clk/renesas/renesas-cpg-mssr.c | 139 ++++++++++++++++++++++++-
> >  1 file changed, 135 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renes=
as/renesas-cpg-mssr.c
> > index 5ff6ee1f7d4b..77a298b50c9c 100644
> > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > @@ -137,6 +137,22 @@ static const u16 srcr_for_gen4[] =3D {
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
>
> Does each of these registers contain 32 reset controls?
>
On RZ/T2H SoC for registers MRCTLA-MRCTLM none of them have 32 rest
controls in them; For the bits which does not have rest controls they
are marked as reserved.

> Why are reserved registers in this list? It looks like the driver
> allows poking around in reserved registers.
>
The HW manual currently lists registers MRCTLA/E/I/M, for the rest of
the registers I have marked them as reserved to avoid breakage i.e. in
future if MRCTLC register is exposed we won't have any breakage.

MRCTLA   -  0
MRCTLE   -  400
MRCTLI    -  800
MRCTLM  -  1200


For example, MRCTLE[0] controls GMAC0 PCLKH reset; this is represented
as 400 in DT.

This driver uses `4` to get the offset from  mrcr_for_rzt2h array and
`00` is the bit to be updated. So suppose in future if MRCTLD is
exposed we just use that in DT.

> > +
> >  /*
> >   * Software Reset Clearing Register offsets
> >   */
> > @@ -736,6 +752,102 @@ static int cpg_mssr_status(struct reset_controlle=
r_dev *rcdev,
> >       return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & bitmas=
k);
> >  }
> >
> > +static int cpg_mrcr_reset(struct reset_controller_dev *rcdev,
> > +                       unsigned long id)
> > +{
> > +     struct cpg_mssr_priv *priv =3D rcdev_to_priv(rcdev);
> > +     unsigned int reg =3D id / 32;
> > +     unsigned int bit =3D id % 32;
> > +     u32 bitmask =3D BIT(bit);
> > +     unsigned long flags;
> > +     unsigned int i;
> > +
> > +     dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
> > +
> > +     spin_lock_irqsave(&priv->pub.rmw_lock, flags);
> > +     /* Reset module */
> > +     bitmask |=3D readl(priv->pub.base0 + priv->reset_regs[reg]);
> > +     writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> > +
> > +     /* Ensure module reset control register is set */
> > +     if (!(bitmask & readl(priv->pub.base0 + priv->reset_regs[reg]))) =
{
>
> Can this actually happen on this hardware? Under which circumstances?
>
This check is based on the HW manual,

"When module is reset once and released again, make sure that the
target bit of module reset control register is set to 1 by reading the
register before releasing from a module reset. Then release from a
module reset."

> > +             dev_err(priv->dev, "Reset register %u%02u is not set\n",
> > +                     readl(priv->pub.base0 + priv->reset_regs[reg]), b=
it);
>
> Why read the register again? Could it have changed in the meantime?
> Maybe it would be better to store the value that was actually checked
> and print the variable here.
>
OK.

> > +             spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> > +             return -EIO;
> > +     }
> > +
> > +     /* Release module from reset state */
> > +     bitmask =3D readl(priv->pub.base0 + priv->reset_regs[reg]) & ~bit=
mask;
> > +     writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> > +
> > +     /*
> > +      * To secure processing after release from a module reset, dummy =
read
> > +      * the same register at least seven times.
>
> Why 7? Is this documented in a reference manual?
>
This is again based on the HW manual,

"To secure processing after release from a module reset, dummy read
the same register at least seven times after writing to initiate
release from the module reset, and only then proceed with the
subsequent processing."

> > +      */
> > +     for (i =3D 0; i < 7; i++)
> > +             readl(priv->pub.base0 + priv->reset_regs[reg]);
>
> It would be better to define a macro and use it in both places instead
> of the magic number.
>
OK.

Cheers,
Prabhakar

