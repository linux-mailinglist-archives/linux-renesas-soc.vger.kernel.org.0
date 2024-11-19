Return-Path: <linux-renesas-soc+bounces-10575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A830E9D2101
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 08:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38F1A1F2158E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 07:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016B315535A;
	Tue, 19 Nov 2024 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqZ6dX5g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADC66E2BE;
	Tue, 19 Nov 2024 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732002757; cv=none; b=fGkECWCvx1uQlhH5IvYqDqPe9w0nj4pkvuBskLbkHosgIDGfelwqhOqXiKiwWoY3SNhk+ADkTTngJN+iYNCQ1VJS0XEKvzuaRcZ6J16tOIvaqskilOLoaztrUuuq/VIym8YKBretKrNzR11vZ4/dLfWS9YfHGDhWdARwVuHaJUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732002757; c=relaxed/simple;
	bh=vlZ6V0V0suamT+C0dm+LdFJZxlVSNDnx0CqzO+SIykI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozj2XgiBCGxLQORBfimjr9cqyTsx/DYBHD81g0xQjbHAhjQN526jUE20y36e9XGQVyQpZyB2/lRrlKFJ84VBWpuSVgho2IdK4bE/gpmVKDNo4Z+v4eblUGsLqEh2yyAX+yRTDfIaPW4RKPt+v5onzmTKa3/s0fD56Krl46UtOM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqZ6dX5g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54108C4CECF;
	Tue, 19 Nov 2024 07:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732002757;
	bh=vlZ6V0V0suamT+C0dm+LdFJZxlVSNDnx0CqzO+SIykI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqZ6dX5gFPX/Q9wBUHBCxPwNDF8hBrC7yohbLFN694Y8yOp0J16HR4DvqRdPsJmTO
	 Tt9hQaBPUaC60HRBogF3C2ZF+mZLocCIKI01joVKoGJcAH0QYQUDI8EV8kKoVzIrEB
	 DDuSR9i3ZVPw2ec1cpBGu746sT83Q95DHm8vq1bBY7x3yDeja74ifyK8SwZ1+WXwUk
	 cAuqABOaawUEn6y65UT9GmAEpoYqW7iZ7O3LLRcQB1cBhAxONb7hLOV3Q/tvU2VIZ/
	 viFPEbtxbVIH3nq/0Gl5BiPd5BRomosE5KlDWWHlrvd/avZEucK327ZS9NoK+Avrh9
	 djOEH0D1gLM0g==
Date: Tue, 19 Nov 2024 08:52:28 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Colton Lewis <coltonlewis@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2] riscv: perf: Drop defining
 `perf_instruction_pointer()` and `perf_misc_flags()`
Message-ID: <ZzxDvLKGz1ouWzgX@gmail.com>
References: <20241116160506.5324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241116160506.5324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


* Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> With commit 2c47e7a74f44 ("perf/core: Correct perf sampling with guest
> VMs"), the perf core now handles the functionality previously requiring
> arch-specific definitions of `perf_instruction_pointer()` and
> `perf_misc_flags()`. As these definitions are no longer necessary for
> RISC-V, this patch removes their implementation and declarations.
> 
> This change also fixes the following build issue on RISC-V:
> 
>     ./include/linux/perf_event.h:1679:84: error: macro "perf_misc_flags" passed 2 arguments, but takes just 1
>     ./include/linux/perf_event.h:1679:22: error: 'perf_misc_flags' redeclared as different kind of symbol
>     ./include/linux/perf_event.h:1680:22: error: conflicting types for 'perf_instruction_pointer'; have 'long unsigned int(struct perf_event *, struct pt_regs *)'
> 
> The above errors arise from conflicts between the core definitions in
> `linux/perf_event.h` and the RISC-V-specific definitions in
> `arch/riscv/include/asm/perf_event.h`. Removing the RISC-V-specific
> definitions resolves these issues and aligns the architecture with the
> updated perf core.
> 
> Fixes: 2c47e7a74f44 ("perf/core: Correct perf sampling with guest VMs")

Yeah, so the Fixes tag is wrong - this is not a build bug
with that commit, and your patch does not even apply to
the perf events tree.

This is a semantic merge conflict that arises in linux-next - the
riscv version of perf_instruction_pointer() function doesn't even
exist in the perf tree...

AFAICS the problem is that the riscv tree applied this commit:

  5bb5ccb3e8d8 ("riscv: perf: add guest vs host distinction")

While the perf tree solved this in a more generic fashion:

  2c47e7a74f44 perf/core: Correct perf sampling with guest VMs
  baff01f3d75f perf/x86: Refactor misc flag assignments
  3e807cf07d96 perf/powerpc: Use perf_arch_instruction_pointer()
  04782e63917d perf/core: Hoist perf_instruction_pointer() and perf_misc_flags()
  e33ed362cf9e perf/arm: Drop unused functions

So I believe, assuming the perf version works fine on riscv
(I haven't tested it), that the solution is to revert
5bb5ccb3e8d8 either in the riscv tree, or upon merging it.

Thanks,

	Ingo

