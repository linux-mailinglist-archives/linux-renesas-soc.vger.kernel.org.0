Return-Path: <linux-renesas-soc+bounces-25595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A1658CA7077
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 10:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DEE03007A04
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 09:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6972330B1D;
	Fri,  5 Dec 2025 09:55:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147252FFFAE;
	Fri,  5 Dec 2025 09:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928518; cv=none; b=PBVKYZEF9FiWp8trWofvAPVKr443yVlRFrnYvWue6dOut9Y7OJX010ixYYeCE41irkhdH1aj624/LizrP5P8Y388rTqpL3oGqD/g6WBu2RB/9MnSPOh+qKaWS7FWGjL9vwGdW8A+RtH70QM4lujXMNcy6IgYkTb+bsqvM2is4Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928518; c=relaxed/simple;
	bh=/67sdz92mfBZ0p02qPzGahBauP3a2yp2K7gia0arSuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdF8/Rg5ZmGDaEb/r3ydpzl0cLSNPmpAdk/3QbuXuPv2VCqfWlyxRZZDEZgSesQ8eotZLGPuD1q1pkQxzZzgbRzMzyNx4a/HVblyes93wsU/uEMwCTvtcMs5ZMa1DjzAMKcMwJAKDJlHApbwONB/T0lslwI7EJ8Wu3nHMgYATYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4510339;
	Fri,  5 Dec 2025 01:54:55 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BF1B3F86F;
	Fri,  5 Dec 2025 01:55:01 -0800 (PST)
Date: Fri, 5 Dec 2025 09:54:58 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <20251205-winged-quizzical-pigeon-ed692d@sudeepholla>
References: <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>
 <aRW7BZimWdpq4TyX@pluto>
 <20251202-evasive-neon-rhino-d2745e@sudeepholla>
 <66257fcf-9024-454f-b776-4ba584963ebe@mailbox.org>
 <aS82GSN8c2SnRn4S@bogus>
 <8d773671-5e2e-4e21-ade6-2bf9a3b75066@mailbox.org>
 <20251203-thick-didactic-cockatoo-deaa1d@sudeepholla>
 <4ccbcffd-bcc7-478b-a525-a4a11e3092ee@mailbox.org>
 <20251204-calm-peacock-of-fantasy-6b8cbe@sudeepholla>
 <e25c690c-e74d-4641-a97e-8eae81a59168@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e25c690c-e74d-4641-a97e-8eae81a59168@mailbox.org>

On Thu, Dec 04, 2025 at 07:59:20PM +0100, Marek Vasut wrote:
> On 12/4/25 1:33 PM, Sudeep Holla wrote:
> 
> Hello Sudeep,
> 
> > > Wouldn't such a setup use separate mailbox channels, therefore even if
> > > mailbox driver calls mbox_chan_received_data(), it would be called for a
> > > specific mailbox channel , and it won't interfere with the SCMI mailbox
> > > channel.
> > > 
> > 
> > Ideally yes. Because PCC uses shared interrupts and provides no mechanism to
> > identify the channel that raised the interrupt, we must run the handler for
> > every registered channel. This behaviour is specific to PCC; other controllers
> > that support interrupt source detection may not need to do this. But SCMI
> > must work with any mailbox or other transports.
> 
> It seems the pcc_mbox_irq() operates per-channel, so it seems even the PCC
> can demux channels for each IRQ and does trigger mbox_chan_received_data()
> for correct channel ?
> 
> What exactly happens on the PCC mailbox driver with this polling mode
> enabled ?
> 
> > > > Also IIUC, the irq request happens
> > > > as part of channel startup and there are no explicit APIs for the mbox client
> > > > driver to control that. SCMI is mbox client in this case.
> > > 
> > > Sure, but the mailbox driver has to make sure it is correctly demuxing the
> > > IRQs it handles and correctly sends received_data notifications to the right
> > > channel(s) .
> > > 
> > 
> > Agreed, but the concern is that if SCMI is forced to use polling when the
> > channel is opened, and IRQs are enabled by default with no way for SCMI to
> > disable them in polling mode, we could run into issues.
> 
> This constellation seems odd -- if the channel can do IRQs, then this
> property should not be present in DT.
> 

Yes, but there is no way to validate or check this and that is the root
cause for all my worries.

> > I realise it’s a very
> > specific corner case, but every time I’ve assumed such scenarios wouldn’t
> > occur, we eventually ended up encountering them. So sorry if I am very
> > pedantic, but I prefer to start smaller and restrictive and expand if and
> > when necessary or required only.
> 
> I don't think this case, where mailbox channel does IRQs and polling is
> enabled, can/should even be considered valid. Either the channel does not do
> IRQs and then it should do polling, or it does IRQs and then it should use
> IRQs, but not both.
> 

