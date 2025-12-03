Return-Path: <linux-renesas-soc+bounces-25532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 120BAC9EDF0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 12:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0429B3A1973
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 11:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9A92F5A02;
	Wed,  3 Dec 2025 11:41:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1462F5496;
	Wed,  3 Dec 2025 11:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764762119; cv=none; b=ZyFfkBjkD389haBvslpY3Lmp++eyjZuKSHHXYtaUxvKqu1xxpXGpLmL0STpf/826SyemzzZ4hs293rZJA4tXXAFzAIJGRijvIzH0L3u5rhe/Y5vIiOw1oogXDDf9yq+6Kd5eTV/gMrhKF7uXPV7zg3tesySm/8xyaXbbQieVuk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764762119; c=relaxed/simple;
	bh=tvAIb1JrVzMWIH02LzeQThpEte0RgdN3PXriD9MuNxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Do5FtyGi77k1PuTJz07hEsCXCMRcw/uesL+f5MtPJFbIjiVurXxQDYXMeTz97PQq4HjR/9SHT++1/1dObkT6DCWJT5Ai6aqujXFYFFskBHKwBQFJzoNoUcfw4tQZiPk7PTM6YBQQ91Vfj6q6OU6dbfolMc20nFO6slQhEhb69hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1150E339;
	Wed,  3 Dec 2025 03:41:49 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82F203F59E;
	Wed,  3 Dec 2025 03:41:54 -0800 (PST)
Date: Wed, 3 Dec 2025 11:41:51 +0000
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
Message-ID: <20251203-thick-didactic-cockatoo-deaa1d@sudeepholla>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto>
 <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
 <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>
 <aRW7BZimWdpq4TyX@pluto>
 <20251202-evasive-neon-rhino-d2745e@sudeepholla>
 <66257fcf-9024-454f-b776-4ba584963ebe@mailbox.org>
 <aS82GSN8c2SnRn4S@bogus>
 <8d773671-5e2e-4e21-ade6-2bf9a3b75066@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d773671-5e2e-4e21-ade6-2bf9a3b75066@mailbox.org>

On Tue, Dec 02, 2025 at 08:25:11PM +0100, Marek Vasut wrote:
> On 12/2/25 7:55 PM, Sudeep Holla wrote:
> 
> Hello Sudeep,
> 
> > > How do you imagine this -- a transport shared with other components, one
> > > which does generate IRQs and one which does not -- would look like ? Can you
> > > think of an example ?
> > > 
> > 
> > Consider a system where a mailbox controller is present and one channel is
> > used for SCMI communication, while another channel is used for an unrelated
> > purpose. If both channels share the same interrupt line, and the other use
> > case enables interrupt mode on its channel, what would be the impact on the
> > SCMI-specific channel?
> 
> None, SCMI kernel driver and SCMI server side would still do polling on
> their respective SHMEM areas, while whatever kernel driver needs to receive
> the interrupt notifications would subscribe to them using request_irq(),
> right ?
> 

Fair enough. I was thinking if the controller manages to not call
mbox_chan_received_data() in that case. Also IIUC, the irq request happens
as part of channel startup and there are no explicit APIs for the mbox client
driver to control that. SCMI is mbox client in this case.

> > I am aware of systems that implement such sharing, which is why I prefer to be
> > explicit that this type of design is challenging to support within this
> > binding. The intent is to support only minimal, constrained cases - essentially
> > systems that are already somewhat broken. I do not see value in broadening the
> > binding to cover every conceivable scenario.
> > 
> > > > Clearly defining these constraints would be helpful. It may also be useful to
> > > > note that this is primarily intended for mailbox transports, if that’s
> > > > accurate. Alternatively, we could keep the DT binding definition broader but
> > > > emit warnings when a transport other than mailbox is used. That approach might
> > > > make it easier to move forward.
> > > 
> > > DEN0056F refers to this polling mode in Shared memory based transports, that
> > > can be other than mailbox transports, it includes e.g. SMC or OPTEE
> > > transports.
> > > 
> > 
> > However, polling does not make sense in the context of SMC. Once control
> > returns from an SMC call, the command has completed. What form of polling in
> > an SMC workflow do you have in mind?
> 
> I think the polling happens on the SHMEM and the SMC transport is capable of
> that too, see :
> 
> drivers/firmware/arm_scmi/transports/smc.c
> 
> 175         /*
> 176          * If there is an interrupt named "a2p", then the service and
> 177          * completion of a message is signaled by an interrupt rather
> than by
> 178          * the return of the SMC call.
> 179          */
> 180         scmi_info->irq = of_irq_get_byname(cdev->of_node, "a2p");
> 

Ah this one, is actually implemented to avoid sort of implicit polling
mode we get with any SMC/HVC. I don't know how the platform deals with it
but SMC/HVC is synchronous and doesn't need this polling. The irq introduced
here is again a sort of workaround to get some sort of async/non-polling
mode with SMC/HVC. So, to repeat polling mode make absolutely no sense
whatsoever for SMC/OPTEE(based on pure SMC) transports.

> > I believe the same applies to OP-TEE.
> > While OP-TEE now provides a notification mechanism that could, in theory,
> > allow synchronous commands to be treated in a quasi-asynchronous manner, I
> > strongly doubt that the current SCMI-over-OP-TEE implementation behaves this
> > way, given that it ultimately reaches the secure side via an SMC call.
> > 
> > > I don't think a warning is justified, if the behavior follows the
> > > specification. But I do agree the behavior is ... suboptimal.
> > > 
> > 
> > The specification does not address SMC or OP-TEE transports, placing them
> > outside its scope and likewise these DT bindings.
> 
> I believe the shmem transport includes the SMC and OPTEE ones, right ?
>

Yes, but the expectation when the SMC completes is to have the shmem to be
owned by the OS(except that irq workaround case). Again the OPTEE/SMC is
completely out of spec, but I agree the SHMEM behaviour must conform to the
specification.

> > Consequently, what we
> > decide here in this discussion effectively defines the expected behavior in
> > this context, in my view. So I would like to start with minimal possible
> > coverage, why do you think that is not a good idea here ?
> 
> I would argue the current implementation covers pretty much every transport
> which could ever need to do polling on shmem, so the implementation is
> generic and inline with the specification. Also, the current implementation
> is some 20 lines, so I think it is minimalistic?
> 
> What would you propose we do here ?
> 

Yes it can be minimalistic but not restrictive. As I already clearly mentioned
I don't see it makes any sense to enable this for SMC/OPTEE. Lets start with
just mailbox to start with and extend to other transports if and when needed.
It would be good to impose that restriction in the binding as well but that
is not a must IMO. I am fine if the bindings for whatever reasons(though I
don't see the need) to apply for any transport.

-- 
Regards,
Sudeep

