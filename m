Return-Path: <linux-renesas-soc+bounces-26610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E103D13DC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 17:02:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 094AB301FFBB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 16:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7971E364035;
	Mon, 12 Jan 2026 16:02:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1CF2C029C;
	Mon, 12 Jan 2026 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768233755; cv=none; b=fy9pvHtM77qKAtgrmhtNpslAb/8b+AIieO3RKD6eK88jfgNiv5/l4fOM3tvOkJ8eU8iGeN3gQK+lPu6sDcRLPebpOcPhHTKr4FfdKYpQG5sDWK0t5Y5DOMrWCtdPtOC9RGEmpoQk5ZVJ8FarPs0MF4zkktF5ZP9bCLn+exJb808=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768233755; c=relaxed/simple;
	bh=r7W/5Rvn8GXF8i+ZSGISxrn/JcAZLLE2wuXZidCV3hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7k/UgiFYZLJDQAxpjG3P9rc6PWia9W63AJfEH2lzCoC9BrmYKhpyIXthwj3v2LQW1NpcwPsLroK/+dpU9/EZ0rp0pv3PnUUGLXrGFN2RT2SkNaNpwqUi4zAY+jYFlvCwtL8+DKLH5qKqrR6ehz+jHqefoI74vfVDY9/gWZCAE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9745497;
	Mon, 12 Jan 2026 08:02:26 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B4AC3F59E;
	Mon, 12 Jan 2026 08:02:32 -0800 (PST)
Date: Mon, 12 Jan 2026 16:02:29 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <aWUbFb0q2-XuAySm@bogus>
References: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
 <20260102-masked-spirited-labrador-33eae0@quoll>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102-masked-spirited-labrador-33eae0@quoll>

On Fri, Jan 02, 2026 at 12:39:12PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Dec 31, 2025 at 10:29:18PM +0100, Marek Vasut wrote:
> > Document new property arm,poll-transport, which sets all SCMI operation into
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
> > poll mode. This is meant to work around uncooperative SCP implementations,
> > which do not generate completion interrupts. This applies primarily on mbox
> > shmem based implementations.
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
> > V2: s@mean@&t and limit poll transport to mailbox/shmem only
> > ---
> >  .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > index be817fd9cc34b..f4bf4173c5c7e 100644
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
> > +      This is mainly meant to work around uncooperative SCP, which does not generate
> 
> Also not wrapped.
> 
> Anyway, you described the desired Linux feature or behavior, not the
> actual hardware. The bindings are about the latter, so instead you need
> to rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.
> 

I agree with this assessment. Rephrasing the property to reflect the actual
hardware/firmware characteristics makes more sense. Something along the lines
of `arm,no-completion-interrupt`, or a similar name, would better capture the
underlying reality, namely that the platform or firmware does not generate a
completion interrupt without encoding OS-specific policy or behavior.

-- 
Regards,
Sudeep

