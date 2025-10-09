Return-Path: <linux-renesas-soc+bounces-22812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF8FBC78EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 08:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA16619E2295
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 06:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267602BE03E;
	Thu,  9 Oct 2025 06:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WorrVgs7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421362AD16
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 06:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759992202; cv=none; b=kn0itCIhx1irx3sdG83c1uzEnJ915W7W52MDbhpUDqbX3xCi4M52xEpecSnKELgiBRhgw0K6O9+09xUMvNlJDyIjzG89lYeK+KG8xJR7emrXvTfFbRJVROAjEWRqkJro9cU5qN2ppNMdxABZRJIz2fWlGGKNLXnSBZiT8J5mfbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759992202; c=relaxed/simple;
	bh=fLSwxtc/Uh5Exvce/ILci2exOCK4YynRp2RHih/dDr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bK8YEqYXKCzZp0UrNHCxqMm6vrimYdZOIFMXLR/HHmwhr4ZY6v2h7vqIv9gDwzyt2TkhcB2JBjVFgXTECptO3MPhFH/jnQb1F0IESIdanLKBMSVpJD/VosY5IVJaOVsV4/P6NfMqh0m0YdTHkaouy/pwwCuj9dbVqGQBDuqoAZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WorrVgs7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cIKs
	F6uw46Zd4lyL+y01+ZpPeWMEBp7pEpqWtYPbILU=; b=WorrVgs7va3/D06my/Ox
	Li39RbLNwVAPE7z0V+7PmRIf+PrCFbImQdyKI33fdzg8CfDAtTYregoBBRYe8xxA
	h7Tg9NQ4Wk2YprkANGP6wNXwUUXmeqpqJLlsJMfppwPuAqByyc70QY6l4CLTf9IW
	7kRRguDUm2vQrRRBfeJIrkEsimrNHNLtrX1my4KzKnviPo4w1howby6lgEEDQCJ+
	5KcoYk5r6Uc80APH75atGPXKrHYmDxVVOoTo3TmRI702ExhsNTKavAuawGJIjFOw
	BJsGY+YUi1OYpK2jSQpPLgtzE/Pz6VEPqOAlCnLjyCAS3BlxF/oxOINxqtxFb9QQ
	Fg==
Received: (qmail 959016 invoked from network); 9 Oct 2025 08:43:15 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 08:43:15 +0200
X-UD-Smtp-Session: l3s3148p1@D+KdHbRAaOkgAwDPXwQHAL/S9V79e5yL
Date: Thu, 9 Oct 2025 08:43:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: bus: renesas-bsc: allow additional
 properties
Message-ID: <aOdZgyPJLsZ5IjBS@shikoro>
References: <20251007032209.7617-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUChRoJ-A4W-PBBQssMvsn1GZY5zXmWxJ9y+EA8M2p3gw@mail.gmail.com>
 <aOWGWkQn1AK22tJB@shikoro>
 <CAMuHMdUXoq3d010y0vyXvvaHpgaV7rHb66VAHrwJxAZXzt+z=g@mail.gmail.com>
 <aOY2tdEXmhdZ0Yeq@shikoro>
 <20251008224208.GA237448-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WzASAOFG86SchZzo"
Content-Disposition: inline
In-Reply-To: <20251008224208.GA237448-robh@kernel.org>


--WzASAOFG86SchZzo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

> There's always examples not to follow...

Sure. The good thing is that I could fix the bad examples, once I learnt
how to do it properly.

> The unit-address is the only part a bus schema should define. And there,=
=20
> lowercase hex is standard unless you have distinct fields (e.g. chip=20
> select and offset).

Okay, so, the proper pattern is: ""^.*@[0-9a-f]+$"" which is what most
busses are using. Will fix.

Thanks and happy hacking,

   Wolfram


--WzASAOFG86SchZzo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjnWX8ACgkQFA3kzBSg
Kba8Ng//UPT6MXaApkMnLZM6UdroTZipOW4beI3gkQNs2YjdeQiF+W2vmOVDgsgF
sPCnd1SoOoDkhaTLCVEnPsA+ZJj47TEgehJgfJ6i5lcZVNp/DnODS3WJ2lM+Rm+h
7hM+NOgBZgmYDMVdxW0c6jHewwGuM5LcztdYIc40laRD5Wseh5iuoKQXU+jl60yz
LCcH85pyN7T2L7iPV3GMJkHal4jvDMRJRLvu6tZllmPbFXRdosVoFss6lZamGSr+
6cpmq/8aSXFAbzh9OC1+qd/PbvkRE//HHKJd9ijr1mUDVoF6MiRmeiaRc9dYhF5V
uHQzP17KjwTEJQ/55U1myoH7IwjPiqCfB/Sm7s3MM/jJVV2KaryF6QcSnZ94Hykx
FGjDDGYkOskhf7jT2q4/qOBZi0Tw2xeAwrFUstqtPlGs+9DyOtvu0EC2rdcYb84f
vKdtScOj5uUJMziDxvRlySbAgOjtbgp+8LTQgU6mLsz06D/I58PMy6U1ljAtOOVw
LOyFwXNIZfmEOPEuBItvp2mchBX7cXsNeHYd+/DfgUMROVTWyhDrACONadhHKTkA
WXi2oZ+Shox0G1+cHo7A95NnquB5pivvP0zFO8JoQ4/QTAAb92NGSe94CzfLx9z/
g4b4asw/UcheacigeItzodXlA6tB87TZ5qyP7JXfaZIjJwfeftM=
=zBw2
-----END PGP SIGNATURE-----

--WzASAOFG86SchZzo--