Yes ideally, but having loose ends like this binding which allows someone
to add it to their DT complicates though it is invalid. We have no way to
detect and I don't want to work around such configs in the future.

> > > > > > I am aware of systems that implement such sharing, which is why I prefer to be
> > > > > > explicit that this type of design is challenging to support within this
> > > > > > binding. The intent is to support only minimal, constrained cases - essentially
> > > > > > systems that are already somewhat broken. I do not see value in broadening the
> > > > > > binding to cover every conceivable scenario.
> > > > > > 
> > > > > > > > Clearly defining these constraints would be helpful. It may also be useful to
> > > > > > > > note that this is primarily intended for mailbox transports, if that’s
> > > > > > > > accurate. Alternatively, we could keep the DT binding definition broader but
> > > > > > > > emit warnings when a transport other than mailbox is used. That approach might
> > > > > > > > make it easier to move forward.
> > > > > > > 
> > > > > > > DEN0056F refers to this polling mode in Shared memory based transports, that
> > > > > > > can be other than mailbox transports, it includes e.g. SMC or OPTEE
> > > > > > > transports.
> > > > > > > 
> > > > > > 
> > > > > > However, polling does not make sense in the context of SMC. Once control
> > > > > > returns from an SMC call, the command has completed. What form of polling in
> > > > > > an SMC workflow do you have in mind?
> > > > > 
> > > > > I think the polling happens on the SHMEM and the SMC transport is capable of
> > > > > that too, see :
> > > > > 
> > > > > drivers/firmware/arm_scmi/transports/smc.c
> > > > > 
> > > > > 175         /*
> > > > > 176          * If there is an interrupt named "a2p", then the service and
> > > > > 177          * completion of a message is signaled by an interrupt rather
> > > > > than by
> > > > > 178          * the return of the SMC call.
> > > > > 179          */
> > > > > 180         scmi_info->irq = of_irq_get_byname(cdev->of_node, "a2p");
> > > > > 
> > > > 
> > > > Ah this one, is actually implemented to avoid sort of implicit polling
> > > > mode we get with any SMC/HVC. I don't know how the platform deals with it
> > > > but SMC/HVC is synchronous and doesn't need this polling. The irq introduced
> > > > here is again a sort of workaround to get some sort of async/non-polling
> > > > mode with SMC/HVC. So, to repeat polling mode make absolutely no sense
> > > > whatsoever for SMC/OPTEE(based on pure SMC) transports.
> > > 
> > > I can drop the SMC part from this patch if you think that's helpful ?
> > > 
> > 
> > Yes, that’s essential, because polling in an SMC context is meaningless in my
> > opinion.
> 
> Maybe the "a2p" IRQ is also used for notifications from longer running
> operations ?
> 

Yes, it is some sort of work around some platforms implemented as by design
when the SMC returns, the synchronous commands must complete and it is had
to support async SCMI commands without platform specific interrupt(p2a). This
a2p is sort of completion interrupt for synchronous command. I assume the
platform may offload the task from secure f/w to something else otherwise
secure side needs to be given CPU cycles to complete which complicates this.
In short SMC is synchronous and if the execution returns from it in NS world,
the command is complete.

> [...]
> 
> > > > Yes it can be minimalistic but not restrictive. As I already clearly mentioned
> > > > I don't see it makes any sense to enable this for SMC/OPTEE. Lets start with
> > > > just mailbox to start with and extend to other transports if and when needed.
> > > > It would be good to impose that restriction in the binding as well but that
> > > > is not a must IMO. I am fine if the bindings for whatever reasons(though I
> > > > don't see the need) to apply for any transport.
> > > So I should simply drop the smc.c changes , keep the rest, and send V2 ?
> > 
> > Not just that. Unless DT maintainers oppose, I just want to keep this
> > new property valid only for mailbox transport(i.e. "arm,scmi" compatible
> > not otherwise) so that we can catch any other use in binding checks and
> > interested parties must discuss on the list and expand that if they require.
> > 
> > Also we can explore if we can parse and scan this in mailbox transport for
> > now.
> I feel that this only adds more implementation complexity and makes the
> solution less generic, while it does win us very little in the end ? The
> generic solution implementation is actually easier to implement.

Yes I want it less generic to start with. Why you want to start making
this workaround on your platform a generic implementation just because
the specification has provision for it ?

-- 
Regards,
Sudeep

