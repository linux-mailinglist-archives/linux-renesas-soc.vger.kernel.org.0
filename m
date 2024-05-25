Return-Path: <linux-renesas-soc+bounces-5478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA5F8CEFEA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 May 2024 17:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E32928171C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 May 2024 15:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4034B5821A;
	Sat, 25 May 2024 15:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTzyfmWB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFD01877;
	Sat, 25 May 2024 15:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716652225; cv=none; b=ojHzVmbVuodR1npw+89Opss2oKfNz9CFqTjUeeVubT6lJibaWJrxjWV36Z1gcP1MW1RmvwZ7o01jGQ3iLhbuU59Yw35JbdZidcnu/yafDqmsTnee2bk2wmn+GIEZ3siCJM5NjVjrlgbkPNQIuGvg0kPMaxxTI2GW0pwwfoZjPo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716652225; c=relaxed/simple;
	bh=vEFLHVjNtQlgF5brmdGsKTnFnwRA9guZrFAtVbbZVcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqvvDPs0e/o32SdC6CGtrQQNKRPi5OFYs9L7/k++1IxDraqBuZTnL9vZ3IokJtCVt9u3P/9PX9HR66jXHTK+F46rgHxVTrq4C32q7ac9fQSzQIXNBojkwLXR0ykS8Quebzj1XuosA0j4dmWvJ4VZB731i9vDYwCeS3H5jywnzlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTzyfmWB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79266C2BD11;
	Sat, 25 May 2024 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716652224;
	bh=vEFLHVjNtQlgF5brmdGsKTnFnwRA9guZrFAtVbbZVcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTzyfmWBMdY17vX/jDE7j0qh0ahmwEg7XjmbIdNxPJBaPYAxnuaOm2kutm8DNhOEq
	 IgrR6hQChy6k4M3B2v9OYp/7BmUAszrTYFSsX/b6e0G6sKxIy012I7usOlfQex5QFl
	 z2hTwFJq3D2P43Qu+aAaoDRm3uZVdBKN6FnAMdzIXVFlELfCTpv7FM/X7sxAkyhP0d
	 VlI56sJc6aLtLDpmhmYpHu3vECznM3oOlh46CSmH2kkEGJR4AzEiYaEo6t8zaFpbzt
	 jFEou3RLL81bc31bBDvK7ZXPjr7lOlPS2TdpMUGB1a/uVJsnFqUW/2jrP+cIXmHOFk
	 EseoNK09Xi7+Q==
Date: Sat, 25 May 2024 16:50:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas: Document RZ/V2H(P) SoC
 CPG driver
Message-ID: <20240525-filling-revolving-307de19dd4c5@spud>
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YrfRGz1H/vfng7dJ"
Content-Disposition: inline
In-Reply-To: <20240524082800.333991-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--YrfRGz1H/vfng7dJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 09:27:57AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document the device tree bindings of the Renesas RZ/V2H(P) SoC
> Clock Pulse Generator (CPG).
>=20
> CPG block handles the below operations:
> - Handles the generation and control of clock signals for the IP modules
> - The generation and control of resets
> - Control over booting
> - Low power consumption and the power supply domains
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/clock/renesas,rzv2h-cpg.yaml     | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzv2h=
-cpg.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.ya=
ml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> new file mode 100644
> index 000000000000..baa0f2a5b6f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) Clock Pulse Generator (CPG)
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +description: |
> +  On Renesas RZ/V2H(P) SoC's, the CPG (Clock Pulse Generator) handles th=
e generation
> +  and control of clock signals for the IP modules, the generation and co=
ntrol of resets,
> +  and control over booting, low power consumption and the power supply d=
omains.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g057-cpg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description:
> +      Clock source to CPG can be either from external clock input (EXCLK=
) or
> +      crystal oscillator (XIN/XOUT).

I think this description should be in clocks, not clock names.

> +    const: extal
> +
> +  '#clock-cells':
> +    description: |
> +      - For CPG core clocks, the two clock specifier cells must be "CPG_=
CORE"
> +        and a core clock reference, as defined in
> +        <dt-bindings/clock/r9a09g057-cpg.h>,
> +      - For module clocks, the two clock specifier cells must be "CPG_MO=
D" and
> +        a module number, as defined in <dt-bindings/clock/r9a09g057-cpg.=
h>.

Can you please explain the difference and why it matters? Why isn't the
unique number for a given clock sufficient?

Thanks,
Conor.

> +    const: 2
> +
> +  '#power-domain-cells':
> +    description:
> +      SoC devices that are part of the CPG/Module Standby Mode Clock Dom=
ain and
> +      can be power-managed through Module Standby should refer to the CP=
G device
> +      node in their "power-domains" property, as documented by the gener=
ic PM
> +      Domain bindings in Documentation/devicetree/bindings/power/power-d=
omain.yaml.
> +      The power domain specifiers defined in <dt-bindings/clock/r9a09g05=
7-cpg.h> could
> +      be used to reference individual CPG power domains.
> +
> +  '#reset-cells':
> +    description:
> +      The single reset specifier cell must be the module number, as defi=
ned in
> +      <dt-bindings/clock/r9a09g057-cpg.h>.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#power-domain-cells'
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cpg: clock-controller@10420000 {
> +            compatible =3D "renesas,r9a09g057-cpg";
> +            reg =3D <0x10420000 0x10000>;
> +            clocks =3D <&extal_clk>;
> +            clock-names =3D "extal";
> +            #clock-cells =3D <2>;
> +            #power-domain-cells =3D <0>;
> +            #reset-cells =3D <1>;
> +    };
> --=20
> 2.34.1
>=20

--YrfRGz1H/vfng7dJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlIIuwAKCRB4tDGHoIJi
0n4GAQD921aZa5FY8XO8s+yulU416c2y8te4wVBJ03h/gT9KGQD+ICZ0JYB74irE
Twf060MsdzypmYOhBIigNoztmynchAA=
=OxST
-----END PGP SIGNATURE-----

--YrfRGz1H/vfng7dJ--

