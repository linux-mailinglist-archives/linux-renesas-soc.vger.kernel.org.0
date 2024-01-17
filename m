Return-Path: <linux-renesas-soc+bounces-1599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 919E683020B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jan 2024 10:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92B081C2240A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jan 2024 09:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AF513FFB;
	Wed, 17 Jan 2024 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lga2DKrK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918401427A;
	Wed, 17 Jan 2024 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705483055; cv=none; b=iTifXDXwSVsRDxd428N9oNBkKHeFUkj26r6JedQpsoWoqLWSX/ut9prNf48jxpYYGMddVGszDynLEy7s/xMR7NiAF5ey98Wjk59EKdCdmGmyWITCv0qa+ofTvpDccQz34IcKnDvTzHoO9xweus8tl7q1iktbbF0X/g78C7rZcT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705483055; c=relaxed/simple;
	bh=iRymQwRvNhWD9oW1t0+HJlZC+FKTXVCqa6HLbCoh/B0=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=oqwvcfq/hzdrp13HU/M4N7STW0i8lAK4ojWmzrdNLSjouu/LpBb1WxvQABae9OWjEScaZ53R0SLT8xSg1k6EdUjJD+yGKMDSacd75yw4E5vhzp60/4vZhoc1UQcAMRVfVBWB5Fn+F3diTUze/nYz8C7e7RnyKIvMiiJcs42/U6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lga2DKrK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96B0C43390;
	Wed, 17 Jan 2024 09:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705483055;
	bh=iRymQwRvNhWD9oW1t0+HJlZC+FKTXVCqa6HLbCoh/B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lga2DKrKf/UYOfATiGRdlEzTE0KNp3XKh3IpcftrPJRB6ZUnCNvPGBVWZumVHs3hc
	 guyjcQ0VtkdqgG2KHanh4mP84LgdPFtekcjR0Gc7FhW/4BUebmLtOSkwThdAOnhOl3
	 Oz4MVUf3nKNVxgTzBWFtpNQmD3QgFGx/eGevcJWvq05vYhOjpcsa5cRAJymxyPWFGf
	 zXlsdHk3866w1HSoTu5z9v9Z6RI8SZPpmfcF/WNYtiLm5/GrQPl6kVJJN957Pe/ITV
	 M7Yvp2zO5kmnPy3qxmDq4NdXj6/egtfHzChne9mkkfTdZA4x3p/YHr5n9gzK1n1tq1
	 5vBPRukoDOTiw==
Date: Wed, 17 Jan 2024 09:17:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, acme@kernel.org,
	adrian.hunter@intel.com, ajones@ventanamicro.com,
	alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
	anup@brainfault.org, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	conor.dooley@microchip.com, devicetree@vger.kernel.org,
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
	inochiama@outlook.com, chao.wei@sophgo.com,
	unicorn_wang@outlook.com, wefu@redhat.com
Subject: Re: [PATCH v7 07/16] RISC-V: Move T-Head PMU to CPU feature
 alternative framework
Message-ID: <20240117-coil-iphone-47988070aa6f@spud>
References: <20240110073917.2398826-1-peterlin@andestech.com>
 <20240110073917.2398826-8-peterlin@andestech.com>
 <CAOnJCUKY8H+pvgTWW5zkfm8O4WR-OWOKmyPTcMjUZBCC5RaLWQ@mail.gmail.com>
 <20240116-cherub-revival-5d32cc5f1fd0@spud>
 <CAOnJCU+DvoV08n5LLv-yrPOnUKNEQU9w344UBJ4Ou5-2LJwrrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ni8zC0RCVih+joEg"
Content-Disposition: inline
In-Reply-To: <CAOnJCU+DvoV08n5LLv-yrPOnUKNEQU9w344UBJ4Ou5-2LJwrrw@mail.gmail.com>


