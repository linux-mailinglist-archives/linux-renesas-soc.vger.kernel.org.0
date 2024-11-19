Return-Path: <linux-renesas-soc+bounces-10576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9295F9D219E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 09:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E36B7282A0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 08:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C094157472;
	Tue, 19 Nov 2024 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="KLOqCNQF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83C140BE0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Nov 2024 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732005252; cv=none; b=HeRGdRk9iOZPy7rFFNoCWmufjwD9sUcD72mfYeaf7hthp7T3B+OBw8YCdu/3aXREHPTRPLWAz4hUDiV/PADukQUGuGU58/d2zwT9jSgtd0AAPxF0w2SNHJ7OX8pzUDNuHZziSl6eShbReOi9dibnWOIgjx1JdPS7HrwBEcLOzBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732005252; c=relaxed/simple;
	bh=3opWfJRX/SunMCyqGokAYKMWv3I7yP82kpJNjhWRXlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfUWkupu823pCOxNdyg5URqdlkPg6m8zz/NxtJr7qxM1ZWPGHodtmhIWXNkp2KPXMbHHvjWqUYD5eh1v/ATjz219unXKiQv8fgFf3QUlFo29uQ7XtClhVnjjzi3Ckjjbiwf3+htRFwJTOKuVErZ8hMHRuXyTpnpcKk6GbfkOXDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=KLOqCNQF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so35794325e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Nov 2024 00:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732005249; x=1732610049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WUKCfmUuN+EAwvifVE4+S5ixV+7dGLlwu1X93E3/9sk=;
        b=KLOqCNQFgHYrwQAkTbfissl7LWvafkRraXxqhqrNrJ0uZfRN2yuAcuxvJ80RnDw+Si
         c+HTVYHi2R8z1R6SI3OYarGtfMVsRN5kEIdxXa6cKCVg9oxPXZIkU/tD6KwGP/pIg0pK
         y3ACZRRTRCUWLkX91Ol0mwbdiEZunemc9VGkCmU9WuluETd1IXfUNrTok/IJqyH1dw4+
         m5NtwYqVFEZT7qHLHGDPJzEPL7qh8aR35v5LDKJgqYE06KFxJSybwHcXHEnm0xeVFM4B
         YI5gSGvBQGVMRh5YNiKGRAVhd9h+v/VF1QPWOnQSsmhY8ZFyNrlQ/tKhNiJSV8qceidB
         /3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732005249; x=1732610049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUKCfmUuN+EAwvifVE4+S5ixV+7dGLlwu1X93E3/9sk=;
        b=p47v+Hdr2uxBG1V4QJT70OcjCfGsbzheuXG6ImPirbTAd5Wq98IzX5AzFbuaKLn74j
         NX1HLpJSzkAton/7IP9zwNsSIu4W76sQXZRCl07ybXJkbIPMkLjACVBoCuuXCJu5djG6
         rL7yrJLD/NPMl6Cyc0cj2NtA36fMQXIyMDKXtebPAIt1pcaL1cY/0Vok2M/dwO8JkjC3
         2+YH/uJTga39FmZpW0GwoRIf7/LCfUxpbeMHUqpsFZOFczsNqSmtuicWdQyzwyRwH001
         8faRnZlb8s/ff7Ixv+MS8Vx3WlgbgCclmZsZDbupNcZIuhVTT9wnoChsg7xDBB6SGIcw
         j6vw==
X-Forwarded-Encrypted: i=1; AJvYcCXBBL87/OaGU7qZ3ZGD9ulMdRuh8auBJJTdgt68gDe4rsgpXNcsthtOWOuBtKZSsSrxeqHSoFOs+WZY1/M9c0Nh+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWiOIlrhfL7kWYtieHiAZdAEGycnChn6zdw65XE4uh3wiLAks0
	xXoCZS99adCeHXgYB9WU/A+RaR7ggyK1V0eP4Iy91bpSA+zN9Eh5LDAheDV+dEc=
