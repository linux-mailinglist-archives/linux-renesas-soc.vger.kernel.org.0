Return-Path: <linux-renesas-soc+bounces-24427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FD5C48E78
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 20:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 067394F31C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 19:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CBE33C510;
	Mon, 10 Nov 2025 18:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W42E23mf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033EA32BF20;
	Mon, 10 Nov 2025 18:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800998; cv=none; b=Y+iJIX46pEcsrxfJe4dmu9t0iXR1Dsa3Ue3Qtkn8AZ6pBINGLTuqJoEsHWm4NvSyXURIL+5KLr+uRgY6Goi0fhGuXPqRW68SHjhotsrbTJXAP0UYf6mBSKmT/m57KJJgXmxPu54fy3CTp/HVlIlwReeQShFLFnvL8LO2Q1Y5d64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800998; c=relaxed/simple;
	bh=1wKoNGk3+neT78CBoHzPYh7DcF4v4Epl4oWHaKMfgHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXHA9+iTJD2bJQYhZM9/UyRpuEAk2t7CP/TjsRydl21QGPbxovamO9qxQIgFotGDEwqTchF1F9VVzKq20Mzwp4k3f5KNjgZebs/lRb92murtGRMjZJfku0CCNrAuydHGjY1q1SZyDyxAKZ+u0048s4UP0weITYM6xEaNeBuChoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W42E23mf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4C0C4CEF5;
	Mon, 10 Nov 2025 18:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762800997;
	bh=1wKoNGk3+neT78CBoHzPYh7DcF4v4Epl4oWHaKMfgHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W42E23mfndLfNxrsskmb6cNcDZyzYu/9d95uKO6GoGaHAnxrZ5x3HYCrGdmHJV250
	 jIc+m/nOaJNdBjqwC4kRG3KwxePN1VafeP7sbXTOfc9dfNwZHlm8sJaMNAEjAAs1Y+
	 NQv4EZSmbxBn3jMnXP1sMtn9PUjcO/Iq3IDYHjmQEVwstNiy3Iu3udpqijiUSWFxRX
	 ouV/81ee0k5gOl+gTA705TQd9UxRCxSD4Zq0lFih7bFSmZ/p3zztbCW7pc0gtXOTRh
	 O5s0++HcMMruK3B7OFMcc/Qcw6Rn4hNVBJLjJt/PduzTtiWP4Ct7Cq9Rq8uDM8C/iB
	 aoRrBVzN7hDbA==
Date: Mon, 10 Nov 2025 18:56:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/21] dt-bindings: reset: renesas,rzv2h-usb2phy:
 Document VBUS_SEL mux
Message-ID: <20251110-resonate-strict-c3d6c42f3e0d@spud>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <8fba0b7235bd398d41329fd087d68f7e98bbbaca.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GT7BDuKQnZgPdsmF"
Content-Disposition: inline
In-Reply-To: <8fba0b7235bd398d41329fd087d68f7e98bbbaca.1762773720.git.tommaso.merciai.xr@bp.renesas.com>


--GT7BDuKQnZgPdsmF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 01:08:04PM +0100, Tommaso Merciai wrote:
> Document the 'mux-controller' child node in the Renesas RZ/V2H(P)
> USB2PHY reset binding to support describing the USB VBUS_SEL
> multiplexer as a mux-controller.
>=20
> This is required to properly configure the USB PHY VBUS source on
> RZ/V2H(P), RZ/G3E SoCs.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v2->v3:
>  - Manipulate mux-controller as an internal node.

Why is it a child node, rather than just putting the cell in the parent
reset node?

>  - Improved commit body.
>=20
> v1->v2:
>  - New patch
>=20
>  .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2ph=
y-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2ph=
y-reset.yaml
> index c1b800a10b53..03da74ff2d08 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset=
=2Eyaml
> @@ -37,6 +37,12 @@ properties:
>    '#reset-cells':
>      const: 0
> =20
> +  mux-controller:
> +    $ref: /schemas/mux/mux-controller.yaml#
> +    description: Mux controller for USB VBUS source selection.
> +    type: object
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> @@ -44,6 +50,7 @@ required:
>    - resets
>    - power-domains
>    - '#reset-cells'
> +  - mux-controller
> =20
>  additionalProperties: false
> =20
> @@ -58,4 +65,8 @@ examples:
>          resets =3D <&cpg 0xaf>;
>          power-domains =3D <&cpg>;
>          #reset-cells =3D <0>;
> +
> +        mux-controller {
> +          #mux-state-cells =3D <1>;
> +        };
>      };
> --=20
> 2.43.0
>=20

--GT7BDuKQnZgPdsmF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRI1XwAKCRB4tDGHoIJi
0jXmAP4n8RG7YkgvdZEpvYgVEeHXPR/DEvUBIKbVbRYcDr7U2QEAjMx9z7JhWZxr
9bdX7GIsYG0o5CLLuMge8tFJCnC2HQE=
=x5t9
-----END PGP SIGNATURE-----

--GT7BDuKQnZgPdsmF--

