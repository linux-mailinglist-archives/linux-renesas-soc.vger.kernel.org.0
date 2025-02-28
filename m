Return-Path: <linux-renesas-soc+bounces-13793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F88A4948D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 10:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419CD170432
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 09:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880802561B4;
	Fri, 28 Feb 2025 09:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="etVQOC24"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E0724CEE4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Feb 2025 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740734122; cv=none; b=jUGWiAqQ9rXPzG/5irD1tEvcUNu04xAGaaOmPLRCHnWvc7Nk5Q9z8XGJd1/hLCXLgnaJqWk1PBidDb73og1/i5vTJUgtAXIwPZnpAxdw1CXuoaBMQAZPa6X+F3VDJyFXegfiTs06vdaG7E9IMXthl7KixNqpZmxOrdWSJv+jU4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740734122; c=relaxed/simple;
	bh=iHemyWBclsDYxml/HjjBfO+M/NqwRrSXX7ohXKSe4EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrN4qcgb+HtmBtZlpGZWA/dKL2vbUfD1xICjKkPaY1sUljWbdin/ghtafvweuaO90gXdQ9vVmlKGFCvYYxjoT0jb4yQQI85kIays1we1SRk4s/ZMr0a37Ne6HRTwhlpxNf2H45A9I4EJEKJJRSRgfOdGWBRyI3tD27kRoGF/9cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=etVQOC24; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YjLQ
	RlTTlXH4pS4RW/yAErbWoYlApLixsZ/2Pds8FxA=; b=etVQOC24+Q7QX3KSSuQj
	FnHqsFO4TdCco95VkjHW1zZmR25JOW4pn5DDJ/adZRxZ2WaSkycT6wP1aWyPc9an
	pLwXuJ2j5n+Yfvw+We0Epr91AvLOcPGs204D8+uKTjsm/kB+OhzyZVlbJEgm6F5U
	PLJKs7uQsPFpiMc+Uw6a+mXwPkYabHCHofK2QsMP5ufMP9VMReDOEe3LnwE/dp3d
	cn0V8Ya5EWbERKUNLDgqhvEAW9i0XQCA3gsGoz4IhgKYnPnEq2yP1SCdImBisOs3
	YKY5g0rE0YwbF77MmQLWciBj+M+nc4YNKhWz9obqFpZhWMJWG5OF3j5JLXoSUKRd
	qQ==
Received: (qmail 1234055 invoked from network); 28 Feb 2025 10:15:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Feb 2025 10:15:14 +0100
X-UD-Smtp-Session: l3s3148p1@N56GPjAvbou57tsS
Date: Fri, 28 Feb 2025 10:15:13 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Message-ID: <Z8F-oSnAxbtET__j@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-4-biju.das.jz@bp.renesas.com>
 <Z8CBsrD2gKL-V-UG@shikoro>
 <TY3PR01MB113460F7C9EB632B347F6C0EE86CC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G9+TkWseczR+2NM3"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113460F7C9EB632B347F6C0EE86CC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--G9+TkWseczR+2NM3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -       if (!preserve) {
> +       if (!preserve && !priv->rdev) {

'!preserve' basically means a hard reset is requested.  We should then
try hard to actually do a hard reset and not only a soft reset. So, this
approach is the wrong path IMHO.


--G9+TkWseczR+2NM3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfBfp0ACgkQFA3kzBSg
KbafNw//Wxpd1YYPCrRTzzM7QaGnYAD0VHnRoNNN4JYO7txTDQrSybY/8IhWJq+u
FtTuWslAb5xVSgVJqYvUEMH9eCiFL6FV8nlzIIOx0P4eRVlXXSQqxF3uScPkhSw5
AaWG28vPPKoIRb5gQqzkmHFdHzpcmKRYwWfCRGnU9QwXX3OAF5sznrfGXUpFv14k
A60sBMzO5GAu3IOUPn313vXKJ1YRwfWAzhjq2KhXxr3t1ruTpMVosJRQTYFKwTB5
pbppCnMQ1c1+r/bdjWRtvTuZD+B1tKF0qCNG/rpxlfJEHGblH6UxRb0QKDVKdrba
+ivOU6o3O64RZdKRudM3Vx4qGmMJpMs27yL0CG2gBZwbADAv9JgNnbt7Kx+G4Vlu
bz38tJ+v55yl62uW4k1aBmTdYCmSMlLlBzuy0zCTaGWVfqOY+KMULKB2sqPnNteQ
KCneDHd2gpadzAA+P9gSjhoMH0XJykd16xnMtMgd1KqMJg/Q79fKUX3IYDeHQJHi
/nMyppsSyhQEG60+LVU3wLKdesXHL4ykqA75C/heEPpObXZQpD5xf6grVea00iNu
IayE0P/vxU4qy4zJrX2FPYtiKho1UQjnZoxAcRsOD9KahUx0IZOuPnKnQOl6VPoM
LUt83Ubuf33FTa/em48cwBntuZrvRUu/uK1ZOR/8/o1RDXW7S6s=
=WfdY
-----END PGP SIGNATURE-----

--G9+TkWseczR+2NM3--

