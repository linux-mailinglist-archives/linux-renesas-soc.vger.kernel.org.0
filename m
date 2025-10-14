Return-Path: <linux-renesas-soc+bounces-23020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7864DBDAA4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 18:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FD5F189DB95
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 16:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B746F2C1786;
	Tue, 14 Oct 2025 16:37:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D98288C2C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 16:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760459868; cv=none; b=K91E/uVapLFLNd1fpUrzoNS/WFIJVXoiF+6QfX1MTEXcuR2MCXjkgiy+gZ6jDNuWMZmhqlKetucn47NliKLQO3JRGu/YtLUR1hoBYUe/uZIx/lgRfAEBLgMlSjMemJgzP869n9647cUFKaC8Aprp4gfqTXcoMYj92PCoDK0RbD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760459868; c=relaxed/simple;
	bh=bZnvcHJpPl6wYyHylv3znMtM3/3FCxpGoasHkgSZkxo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mtelZhScxaeuWnbQUrawPQoRiu5IinULFGBCYsOgeBIpOfn5aOKisWjrssqrD6I0dHmlJh+uw9kSjwq8qFR8z1hjXXehAeZ5EWbu7rBMzDDWNNRJ/F0/z2NWRb/Le9HR1W8Zzh8JxPUSvj+yrmA9324ddN0gDPidRPo9wsnMbNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8i1s-0003ht-P6; Tue, 14 Oct 2025 18:37:40 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8i1r-003aTt-2C;
	Tue, 14 Oct 2025 18:37:39 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8i1r-00000000Bnk-2XDo;
	Tue, 14 Oct 2025 18:37:39 +0200
Message-ID: <86cdb51d3eb7414cb1665836175e3ea32ed687dd.camel@pengutronix.de>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: Add module reset support for
 RZ/T2H
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "Lad, Prabhakar"
	 <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, 	linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, 	linux-kernel@vger.kernel.org, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Tue, 14 Oct 2025 18:37:39 +0200
In-Reply-To: <CAMuHMdWNnmmXPxPiuO4r66Mc78gPQ7ticuKt3y5pJ_DqRu_aLQ@mail.gmail.com>
References: 
	<20250929112324.3622148-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <CAMuHMdXz0ThdhjeeurjE6TLXjVLXUy-ie-PqXHrTYExQ6TpeLA@mail.gmail.com>
	 <CA+V-a8urG_e4yZXg9VH-cOPeK62qPGR1L2Zbbc3O97WB22hcRw@mail.gmail.com>
	 <CAMuHMdWNnmmXPxPiuO4r66Mc78gPQ7ticuKt3y5pJ_DqRu_aLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

Hi Geert, Prabhakar,

On Di, 2025-10-14 at 08:46 +0200, Geert Uytterhoeven wrote:
> Hi Prabhakar,
>=20
> On Mon, 13 Oct 2025 at 18:45, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Oct 13, 2025 at 4:46=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 29 Sept 2025 at 13:23, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >=20
> > > > Add support for module reset handling on the RZ/T2H SoC. Unlike ear=
lier
> > > > CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Contro=
l
> > > > Registers (MRCR) where both reset and deassert actions are done via
> > > > read-modify-write (RMW) to the same register.
> > > >=20
> > > > Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and a=
ssign
> > > > it to reset_regs. For this SoC, the number of resets is based on th=
e
> > > > number of MRCR registers rather than the number of module clocks. A=
lso
> > > > add cpg_mrcr_reset_ops to implement reset, assert, and deassert usi=
ng RMW
> > > > while holding the spinlock. This follows the RZ/T2H requirements, w=
here
> > > > processing after releasing a module reset must be secured by perfor=
ming
> > > > seven dummy reads of the same register, and where a module that is =
reset
> > > > and released again must ensure the target bit in the Module Reset C=
ontrol
> > > > Register is set to 1.
> > > >=20
> > > > Update the reset controller registration to select cpg_mrcr_reset_o=
ps for
> > > > RZ/T2H, while keeping the existing cpg_mssr_reset_ops for other SoC=
s.
> > > >=20
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v3->v4:
> > > > - Renamed cpg_mrcr_set_bit() to cpg_mrcr_set_reset_state() for clar=
ity.
> > > > - Updated the parameters in cpg_mrcr_set_reset_state().
> > >=20
> > > Thanks for the update!
> > >=20
> > > > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > @@ -736,6 +754,72 @@ static int cpg_mssr_status(struct reset_contro=
ller_dev *rcdev,
> > > >         return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & =
bitmask);
> > > >  }
> > > >=20
> > > > +static int cpg_mrcr_set_reset_state(struct reset_controller_dev *r=
cdev,
> > > > +                                   unsigned long id, bool set)
> > > > +{
> > > > +       struct cpg_mssr_priv *priv =3D rcdev_to_priv(rcdev);
> > > > +       unsigned int reg =3D id / 32;
> > > > +       unsigned int bit =3D id % 32;
> > > > +       u32 bitmask =3D BIT(bit);
> > > > +       void __iomem *reg_addr;
> > > > +       unsigned long flags;
> > > > +       unsigned int i;
> > > > +       u32 val;
> > > > +
> > > > +       dev_dbg(priv->dev, "%s %u%02u\n", set ? "assert" : "deasser=
t", reg, bit);
> > > > +
> > > > +       spin_lock_irqsave(&priv->pub.rmw_lock, flags);
> > > > +
> > > > +       reg_addr =3D priv->pub.base0 + priv->reset_regs[reg];
> > > > +       /* Read current value and modify */
> > > > +       val =3D readl(reg_addr);
> > > > +       if (set)
> > > > +               val |=3D bitmask;
> > > > +       else
> > > > +               val &=3D ~bitmask;
> > > > +       writel(val, reg_addr);
> > > > +
> > > > +       /*
> > > > +        * For secure processing after release from a module reset,=
 dummy read
> > > > +        * the same register at least seven times.
> > >=20
> > > This comment is waiting to become out-of-sync with the actual value..=
.
> > >=20
> > For the reset operation no, for this I would like to keep this as is.
> > But for the MSTP registers I will be adding a delay. Or did I
> > misunderstand something?
>=20
> How to make sure both "#define RZT2H_RESET_REG_READ_COUNT 7" and
> "seven" are updated together?
>=20
>     /*
>      * For secure processing after release from a module reset, one must
>      * perform multiple dummy reads of the same register.
>      */
>=20
> >=20
> > > > +        */
> > > > +       for (i =3D 0; !set && i < RZT2H_RESET_REG_READ_COUNT; i++)
> > > > +               readl(reg_addr);
> > > > +
> > > > +       /* Verify the operation */
> > > > +       val =3D readl(reg_addr);
> > > > +       if ((set && !(bitmask & val)) || (!set && (bitmask & val)))=
 {
> > >=20
> > > Perhaps just "set =3D=3D !(bitmask & val)"? Or is that too obscure?
> > >=20
> > Ok, I will update it to the above in v5.
>=20
> No need to resend yet, I could make these changes while applying
> (when Philipp is happy).

Consider me happy and feel free to add

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

, set =3D=3D !(bitmask & val) and all.

regards
Philipp

