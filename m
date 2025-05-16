Return-Path: <linux-renesas-soc+bounces-17178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD3AB9E88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 16:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 987D27B0881
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 May 2025 14:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A25A189F56;
	Fri, 16 May 2025 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1d2aH/Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2C6176AC5;
	Fri, 16 May 2025 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747405255; cv=none; b=WXJVh+HTipelQxXhX8YXrYqFnk4P1dvxs8OgrKuTvjEMaVJ1A6QLqqLoeCkvLUKPe8lvEmQH3EoTmrC2kcADfoWdzTSSIe3J3dOLVFBA/eDJBUuyHlWDQy8qREW1eQ4qSU5h91HMfOW4lXGB5KcobZ68Uf63M3L0LGcD6SfK9V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747405255; c=relaxed/simple;
	bh=R7IzZ+E4n4fy5bHk20LY8LFQxi9liKPZf9W5SmiiXgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prCUYCVYupyTMoN54Uo0OlsWw+yBi7aWW1P1wvNKoEDXQIwiF0ek8p2X5i3eWTFd2d1P2V+KktOpi7tXE8et2J7Jbp+/ywez7pbyyIqrB5eC77Tidj1tfVF/8ifTNK0ik++1750UG4s1tClablrATP6VDCsHRX1Ecap18K76mhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1d2aH/Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D105C4CEE4;
	Fri, 16 May 2025 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747405254;
	bh=R7IzZ+E4n4fy5bHk20LY8LFQxi9liKPZf9W5SmiiXgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1d2aH/ZymXUKtVmEKSo0wq/ORTu4b3Z+Dhp1bhYh+zsh1gNxbCqUBz9vnksrDNSn
	 zD5Q/KVGDOZYelp1UYVIMEgWEU1t4uWjLP7H8nat1u/1BGELXdI7e736GPSoxs3ZXC
	 0uvGxNPm+rvEUn0vyWZZGECywZZGM7SwMMphzzAwsr3G/6rKgD45IdUL/OF5hWKyHW
	 6tfhHt6/M4vGnZ2mAEZFT7a1+tTUy3gIBpNk2BO39VqaBnNeekm+DUIGR3xlPtQo+w
	 mstQydv5a9GdB1QRZy4zC+DyIXJ4ZX8NVQf0a0FXkmNZ0NjQont4rBPFERjX0oxxAe
	 Ta6IkMlTRbaSw==
Date: Fri, 16 May 2025 15:20:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N
 (R9A09G056) support
Message-ID: <20250516-unpaid-reexamine-922bbecd4cbb@spud>
References: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250515182207.329176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="88xPX6GY1mTCQwI+"
Content-Disposition: inline
In-Reply-To: <20250515182207.329176-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--88xPX6GY1mTCQwI+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 07:22:06PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the Renesas OS Timer (OSTM) found on the Renesas
> RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> other RZ families, so no driver changes are required as `renesas,ostm`
> will be used as fallback compatible.
>=20
> Also update the bindings to require the "resets" property for RZ/V2N
> by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
> the "resets" property.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> - No changes in this version.
>=20
> v2->v3:
> - Added Acked-by tag from Conor.

But v3 -> v4 doesn't mention why it was dropped?

>=20
> v1->v2:
> - Inveted the logic in the dt-bindings to require the "resets" property
> - Updated commit message
> - Added a Reviewed-by tag from Geert.
> ---
>  .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/=
Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> index 9ba858f094ab..0983c1efec80 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> @@ -26,6 +26,7 @@ properties:
>            - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
>            - renesas,r9a07g044-ostm # RZ/G2{L,LC}
>            - renesas,r9a07g054-ostm # RZ/V2L
> +          - renesas,r9a09g056-ostm # RZ/V2N
>            - renesas,r9a09g057-ostm # RZ/V2H(P)
>        - const: renesas,ostm        # Generic
> =20
> @@ -54,12 +55,11 @@ required:
>  if:
>    properties:
>      compatible:
> -      contains:
> -        enum:
> -          - renesas,r9a07g043-ostm
> -          - renesas,r9a07g044-ostm
> -          - renesas,r9a07g054-ostm
> -          - renesas,r9a09g057-ostm
> +      not:
> +        contains:
> +          enum:
> +            - renesas,r7s72100-ostm
> +            - renesas,r7s9210-ostm
>  then:
>    required:
>      - resets
> --=20
> 2.49.0
>=20

--88xPX6GY1mTCQwI+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCdJwQAKCRB4tDGHoIJi
0mvIAQDauy3Hd/nBGPUcMQK3MebaA9RozB2H7bmL2zx8VKNLSAEAgRw7hsp/2Rjh
5C8Wbm9MLFseOKB6HArt1synqePz2wA=
=uGiL
-----END PGP SIGNATURE-----

--88xPX6GY1mTCQwI+--

