Return-Path: <linux-renesas-soc+bounces-6817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D86918748
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 18:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04DD61F21437
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 16:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C244E18EFF5;
	Wed, 26 Jun 2024 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMMUESjx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC7B18E748;
	Wed, 26 Jun 2024 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719419160; cv=none; b=FYHPL6HrHkbl4oE37cQ8/C3COU6LdW8gHgVsyu4yvVAVpkJo56AsJbf/TZhtdzN3KSh/tXqpDMlVXvh33lC+jDcpqwnHW0fOm9jwmiVr4v9TJF24R6jVQAs9YdJONKO3fQIN4T+ZBWQ6h67ixmYdNjEXvQRjYGZeuiF13aZxwW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719419160; c=relaxed/simple;
	bh=gKweBeIdanDWX8TnnMo+y0bEyNudiUK+jx8cMWSHPWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHo5+GXsGbPgp2x0/3muzVdnT/yG/o4zeWHInpR72kacpTn3Lm3gnRsEhb1aHAoEScFUC+T5qZzor0da71d3c4htKQIqlxB7DJXF7yTDz4HmOEew0C5bljeNmpIiQRLv8Iy0LUnBfPs6rwsTVnsBhwYjniNVzGdbeinp7SbM5vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMMUESjx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB09C116B1;
	Wed, 26 Jun 2024 16:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719419160;
	bh=gKweBeIdanDWX8TnnMo+y0bEyNudiUK+jx8cMWSHPWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMMUESjxdNxP0lG5BmRTdjjpHKXR4GWOstFlvJNQrqHGrr3G0iSgBMvBF0rdvkZ1I
	 3GzU60izXaBEsncvI6uIXv7Cnk5UdWs4gm5xOeFwWeE9fXQQl5YbL/BXxcLbxPc5k+
	 vqiIFILCusmAfBCkLjt0romOXlnI/LSCpdpYM2koMCHdWpuYf27juu07xrRNSGqRhf
	 goFE4zCcbZcvhedEPMe9ucqJVBMkt1q+P5Ac+lqTe/rrkrBa2HQiPop51xdcDMwYdG
	 Cb9+QdG3r02AzsxBT9PuPdYg/SG8vma136lCOyepOBAfal31jECE5x3zLC2kvnmii/
	 AK/YIUDImEPKA==
Date: Wed, 26 Jun 2024 17:25:55 +0100
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
Subject: Re: [PATCH v4 1/3] dt-bindings: mmc: renesas,sdhi: Document
 RZ/V2H(P) support
Message-ID: <20240626-vindicate-lemon-01754dbe1eb3@spud>
References: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626132341.342963-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v7cgs3kd0EkKSpaY"
Content-Disposition: inline
In-Reply-To: <20240626132341.342963-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--v7cgs3kd0EkKSpaY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 02:23:39PM +0100, Prabhakar wrote:
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
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4
> - Dropped 'renesas,sdhi-use-internal-regulator' property
> - Moved 'vqmmc-regulator' to the top level
>=20
> v2->v3
> - Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
> - Added regulator-compatible property for vqmmc-regulator
> - Added 'renesas,sdhi-use-internal-regulator' property
>=20
> v1->v2
> - Moved vqmmc object in the if block
> - Updated commit message
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Do=
cumentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 3d0e61e59856..d632b67080bd 100644
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
> @@ -111,6 +112,15 @@ properties:
> =20
>    max-frequency: true
> =20
> +  vqmmc-regulator:
> +    type: object
> +    description: VQMMC SD regulator
> +    $ref: /schemas/regulator/regulator.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      regulator-compatible:
> +        pattern: "^vqmmc-r9a09g057-regulator"

The regulator core seems to say this property is deprecated:
	/**
	 * of_regulator_match - extract multiple regulator init data from device t=
ree.
	 * @dev: device requesting the data
	 * @node: parent device node of the regulators
	 * @matches: match table for the regulators
	 * @num_matches: number of entries in match table
	 *
	 * This function uses a match table specified by the regulator driver to
	 * parse regulator init data from the device tree. @node is expected to
	 * contain a set of child nodes, each providing the init data for one
	 * regulator. The data parsed from a child node will be matched to a regul=
ator
	 * based on either the deprecated property regulator-compatible if present,
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

What am I missing? I also don't really understand why you're allowing a
pattern either, could you explain that?

Cheers,
Conor.

	 * or otherwise the child node's name. Note that the match table is modifi=
ed
	 * in place and an additional of_node reference is taken for each matched
	 * regulator.
	 *
	 * Returns the number of matches found or a negative error code on failure.
	 */

> +
>  allOf:
>    - $ref: mmc-controller.yaml
> =20
> @@ -118,7 +128,9 @@ allOf:
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
> @@ -204,6 +216,18 @@ allOf:
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
> +      required:
> +        - vqmmc-regulator
> +    else:
> +      properties:
> +        vqmmc-regulator: false
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.34.1
>=20

--v7cgs3kd0EkKSpaY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnxBEwAKCRB4tDGHoIJi
0ozzAP95IRJZ0EjXSMzIUOuDTe+fedfvuRyxrHG4fG2r2OSLZgD/Wm5+2S//908A
8XyBYCJtQaABk/q1n+/AirgV8QeR+A8=
=CARI
-----END PGP SIGNATURE-----

--v7cgs3kd0EkKSpaY--