--Ni8zC0RCVih+joEg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 12:58:21AM -0800, Atish Patra wrote:
> On Tue, Jan 16, 2024 at 4:16=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Jan 16, 2024 at 12:55:41PM -0800, Atish Patra wrote:
> > > On Tue, Jan 9, 2024 at 11:40=E2=80=AFPM Yu Chien Peter Lin
> > > <peterlin@andestech.com> wrote:
> > > >
> > > > The custom PMU extension aims to support perf event sampling prior
> > > > to the ratification of Sscofpmf. Instead of diverting the bits and
> > > > register reserved for future standard, a set of custom registers is
> > > > added.  Hence, we may consider it as a CPU feature rather than an
> > > > erratum.
> > > >
> > >
> > > I don't think we should do that. Any custom implementation that
> > > violates the standard RISC-V spec should
> > > be an errata not a feature.
> > > As per my understanding, a vendor can call an extension custom ISA
> > > extension if the same feature is not available
> > > in the standard ISA extensions or the mechanism is completely
> > > different. It must also not violate any standard spec as well.
> > >
> > > In this case, a standard sscofpmf is already available. Moreover, both
> > > Andes and T-head extensions violate the standard
> > > spec by reusing local interrupt numbers (17(Thead) & 18(Andes)) which
> > > are clearly specified as reserved for standard local interrupts
> > > in the AIA specification.
> >
> > I disagree with you here. The Andes implementation predated (IIRC that
> > is what was said in replies to an earlier revision) the Sscofpmf
> > extension and certainly predates the AIA specification. I would be on
> > board with this line of thinking if someone comes along in 2030 with
> > "Zbb but with this one tweak" or where something flies entirely in the
> > face of the standard (like the IOCP cache stuff). The relevant section
> > in the AIA spec seems to say:
> > | Interrupt causes that are standardized by the Privileged Architecture
> > | have major identities in the range 0=E2=80=9315, while numbers 16 and=
 higher are
> > | officially available for platform standards or for custom use.
> > | The Advanced Interrupt Architecture claims further authority over
> > | identity numbers in the ranges 16=E2=80=9323 and 32=E2=80=9347, leavi=
ng numbers in the
> > | range 24=E2=80=9331 and all major identities 48 and higher still free=
 for custom
> > | use.
> > I don't see how that can be problematic given the Andes implemtation
> > dates from before AIA was a thing. It would be silly to say that because
> > an optional extension later came along and took over something previous=
ly
> > allowed for indiscriminate custom use, that support for that custom
> > extension is not permitted.
> >
>=20
> AIA is not some optional extension. It defines the RISC-V interrupt
> architecture going forward and will be the default implementation
> in the future.

I don't get you here. It is clearly optional - most (all?) existing
systems do not have it and certainly none did when this was designed.
The wording above from the AIA spec implies that using 16 and above used
to be okay for platform specifics (and I think the relevant section of
the priv spec was "Machine Interrupt Registers" which says the same).
New extensions coming along should not be allowed to block kernel
support for platform specifics that predated their use of permitted
"resources".

> IMO, this will be a slippery slope if we start
> supporting custom implementations to override interrupt ID definitions
> via custom cpu features. T-head implementation works perfectly fine as
> an errata and I don't understand why
> there is a push to make it a cpu feature.

I don't mind leaving the existing implementation (T-Head) using this,
but I will NAK any additions.

> We should try to improve the
> ecosystem for future platforms rather than bending
> backwards to support older implementations.

This is hardly "bending backwards".

Thanks,
Conor.

