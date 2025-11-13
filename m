Return-Path: <linux-renesas-soc+bounces-24550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF8DC5718D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 12:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5CCE134D22B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 11:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6213385AA;
	Thu, 13 Nov 2025 11:03:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB7D33858A;
	Thu, 13 Nov 2025 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763031819; cv=none; b=phPhqyso4e8YGeSO2FVh1xrpZtiYXy7euJU8evi1ZOdtEz4gtSNuJN6Ldi+yFAzifkvEyIWQoGYOAj1gxFXnSETgNR+OE8Gy+TuU2FA/HEulthr0lqoZ6nU9aOqP/ezPQB764FwVWYr4R2Kk1wmZO5hf1glZuo2RPyhS6ym+6uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763031819; c=relaxed/simple;
	bh=3HHbn8SmWeQ7e6ONE8U1Lm7cOSkVRQmJs+OzzxqfvFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnBVoCYh8ivY6IY4RNU3hmEly+1P8iSOZjfQULLpXbpAjpX3EgrPFEennJOUgqYWx9m/3hL++7wOIOE2OeX/4FJpRLsMQG3e9OAcfyvpRwqF17+vemQEM4iYjNEGs2TGuEViIQ4a9BlTUzTVuygJmapRSVsZO5hyWd3C7h1zucQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9CDC12FC;
	Thu, 13 Nov 2025 03:03:29 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11CCA3F66E;
	Thu, 13 Nov 2025 03:03:35 -0800 (PST)
Date: Thu, 13 Nov 2025 11:03:33 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <aRW7BZimWdpq4TyX@pluto>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto>
 <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
 <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>

On Thu, Oct 30, 2025 at 01:52:42AM +0100, Marek Vasut wrote:
> On 10/23/25 4:00 PM, Marek Vasut wrote:
> 
> Hello again,
> 

Hi,

bit of a late reply...

> > > On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
> > > > Document new property arm,poll-transport, which sets all SCMI
> > > > operation into
> > > > poll mode. This is meant to work around uncooperative SCP
> > > > implementations,
> > > > which do not generate completion interrupts. This applies
> > > > primarily on mbox
> > > > based implementations, but does also cover SMC and VirtIO ones.
> > > 
> > > Hi,
> > > 
> > > ..indeed I was thinking a while ago about exposing the existing
> > > force- polling
> > > switch but in my case it was purely a testing-scenario
> > > configuration, so a
> > > no-no for the DT, things are different if you have to describe an HW
> > > that has
> > > no completion IRQ also on the a2p channel...
> > 
> > Correct, at least until the SCP on this hardware is updated.
> > 
> > > ...having said that, though, usually polling-mode is reserved to a few
> > > selected commands in a few chosen scenarios (as you may have seen),
> > > 'carpet-polling' non-for-testing for all the commands on A2P seems a lot
> > > inefficient and heavy...is it really a viable solution ? or these
> > > systems use such a low rate of SCMI messages that polling after each and
> > > every message is negligible ?
> > > 
> > > ..just to understand the context...
> > 
> > These systems are early in development and it is likely that the SCP
> > will be updated to generate interrupts properly. Currently, this is not
> > the case, hence the carpet-polling, until this is resolved.
> 
> While I was going through the SCMI spec, DEN0056F , page 209 , section "4.1
> Shared memory based transport" , bullet • Completion interrupts, I found it
> explicitly states:
> 
> "
> This transport supports polling or interrupt driven modes of communication.
> In interrupt mode, when the callee completes processing a message, it raises
> an interrupt to the caller. Hardware support for completion interrupts is
> optional.
> "

Oh, yes...I knew that...it is just that till now, no systems were really
ever developed that lacked the completion IRQ as a whole, it was, till now,
more of a case of having the capability NOT to use it selectively at runtime
and instead use polling when wanted (like for clock ops in ISR context)

I am not sure what is the reason why this only-polling scenario was never
supported in the HW description, this indeed pre-dates my work on SCMI....
...I would/will check with Sudeep, when he's back, what are the reasons for
this (if any)...

Thanks,
Cristian

