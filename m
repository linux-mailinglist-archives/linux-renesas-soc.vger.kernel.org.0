Return-Path: <linux-renesas-soc+bounces-6708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B4491547B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 18:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE17286168
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 16:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F94C19E7EA;
	Mon, 24 Jun 2024 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfW6GWZw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1537119E7C1;
	Mon, 24 Jun 2024 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719247155; cv=none; b=bCpReFU9RBrl/XwdseVx8Yp5InevVW1aiLBdo2hl5YxqHLwdHpNJHJoFC1jyXQkPonJFFZTUuJcwiclKS22LvyLrrhJrY3Mmh74MErILF2uplo2D809cKvOFn3OrYDjt5401LGwGfDRkIT2+BOOEem00oaiW+y5nX/uJZrAAaU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719247155; c=relaxed/simple;
	bh=eqs00n4+UDoC3Z/DNr8LAH5mFvTl7xb4hGQdQJEOuZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xs56eZLWhhmygf0WCkB+yc2RkAPuE6+PayUiZmDsLdGGNiCAS8GDmLAhsa2y266PCyUg21g7vKvSv4J5I9VDIikK+mE4otBrMTMnDgkX0433jPhX9/anPugTm27KjOZBjPmjQHzLISzefnuTEJ4NOuTBpupnCC6bEO4hQE9czAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfW6GWZw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9DEC2BBFC;
	Mon, 24 Jun 2024 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719247155;
	bh=eqs00n4+UDoC3Z/DNr8LAH5mFvTl7xb4hGQdQJEOuZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZfW6GWZw5Y0LrI/oVFAJwcK4oxwxthA3Zm2OT/hia4TSG5E4ywv2jzg0Hvf3HM9+I
	 8vf/G5Qw6rBF0b+si7MWoDVyw+SYlbvZoBBj5Q+1nbSH9+eqLplzSTaK47E5t0onhz
	 3DM1TOBdE3noGu7IJEVDVQgjdMsneAjLW/MjyCkF8Yz+SAGC0KbrAkCV7AQlTp2tPn
	 PorCU6P7zUzY2V3n0HjszJuqHpSsd12xnseBtaO0OV3UZRMl5W8/lbyLkCGDL5ddwY
	 RDSW3ulJHiwwyiDVA2Ka1LKamMQxQW7Iy+TJPCVzHfW/LnkYtPqHAEAeg2lTuNekhk
	 vQsvDpq7q7VJA==
Date: Mon, 24 Jun 2024 17:39:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document
 RZ/V2H(P) support
Message-ID: <20240624-request-demeanor-d66965d27935@spud>
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L0bfX9GEU5XPf3Zo"
Content-Disposition: inline
In-Reply-To: <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--L0bfX9GEU5XPf3Zo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 04:32:27PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
> of the R-Car Gen3, but it has some differences:
> - HS400 is not supported.
> - It supports the SD_IOVS bit to control the IO voltage level.
> - It supports fixed address mode.
>=20
> To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g057'
> compatible string is added.
>=20
> A 'vqmmc-regulator' object is introduced to handle the power enable (PWEN)
> and voltage level switching for the SD/MMC.
>=20
> Additionally, the 'renesas,sdhi-use-internal-regulator' flag is introduced
> to indicate that an internal regulator is used instead of a
> GPIO-controlled regulator. This flag will help configure the internal
> regulator and avoid special handling when GPIO is used for voltage
> regulation instead of the SD_(IOVS/PWEN) pins.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
> - Added regulator-compatible property for vqmmc-regulator
> - Added 'renesas,sdhi-use-internal-regulator' property
>=20
> v1->v2
> - Moved vqmmc object in the if block
> - Updated commit message
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 30 ++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Do=
cumentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 3d0e61e59856..20769434a422 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -18,6 +18,7 @@ properties:
>            - renesas,sdhi-r7s9210 # SH-Mobile AG5
>            - renesas,sdhi-r8a73a4 # R-Mobile APE6
>            - renesas,sdhi-r8a7740 # R-Mobile A1
> +          - renesas,sdhi-r9a09g057 # RZ/V2H(P)
>            - renesas,sdhi-sh73a0  # R-Mobile APE6
>        - items:
>            - enum:
> @@ -118,7 +119,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: renesas,rzg2l-sdhi
> +            enum:
> +              - renesas,sdhi-r9a09g057
> +              - renesas,rzg2l-sdhi
>      then:
>        properties:
>          clocks:
> @@ -204,6 +207,31 @@ allOf:
>          sectioned off to be run by a separate second clock source to all=
ow
>          the main core clock to be turned off to save power.
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,sdhi-r9a09g057
> +    then:
> +      properties:

Please define properties at the top level and constrain then per
compatible.

Thanks,
Conor.

> +        renesas,sdhi-use-internal-regulator:
> +          $ref: /schemas/types.yaml#/definitions/flag
> +          description:
> +            Flag to indicate internal regulator is being used instead of=
 GPIO regulator.
> +
> +        vqmmc-regulator:
> +          type: object
> +          description: VQMMC SD regulator
> +          $ref: /schemas/regulator/regulator.yaml#
> +          unevaluatedProperties: false
> +
> +          properties:
> +            regulator-compatible:
> +              pattern: "^vqmmc-r9a09g057-regulator"
> +
> +      required:
> +        - vqmmc-regulator
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.34.1
>=20

--L0bfX9GEU5XPf3Zo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnmhLQAKCRB4tDGHoIJi
0u5GAP46hhJTW4dDlB7GHrPo+ArAzALm61T9XgVfP6aUk3bsgAD+L1E4/ScfugT+
yptW3oL4pA4cCaNA86M1tx8LuoHJTwI=
=axPI
-----END PGP SIGNATURE-----

--L0bfX9GEU5XPf3Zo--

