Return-Path: <linux-renesas-soc+bounces-34226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SovqAcLqNGowkAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 09:07:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FC16A43A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 09:07:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=Ae6vwYNf;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0103E3043ED5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 07:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B811631354F;
	Fri, 19 Jun 2026 07:06:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1473264DA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 07:06:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781852786; cv=none; b=snV+61JdacAZHAILyO3/jM9b4g0QThhpI7ds2hjPZVSuDTQ3U5dQSRhscbSYvfAYu9wA36p2tgET01QWTc4X8EucD0ECfM5aCVOoKwmCPFKwyrYHUfhLtFMSqIz9jaPpv82/N5VvDbGHWhPItEGL4SihEZy+ycHjIEgDOGjTlBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781852786; c=relaxed/simple;
	bh=AdbDjHhTw6LBZINFOnjmjVX+iAEGdmXNIIBZ0doxANw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRctf3dQQKNnxa0ADxU7NyVBHguOY/JGp/byk+hokQlLmQTvdapehQlnNyDD++k3eIxmsIMol6VcLlZZoJ1PrL33LPAp5g554R3AEtnOuCuOvWlHXmdrI4vSDk2GSTEM6GmMQTX6URT8kw96VAMnQt5OWXdEC/E4SbiXDR5kU4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ae6vwYNf; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=EFjl
	0oNz+MEe5wmNokPuCEnX/OkBdYzZp3iB9yqgRcc=; b=Ae6vwYNfhEiEjlTGMaIe
	QCJ5wamAvBF9xc80jWDu80vgpceBwoyL6tC4eroKFs5EhEZwYRM2xD3dTAlrUVnP
	hIy2b81/nmbYxRLRWpjDXeSABF0ZJ6aoiKQBRuZ/rFhGwKvMrgzCycTcnFB9KoS/
	SwyO8estjdURMqXwSUqYMOnGcENLkvv238XRSsOlTqikV3xu+XaZeaVV+cGOib7a
	S2TRGaIF9j5FyIEzDOAl/nFScUzJy50Oe1sbv5Akz59HAe5fIKHhMdHzmGYlPMpM
	Pyb1auQGf/VXyFhf+Oa/RdjeJpcKzWU5q/Kpstk5e4IoAX1xQaT3DJLK2eFi/XIa
	Bg==
Received: (qmail 851226 invoked from network); 19 Jun 2026 09:06:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jun 2026 09:06:18 +0200
X-UD-Smtp-Session: l3s3148p1@8o/m7ZVU/swujnu2
Date: Fri, 19 Jun 2026 09:06:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] soc: renesas: mfis: add hwspinlock support
Message-ID: <ajTqarh55OZgSBsI@shikoro>
References: <20260618164905.18547-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nMw3slZy3cEAViTl"
Content-Disposition: inline
In-Reply-To: <20260618164905.18547-1-wsa+renesas@sang-engineering.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-34226-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70FC16A43A3


--nMw3slZy3cEAViTl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> [Severity: High]
> Will this sleep in atomic context on preempt-rt kernels?
>=20
> The hwspinlock core can invoke unlock callbacks from raw atomic contexts
> (for example, via hwspin_unlock_in_atomic). However, this callback invokes
> mfis_write(), which acquires the unprotect_lock:
>=20
> mfis_write()
>     spin_lock_irqsave(&priv->unprotect_lock, flags);
>=20
> On preempt-rt builds, a spinlock_t becomes a preemptible, sleepable rt_mu=
tex.
> Acquiring it inside an atomic context could lead to a sleeping in atomic
> regression. On standard kernels, it also violates the lockdep wait-type
> hierarchy since we are nesting a spinlock inside a raw atomic context.
>=20
> Should unprotect_lock be converted to a raw_spinlock_t to avoid this
> regression?

The spinlock was a best effort thing at the time. It should be a
hwspinlock even to protect against accesses from non-AP cores. I thought
this could be postponed to later, but it seems it cannot.


--nMw3slZy3cEAViTl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmo06mYACgkQFA3kzBSg
KbbiGg//QrMEUi5CZnHQDzOiUxfwRkI5p64Cf50+FRA13D+dCjiltB2Mbu036c0X
Q9VErFtPuwJMqNA/ao8kKgSHOfxA/hSOpl7ni0eWUXG2KClGW14+98KGclqc+R87
ydPTjw+O4q6vdeh2eoFPKrdfhMZ5rbs4PL4LW2rpjI/4jazIXpZU2qqgIBolna4p
OzOzsOUZAS6RWtnzlVY74sXzl3cN+jZa0EWzuQd0KrbSkVcvW4Fpx6ZxAa9Mlcfi
lrDLAqEiQ6g4dwwWlI7VNhrvR01sYpcvm8Q+6VB7VhhUxZPEEByXnCbicbnLPFel
yufdyLKyyd3ZZOCzRe2qE+WF/jPxSPgK8pxrnmwXLfp46ZGyGaNDxQTEa6BXg2l1
w2H3vtUwSUnzhH0R5Q6aR/wQKrLixEIplWJakTTKzNnCQlAdt9t7XSAs+P04PdnT
4db6jLBO+ABbLU2sufgsKU2N9NDjYH2PKadguW/xs1nrJG6ZdNC4QD/5Y7kGONVG
lqXN43QFEoXrOhN0TnLXr5e8VWifXsZUKgEPNdOq89T/1DRkUQUsODQKKjLT51Ug
jJ9gAsL0bHIDuSSfBPq8XkKRkQCltKLihiP5IiUMRqjGnNXBPR1w7Nf92VAOW1RV
HOPeomw+MSR0YOBQWljj+WStsnGTjhWiSXKg+NZQTaSgkKCqd7E=
=7Fpa
-----END PGP SIGNATURE-----

--nMw3slZy3cEAViTl--

