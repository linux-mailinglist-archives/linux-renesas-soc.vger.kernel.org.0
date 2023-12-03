Return-Path: <linux-renesas-soc+bounces-574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D6E802333
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 12:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FEBEB20A07
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 11:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7598F9465;
	Sun,  3 Dec 2023 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oe3vWzzI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8FE28F0;
	Sun,  3 Dec 2023 11:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AFEC433C7;
	Sun,  3 Dec 2023 11:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701603578;
	bh=IsNDQXvcV8oNcM8qJi0HdMM6+rmuZV0KItfHdfblRL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oe3vWzzINrWXp878HuuAe/7JnpDFC0JAgsd2wRzgUmgq84TaI4K4gaPJlyzcg5Qhx
	 EnP43bgX4Lu/aTepMVQ4shW2W7rNO5ij10cqG0LEP8HIcG2SnYf7riKHoFx5higg6R
	 3SPIqULL3YVojBNv+PZRRGRZyUJL4zU+iBFp+XCTv//n+I73zqU1UIEHUOgkRFkb1z
	 xUBKJeUvRvOmfTfLZUaCZR6ZA9Oq99m2w7Dih5IH+QZjJ/xs1I4bNYKU9LLEr3EFcA
	 iRjcQkIH6mJdM0My3BCfjJfXXebpJz3CA6KmSOJUoZoHtXItzeL7ht4aXPzZv1US1x
	 sgoTh0uWsUriQ==
Date: Sun, 3 Dec 2023 11:39:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 05/11] dt-bindings: mfd: dlg,da9063: Update watchdog
 property
Message-ID: <20231203-pond-thrash-82386f60d283@spud>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-6-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lJDrleECt3C3Sbl5"
Content-Disposition: inline
In-Reply-To: <20231202192536.266885-6-biju.das.jz@bp.renesas.com>


--lJDrleECt3C3Sbl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 07:25:29PM +0000, Biju Das wrote:
> Update watchdog property by referring to dlg,da9062-watchdog binding file
> and drop its definition from this file.
>=20

> While at, update description with link to product information.

This is unrelated IMO.
Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/mfd/dlg,da9063.yaml   | 21 ++++++-------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Docu=
mentation/devicetree/bindings/mfd/dlg,da9063.yaml
> index c5a7e10d7d80..1bdfb2be2e17 100644
> --- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> +++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> @@ -17,6 +17,9 @@ description: |
>    moment where all voltage monitors are disabled. Next, as da9063 only s=
upports
>    UV *and* OV monitoring, both must be set to the same severity and value
>    (0: disable, 1: enable).
> +  Product information for the DA906{3L,3} devices can be found here:
> +  - https://www.dialog-semiconductor.com/products/da9063l
> +  - https://www.dialog-semiconductor.com/products/da9063
> =20
>  properties:
>    compatible:
> @@ -35,21 +38,6 @@ properties:
>    "#interrupt-cells":
>      const: 2
> =20
> -  dlg,use-sw-pm:
> -    type: boolean
> -    description:
> -      Disable the watchdog during suspend.
> -      Only use this option if you can't use the watchdog automatic suspe=
nd
> -      function during a suspend (see register CONTROL_B).
> -
> -  watchdog:
> -    type: object
> -    $ref: /schemas/watchdog/watchdog.yaml#
> -    unevaluatedProperties: false
> -    properties:
> -      compatible:
> -        const: dlg,da9063-watchdog
> -
>    rtc:
>      type: object
>      $ref: /schemas/rtc/rtc.yaml#
> @@ -82,6 +70,9 @@ properties:
>          $ref: /schemas/regulator/regulator.yaml
>          unevaluatedProperties: false
> =20
> +  watchdog:
> +    $ref: /schemas/watchdog/dlg,da9062-watchdog.yaml
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.39.2
>=20

--lJDrleECt3C3Sbl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxo9QAKCRB4tDGHoIJi
0lxmAQCZiPPu1GH49G+JcOH0BtnSVarKp68Hl6rlwx1ICV2/mAEAqLaFmn92JqF7
B7dow6AwvAEGufCKFaNsHjQHKggqLgY=
=GUht
-----END PGP SIGNATURE-----

--lJDrleECt3C3Sbl5--

