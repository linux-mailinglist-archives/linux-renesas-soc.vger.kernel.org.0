Return-Path: <linux-renesas-soc+bounces-400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 737307FD6D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 13:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37D1E2835B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 12:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5C51774A;
	Wed, 29 Nov 2023 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjRhol3c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450801DFD8;
	Wed, 29 Nov 2023 12:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF62C433C7;
	Wed, 29 Nov 2023 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701261237;
	bh=rcKNM4SrzvOTPOMTTnNAkDwa6umDcm/Z1HWPpEbPqyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjRhol3cWY3zuGru3VVvU0O2nvIZ1iroKFgUGd5udxtr1+fOZwwjI4yf34DDZBv6e
	 3prqd/wUw5nFVikChUwzQVlOj3jKDgliaH6N/gbEFyGYqMRPILgkTeJgSOPo6go4Ru
	 QA0lsDQ1IkYy0myr5ssNkCMZE4Fye5x+f/6igxF5houf7db1oPc0rp0j7PyJpwicjP
	 dnGM+Ga37Jy74eyQgKrb/5PqccEYDaKnLbwudYSK4RJ+LSyr3qDaXHuk+396BqI0ae
	 ZJRjIlDqvg/ucpgMXN/p3WqucvWHyOw6mCXMInn8nuHvw2Wfvi4HdmHJxvZUsU5dII
	 SB0+fpQJHj75w==
Date: Wed, 29 Nov 2023 12:33:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, acme@kernel.org,
	adrian.hunter@intel.com, ajones@ventanamicro.com,
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	dminus@andestech.com, evan@rivosinc.com, geert+renesas@glider.be,
	guoren@kernel.org, heiko@sntech.de, irogers@google.com,
	jernej.skrabec@gmail.com, jolsa@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
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
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <20231129-curvature-stainable-bf77c735438f@spud>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-10-peterlin@andestech.com>
 <20231123-obscurity-copied-7a7bcc66d69d@wendy>
 <ZWb6qqaNzzNUJ7aX@APC323>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Utvw2SdgzW4fg31u"
Content-Disposition: inline
In-Reply-To: <ZWb6qqaNzzNUJ7aX@APC323>


--Utvw2SdgzW4fg31u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 04:47:38PM +0800, Yu-Chien Peter Lin wrote:
> Hi Conor,
>=20
> On Thu, Nov 23, 2023 at 02:48:20PM +0000, Conor Dooley wrote:
> > On Wed, Nov 22, 2023 at 08:12:31PM +0800, Yu Chien Peter Lin wrote:
> > > Document the ISA string for T-Head performance monitor extension
> > > which provides counter overflow interrupt mechanism.
> > >=20
> > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > ---
> > > Changes v2 -> v3:
> > >   - New patch
> > > Changes v3 -> v4:
> > >   - No change
> > > ---
> > >  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index c91ab0e46648..694efaea8fce 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -258,5 +258,11 @@ properties:
> > >              in commit 2e5236 ("Ztso is now ratified.") of the
> > >              riscv-isa-manual.
> > > =20
> > > +        - const: xtheadpmu
> > > +          description:
> > > +            The T-Head performance monitor extension for counter ove=
rflow. For more
> > > +            details, see the chapter 12 in the Xuantie C906 user man=
ual.
> > > +            https://github.com/T-head-Semi/openc906/tree/main/doc
> >=20
> > I'm pretty sure that I asked on the previous revision for you to
> > identify a specific revision of this document.
>=20
> Sorry, I'm still searching for it.

Identifying a specific commit from that repo as the revision would be
okay. Follow the format used elsewhere for the standard extensions.

Cheers,
Conor.

--Utvw2SdgzW4fg31u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWcvqgAKCRB4tDGHoIJi
0pQuAQDZZfwrh03OUXbGE0xwEKsxZcfxxPGdlMVElJGo9ksISAD+KCK6j7yitR3a
gkIK95gOtiUMn/8ZposqtImCwROI7gg=
=RvjF
-----END PGP SIGNATURE-----

--Utvw2SdgzW4fg31u--

