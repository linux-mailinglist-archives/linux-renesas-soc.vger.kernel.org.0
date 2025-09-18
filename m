Return-Path: <linux-renesas-soc+bounces-22030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB88EB843A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 12:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 894723A9820
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 10:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49B12F3621;
	Thu, 18 Sep 2025 10:49:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4AF22FE11;
	Thu, 18 Sep 2025 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758192597; cv=none; b=bgxgdLHmXwDxkToTXeDiFG40z33eA+1Psg52EsEHYs0QSZ5MXmL0hPraZvBX5rBqmhIOVchigqcYbKAG8WvN+NZseuQeNwbqj674AXqamVjyK5MWVkUKtZkbDVTw3ir+MRe4XXLBtYvY5PqBfug/kagtptvXKL6KzreNpnrAjt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758192597; c=relaxed/simple;
	bh=AKL5KEMR2SKUgFa4Z/HWI4OFweCE72oxUR2h3KCWLgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgFn0t0wNbWt43MVvjcjKr2mlaa0PVEq8H/g1908WCTDLILooR7P6kH/6WZ4y9IlkIHvJNCyjRMR/k+CBUBZmbvmLE7noF3ZiBnQMn/I0mxziH9mP+CrCiU9+7AbiBjmaDhjTo+3XQ7n1iV8O7ARShJQ0erPBMZ2j+ijY03lq3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D09D1A2D;
	Thu, 18 Sep 2025 03:49:47 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D8793F673;
	Thu, 18 Sep 2025 03:49:51 -0700 (PDT)
Date: Thu, 18 Sep 2025 11:49:48 +0100
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
Subject: Re: [PATCH v5 5/7] arm64: errata: Expand speculative SSBS workaround
 for Cortex-A720AE
Message-ID: <aMvjzPBAKtaIzXC1@J2N7QTR9R3.cambridge.arm.com>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
 <87frcknum8.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frcknum8.wl-kuninori.morimoto.gx@renesas.com>

On Thu, Sep 18, 2025 at 06:27:12AM +0000, Kuninori Morimoto wrote:
> It is same as Cortex-A720.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

It might be worth saying that Cortex-A720AE is explciitly describedon
Arm's "Arm CPU Security Bulletin: Spectre/Meltdown" page at:

  https://developer.arm.com/documentation/110280/3-0/

... and is described identially to Cortex-A720.

No need to respin for that, Will can choose to add that if he wants.

Either way:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/kernel/cpu_errata.c  | 1 +
>  arch/arm64/kernel/proton-pack.c | 1 +
>  2 files changed, 2 insertions(+)
> 
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
>  		{},
>  	};
>  	static const struct midr_range spectre_bhb_k32_list[] = {
> -- 
> 2.43.0
> 

