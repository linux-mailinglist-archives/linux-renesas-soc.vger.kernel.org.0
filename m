Return-Path: <linux-renesas-soc+bounces-23310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C683BEFD9C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 10:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AD18189D2CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 08:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17AF2EAB63;
	Mon, 20 Oct 2025 08:13:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8C12E8881
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948016; cv=none; b=rViGw+Dmsa39SjvFFqWpcHvvOwxWYD3tB4ltKsqxCoR25U2LD63ST0mufrMrWaNnYUWtY0mkw6+qR3oPLwKkmDR3/jN3GPB3iKUlxYWX3GaO/W1xSLppaGKPIyHf+jA3jcclZwm+TpE60O+Br2n0NAngC/taZ3pAurLzkBmVfcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948016; c=relaxed/simple;
	bh=pBOe2oj4HPen9NXEf4tPmq1Jfw0IEwwy/FGaDyb3WRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmLy1ig/n63H85nrdWyK1BVhNSfreTwpmUTglve+k2DYG9n/gjOIt/+XAOMhK0tiHUfbTYXmndaO2sKXFy2NUMaxv3BRSdWeklqj5a3Fz8mtLSgPwSy0YrMUjW/1rTt95JpjRY8jfpQHLwN0Bi3ZRbiDzRMjmUJN/kC+q6bsEok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5d3fb34ba53so3516218137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 01:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760948013; x=1761552813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO2kQ54ctZ1GJPCFblCj0sw6xchdhfUc4nyLHbZc/QQ=;
        b=XvgW1P8GwSUM6CT6NJL0dbRo0wK/SiS2pD8/oOxp7JHUb2qiZ8bt5R7GzNQGLmdjWn
         pxpu46d/IXOZpQE1KVFejHtHMHcoY+DjpESeV+WitX6U8oWwikwtnDUXeDeb3XzaYt12
         csJ73F2HGIm8X7sQ8ltQ5LLe6lMnH82hPlZYicZHb18Ob97SB6BJsemTRj14LL4lxpoz
         j9YCh7dMSBE+DRU6t2DNo9kkj23B8z4KDJ7vNGgDesfbj5F8/q2hB0a+Z7e4JfTaxz4o
         iaRT4dVSI7RtS53IbkIi/HjA8a/xpqlE9Klu5C6UWxHEI3KOsIOywZrskmQ/EeYuk1Li
         YG+w==
X-Forwarded-Encrypted: i=1; AJvYcCVL2ULVyIriEWl9OVvJFVowzJk3Nh8qvPlxHXOtgcNAdHLs6HcE6qlc6Wdeczh5qWAbLaQFbkVFN4fgv+H6+b70Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF9dB0ZgTo05omv9QHtelwATPfOR9Vh2pIvVHvqCAZ3n+AINem
	P2ICwI+JziM7NeAYKaNzuRye9HNEbwx+yNJYo1bqHrhyoPe7cJMn6LZzBl4PqguU
X-Gm-Gg: ASbGncuvJ14PbHcam3YBwzDz1s1AGyFQZSfOhVx9+7Jr3HpmnUhVm52BPw0SJUwWyjz
	DgH8z7rxjnfJRSVvVXv/IkAfmuCTj9qC7vFQd6E5WMLJWWPHG5ucamXlXxJNvS3AYsU0WCHmnwX
	5Yocko7cvGBOkNAtqh1kAh6vpSM0+m6PrigViaK1b9kyrs7OpNZ2gB/WkqsNm+Tz1gW26s1cF/O
	+r2gfZBjpTOkbbgryYGNIbZIuHv3w50K7OzhhXbaBSh11o38s6ctneAFFG7Fac5I+b3R+q1Bew8
	3sj26VFgyN+BsHhPvypEHVvXWz+Dk91kmB0x3U4kl8GbkGY5NrPp+lxKY/YpF8GnTmMaFDU4dMB
	OBSyBifAB2oykdysHFQF8Crt1Lcl1stUrATer5s9xT2qdRTpC/4i5sCZPDlnbzA49Ht+vmb8DU8
	k1Z0Z+WLH/caIvS1WvAJuJI7Vt0EvWL+sU7mQrX0AdPxwAYgX8
X-Google-Smtp-Source: AGHT+IEg6YCfyhgeEwf2rDcnf0sHpAmhqct1Krlu309sTYO1+uBA/E0FU6LqM+J59kOc7qhf+x27Hw==
X-Received: by 2002:a05:6102:2ad4:b0:5d6:1011:42a4 with SMTP id ada2fe7eead31-5d7dd6a4469mr4180340137.27.1760948012816;
        Mon, 20 Oct 2025 01:13:32 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-932c3da29f5sm2318954241.6.2025.10.20.01.13.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 01:13:31 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5d3fb34ba53so3516180137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 01:13:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmCG69EQUFcgqx6YqdIlnzr4gLpUFjeAlPtcAq5/Rsjwjddoo5vfgUftRt5kxNOE44kwIej9awfkyqU2xwtM1btg==@vger.kernel.org
X-Received: by 2002:a05:6102:1456:20b0:5d7:e0ea:8d25 with SMTP id
 ada2fe7eead31-5d7e0ea9044mr2796129137.38.1760948010271; Mon, 20 Oct 2025
 01:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929112324.3622148-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXz0ThdhjeeurjE6TLXjVLXUy-ie-PqXHrTYExQ6TpeLA@mail.gmail.com>
 <CA+V-a8urG_e4yZXg9VH-cOPeK62qPGR1L2Zbbc3O97WB22hcRw@mail.gmail.com>
 <CAMuHMdWNnmmXPxPiuO4r66Mc78gPQ7ticuKt3y5pJ_DqRu_aLQ@mail.gmail.com> <86cdb51d3eb7414cb1665836175e3ea32ed687dd.camel@pengutronix.de>
