Return-Path: <linux-renesas-soc+bounces-30058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FOY5JGqvv2mE7gMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 09:59:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D842C2E8AE4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 09:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CA80300C918
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Mar 2026 08:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0ECD2D0C79;
	Sun, 22 Mar 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Hq4qyjU9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703CA7E0FF
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Mar 2026 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774169958; cv=none; b=B1RWz0cyVo/V95abovUbM2UI50AHOp7McCsEHr2y9PO9NGTn2FAFAs4ETKEFDJCKk62jJla//KSUfYgniAtF+OAzghOxM8IJO/99wbaop6smVDvm8KWoRixaIt40mE11b1Z100vc8Mf3YZgQ6e625qA35Y5C9bDPAXs0UHN6bR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774169958; c=relaxed/simple;
	bh=o2G9N7vkJP7+90Onm0AZBivyzseoXbPh4YtHVo4h68Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bORedCSekscEbPFbm6ozLHrIXy3IeG9Ts/81vICKGc7zZabmXphjevV+puMxJzVuqYAGdA5msHaSTYCtsEIaXg22ICfegwJbyADi37EYQx6Ho218cK7hhSGuB75KLF2uQAgnok6QBxN+JVneZYB5wh94pCpqNYmAcGtrSLbQh+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Hq4qyjU9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Z9/J
	SJx7vHhaBCKdyxU+8cvFuBHAAv4JKJ7Xame72O4=; b=Hq4qyjU9hKALUmshiaJZ
	7QAaJzyeCbQCXAI77RYtagiduxIEaA8Z2LOYdcvb9vkwlryvVoWrt1f8oJn9sqfK
	PNdY/vy00CuNFDgNh2yIf5fW/aXhKm8QCjahuFaNRcQ8xv+M6ISSEzsfEbu/yvUm
	yJ3QRNgsRZSGIXkBMRU19ecMvGdqA1ZosNWyiy6ithsCXXJTmOo64sHhF07V/2Kv
	/S/oRM8R3CG4MKYJHajeF8VMVvS8+/O2z3q0gbQmgtv7tdUr3CG0UvvwZxK81OqK
	ooEcGnchwnDyu5r+jOdl5jnbcrI8EDu9mc/nlCpvYI1H77IrwLRIBVhhdZmDHMi5
	qQ==
Received: (qmail 2218256 invoked from network); 22 Mar 2026 09:59:05 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2026 09:59:05 +0100
X-UD-Smtp-Session: l3s3148p1@a9FfIZlNrNoujnuM
Date: Sun, 22 Mar 2026 09:59:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Sashiko review feedback (was Re: [PATCH 2/3] soc: renesas: Add
 Renesas R-Car MFIS driver)
Message-ID: <ab-vWbjdlAIt1qaX@ninjato>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ohxKfzS0aN8m6jG0"
Content-Disposition: inline
In-Reply-To: <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30058-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,glider.be];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D842C2E8AE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ohxKfzS0aN8m6jG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I am usually not into AI but I can definitely see value in its review
assistance. So, I checked what Sashiko thinks of my series and found the
comments to be largely reasonable. I'll copy and answer them here, a)
for a more complete review process and b) to give feedback to the
Sashiko-devs (CCed). Thank you for the service and efforts, I hope we
can justify the additional energy consumption here. Please let me know
if such replies are actually helpful for you.

> > +static void mfis_write(struct mfis_reg *mreg, u32 reg, u32 val)
> > +{
> > +	struct mfis_priv *priv =3D mreg->priv;
> > +	u32 unprotect_mask =3D priv->info->unprotect_mask;
> > +	u32 unprotect_code;
> > +
> > +	/*
> > +	 * [Gen4] key: 0xACCE0000, mask: 0x0000FFFF
> > +	 * [Gen5] key: 0xACC00000, mask: 0x000FFFFF
> > +	 */
> > +	unprotect_code =3D (MFIS_UNPROTECT_KEY & ~unprotect_mask) |
> > +			 ((mreg->start | reg) & unprotect_mask);
>=20
> The mreg->start and reg variables are combined with a bitwise OR. If
> mreg->start has overlapping bits with the reg offset, could this yield an
> incorrect physical address for the unprotect code? Should this use
> addition like mreg->start + reg instead?

No, if a device tree is so wrongly setup that the bits overlap, then '+'
instead of '|' will only lead to a different wrong address.

> > +
> > +	iowrite32(unprotect_code, priv->common_reg.base + MFISWACNTR);
> > +	iowrite32(val, mreg->base + reg);
> > +}

> Can mfis_write() be called concurrently by different processors or
> interrupted by an interrupt handler like mfis_mb_iicr_interrupt()?

Yes, it can. It even needs a hwspinlock instead of a regular spinlock
because it needs protection against cores which may not run Linux.
hwspinlock support will only be added later because of dependency
issues. My plan was to add the protection once we got hwspinlocks. But
maybe I should add just spinlocks now and convert them to hwspinlocks
once their support is in.

> > +static void mfis_mb_shutdown(struct mbox_chan *chan)
> > +{
> > +	struct mfis_per_chan_priv *per_chan_priv =3D chan->con_priv;
> > +
> > +	free_irq(per_chan_priv->irq, chan);
> > +}

