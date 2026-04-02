Return-Path: <linux-renesas-soc+bounces-30760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ28NxOIzmnfoAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 17:15:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7238B228
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 17:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 839A930160E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 15:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B163EF651;
	Thu,  2 Apr 2026 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IRt1R11c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821C53ECBFD
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775142517; cv=none; b=jbAgkbHn5EW7euwVdqBGSfpnTlO4aSJfbKLlUPKgZWltMZUeTn/YASuG+B/fgwUjQV2CQLTglAkdXU2jBouiK989dzMDpAPBNG8DqT9sAtGzeD8RfIFt9SFhV4X3Ad1ovzsHWk0zDlWSi7L2berNOSFIGor0eVUZ3smEnlOusG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775142517; c=relaxed/simple;
	bh=UmC/V76wM0IXE7fGffBQakeAm6AV7f+287jb3a30PVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCm8fAZaYbdLnZ07XL/CAwUFNrnheR5knLlsuowEnfvBEd9Hj+LLtFzZnwWt/jnYb03nG/AZMD9otMeb8LWMAeTPEjrihwsI7NYX9jBuUS7JILQp2bJ6B0fYTLYwTvVYglKzWpOWZEcDqND53XlSi+JSBaUs+zXhSDqPrnexLyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IRt1R11c; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=JgKP
	OPCmjQRaPccA1S2jQm+XEFkv+HLemgG4RvDVk0c=; b=IRt1R11cBlFoy25Qzh1R
	m5isaZ9ZvitY75H13hlvTdfiCVdiabDTtDfjf6Gp5LsGL/QdPxeEsQKMGP1nX0Ud
	FGGMHZTuhdokFF8VDjbVuRCJx6GD4QNa79QQQq/pYm1A0dGK7xP/5nhOeIvA3nGk
	iEd6tPPcMRSIUtKl9IZmRyXExzgJTvc0ejJHU82BzihHYxcV4yX56CBBx8MpnqZ1
	Hgzzzz34guIN/LNV4h2dA13hM5qHBhbm2lcUHkNnCpocXvKsl7NYIavqQQpEbpUl
	3hCjLEZOey5vTTqrASnuwzDqbrQnGupef+OTUiJ51IAUyCXPRKSwjC3a2Z3sakCP
	WQ==
Received: (qmail 2549328 invoked from network); 2 Apr 2026 17:08:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2026 17:08:33 +0200
X-UD-Smtp-Session: l3s3148p1@887qkntOV4FUhsJN
Date: Thu, 2 Apr 2026 17:08:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org, roman.gushchin@linux.dev
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>, linux-kernel@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Sashiko review (Re: [PATCH v4 2/3] soc: renesas: Add Renesas R-Car
 MFIS driver)
Message-ID: <ac6GcLutDew1wMkS@shikoro>
References: <20260402112709.13002-1-wsa+renesas@sang-engineering.com>
 <20260402112709.13002-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cxKAeYA2roq8zHz6"
Content-Disposition: inline
In-Reply-To: <20260402112709.13002-3-wsa+renesas@sang-engineering.com>
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
	TAGGED_FROM(0.00)[bounces-30760-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,mailbox.org,vger.kernel.org,renesas.com,gmail.com,glider.be];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 3AB7238B228
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--cxKAeYA2roq8zHz6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Answering Sashiko:

