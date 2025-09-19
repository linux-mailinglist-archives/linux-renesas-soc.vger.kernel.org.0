Return-Path: <linux-renesas-soc+bounces-22061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF10B886EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 10:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 740B2584BA0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 08:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436E72F360B;
	Fri, 19 Sep 2025 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fgvr5Tsw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121732C17B6;
	Fri, 19 Sep 2025 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758270818; cv=none; b=Fsx+8sc1fEB7jzlgu+FUsdQ/H/1UAwPtK6TXfS1JwZMZr5D4MwpmEEsQlDNJ1W5UiAAbrBiT1+3yqnbSuaKCDmJZNJxTzXYaRcPqmNEltK5SMxtIq+CrsWPxTdo2KdSO5m14HRuNc2yVSSHAGoEa9xTzU8p4OAmn7D7tqGNZedU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758270818; c=relaxed/simple;
	bh=A0OWMtvps1Wg81cMmbvIwQ/jjMHTw/+5L7NX69xhXOA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a0tL2hmJJry2FcIW5Dr9tnL/XcuXC/mDhf/QeVn83NhOIikwkhkBcEFJxIh/sVtwTDnscubkH6NrdlPXcoSlbo4bzxmyZeJUrsOLelIX59l5t2CaF8r9pzbCTWoFvmkwL15/hYJDlgWKhutv/+W2TuKZzJ0szvTZzApZ2KvOe9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fgvr5Tsw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBF8C4CEF0;
	Fri, 19 Sep 2025 08:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758270817;
	bh=A0OWMtvps1Wg81cMmbvIwQ/jjMHTw/+5L7NX69xhXOA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fgvr5Tsw8zrd1WdlGfdJXPxPaxz6hGIy23jAI0/LiOBdfXV+y332cCVDaA517TNDF
	 ckFfXGne6LMAX+HeJENEo7QBgKiNxh9XOhzjbPjchnFB372o2qS7Hpr4WRViR2v5ib
	 nbLzFLfuI3dJ+eMyGuTDpOq80f2btKmjpY09JzQQDaSXDWQIGVuypRf2OunlAZ0POX
	 11zEwhyN/V9xYINHU84nN2gNPFHxC7OdwwSP5XKcF7ceMYVgskhbw0JXuYAWaj6r57
	 zL5JNaczkthArdSdBwXjDJJBIthgPv1h3uwSsfImBtceXO0WZGzLbJlUrYRAiShvS/
	 a2qe3xLxstq5g==
Received: from 82-132-235-207.dab.02.net ([82.132.235.207] helo=lobster-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzWYf-00000007i2F-3pDh;
	Fri, 19 Sep 2025 08:33:34 +0000
Date: Fri, 19 Sep 2025 09:33:29 +0100
Message-ID: <877bxuzvs6.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
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
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 6/7] arm64: dts: renesas: Add R8A78000 X5H DTs
In-Reply-To: <CAMuHMdVezqWxbFp9dd0WPJnNM+MvmQ9F0UA2Ru_BSV6-6VgOyA@mail.gmail.com>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
	<87ecs4nult.wl-kuninori.morimoto.gx@renesas.com>
	<86ikhg13m1.wl-maz@kernel.org>
	<CAMuHMdVezqWxbFp9dd0WPJnNM+MvmQ9F0UA2Ru_BSV6-6VgOyA@mail.gmail.com>
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
X-SA-Exim-Connect-IP: 82.132.235.207
X-SA-Exim-Rcpt-To: geert@linux-m68k.org, kuninori.morimoto.gx@renesas.com, kan.liang@linux.intel.com, adrian.hunter@intel.com, alexander.shishkin@linux.intel.com, acme@kernel.org, catalin.marinas@arm.com, conor+dt@kernel.org, dianders@chromium.org, geert+renesas@glider.be, irogers@google.com, mingo@redhat.com, james.clark@linaro.org, jolsa@kernel.org, john.g.garry@oracle.com, krzk+dt@kernel.org, leo.yan@linux.dev, lpieralisi@kernel.org, mark.rutland@arm.com, mike.leach@linaro.org, namhyung@kernel.org, oliver.upton@linux.dev, peterz@infradead.org, robh@kernel.org, will@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

Hi Geert,

On Fri, 19 Sep 2025 07:52:38 +0100,
Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> Hi Marc,
> 
> On Thu, 18 Sept 2025 at 12:01, Marc Zyngier <maz@kernel.org> wrote:
> > On Thu, 18 Sep 2025 07:27:26 +0100,
> > Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
> > > +             /*
> > > +              * The ARM GIC-720AE - View 1
> > > +              *
> > > +              * see
> > > +              *      r19uh0244ej0052-r-carx5h.pdf
> > > +              *      - attachments: 002_R-CarX5H_Address_Map_r0p51.xlsx
> > > +              *       - sheet [RT]
> > > +              *        - line 619
> > > +              */
> > > +             gic: interrupt-controller@39000000 {
> > > +                     compatible = "arm,gic-v3";
> > > +                     #interrupt-cells = <3>;
> > > +                     #address-cells = <0>;
> > > +                     interrupt-controller;
> > > +                     reg = <0 0x39000000 0 0x20000>,
> > > +                           <0 0x39080000 0 0x800000>;
> > > +                     interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > > +             };
> >
> > I already asked for:
> >
> > - this comment to be dropped, as it serves zero purpose to the common
> >   mortal
> 
> What about using a different comment instead?
> 
>     /* Linux must use I/F Region 1 */
> 
> I.e. replace "View 1" by the above.

I definitely wouldn't mention Linux, as the DT is not specific to any
particular OS. This is more about what block the main CPUs are allowed
to use. Also, "View" is the term used in the TRM to describe the
multiplexing of multiple GIC "instances" on a single GIC
implementation in a mixed-criticality system, so keeping it makes more
sense.

Something like:

	/* Application Processors manage View-1 of a GIC-720AE */

and the mention of the TRM and other spreadsheets dropped.

Thanks,

	M.

-- 
Jazz isn't dead. It just smells funny.

