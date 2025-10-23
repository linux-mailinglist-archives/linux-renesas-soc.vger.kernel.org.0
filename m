Return-Path: <linux-renesas-soc+bounces-23527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF430C01DEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F5AC3BB94F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E5732C923;
	Thu, 23 Oct 2025 14:36:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E77C314B63;
	Thu, 23 Oct 2025 14:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761230207; cv=none; b=aKRW11EMpcRdzNG1x/QQdRGBV3uGSQtpE2QbBMADLnjayMU9tCUbe8AZJKYUbeEAcWsQlzgY2WF3h9bzJ4GNUfg+SAX+h4NGa0oohH4ZRruXVVg1aUCXOPblOSzNHRZ/7fYHwZSFar5N9wDU4TWDB/qyhy9qXewq3T72lqjxk5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761230207; c=relaxed/simple;
	bh=dSXcsze+HUi2B1uX8fAzZYbZ2rL8o7EOHqjEYcyRdSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4vqABUzxwFurJQBPNLIj/NC/W7Jczx7BBt7/wdeTOG7izMFPitkb2QpGiD5U1BAHNIGDXQOuBtwuzXThREQzECOPYapcsKx2AQkv+r99h75/PZ2VOKZ8LMOSSj0X3aOjIEliJxmVlmyK2XsDYPeyu/pJR6/OioSwmLgO6a7wQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 943321516;
	Thu, 23 Oct 2025 07:36:37 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 654893F59E;
	Thu, 23 Oct 2025 07:36:43 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:36:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <20251023-illustrious-almond-catfish-5010eb@sudeepholla>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
 <066449c8-4bca-41f1-990e-53d7672e3c0a@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <066449c8-4bca-41f1-990e-53d7672e3c0a@mailbox.org>

On Thu, Oct 23, 2025 at 03:42:02PM +0200, Marek Vasut wrote:
> On 10/23/25 3:16 PM, Sudeep Holla wrote:
> 
> Hello Sudeep,
> 
> > > +  arm,poll-transport:
> > > +    type: boolean
> > > +    description:
> > > +      An optional property which unconditionally forces polling in all transports.
> > > +      This is mainly mean to work around uncooperative SCP, which does not generate
> > > +      completion interrupts.
> > > +
> > 
> > Could you please clarify which platform and transport this change pertains to?
> 
> Renesas X5H with older SCP firmware , accessible via mailbox.
> 

So mailbox transport it is. Thanks for the info.

> > Introducing a property that enforces unconditional polling across all
> > platforms is not ideal - particularly if this is intended as a workaround
> > for a platform- or firmware- specific issue. Such implementations often get
> > replicated across platforms without addressing the root cause, leading to
> > wider inconsistencies.
> 
> The root cause is being addressed already, this is meant to keep the older
> SCP version operable.
> 

Good to know.

> > It would be preferable to scope this behavior using the platform’s compatible
> > string. This approach ensures the workaround is applied only to the affected
> > platform and prevents it from being inadvertently enabled elsewhere, unless
> > another platform intentionally uses the same compatible string (which seems
> > unlikely).
> 
> This is not platform-specific issue. SCMI provider which fails to generate
> interrupts can appear on any platform, using either transport, that is why I
> made the property generic.
> 

Good point, but ideally this is property of the transport itself. For example,
what does this "arm,poll-transport" can possibly mean for SMC/Optee transport ?

I understand this is a valid request, just not sure if this is the right way
to solve( i.e. Adding this property in the SCMI node in the proposed form).

Let me think and give others a chance to express their opinion.

-- 
Regards,
Sudeep

