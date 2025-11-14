Return-Path: <linux-renesas-soc+bounces-24616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BD2C5BC70
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 08:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3BC3AAE5F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 07:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF2E2F6587;
	Fri, 14 Nov 2025 07:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XO5VmrZQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B74F2F60AC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 07:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104919; cv=none; b=qsIiO9Tv5uYRfVpCmPqt3Bt+taYV3RQqmMWo+zSLEnEP0xWEJZumE4e4DtB+EwXfyq5EGFzgQ1e1JH4oPs4N4+ppMkHE1X714FArrdoDNwiyrCHSzr0VgcF8PuhydpQJJ/X/BAY0PAodXl2MDTbels/f8w1CCeSZHxL2LOCeKNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104919; c=relaxed/simple;
	bh=y7gpYesgnqca2EwFHAf+F7ifXdMczgjmBt78RExWvME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alFHIBe47YAPtUhTVGizV/B9dwQtEM/qMvNkO6qeY7qrg+yQvjjopphuhHo8+DvR2KBclyB47EBC7+rVU9DOqYNOEDCk31A4i2W077UFKyFAKJzA//Ig8icr17FJb/BHRU/MiXtCuVlLWHIDnsOhza0lZG1UsrvNsH/C1jDxiS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XO5VmrZQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=QrZu68cQFEoaA1tEm+6w22JTgrzxCMVscivrPw9AC
	nU=; b=XO5VmrZQgvsNF2j5p04YVDCNh2RvciAmO6f1YJS5IqilRw55uyiP1OAh8
	aek8Si+4pfrznioXvLbvmq1lUm6VbhZVZMfRtNL+R2nuFR/fPvvCRiStVfNYqtmy
	6hpO5DTIZ0JhQ3EkeGi2DW+C0ZSdUc1v3H9/wwLIhvDOj6Wvtnx2ZE9OoNGk6zWF
	OucX1gMT7WCYU2gcX/jRHCfDTjPVVs6C7jqTldKLejB+GbVbMfvU1wL33kXZU00p
	DEIL/c8DYS1K/ToAM1eUAJs7gzACSR5fNFPYDPEWAT/hE3i0ic1z6rxhvoFXOxWt
	qQtNztQrJKa3w85u8rQCtvjHCoMbQ==
Received: (qmail 2203272 invoked from network); 14 Nov 2025 08:21:53 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Nov 2025 08:21:53 +0100
X-UD-Smtp-Session: l3s3148p1@6ssM2ohDSLIujnuZ
Date: Fri, 14 Nov 2025 08:21:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
Message-ID: <aRbYkXDuHZCCgFe5@ninjato>
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

Hi Cristian, Marek, all,

I am working with Marek on the same project.

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

So, I also read in the spec that completion irq is optional and wondered
why it was not possible to describe that in DT. And while we do strive
to get the SCP fixed alone for technical reasons (it is just better),
the spec doesn't actually require this, right? So, my suggestion for v2
is to reword the commit messages a little. More in the direction of
"support irqless implementations" rather than "support broken FW until
fixed". Or?

> I am not sure what is the reason why this only-polling scenario was never
> supported in the HW description, this indeed pre-dates my work on SCMI....
> ...I would/will check with Sudeep, when he's back, what are the reasons for
> this (if any)...

Cool, thank you. Looking forward to hear about it!

Happy hacking,

   Wolfram