In-Reply-To: <86cdb51d3eb7414cb1665836175e3ea32ed687dd.camel@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Oct 2025 10:13:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuPoCun=cj1TEY1B6nm4mgvphXDSvRtcWSMpZZxOa95g@mail.gmail.com>
X-Gm-Features: AS18NWAVc6svVYRmDE_ImJ0vS-dMbd7rwpy0E67grCEhNIDyCvbpxgqEnUMj_K4
Message-ID: <CAMuHMdWuPoCun=cj1TEY1B6nm4mgvphXDSvRtcWSMpZZxOa95g@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

On Tue, 14 Oct 2025 at 18:37, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Di, 2025-10-14 at 08:46 +0200, Geert Uytterhoeven wrote:
> > On Mon, 13 Oct 2025 at 18:45, Lad, Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> > > On Mon, Oct 13, 2025 at 4:46=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Mon, 29 Sept 2025 at 13:23, Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Add support for module reset handling on the RZ/T2H SoC. Unlike e=
arlier
> > > > > CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Cont=
rol
> > > > > Registers (MRCR) where both reset and deassert actions are done v=
ia
> > > > > read-modify-write (RMW) to the same register.
> > > > >
> > > > > Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and=
 assign
> > > > > it to reset_regs. For this SoC, the number of resets is based on =
the
> > > > > number of MRCR registers rather than the number of module clocks.=
 Also
> > > > > add cpg_mrcr_reset_ops to implement reset, assert, and deassert u=
sing RMW
> > > > > while holding the spinlock. This follows the RZ/T2H requirements,=
 where
> > > > > processing after releasing a module reset must be secured by perf=
orming
> > > > > seven dummy reads of the same register, and where a module that i=
s reset
> > > > > and released again must ensure the target bit in the Module Reset=
 Control
> > > > > Register is set to 1.
> > > > >
> > > > > Update the reset controller registration to select cpg_mrcr_reset=
_ops for
> > > > > RZ/T2H, while keeping the existing cpg_mssr_reset_ops for other S=
oCs.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas=
.com>
> > > > > ---
> > > > > v3->v4:
> > > > > - Renamed cpg_mrcr_set_bit() to cpg_mrcr_set_reset_state() for cl=
arity.
> > > > > - Updated the parameters in cpg_mrcr_set_reset_state().
> > > >
> > > > Thanks for the update!
> > > >
> > > > > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > > @@ -736,6 +754,72 @@ static int cpg_mssr_status(struct reset_cont=
roller_dev *rcdev,
> > > > >         return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) =
& bitmask);
> > > > >  }
> > > > >
> > > > > +static int cpg_mrcr_set_reset_state(struct reset_controller_dev =
*rcdev,
> > > > > +                                   unsigned long id, bool set)
> > > > > +{
> > > > > +       struct cpg_mssr_priv *priv =3D rcdev_to_priv(rcdev);
> > > > > +       unsigned int reg =3D id / 32;
> > > > > +       unsigned int bit =3D id % 32;
> > > > > +       u32 bitmask =3D BIT(bit);
> > > > > +       void __iomem *reg_addr;
> > > > > +       unsigned long flags;
> > > > > +       unsigned int i;
> > > > > +       u32 val;
> > > > > +
> > > > > +       dev_dbg(priv->dev, "%s %u%02u\n", set ? "assert" : "deass=
ert", reg, bit);
> > > > > +
> > > > > +       spin_lock_irqsave(&priv->pub.rmw_lock, flags);
> > > > > +
> > > > > +       reg_addr =3D priv->pub.base0 + priv->reset_regs[reg];
> > > > > +       /* Read current value and modify */
> > > > > +       val =3D readl(reg_addr);
> > > > > +       if (set)
> > > > > +               val |=3D bitmask;
> > > > > +       else
> > > > > +               val &=3D ~bitmask;
> > > > > +       writel(val, reg_addr);
> > > > > +
> > > > > +       /*
> > > > > +        * For secure processing after release from a module rese=
t, dummy read
> > > > > +        * the same register at least seven times.
> > > >
> > > > This comment is waiting to become out-of-sync with the actual value=
...
> > > >
> > > For the reset operation no, for this I would like to keep this as is.
> > > But for the MSTP registers I will be adding a delay. Or did I
> > > misunderstand something?
> >
> > How to make sure both "#define RZT2H_RESET_REG_READ_COUNT 7" and
> > "seven" are updated together?
> >
> >     /*
> >      * For secure processing after release from a module reset, one mus=
t
> >      * perform multiple dummy reads of the same register.
> >      */
> >
> > >
> > > > > +        */
> > > > > +       for (i =3D 0; !set && i < RZT2H_RESET_REG_READ_COUNT; i++=
)
> > > > > +               readl(reg_addr);
> > > > > +
> > > > > +       /* Verify the operation */
> > > > > +       val =3D readl(reg_addr);
> > > > > +       if ((set && !(bitmask & val)) || (!set && (bitmask & val)=
)) {
> > > >
> > > > Perhaps just "set =3D=3D !(bitmask & val)"? Or is that too obscure?
> > > >
> > > Ok, I will update it to the above in v5.
> >
> > No need to resend yet, I could make these changes while applying
> > (when Philipp is happy).
>
> Consider me happy and feel free to add
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> , set =3D=3D !(bitmask & val) and all.

Thanks, will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

