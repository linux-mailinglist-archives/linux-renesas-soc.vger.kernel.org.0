Return-Path: <linux-renesas-soc+bounces-26889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6828D28438
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 20:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C634A300A37D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 19:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3066B31AA81;
	Thu, 15 Jan 2026 19:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEPlgZRn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB512E0925;
	Thu, 15 Jan 2026 19:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507091; cv=none; b=uaW17YTDWNKf/9/hiAfRSk6vY0XH4JNAIDpO86wyLKElfOwfQyqv/1/tLW0L1cXrjlM8yRc3MasFEoEPg2pOipcZGN3o/RbdrV861gPT2FVTaj+DhNM2UeQ1pyx93SgH/PDqkiFFYWpHpgMCoMhgy8IZ8sdvZoD+EIys2k7bAyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507091; c=relaxed/simple;
	bh=CEPptNSL/+FCLqFJSQnu0FQS/H+mROxmw2mYR4q5S3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QG9vDpyRPQe/rYJ4p2URiuHeXQFleAKO+Qe4PKEG4lraVqzpaN0ecr2s2nqy/akaNo4eYInFKpWPe6P0/ndogcOsnXm1TCNW1zcUu9TvTnuLrISO3KhYFlrqsRV0baMTKAriIGwKPor3AuOB0odyO13zZxQuIPi1chuXaJYqqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEPlgZRn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF78C16AAE;
	Thu, 15 Jan 2026 19:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768507090;
	bh=CEPptNSL/+FCLqFJSQnu0FQS/H+mROxmw2mYR4q5S3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEPlgZRng09trAPveVtwXvgcHKps1k0fUJ2zhoqG2dKqvdXMhqvQMl51wRaoyBLIq
	 6PaCs+NTIV2LsMOFdLWHKnqVLO8sL8OlvqIXKxyKrr+oEvuYQ64Ray+ESEQYWace4u
	 a4fVxB6EE4jb+b3CRqoTyQ/TMkvpHKeJL4piRC+YoNd+0BJkrGHKTw9D53tWz+tXtA
	 0vlbdsZwn1UNywwkuVmfbMoB1LKByrZJgnb5ACab9yDFChRekuV03d3Xg8p2rQxaXP
	 awilHQsY9PaIpmWyazw6cRhqIS0SkwUdeVCsCou7+Aki9k8Al18/g8hU4u3u/fpb47
	 KydNrFr4yLZfA==
Date: Thu, 15 Jan 2026 13:58:09 -0600
From: Rob Herring <robh@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,no-completion-irq property
Message-ID: <20260115195809.GA1086054-robh@kernel.org>
References: <20260115004921.548282-1-marek.vasut+renesas@mailbox.org>
 <aWjWLFi6xUIn3_GQ@bogus>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWjWLFi6xUIn3_GQ@bogus>

On Thu, Jan 15, 2026 at 11:57:32AM +0000, Sudeep Holla wrote:
> On Thu, Jan 15, 2026 at 01:48:56AM +0100, Marek Vasut wrote:
> > Document new property arm,no-completion-irq, which sets all SCMI
> > operation into poll mode. This is meant to work around uncooperative
> > SCP implementations, which do not generate completion interrupts.
> > This applies primarily on mbox shmem based implementations.
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
> > ---
> >  .../devicetree/bindings/firmware/arm,scmi.yaml        | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > index be817fd9cc34b..46d9a0a9a0e58 100644
> > --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > @@ -146,6 +146,14 @@ properties:
> >        this platform. If set, the value should be non-zero.
> >      minimum: 1
> >  
> > +  arm,no-completion-irq:
> > +    type: boolean
> > +    description:
> > +      An optional property which unconditionally forces polling in all transports,
> > +      meant for hardware which does not generate completion interrupts. This is
> > +      mainly meant to work around uncooperative SCP or SCP firmware, which does
> > +      not generate completion interrupts.
> > +
> 
> I would swap the order of the above two points.
> 
> “This optional property is intended for hardware that does not generate
> completion interrupts and can be used to unconditionally enable forced polling
> mode of operation.”
> 
> You need to update the commit message accordingly. We do not want to indicate
> how this property should be used, as that is left to the implementation. The
> emphasis should be on what this property indicates to its users.
> 
> Please update only if DT maintainers are also in agreement. I have just
> expressed my opinion. IIUC, it is aligned to standard DT binding rules but
> I may be wrong.

Makes sense to me.

With Sudeep's suggestion:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Rob

