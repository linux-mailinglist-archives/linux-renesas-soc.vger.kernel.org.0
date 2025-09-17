Return-Path: <linux-renesas-soc+bounces-21962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0265AB7EAA1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71DC77A89A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 07:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270363054FF;
	Wed, 17 Sep 2025 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNM1z9hn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA783054F3;
	Wed, 17 Sep 2025 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758095612; cv=none; b=Fcke0JsyqFkM+D7URr4bmRCh5bV06Ze6yBQwKuWhAp64cwoIO0JU/LptAPU1+v1X3xTDdPcNKAUjqcT4lhL6E9Se8Mzq5nhJGbd/59wXU+OytW5uFYDbjqmrWCtFpg+QS07r8160eZMnxA2yJwbirzU9Q0KTNanP+fkMPCQlMdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758095612; c=relaxed/simple;
	bh=rZD530C33pH+GWMHh31/6zyeGeoXK3zwG57zlNxdd7s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jY6G0BkckS5FJUxfjpm36lS1MYooZAatjpD8pgIS+1h86hOn3KbgM/XamXTV8JZtkVRi7yH09nCqXfWgue8ys2dk7QrHnmewHdpp2utVQ3J8iGWNzRkFdeixs62Zv1XjAj70jCV0Dl+hoMokSv4BLl5llBjGp7YTt2Mv9dx6pqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNM1z9hn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76070C4CEF7;
	Wed, 17 Sep 2025 07:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758095611;
	bh=rZD530C33pH+GWMHh31/6zyeGeoXK3zwG57zlNxdd7s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cNM1z9hnO/tp4z5Bk9aOjAreEb+GhL7j4b7o/2L+q1cBzAYhyqVy8unTi9B31u9Pa
	 VfCHGiFnsKiemO/jBp3XL0moGs6WrA5uPyybRlhOUG1PQ4JDRb6IVOirtLWwqFMmPz
	 pOP9nz41hTctahm4XL4uCVXj255VaePscfnzr0VPu73TRJqYhvrHl75SV0pGzSBUrA
	 fGgp85cNDmuzXvk+rb2FJb3INRCxDhx4ppcYDPU73yywF7sR4YJQPLwoR6g2BbKd5X
	 icQ2kOHM4dgtbVRaMEhsd/y3osWPKfq7/+hn4GWpKhAxZrCfqZ0yroxbE8ulajy7Dk
	 eR4cYfzxKGzng==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uymym-00000006yJA-31N5;
	Wed, 17 Sep 2025 07:53:28 +0000
Date: Wed, 17 Sep 2025 08:53:27 +0100
Message-ID: <86qzw51pmw.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang,  Kan" <kan.liang@linux.intel.com>,
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
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.
 infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: renesas: Add R8A78000 X5H DTs
In-Reply-To: <87h5x1afgr.wl-kuninori.morimoto.gx@renesas.com>
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
	<87ms6vi0js.wl-kuninori.morimoto.gx@renesas.com>
	<86v7li1xs4.wl-maz@kernel.org>
	<87h5x1afgr.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kuninori.morimoto.gx@renesas.com, kan.liang@linux.intel.com, adrian.hunter@intel.com, alexander.shishkin@linux.intel.com, acme@kernel.org, catalin.marinas@arm.com, conor+dt@kernel.org, dianders@chromium.org, geert+renesas@glider.be, irogers@google.com, mingo@redhat.com, james.clark@linaro.org, jolsa@kernel.org, john.g.garry@oracle.com, krzk+dt@kernel.org, leo.yan@linux.dev, lpieralisi@kernel.org, mark.rutland@arm.com, mike.leach@linaro.org, namhyung@kernel.org, oliver.upton@linux.dev, peterz@infradead.org, robh@kernel.org, shameerali.kolothum.thodi@huawei.com, will@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Wed, 17 Sep 2025 05:08:21 +0100,
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
> 
> 
> Hi Marc
> 
> > > +		/*
> > > +		 * The ARM GIC-720AE - View 1
> > > +		 *
> > > +		 * see
> > > +		 *	r19uh0244ej0052-r-carx5h.pdf
> > > +		 *	- attachments: 002_R-CarX5H_Address_Map_r0p51.xlsx
> > > +		 *	 - sheet [RT]
> > > +		 *	  - line 619
> > 
> > Are these documents publicly available? If not, I don't think this
> > helps much.
> 
> You can get it if you are Renesas R-Car Consortium member.

Given that statistically nobody outside of Renesas it a "member", the
relevance of this document is pretty much nil.

> And, the datasheet is very complex, I don't think people can find it by
> himself without any hint.

I guess we're just a bunch of inexperienced idiots unable to read a
TRM.

(eye roll...)

> 
> > > +		 */
> > > +		gic: interrupt-controller@39000000 {
> > > +			compatible = "arm,gic-v3";
> > > +			#interrupt-cells = <3>;
> > > +			#address-cells = <0>;
> > > +			interrupt-controller;
> > > +			reg = <0 0x39000000 0 0x20000>, // GICD
> > > +			      <0 0x39080000 0 0x40000>; // GICR
> > 
> > In v2, you indicated that your GIC was configured for GICv4.1, which
> > implied 256kB frames for each redistributor. Here, you have either
> > just enough space for 32 RDs for a GICv3, or 16 RDs for GICv4.
> > 
> > So either this is wrong, and you're missing half of the RD space, or
> > v2 was wrong. Which one is it?
> 
> will fix in v4
> 
> > > +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > 
> > No ITS? That seems... surprising.
> 
> Will be added later

Why later? You're adding the GIC, add it all, not just a part of it.

	M.

-- 
Without deviation from the norm, progress is not possible.

