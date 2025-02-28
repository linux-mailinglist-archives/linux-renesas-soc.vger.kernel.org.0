Return-Path: <linux-renesas-soc+bounces-13831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8F7A4A518
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 22:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80323189BB86
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 21:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57861CCEDB;
	Fri, 28 Feb 2025 21:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UJZLOrdI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A291CAA9E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Feb 2025 21:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740778279; cv=none; b=VU6k59x5iNFFaHVT2PhhbwTh4BXnvpKFFAGcI3VZhXfKvuNFGrn6PtqwyHD5uxyHGwT1QUKQ1kNVyV9n2SMun2jZKnfBiTiqwDb+9dGTuVcuAF+eWACNmnQL6MUVcp9BYTeVhIR9J8+MwuSo4ZUH8QyQifqJfIu/l7iuY3jotMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740778279; c=relaxed/simple;
	bh=Zq8Sl97+rOm9FMP40OQspcXljCht7Y92pqNrjsNrpX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhYTfVCSksB4MEAQD95WCddU46YMcWXWl03vfF00iQBQSJRdPUFgwddOpKhFmRrRaAB/5mRxdC4sNsjtwuXszOY8JFd/vw/wmE2aI7RPnG+5mR27q9uK+V3WSeKxT0tJSgiqxC3ea5WA9ohUhNaEMrEj12iRrnmPO37zvdn6avc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UJZLOrdI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Zq8S
	l97+rOm9FMP40OQspcXljCht7Y92pqNrjsNrpX4=; b=UJZLOrdIbW5zFA/0wAtV
	gjpP/GZNSCXmBqFW06hwc20QGne/e6a+BixvF7g+YKPV9ZSd29MxE9B/jjZfzG3p
	0wnMb3T6lrz1n5E2GrECjnK72Yp5068gPy5GvX51AEJhwnk9cbmSwXF3wipgyrj9
	Mz+E1mu/zV8GxUP9g1Szgdk9IzTKO2sDFtpSlSjS6NcfzkZex2JCAja1CPT2vuQ+
	Wvv0ywh0RIyjnRPQax6vapxhrrSfHsaEMOQ//btVdT9hNt5bSC0CI8UTM5V93cCI
	r3JPX9c2eUmiwxRKyx3f/6u2ue5TiTMjGP3suaEY8k+p3Xro9LzNypn0YODmmM6U
	ew==
Received: (qmail 1430150 invoked from network); 28 Feb 2025 22:31:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Feb 2025 22:31:14 +0100
X-UD-Smtp-Session: l3s3148p1@yxCnhjovCM4gAQnoAE04AOw9xELqAtuS
Date: Fri, 28 Feb 2025 22:31:13 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 5/8] arm64: dts: renesas: r9a09g057: Add support for
 enabling SDHI internal regulator
Message-ID: <Z8IrIWEOV77PVul7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-6-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="odPRANhjSWGytkIA"
Content-Disposition: inline
In-Reply-To: <20250206134047.67866-6-biju.das.jz@bp.renesas.com>


--odPRANhjSWGytkIA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 01:40:29PM +0000, Biju Das wrote:
> Add support for enabling SDHI internal regulator, by overriding the
> status on the board DTS, when needed.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--odPRANhjSWGytkIA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfCKyEACgkQFA3kzBSg
KbbLRA/6Ar/hmAhP+PjntenftkyI4/BQb66r4NG0sZZtF8MBoLqxJxEkE8UyC0cB
h/ze+BE2xkGjBACkJ8xbP8g3fEd0k/r95+0LgG7G4jytV8NeTmHaKzXxvOX+Vy0e
VhtZrCxrDLMNJDimxM6FrL5Y3wraEgJq6qPCiumuRyAIgtREDwJYp4oAOGsy4oO2
NAfflZg7AGaQFQjZLo1JQjYysFSVhYep2erYBy+pAHHJC4mRFrszGFOIx8TyN2RH
yvzw/+5MZlUUJHcpC7gZut9+eItMtMEIcA72Q/30WaSjAs58T7tb3ZzQ8wp9zuPb
3y3AkranMURQohKuvjGY9MIYnjHfkDYOuBX9YCEeIOzAxHoS/NnaiNCCWnWJOcF+
bq/bvIG2tJ+f/EJGo9Ncvu1QlmWRWDRG/NzGab2JFY6iGf4Xo7XJLuY1oI+u99DE
zBEpotY7lYdw2TdR/vJSnSTaNHGR80rHLtoJxSEzNw274ysjbyz8W382TNSGjLLN
qKNITQm9kAhjlck9giFwqYg2r7OU6rD6d0w8m1Rrq/2i2BrrGW2wLA4kWN8EBBvJ
nz21V8CKIVn99+2enUxPG/VDkVams2uTYHxPewVIkGTAlbA17Aw0baVf7epHHivW
DJY5JpmrSM/iCK6ZG07QAqQp9VlXDMQ04AOatzKyPAWF7qkK/lA=
=SJ+f
-----END PGP SIGNATURE-----

--odPRANhjSWGytkIA--

