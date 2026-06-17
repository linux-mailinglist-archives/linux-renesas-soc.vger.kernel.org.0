Return-Path: <linux-renesas-soc+bounces-34141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FNkUKU1/MmqS0wUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 13:04:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0046E698C8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 13:04:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=Pg7EPL5x;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1474930238D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 11:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A412750FB;
	Wed, 17 Jun 2026 11:01:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDEF33F394
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 11:01:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694099; cv=none; b=rxD5kHT+j21fc7tVvhOx5WdCSl+Ct/ermXY16GL0X0layJT9za+dTQ3AIXVD+tsbOe+DZt8g73oMm2SlcR1YDPnAwQaDMCubFl7ZCBREXKm+6w3kpPqmw0h8Hbdc6f+Y/X0CUtPWjPAr77/hUkT6vTxXpbX+w5Y74gx4s8qwJi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694099; c=relaxed/simple;
	bh=Tl4Z4BqCviMYKctx1lwpEAGhFTPdhr4eNsYvfmtVgPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqelFwj1k1xIHbQWQWMlfh7s3/1u8Qnfhry2HHkizynkRjQHJfso8Q+unUsM/0vlRDFMLdRjpvucX7DNCysT0gqvBFUh55Jg0gltTeONP54B60VoTzqemwYC7tEgk0Nj7MTnA8g58AW43CqF3ylGWI994w6T6Q1oOExnFlnrZO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Pg7EPL5x; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Tl4Z
	4BqCviMYKctx1lwpEAGhFTPdhr4eNsYvfmtVgPo=; b=Pg7EPL5xj9Xy5YihZGHv
	Xw5TmWe87h5hNhApCLJHD2n5inPruExxvSWaYG/MymS08YpRVmQBwcLGNdTEkGqX
	eVNJ4vxgjD3JLymsLKs/EYuauKixyB0Jevq8vGpHsIR8UutjtYSvNaw7qHH078Xj
	IsXoKdCbvvAQq/3eonWnPfzlCaCAeT6zcgpJ4G4obTFbTTKdi5rYc/xXj7e6u69Z
	jZs8goNzb43hNmtAe+0+bxG6GpwuJyeO3IsOT6Kxsr9vj0L3nWauEZsn6aqnbaWw
	HPhm4sAV2mvI1UhLVSC7BxQwODL0kuqEEgHEVeGM3MSGIYhw7I8wnvTkDV5buoxg
	DA==
Received: (qmail 133539 invoked from network); 17 Jun 2026 13:01:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 13:01:36 +0200
X-UD-Smtp-Session: l3s3148p1@C+is+3BUCOgujnvI
Date: Wed, 17 Jun 2026 13:01:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 10/12] rtc: rzn1: Consistently use dev_err_probe()
Message-ID: <ajJ-j4ZfLxOzltSR@shikoro>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4MFPohSmB5fsdAaj"
Content-Disposition: inline
In-Reply-To: <20260615154805.1619693-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34141-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:from_mime,vger.kernel.org:from_smtp,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0046E698C8F


--4MFPohSmB5fsdAaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 04:48:03PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Use dev_err_probe() in the IRQ request error path to make error handling
> consistent with the rest of rzn1_rtc_probe().
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--4MFPohSmB5fsdAaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoyfo8ACgkQFA3kzBSg
Kbb2zA//abihGqxyQrIWaGjp/tCRstkxb6bNhljQpKadPNi/VlsfsK74WfRpkXbB
Yu9g9RcAun/2CjOnElNDt2joG9cz2t+xVC4KdDz+CuaewGSGUCSUEjEXse6isb1M
OolLTOF7kAOuob1VejivIs1qBkr66SsfIvsRJrzrITcS67xu9fT0yLsqk96EyjBb
z9/fJwE/Dk2lAMY/3TE1uhzGM8fRqwMoO+Wl5hcTMWcQQOVk6mAxm6Tv8QgWvdQm
RoQWTZybxQnEhtv373HiLwJR8CbtmST+LdLQKfZdkjTFSETRU0GC1rIDx9yFOmlD
LDgZyZDjPwf8nC3DJDhGxBS3Y+O7nnK/ksI5BMHYTXuuY6LPYlGSOo1yHuNrj/eu
qg3nU4KhyKsh2vFuMOTBmhufqzu7gEly1d3Ik9E1qld6jegCaLd+MaNEwKIPhocU
ncyYMrjvGG3gVGeTtSrIppAGkALdmaiJHrg79SuiqzGuQUoMm/ZEmy5tdScS+/od
S/rsIe+yv/nbob6Hlqk4a5S+GF562yi21owIpkwWQcDBmRbX+c3HIdCURVyhmJlc
AcEDAMFktqZ8+yhHyRQHAeYxbotAVno7S1Kwc8LYpI3RPBEtM7kH19fZSB4tyJeM
mufrP7xRXl6FB5t3fDVXSTh3gRDmmlYl3uXRxTPTU1QRiF4rNK4=
=FhHi
-----END PGP SIGNATURE-----

--4MFPohSmB5fsdAaj--

