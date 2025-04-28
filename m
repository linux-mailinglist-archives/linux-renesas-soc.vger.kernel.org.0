Return-Path: <linux-renesas-soc+bounces-16423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AEAA9F636
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 18:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 171F17ADAC2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 16:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B31D27FD56;
	Mon, 28 Apr 2025 16:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zl1YQ7se"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED76027A121;
	Mon, 28 Apr 2025 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859055; cv=none; b=cBXI5RG0ElL8gx6s9k64Ij7jMvHE0LBwlEjyV4Gw3jH8NiZv0ISG5pUahj3vDm7a9hTPmKGP7VthevX/+FJeVA63zUcZ+cYb5jBIXm6fEnQG6sUoxKU/KUUnEImFF7cEe1uvaKMvurVeqlVg3o/dT/OJxVmTisUx0oOrdi48tGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859055; c=relaxed/simple;
	bh=w8GeZnfKH54B+v/IYdcqkdWVdQCakOpqtic13lGX4Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0/ulx63MpS1VXG2KDAtRFi4k7cHttKCFFLbiAOFaXKyX+u1jesN/p92yxlVsJ9myE6bpK69wHUcWNshFm/YP4PgiCiU8i7Uv5V2mMuYITZyT8gK9jD/UCpqHgSOcTHy9mgPwnF5HeWcmwm+2scelj7ZA9mbwQaIb97IWRxRx14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zl1YQ7se; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D10C4CEE4;
	Mon, 28 Apr 2025 16:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859054;
	bh=w8GeZnfKH54B+v/IYdcqkdWVdQCakOpqtic13lGX4Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zl1YQ7seWqYm7DELGZwOo1oAwoe1+S11syjyi5Ia9aq4xVSUQhxNm6VSwt05ST0Hb
	 Xu1Qr2lGagi56zAKiit6UXOL1+VoEQ8Md5ExCthQ7PEbMqCpb4+i9KsLEIqE/LjlKr
	 CYEbuwa72PAOsdXw0LbeRvQHfD9tAAkJTtJVsl9nQOfdNpoAJ7dS75FBEhW82ZcZ8E
	 MBWjpGfg1obcuiL4/UHesWK/cCREy9znXg9jY2bXKgLDXT3Iqugyo8I7yKpauAXuxF
	 ACcXKVDEV4KbSJzxapAUF8uQdvGPWWz0IbVXa5GWVTn3roiYIMNCIyGP4PJ/7EM4pC
	 pjJQmgLqz06AA==
Date: Mon, 28 Apr 2025 17:50:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt: bindings: arm: add bindings for TQMa95xxSA
Message-ID: <20250428-scalding-coffee-70507d952247@spud>
References: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nhw6v3yNy4dTm1za"
Content-Disposition: inline
In-Reply-To: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>


--Nhw6v3yNy4dTm1za
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 03:59:08PM +0200, Alexander Stein wrote:
> TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
> reference design.
>=20
> [1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqm=
a95xxsa/
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
> Changes in v2:
> * None
>=20
>  Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 447054b52ea39..a6cf65e10d43f 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1419,6 +1419,16 @@ properties:
>            - const: kontron,imx93-osm-s    # Kontron OSM-S i.MX93 SoM
>            - const: fsl,imx93
> =20
> +      - description:
> +          TQMa95xxSA is a series of SOM featuring NXP i.MX95 SoC variant=
s.
> +          It has the SMARC form factor and is designed to be placed on
> +          different carrier boards. MB-SMARC-2 is a carrier reference de=
sign.
> +        items:
> +          - enum:
> +              - tq,imx95-tqma9596sa-mb-smarc-2 # TQ-Systems GmbH i.MX95 =
TQMa95xxSA SOM on MB-SMARC-2
> +          - const: tq,imx95-tqma9596sa         # TQ-Systems GmbH i.MX95 =
TQMa95xxSA SOM
> +          - const: fsl,imx95
> +
>        - description:
>            Freescale Vybrid Platform Device Tree Bindings
> =20
> --=20
> 2.43.0
>=20

--Nhw6v3yNy4dTm1za
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaA+x6QAKCRB4tDGHoIJi
0gVvAP0YmLaFnU0LzkqbM1C1p2Iq6QSPxnYt3l/wmcpd2kus0wEAiAs1v+vcr16G
FoAD7cwjXSKih7VMnauIiYZDgL4bigw=
=RYkS
-----END PGP SIGNATURE-----

--Nhw6v3yNy4dTm1za--

