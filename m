Return-Path: <linux-renesas-soc+bounces-994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5CA811730
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 16:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D5221F21BAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 15:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273DD7E567;
	Wed, 13 Dec 2023 15:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gb6BH7D+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29A57E55F;
	Wed, 13 Dec 2023 15:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA69C433CB;
	Wed, 13 Dec 2023 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481199;
	bh=5LrrEvMyyj0fWb6NPjVbblFGe/sJuNAe4eX2ZyX7Kt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gb6BH7D+aYS61woucg5hbgnpKCFH2JrZe9F7CoamrCJlrRo+15C86NHi2e7T9MoI0
	 voFaVtvfZv/m36LPNfwBTmuS+fzS/AZgBTL6y1G5uJKdzX+82fqYVPsguuz4WpGlfR
	 1duPZzQ84PZHAjZJENwupiAANqkRbYlKDP8/kc4RZLH/+/VSSctEpbwMMA6dixOzmD
	 sDUCEhLqqa6Mke47Dab95s7KYkO0rDF5YbInpc//M4u5vOhFqp/NY6TRGcO2+52gFm
	 YH/2i10BIfOinYtmJuflXh8fQo2clkel8PHqG9azTs1GexOFYGdkEgJXJ3+1y3LPLm
	 glD3qCYeHihAw==
Date: Wed, 13 Dec 2023 15:26:28 +0000
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
Subject: Re: [PATCH v5 09/16] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <20231213-romp-squeegee-0cdb44aff415@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-10-peterlin@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7g0vcE0ZONFlAzn3"
Content-Disposition: inline
In-Reply-To: <20231213070301.1684751-10-peterlin@andestech.com>


--7g0vcE0ZONFlAzn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:02:54PM +0800, Yu Chien Peter Lin wrote:
> Document the ISA string for T-Head performance monitor extension
> which provides counter overflow interrupt mechanism.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Inochi Amaoto <inochiama@outlook.com>
> ---
> Changes v2 -> v3:
>   - New patch
> Changes v3 -> v4:
>   - No change
> Changes v4 -> v5:
>   - Include Guo's Reviewed-by
>   - Include Inochi's Reviewed-by
>   - Update to C910 documentation with its commit hash
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index c91ab0e46648..b5cb8ac7ac80 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -258,5 +258,11 @@ properties:
>              in commit 2e5236 ("Ztso is now ratified.") of the
>              riscv-isa-manual.
> =20
> +        - const: xtheadpmu
> +          description:
> +            The T-Head performance monitor extension for counter overflo=
w, as ratified

I'm not sure that "ratified" here is the right word, probably
"documented" is better, but I don't think that is worth a resend.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +            in commit 4c4981 ("Initial commit") of Xuantie C910 user man=
ual.
> +            https://github.com/T-head-Semi/openc910/tree/main/doc
> +
>  additionalProperties: true
>  ...
> --=20
> 2.34.1
>=20

--7g0vcE0ZONFlAzn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnNJAAKCRB4tDGHoIJi
0rGDAQD3aa1sgvZcl2UuyEAdv8hNrEY8UAeOmq4VVREsig79WAEAp7psoeCxBWLM
X4adVORVHKHi9jWmb2mdq7PBBO0wmwE=
=8PPM
-----END PGP SIGNATURE-----

--7g0vcE0ZONFlAzn3--

