Return-Path: <linux-renesas-soc+bounces-23525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A77BFC01C47
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B44CF4E39F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847EE30F55A;
	Thu, 23 Oct 2025 14:30:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD2220A5DD;
	Thu, 23 Oct 2025 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229826; cv=none; b=Rufi6LcfUS1rFA2iOyuiYQi+VqUcXHA/Hi35NL6DEDfZalU6RehLRaESLZOmmfC6tljUGwMMs67DrhOVZvWPOp6HY2RwH5sATYuXEC92b5PGAcwEYBVxCc5b7DwSy2OVDZUigoQk4nTdWlYJD4K+NfjAXVsWiULmVhvNni7z7o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229826; c=relaxed/simple;
	bh=JFCOZUQbUQD4h1HJbFOHVh6F3/wFgQQ9DWQRvQIlVhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlq6LD9gYT2bJeN2WZ50eJB8Zi5y/Glzpb5N88lkanKRh/edZb/fMHbYzBawWL+OK1PuJvbYIq0IL0YXv3YDBSQ13wYJJm/aPd5yt76jjG2sA9f3M1EzHnRKwZsWzEKtJYapMcKC/rSWG26vNxDyW6j7uFUd1o4t4B+BQlbzuak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D13C1516;
	Thu, 23 Oct 2025 07:30:16 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C11683F59E;
	Thu, 23 Oct 2025 07:30:21 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:30:18 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <aPo7-oQq6RskSZ96@pluto>
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

Hi Marek,

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
> > Introducing a property that enforces unconditional polling across all
> > platforms is not ideal - particularly if this is intended as a workaround
> > for a platform- or firmware- specific issue. Such implementations often get
> > replicated across platforms without addressing the root cause, leading to
> > wider inconsistencies.
> 
> The root cause is being addressed already, this is meant to keep the older
> SCP version operable.
> 

If this is the case, at first I would have tempted to say why not use the SCMI
Quirk framework (with needed changes/evolutions), BUT then I realized that being
the Quirk to be applied on the transport there is no way to gather SCMI
Vendor info and versions from the platform, so you would have to match on the
compatible, which is essentially similar approach of having a new DT
prop...just less flexible so I understand the need of your new-prop approach...

...BUT...(maybe a weird idea)...what if we think about enabling:

 - one Quirk EARLY-ON based on the current potentially affected compatibles
   with such a quirk forcing polling ONLY for the BASE Protocol SCMI queries
   so that the SCMI core can gather Vendor Info and versions in any case..
   (this would need the Quirk frmwk to be evolved to support such
    'early-quirks' based on compatibles only)

 - a second regular Quirk, filtered by the just retrieved Vendor INFO and FW
   version to finally decide if the system needs force-polling to be really
   enabled for all the following messages...

... this was you dint even need to ship any new DT

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

So the deployment scenario would be to update new machines with a fully
working SCP FW with completion-IRQ while updating ONLY the DTBs with the
new force-polling property in the older machines with the older
poll-only SCP fw ? (to understand)

Thanks,
Cristian

