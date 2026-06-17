Return-Path: <linux-renesas-soc+bounces-34174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dNUNDOOsMmoN3gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 16:19:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA8A69A7C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 16:19:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=alDJPvvU;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76693300A5BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1F643E483;
	Wed, 17 Jun 2026 14:19:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31EC401491
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 14:19:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705949; cv=none; b=hkFHdYbRxUrtFz5/u0Tsxv7eoDBIbXNCaK3iEuuof+CedAtmDeHY0EnLFT/v690vSjrkwF0RMyzsMVd7LzQyUMgqcmtg7kRqoaK2QMFbISzgJHnmMiy+553hy+NeDlmMMFB3X7OuaBG3RUBamycjSM7z7Se4n5z+Nf0nUjdVQGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705949; c=relaxed/simple;
	bh=JCD8cvv8rlUBHXPK9uD5sq5eLv/nvfOPoDDvsUVKle0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jx/S2zjiqGVx8CghEOF7Bfe2Jl7/jLDQniObPGB5LkiYtuuspzF6rHO5im1ZyDMCjzTwICehCXH3DacTga0AY4Asu/OOFJIClnK5hvQCRUQRybOVTPyBEABgfpby2vafixkihugkzidK0aJ/fZnHF+Pnx3xILx0lhymBZXgqXYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=alDJPvvU; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=900S
	KMhfjAoJ0k5ypr/nO0lm8fvJ0WQU4Q8AFwgz2FQ=; b=alDJPvvU8hC/7oiKyGei
	v+YhbMJly6NruUddCTyvb6Hk/jvhQPgu4pzuSqFi4YZUXnsFO2D9Ss6Wmw6SHgVc
	5XaJktkjoFD6hIIAW/7pc1XvFnvZO/9SiC4yVlXHgknXJ+cdqLPx/s2zVOjrtoyj
	B/1xCnf8xrCERwpkQDkVppNWZA3E3z+6zFSR9N5lENbnyDKWnsn1BHVW2qfO1Euy
	3L00ObKu5An5w7hcnaf6iuNJd7FQ4ME+NYzGlxyXOuddzVoo7cOkZj70HMVKEsqw
	T0pRnpxyssxmV42Ss+Tm9rxt0HLhosVs48uDz6hcnYj1ICHMpYf3cogUuS81EMOW
	EQ==
Received: (qmail 198739 invoked from network); 17 Jun 2026 16:19:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 16:19:02 +0200
X-UD-Smtp-Session: l3s3148p1@aG/DvXNUrWBtKXEK
Date: Wed, 17 Jun 2026 16:19:01 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v17 08/17] mmc: renesas_sdhi: Add tuning_delay hw_info
 flag
Message-ID: <ajKs1aZiFwHkOBGt@shikoro>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-9-biju.das.jz@bp.renesas.com>
 <ajKVxixgTHaavVfi@shikoro>
 <TY3PR01MB1134670687D54134ED8479CBC86E42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="56iKqqiBSDpEqFLZ"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134670687D54134ED8479CBC86E42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34174-lists,linux-renesas-soc=lfdr.de,renesas];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,glider.be,bp.renesas.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AA8A69A7C4


--56iKqqiBSDpEqFLZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +	if (host->mmc->ios.signal_voltage =3D=3D MMC_SIGNAL_VOLTAGE_330)
> > > +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x0);
> > > +	else
> > > +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x1); }
> >=20
> > Isn't it enough to move this upwards? I don't see anything requiring th=
is function to be so late. Am I
> > overlooking something?
>=20
> OK, you mean this function along with SH_MOBILE_SDHI_SCC_* macro upwards?

Ah, the SH_MOBILE_SDHI_SCC_* macros were the things that I missed. It is
okay as-is then.


--56iKqqiBSDpEqFLZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoyrNAACgkQFA3kzBSg
KbbFBQ//Z4YbxlxhSc5Hg9+34I01TCUEVRJcobPhGG9TdglpkkCxCtOIhtNymsk3
BCVKQ8CHTaILRdazgFLLi3d/PLHEKPZtlRrh+cLiCpeEe290zWlgFedTOn8CRehE
z9sseGvwSPLDS+rc8lKzvF2US1dtxDAGPONmbfy//9+72ghy2P7ZfeneflUPWpa/
9ev+Nsuy6KM8kE8bOE3wTQPpEbTz0JRNH8QBKOkfKe/wfmo6tRZGThO/3/cbqwFg
0pKEhI+9QPfzFgWJ1C+HW1E/hQDzqeQFh5E2XcQ7J/liQqnUdIJKOKvuaT5b2ppB
lnTrer309CS00sayNYDREHizmA+zFyMUwWDmPjcY5VjdpTnYAO2+nx+ONpZmz2Cw
z1FrL45AD1kVjqiO8iSv+r8EbRYT/yhXQePNJF3pETf9JlmMrvHQoqMsurJCuWzy
ockW0tVbUhvfzv6DjbjA612AxmAnsZguS0NgqQxyMruZRQ1qV7F89rjYmZcG7xuC
KMezIwjUTW5EQAPVn8eku1A6nB1u6CThjdqtaIEL7RX+Wf3OubtkcjIP7znZP+Yv
kJDRyGOSKsjQMUwh9A57rZqh4ETAyCbiAmUJH2J2hmo05ih1Xabb//7iBcsaB84Z
DcGKYwSE+I5k2oVOuOuT5Mt/PlfmDTghsSRmMpE6NPXr6RJRGX0=
=5avp
-----END PGP SIGNATURE-----

--56iKqqiBSDpEqFLZ--

