Return-Path: <linux-renesas-soc+bounces-242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAC87F7739
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 16:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB81CB21091
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 15:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4AE2E630;
	Fri, 24 Nov 2023 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uaoFZYrB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2892D7B5;
	Fri, 24 Nov 2023 15:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7D9C43395;
	Fri, 24 Nov 2023 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700838357;
	bh=W6AcqzGG834X7Fnc1UesSToakM1vJZCmLFY+BobYw5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uaoFZYrBiO3kZphuGBjihIKIKUCMOApnXvYR1zIFol9BJfuQ28O9efIrmvj1Za6xd
	 quIZitQbBWw78wUv4dr5ZBdM1Pje08v9/aB/8V1Zo/vGxwLXCffJvfPF5rYQl//gam
	 aGhwDvxGAHY5LeSGttX3wCaWMipeJw6Ic/4qTHiSWl9csFx95vPcmItREKo1sIG+gA
	 nxcaIJHRPj37fGKOWCYJTWo9w+M/75RLhPgY6VOXE4VwnhYZH0U/D/XwaWfc0ItpzY
	 qJg3IjdIlPczQ0fd24mFKl6lqGX2T211GbkYIVM8OSOV1T0aENh3kvVjX6jYo6FQ5e
	 XmuGmH5A1SJlg==
Date: Fri, 24 Nov 2023 15:05:46 +0000
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, acme@kernel.org,
	adrian.hunter@intel.com, ajones@ventanamicro.com,
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
Subject: Re: [PATCH v4 04/13] dt-bindings: riscv: Add Andes interrupt
 controller compatible string
Message-ID: <20231124-nemesis-vanity-a92814b5c3a3@spud>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-5-peterlin@andestech.com>
 <CA+V-a8t+vgrwDe9OxqMNHdcVX+qq76DuskF0ETCri4VeP-FAbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cF2+7KTXsnpo6E+a"
Content-Disposition: inline
In-Reply-To: <CA+V-a8t+vgrwDe9OxqMNHdcVX+qq76DuskF0ETCri4VeP-FAbg@mail.gmail.com>


--cF2+7KTXsnpo6E+a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 03:03:51PM +0000, Lad, Prabhakar wrote:
> On Wed, Nov 22, 2023 at 12:18=E2=80=AFPM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > Add "andestech,cpu-intc" compatible string to indicate that
> > Andes specific local interrupt is supported on the core,
> > e.g. AX45MP cores have 3 types of non-standard local interrupt
> > can be handled in supervisor mode:
> >
> > - Slave port ECC error interrupt
> > - Bus write transaction error interrupt
> > - Performance monitor overflow interrupt
> >
> > These interrupts are enabled/disabled via a custom register
> > SLIE instead of the standard interrupt enable register SIE.
> >
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> > Changes v1 -> v2:
> >   - New patch
> > Changes v2 -> v3:
> >   - Updated commit message
> >   - Fixed possible compatibles for Andes INTC
> > Changes v3 -> v4:
> >   - Add const entry instead of enum (Suggested by Conor)
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Docume=
ntation/devicetree/bindings/riscv/cpus.yaml
> > index f392e367d673..50307554478f 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -100,7 +100,11 @@ properties:
> >          const: 1
> >
> >        compatible:
> > -        const: riscv,cpu-intc
> > +        oneOf:
> > +          - items:
> > +              - const: andestech,cpu-intc
> given that the first patch renames andestech -> andes, do you want to
> follow the same here?

No, that's their vendor prefix, they're stuck with it.

--cF2+7KTXsnpo6E+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWC7ygAKCRB4tDGHoIJi
0skKAQDHe25no3r1QiuhIMPJ/3Knjbs0n62oqRjWcYDWRV8dMAEA1nbRbhQHzGem
C4VGWHQ58F49vu2OigDkep60E3k4tQs=
=9K1r
-----END PGP SIGNATURE-----

--cF2+7KTXsnpo6E+a--

