Return-Path: <linux-renesas-soc+bounces-30077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL8QCwtKwGl0FgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 20:59:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C992EAA11
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 20:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E6CA3001199
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 19:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B124E37DEAE;
	Sun, 22 Mar 2026 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="l/PP/GvZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF42372ED0
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 19:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774209540; cv=none; b=jpldPMVOXI/dQ/j+/BN0YQUxqtMf0XQ2E/NmflKV0xdtHYbm3kxysJHpckCFEARbs/k0NNUX3e7wmAQQ3NedE23P4MLu/K8vTPhztjVprgTTWxSBmZsR9P72S4hfTdyMGjnKuyK+DwISQQossIn9iRag45/IV5hjZT6LnxXXnIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774209540; c=relaxed/simple;
	bh=U8mmLepVZxhKcDsPX8oGuD24aUpo2IFhkYNR3/mpVZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgrxdExs+Fv6NojTS1RG4GxMwTkatag7mYVWGtfewMH+hr58wf/vHYNMHzYMMTAKQJAEE2BBHOm66sje0+UsAK6+TEQQMMpDdGJJ+86bxo4HcYlWCZVH4cy2VNovPZZLVbM9il9Uy84cQthstDsbPiVC10MJWwh2WdIpl8DWLA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=l/PP/GvZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=i5Z+
	MrUDS1fqa0Lmm0zGVSrcpniD1b0phVfJ21NCk+Y=; b=l/PP/GvZ18qoV2Ln7cQ9
	YRk6CuvGee5qn5FhsdgESYoO7L0FwNtgXXpxkKpUe28o06hyzHBUT1rURRoCk46W
	YEDcsFxs7MDvXulJFVA4TLnOSKUNXYcjYy7ubevWYF3mrvO3DKNYE6Cu20s7UJ3m
	a4BuzFbuXq2RQrzSe0pqFUNguot5MYszWwzcwkUOM4EkwoBvhzqkq4XGJprm95bG
	if/g81AT9SU2kfJQ8d+8bfUKfvSfMGIrGc885r5o63c0vZvwTnU/e1QSV/M0IHNq
	NFNrBYjMnPQEADTBZZsD4KijiFqshmfuxHSKV6+JPB04l6hlRYu8LCyHRugDxzE0
	CQ==
Received: (qmail 2381885 invoked from network); 22 Mar 2026 20:58:53 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2026 20:58:53 +0100
X-UD-Smtp-Session: l3s3148p1@AsP5WKJNIugujnuM
Date: Sun, 22 Mar 2026 20:58:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/3] soc: renesas: Add Renesas R-Car MFIS driver
Message-ID: <acBJ_G1ZgZwrJfEh@ninjato>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdW7jAfXmOHdmd77sB-7aXz3H8xDfAjJUWbU=7SUHiEfSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XaFKQH57NdaPa7uY"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW7jAfXmOHdmd77sB-7aXz3H8xDfAjJUWbU=7SUHiEfSw@mail.gmail.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30077-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,glider.be];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31C992EAA11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--XaFKQH57NdaPa7uY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

thank you for the review!

> > +
> > +struct mfis_per_chan_priv {
>=20
> I would drop the "per_".

Probably OK, will think about it.

>=20
> > +       u32 reg;
> > +       int irq;
> > +};
> > +
> > +struct mfis_priv {
> > +       struct device *dev;
> > +       struct mfis_reg common_reg;
> > +       struct mfis_reg mbox_reg;
> > +       const struct mfis_info *info;
> > +
> > +       /* mailbox private data */
> > +       struct mbox_controller mbox;
> > +       struct mfis_per_chan_priv *per_chan_privs;
>=20
> Likewise.
> This could be a flexible array, if it weren't for the hwspinlock array
> you will have to add later, right?

No, hwspinlock doesn't need any private data here. But something else
could come in the future maybe? I also don't see a big advantage of the
flexible array, too. Maybe it's too late in the evening...

> > +static void mfis_write(struct mfis_reg *mreg, u32 reg, u32 val)
>=20
> Both writel() and iowrite32() use the inverse order of "reg" and "val".
> But I can understand you want to keep "mreg" and "reg" together.

Yes, please!

> > +/****************************************************
> > + *                     Mailbox
>=20
> Missing closing asterisk ;-)

OK.

>=20
> > + ****************************************************/
> > +
> > +#define mfis_mb_mbox_to_priv(_m) container_of((_m), struct mfis_priv, =
mbox)
>=20
> Both "mb" and "mbox", so perhaps mfis_mbox_to_priv()?
> And perhaps s/mb_/mbox_/ everywhere?