> > +static irqreturn_t mfis_mb_iicr_interrupt(int irq, void *data)
> > +{
> > +	struct mbox_chan *chan =3D data;
> > +	struct mfis_priv *priv =3D mfis_mb_mbox_to_priv(chan->mbox);
> > +	struct mfis_chan_priv *chan_priv =3D chan->con_priv;
> > +
> > +	mbox_chan_received_data(chan, NULL);
> > +	/* Stop remote(!) doorbell */
> > +	mfis_write(&priv->mbox_reg, chan_priv->reg, 0);
> Does this clear the correct register for bidirectional channels?
> In mfis_mb_of_xlate(), for bidirectional channels (!mb_channels_are_unidi=
r),
> a single register is stored in chan_priv->reg.=20
> When the receive interrupt triggers, this writes 0 to chan_priv->reg. If
> this points to the transmit register, it looks like it would fail to clear
> the receive interrupt and inadvertently cancel pending outgoing
> transmissions.
> Could this lead to an interrupt storm?

While technically correct, this does not matter in practice. The HW with
bidirectional channels looks quite different and will need a different
interrupt handler. Sashiko cannot detect this because the part for
bidirectional channels will be added incrementally once HW is available.

> > +static int mfis_mb_startup(struct mbox_chan *chan)
> > +{
> > +	struct mfis_chan_priv *chan_priv =3D chan->con_priv;
> > +
> > +	if (!chan_priv->irq)
> > +		return 0;
> > +
> > +	return request_irq(chan_priv->irq, mfis_mb_iicr_interrupt, 0,
> > +			   dev_name(chan->mbox->dev), chan);
> > +}
> > +
> > +static void mfis_mb_shutdown(struct mbox_chan *chan)
> > +{
> > +	struct mfis_chan_priv *chan_priv =3D chan->con_priv;
> > +
> > +	if (chan_priv->irq)
> > +		free_irq(chan_priv->irq, chan);
> > +}
> What happens if request_irq() fails in mfis_mb_startup()?
> If request_irq() returns an error, the mailbox framework handles the star=
tup
> failure by calling the shutdown() callback.
> Since chan_priv->irq is populated earlier during of_xlate(), it will be
> non-zero here. Will this cause free_irq() to be called on an IRQ that was
> never successfully allocated, triggering a warning?

Uuuhh, yes! But this is not a problem of this driver but more of the
subsystem. It is definitely not intuitive that shutdown() is called when
startup() failed. There are more mailbox drivers which fell into this
trap, mostly by freeing an irq they never got. I will have a look at
this, but as said, I think it should be solved on subsystem level.

While this adds another item to my todo-list, it also means that none of
the above issues are related to the driver itself \o/ Looks like it is
good to go upstream, finally!


--cxKAeYA2roq8zHz6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnOhnAACgkQFA3kzBSg
KbaGdA/+NpLQCcl9xI78LuJQupxaNQZnv6nyZv1GVbjZn1CxFAzr9w8HIYp9NC0f
NsacQYR0NWcEhOMYIwCxR53A0NkdExsNrSOHry9t2Sw9ZCGCfYklHPjyCyYlDIjN
IiOxwDVW11z7JMtcTeQai+ZzKvFNJ/cbJZ8zV39X2tkTTK5CqXECTmpUh9fp9nOr
pCNDFKaYxPmQR2HXb1TG8NcyZl0BiWiO6MrFHjMjIiUd68K15kHbzNQa0nwdQQXh
YYgYmKlA2PX4ZLA5yJlgNHXGBIKNQU96VQKo3VZMxJ0FTPLlN5ytHyjpgk3cnG5G
nIP0VgYeWo5IBVBC9yuKPtqvGEYLPTYad5fQZLBdCF/9l0Kg7sFMacJ8IlK+EK0G
yxk8A8QQMsM02fAlofMRnUz2AwzKqrgZ5/wlTCYUCbjGjdWD7BfMjfAvin8CAX9H
qrp6/vTgOWt3X3OMnaxEEZw4LnP/qqhzQQzqfCxagXX35tTAVRLp06XMB0aWp9K8
w2I+96dY/a0zCAgRcgNIiDDaZ7R/8Zcw2Fo8odxn5AQV3nWfqO0zbWzay+fDtXNP
AJxm9Bh/5Gst99AQta2yjYMGz65YjCiyQeJ2DsvnQGFdHJWpYjncMR0muy4S30Vr
EX+C2d+RGxWiA7A4AHORE4Sw7rO9nk5VZr86GHe8Q3qUlKqVQEE=
=fyiP
-----END PGP SIGNATURE-----

--cxKAeYA2roq8zHz6--

