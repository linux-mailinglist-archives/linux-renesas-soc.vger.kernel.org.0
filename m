Return-Path: <linux-renesas-soc+bounces-1585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6868E82DD1B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 17:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D9CF1C2148F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 16:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FD6179AE;
	Mon, 15 Jan 2024 16:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKBw81Ha"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B933179A8;
	Mon, 15 Jan 2024 16:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFDBC433F1;
	Mon, 15 Jan 2024 16:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705335202;
	bh=/Udn5btmcKZ81o6zntRILY52O0+BbAVgkogRfVpdH4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKBw81HaIt5FUW+hc+ycf5KpoKe8QoQ7Kb2NrDW1ifiq8W7ZlKuq3kLYM5/hUI2HD
	 QDSYQbVnIX1AHeVN3fKmYo9PjG4PyRgs4Oy69kdL6Gd0tCt83/DKXznku8x6mSZBNk
	 XWQxtZo23C6bSdKZtZ7Ldr3nM02leyFg2fjoya8XqzdUJWF2W/Ozmk0jIYT53+22X+
	 rbo3EXnhm49IZtTFsGFZaQwXUSn8tZUIWXT0sK8ZzDxRtaHQWI0j4bVVmMw5tMPjP8
	 hWRah2Q2fD0pxh+ygsdq2KXgdn0db/XLqDcZE/eIl8UKmvaU2NRk4HjkiK92WVUDvi
	 966h4QAwEpCZQ==
Date: Mon, 15 Jan 2024 16:13:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: renesas,tmu: Document input capture
 interrupt
Message-ID: <20240115-wages-secluded-b44f4eb13323@spud>
References: <fb1e38c93e62221f94304edd980a2fb79c1f2995.1705325608.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D9JecHxJ6soLeUK4"
Content-Disposition: inline
In-Reply-To: <fb1e38c93e62221f94304edd980a2fb79c1f2995.1705325608.git.geert+renesas@glider.be>


--D9JecHxJ6soLeUK4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 02:45:39PM +0100, Geert Uytterhoeven wrote:
> Some Timer Unit (TMU) instances with 3 channels support a fourth
> interrupt: an input capture interrupt for the third channel.
>=20
> While at it, document the meaning of the four interrupts, and add
> "interrupt-names" for clarity.
>=20
> Update the example to match reality.
>=20
> Inspired by a patch by Yoshinori Sato for SH.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> The corresponding DTS updates can be found in series "[PATCH 0/2]
> ARM/arm64: dts: renesas: Improve TMU interrupt descriptions".
> https://lore.kernel.org/r/cover.1705325654.git.geert+renesas@glider.be
>=20
>  .../devicetree/bindings/timer/renesas,tmu.yaml | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/D=
ocumentation/devicetree/bindings/timer/renesas,tmu.yaml
> index a67e427a9e7e22aa..9a823224c144f7d4 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -46,7 +46,19 @@ properties:
> =20
>    interrupts:
>      minItems: 2
> -    maxItems: 3
> +    items:
> +      - description: Underflow interrupt 0
> +      - description: Underflow interrupt 1
> +      - description: Underflow interrupt 2
> +      - description: Input capture interrupt 2

Seeing "input capture interrupt 2" makes me wonder, are there two (or
more!) other input capture interrupts that are still out there,
undocumented, and looking for a home?

Cheers,
Conor.

> +
> +  interrupt-names:
> +    minItems: 2
> +    items:
> +      - const: tuni0
> +      - const: tuni1
> +      - const: tuni2
> +      - const: ticpi2
> =20
>    clocks:
>      maxItems: 1
> @@ -100,7 +112,9 @@ examples:
>              reg =3D <0xffd80000 0x30>;
>              interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
>                           <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +                         <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names =3D "tuni0", "tuni1", "tuni2", "ticpi2";
>              clocks =3D <&mstp0_clks R8A7779_CLK_TMU0>;
>              clock-names =3D "fck";
>              power-domains =3D <&sysc R8A7779_PD_ALWAYS_ON>;
> --=20
> 2.34.1
>=20
>=20

--D9JecHxJ6soLeUK4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaVZnAAKCRB4tDGHoIJi
0ncYAQDlET2wYW1oPcGLuPX5StJ7ZYz4oqIZmek/mCyzmqU+5QEA0LHWuV+uQl1L
tyDL9jR7lcURTHIY/U2kGi/3Pe8OGwA=
=4RIc
-----END PGP SIGNATURE-----

--D9JecHxJ6soLeUK4--

