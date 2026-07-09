Return-Path: <linux-renesas-soc+bounces-34955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id edMtClCaT2oZkwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 14:55:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C5C731440
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 14:55:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Xzjy5hPy;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56342307FC0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 12:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F7E422546;
	Thu,  9 Jul 2026 12:41:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F5423A83;
	Thu,  9 Jul 2026 12:41:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600905; cv=none; b=h0ebnFZrhDNUpa2IfR0Rjm9kc7J06vpeA23dijwYRHm9jBYtOIr3+DOd7R5zeFzwNxfcx+xNjaZ1/db8lk1h+3SsXocOqJ8WhT019RFIwGBsx5vsFR9BQjQ9MchNQVbM5J+2ieyM4UAxDPqE1cnH87IyVbhTehFpfJJY+JSNcz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600905; c=relaxed/simple;
	bh=LvE5Bv+Q9Kb3QhOwyuRjRXb/JhFAVTspcyRqZ8jaZaA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pyDW3kiWtDIp2GcgdxU7svO9HmMjZ922bDRejtstw1bQGB9oNkvc6QzOJk4dKQZCBiVyIiEC4oj+JzSosFlbVEaoX5KEL+LA4uHgdzNcdzlwaS8LSHX8Nq40KxwuSHM8zcg5H5SMD0qokSbYlWBEKOCtzqGYnyDimdlQe8R4CRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xzjy5hPy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90C01F000E9;
	Thu,  9 Jul 2026 12:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600904;
	bh=WQqtsvZ3BMfepcYWgRcnRUjPPP25Gh+uDRBYwRXYJWE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xzjy5hPyo2DjQhrnPLTIzPPYdMyyaV7ZD45/nq1TbE60yWbX/IIB0ild2cKXv5CD+
	 omiPZc+Fjr8HR7CNhBGhSnuUhyEZBmnSAL03WO8W/K/4O1G8U3Y98cDqkD6cJb6GL9
	 0UhM+8nWfaisUyai710fHlLO5QNWvvMlQVtIsL50BuvG1aSdoiKqSfa+rtVbITJmo0
	 prZYGStsyMBKoiyMSzXo/+qM6nj/wW7pCI46zNcGD41ieo0wTPUvgH3ROsJ+PGYya2
	 u9HM1jyNGc/S+KOLm45XYmTi/mcBHMmb9W26tP6nOdMyYvzqkGnYsLRs+pHAU6/QeS
	 fvDoBTX9su/Tg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=lobster-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1who4T-00000003H2e-1Npk;
	Thu, 09 Jul 2026 12:41:41 +0000
Date: Thu, 09 Jul 2026 13:43:26 +0100
Message-ID: <87v7ao5o5t.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,	linux-pci@vger.kernel.org,
	Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,	Bjorn
 Helgaas <bhelgaas@google.com>,	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
In-Reply-To: <c12941e4-3715-404e-b674-090c62b868b8@mailbox.org>
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
	<ybnitlgx3dcqsesubz6jz7pn6snseuxhtz564tinbtvukianaq@33ubmcynyqmt>
	<c12941e4-3715-404e-b674-090c62b868b8@mailbox.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: marek.vasut@mailbox.org, mani@kernel.org, linux-pci@vger.kernel.org, kwilczynski@kernel.org, bhelgaas@google.com, catalin.marinas@arm.com, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, lpieralisi@kernel.org, robh@kernel.org, yoshihiro.shimoda.uh@renesas.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34955-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:mani@kernel.org,m:linux-pci@vger.kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[maz@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74C5C731440

On Thu, 09 Jul 2026 13:33:22 +0100,
Marek Vasut <marek.vasut@mailbox.org> wrote:
> 
> On 7/9/26 2:19 PM, Manivannan Sadhasivam wrote:
> > On Tue, Jul 07, 2026 at 10:35:38PM +0200, Marek Vasut wrote:
> >> Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
> >> case MSI are enabled and disabled.
> >> 
> >> Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
> >> configured to 32-bit address width for AXI or APB interface.
> >> 
> >> Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
> >> implementation cacheable and shareable limitations.
> >> 
> >> Marek Vasut (5):
> >>    PCI: dwc: Determine whether iMSI is used before calling .init
> >>    PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
> >>    irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
> >>    irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
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
> This one does yes depend on the two and two patches above, and can
> only be applied once all four aforementioned patches land, otherwise
> things really yes will break:
>   arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes
> 
> Would you like me to split the series up , or can you and Marc (?)
> pick the relevant parts via matching trees ?

I don't think there's anything for me to pick. The whole thing looks
like a consistent set, and it probably should be kept together.

Given that the irqchip stuff has been acked by the relevant party, and
that the last patch will cause havoc if taken on its own, the only
course of action is to route the whole thing together, the PCI tree
being the most obvious victim.

	M.

-- 
Jazz isn't dead. It just smells funny.

