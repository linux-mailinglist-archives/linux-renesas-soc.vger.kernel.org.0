Return-Path: <linux-renesas-soc+bounces-25502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC9C9CB1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 19:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE96E3A69B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 18:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7C72D1932;
	Tue,  2 Dec 2025 18:55:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB16828C00C;
	Tue,  2 Dec 2025 18:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764701728; cv=none; b=TlrPaHScQ151Wc8hHDKA94QOB4jBuy36TG95dz9mnhiKNPfG/wzbhc95CX+/6rBrcgAkDsCUwoQVNflzhSfxCg7KGvGDoDB9BfdKZ57OlxywMTJ4cJ8Agtrqcw7JzEQzGXo58sRaCdlwQvVvdRQr96hDyC0yQluNv9Okfkr2rgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764701728; c=relaxed/simple;
	bh=xK3/6FE2i0Zrl04lGvDZqMYCpQ18o+Z6CXfUzq6oh/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCyphusxu5ZSoP2BfxX8EuEi7Gv1weC8Z9s9l68tyYadsGkHYRsLQUgOmWq5gOw8qDwKqtA1JFlZw2gEKVdzMWHqCwtOWI6DpCBHiOVmTGpkEWacBZ+AlBnNDPsvx76Y9VpJKX/uFE2ulgaMfPNTObM+7jLw6NkNbR5z3KGgjPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6FA41477;
	Tue,  2 Dec 2025 10:55:18 -0800 (PST)
Received: from bogus (unknown [10.57.40.235])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E21F73F66E;
	Tue,  2 Dec 2025 10:55:23 -0800 (PST)
Date: Tue, 2 Dec 2025 18:55:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <aS82GSN8c2SnRn4S@bogus>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto>
 <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
 <5ae0a793-d3e7-45d1-bf5c-3c46593d1824@mailbox.org>
 <aRW7BZimWdpq4TyX@pluto>
 <20251202-evasive-neon-rhino-d2745e@sudeepholla>
 <66257fcf-9024-454f-b776-4ba584963ebe@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66257fcf-9024-454f-b776-4ba584963ebe@mailbox.org>

On Tue, Dec 02, 2025 at 05:36:53PM +0100, Marek Vasut wrote:
> On 12/2/25 3:52 PM, Sudeep Holla wrote:
> 
> Hello Sudeep,
> 
> > > > While I was going through the SCMI spec, DEN0056F , page 209 , section "4.1
> > > > Shared memory based transport" , bullet • Completion interrupts, I found it
> > > > explicitly states:
> > > > 
> > > > "
> > > > This transport supports polling or interrupt driven modes of communication.
> > > > In interrupt mode, when the callee completes processing a message, it raises
> > > > an interrupt to the caller. Hardware support for completion interrupts is
> > > > optional.
> > > > "
> > > 
> > > Oh, yes...I knew that...it is just that till now, no systems were really
> > > ever developed that lacked the completion IRQ as a whole, it was, till now,
> > > more of a case of having the capability NOT to use it selectively at runtime
> > > and instead use polling when wanted (like for clock ops in ISR context)
> > > 
> > 
> > Indeed.
> > 
> > > I am not sure what is the reason why this only-polling scenario was never
> > > supported in the HW description, this indeed pre-dates my work on SCMI....
> > > ...I would/will check with Sudeep, when he's back, what are the reasons for
> > > this (if any)...
> > > 
> > 
> > As you mentioned earlier, no platform has required this before. I’m fine with
> > adding it, but we need to be more explicit about what it implies for SCMI. The
> > transport may be shared with other system components, and enforcing polling
> > for SCMI while the same transport generates interrupts for another user could
> > lead to issues.
> 
> How do you imagine this -- a transport shared with other components, one
> which does generate IRQs and one which does not -- would look like ? Can you
> think of an example ?
> 

Consider a system where a mailbox controller is present and one channel is
used for SCMI communication, while another channel is used for an unrelated
purpose. If both channels share the same interrupt line, and the other use
case enables interrupt mode on its channel, what would be the impact on the
SCMI-specific channel?

I am aware of systems that implement such sharing, which is why I prefer to be
explicit that this type of design is challenging to support within this
binding. The intent is to support only minimal, constrained cases - essentially
systems that are already somewhat broken. I do not see value in broadening the
binding to cover every conceivable scenario.

> > Clearly defining these constraints would be helpful. It may also be useful to
> > note that this is primarily intended for mailbox transports, if that’s
> > accurate. Alternatively, we could keep the DT binding definition broader but
> > emit warnings when a transport other than mailbox is used. That approach might
> > make it easier to move forward.
> 
> DEN0056F refers to this polling mode in Shared memory based transports, that
> can be other than mailbox transports, it includes e.g. SMC or OPTEE
> transports.
> 

However, polling does not make sense in the context of SMC. Once control
returns from an SMC call, the command has completed. What form of polling in
an SMC workflow do you have in mind? I believe the same applies to OP-TEE.
While OP-TEE now provides a notification mechanism that could, in theory,
allow synchronous commands to be treated in a quasi-asynchronous manner, I
strongly doubt that the current SCMI-over-OP-TEE implementation behaves this
way, given that it ultimately reaches the secure side via an SMC call.

> I don't think a warning is justified, if the behavior follows the
> specification. But I do agree the behavior is ... suboptimal.
> 

The specification does not address SMC or OP-TEE transports, placing them
outside its scope and likewise these DT bindings. Consequently, what we
decide here in this discussion effectively defines the expected behavior in
this context, in my view. So I would like to start with minimal possible
coverage, why do you think that is not a good idea here ?

-- 
Regards,
Sudeep

