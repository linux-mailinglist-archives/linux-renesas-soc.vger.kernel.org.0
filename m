Return-Path: <linux-renesas-soc+bounces-991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D6F811633
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 16:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 266FF1F21894
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 15:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA6131758;
	Wed, 13 Dec 2023 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVPC/6+X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6259D31750;
	Wed, 13 Dec 2023 15:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03851C433C9;
	Wed, 13 Dec 2023 15:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481049;
	bh=B5L29gqlycO+tPIZOgKNoV72HJ6XozjWlal3rU7LPKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lVPC/6+XKyyz0tIrqIutuGinsKshmtQX9K9wxTkm3sC1+rQIPyzaW5Cjv4jVXGnH9
	 lG0FrO6RJ7FNRNrF4ho41HaV4bgCsb5fi+Puj4KSFCVE41SB2TrIl48EH8pi6l213Z
	 oIIgM0F4YQIBnV2z+ONV5tSR4gXdYrVOgx6x88N5/gFRZ1RJP4clRZLd0+5raV1c3E
	 mWb7cHLKOtcBgcNNfl6GEtn3PundzviEcUBUwS6Pmh5O1G6icpeA6vK0Thcjaa2M1S
	 0lEoeSN+0+1GxrD0xPR2nM3K7KBwiAZFC9IgQfaEKATuKipcEHnT7bPZtlgGkazYTi
	 1dZYUH51ac3Kg==
Date: Wed, 13 Dec 2023 15:23:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajones@ventanamicro.com,
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
	conor+dt@kernel.org, conor.dooley@microchip.com,
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com,
	geert+renesas@glider.be, guoren@kernel.org, heiko@sntech.de,
	irogers@google.com, jernej.skrabec@gmail.com, jolsa@kernel.org,
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	locus84@andestech.com, magnus.damm@gmail.com, mark.rutland@arm.com,
	mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, peterz@infradead.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org,
	robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com,
	tglx@linutronix.de, tim609@andestech.com, uwu@icenowy.me,
	wens@csie.org, will@kernel.org, ycliang@andestech.com,
	inochiama@outlook.com
Subject: Re: [PATCH v5 14/16] riscv: dts: thead: Add T-Head PMU extension for
 th1520
Message-ID: <20231213-placate-flashily-fa1032e5fbbe@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-15-peterlin@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5R35S9X3begUNP/4"
Content-Disposition: inline
In-Reply-To: <20231213070301.1684751-15-peterlin@andestech.com>


--5R35S9X3begUNP/4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:02:59PM +0800, Yu Chien Peter Lin wrote:
> xtheadpmu stands for T-Head Performance Monitor Unit extension.
> Based on the added T-Head PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
> Changes v4 -> v5:
>   - New patch
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/=
thead/th1520.dtsi
> index ba4d2c673ac8..2dad2b22824a 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -22,7 +22,7 @@ c910_0: cpu@0 {
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadpmu";
>  			reg =3D <0>;
>  			i-cache-block-size =3D <64>;
>  			i-cache-size =3D <65536>;
> @@ -46,7 +46,7 @@ c910_1: cpu@1 {
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadpmu";
>  			reg =3D <1>;
>  			i-cache-block-size =3D <64>;
>  			i-cache-size =3D <65536>;
> @@ -70,7 +70,7 @@ c910_2: cpu@2 {
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadpmu";
>  			reg =3D <2>;
>  			i-cache-block-size =3D <64>;
>  			i-cache-size =3D <65536>;
> @@ -94,7 +94,7 @@ c910_3: cpu@3 {
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadpmu";
>  			reg =3D <3>;
>  			i-cache-block-size =3D <64>;
>  			i-cache-size =3D <65536>;
> --=20
> 2.34.1
>=20

--5R35S9X3begUNP/4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnMjgAKCRB4tDGHoIJi
0v2NAP4zNu9pr4WPo9WN/ELqPU2GWRrlI7mWHne1++rLjDRSLwD8Da4c43TnGhZq
l90y1Ur6ue8V2btuBqhGss/ahqCyhQs=
=CibF
-----END PGP SIGNATURE-----

--5R35S9X3begUNP/4--

