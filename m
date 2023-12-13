Return-Path: <linux-renesas-soc+bounces-996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5676811799
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 16:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A013A285FDF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 15:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD5D35EF7;
	Wed, 13 Dec 2023 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkYwO/fj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8763172D;
	Wed, 13 Dec 2023 15:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39377C433C8;
	Wed, 13 Dec 2023 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481586;
	bh=d7g/An6tj1meavK9KfeQnpMkp+2FDg23+65lC9a5QiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkYwO/fjoLD2gAZ2b3rLdvfKUYBIUfIj0u7GtXIEpv9XnMn/eeS09zwJH73Qc+vd0
	 ZnrhcnsBekydmjRl67nJ8Yi0w69hKYTJlrd5WSUmCWw68ELifwovjCrXCpYk0c8U04
	 xgLXYkjm1UzJjA9btEyrnq22OBEi2Mr4Qc7V4FgZUzdtAuA7XpzOH7Ia8uiGC2l/eH
	 QJT8nEkg8Aj1rWg5w7LI4onIlYBeBOgQUS+vcNc7qlj7s83jCmIrZ88U9Snp0nZ7d3
	 nu/NxI8zjYEN1IL/aA/2cI4dLkdg9FYwFXevnOvJKgJZu5HaAZBEPTii5XaJg7Mt9g
	 5dlxyInpwqBKw==
Date: Wed, 13 Dec 2023 15:32:54 +0000
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
Subject: Re: [PATCH v5 07/16] RISC-V: Move T-Head PMU to CPU feature
 alternative framework
Message-ID: <20231213-embattled-makeshift-914c2dc0d678@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-8-peterlin@andestech.com>
 <20231213-prewar-poison-f2781b4a6e84@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SNv4aXwN7leT+bpI"
Content-Disposition: inline
In-Reply-To: <20231213-prewar-poison-f2781b4a6e84@spud>


--SNv4aXwN7leT+bpI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:27:25PM +0000, Conor Dooley wrote:
> On Wed, Dec 13, 2023 at 03:02:52PM +0800, Yu Chien Peter Lin wrote:
> > The custom PMU extension aims to support perf event sampling prior
> > to the ratification of Sscofpmf. Instead of diverting the bits and
> > register reserved for future standard, a set of custom registers is
> > added.  Hence, we may consider it as a CPU feature rather than an
> > erratum.
> >=20
> > T-Head cores need to append "xtheadpmu" to the riscv,isa-extensions
> > for each cpu node in device tree, and enable CONFIG_THEAD_CUSTOM_PMU
> > for proper functioning as of this commit.
> >=20
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > Reviewed-by: Guo Ren <guoren@kernel.org>
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I think it is also worth mentioning that the only SoC, to my knowledge,
that works with a mainline kernel, and supports the SBI PMU is the D1,
and only recently has the OpenSBI port for the SoC been fixed to
actually work correctly, and that has apparently not yet made it to
a release of OpenSBI, making the "damage" caused by requiring a DT
property for PMU support not all that bad since the firmware needs to be
changed anyway.

Thanks for your work on this,
Conor.

--SNv4aXwN7leT+bpI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnOpgAKCRB4tDGHoIJi
0vFSAP4vVxuYhNOszazQh5QRosrPv3AJ+es7VDyK7fJJn7PemAEA00lcLHa8pVPg
zVv6tom5ELmLTpytrjK7gWjeiOgWggI=
=DW10
-----END PGP SIGNATURE-----

--SNv4aXwN7leT+bpI--

