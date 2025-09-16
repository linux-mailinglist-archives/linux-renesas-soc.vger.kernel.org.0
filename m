Return-Path: <linux-renesas-soc+bounces-21913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B15CFB594D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 13:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A8F24831AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 11:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19E22C237D;
	Tue, 16 Sep 2025 11:11:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5202729DB61;
	Tue, 16 Sep 2025 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758021071; cv=none; b=fc6Y3/VxzxNY/78Nq2kopXyyLhCHDHPxRU1lgAsyNbAsop7j9mc75U+XZnJ/F5dHAMH/zppYSYNtXA3ULZXeYeUS65tMyXY410y6ut6PUz3+XbXUstEkNWtxLhVdbARorYbXIoMvy2I1Mbz18DzHW+Dmw9lk01aVIM/Sw7ayWXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758021071; c=relaxed/simple;
	bh=h2ANOawFG3Nb0VwQxIt7cN6FoACcoMBsCLrk7iAjvzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnTvZW8V0YsbSMna7WLHCtfQVpxGDDjWasdvNRD+/E4GwbRv9FWBJm4dMh3g8Qc7oj3ceQj45ybQ4FiwwJznFEt4NnCpxeAykyQ6lCFofy6iQ2MUX6rp/CmOrIwTUaUyQUZRfUWkNr+ERKbD3Jn1j9LBMScX7EK8wRDXKNDHThA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E17D12FC;
	Tue, 16 Sep 2025 04:11:00 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B86883F66E;
	Tue, 16 Sep 2025 04:11:03 -0700 (PDT)
Date: Tue, 16 Sep 2025 12:10:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	"Liang,  Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 3/6] arm64: cputype: Add Cortex-A720AE definitions
Message-ID: <aMlFwbDjJ6yKuxTv@J2N7QTR9R3.cambridge.arm.com>
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
 <87plbri0k3.wl-kuninori.morimoto.gx@renesas.com>
 <aMklbKwro2bSX76t@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMklbKwro2bSX76t@willie-the-truck>

On Tue, Sep 16, 2025 at 09:53:00AM +0100, Will Deacon wrote:
> On Tue, Sep 16, 2025 at 02:38:36AM +0000, Kuninori Morimoto wrote:
> > Add cputype definitions for Cortex-A720AE.
> > This patch is assuming A720AE feature is same as A720.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  arch/arm64/include/asm/cputype.h       | 2 ++
> >  arch/arm64/kernel/cpu_errata.c         | 1 +
> >  arch/arm64/kernel/proton-pack.c        | 1 +
> >  tools/arch/arm64/include/asm/cputype.h | 2 ++
> >  tools/perf/util/arm-spe.c              | 1 +
> >  5 files changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> > index 661735616787e..b10eba7f52476 100644
> > --- a/arch/arm64/include/asm/cputype.h
> > +++ b/arch/arm64/include/asm/cputype.h
> > @@ -96,6 +96,7 @@
> >  #define ARM_CPU_PART_NEOVERSE_V3	0xD84
> >  #define ARM_CPU_PART_CORTEX_X925	0xD85
> >  #define ARM_CPU_PART_CORTEX_A725	0xD87
> > +#define ARM_CPU_PART_CORTEX_A720AE	0xD89

This MIDR is correct per Table A-187 in the Cortex-A720AE TRM, which can
be found at:

  https://developer.arm.com/documentation/102828/0001/

It would be nice to spell that out in the commit message, e.g. as in
commit:

  9ef54a384526 ("arm64: cputype: Add Cortex-A725 definitions")

> >  #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
> >  
> >  #define APM_CPU_PART_XGENE		0x000
> > @@ -185,6 +186,7 @@
> >  #define MIDR_NEOVERSE_V3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3)
> >  #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
> >  #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
> > +#define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
> >  #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
> >  #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
> >  #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
> > diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> > index 59d723c9ab8f5..7ff6b49beaaff 100644
> > --- a/arch/arm64/kernel/cpu_errata.c
> > +++ b/arch/arm64/kernel/cpu_errata.c
> > @@ -531,6 +531,7 @@ static const struct midr_range erratum_spec_ssbs_list[] = {
> >  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
> >  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
> >  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
> > +	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
> >  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
> >  	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
> >  	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1C),
> > diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> > index edf1783ffc817..f9a32dfde0067 100644
> > --- a/arch/arm64/kernel/proton-pack.c
> > +++ b/arch/arm64/kernel/proton-pack.c
> > @@ -884,6 +884,7 @@ static u8 spectre_bhb_loop_affected(void)
> >  	static const struct midr_range spectre_bhb_k38_list[] = {
> >  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
> >  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
> 
> This needs an Ack from somebody at Arm who can confirm that (a) k38 is
> correct for A720AE and (b) that all versions of the CPU are affected.

I can confirm both:

(a) The k value for Cortex-A720AE is 38.
(b) All versions of Cortex-A720AE are affected.

The Cortex-A720 and Cortex-A720AE cores are identical in this regard.

FWIW, that's described at:

  https://developer.arm.com/documentation/110280/3-0/?lang=en

... with the confusing caveat that the table describes this as 'No*",
meaning that it's only vulnerable to same-context attacks (which we DO
need to mitigate for BPF).

Listing Cortex-A720AE in the k38 table is the right thing to do. That'll
ensure the BPF mitigation is applied. Per the TRM linked above,
ID_AA64MMFR1_EL1.ECBHB==0b001, so we won't redundantly apply the
mitigation at exception entry.

> 
> > diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
> > index 139d5e87dc959..0192dc7ec9ca9 100644
> > --- a/tools/arch/arm64/include/asm/cputype.h
> > +++ b/tools/arch/arm64/include/asm/cputype.h
> > @@ -96,6 +96,7 @@
> >  #define ARM_CPU_PART_NEOVERSE_V3	0xD84
> >  #define ARM_CPU_PART_CORTEX_X925	0xD85
> >  #define ARM_CPU_PART_CORTEX_A725	0xD87
> > +#define ARM_CPU_PART_CORTEX_A720AE	0xD89
> >  #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
> >  
> >  #define APM_CPU_PART_XGENE		0x000
> > @@ -185,6 +186,7 @@
> >  #define MIDR_NEOVERSE_V3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3)
> >  #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
> >  #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
> > +#define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
> >  #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
> >  #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
> >  #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
> > diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> > index 8942fa598a84f..bda6f3554f7e6 100644
> > --- a/tools/perf/util/arm-spe.c
> > +++ b/tools/perf/util/arm-spe.c
> > @@ -555,6 +555,7 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
> >  
> >  static const struct midr_range common_ds_encoding_cpus[] = {
> >  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
> > +	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
> >  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
> >  	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1C),
> >  	MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
> 
> Please post tools/ patches separately as they are merged independently
> of the kernel changes.

Also, please add the ID definitions separately from any usage. That
makes them *much* easier to backport for handling errata, etc.

Mark.

