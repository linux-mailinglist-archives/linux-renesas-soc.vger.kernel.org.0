Return-Path: <linux-renesas-soc+bounces-32309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DyDJhtC/mkZogAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 22:05:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A179B4FB542
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 22:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E94C3003714
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 20:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDC227979A;
	Fri,  8 May 2026 20:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JHXVJTH/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F05327C09
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 20:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778270742; cv=none; b=okXi4gx951DtTckuacyn04vnUJo/E0JtlgUXp1kYkbYG9Z7Hpj99ej37b8ADUmx29zIpJb7A/jclX2UqzXRdILVSOB3mLr69atsa26gDGo/XaME1XZAL2/ceTDdAT8rPl3JljrfCCtjSYyGhKtPiQGgj1TrWKdjU/1J7acOfVHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778270742; c=relaxed/simple;
	bh=r4416AwSwAlXUvbYN9/pdEv2Sgs4/cvKtROm5nF5qm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzImCvDOOxIg7E6z7oVMZnGg7Ct6fWbi4FWQj6LN1PSn9j8933swP82gDsZSNR58/WiO9lI/CMVozyBZd2CIxZzom/GeYYBjDppHdAIwOflv5YMslVOXmJrFqfWfWmbSkPXG+6g8lmLW+shO+Ht4jDXBwPX9bfr5VTYHB3YYbv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JHXVJTH/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=r441
	6AwSwAlXUvbYN9/pdEv2Sgs4/cvKtROm5nF5qm4=; b=JHXVJTH/aEchqgXjIvxA
	dvJxfdWenCZWqCuU/XOaTraCn5ipTIAB6p8/r1tvB0cSIK9Rze1olhM0ZTcNJV58
	qEW/2nZoHLlqzeiu9gxi2xmpNvGkXoaT6twrk30Zq0/DFXQ/+wS34uCdF7d8xCl/
	lx8YEm3fOVjL3PXLtYBCNs1cE91N8qvI9wFikL6BLYFtTJOCSZhMIXFi65KvfxIg
	U2Tm7Z89L6/KDP8pgi0I01w7mYdKTBYJi1MjBvTa4XBW7DCXKZPpFx8F6G9r/y6e
	JCmxDaLkzPkBvM3gsgjIr3qejpyGJv4BQpSRn8tCY362Bx0K4jh7yzo+4EnBeecC
	mg==
Received: (qmail 1639903 invoked from network); 8 May 2026 22:05:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 May 2026 22:05:29 +0200
X-UD-Smtp-Session: l3s3148p1@bFco61NR0rcujntg
Date: Fri, 8 May 2026 22:05:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 3/4] watchdog: rzn1: remove now obsolete interrupt
 support
Message-ID: <af5CCdbNlCYt90SN@shikoro>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
 <20260507102410.43384-4-wsa+renesas@sang-engineering.com>
 <6958a9c5-8ba7-49a1-bd49-1dc6e2f7b9f0@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nfOk955Hsib93T1X"
Content-Disposition: inline
In-Reply-To: <6958a9c5-8ba7-49a1-bd49-1dc6e2f7b9f0@roeck-us.net>
X-Rspamd-Queue-Id: A179B4FB542
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-32309-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sang-engineering.com:email,sang-engineering.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--nfOk955Hsib93T1X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Herve Codina <herve.codina@bootlin.com>
>=20
> I don't think Sashiko's concern is warranted. Applied.

Sashiko missed that it is not the bootloader but Linux which sets the
syscon bits correctly. As this code is already upstream, there is no
more dependency.

Thanks for applying!


--nfOk955Hsib93T1X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmn+QgUACgkQFA3kzBSg
KbbKiQ/9EgKsfzL7q27Qn7L48uGWvMAUq9MBmxts1jR+0TM3Irfiq1CY/KYwhQxy
V39EM638dRJuUEMfnyhy+IanFWBVRZ+n2Edxx4h9bkuku5HaSZoizar0MKTKiz3U
zc6pU2Hg2MgMMrrQ+vgD8ueOQODl23MTAp6jGFKc7DNcswYv7+ViwgCinfo7uwSW
jpOE222Z3Rw8ku3ehrF3D4z+7V2XLyH43qlM3npVHqEF27U3U4yGgy1GfeP2MP0m
YDn9Raz6njxANwSoSdYtYbjQ+mFQavNgyfM0vKTzJE194Q7LedUT7mOJLWeDlGtW
oSRNQ1aLGcCmNbYzNhZwDglxeSY6GPFj55aYKO1lp6agBzfs11Z50gqQd9aKKct6
JcNuY4HyIKhhmeP1B4qCCR8z7L/4CdBrH3V2lckLdAp2tSMk5cGzBN7uM8vfWg6p
yN7K2WlCzE/doDY/nHQ0Fmk1gciTPt+CozRMGXZiCQyoSxuNQnqIFs6fvF+Hs4Ka
IInYlVo8WlxBWSDHgjSzniNseVuOkW85z39CbPWgDprnP/iahA+VEd3T4yNKHkn2
oA+t1JdyWmkGS5x2QlAhF0rIqKTQMBGVdJPpZ5HulNP6DL/276yxgD68we0LSYtQ
bhz3KWtuB3Q93MywhK86G7Vwc8wnYPejoYexX8nb+6D+jlWd+60=
=d0I8
-----END PGP SIGNATURE-----

--nfOk955Hsib93T1X--

