Return-Path: <linux-renesas-soc+bounces-22029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68201B84387
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 12:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C568B3B51A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 10:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D9A2FDC29;
	Thu, 18 Sep 2025 10:46:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C57F2FE575;
	Thu, 18 Sep 2025 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758192405; cv=none; b=o+Nlc1WN+Of8G+B2mAP0iFhZsT6YBUlsy/gJn3r+ZFoN7NLvVwdANX6Ppvj48JODf9OsSNaNgKXE2xLgOK56nLtvmRtV+5O9XatuzKGHrSCyNMaKtgMNcdOBvsqE+eCTp4tD/EYPpax6V3HqrlyRgLASZgu5m67FvEdM9hIsyU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758192405; c=relaxed/simple;
	bh=h5OKx0riOVIawi/We1x4Y4mCHv5rkSm0OBcsJm/3Ans=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lX0jbCBxzprJRtv/QXPdhQ2rXX3ZmP59wCumF8NidzLFfObMBzqsJ/ncWW/CaZMgEJvFLGLJC343BGfFQTfUL4hl/9BDZeYZ1j2wBNQ/F/m0MB5F6c3JI6z0LndthH6fsL4HNkkHvvsS+8v0BU2PKUbjo9M7f0uPxcYr4fYVtO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A13F51A2D;
	Thu, 18 Sep 2025 03:46:34 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 930233F673;
	Thu, 18 Sep 2025 03:46:38 -0700 (PDT)
Date: Thu, 18 Sep 2025 11:46:12 +0100
From: Mark Rutland <mark.rutland@arm.com>
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
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v5 4/7] arm64: cputype: Add Cortex-A720AE definitions
Message-ID: <aMvi9PdW5Nd9UMvE@J2N7QTR9R3.cambridge.arm.com>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
 <87h5x0numo.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5x0numo.wl-kuninori.morimoto.gx@renesas.com>

On Thu, Sep 18, 2025 at 06:26:55AM +0000, Kuninori Morimoto wrote:
> Add cputype definitions for Cortex-A720AE. These will be used for errata
> detection in subsequent patches.
> 
> These values can be found in the Cortex-A720AE TRM:
> 
> https://developer.arm.com/documentation/102828/0001/
> 
> ... in Table A-187
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/cputype.h | 2 ++
>  1 file changed, 2 insertions(+)
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
> -- 
> 2.43.0
> 

