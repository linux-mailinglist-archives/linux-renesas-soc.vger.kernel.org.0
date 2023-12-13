Return-Path: <linux-renesas-soc+bounces-990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E941981161C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 16:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 729FE281B94
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 15:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B7030FA2;
	Wed, 13 Dec 2023 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUOYHFHI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764FC9468;
	Wed, 13 Dec 2023 15:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E72DC433C8;
	Wed, 13 Dec 2023 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481024;
	bh=EFRc6UVTwIWenNtxGxnM8RzMypWh/l2lfE9FSSBCHws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUOYHFHIjy03kSSFNFMEdc2Djz773PL8oreL5RyNIuYOHDRkJuFvdw8mg1DB1urzk
	 olaPsMkRQJ38qKNEBZk3H5Nn/KZdRhloMDP7ejcvz9GJnYjmNaOejGWC4z6J/+kroN
	 qUo51gHGDFKlPcaS1yljqVA/n0OhA0ammjI6es/zfSEKpDYCy3Yw/vAjatGVIhJHzv
	 m5Gu3JMAjsxxxyP+Vq8xmO5QQl3HfRRGDBsd4XnBMuP+6qBNuyAiBbbjdrH5okn6OQ
	 YIVpVask+OOTPMuXjwskwXHiugCKSVTAwtRu945HyoCGJ16Vgv0RG/5BxwKN/OfADF
	 3gFfNW0BRsdRg==
Date: Wed, 13 Dec 2023 15:23:32 +0000
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
Subject: Re: [PATCH v5 12/16] riscv: dts: sophgo: Add T-Head PMU extension
 for cv1800b
Message-ID: <20231213-creatable-skintight-be6749ec63e5@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-13-peterlin@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jn6e/Uvtr8zl2RKI"
Content-Disposition: inline
In-Reply-To: <20231213070301.1684751-13-peterlin@andestech.com>


--Jn6e/Uvtr8zl2RKI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:02:57PM +0800, Yu Chien Peter Lin wrote:
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
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dt=
s/sophgo/cv1800b.dtsi
> index aec6401a467b..8c0143f0a01b 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -29,7 +29,7 @@ cpu0: cpu@0 {
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadpmu";
> =20
>  			cpu0_intc: interrupt-controller {
>  				compatible =3D "riscv,cpu-intc";
> --=20
> 2.34.1
>=20

--Jn6e/Uvtr8zl2RKI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnMXwAKCRB4tDGHoIJi
0nfMAQD+JdQJ/3wj3stiTH2LRo8GYWgrPUpFyuVFHlior4g4aQD/bEX0chKiIaFn
EaPiDpwt8shNTKdrqX6XtyHtp/yDoQg=
=NpnV
-----END PGP SIGNATURE-----

--Jn6e/Uvtr8zl2RKI--

