Return-Path: <linux-renesas-soc+bounces-28072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INHPB/DaiWlFCgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 14:02:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 109FD10F559
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 14:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 795AC3003310
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 13:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEC426E71F;
	Mon,  9 Feb 2026 13:00:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B019C1C8603;
	Mon,  9 Feb 2026 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770642034; cv=none; b=kbbNsQ9K8rKbVKiorPP0eBn0V7Z1VX1YA2rUL/ZxA9kIRnN+DsW0GE+efMMWM2iclBhKGjIY5bG8vy3BEbxfifhSwPBqQSVdpxA56Pdgl/lx0c8E4G0mDRVNSBDk/i7U2KYjCSLR1CyOyRDJGWAXL4ODwSSHVbWuBHWrC1p2avo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770642034; c=relaxed/simple;
	bh=MqENoUlrZcSSK0UNEd5cVb/7bfOg7Y8qXBBaAL7dvvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivCLFdxy3Jd5eSuG8RJ2XrmmKda2a7logGqC4hJLSboUOYyAQ12+vA6G1jRI+7xyWDYXBqx+p0oFzj6LleZSh9wv8wia09KZGybype+uW0/b1arfAwQJqXwJdDBPm169hQWHObh4McPLUwG27R/7c93Lpv0v9lLyaYX48qEGk7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AB09339;
	Mon,  9 Feb 2026 05:00:26 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCACE3F740;
	Mon,  9 Feb 2026 05:00:30 -0800 (PST)
Date: Mon, 9 Feb 2026 13:00:23 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
Message-ID: <aYnaZ_SrH55LumeH@pluto>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
 <aW5ifVcxVf6uux3m@pluto>
 <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
 <aYm9Waibey1yG1o4@ninjato>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYm9Waibey1yG1o4@ninjato>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28072-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,mailbox.org:email]
X-Rspamd-Queue-Id: 109FD10F559
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 11:56:25AM +0100, Wolfram Sang wrote:
> Hi all,
> 
> > > > Implement new property arm,no-completion-irq, which sets all SCMI
> > > > operation into poll mode. This is meant to work around uncooperative
> > > > SCP implementations, which do not generate completion interrupts.
> > > > This applies to mbox/shmem based implementations.
> > > > 
> > > > With this property set, such implementations which do not generate
> > > > interrupts can be interacted with, until they are fixed to generate
> > > > interrupts properly.
> > > > 
> > > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > > ---
> 
> ...
> 
> > > 
> > > LGTM.
> > > 
> > > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> > 
> > Is there anything left to do with these patches, or can this now be picked
> > up ?
> 
> Would love to see this going in. I also work with the firmware which
> needs this functionality.

I have not seen anymore push back around this, but I think it was late
anyway to be picked up as an update for this cycle given that it was
already -rc6 when the last series landed...so I guess it could picked up
now for the next cycle ...but I have not checked with Sudeep..

Thanks,
Cristian