> Since mfis_mb_of_xlate() skips interrupt lookup for transmit-only channel=
s,
> leaving per_chan_priv->irq as 0, and mfis_mb_startup() guards the request
> with if (per_chan_priv->irq), will this unconditional free_irq() trigger a
> kernel warning when shutting down a transmit-only channel?

Yes, I seemed to remember that free_irq() can handle this, but it will
in-deed trigger a warning. Also, the reasons Geert mentioned in his
review apply.

> [ ... ]
> > +static struct mbox_chan *mfis_mb_of_xlate(struct mbox_controller *mbox,
> > +					  const struct of_phandle_args *sp)
> > +{
> > +	struct mfis_priv *priv =3D mfis_mb_mbox_to_priv(mbox);
> > +	struct mfis_per_chan_priv *per_chan_priv;
> > +	struct mbox_chan *chan;
> > +	u32 chan_num, chan_flags;
> > +	bool tx_uses_eicr, is_only_rx;
> > +
> > +	if (sp->args_count !=3D 2)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	chan_num =3D sp->args[0];
> > +	chan_flags =3D sp->args[1];
> > +
> > +	/* Channel layout is described in mfis_mb_probe() */
> > +	if (priv->info->mb_channels_are_unidir) {
> > +		is_only_rx =3D chan_flags & MFIS_CHANNEL_RX;
> > +		chan =3D mbox->chans + 2 * chan_num + is_only_rx;

> Does this code allow out-of-bounds access if a malformed device tree
> provides an arbitrarily large chan_num? Should chan_num be checked against
> priv->info->mb_num_channels before computing the chan pointer?

Yes, Geert pointed this out as well.

> [ ... ]
> > +static int mfis_mb_probe(struct mfis_priv *priv)
> > +{
> [ ... ]
> > +	mbox->chans =3D chan;
> > +	mbox->num_chans =3D num_chan;
> > +	mbox->txdone_poll =3D true;
> > +	mbox->ops =3D &mfis_iicr_ops;
> > +	mbox->dev =3D dev;
> > +	mbox->of_xlate =3D mfis_mb_of_xlate;
> > +
> > +	return mbox_controller_register(mbox);
> > +}
> The mailbox controller is registered using mbox_controller_register(), but
> the driver lacks a remove callback to unregister it.
> If the driver is unbound, devres will free the devm_kzalloc structures
> backing the mailbox. Will this result in a use-after-free regression since
> the mailbox subsystem still retains the controller in its global lists?
> Should devm_mbox_controller_register() be used instead?
> [ ... ]

Yes, this was overlooked so far.

> > +static int mfis_probe(struct platform_device *pdev)
> > +{
> > +	struct mfis_priv *priv;
> > +	struct device *dev =3D &pdev->dev;
> > +	int ret;
> > +
> > +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->dev =3D dev;
> > +	priv->info =3D of_device_get_match_data(dev);
> Can of_device_get_match_data() return a null pointer here?
> If the driver is bound manually via sysfs or instantiated in an environme=
nt
> lacking device tree match data, would this lead to a null pointer
> dereference regression later when accessing priv->info->mb_num_channels in
> mfis_mb_probe()?

The latter case would be clearly a driver bug. In addition with the
former case, it probably makes sense to handle this more gracefully,
though.

Happy hacking,

   Wolfram


--ohxKfzS0aN8m6jG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmm/r1UACgkQFA3kzBSg
Kba8Kg/+LFtg78uIG1lf3ughgv6nlG8/j/83lUeKA8TUi6n6U1UPW1a5thwTgDJI
sDQt3OqgHv4nTnHlRA0s4/st69XGPCY26j5zchgwZ64jhPd3PXmj1akPYK/4cjUy
01pcKtV/dFR+hiXwq6EXJ/L/8+q2FH2cNCJZicIBFHAYjr36TuAnCfv8E3z2cbgw
aL1LXZRkvaBf7+wLPuCDD3HBL8ZZHn3m7DZx0ZWaFNukCZaXi3MBsrmvSDjfOstg
71JSFq64G71X+LGE6K/i16X3qbEU8gml6KBQaBabF8a9GQGDpObXXHJJkGtvjrF7
EZV3S21Nsy1ahsjz98A/nkcIXC2+2eJ37mUKAKIIzZOcSZllkdx13KQF/koA5gbZ
ESc+hEAREoovLwNEH+UeRA1BKK5WXwjgrVhlb2LsIpSh0gtN5TyYQEyVFZyBJ7nV
2Rj7UI2wecaINT5/EW7HnxVvcMSRIm0i/XmZHOyd9uHn5myyTELK+PIeYeHc1s/7
mhVZIqytGxsNMvcjnhoHU1bf9B3TBQV4q4aDNaa6qkh3hDvIdd0keuJZSoVis5Bv
2af3sDM0TIzbZMU8BOZxqALmzuSxcLaSWCiyp6tThVnKdcOO9txB0lVjjUtmzEMh
VqLxd/XPji84Yp56HIWF3OU4mc9QtlARcLauzBy+3glznrctsEI=
=fKLo
-----END PGP SIGNATURE-----

--ohxKfzS0aN8m6jG0--

