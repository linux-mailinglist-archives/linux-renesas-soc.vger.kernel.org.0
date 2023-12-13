Return-Path: <linux-renesas-soc+bounces-993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4548116CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 16:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67BB91F20984
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 15:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1610658103;
	Wed, 13 Dec 2023 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhEL5Jr+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E100A30FA2;
	Wed, 13 Dec 2023 15:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE5DC433C7;
	Wed, 13 Dec 2023 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481109;
	bh=k3475fUWjt6cqtLAtUFoDPFZz/q8UFyFG6t5hNV1fdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IhEL5Jr+r1wwkykwxdY9oQmsfodd9RscQA12rUVSylaaZzmWiWpnlGhVa+sp+3r7b
	 v98l3JDxaUBwRrSzu+mVf2fO350PgvFHe6HkXQltyVGpjer10RytkbZiEdJ1J46xxB
	 Rwnd4MPP43z9LtQY4FzMMoqGpyvLzymWkT+GZhRXDFwftlnk0o61XcKDpTOJ4c3VFV
	 WJek1HcyaFQE9cN2hOQhehvJFy7ICm8oKjfbFVNg9P51rjkPVfb0+1FG4ftPbraIGI
	 h+9bCQ4O85y3TPmEFTZdDXAyKrldhroD8lPJl7ea9llzgrX9j0sI3kcrN2TuQrnLCe
	 RPgdAjfZ6EasQ==
Date: Wed, 13 Dec 2023 15:24:57 +0000
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
Subject: Re: [PATCH v5 15/16] riscv: dts: renesas: Add Andes PMU extension
 for r9a07g043f
Message-ID: <20231213-porous-panic-015409053e1d@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-16-peterlin@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CdyUBDMnoeaw9TCE"
Content-Disposition: inline
In-Reply-To: <20231213070301.1684751-16-peterlin@andestech.com>


--CdyUBDMnoeaw9TCE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:03:00PM +0800, Yu Chien Peter Lin wrote:
> xandespmu stands for Andes Performance Monitor Unit extension.
> Based on the added Andes PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--CdyUBDMnoeaw9TCE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnMyQAKCRB4tDGHoIJi
0iyVAQCorZx0jwXEAp2RWyzoTrHFg9KDdgLQHzCY1iV7IeT9DgD/SalZhcE47FKy
2wTkZDKDhXwkKbx9fAYA++KOZn1smA8=
=pQrz
-----END PGP SIGNATURE-----

--CdyUBDMnoeaw9TCE--

