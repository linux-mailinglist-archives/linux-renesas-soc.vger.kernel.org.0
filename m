Return-Path: <linux-renesas-soc+bounces-27059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9459D3B339
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 18:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75F043014ACC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 17:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34656311597;
	Mon, 19 Jan 2026 17:03:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2422124BBF4;
	Mon, 19 Jan 2026 17:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768842184; cv=none; b=oqYQly4LQRj+wseObne7tL3mK4jFA+YWuSD6NQIwd8iIkLmtZZJSuVDad7jXTQ1FuhCXeezLk+biKBL3BOI/vZc6tCGJNFdyLgWxKe4PPNlV/YVn/imol31Bb4q6toHSHR2RwLE81kblmZm0RLHvw61Rj6RAjtRASLymEU1anek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768842184; c=relaxed/simple;
	bh=XFthLs5/pgPXTCEknPIP9s+LfJ67tRcBR2V1sNm7llo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvuG2wcIQoqexLUFxvo9G2RUn/l3DCz8JD/qXi9GXGv5zza/z2r7TPIydHxGsbDZOTsCtFo5SPa/BmPwDB3KkMUsGmDmy65aywA9ir+y0X+JMHaUi+w0KNNxED9W8fd0mpQMxhIEuVtNcFKN8bCJ2SzTZnp3PVNwqJ05EfWJd5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29D7E497;
	Mon, 19 Jan 2026 09:02:56 -0800 (PST)
Received: from bogus (e124108.arm.com [10.1.32.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7F0C3F632;
	Mon, 19 Jan 2026 09:03:00 -0800 (PST)
Date: Mon, 19 Jan 2026 17:02:58 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,no-completion-irq property
Message-ID: <aW5jwtoYCFs-Pzpk@bogus>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <aW5hmb9tyw1Gv388@pluto>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5hmb9tyw1Gv388@pluto>

On Mon, Jan 19, 2026 at 04:53:45PM +0000, Cristian Marussi wrote:
> On Sat, Jan 17, 2026 at 02:02:28AM +0100, Marek Vasut wrote:
> > Document new property arm,no-completion-irq . This optional property
> > is intended for hardware that does not generate completion interrupts
> > and can be used to unconditionally enable forced polling mode of
> > operation.
> > 
> > With this property set, such implementations which do not generate
> > interrupts can be interacted with, until they are fixed to generate
> > interrupts properly.
> > 
> > Note that, because the original base protocol exchange also requires
> > some sort of completion mechanism, it is not possible to query SCMI
> > itself for this property and it must be described in DT. While this
> > does look a bit like policy, the SCMI provider is part of the
> > hardware, hence DT.
> > 
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
> > V3: - Reformat the commit message, expand property description to
> >       explicitly spell out this is hardware description.
> >     - Rename property from arm,poll-transport to arm,no-completion-irq
> > V4: - Update first paragraph of commit message and property description
> >     - Add RB from Rob
> > ---
> >  .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > index be817fd9cc34b..d06cca9273c48 100644
> > --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > @@ -146,6 +146,13 @@ properties:
> >        this platform. If set, the value should be non-zero.
> >      minimum: 1
> >  
> > +  arm,no-completion-irq:
> > +    type: boolean
> > +    description:
> 
> Shouldn't these two points have to be swapped as per Sudeep and Rob
> suggestions ?
> 
>     description:
> 	....
>     type: boolean
> 

I was just referring to the points covered under the `description` and not
the order of `type` and `description`. I am not sure if there is any such
requirement as well. I am happy with this version, but this needs to wait
for the merge window following the next as I have already sent the PR to
SoC teams.

-- 
Regards,
Sudeep

