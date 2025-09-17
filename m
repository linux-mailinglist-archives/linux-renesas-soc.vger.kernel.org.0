Return-Path: <linux-renesas-soc+bounces-21967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04170B7C657
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 499DF465335
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 12:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22B9371EB9;
	Wed, 17 Sep 2025 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0b0Z0LD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77965369992;
	Wed, 17 Sep 2025 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758110399; cv=none; b=EImVSCMTAU48VyDQ38Y6JI1XK5IK7ezoYuhbhOy+MN37xSx9B5YBFqjySbPwdZUiMqnonE93z7BN75Sj5WEh0OiegP4TzZJhlHjeHDYVx+oGQT659V/4KFZs2xac6pF6bpSx6sa6BblddY4ADk1Zi6C//6A7q8f8x22JDAP53dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758110399; c=relaxed/simple;
	bh=iR5+nco2EXNlSn4A2SXA42HaKbUNS/VQWh8sK0f6yhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QiTj4g9VcEUo3TX/4Vqz3byULG9nutueHv6EKNG14Bg5Ij7CjHXAlI+nrvfhfkfzI75/t5VmWIGQhu/WGGSySmOkDieX9S+dsFBraeSNtL6OvI8ck3s8d8bLMdTRAjCIT5oA8fH6BKCtDwv+CcX1uuaLKSljjQosr1qOKmcivbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0b0Z0LD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4441CC4CEF5;
	Wed, 17 Sep 2025 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758110399;
	bh=iR5+nco2EXNlSn4A2SXA42HaKbUNS/VQWh8sK0f6yhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0b0Z0LDC7ZatNJWoSFifZpi5eMunY/GMLlAQgcDKrKfB1tHTmXZtjARH19jixr4b
	 U+AFtcAh/obHUbw3mHT3AKzlUDSdBbDHkSwx3p4SxQ9DoLn8r0JwppUxwiCWYXpzxt
	 tI1YhLmSbnrP2fzwKh+jbHdm33vjW5kL/D0iMf7zPuA80yIxfn1UrMQpHcJ9GzmfOZ
	 nxt+fjgPRD0cASGO/3Me1AkjyiRstx/j6qOLFn3ImJfSHR1MaXZSfH5XP4gTIQMjJS
	 gGDRuJ9zIcdV6zdxY0rqsQpnB3LbA11UxNJFyFzV3JQXEtNJAkEJF9L6WrMkamOJw5
	 BkbvDQX+6MANQ==
Date: Wed, 17 Sep 2025 12:59:50 +0100
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
Subject: Re: [PATCH v4 1/5] arm64: cputype: Add Cortex-A725AE definitions
Message-ID: <aMqitjILn1GomkXt@willie-the-truck>
References: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com>
 <87bjn9abne.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjn9abne.wl-kuninori.morimoto.gx@renesas.com>

On Wed, Sep 17, 2025 at 05:30:45AM +0000, Kuninori Morimoto wrote:
> Add cputype definitions for Cortex-A725AE. These will be used for errata
> detection in subsequent patches.
> 
> These values can be found in the Cortex-A725AE TRM:
> 
> https://developer.arm.com/documentation/102828/0001/
> 
> ... in Table A-187
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

You seem to have sent the same patch twice but in both cases you're adding
A720AE whereas the commit message says A725AE.

Will