Well, not sure here. 'mb' marks the mailbox part of the driver. 'mbox'
is the variable we work on. So, it has a pattern.

> > +       struct mfis_per_chan_priv *per_chan_priv =3D chan->con_priv;
> > +       int ret =3D 0;
> > +
> > +       if (per_chan_priv->irq)
> > +               ret =3D request_irq(per_chan_priv->irq, mfis_mb_iicr_in=
terrupt, 0,
> > +                                 dev_name(chan->mbox->dev), chan);
> > +
> > +       return ret;
>=20
> You can reduce indentation, and get rid of ret, by inverting the
> conditional.

I like this.

> > +static void mfis_mb_shutdown(struct mbox_chan *chan)
> > +{
> > +       struct mfis_per_chan_priv *per_chan_priv =3D chan->con_priv;
> > +
> > +       free_irq(per_chan_priv->irq, chan);
>=20
> if (per_chan_priv->irq) ...
>=20
> free_irq() seems to support zero, but irq_to_desc() still has to
> traverse the mtree.

I checked it and it prints a warning, so 'if' is good.

> > +       chan_num =3D sp->args[0];
>=20
> "chan_num" is the hardware channel number, and should be validated
> against mpriv->info->mb_num_channels.

Ack!

>=20
> > +       chan_flags =3D sp->args[1];
> > +
> > +       /* Channel layout is described in mfis_mb_probe() */
>=20
> Given you already use "chan +=3D ..." below, perhaps:
>=20
>     chan =3D mbox->chans + chan_num;
>=20
> > +       if (priv->info->mb_channels_are_unidir) {
> > +               is_only_rx =3D chan_flags & MFIS_CHANNEL_RX;
> > +               chan =3D mbox->chans + 2 * chan_num + is_only_rx;
>=20
> ...and:
>=20
>     chan +=3D chan_num + is_only_rx;
>=20
> > +       } else {
> > +               is_only_rx =3D false;
> > +               chan =3D mbox->chans + chan_num;
>=20
> ... and drop this line?
> With a proper preinitalization of is_only_rx, the whole "else" branch
> can be dropped.

I agree it saves a few lines, but I really think the original code is
easier to understand. Channel layout is already wickes and doing 'channel
+=3D' twice is harder to understand than a simple assignment IMO.

>=20
> > +       }
> > +
> > +       if (priv->info->mb_reg_comes_from_dt) {
> > +               tx_uses_eicr =3D chan_flags & MFIS_CHANNEL_EICR;
> > +               if (tx_uses_eicr)
> > +                       chan +=3D mbox->num_chans / 2;
> > +       } else {
> > +               tx_uses_eicr =3D priv->info->mb_tx_uses_eicr;
> > +       }
>=20
> "chan - mbox->chans" is the logical channel number, and should be
> validated against mbox_num_chans, to avoid out-of-bound accesses.

"chan - ..."? You mean "chan + ..."?

>=20
> > +
> > +       per_chan_priv =3D chan->con_priv;
> > +       per_chan_priv->reg =3D chan_num * 0x1000 + (tx_uses_eicr ^ is_o=
nly_rx) * 4;
>=20
> I think it would be good to document this register is either an IICR
> or EICR register offset, through:
>   1. A comment, or
>   2. Definitions and code, e.g
>=20
>          #define MFISIICR 0x00
>          #define MFISEICR 0x04
>=20
>          if (tx_uses_eicr ^ is_only_rx)
>              per_chan_priv->reg =3D chan_num * 0x1000 + MFISEICR;
>          else
>              per_chan_priv->reg =3D chan_num * 0x1000 + MFISIICR;
>=20
>      Or:
>=20
>          #define MFISIICR(i) ((i) * 0x1000 + 0x00)
>          #define MFISEICR(i) ((i) * 0x1000 + 0x04)
>=20
>          per_chan_priv->reg =3D (tx_uses_eicr ^ is_only_rx) ? MFISEICR(ch=
an_num)
>                                                           : MFISIICR(chan=
_num);
>=20

I like the latter one. Let my try this. But maybe it will be just a
comment in the end ;)

