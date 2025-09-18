Return-Path: <linux-renesas-soc+bounces-22031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D899B844AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 13:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38CD17B64ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 11:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0B53002B4;
	Thu, 18 Sep 2025 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBef1k3P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706BD23ABA0;
	Thu, 18 Sep 2025 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758193610; cv=none; b=bunjdKHySb/V6rYT0Ngg1oGyijT6sZg5GqVf0y47pO1u5goYeI/LoPVrgPJevodYj/qUaSgccCG8CksP5eVTlWF4SROgk4iMGxYVUban9VuKD3TaGNT06Wq8Wi/yzL81v8P0D77M3q0UY3QGb/xq/1+CymnsPCiVSJc3Y78P85U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758193610; c=relaxed/simple;
	bh=tLCrfcwuvmqPecuw/USrpVPpjk1XTTQBWxdekuHCy/E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eO9+2dHBqJbT0ToSzm3YIaGi6xdPQ+PPfRPHETlWNuCM5d/Yd/Ce1AnnL9ksA9VjfIQjtTUMWYiwVBzj1smzfq8V9nePrJtBF8PR5wRtyqSxl8rm+CbtB6HB3/68u2Ihu6C46H6OFRm0vM8wcXFM8Zh94F4s/NpBW0jEzvF1LpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBef1k3P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4C7C4CEEB;
	Thu, 18 Sep 2025 11:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758193610;
	bh=tLCrfcwuvmqPecuw/USrpVPpjk1XTTQBWxdekuHCy/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oBef1k3P2JyWc9LBWFAz6ImTtdvOwDQn6zp/dKDsPHP4Jc1ELZP0a1OBbDHZYRq25
	 FEENxEfLwSAaOA0OVE1zmGTvB8Dcqb7s/BC/Za5PEFIFXxhFXFT0E0aBjtA0BGf+LU
	 9EXN+s65WmQ5ItxX5LeuWXtJAOeBSCPNfTZEKW/iF8MqI+fTSyKhoDYaqzXChqyrzA
	 DbjOMRKjHimtUflLNy+xZtbs81X8DmfrXSgogRsVdiTGReljuX7BekvciP166Koa82
	 xfe2EfwqnTFFfk287DUlREOMPKxP9mGfmARdwYYjL59cezZODjnsLVGWH2rXipvnGI
	 HvbbTs9WVUlng==
From: Will Deacon <will@kernel.org>
To: "Liang, Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jiri Olsa <jolsa@kernel.org>,
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 0/7] arm64: add R8A78000 support
Date: Thu, 18 Sep 2025 12:06:35 +0100
Message-Id: <175819208575.1966292.14850843650367600650.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 18 Sep 2025 06:23:07 +0000, Kuninori Morimoto wrote:
> This is v5 of R8A78000 support for Renesas.
> 
> This patch-set adds R8A78000 and Ironhide board support.
> It is based on SDK v4.28.0 or later. It will be released at end of Oct.
> 
> Link: https://lore.kernel.org/r/87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com
> 
> [...]

Applied MIDR bits to arm64 (for-next/cpufeature), thanks!

[4/7] arm64: cputype: Add Cortex-A720AE definitions
      https://git.kernel.org/arm64/c/f38c2c3e572c
[5/7] arm64: errata: Expand speculative SSBS workaround for Cortex-A720AE
      https://git.kernel.org/arm64/c/3ba8d4aa42bd

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

