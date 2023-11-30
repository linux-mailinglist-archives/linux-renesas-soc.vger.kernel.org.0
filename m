Return-Path: <linux-renesas-soc+bounces-455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B16F47FEF9B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 13:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E31B81C20BC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 12:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22923B2AB;
	Thu, 30 Nov 2023 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZiioLM3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DB03C683;
	Thu, 30 Nov 2023 12:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65182C433C8;
	Thu, 30 Nov 2023 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701349132;
	bh=k61SVR5HqRg7HEBrqbj2RC0wILozeLcKJTkF4ff/FCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uZiioLM3vGhd04qm7k7+NnViHdFYh5nUaeVbfNcQ7pkEQfQ53udUJq2BV1hqCB+tL
	 ktmNEhQ5jqdFf0dT1SJRszxd0JNbSxbkgN657cvdVJeVjiqAeOClH5yxYy+qxIT1Sh
	 g93Vc52elbcNEYTcBo891fzZPSWoZiIZZBmjfWHSTHtRfV1qGgNeL1vp3I9yn/wi4g
	 roKhPGMFpeCfecjaRhTv7mdoySSRfO43EizHR3SUVJBZL38KudxZlQ+s3oS+7Zjttc
	 uPBXl52i2/u3veXdotEqe7ANYTsFEwOMLs+S+b4X/3k+frVOkG1tHrGjWiaYGlLkIp
	 WTVcmgGk9zreA==
Date: Thu, 30 Nov 2023 12:58:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Yu-Chien Peter Lin <peterlin@andestech.com>,
	Guo Ren <guoren@kernel.org>, acme@kernel.org,
	adrian.hunter@intel.com, ajones@ventanamicro.com,
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
	conor+dt@kernel.org, conor.dooley@microchip.com,
	devicetree@vger.kernel.org, dminus@andestech.com, evan@rivosinc.com,
	geert+renesas@glider.be, heiko@sntech.de, irogers@google.com,
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
	wens@csie.org, will@kernel.org, ycliang@andestech.com
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <20231130-isotope-runaround-9afb98579734@spud>
References: <ZWhT_VSpl2aksVK7@APC323>
 <IA1PR20MB4953A05B9162AA2659DE78A5BB82A@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+TcmYWDdQWc1nRE2"
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953A05B9162AA2659DE78A5BB82A@IA1PR20MB4953.namprd20.prod.outlook.com>


--+TcmYWDdQWc1nRE2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 08:16:38PM +0800, Inochi Amaoto wrote:
> >
> >Hi Inochi,
> >
> >On Thu, Nov 30, 2023 at 04:29:22PM +0800, Inochi Amaoto wrote:
> >>>
> >>> Hi Guo Ren,
> >>>
> >>> On Thu, Nov 23, 2023 at 05:14:30AM +0800, Guo Ren wrote:
> >>>> On Wed, Nov 22, 2023 at 8:17=E2=80=AFPM Yu Chien Peter Lin
> >>>> <peterlin@andestech.com> wrote:
> >>>>>
> >>>>> Document the ISA string for T-Head performance monitor extension
> >>>>> which provides counter overflow interrupt mechanism.
> >>>>>
> >>>>> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> >>>>> ---
> >>>>> Changes v2 -> v3:
> >>>>>   - New patch
> >>>>> Changes v3 -> v4:
> >>>>>   - No change
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
> >>>>>  1 file changed, 6 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yam=
l b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>>>> index c91ab0e46648..694efaea8fce 100644
> >>>>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> >>>>> @@ -258,5 +258,11 @@ properties:
> >>>>>              in commit 2e5236 ("Ztso is now ratified.") of the
> >>>>>              riscv-isa-manual.
> >>>>>
> >>>>> +        - const: xtheadpmu
> >>>>> +          description:
> >>>>> +            The T-Head performance monitor extension for counter o=
verflow. For more
> >>>>> +            details, see the chapter 12 in the Xuantie C906 user m=
anual.
> >>>>> +            https://github.com/T-head-Semi/openc906/tree/main/doc
> >>>>> +
> >>>>>  additionalProperties: true
> >>>>>  ...
> >>>>> --
> >>>>> 2.34.1
> >>>>>
> >>>> Reviewed-by: Guo Ren <guoren@kernel.org>
> >>>
> >>> Thanks for the review.
> >>> Would you share document about T-Head PMU?
> >>>
> >>
> >> Hi, Peter Lin:
> >>
> >> You can use the following two document to get all events:
> >> https://github.com/T-head-Semi/openc906/tree/main/doc
> >> https://github.com/T-head-Semi/openc910/tree/main/doc
> >>
> >> There are also some RTL code can describe these events:
> >> https://github.com/T-head-Semi/openc910/blob/e0c4ad8ec7f8c70f649d826eb=
d6c949086453272/C910_RTL_FACTORY/gen_rtl/pmu/rtl/ct_hpcp_top.v#L1123
> >> https://github.com/T-head-Semi/openc906/blob/af5614d72de7e5a4b8609c427=
d2e20af1deb21c4/C906_RTL_FACTORY/gen_rtl/pmu/rtl/aq_hpcp_top.v#L543
> >>
> >> The perf events json can also be used as document, this is already
> >> applied (with more detailed explanation):
> >> https://lore.kernel.org/all/IA1PR20MB495325FCF603BAA841E29281BBBAA@IA1=
PR20MB4953.namprd20.prod.outlook.com/
> >
> >Thanks for reaching out!
> >The updated description will be:
> >
> >- const: xtheadpmu
> >  description:
> >    The T-Head performance monitor extension for counter overflow, as ra=
tified
> >    in commit bd9206 ("Initial commit") of Xuantie C906 user manual.
> >    https://github.com/T-head-Semi/openc906/tree/main/doc
> >
> >Is it OK with you?
> >
>=20
> I suggest using perf event json as event description. The jsons provide
> more detailed explanation for these events than the user manual.

Does the "perf event json" describe the registers and interrupt behaviour?

--+TcmYWDdQWc1nRE2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWiHAAAKCRB4tDGHoIJi
0igkAQDOfuuBe9DSefozhmWIFmSJzSSWtODAmHdNEeaJ2/bbUAD+KQI5g0aV+rX2
4Hztl6JmSKirDEkCeX2FqX9R+Ln89A0=
=qBbG
-----END PGP SIGNATURE-----

--+TcmYWDdQWc1nRE2--