X-Google-Smtp-Source: AGHT+IEAnwtSIUCCmIKtfAGTWZVAyBrISGeUmzRcmTVWpwEqzShG1TbLIR2fD2YtzQG7+ymt31CdSA==
X-Received: by 2002:a05:600c:3b0a:b0:431:52b7:a499 with SMTP id 5b1f17b1804b1-432df78b065mr119059215e9.20.1732005248941;
        Tue, 19 Nov 2024 00:34:08 -0800 (PST)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da24459bsm192837965e9.6.2024.11.19.00.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 00:34:08 -0800 (PST)
Date: Tue, 19 Nov 2024 09:34:07 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Colton Lewis <coltonlewis@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH v2] riscv: perf: Drop defining
 `perf_instruction_pointer()` and `perf_misc_flags()`
Message-ID: <20241119-8542ffd5c08526b665895722@orel>
References: <20241116160506.5324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZzxDvLKGz1ouWzgX@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzxDvLKGz1ouWzgX@gmail.com>

On Tue, Nov 19, 2024 at 08:52:28AM +0100, Ingo Molnar wrote:
> 
> * Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> 
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > With commit 2c47e7a74f44 ("perf/core: Correct perf sampling with guest
> > VMs"), the perf core now handles the functionality previously requiring
> > arch-specific definitions of `perf_instruction_pointer()` and
> > `perf_misc_flags()`. As these definitions are no longer necessary for
> > RISC-V, this patch removes their implementation and declarations.
> > 
> > This change also fixes the following build issue on RISC-V:
> > 
> >     ./include/linux/perf_event.h:1679:84: error: macro "perf_misc_flags" passed 2 arguments, but takes just 1
> >     ./include/linux/perf_event.h:1679:22: error: 'perf_misc_flags' redeclared as different kind of symbol
> >     ./include/linux/perf_event.h:1680:22: error: conflicting types for 'perf_instruction_pointer'; have 'long unsigned int(struct perf_event *, struct pt_regs *)'
> > 
> > The above errors arise from conflicts between the core definitions in
> > `linux/perf_event.h` and the RISC-V-specific definitions in
> > `arch/riscv/include/asm/perf_event.h`. Removing the RISC-V-specific
> > definitions resolves these issues and aligns the architecture with the
> > updated perf core.
> > 
> > Fixes: 2c47e7a74f44 ("perf/core: Correct perf sampling with guest VMs")
> 
> Yeah, so the Fixes tag is wrong - this is not a build bug
> with that commit, and your patch does not even apply to
> the perf events tree.
> 
> This is a semantic merge conflict that arises in linux-next - the
> riscv version of perf_instruction_pointer() function doesn't even
> exist in the perf tree...
> 
> AFAICS the problem is that the riscv tree applied this commit:
> 
>   5bb5ccb3e8d8 ("riscv: perf: add guest vs host distinction")
> 
> While the perf tree solved this in a more generic fashion:
> 
>   2c47e7a74f44 perf/core: Correct perf sampling with guest VMs
>   baff01f3d75f perf/x86: Refactor misc flag assignments
>   3e807cf07d96 perf/powerpc: Use perf_arch_instruction_pointer()
>   04782e63917d perf/core: Hoist perf_instruction_pointer() and perf_misc_flags()
>   e33ed362cf9e perf/arm: Drop unused functions
> 
> So I believe, assuming the perf version works fine on riscv
> (I haven't tested it), that the solution is to revert
> 5bb5ccb3e8d8 either in the riscv tree, or upon merging it.

Hi Ingo,

This patch isn't a complete revert of 5bb5ccb3e8d8. The early returns in
perf_callchain_user() and perf_callchain_kernel() should remain and the
CONFIG_PERF_EVENTS #ifdef in arch/riscv/include/asm/perf_event.h should
remain as well.

Thanks,
drew

