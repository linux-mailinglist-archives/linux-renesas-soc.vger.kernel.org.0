Return-Path: <linux-renesas-soc+bounces-2802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E685507B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 18:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B263B2E40B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 17:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813B984038;
	Wed, 14 Feb 2024 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFwZpJXi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558075579B;
	Wed, 14 Feb 2024 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707932309; cv=none; b=PvoaCjvzfS4JKNoDi47hWhNrO3G12idAnM/7xHU8uAkYbuGES7EZrKIgQYEbtmwrWu+wBu7bSGHoX08PyqHXhc5k9uNCT2HgWOzqU9miaCiR+l3BE3cBGsgdBM6UodPAkEhQRrJuMEX1K5Ttmhxj8L6DWZmzzyquBMFaM0Q7Uks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707932309; c=relaxed/simple;
	bh=IiYQF26rHcauIqxRIge+XQRewyHjGv95iv3BpsCXVAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTMPrPI0qwMP4bcHG2JaiwMBxe752GGuxlgeq9XWaLuFyilU8/nUuDogadCdNGJF2BiaBU0wLpS8Y3WB/edi/W80wl/IOgaI6LJ9mmmsdZMx1ReSHUKwQhRwgVp1d/q2BMmgBGZhrjFQkXDjU4T25vVsjb1UAPYxmkg3SCJVLZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFwZpJXi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4DEC433F1;
	Wed, 14 Feb 2024 17:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707932309;
	bh=IiYQF26rHcauIqxRIge+XQRewyHjGv95iv3BpsCXVAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFwZpJXi61nfL1VF6nrR0pHfwmQmxJkBFgoa/USL/bgdaNTu7e3U3yHEDV6sE8jyQ
	 C0pvmw9FvxbTIpn6LE4YsrsZs4xArGnEd9ZyZY3dh0KRBaO8E6GLa3PDE336s7jIrQ
	 94r9NVmddZzdZ6SLBfnZd5fUyE0HBq+Tg2ahU29fOPTltSZ4K7jxgQ8258EPTowO64
	 XC+zaVGdggzAu/UJ3P0QrXylmEQyvVDqsXwk39/BoKDhlzNl633RMeIQ3O+m2Ap1D4
	 V9+Fcmo/IvAAcT9d7nkCqfRx6YGCxUYrXa0svAOOuHaQJQzgGzlAo0ZaDpEUu5dtxV
	 REna/R0EIqFOQ==
Date: Wed, 14 Feb 2024 17:38:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car V4M
 support
Message-ID: <20240214-gladly-helmet-21122fee1741@spud>
References: <fffc5a0a73c4cc8e8d7c5d93679531cc24e006ca.1707915511.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SKK1z5N5EjiUJpWj"
Content-Disposition: inline
In-Reply-To: <fffc5a0a73c4cc8e8d7c5d93679531cc24e006ca.1707915511.git.geert+renesas@glider.be>


--SKK1z5N5EjiUJpWj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 01:59:57PM +0100, Geert Uytterhoeven wrote:
> Document support for the SD Card/MMC Interface in the Renesas R-Car V4M
> (R8A779H0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Do=
cumentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index f7a4c6bc70f6cade..29f2400247ebc674 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -67,6 +67,7 @@ properties:
>                - renesas,sdhi-r8a779a0  # R-Car V3U
>                - renesas,sdhi-r8a779f0  # R-Car S4-8
>                - renesas,sdhi-r8a779g0  # R-Car V4H
> +              - renesas,sdhi-r8a779h0  # R-Car V4M
>            - const: renesas,rcar-gen4-sdhi # R-Car Gen4
> =20
>    reg:
> --=20
> 2.34.1
>=20

--SKK1z5N5EjiUJpWj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcz6kAAKCRB4tDGHoIJi
0uk1APjfI0a7R/x+zOt7rp1IxVplKz6YnTF3m84CPS3gpQpuAP4ydTy9zBnVUbkE
zgZdFaPUNRkqxbppLMJu44UenWYRAQ==
=FNQE
-----END PGP SIGNATURE-----

--SKK1z5N5EjiUJpWj--

