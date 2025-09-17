Return-Path: <linux-renesas-soc+bounces-21980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB740B813D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 19:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FA93168250
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 17:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7922FE07F;
	Wed, 17 Sep 2025 17:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FWgOARlf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A5534BA3D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 17:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758131542; cv=none; b=l0D25yqze+PvdaNdsDlbWQsYz2r15G/iTvYWobkWnvOuDc5Np+pNE2KMo9OVS7mO7IFY3l58hSvTSM6iKL4HLblxXxKZb/Z8OuRUHOp6JAKQLRIi4Y4eAkYAAt5lHP+nCh9Qfz/o8nDCIzId0Oy/0R1N+8/SEHRklcOB2DIPaRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758131542; c=relaxed/simple;
	bh=g2/Cse7salc1tIUE/OJp9FayjCskQFXXIpcOQv0wqcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1gUUFExxIAU0pc9/ohFdXz8Bo2GK156k6w1DKx2SMlrW3EAWjkmqAG5bY1qytI5MAR4wYLxAxzjJ2q56riWYUs1MYTvgZimnF4JkhlO/+q4E5uDx1dv8y4nMaVBR/TyAa/DZcqcnlJvtBkEPQu+0mzwWktdUvh3PVpz+WYVmMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FWgOARlf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Rx5V
	0/lZD/IdbtCuUfwjiSEO0Grpo0JaThAgFi8Wh8s=; b=FWgOARlfcC5bBkEhH7jG
	ITFPFlwr1VAfDuV0hIVqbDeNRxa2v7Ycn5BBKxibO0KMk2WxPeWb494SJo3SZ4QE
	RFClSWn1PObw0nS9NEb3t1IMYTqChz5GwKXqsFSu9j0TT3VWAwE6MN3au5m6mGpS
	JD/p/ucC6a7lTlJguzmIG+T8RyBoUsUmd+Cy2Cg3AZdC4PTagMr5mrvyPECtqOUh
	rSgilWdz3j4OR/4LUArMds+Rffk4gY60pYA2iLgddKm6DKEjeKNKUM0HjLkxrPzc
	/OPXKoqjG0tih5tcmDLmR3lqI7P4yCJGfxt6ZBz/cgerHqnfaKm8oige/Ejgtbyi
	sQ==
Received: (qmail 3221545 invoked from network); 17 Sep 2025 19:52:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2025 19:52:03 +0200
X-UD-Smtp-Session: l3s3148p1@Zdbn5AI/itEujnvK
Date: Wed, 17 Sep 2025 19:52:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marc Zyngier <maz@kernel.org>
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
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: renesas: Add R8A78000 X5H DTs
Message-ID: <aMr1QjI8vfrP_fwD@shikoro>
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
 <87ms6vi0js.wl-kuninori.morimoto.gx@renesas.com>
 <86v7li1xs4.wl-maz@kernel.org>
 <87h5x1afgr.wl-kuninori.morimoto.gx@renesas.com>
 <86qzw51pmw.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86qzw51pmw.wl-maz@kernel.org>


> > And, the datasheet is very complex, I don't think people can find it by
> > himself without any hint.
> 
> I guess we're just a bunch of inexperienced idiots unable to read a
> TRM.

Please don't feel offended. Morimoto-san really has a point here. The
datasheet available for us is currently in a very rough format with
*lots* of attached documents with hard to grasp naming. I am dealing
with R-Car datasheets for 10+ years now, and I do have a hard time
finding the information I want with this one.

That being said, I agree to the point that it is not very helpful to
reference such documentation upstream.


