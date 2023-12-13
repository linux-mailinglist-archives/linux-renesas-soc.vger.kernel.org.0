Return-Path: <linux-renesas-soc+bounces-992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA3811694
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 16:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B27DF1F20FF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 15:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF69487B5;
	Wed, 13 Dec 2023 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbVMXI1Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C7A3A8CF;
	Wed, 13 Dec 2023 15:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C5EC433C7;
	Wed, 13 Dec 2023 15:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481076;
	bh=34+Ib4YFyZmhdk4OinGdvnrlMwYrXexKV9Hm36OaH5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lbVMXI1QdImCKCnxDnc0Lcmg1UQx/Ebc/1WfRY7aP22xJ9CQqvAU/p0vLVIK2oazI
	 +Nvx5UUNTQD/u6Zc39LWmbWeVeXI0lbNrM9gaZNiDVspkktzrpm6r7V+E1P4gxNRKA
	 QCbOKlO7o0cCJz5GJ2rR+piofMGHy/U09GjH9T+teywtW6IBF4MPfXo2k4LaDZyXLK
	 sBxeEi0kwaEDgtMLm9nIyEn8y86cV9cokmRcAilGQ4Psin99aXIKfphklULADpIHl8
	 Id2KzVq14cQH60JxHyXVIveRWNY58GVraISLyvPkVHhgDCEp9dvoygNJD8ej29I1UK
	 RO+1ozDPDjj9A==
Date: Wed, 13 Dec 2023 15:24:25 +0000
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
Subject: Re: [PATCH v5 13/16] riscv: dts: sophgo: Add T-Head PMU extension
 for sg2042
Message-ID: <20231213-maturely-freezing-07edd52717d9@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-14-peterlin@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0Rcnxco1nl347ZKK"
Content-Disposition: inline
In-Reply-To: <20231213070301.1684751-14-peterlin@andestech.com>


--0Rcnxco1nl347ZKK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:02:58PM +0800, Yu Chien Peter Lin wrote:
> xtheadpmu stands for T-Head Performance Monitor Unit extension.
> Based on the added T-Head PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


--0Rcnxco1nl347ZKK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnMqAAKCRB4tDGHoIJi
0qyQAP9X4Da6uFGwYd7MFmvCTiSfe1B6LzKyCFwLDqOUywJ6EQEAp9f/B1dFBqB1
ueKxuTYAXyXZJ6C9gMiRZQAQv5ecrwY=
=EGtr
-----END PGP SIGNATURE-----

--0Rcnxco1nl347ZKK--