> I understand the push to brand this as a custom extension if current
> errata/alternative can't support it. But I don't think that's the case
> here though. Please correct me if I am wrong.
>=20
> > I may well be missing something here though, you clearly know these
> > specs better than I do, but from what I have read I disagree.
> >
> > > Please implementation Andes PMU support as an errata as well similar =
to T-head
> >
> > I certainly _do not_ want to see things like this detected via lookup
> > tables of marchid and co in the kernel unless it is absolutely required.
> > We have standard probing mechanisms for feature detection (because to me
> > this _is_ a feature) and they should be used. Additionally, we define w=
hat
> > entries in the DT properties mean, and if it is convenient to put
> > "psuedo" extensions into the DT, then we should do so. Getting away from
> > being tied to what RVI decrees was one of the goals of the new
> > properties after all, so that we could use a standard mechanism of DT
> > probing for things like this.
> >
>=20
> Yes. That's a perfectly valid mechanism for actual custom/vendor ISA exte=
nsions.
> I'm sure we'll have many of those, which will be leveraged via pseudo
> extensions in the DT.
> However, these shouldn't co-exist with standard ISA extensions in the
> namespace in riscv_isa_ext and/or hwprobe.
> The vendor-specific extensions should be defined under a
> vendor-specific namespace.
> This was another issue with this series as well. I didn't raise this
> topic earlier because I don't think overriding interrupt
> identities qualifies for a custom ISA extension
>=20
> > Thanks,
> > Conor.
> >
> > > > T-Head cores need to append "xtheadpmu" to the riscv,isa-extensions
> > > > for each cpu node in device tree, and enable CONFIG_THEAD_CUSTOM_PMU
> > > > for proper functioning as of this commit.
> > > >
> > > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > > Reviewed-by: Guo Ren <guoren@kernel.org>
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > > Changes v1 -> v2:
> > > >   - New patch
> > > > Changes v2 -> v3:
> > > >   - Removed m{vendor/arch/imp}id checks in pmu_sbi_setup_irqs()
> > > > Changes v3 -> v4:
> > > >   - No change
> > > > Changes v4 -> v5:
> > > >   - Include Guo's Reviewed-by
> > > >   - Let THEAD_CUSTOM_PMU depend on ARCH_THEAD
> > > > Changes v5 -> v6:
> > > >   - Include Conor's Reviewed-by
> > > > Changes v6 -> v7:
> > > >   - No change
> > > > ---
> > > >  arch/riscv/Kconfig.errata            | 13 -------------
> > > >  arch/riscv/errata/thead/errata.c     | 19 -------------------
> > > >  arch/riscv/include/asm/errata_list.h | 15 +--------------
> > > >  arch/riscv/include/asm/hwcap.h       |  1 +
> > > >  arch/riscv/kernel/cpufeature.c       |  1 +
> > > >  drivers/perf/Kconfig                 | 13 +++++++++++++
> > > >  drivers/perf/riscv_pmu_sbi.c         | 19 ++++++++++++++-----
> > > >  7 files changed, 30 insertions(+), 51 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> > > > index e2c731cfed8c..0d19f47d1018 100644
> > > > --- a/arch/riscv/Kconfig.errata
> > > > +++ b/arch/riscv/Kconfig.errata
> > > > @@ -86,17 +86,4 @@ config ERRATA_THEAD_CMO
> > > >
> > > >           If you don't know what to do here, say "Y".
> > > >
> > > > -config ERRATA_THEAD_PMU
> > > > -       bool "Apply T-Head PMU errata"
> > > > -       depends on ERRATA_THEAD && RISCV_PMU_SBI
> > > > -       default y
> > > > -       help
> > > > -         The T-Head C9xx cores implement a PMU overflow extension =
very
> > > > -         similar to the core SSCOFPMF extension.
> > > > -
> > > > -         This will apply the overflow errata to handle the non-sta=
ndard
> > > > -         behaviour via the regular SBI PMU driver and interface.
> > > > -
> > > > -         If you don't know what to do here, say "Y".
> > > > -
> > > >  endmenu # "CPU errata selection"
> > > > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/t=
head/errata.c
> > > > index 0554ed4bf087..5de5f7209132 100644
> > > > --- a/arch/riscv/errata/thead/errata.c
> > > > +++ b/arch/riscv/errata/thead/errata.c
> > > > @@ -53,22 +53,6 @@ static bool errata_probe_cmo(unsigned int stage,
> > > >         return true;
> > > >  }
> > > >
> > > > -static bool errata_probe_pmu(unsigned int stage,
> > > > -                            unsigned long arch_id, unsigned long i=
mpid)
> > > > -{
> > > > -       if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PMU))
> > > > -               return false;
> > > > -
> > > > -       /* target-c9xx cores report arch_id and impid as 0 */
> > > > -       if (arch_id !=3D 0 || impid !=3D 0)
> > > > -               return false;
> > > > -
> > > > -       if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> > > > -               return false;
> > > > -
> > > > -       return true;
> > > > -}
> > > > -
> > > >  static u32 thead_errata_probe(unsigned int stage,
> > > >                               unsigned long archid, unsigned long i=
mpid)
> > > >  {
> > > > @@ -80,9 +64,6 @@ static u32 thead_errata_probe(unsigned int stage,
> > > >         if (errata_probe_cmo(stage, archid, impid))
> > > >                 cpu_req_errata |=3D BIT(ERRATA_THEAD_CMO);
> > > >
> > > > -       if (errata_probe_pmu(stage, archid, impid))
> > > > -               cpu_req_errata |=3D BIT(ERRATA_THEAD_PMU);
> > > > -
> > > >         return cpu_req_errata;
> > > >  }
> > > >
> > > > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/incl=
ude/asm/errata_list.h
> > > > index 4ed21a62158c..9bccc2ba0eb5 100644
> > > > --- a/arch/riscv/include/asm/errata_list.h
> > > > +++ b/arch/riscv/include/asm/errata_list.h
> > > > @@ -25,8 +25,7 @@
> > > >  #ifdef CONFIG_ERRATA_THEAD
> > > >  #define        ERRATA_THEAD_PBMT 0
> > > >  #define        ERRATA_THEAD_CMO 1
> > > > -#define        ERRATA_THEAD_PMU 2
> > > > -#define        ERRATA_THEAD_NUMBER 3
> > > > +#define        ERRATA_THEAD_NUMBER 2
> > > >  #endif
> > > >
> > > >  #ifdef __ASSEMBLY__
> > > > @@ -147,18 +146,6 @@ asm volatile(ALTERNATIVE_2(                   =
                             \
> > > >             "r"((unsigned long)(_start) + (_size))                 =
     \
> > > >         : "a0")
> > > >
> > > > -#define THEAD_C9XX_RV_IRQ_PMU                  17
> > > > -#define THEAD_C9XX_CSR_SCOUNTEROF              0x5c5
> > > > -
> > > > -#define ALT_SBI_PMU_OVERFLOW(__ovl)                               =
     \
> > > > -asm volatile(ALTERNATIVE(                                         =
     \
> > > > -       "csrr %0, " __stringify(CSR_SSCOUNTOVF),                   =
     \
> > > > -       "csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),        =
     \
> > > > -               THEAD_VENDOR_ID, ERRATA_THEAD_PMU,                 =
     \
> > > > -               CONFIG_ERRATA_THEAD_PMU)                           =
     \
> > > > -       : "=3Dr" (__ovl) :                                         =
       \
> > > > -       : "memory")
> > > > -
> > > >  #endif /* __ASSEMBLY__ */
> > > >
> > > >  #endif
> > > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/as=
m/hwcap.h
> > > > index 5340f818746b..480f9da7fba7 100644
> > > > --- a/arch/riscv/include/asm/hwcap.h
> > > > +++ b/arch/riscv/include/asm/hwcap.h
> > > > @@ -80,6 +80,7 @@
> > > >  #define RISCV_ISA_EXT_ZFA              71
> > > >  #define RISCV_ISA_EXT_ZTSO             72
> > > >  #define RISCV_ISA_EXT_ZACAS            73
> > > > +#define RISCV_ISA_EXT_XTHEADPMU                74
> > > >
> > > >  #define RISCV_ISA_EXT_MAX              128
> > > >  #define RISCV_ISA_EXT_INVALID          U32_MAX
> > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpu=
feature.c
> > > > index e32591e9da90..4aded5bf8fc3 100644
> > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > @@ -303,6 +303,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[]=
 =3D {
> > > >         __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > > >         __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> > > >         __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > > > +       __RISCV_ISA_EXT_DATA(xtheadpmu, RISCV_ISA_EXT_XTHEADPMU),
> > > >  };
> > > >
> > > >  const size_t riscv_isa_ext_count =3D ARRAY_SIZE(riscv_isa_ext);
> > > > diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> > > > index 273d67ecf6d2..6cef15ec7c25 100644
> > > > --- a/drivers/perf/Kconfig
> > > > +++ b/drivers/perf/Kconfig
> > > > @@ -86,6 +86,19 @@ config RISCV_PMU_SBI
> > > >           full perf feature support i.e. counter overflow, privileg=
e mode
> > > >           filtering, counter configuration.
> > > >
> > > > +config THEAD_CUSTOM_PMU
> > > > +       bool "T-Head custom PMU support"
> > > > +       depends on ARCH_THEAD && RISCV_ALTERNATIVE && RISCV_PMU_SBI
> > > > +       default y
> > > > +       help
> > > > +         The T-Head C9xx cores implement a PMU overflow extension =
very
> > > > +         similar to the core SSCOFPMF extension.
> > > > +
> > > > +         This will patch the overflow CSR and handle the non-stand=
ard
> > > > +         behaviour via the regular SBI PMU driver and interface.
> > > > +
> > > > +         If you don't know what to do here, say "Y".
> > > > +
> > > >  config ARM_PMU_ACPI
> > > >         depends on ARM_PMU && ACPI
> > > >         def_bool y
> > > > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_=
sbi.c
> > > > index 2edbc37abadf..31ca79846399 100644
> > > > --- a/drivers/perf/riscv_pmu_sbi.c
> > > > +++ b/drivers/perf/riscv_pmu_sbi.c
> > > > @@ -20,10 +20,21 @@
> > > >  #include <linux/cpu_pm.h>
> > > >  #include <linux/sched/clock.h>
> > > >
> > > > -#include <asm/errata_list.h>
> > > >  #include <asm/sbi.h>
> > > >  #include <asm/cpufeature.h>
> > > >
> > > > +#define THEAD_C9XX_RV_IRQ_PMU          17
> > > > +#define THEAD_C9XX_CSR_SCOUNTEROF      0x5c5
> > > > +
> > > > +#define ALT_SBI_PMU_OVERFLOW(__ovl)                               =
     \
> > > > +asm volatile(ALTERNATIVE(                                         =
     \
> > > > +       "csrr %0, " __stringify(CSR_SSCOUNTOVF),                   =
     \
> > > > +       "csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),        =
     \
> > > > +               0, RISCV_ISA_EXT_XTHEADPMU,                        =
     \
> > > > +               CONFIG_THEAD_CUSTOM_PMU)                           =
     \
> > > > +       : "=3Dr" (__ovl) :                                         =
       \
> > > > +       : "memory")
> > > > +
> > > >  #define SYSCTL_NO_USER_ACCESS  0
> > > >  #define SYSCTL_USER_ACCESS     1
> > > >  #define SYSCTL_LEGACY          2
> > > > @@ -808,10 +819,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu=
 *pmu, struct platform_device *pde
> > > >         if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> > > >                 riscv_pmu_irq_num =3D RV_IRQ_PMU;
> > > >                 riscv_pmu_use_irq =3D true;
> > > > -       } else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
> > > > -                  riscv_cached_mvendorid(0) =3D=3D THEAD_VENDOR_ID=
 &&
> > > > -                  riscv_cached_marchid(0) =3D=3D 0 &&
> > > > -                  riscv_cached_mimpid(0) =3D=3D 0) {
> > > > +       } else if (riscv_isa_extension_available(NULL, XTHEADPMU) &&
> > > > +                  IS_ENABLED(CONFIG_THEAD_CUSTOM_PMU)) {
> > > >                 riscv_pmu_irq_num =3D THEAD_C9XX_RV_IRQ_PMU;
> > > >                 riscv_pmu_use_irq =3D true;
> > > >         }
> > > > --
> > > > 2.34.1
> > > >
> > >
> > >
> > > --
> > > Regards,
> > > Atish
>=20
>=20
>=20
> --=20
> Regards,
> Atish

--Ni8zC0RCVih+joEg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaebIwAKCRB4tDGHoIJi
0s5+AQCKSHEpb5Znbwrknpkit9H3nfJkX0phKiXPo+p/8kYb6QD/XusGd8+hQQzQ
DBy4j3X381KJITrgAzrTscQ6rzXxkwU=
=CpLA
-----END PGP SIGNATURE-----

--Ni8zC0RCVih+joEg--

