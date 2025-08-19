Return-Path: <linux-renesas-soc+bounces-20707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58788B2C58F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 15:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52ABA7AE003
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 13:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1D425A355;
	Tue, 19 Aug 2025 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1c4WyuU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CFA2EB84F;
	Tue, 19 Aug 2025 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755610122; cv=none; b=D6oer8GR/1PM+du4j8mmGk/XqqjOTdFRmppohK52wcOPmJXo+yWpG6HJt2/xLOyRpDb/VldVMfg47YntnGGakpOjsXRTi7galQmosaYoSlVVExEiiD2itAisq1vgFv9y0gYUOXKMiMC/tOzjxTBmMaEbVQKVHBdB8WFpcdtAbC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755610122; c=relaxed/simple;
	bh=c/loB25XWaocBkQQsCvlN2LhJCnYYgir7o7QB1FBbuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tRKCrB4+ZAQGm6jvKtNmcO9IRO/PJNxXKBIiRxiv78dxH5Hwj8GxtptJjTkLg9BzH6ujrTLycePE9wg65SigmsDZHeTrlI6xxboSCq47soY/dc9ztvCilVZs55deYr9ZLkAdIBWezfkLYnJgUd805DQm2GROdTVP624e/Ii3ds0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1c4WyuU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9e411c820so2895372f8f.1;
        Tue, 19 Aug 2025 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755610119; x=1756214919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHRs8a8ToP76Xg753tKaZJsH4t0v+FJDBlgNuk4bxVw=;
        b=g1c4WyuUBii4jIv5EMOSDj4lCRyZXnArguK8a4RmnMO1joOx/pmBcYwHygsfe7KHt5
         D4HrPnoxOMbiBF5e1gNNZK/fLi0pVMbf8NMAcGpDPLoiLBu/I3g36s1i+LwmC0mRbAey
         T1jtFPWoAJipUBmv4y1ET+6BH4hYpwOfEAXBfhIQ/6pFt4grBKFj40xPtm+4sIuDbF0a
         IBBAlV7sYVoQ9qpsyGq8f/3FYDqUbqDXxHHzUqxgXgTH1M2wC/JxRgPJ6B89RQwdUeOj
         0X3H9s1FRv1bffpB35qwPGIkVOfzkojr5Z527VLKRuZhehg2J9P/nQDz0K7dom1lK6oP
         Ss+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755610119; x=1756214919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHRs8a8ToP76Xg753tKaZJsH4t0v+FJDBlgNuk4bxVw=;
        b=X35l3cXv065MW8xWqli3ZOdgR9dobzubR64C+j95IpDPkAK0QcF2/mAe/7ksKyqDED
         dnjRmUJVxgcfd8iMBhcEpnsV5l3r5ZLQXJZSSPOk1HzRNCxhEWQCJYk2ZBsbb9Hu5r0d
         j7Dj6SkJN8mSRvZEG8UsVjbc7HdMoLs2umJpWllqntCb0R6DgpsRNz+/O9GfCJrI74ZR
         83//56scU21Dwsza0mOHP29AuKuLvlVSrHayqX0izYM+DZ8wRcnuLEdsnHNBKl+Jxrqu
         JfK/ZPQ65rKg/+rvtmnclc0AdMm0Cwqryy5TcptMomh36PQPgXHcPwm1GGRSqwy3Atmd
         veVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU45h0jxb3aQZ3J4Nr+kMDPFRyphYofIwc1ypxAz1bax43CnsSjIXqMOpBbp+cnkiEZXSIoBuNohikgt8tkJYnLPCw=@vger.kernel.org, AJvYcCUSpD5yWsdTsQ107/FE0kzmf0O5GRS54dej0G9GGbgNNWKT79jZ/0ZlMai21zBs1lb5Rfvhzb4fiRE=@vger.kernel.org, AJvYcCV6OH5hU7EAUxUpCwbrC8vx4LSPe+WYdA/ZXmO1CbyGg60CZKMaEB+fxQI7U70YJZ5bfCIbNMHYdgL7tZ45@vger.kernel.org
X-Gm-Message-State: AOJu0YyQfcNowQ4yUE36dgh3Xs7/LmyMWyqJ2rH1EP1+07TcoHsQM4U7
	wvohlQn/d/S5G1WX65xTPq96JRCXWD4CwQXkIKYcA5t12U6wBNnzUITJNz1H0xPlHDOFC3aHm+o
	fkt5hqsoPD0M7qQhb1a6lCQus48H+nBmPm40r2LM=
X-Gm-Gg: ASbGncs+ZyeFUW/GeI90yrvjLrE2mkYjM1S1QzYe3yoP0DcL6IlYPBD0SVuwAnKy1G6
	ltPsHM2Wmb/TNgBKl/FtlENn9OnM1yXnRZYZWzcf8crEzYj5qkgxbSRKfWYybQbr1UO+q+/DoUH
	1FH7PYiGaoZtPniEeroUpJNwagQRZ+G2dfsgLn8t5OerNoYSb6FGBGZ91E17scYMPXTevDIYqEt
	Wj1XTXWzUdSTuSWaL8=
X-Google-Smtp-Source: AGHT+IEIAmAYoZb8NekNGfHJ5IrwcEh00Ksd18bPKf9ZuS+XbWiAqsXyLuCf+xEbSouTR3Egx2LqdyCwsdzkphKdOc4=
X-Received: by 2002:a05:6000:1885:b0:3b5:def6:4f7 with SMTP id
 ffacd0b85a97d-3c0ecc322b6mr1657921f8f.30.1755610118972; Tue, 19 Aug 2025
 06:28:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807164353.1543461-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVJT3+dnikgULm7FXFwussc-9o9h8eoDP-Np9Y6JZNHYg@mail.gmail.com>
