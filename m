Return-Path: <linux-renesas-soc+bounces-22019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D0EB8424A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 12:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 153A718853BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 10:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01DE28313A;
	Thu, 18 Sep 2025 10:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5E6Pp7W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713DB227EA8;
	Thu, 18 Sep 2025 10:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758191880; cv=none; b=bTk0Cpw5dWff/nhLCMUeD7EvXm50FMgMfCRfIWYnktCL+DmIk4elZI4MA5lhgfH5UOhBjsf0dB1kYx7AHSDhpp3pqrSO94QkFuPym5eaGTkGr124wF6YSsBqE17x9XIxGNEc7oTGCy+VKKJas2DPUyGvz1Br41EWRwcPDPnsDUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758191880; c=relaxed/simple;
	bh=3wLU6rYHf7utHzIANk8nK0heYOD/FcW8/1SsNTd/TNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCfRuO1tOPTPLcmRlsCz/ebpRLQrZCrsNKWp/pCqr0mMEBkT8HNHS83X8U9Zm2/7AWS4FoS1mT3UNHnrDG2otqtIvvN0edbl1sYmKnHFQHekOa6HewiFIad5ovB9Vu+rzfLRojQGvEE6xVJx62QayuLR67ALLxcmHKvsiB3ez2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5E6Pp7W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23865C4CEF7;
	Thu, 18 Sep 2025 10:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758191880;
	bh=3wLU6rYHf7utHzIANk8nK0heYOD/FcW8/1SsNTd/TNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5E6Pp7WkZ6ZhzfTDXPr0l2+wqXgliX2Mp8KjhOeOsDgvGO2D75+jOAkhLYlyaQZ7
	 N3O1DZMqrmt6Y5gLH4Y2TY1Gt5wiYzbJcI+o7VrWRC8SJVZAO+n4tfabmw3tQlFOMr
	 SO2BMMzV75ta8jdULM9mL4kxIwvZOlPS0tBXY0z6iNkjk1Y7lttAzjyRSRKePXFqmp
	 0ZBRQgfm62kGaevn1Z0irlM0Dj4tGtU3DkeYSmSjpfRdl5C9g61qyszcAcM03zkFqK
	 e77E8mC1whTqazcK0cgZ5ZsNUNzgNAzmRpDX8S2oH5jY4kP3pg6yuasNTn9OpP+R/D
	 E1Ocy/BjljNlA==
Date: Thu, 18 Sep 2025 11:37:52 +0100
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
Subject: Re: [PATCH v5 3/7] tools: arm64: Add Cortex-A720AE definitions
Message-ID: <aMvhAJ_NIgjGxuvA@willie-the-truck>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
 <87ikhgnun4.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikhgnun4.wl-kuninori.morimoto.gx@renesas.com>

On Thu, Sep 18, 2025 at 06:26:39AM +0000, Kuninori Morimoto wrote:
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
> ---
>  tools/arch/arm64/include/asm/cputype.h | 2 ++
>  tools/perf/util/arm-spe.c              | 1 +
>  2 files changed, 3 insertions(+)

Acked-by: Will Deacon <will@kernel.org>

Will

