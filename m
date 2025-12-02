Return-Path: <linux-renesas-soc+bounces-25494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF2AC9BDC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 15:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9FE33A7D4C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 14:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF5B23ABA0;
	Tue,  2 Dec 2025 14:52:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B892192FA;
	Tue,  2 Dec 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764687167; cv=none; b=rU236agf3bWPG5Y+PGZk28xxFDFNiwPFgJDGT8JE8cQT9ggJMFs1A0A1nsoW68BbAbV1KdWl1DMknOhvgBRC3QzXrWg5bZPXacOYYYpu/mF3X3Pa+P6JErlOPqcoBD6OOjHyVUjOq/ex/ZTrrMq/945SYynghVP+QEtiqwdyIjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764687167; c=relaxed/simple;
	bh=CQVlkrSJxA+0hRwWppXFxiDHphDTCVurl1acBkGt3L8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkLiEwflAfTBpgOvGHjnzzdAPegCBsTA7RK9zlF9QJXZgBhcHEGYXQGeAA8z2Ma1ZPo6qhq97s4iknESamSVY5Wxo9Sdjb0iDatnLkTk/mTABt16mAkc6Q+VFCvOjepfM8o+bfKdGl9HYt49N9ZqQXbbIrkv6iEo5a3JYA13Ehk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24A211477;
	Tue,  2 Dec 2025 06:52:37 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A91C3F66E;
	Tue,  2 Dec 2025 06:52:42 -0800 (PST)
Date: Tue, 2 Dec 2025 14:52:39 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, <arm-scmi@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <20251202-evasive-neon-rhino-d2745e@sudeepholla>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto>
 <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
 <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>
 <aRW7BZimWdpq4TyX@pluto>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRW7BZimWdpq4TyX@pluto>

On Thu, Nov 13, 2025 at 11:03:33AM +0000, Cristian Marussi wrote:
> On Thu, Oct 30, 2025 at 01:52:42AM +0100, Marek Vasut wrote:
> > On 10/23/25 4:00 PM, Marek Vasut wrote:
> > 
> > Hello again,
> > 
> 
> Hi,
> 
> bit of a late reply...
> 
> > > > On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
> > > > > Document new property arm,poll-transport, which sets all SCMI
> > > > > operation into
> > > > > poll mode. This is meant to work around uncooperative SCP
> > > > > implementations,
> > > > > which do not generate completion interrupts. This applies
> > > > > primarily on mbox
> > > > > based implementations, but does also cover SMC and VirtIO ones.
> > > > 
> > > > Hi,
> > > > 
> > > > ..indeed I was thinking a while ago about exposing the existing
> > > > force- polling
> > > > switch but in my case it was purely a testing-scenario
> > > > configuration, so a
> > > > no-no for the DT, things are different if you have to describe an HW
> > > > that has
> > > > no completion IRQ also on the a2p channel...
> > > 
> > > Correct, at least until the SCP on this hardware is updated.
> > > 
> > > > ...having said that, though, usually polling-mode is reserved to a few
> > > > selected commands in a few chosen scenarios (as you may have seen),
> > > > 'carpet-polling' non-for-testing for all the commands on A2P seems a lot
> > > > inefficient and heavy...is it really a viable solution ? or these
> > > > systems use such a low rate of SCMI messages that polling after each and
> > > > every message is negligible ?
> > > > 
> > > > ..just to understand the context...
> > > 
> > > These systems are early in development and it is likely that the SCP
> > > will be updated to generate interrupts properly. Currently, this is not
> > > the case, hence the carpet-polling, until this is resolved.
> > 
> > While I was going through the SCMI spec, DEN0056F , page 209 , section "4.1
> > Shared memory based transport" , bullet • Completion interrupts, I found it
> > explicitly states:
> > 
> > "
> > This transport supports polling or interrupt driven modes of communication.
> > In interrupt mode, when the callee completes processing a message, it raises
> > an interrupt to the caller. Hardware support for completion interrupts is
> > optional.
> > "
> 
> Oh, yes...I knew that...it is just that till now, no systems were really
> ever developed that lacked the completion IRQ as a whole, it was, till now,
> more of a case of having the capability NOT to use it selectively at runtime
> and instead use polling when wanted (like for clock ops in ISR context)
> 

Indeed.

> I am not sure what is the reason why this only-polling scenario was never
> supported in the HW description, this indeed pre-dates my work on SCMI....
> ...I would/will check with Sudeep, when he's back, what are the reasons for
> this (if any)...
> 

As you mentioned earlier, no platform has required this before. I’m fine with
adding it, but we need to be more explicit about what it implies for SCMI. The
transport may be shared with other system components, and enforcing polling
for SCMI while the same transport generates interrupts for another user could
lead to issues.

Clearly defining these constraints would be helpful. It may also be useful to
note that this is primarily intended for mailbox transports, if that’s
accurate. Alternatively, we could keep the DT binding definition broader but
emit warnings when a transport other than mailbox is used. That approach might
make it easier to move forward.

-- 
Regards,
Sudeep

