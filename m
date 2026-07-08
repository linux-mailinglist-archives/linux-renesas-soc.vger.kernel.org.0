Return-Path: <linux-renesas-soc+bounces-34868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u0abBgYqTmpxEQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:44:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46246724720
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:44:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LpoDeREo;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9D76300229C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C1C3D3321;
	Wed,  8 Jul 2026 10:39:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E973D3335;
	Wed,  8 Jul 2026 10:39:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507149; cv=none; b=TcT+1xRUWLpEiNzJa8sWzkQc/MlKa9QH6ZFErtyhcAswWa2BaRblwr38Vo7c5i3o6LJwkeD8mnt7GxXOKIs8M89l4/vb+38yVYusLHpRPZ9rfOk4BU7IeUWF3MwOLMVOwEaKKNQOqj7EM9LA1JAj7cC69DnHo4n8YZfRFaeCT7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507149; c=relaxed/simple;
	bh=JiGZBMVfreBCNIMSRY4PaRR/aeQmSkZGg1pAh5Gfo1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0pvdhOWECXhWND31f/TAQX0fRFrygSo9nrmIBmhWwJSrwFbScjUJIotg2IjYVqei+oK0I6P1a6PYeZrPp3dpy+PK+dBChAOes2qgxSI2lWd1Ox/0MEkR5GFzkbWTuQ/SwMwXPXFml3XIaJ0050USuPzKowPmDoOGNebtTl7dgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpoDeREo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC30A1F000E9;
	Wed,  8 Jul 2026 10:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507137;
	bh=JiGZBMVfreBCNIMSRY4PaRR/aeQmSkZGg1pAh5Gfo1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LpoDeREoYuheLIv+ktFfjXJMFjhlHTghxP4CQUCPlzeixwEo4n/kkTZTTEUgjfMZm
	 clhcqNmwXQBZzV/nF2JJzZ2TzvqWFsqsVlIEYVl2gzhfsdtht2BXH+GxpCAmtJdsfU
	 3CpCixS9ZC39O7NVrKaBLr3kzLmG//0GRRxalxKTaKdDP8/sqq82VweHcTAXbsD6+p
	 SisAt7GzbltadM5lOUFx/mEGJ5QdmsLX7JCTc0EqmIhrnTiczWNHd8oXhmOu2evYEB
	 0RC61RZUVxOI+Xf8Hx2p4QtPlTBpsN6nUUZ0wfd3qpP7sHX5FfF7jAoqjZzBQz3yrX
	 AltOevL4Xl5Rg==
Date: Wed, 8 Jul 2026 11:38:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 5/9] regulator: renesas-usb-vbus-regulator: Add RZ/G3L
 VBUS regulator support
Message-ID: <682a0fae-c366-4353-a987-faa85e71fe11@sirena.org.uk>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
 <20260707143646.245177-6-biju.das.jz@bp.renesas.com>
 <02831bf6-cb05-427d-8592-b3fff31b6913@sirena.org.uk>
 <TY3PR01MB113468F9FB9AF3DEB1598462086FF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWkew5pEtSoXpnjB0whCb9yi8MGEsvDTgyY0Dk+Ak0ezQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iRwCeR9/1JvJDxsT"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWkew5pEtSoXpnjB0whCb9yi8MGEsvDTgyY0Dk+Ak0ezQ@mail.gmail.com>
X-Cookie: The other line moves faster.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34868-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:biju.das.jz@bp.renesas.com,m:biju.das.au@gmail.com,m:p.zabel@pengutronix.de,m:lgirdwood@gmail.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,pengutronix.de,vger.kernel.org,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46246724720


--iRwCeR9/1JvJDxsT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2026 at 10:28:46AM +0200, Geert Uytterhoeven wrote:
> On Wed, 8 Jul 2026 at 10:10, Biju Das <biju.das.jz@bp.renesas.com> wrote:

> > I will switch to single init explicitly registering 2 drivers like [1]

> Why do you need two platform_driver instances?
> Because of the different device names? You can use
> platform_driver.id_table for named platform devices, just like you
> use platform_driver.driver.of_match_table for DT.

Yes, that seems more natural for this - the ID table can point to the
set of regulators to register.

--iRwCeR9/1JvJDxsT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOKLwACgkQJNaLcl1U
h9CcYQf8Ci6uBGdjkIryMdDpwa9sAEenj+oRPJxsFulTkdA2aGOMx1B9NRHVH4XU
sgIaW5glVIeWq2BiSVt03IVzOkovX8uSftVaccmqrAk5LZB2Jdl5P3We+SuDCPta
MCb60bI+PvD4XtCCSpY9QDTEyQYCFOjh8lV4V95ruXflfJZkmv6RMXqovydclonM
ITayHzTr459GialkddHc9/XD5nhYs5HsuV3uJ8Gzk83rLqAYWCF04ad7Fx57FYTP
N/eWHOyigmSficgvSRwpsm1yytnxrbTesSYFDu0GzHtZW2J5sDNG+Cv27QMZHpLc
Hy4iXWCHe+06UPU7et6zEzufAVkoyg==
=xow7
-----END PGP SIGNATURE-----

--iRwCeR9/1JvJDxsT--

