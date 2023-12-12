Return-Path: <linux-renesas-soc+bounces-937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B91F280EBC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 13:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAD9D1C20A98
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 12:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC245EE79;
	Tue, 12 Dec 2023 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKVVixxF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B2D5EE74;
	Tue, 12 Dec 2023 12:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368C6C433C8;
	Tue, 12 Dec 2023 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702384201;
	bh=FaLM7S3nSiRMpV25B4JshfeboK2nz9A67qt6BjH1Cao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKVVixxFY8oPkCnoPf5IgKJkUN2K8yknh2go7ba7NRhHqiDdYB0tPkQhFbxaRKkXe
	 Mv4UidE8MvJUOg30tzNCaaHq17/atPEZdPNYi/nnLCONg2GX+8rfQwwiwRyWsTdDxG
	 9zLoXcTvpFmq8nCTY6sUvSebHJ9nkMJ+oLwkIfbRBigplAI8Z5XzGoSz4PMx+dTYh2
	 NHj1zqc3i7o6rzX986PX9w5+j7Q/JdcjKiYBlaPW8zGGWA/9SkqLY0qbLx71VqzH3z
	 khexcp6Pe3UMH5hQe6JZ/yqY9oH7txAh3/mG/YN6Tn7hEEq9r8vF+zHCW78o9NuyCv
	 7vTwxtqzhYWQQ==
Date: Tue, 12 Dec 2023 12:29:55 +0000
From: Will Deacon <will@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ard Biesheuvel <ardb@google.com>, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 1/4] arm64: fpsimd: Drop unneeded 'busy' flag
Message-ID: <20231212122955.GA29310@willie-the-truck>
References: <20231208113218.3001940-6-ardb@google.com>
 <20231208113218.3001940-7-ardb@google.com>
 <CAMuHMdWewWJ1msJTcPNcbAf296gt+Kait3ECXjsJrSN+uerWyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWewWJ1msJTcPNcbAf296gt+Kait3ECXjsJrSN+uerWyA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Geert,

Cheers for the report.

On Tue, Dec 12, 2023 at 12:27:50PM +0100, Geert Uytterhoeven wrote:
> On Fri, Dec 8, 2023 at 12:34 PM Ard Biesheuvel <ardb@google.com> wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> > Kernel mode NEON will preserve the user mode FPSIMD state by saving it
> > into the task struct before clobbering the registers. In order to avoid
> > the need for preserving kernel mode state too, we disallow nested use of
> > kernel mode NEON, i..e, use in softirq context while the interrupted
> > task context was using kernel mode NEON too.
> >
> > Originally, this policy was implemented using a per-CPU flag which was
> > exposed via may_use_simd(), requiring the users of the kernel mode NEON
> > to deal with the possibility that it might return false, and having NEON
> > and non-NEON code paths. This policy was changed by commit
> > 13150149aa6ded1 ("arm64: fpsimd: run kernel mode NEON with softirqs
> > disabled"), and now, softirq processing is disabled entirely instead,
> > and so may_use_simd() can never fail when called from task or softirq
> > context.
> >
> > This means we can drop the fpsimd_context_busy flag entirely, and
> > instead, ensure that we disable softirq processing in places where we
> > formerly relied on the flag for preventing races in the FPSIMD preserve
> > routines.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> 
> Thanks for your patch, which is now commit e109130b0e5ec3fd
> ("arm64: fpsimd: Drop unneeded 'busy' flag") in arm64/for-next/core
> and next-20231212.
> 
> I have bisected the following warning during boot (on Salvator-XS with
> R-Car H3 ES2.0 and on White-Hawk with R-Car V4H) followed by a lock-up
> (on Salvator-XS) to this commit:

Please can you provide the output from the warning and, if possible, a
pointer to your .config?

Cheers,

Will

