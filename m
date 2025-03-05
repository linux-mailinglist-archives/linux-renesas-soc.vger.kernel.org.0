Return-Path: <linux-renesas-soc+bounces-14018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18584A504D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 17:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87E0B16639C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 16:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7081922C4;
	Wed,  5 Mar 2025 16:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8cpBsyK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F337518CBEC;
	Wed,  5 Mar 2025 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192016; cv=none; b=X8KAHrKhZCCu8QmbL5XEHj7giGmIW64MO6CjBjQD+uFKKwRq/YqnH1MiYNxx/EAoOlxRCuH8Z2UnQObcMMbDWw1baICB14sdvmdtdYKTssJC2cfJri9QpyosTV2vAoKcfm0xdARsRdN5pxTzBTWzvxyZP+R9uEfRuFlLYpATZPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192016; c=relaxed/simple;
	bh=P7WBpNfMWlkeZYLPtMXBm6r4j5jCxaC3zCPq/3d6pBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vg0eQIxPOQwdnAmEY3rS4bv6RyeQ5QJ81MpqHCydD0Vr4vPMnV2mFNz0Fa9MwOVcG0w9kcej5q/bxEtHeFzXW72FsgiUFHXeguRXsU0YVeOxLxqDo0pJc1HhWEtbjqjcbRoZoM9uDuh/InJk1fkrkkqwGJM4H59rJvWDTklegIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o8cpBsyK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8094C4CED1;
	Wed,  5 Mar 2025 16:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741192015;
	bh=P7WBpNfMWlkeZYLPtMXBm6r4j5jCxaC3zCPq/3d6pBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8cpBsyKq0KWzty8WIz0ZECACHDD0hJZNy6ivB3XuBrSfrbv7XRJX5DnqvxpF/QVM
	 9c9KRqhoO9nnx307sdv+2o4gXrBtSGi2ccKSt2P10446LpEyCEvX9Ag2DWNYO9+Bke
	 +ZkriwCOfQ9Iboj8hd1ppr4i1KyZ71CtE4Ry4Nypg2TTPe/wsILjTj3wu1LpTUtNz9
	 d/MZiFmzSbO1Ybq9Q/ScRcx4G4s0bcsGL4w49b0qAjgxFkDo3XILbC/4PNrG0knFUJ
	 XOSEb3zMX8M3JrMphwJK6kVJEBKq+9n/2z59Z/Wve4e1YaKuSlHB884AWDCZ1I9a6k
	 0y/EzFzqvXgvA==
Date: Wed, 5 Mar 2025 16:26:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY
 Control
Message-ID: <20250305-cesspool-headlock-4d28a2a1333e@spud>
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305123915.341589-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NLNEO0YrE4Ah9DUx"
Content-Disposition: inline
In-Reply-To: <20250305123915.341589-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--NLNEO0YrE4Ah9DUx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 12:39:13PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add device tree binding document for the Renesas RZ/V2H(P) USB2PHY Control
> Device. It mainly controls reset and power down of the USB2.0 PHY (for
> both host and function).
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../reset/renesas,rzv2h-usb2phy-ctrl.yaml     | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h=
-usb2phy-ctrl.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2ph=
y-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy=
-ctrl.yaml
> new file mode 100644
> index 000000000000..ed156a1d3eb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.=
yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-ctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) USB2PHY Control
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +description:
> +  The RZ/V2H(P) USB2PHY Control mainly controls reset and power down of =
the
> +  USB2.0 PHY.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g057-usb2phy-ctrl  # RZ/V2H(P)
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - power-domains
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> +
> +    usbphy-ctrl@15830000 {

How come your nodename isn't "reset-controller"?
Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +        compatible =3D "renesas,r9a09g057-usb2phy-ctrl";
> +        reg =3D <0x15830000 0x10000>;
> +        clocks =3D <&cpg CPG_MOD 0xb6>;
> +        resets =3D <&cpg 0xaf>;
> +        power-domains =3D <&cpg>;
> +        #reset-cells =3D <0>;
> +    };
> --=20
> 2.43.0
>=20

--NLNEO0YrE4Ah9DUx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8h7SgAKCRB4tDGHoIJi
0pjxAQCCM+leBdMKpufCfk6z+36Rw9aGaaFu6WHxaQTUt/L7pgEA7gE3pIUyynXQ
pzmBA0RbkLKXinQRSP/AMvk6kDFlRQg=
=bDXW
-----END PGP SIGNATURE-----

--NLNEO0YrE4Ah9DUx--

