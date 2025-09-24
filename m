Return-Path: <linux-renesas-soc+bounces-22309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD0EB992F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 11:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1864E1B22A43
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 09:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896632D8DB9;
	Wed, 24 Sep 2025 09:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaAnH1TI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDCB2D877D;
	Wed, 24 Sep 2025 09:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758706654; cv=none; b=kMPBzBc3oVzUEO2gABgCA+bhNeHWR6FJTJ0i9lw91s9+ZwRBb8UW+TeiwDuvZIf3471VKOc2a4OlXr6iO91udQltA4QmFO8L/Sbi7eE/mmR1ICIpDpq8o/zdF2VYwy1QPiy+TmSFsV9jhhXi+bWjYsfjnTJfTLrnf4lyrnFR1cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758706654; c=relaxed/simple;
	bh=1aZ/9VunpzhlHKKkboI7zyiqhZ/F0yATGuOtZAeMB/0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BfFdQn2A0RD2Dk07pIQeHwxDYRN8mwYr/CJyqvgPp8dg9D0jG+OwY2sNyBBfRW58wm/WlV+SkVwWYTiORJvpUNnkYe3kzfSLB2fmih2vrr6XS/u3bISQ4WW6IrxAJd6nza8EEeanJ6C25nWeDVG2Mj4dlLoS2JO0B5Xa60szNYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaAnH1TI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E08DC4CEE7;
	Wed, 24 Sep 2025 09:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758706654;
	bh=1aZ/9VunpzhlHKKkboI7zyiqhZ/F0yATGuOtZAeMB/0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oaAnH1TIvwFUX0sa/zWWzjeMquc3iEFX1R2IOXauBGZXM5aKOb40WbSQYdQcTCP3j
	 bag2hPIXNbxbFWTGfBiSsX/aw810/XYF6qWm484X9MIcBa/ioSSVX37Jf9HAFtrlCP
	 T2Fo2o0IYDNPo6EFagZvC7XGxJtYzP0ZBoZQ8PO350iDtORV68Pa101ZoGcC7S9eYa
	 S5A+Sv3/DeqxGv0B/Ao/t1p3In66+e6d/qnyRDEONv38p2VMWzodESi97yX4ejMQJz
	 He0VxSvvEDXXsvoQ7PRkXIKhYfg2LiELBKGjUPNpiyanmGbvhqswPydEWwWL+SmmRd
	 I8+TjH64VMCAw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v1LwJ-00000008yeU-2X2S;
	Wed, 24 Sep 2025 09:37:31 +0000
Date: Wed, 24 Sep 2025 10:37:30 +0100
Message-ID: <86a52k199h.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
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
In-Reply-To: <87plbgafkj.wl-kuninori.morimoto.gx@renesas.com>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
	<87ecs4nult.wl-kuninori.morimoto.gx@renesas.com>
	<86ikhg13m1.wl-maz@kernel.org>
	<CAMuHMdVezqWxbFp9dd0WPJnNM+MvmQ9F0UA2Ru_BSV6-6VgOyA@mail.gmail.com>
	<877bxuzvs6.wl-maz@kernel.org>
	<87plbgafkj.wl-kuninori.morimoto.gx@renesas.com>
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
X-SA-Exim-Rcpt-To: kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org, kan.liang@linux.intel.com, adrian.hunter@intel.com, alexander.shishkin@linux.intel.com, acme@kernel.org, catalin.marinas@arm.com, conor+dt@kernel.org, dianders@chromium.org, geert+renesas@glider.be, irogers@google.com, mingo@redhat.com, james.clark@linaro.org, jolsa@kernel.org, john.g.garry@oracle.com, krzk+dt@kernel.org, leo.yan@linux.dev, lpieralisi@kernel.org, mark.rutland@arm.com, mike.leach@linaro.org, namhyung@kernel.org, oliver.upton@linux.dev, peterz@infradead.org, robh@kernel.org, will@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Wed, 24 Sep 2025 00:56:28 +0100,
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
> 
> 
> Hi Marc
> 
> # sorry for late response. I had took day-off
> 
> > > > > +             /*
> > > > > +              * The ARM GIC-720AE - View 1
> > > > > +              *
> > > > > +              * see
> > > > > +              *      r19uh0244ej0052-r-carx5h.pdf
> > > > > +              *      - attachments: 002_R-CarX5H_Address_Map_r0p51.xlsx
> > > > > +              *       - sheet [RT]
> > > > > +              *        - line 619
> > > > > +              */
> (snip)
> > Something like:
> > 
> > 	/* Application Processors manage View-1 of a GIC-720AE */
> > 
> > and the mention of the TRM and other spreadsheets dropped.
> 
> OK, will do
> 
> > the ITS to be described. The HW has it, it has no dependency on
> > anything else, so there is no reason to omit it.
> 
> I had asked HW team and PCI team, and there is a valid reason
> why we would like to skip it. Because we had issues with using ITS on
> previous SoCs. Hence we are reluctant to describe it until we can
> actually test it.

Posting patches for partially HW doesn't feel like a great approach.

> So far, we never submitted a complete .dtsi in one go, but always enabled
> more functionality in incremental steps, after verifying that it actually
> works.

Well, the GIC (and specially ARM's implementation) is a whole entity,
not something you can cut and dice. Just like you wouldn't describe
the CPUs without their timers.

	M.

-- 
Without deviation from the norm, progress is not possible.