In-Reply-To: <CAMuHMdVJT3+dnikgULm7FXFwussc-9o9h8eoDP-Np9Y6JZNHYg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 Aug 2025 14:28:13 +0100
X-Gm-Features: Ac12FXxIhlYzT3fNzKJCwYyWPi4NXFdFFGhVK8pxU_0YqfAE19u_DimDYZljVyA
Message-ID: <CA+V-a8sHSo1bVBPYyrUctgeAbOk9VsRdt80KLrfbZUg=juWQAg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
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

On Fri, Aug 8, 2025 at 11:14=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 7 Aug 2025 at 18:44, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for module reset handling on the RZ/T2H SoC. Unlike earlier
> > CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Control
> > Registers (MRCR) where both reset and deassert actions are done via
> > read-modify-write (RMW) to the same register.
> >
> > Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and assig=
n
> > it to both reset_regs and reset_clear_regs. For RZ/T2H, set
> > rcdev.nr_resets based on the number of MRCR registers rather than the
> > number of module clocks.
> >
> > Update the reset/assert/deassert/status operations to perform RMW when
> > handling RZ/T2H-specific layout. This enables proper reset sequencing f=
or
> > modules on RZ/T2H without affecting the behavior of other supported SoC=
s.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > @@ -137,6 +137,22 @@ static const u16 srcr_for_gen4[] =3D {
> >         0x2C60, 0x2C64, 0x2C68, 0x2C6C, 0x2C70, 0x2C74,
> >  };
> >
> > +static const u16 mrcr_for_rzt2h[] =3D {
> > +       0x240,  /* MRCTLA */
> > +       0x244,  /* Reserved */
> > +       0x248,  /* Reserved */
> > +       0x24C,  /* Reserved */
> > +       0x250,  /* MRCTLE */
> > +       0x254,  /* Reserved */
> > +       0x258,  /* Reserved */
> > +       0x25C,  /* Reserved */
> > +       0x260,  /* MRCTLI */
> > +       0x264,  /* Reserved */
> > +       0x268,  /* Reserved */
> > +       0x26C,  /* Reserved */
> > +       0x270,  /* MRCTLM */
> > +};
> > +
> >  /*
> >   * Software Reset Clearing Register offsets
> >   */
> > @@ -686,12 +702,16 @@ static int cpg_mssr_reset(struct reset_controller=
_dev *rcdev,
> >
> >         dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
> >
> > +       if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RZ_T2H)
> > +               bitmask =3D readl(priv->pub.base0 + priv->reset_regs[re=
g]) | bitmask;
>
> bitmask |=3D ...
>
> >         /* Reset module */
> >         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>
> However, you should hold the &priv->pub.rmw_lock spinlock everywhere
> you do an RMW operation.
>
Ok.

> >         /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz)=
 */
> >         udelay(35);
>
> Please read "6.5.1 Notes on Module Reset Control Register Operation"...
>
I had missed that...

> > +       if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RZ_T2H)
> > +               bitmask =3D readl(priv->pub.base0 + priv->reset_clear_r=
egs[reg]) & ~bitmask;
> >         /* Release module from reset state */
> >         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
>
> Hence I think it would be worthwhile to have your own struct
> reset_control_ops mrcr_reset_ops with its own set of callbacks.
>
Ok, I will add a new mrcr_reset_ops for T2H which will adhere to
"6.5.1 Notes on Module Reset Control Register Operation" restrictions
with spinlock held.

> > @@ -764,7 +788,16 @@ static int cpg_mssr_reset_controller_register(stru=
ct cpg_mssr_priv *priv)
> >         priv->rcdev.of_node =3D priv->dev->of_node;
> >         priv->rcdev.of_reset_n_cells =3D 1;
> >         priv->rcdev.of_xlate =3D cpg_mssr_reset_xlate;
> > -       priv->rcdev.nr_resets =3D priv->num_mod_clks;
> > +
> > +       /*
> > +        * RZ/T2H (and family) has the Module Reset Control Registers
> > +        * which allows control resets of certain modules.
> > +        * The number of resets is not equal to the number of module cl=
ocks.
> > +        */
> > +       if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RZ_T2H)
> > +               priv->rcdev.nr_resets =3D ARRAY_SIZE(mrcr_for_rzt2h) * =
32;
> > +       else
> > +               priv->rcdev.nr_resets =3D priv->num_mod_clks;
>
> I guess this is fine for now, but probably we will have to introduce
> a proper nr_resets field when the next RZ/T* SoC is introduced...
>
Thanks.

> >         return devm_reset_controller_register(priv->dev, &priv->rcdev);
> >  }
> >
> > @@ -1166,6 +1199,8 @@ static int __init cpg_mssr_common_init(struct dev=
ice *dev,
> >                 priv->control_regs =3D stbcr;
> >         } else if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RZ_T2H) {
> >                 priv->control_regs =3D mstpcr_for_rzt2h;
> > +               priv->reset_regs =3D mrcr_for_rzt2h;
> > +               priv->reset_clear_regs =3D mrcr_for_rzt2h;
>
> With its own set of reset callbacks directly accessing mrcr_for_rzt2h,
> this could be dropped.  However, if you want to keep on using
> cpg_mssr_status(), you do have to keep the assignment to
> priv->reset_regs.
>
To reuse cpg_mssr_status() I'll keep ` priv->reset_regs =3D
mrcr_for_rzt2h;` for now and drop the later.

Cheers,
Prabhakar

