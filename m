Return-Path: <linux-renesas-soc+bounces-1838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A7083C8C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 17:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24DC71C2263D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 16:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBED140794;
	Thu, 25 Jan 2024 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRrNkVd0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24C413541E;
	Thu, 25 Jan 2024 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706201111; cv=none; b=DFf1pMjszyv7Oh1KWuB/lYh7Rxvpwn21V6RtMv0cQP9RIy5yvz+4PC4p/zcALuxPCoHBzBrnPqduDnOl9XHA9yZG35kqqyBoUw/5eF86MaVjTswrP21eFKUZg2bCog0qm3WDoVdnvcbatO8CTw63JESrUvjRNFcXLk9B9jb3v7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706201111; c=relaxed/simple;
	bh=+x0jNMUB0PsAx8UUuJzQkSXimj4lp6KxtD09dm3ixXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvX+77WWY86GnVaxCngpebB66Jl9vGvXOykhx8HvjRPoCH56vzTzkzqIon3E1BueBmB57BqgOGz+/fan7Ghf8FHzGGSauV0Y2+VLf3RoP7bERGbdneljyJiID2u/7uQgodw3wAIDTBOJC8BH82FEtnzmjAao/2TTbfmkz6bgL2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRrNkVd0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912FEC43330;
	Thu, 25 Jan 2024 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706201111;
	bh=+x0jNMUB0PsAx8UUuJzQkSXimj4lp6KxtD09dm3ixXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRrNkVd0usNw1Kh6FHh22H1LlbXUlVLol5NM2UjkjhcG+CMBrAEq7pjG8ag/W5fM0
	 TA4IPzTnNKLDNd/58fbtl/G+0Zst85CZ0fqTnhvNmCadE6HNjcS9uaao1OYX6bpPqr
	 azh7xYoBYscwB4RAF712b4Hc0I+jv1lkx8udZOhvu2ruHEv2tecvNoNvP8LDTbmNtt
	 naxan0ET+kVKwJOP2W125UfGppS1cwTetURXX6L9j3CuDAz+vk3whqWAEHIZ/H5Ra8
	 cyt0uovV2NFFAiM+gwsyssSSNyvM8S77fjEM30SbibXD8RiKoD0ZRhfDqr7W7U4Lz9
	 p5i79ozhcR3DA==
Date: Thu, 25 Jan 2024 16:45:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: soc: renesas: Document R-Car V4H
 White Hawk Single
Message-ID: <20240125-attain-legged-cacf4d597ed4@spud>
References: <cover.1706192990.git.geert+renesas@glider.be>
 <a44d990c962c8e0aac3b133eaa563f8c92b2ce29.1706192990.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8ZnRTkyejO/hbHTc"
Content-Disposition: inline
In-Reply-To: <a44d990c962c8e0aac3b133eaa563f8c92b2ce29.1706192990.git.geert+renesas@glider.be>


--8ZnRTkyejO/hbHTc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 03:48:51PM +0100, Geert Uytterhoeven wrote:
> Document the compatible values for the Renesas R-Car V4H ES2.0
> (R8A779G2) SoC and the Renesas White Hawk Single board.
> The former is an updated version of R-Car V4H (R8A779G0).
> The latter is a single-board integration of the Renesas White Hawk CPU
> and Breakout board stack.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
> v2:
>   - Add Reviewed-by.
> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b=
/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index 16ca3ff7b1aea146..15b9dd52938996f4 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -348,6 +348,13 @@ properties:
>                - renesas,white-hawk-cpu # White Hawk CPU board (RTP8A779G=
0ASKB0FC0SA000)
>            - const: renesas,r8a779g0
> =20
> +      - description: R-Car V4H (R8A779G2)
> +        items:
> +          - enum:
> +              - renesas,white-hawk-single # White Hawk Single board (RTP=
8A779G2ASKB0F10SA001)
> +          - const: renesas,r8a779g2
> +          - const: renesas,r8a779g0
> +
>        - items:
>            - enum:
>                - renesas,white-hawk-breakout # White Hawk BreakOut board =
(RTP8A779G0ASKB0SB0SA000)
> --=20
> 2.34.1
>=20

--8ZnRTkyejO/hbHTc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbKQEwAKCRB4tDGHoIJi
0inXAQDtx74/vguxSYwY9vNEe1B/nQiOjGebeFffrAYr3SQ9BAEAk1xPBDgNKK58
Y2QlRASsKq+lJVQYfVWZxYXI108HMgI=
=l9WT
-----END PGP SIGNATURE-----

--8ZnRTkyejO/hbHTc--

