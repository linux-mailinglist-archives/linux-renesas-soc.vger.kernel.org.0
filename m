Return-Path: <linux-renesas-soc+bounces-34956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FmsQI42XT2qokQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 14:43:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B954731211
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 14:43:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="V6Zu/moV";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDCBD303ED92
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 12:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254613EC2DE;
	Thu,  9 Jul 2026 12:42:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6501A0BF1;
	Thu,  9 Jul 2026 12:42:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600923; cv=none; b=Ewj8dpcItj1g37sJ30/E5YNyr6PF3thlydETTXEyWK+SgsNTHEgaHvdD/+5+EYp2Aa6OdqXhugxxnsuAxWzh0qGLEQgTfK92fmNe5XbZhZ79o5n35L27bboXpvLfSrEu0b3cxVvf6h5LUkcn/b2mpQEP6V5+33avHPBZF4X3z1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600923; c=relaxed/simple;
	bh=2MCe7VGg9C5eHcivd6H/L/FitdOf5Z7bQBysBSZUxNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZiNzvJO5mKQd4IT1xvrfCEYGmeXFaWnKjAM2ET09jtkp65zBymE0umHpC71AemBDKQ978gky8aXC3xRnQLHUBBm1UjzmUGFWvkfaegvak8U6gMPBCjf5FUlS2yKSUhB9y4z87HQ7i5X5n8ZFtrNXqmxAn3wwbaajBWOKjuYavs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6Zu/moV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03BB1F000E9;
	Thu,  9 Jul 2026 12:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600921;
	bh=wUBlcEnGApt/7Mw66KcgTZ0NsDullSXiDqZImdqYWzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V6Zu/moVwwHFxIa4gm4Zz4rPu8o1umr1KjhPuYvfpRLTRGb6BufJQB4IdPCXCaviJ
	 UF7JzVSuiDP91dTU2vbj5JGzg8vACiiqi/0aZ+a6Sgub9oS20DzsajelCtk0EPZJyX
	 6zVikU6GJIwbY34RGJyotbcXCMhyHtcpUaRE3a/xUbsPJKYeG06Nj2Tzek/U4ToyM2
	 yRyLh7GXzbt+0mgjpiSlfU9I1z8Q2PuUU6AdAGdULocfMaHTxje0r7GPdoG1ocuX9m
	 jza0pNn5wRPE395q4eLOBJkH7a7XCFlgMWqV0GJmeKVqf23q00WZnm7RNgLWl7q8dz
	 Ax0roqnXc4Uig==
Date: Thu, 9 Jul 2026 14:41:50 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
Message-ID: <c6btcryv3ziapzdktqqxd7ucrlt42omlqfhduld2snzqlxdj4y@spvm4or5eacb>
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
 <ybnitlgx3dcqsesubz6jz7pn6snseuxhtz564tinbtvukianaq@33ubmcynyqmt>
 <c12941e4-3715-404e-b674-090c62b868b8@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c12941e4-3715-404e-b674-090c62b868b8@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:linux-pci@vger.kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34956-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B954731211

On Thu, Jul 09, 2026 at 02:33:22PM +0200, Marek Vasut wrote:
> On 7/9/26 2:19 PM, Manivannan Sadhasivam wrote:
> > On Tue, Jul 07, 2026 at 10:35:38PM +0200, Marek Vasut wrote:
> > > Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
> > > case MSI are enabled and disabled.
> > > 
> > > Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
> > > configured to 32-bit address width for AXI or APB interface.
> > > 
> > > Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
> > > implementation cacheable and shareable limitations.
> > > 
> > > Marek Vasut (5):
> > >    PCI: dwc: Determine whether iMSI is used before calling .init
> > >    PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
> > >    irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
> > >    irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
> > 
> > Is there a functional dependency between irqchip and PCI patches? Since the
> > irqchip patches touch ARM64 Kconfig etc... I'm wondering if it still need to go
> > through PCI tree.
> I do not believe there is.
> 
> These two configure the PCIe controller hardware:
>   PCI: dwc: Determine whether iMSI is used before calling .init
>   PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
> 
> These two fill in GIC ITS quirks:
>   irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>   irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
> 
> This one does yes depend on the two and two patches above, and can only be
> applied once all four aforementioned patches land, otherwise things really
> yes will break:
>   arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes
> 
> Would you like me to split the series up , or can you and Marc (?) pick the
> relevant parts via matching trees ?

I'll merge the PCI patches and it is Thomas who can merge irqchips ones.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

