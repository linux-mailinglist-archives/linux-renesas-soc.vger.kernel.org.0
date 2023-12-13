Return-Path: <linux-renesas-soc+bounces-995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8D9811779
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 16:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C25FF285BD3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 15:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954968536B;
	Wed, 13 Dec 2023 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pB1wmD1H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F00E85359;
	Wed, 13 Dec 2023 15:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF6CC433C7;
	Wed, 13 Dec 2023 15:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481256;
	bh=GwC9beP1ZtHS6nJCGyO7jEKsu1mwjiMJgVNMTsy1Ks0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pB1wmD1H5k4eUMa3eMWOpaiXH2CEzZbEGWVtAw8BWDZslmG4E31qLvtQ+Aj9fAgaN
	 Em8i13DUbC/Y5UiOVi8WMmEHynRSF6uKag1V0bVdlB1c4em9HW4rPtnqmt8W0UaGu1
	 rGFLFLK/BDA4PGAxkH9ZDy32YKiRy6b8adWSXZeYofHoXYylvDiEEnXu7w9cDf4r/r
	 Rsq6ZvDWbV+KmsTgI4SQrsDHQo0vqvDyrP067y19dWebJEacztjqjFxLPfBKJaRylL
	 wuWOpmsNLO78Tg2rWtZfGB003DrP9+6xTmdwC5O2Nj9OT5qX897/VEogfhdLgMRB5d
	 ol3p8E8sQOW6A==
Date: Wed, 13 Dec 2023 15:27:25 +0000
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
Message-ID: <20231213-prewar-poison-f2781b4a6e84@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-8-peterlin@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6EDO+odeQnJiNPoS"
Content-Disposition: inline
In-Reply-To: <20231213070301.1684751-8-peterlin@andestech.com>


--6EDO+odeQnJiNPoS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:02:52PM +0800, Yu Chien Peter Lin wrote:
> The custom PMU extension aims to support perf event sampling prior
> to the ratification of Sscofpmf. Instead of diverting the bits and
> register reserved for future standard, a set of custom registers is
> added.  Hence, we may consider it as a CPU feature rather than an
> erratum.
>=20
> T-Head cores need to append "xtheadpmu" to the riscv,isa-extensions
> for each cpu node in device tree, and enable CONFIG_THEAD_CUSTOM_PMU
> for proper functioning as of this commit.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--6EDO+odeQnJiNPoS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnNXQAKCRB4tDGHoIJi
0owVAQCDfvO17i3JMSLu4ZZtfXLzMJWq4FB1/1qravLNyzJJvgEAi3b0Zqg0JhQ4
v8v858Iyqz0gSua8loF9qO9ppCpUpgQ=
=cK86
-----END PGP SIGNATURE-----

--6EDO+odeQnJiNPoS--

