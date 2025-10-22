Return-Path: <linux-renesas-soc+bounces-23440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5084DBFCD69
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 17:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61D823A3541
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 15:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B0132B983;
	Wed, 22 Oct 2025 15:19:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99277288C24
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146385; cv=none; b=C3ZlJf34b7r/yDS2HPbbM8PHYbkzuNSIMJXPQGDaWgwahKnN1oE8mr/KqKvbNE46kNOOI+DdEEqAcsqdkqD/PfozmLNw0M165vVYPgg2ZzACIwoUOXA5Z0caNH5+RA5nBicRxRNtN+BV041mbnK6nDpjfVVoutvyW8ni0I3834g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146385; c=relaxed/simple;
	bh=CaOUM6qpc8VIXfMlYU4mnHL7E00SW0GlaXnPfIifKLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcltijUbbIqPwm8I7E1BbNSI6sErONfNkoB5VuJFtGfDLhCL+CphjKBsuehPGYpV+9LRu2EZxxmfRhHLt9s97oppTv/kBZO6JMeNejY9uz/xR1I8Ufg7cH1IVEW+gyk0V8kbvsrtKSMjDagGAye5jAGxGuV+MMgBPe7tM+CUrkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD1FC4CEE7;
	Wed, 22 Oct 2025 15:19:42 +0000 (UTC)
Date: Wed, 22 Oct 2025 16:19:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
Message-ID: <aPj2DA2FwYVSmLVc@arm.com>
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <861pmvvv2g.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861pmvvv2g.wl-maz@kernel.org>

On Wed, Oct 22, 2025 at 04:02:15PM +0100, Marc Zyngier wrote:
> On Wed, 22 Oct 2025 15:33:38 +0100,
> Marek Vasut <marek.vasut@mailbox.org> wrote:
> > 
> > On 10/22/25 4:20 PM, Marc Zyngier wrote:
> > > On Wed, 22 Oct 2025 14:35:28 +0100,
> > > Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> > >> 
> > >> The AMU configuration register access may fault and prevent successful
> > >> kernel boot. This can occur for example in case the firmware does not
> > >> allow AMU counter access from EL1. Guard the AMU configuration register
> > >> access with ARM64_HAS_AMU_EXTN to prevent this fault if ARM64_HAS_AMU_EXTN
> > >> Kconfig option is explicitly disabled. Other interaction with the AMU is
> > >> already guarded by similar ifdeffery.
> > >> 
> > >> Fixes: 87a1f063464a ("arm64: trap to EL1 accesses to AMU counters from EL0")
> > >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > >> ---
> > >> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > >> Cc: Catalin Marinas <catalin.marinas@arm.com>
> > >> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > >> Cc: Marc Zyngier <maz@kernel.org>
> > >> Cc: Ryan Roberts <ryan.roberts@arm.com>
> > >> Cc: Will Deacon <will@kernel.org>
> > >> Cc: Yicong Yang <yangyicong@hisilicon.com>
> > >> Cc: linux-arm-kernel@lists.infradead.org
> > >> Cc: linux-renesas-soc@vger.kernel.org
> > >> ---
> > >>   arch/arm64/mm/proc.S | 4 ++++
> > >>   1 file changed, 4 insertions(+)
> > >> 
> > >> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> > >> index 86818511962b6..123538ffeda6b 100644
> > >> --- a/arch/arm64/mm/proc.S
> > >> +++ b/arch/arm64/mm/proc.S
> > >> @@ -145,7 +145,9 @@ SYM_FUNC_START(cpu_do_resume)
> > >>   	ubfx	x11, x11, #1, #1
> > >>   	msr	oslar_el1, x11
> > >>   	reset_pmuserenr_el0 x0			// Disable PMU access from EL0
> > >> +alternative_if ARM64_HAS_AMU_EXTN
> > >>   	reset_amuserenr_el0 x0			// Disable AMU access from EL0
> > >> +alternative_else_nop_endif
> > > 
> > > Why?
> > > 
> > > We ensure that the AMU is available in the macro itself by checking
> > > for ID_AA64PFR0_EL1.AMU. If the AMu isn't present on this CPU, we skip
> > > the offending sysreg access. This is similar to what we do for the
> > > PMU.
> > > 
> > > Does your HW advertise an AMU, but doesn't actually have one?
> >
> > The hardware does have AMU, but it is currently blocked in old TFA
> > version and access to this AMU register here causes a fault. That's
> > why I have to disable ARM64_HAS_AMU_EXTN until the TFA is updated and
> > the AMU access is made available on this hardware. But even if I do
> > disable ARM64_HAS_AMU_EXTN=n , I get a fault.
> 
> Well, I would tend to say that you are trying to update the wrong
> piece of SW here. Crashing kernels should be a good incentive for the
> board manufacturer to update their firmware pronto, specially when we
> are talking of code that has been in the tree for over 5 years...

I agree.

> > This patch is mainly meant to prevent a surprise in case someone does
> > set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register
> > access.
> 
> But that doesn't really fix anything if you have a buggy firmware,
> because you can't tell which CPUs have been correctly configured, and
> which have not. I also don't really get why this hack works for you,
> because the feature will be set as soon as one CPU advertises the
> feature.

I think Marek also disables the config option and the feature won't be
turned on.

-- 
Catalin

