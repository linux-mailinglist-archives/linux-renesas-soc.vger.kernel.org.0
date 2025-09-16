Return-Path: <linux-renesas-soc+bounces-21899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3952B59153
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F00E952399B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 08:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634112877FC;
	Tue, 16 Sep 2025 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwR15Hw5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277792857F2;
	Tue, 16 Sep 2025 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758012789; cv=none; b=nHCjF+DrcO2a/qItFu7KWny6UVEYArCd9cJy5Mk7i7Ouds+h/aeB0U4ChZ+7PMWHCV9SYTL3HSypHttGnwpbFqivmMGEiCudYigqNw87hV1QBXmiOsITcjqDeZ4NjFInBojdSdstAIm4BzAFiaLtHwOLtpIU7TTEePQR+tY+rxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758012789; c=relaxed/simple;
	bh=x1vfpZMTu0dHJho+pMOfAAm3yf/Mhb06EGt/9k5KZqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBRFBe7mOKPwSsQarK4rDnqI1oAq1E0lnKEVkJGcFdTQen/vqtWR/OU5OqTCDfPxoseoKFcCaUm4xqU41grnfOyEO0ztLUYaTu+QCtCRkgOB/Rvg7aVKeXRbmUfKYWnrsZpqIWmo5QZzb/DNMOU7EuwtZIhEzgFtUaJadqoXl/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwR15Hw5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D768C4CEEB;
	Tue, 16 Sep 2025 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758012788;
	bh=x1vfpZMTu0dHJho+pMOfAAm3yf/Mhb06EGt/9k5KZqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwR15Hw5jn3tFb4Mfe4A8rfByvNpFsa4+L4hIVpF8effWXB1RbJ6jp8ca77/XkJEi
	 esAb/PiHMhyGHN8Ql1817x+/6PADODi1UGpNuwQwEFuexlS8y1PrWKTrKrXh7WYO4Q
	 mWkau3c64o7aheV6n72emzl51Zr7T+3PGbjK6dJgbEJTF/GO7a+YKKjXxFgGhvhZkV
	 CeJaXbT57laXYuNwKo7ZmoM368VqgT7EULizAf6Lpk/f9OiXvZFKAiFOe59YwKidp8
	 50KCBZpAEnQacdlDqw0pIo2EDFnJi4Z3nr0ZMfE9ayZyus2d2VHj5xvdnLkLpx5krd
	 V0oMxvmP8FNGQ==
Date: Tue, 16 Sep 2025 09:53:00 +0100
From: Will Deacon <will@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang,  Kan" <kan.liang@linux.intel.com>,
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
	Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <aMklbKwro2bSX76t@willie-the-truck>
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
 <87plbri0k3.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plbri0k3.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Sep 16, 2025 at 02:38:36AM +0000, Kuninori Morimoto wrote:
> Add cputype definitions for Cortex-A720AE.
> This patch is assuming A720AE feature is same as A720.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/include/asm/cputype.h       | 2 ++
>  arch/arm64/kernel/cpu_errata.c         | 1 +
>  arch/arm64/kernel/proton-pack.c        | 1 +
>  tools/arch/arm64/include/asm/cputype.h | 2 ++
>  tools/perf/util/arm-spe.c              | 1 +
>  5 files changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index 661735616787e..b10eba7f52476 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -96,6 +96,7 @@
>  #define ARM_CPU_PART_NEOVERSE_V3	0xD84
>  #define ARM_CPU_PART_CORTEX_X925	0xD85
>  #define ARM_CPU_PART_CORTEX_A725	0xD87
> +#define ARM_CPU_PART_CORTEX_A720AE	0xD89
>  #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
>  
>  #define APM_CPU_PART_XGENE		0x000
> @@ -185,6 +186,7 @@
>  #define MIDR_NEOVERSE_V3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3)
>  #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
>  #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
> +#define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
>  #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
>  #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
>  #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 59d723c9ab8f5..7ff6b49beaaff 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -531,6 +531,7 @@ static const struct midr_range erratum_spec_ssbs_list[] = {
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
> +	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1C),
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index edf1783ffc817..f9a32dfde0067 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -884,6 +884,7 @@ static u8 spectre_bhb_loop_affected(void)
>  	static const struct midr_range spectre_bhb_k38_list[] = {
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),

This needs an Ack from somebody at Arm who can confirm that (a) k38 is
correct for A720AE and (b) that all versions of the CPU are affected.

> diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
> index 139d5e87dc959..0192dc7ec9ca9 100644
> --- a/tools/arch/arm64/include/asm/cputype.h
> +++ b/tools/arch/arm64/include/asm/cputype.h
> @@ -96,6 +96,7 @@
>  #define ARM_CPU_PART_NEOVERSE_V3	0xD84
>  #define ARM_CPU_PART_CORTEX_X925	0xD85
>  #define ARM_CPU_PART_CORTEX_A725	0xD87
> +#define ARM_CPU_PART_CORTEX_A720AE	0xD89
>  #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
>  
>  #define APM_CPU_PART_XGENE		0x000
> @@ -185,6 +186,7 @@
>  #define MIDR_NEOVERSE_V3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3)
>  #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
>  #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
> +#define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
>  #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
>  #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
>  #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 8942fa598a84f..bda6f3554f7e6 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -555,6 +555,7 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
>  
>  static const struct midr_range common_ds_encoding_cpus[] = {
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
> +	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1C),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),

Please post tools/ patches separately as they are merged independently
of the kernel changes.

Will