> > +
> > +       if (!priv->info->mb_channels_are_unidir || is_only_rx) {
> > +               char irqname[8];
> > +               char suffix =3D tx_uses_eicr ? 'i' : 'e';
> > +
> > +               /* "ch0i" or "ch0e" */
> > +               scnprintf(irqname, sizeof(irqname), "ch%d%c", chan_num,=
 suffix);
>=20
> "%u" for unsigned chan_num.

OK:

>=20
> > +
> > +               per_chan_priv->irq =3D of_irq_get_byname(mbox->dev->of_=
node, irqname);
> > +               if (per_chan_priv->irq < 0)
> > +                       return ERR_PTR(per_chan_priv->irq);
> > +               else if (per_chan_priv->irq =3D=3D 0)
>=20
> No need for "else" after "return".

OK.

>=20
> > +                       return ERR_PTR(-ENOENT);
> > +       }
> > +
> > +       return chan;
> > +}
> > +
> > +static int mfis_mb_probe(struct mfis_priv *priv)
> > +{
> > +       struct device *dev =3D priv->dev;
> > +       struct mbox_chan *chan;
> > +       struct mbox_controller *mbox;
> > +       unsigned int i, num_chan =3D priv->info->mb_num_channels;
>=20
> "i" is only used in the for-loop below, so you could declare it in the
> for-statement. As a bonus, that would avoid mixing the declaration of
> uninitialized and initialized variables.

Yes!

>=20
> > +
> > +       if (priv->info->mb_channels_are_unidir)
> > +               /* Channel layout: Ch0-TX, Ch0-RX, Ch1-TX... */
> > +               num_chan *=3D 2;
> > +
> > +       if (priv->info->mb_reg_comes_from_dt)
> > +               /* Channel layout: <n> IICR channels, <n> EICR channels=
 */
> > +               num_chan *=3D 2;
>=20
> Curly braces around multi-line if-branches (even if they are comments)?

OK? I don't mind.

> > +/****************************************************
> > + *             Common
>=20
> Missing closing asterisk.

OK.

>=20
> > + ****************************************************/
> >
> > +static int mfis_reg_probe(struct platform_device *pdev, struct mfis_pr=
iv *priv,
> > +                         struct mfis_reg *mreg, const char *name, bool=
 required)
> > +{
> > +       struct resource *res;
> > +       void __iomem *base;
> > +
> > +       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, name=
);
> > +
> > +       /* If there is no mailbox resource, registers are in the common=
 space */
> > +       if (!res && !required) {
>=20
> Given you only test for the negated "!required", perhaps invert the
> logic, and replace "required" by "optional"?

I had this first and it looked weird that the first call had "false" and
the second one "true". I liked it better this way but don't really mind.

>=20
> > +               priv->mbox_reg =3D priv->common_reg;
>=20
> This left me looking for an assignment to priv->mbox_reg in the "else"
> branch ;-) Then I realized "&priv->mbox_reg" is passed as the "mreg"
> parameter.  Hence perhaps:
>=20
>     *mreg =3D priv->common_reg;
>=20
> ?

Yup, that should work.

I will work on the next version tomorrow. Thank you for your input!

Happy hacking,

   Wolfram


--XaFKQH57NdaPa7uY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnASfgACgkQFA3kzBSg
KbYnmQ/8CZDIRKVfd8bg/FyRN5B9LKhGvfdVqsxPa6Xn0rIFpgtxQkFBZ8GVHs2P
TDo5oc5j2qBNV+JVmUaifWaS1x9AEui3YUZImpK+DWLC1Kb7GUnnCo1sVkuABRaQ
IZgxxehrh84tPguDMA8XD/qt4ST3Q3/Vhu7Dm5vGGWEObO9eKmFGGjsUB7E4BIkO
4tEjCSuCcuD4kaYfeWRriFglG+RVgpEZ9qW0bYFysusbn0Qh6WVLyp/taQsdJ5ak
/H2n0P941YYOBrl2gMd2/L/jSc27V121gKoUA65Kg4hycz8UsiJ9fgcnBBLQ0k8h
aAs+YGacsna7PKHdUvKbF3BYk2LznK444RzOlpXACKcmktvjadRbdvFbnatUvnJC
zegATkBM70Wp0ML604ifG5Hs5QfNjRCOtopobVIyxsX9CehQgOZFE7s1PfvxXra1
tMK7Qu9NCDJBlI6SeJWfMBcvbNLjf7+XvQt0zSRFRSlbxSM8Pukm4Z/DQI3ujJHB
tqjICgkw/85r2NXV7vhzVvPrROx5jEPoyTLHb5wXeSBqz30XO6K3xWm/VuyJr6Jy
Tam7L5e8QbyNiUax7M6kJV2MnftMxv8httDxC87ZmgK86cYK1hzPEBF8ji9OehPF
aei87B6RzAI04ecW6iFUJuOA3WIJynj1s3FQre8PkVeT96LfIzA=
=N/7+
-----END PGP SIGNATURE-----

--XaFKQH57NdaPa7uY--

