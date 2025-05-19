Return-Path: <linux-renesas-soc+bounces-17222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F6ABC760
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 20:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 157087A7171
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 18:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144EB2066F7;
	Mon, 19 May 2025 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DOZIW3VW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45621EFF8F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680641; cv=none; b=fPgpcm7GETFIZL/9JD8SnVsZmasu48W8TcEgdH4hkCJQW8byJ/IrvkKCQAh/LihG+UHAcDTNz+MjsI+4JitFlvzJutS7ywNdJXUfYepcAP7bSujHp15mHLMbJCOSH3mtKpcwOiQmIlu7B9lsdNZZEE55QsZwOahOtm2/GKp4h7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680641; c=relaxed/simple;
	bh=/8I4SWUDCIRTZj3Sh/4b5wvaTLCOFYR5oPMTXs4Ribs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcXIdLcZ9IbeQJ8iINfawnQHw9s6L6qNV8PN9Y+MAI1njkqgaVzEAa6UNs/0vpvRTd15ESj6M/A1cH7luuqSprapaIZhpVpszOPq212G3uUbzVbwEhG3tpmh+Qe/dWxpdxS5R3dlRUkVasMmf2ksm97uCzjIw31PeYN8hZAfMRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DOZIW3VW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/8I4
	SWUDCIRTZj3Sh/4b5wvaTLCOFYR5oPMTXs4Ribs=; b=DOZIW3VWJI5Ettv3r7wM
	X+w4ad4y4+DAO9ZtCPahs8xUgOFCFzMFnLZrPoSY3IAxkDJ5rZav+V1xBWxrFq6Y
	rDBJp149eJ7/7z4kQtK7xUMRDbksB2dDqS7iB867e7CRoSUJ26J+ajXCUl/6+Z3s
	AjMbvbxE6aCyapWGSsQpvIRQnCkc16dJBcZQIUdKWrWeG1wA2p+wcN6GdB+XZa8t
	F+dgHXoyB2xKmTEOPNsejNv5i+SMm78i8ayHFhneVta9xzkVsKTXc91W5057u0mN
	tJWvOBQCVzxlK0n3XSXwtwJO/41Y0WeV6YZwPOn0vAQVbZ0AoiFmKzdB4C0hMYfs
	nA==
Received: (qmail 2603142 invoked from network); 19 May 2025 20:50:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 20:50:36 +0200
X-UD-Smtp-Session: l3s3148p1@vph1m4E1ONRZz6uL
Date: Mon, 19 May 2025 20:50:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO
 based I2C busses
Message-ID: <aCt9e-rrOOR0C5HI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
 <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
 <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
 <aCtD7BH5N_uPGkq7@shikoro>
 <3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>
 <aCtK1-Yn6u8-n8mU@shikoro>
 <e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>
 <aCtbg0_vD07g394k@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WXFEbYeipUFU1N3a"
Content-Disposition: inline
In-Reply-To: <aCtbg0_vD07g394k@shikoro>


--WXFEbYeipUFU1N3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 06:25:39PM +0200, Wolfram Sang wrote:
>=20
> > I think either we use i2c-X or commit 57138f5b8c92 ("schemas: i2c: Avoid
> > extra characters in i2c nodename pattern") from Herve was not correct
> > and needs to be fixed.
>=20
> I will look if I can fix dt-schema instead. Thanks for the pointer!

Found it! Patch sent.


--WXFEbYeipUFU1N3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrfXsACgkQFA3kzBSg
KbaZcQ//SdIH9JF6XLo4IUQMXcSxWyKNFCRI6fHKx5mLUOvqKnNbQi0zRPpssStd
dDLZZhMIVhmnb81NdZYAhf51ZcizGpb6JhoE2Ki/Q3czg3mROel0i5M00mOI4ELV
PUfpfTm4k4mZGsxSzaJt1rHvDJnCt4epll0PZ9zHwHmUe8QT7Tf9C5qi0F3BLx3W
XqgqN0Tuy8HmOXLqo4ZEeX8TbiuIbI8BRD0ONGPb7TZMHMpLVS7dhDH4v0ek8/Sk
jn1OYMI7P7ahAMJAtHp4r9JO3lw9nqiUZkYJsGiHVteuSqCRx5xsuMiRfXJr9VVg
KfvUf+vq14MrYQiCy57tNVq+Ma4nioo5cVWf92zmlHaVxWXDxire9jVwU26H1jvt
bfX+JnYAEe4BRck+zOzEW8RzthLEFtt+o+oqz1Eb2PbBDfGYvbYLJTr7OU6n7Snc
+1rdad/nbnFtUXFkmJUGuMghZjkLrMUv4Ok/f4XmZWvySuaBHdYtgZx+Y/AyVEbl
Gti58GL88aL0u+SdsFBk0K0IngEfrmJoJlvzBR5/9pX5miHDK74+jEI54wzHWC44
pldcix6/0kyzVed2HJArMJh39ytDwlsP+kNCEWQqMXddPgJVjQpHCdHUU7pGp8WP
MSkmFPIX/fp5yq9gZd/AJErEZOiJAvCzr/Tk8IKjw7EEoEhuk3I=
=59J0
-----END PGP SIGNATURE-----

--WXFEbYeipUFU1N3a--

