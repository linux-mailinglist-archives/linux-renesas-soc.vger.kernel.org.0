Return-Path: <linux-renesas-soc+bounces-26609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B66D13D7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 16:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F02D030060D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 15:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B2C3624B3;
	Mon, 12 Jan 2026 15:58:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF18C2EBDE9;
	Mon, 12 Jan 2026 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768233495; cv=none; b=Dvi4IorpFfC/Lo7vKwS6/nOrmp67f/SWLQciKIHsgEwHmWmPiIQV+lSH3TrgUOQJoe9LFlJyQQ/yqJYB7Trk35i2Q4OE0XrKGvDsbDVfELXzdcu/fN16Vuepm/SaQqhHV8pdXS2Hor/bMtdXs8bvts6Q5rcYBarJTOIpCmqqlH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768233495; c=relaxed/simple;
	bh=Sdkr7qzjfqQlrYTa6bjjkQkt48PZQzLtQga9jTEPSQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r133oAHMD7QztE0t9OIPo2mK8X2JRHIxHWl2t12bZouw0cCyZf7mldSMfsKpuddaKuRrz59uJiEwrm0cwvmYC4hDYEdjllXWW+pZP67WnoZeKVjlvjR/MuEEcU/0Jhzp2MUTvfps1mNvTLR+VFNjDWzcJlaGx9Cijx3euKsRt7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51B16497;
	Mon, 12 Jan 2026 07:58:06 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B15533F59E;
	Mon, 12 Jan 2026 07:58:11 -0800 (PST)
Date: Mon, 12 Jan 2026 15:58:09 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: Implement arm,poll-transport
 property
Message-ID: <aWUaES-culTeUfjD@bogus>
References: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
 <20251231213016.185575-2-marek.vasut+renesas@mailbox.org>
 <aWTjs1Y9yoz1k4Ry@bogus>
 <aWTu4o4Z59QQOc2O@pluto>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWTu4o4Z59QQOc2O@pluto>

On Mon, Jan 12, 2026 at 12:53:54PM +0000, Cristian Marussi wrote:
> On Mon, Jan 12, 2026 at 12:06:11PM +0000, Sudeep Holla wrote:
> > On Wed, Dec 31, 2025 at 10:29:19PM +0100, Marek Vasut wrote:
> > > Implement new property arm,poll-transport, which sets all SCMI operation into
> > > poll mode. This is meant to work around uncooperative SCP implementations,
> > > which do not generate completion interrupts. This applies to mbox/shmem based
> > > implementations.
> > > 
> > > With this property set, such implementations which do not generate interrupts
> > > can be interacted with, until they are fixed to generate interrupts properly.
> > > 
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > ---
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > > Cc: arm-scmi@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > ---
> > > V2: Drop no IRQ handling from SMC transport and update commit message
> > > ---
> > >  drivers/firmware/arm_scmi/common.h | 4 ++++
> > >  drivers/firmware/arm_scmi/driver.c | 4 ++++
> > >  2 files changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > > index 7c35c95fddbaf..7c9617d080a02 100644
> > > --- a/drivers/firmware/arm_scmi/common.h
> > > +++ b/drivers/firmware/arm_scmi/common.h
> > > @@ -235,6 +235,9 @@ struct scmi_transport_ops {
> > >   *		      to have an execution latency lesser-equal to the threshold
> > >   *		      should be considered for atomic mode operation: such
> > >   *		      decision is finally left up to the SCMI drivers.
> > > + * @no_completion_irq: Flag to indicate that this transport has no completion
> > > + *		       interrupt and has to be polled. This is similar to the
> > > + *		       force_polling below, except this is set via DT property.
> > >   * @force_polling: Flag to force this whole transport to use SCMI core polling
> > >   *		   mechanism instead of completion interrupts even if available.
> > >   * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
> > > @@ -254,6 +257,7 @@ struct scmi_desc {
> > >  	int max_msg;
> > >  	int max_msg_size;
> > >  	unsigned int atomic_threshold;
> > > +	bool no_completion_irq;
> > >  	const bool force_polling;
> > 
> > My preference would be to reuse `force_polling` for this. We need to drop
> > const but that should be OK. Anyways I would like to know if Cristian thinks
> > otherwise for any reasons I might be missing to see.
> 
> I would rather keep the 2 things separate since force_polling is more of
> a brutal low level debug/test facility and, even though it basically
> produces the same result as the new @no_completion_irq, if we remove it
> and unify it in a single boolean that can be overriden from the DT we end
> up in a situation in which we cannot anymore easily force_polling by
> switching the flag in the code since it could be overridden by a
> conflicting 'arm,poll-transport' DT setup. (and you have to patch DT
> for testing)
> 
> So if we have one single underlying boolean (e.g. 'poll') and by any chance
> we end up with a DT containing:
> 
> 	arm,poll-transport = false
> 
> we cannot anymore override the condition by forcing in the code
> 
> 	poll = true,
> 
> since it would be switfly overridden by the DT prop.
> 
> Also semantically force_polling express much more the situation.
> 
> Anyway...I may be overthinking or missing something.
>

Understood, looking at raw I did get a sense of this but didn't spend much
time and thought of asking you. So, all good. Let's not mix them together
then. Thanks for the details!

-- 
Regards,
Sudeep

