Return-Path: <linux-renesas-soc+bounces-25671-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBEDCADC19
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 17:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C01B300AB27
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 16:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D31257829;
	Mon,  8 Dec 2025 16:30:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2549F2D94B2;
	Mon,  8 Dec 2025 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765211408; cv=none; b=jjUy2bkr2v/AvwSeSOkTuV6m45wztBzvL4ihbmCF24VPTwFEH4IKRW8z/inNqFy/IzpyNP3lSARW25bIPErV4OiQY2T40s2W7a66435YcPZbhUNNWI15LqNu0m/GWA885il7Ce3T+ITr6OyIW3hLTKqrZWaFrrMOJKtZJXGcflA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765211408; c=relaxed/simple;
	bh=0YFnnRyoofr72fBq6pWHMYFSkqsDU8YOzTAubZLSam4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRUG/mgFH8Mz85RNlyxy6LgnU9C0RcJhNXGzV5OH/zgvmNLTaY6XV+778oTyGWbVZNRj7jK22FFYpGh254zU+7hHL8j2h9uMMS5xTsCgdB8ELQpBy052iMbfmmwNnHMKQM1q347i5uTfxM5sfRIF9mo2/ofS9sv3a/EDF2O9Ly8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 308D51691;
	Mon,  8 Dec 2025 08:29:58 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87ECF3F740;
	Mon,  8 Dec 2025 08:30:03 -0800 (PST)
Date: Mon, 8 Dec 2025 16:30:00 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <20251208-quixotic-cocky-emu-9a3916@sudeepholla>
References: <20251202-evasive-neon-rhino-d2745e@sudeepholla>
 <66257fcf-9024-454f-b776-4ba584963ebe@mailbox.org>
 <aS82GSN8c2SnRn4S@bogus>
 <8d773671-5e2e-4e21-ade6-2bf9a3b75066@mailbox.org>
 <20251203-thick-didactic-cockatoo-deaa1d@sudeepholla>
 <4ccbcffd-bcc7-478b-a525-a4a11e3092ee@mailbox.org>
 <20251204-calm-peacock-of-fantasy-6b8cbe@sudeepholla>
 <e25c690c-e74d-4641-a97e-8eae81a59168@mailbox.org>
 <20251205-winged-quizzical-pigeon-ed692d@sudeepholla>
 <06fc0557-6b7c-4092-aeec-e3e16bab2d72@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06fc0557-6b7c-4092-aeec-e3e16bab2d72@mailbox.org>

On Sun, Dec 07, 2025 at 10:16:36AM +0100, Marek Vasut wrote:
> On 12/5/25 10:54 AM, Sudeep Holla wrote:
> 
> Hello Sudeep,
> 
> > > > > > Also IIUC, the irq request happens
> > > > > > as part of channel startup and there are no explicit APIs for the mbox client
> > > > > > driver to control that. SCMI is mbox client in this case.
> > > > > 
> > > > > Sure, but the mailbox driver has to make sure it is correctly demuxing the
> > > > > IRQs it handles and correctly sends received_data notifications to the right
> > > > > channel(s) .
> > > > > 
> > > > 
> > > > Agreed, but the concern is that if SCMI is forced to use polling when the
> > > > channel is opened, and IRQs are enabled by default with no way for SCMI to
> > > > disable them in polling mode, we could run into issues.
> > > 
> > > This constellation seems odd -- if the channel can do IRQs, then this
> > > property should not be present in DT.
> > > 
> > 
> > Yes, but there is no way to validate or check this and that is the root
> > cause for all my worries.
> 
> Should a configuration like that even be considered valid and relevant ?
> 

Yes, as I have mentioned, there is no way to validate the same in the kernel.

> > > > I realise it’s a very
> > > > specific corner case, but every time I’ve assumed such scenarios wouldn’t
> > > > occur, we eventually ended up encountering them. So sorry if I am very
> > > > pedantic, but I prefer to start smaller and restrictive and expand if and
> > > > when necessary or required only.
> > > 
> > > I don't think this case, where mailbox channel does IRQs and polling is
> > > enabled, can/should even be considered valid. Either the channel does not do
> > > IRQs and then it should do polling, or it does IRQs and then it should use
> > > IRQs, but not both.
> > > 
> > 
> > Yes ideally, but having loose ends like this binding which allows someone
> > to add it to their DT complicates though it is invalid. We have no way to
> > detect and I don't want to work around such configs in the future.
> 
> If the DT is invalid, bad things happen, but I would argue that is then a DT
> bug and the DT should be fixed.
> 

Well, ideally I would like that, but not always the reality.

> [...]
> 
> > > > Yes, that’s essential, because polling in an SMC context is meaningless in my
> > > > opinion.
> > > 
> > > Maybe the "a2p" IRQ is also used for notifications from longer running
> > > operations ?
> > > 
> > 
> > Yes, it is some sort of work around some platforms implemented as by design
> > when the SMC returns, the synchronous commands must complete and it is had
> > to support async SCMI commands without platform specific interrupt(p2a). This
> > a2p is sort of completion interrupt for synchronous command. I assume the
> > platform may offload the task from secure f/w to something else otherwise
> > secure side needs to be given CPU cycles to complete which complicates this.
> > In short SMC is synchronous and if the execution returns from it in NS world,
> > the command is complete.
> 
> Wouldn't polling still be useful for the async case , even in SMC setup?
> Note that the SMC setup does use shmem, and therefore can do polling on the
> shmem.
> 

No, it makes no sense for SMC as I have already mentioned few times.

> > > [...]
> > > 
> > > > > > Yes it can be minimalistic but not restrictive. As I already clearly mentioned
> > > > > > I don't see it makes any sense to enable this for SMC/OPTEE. Lets start with
> > > > > > just mailbox to start with and extend to other transports if and when needed.
> > > > > > It would be good to impose that restriction in the binding as well but that
> > > > > > is not a must IMO. I am fine if the bindings for whatever reasons(though I
> > > > > > don't see the need) to apply for any transport.
> > > > > So I should simply drop the smc.c changes , keep the rest, and send V2 ?
> > > > 
> > > > Not just that. Unless DT maintainers oppose, I just want to keep this
> > > > new property valid only for mailbox transport(i.e. "arm,scmi" compatible
> > > > not otherwise) so that we can catch any other use in binding checks and
> > > > interested parties must discuss on the list and expand that if they require.
> > > > 
> > > > Also we can explore if we can parse and scan this in mailbox transport for
> > > > now.
> > > I feel that this only adds more implementation complexity and makes the
> > > solution less generic, while it does win us very little in the end ? The
> > > generic solution implementation is actually easier to implement.
> > 
> > Yes I want it less generic to start with. Why you want to start making
> > this workaround on your platform a generic implementation just because
> > the specification has provision for it ?
> 
> Because this is generic kernel code, it seems counterintuitive to introduce
> less generic solution which requires more complex implementation.
> 

I would argue. Lot of code gets added as specific and gets generalised
eventually if there are more users and in different configurations.

> Since the DEN0056 specification states this mode of operation is supported,
> I also wouldn't call it a workaround.

Sure, I take back if I called it workaround. But why would we want to make
it generic when we can test only mailbox based platform with it. I don't see
how it can be useful with SMC/Optee. I am not sure if it is useful with
virtio and if there is a way to test this. All I am saying is I don't want to
enable something and advertise it as generic when we have no platform or way
to test it and keep it functionally correct.

-- 
Regards,
Sudeep

