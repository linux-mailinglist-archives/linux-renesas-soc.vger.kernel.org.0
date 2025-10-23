Return-Path: <linux-renesas-soc+bounces-23510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C15C01861
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 15:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 957B11899974
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B33D3019DA;
	Thu, 23 Oct 2025 13:42:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE2D2797B5;
	Thu, 23 Oct 2025 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226978; cv=none; b=M8iOwWE/bBGQNyF4pNRaUV+QSvVwLktBJhpMvZdXO3tWmjVB3bocM1rQINvHYadjX9l1rqhcRAoEEW/h1UDYio8R3Nt76+rYco3dbo1ryP2LaMdvJ5sTAHJWuQDaZl5yU/hSYBDxvTRPYdaGzhh+y/4o5mUvJK1gI0bFrHTUrKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226978; c=relaxed/simple;
	bh=/xsg0TLHzvgxYs5HRoOUbMcS5K25bglQZR+MM/BiWvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMgY3JjeuVZtIm1/uVDCbxRwWym2sapstDFwnBBmNAoGt8HDomoktqrwK/WDUmcWGSlWffmMwN6X8rM+SmnDt+BsbGIcXUamoLQ39pElHkn/CO7jXsQeDd0Ogf0Ps7KY9Q8QDe4eDbrAMKvDPUrOlPMH/9PdF6RS/JLyCIFmxKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B56271516;
	Thu, 23 Oct 2025 06:42:47 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A791E3F63F;
	Thu, 23 Oct 2025 06:42:53 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:42:50 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: <arm-scmi@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <20251023-active-blue-collie-2978ea@sudeepholla>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-able-fervent-tortoise-e7a6df@sudeepholla>

On Thu, Oct 23, 2025 at 02:16:39PM +0100, Sudeep Holla wrote:
> On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
> > Document new property arm,poll-transport, which sets all SCMI operation into
> > poll mode. This is meant to work around uncooperative SCP implementations,
> > which do not generate completion interrupts. This applies primarily on mbox
> > based implementations, but does also cover SMC and VirtIO ones.
> > 
> > With this property set, such implementations which do not generate interrupts
> > can be interacted with, until they are fixed to generate interrupts properly.
> > 
> > Note that, because the original base protocol exchange also requires some
> > sort of completion mechanism, it is not possible to query SCMI itself for
> > this property and it must be described in DT. While this does look a bit
> > like policy, the SCMI provider is part of the hardware, hence DT.
> > 
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > ---
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: arm-scmi@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> >  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > index be817fd9cc34b..b53754a318ea1 100644
> > --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > @@ -146,6 +146,13 @@ properties:
> >        this platform. If set, the value should be non-zero.
> >      minimum: 1
> >  
> > +  arm,poll-transport:
> > +    type: boolean
> > +    description:
> > +      An optional property which unconditionally forces polling in all transports.
> > +      This is mainly mean to work around uncooperative SCP, which does not generate
> > +      completion interrupts.
> > +
> 
> Could you please clarify which platform and transport this change pertains to?
> 
> Introducing a property that enforces unconditional polling across all
> platforms is not ideal - particularly if this is intended as a workaround
> for a platform- or firmware- specific issue. Such implementations often get
> replicated across platforms without addressing the root cause, leading to
> wider inconsistencies.
> 

Just to clarify what I mean by "enforces unconditional polling" is with the
added DT property only. I understand this is new property and it much be
present in DT to enforce polling, but it can be misused initially for testing
in absence of interrupt support and forgotten in DT. Hence my concern.

-- 
Regards,
Sudeep

