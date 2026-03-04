Return-Path: <linux-renesas-soc+bounces-28766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKROKoI0qGm+pQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 14:32:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E6200771
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 14:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B0E0300C36D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 13:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB7C390C88;
	Wed,  4 Mar 2026 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9VN5kBu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A863909A0;
	Wed,  4 Mar 2026 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772631156; cv=none; b=Qws3zONW/Y8B6jEg97YNR5ROFXeqvrs7ZIZbcSLkX1KtnmBluKltdD+6/HSz04gU3zhRxRY+8M+g2+BjF3NX8DpBdkA1TdRHxoHMdAubbbiGMhyvnzbM95aaan/gq5iZWXonAX1uV9gTbGERsFUQEzYKAGuPAMK0mks+BJp43OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772631156; c=relaxed/simple;
	bh=dE0Doa9CPpgTsgj7rC9zxbj0HXdWcCnKOdhnwvcgcdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpgZ7rZr283ZifJQyKErIjp3T4Fn9ck/We+NTT76/c5OK2ztSmj7VYUTEnFoPTLhXyPQGn1XTTVrAqq2sFOA2NagRQxUdrtEJKMedScvg6aS3XEZ2DQ4gtN7sshptHTIvSKu2I3hd5nTgf8KjlI+AqNdAWh2K/ch47bU3dvQQhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9VN5kBu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8FDC19423;
	Wed,  4 Mar 2026 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772631156;
	bh=dE0Doa9CPpgTsgj7rC9zxbj0HXdWcCnKOdhnwvcgcdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9VN5kBuI3noJKlW6F7fQ8d1F88dRW6KLALT2bqYIvJoUXGQHGHhkEwKJx4JpMyMr
	 qwyCu/LamvRbiuUcx2rLKJ5cGbmnFbTjc88/SH7BXIOt/qDgGPfPnFinT48mzliqcL
	 WK1TdzO6jJmgySIF6GOE8mb+fKWBudl2kVCW7Lo+XJ7NzaPiFpBvQYY5XIWCpcj8IS
	 C4WDiJZ4mPvzVLIqMZOB59u7u4O2MQfBMgARL8nkqFUQ2iCQINddXlly+5X1SHftTV
	 FDCHg0r8QfU25nyCKkGTqgaFlIw/HeyQwIOd8yFd7ZB/L/RjTOD8Lz+wBZD/FRskYR
	 sEYuDIc40uamg==
Date: Wed, 4 Mar 2026 14:32:30 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: Bjorn Helgaas <helgaas@kernel.org>, marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, geert+renesas@glider.be, magnus.damm@gmail.com,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dwc: rcar-gen4-ep: Mark BAR0 and BAR2 as
 Resizable BARs
Message-ID: <aag0bu6Me7aUNAdK@ryzen>
References: <20260210160315.2272930-1-den@valinux.co.jp>
 <20260302223150.GA4022590@bhelgaas>
 <ns62mpoyrskr5q3uoy7gfjzideede2xqpixsllwhc3ozkz4us3@ltdzzshbgxla>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ns62mpoyrskr5q3uoy7gfjzideede2xqpixsllwhc3ozkz4us3@ltdzzshbgxla>
X-Rspamd-Queue-Id: A09E6200771
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28766-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,renesas.com,google.com,glider.be,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello Bjorn, Koichiro,

On Tue, Mar 03, 2026 at 02:12:05PM +0900, Koichiro Den wrote:
> > > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > @@ -422,7 +422,9 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > >  	DWC_EPC_COMMON_FEATURES,
> > >  	.msi_capable = true,
> > > +	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
> > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > +	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
> > 
> > I guess the "Resizable" property is not something that is discoverable
> > at runtime?
> > 
> > You mention the Resizable BAR Capability, so I wondered if the driver
> > could use that to figure this out.
> 
> As I understand it, it should be discoverable on DesignWare EPC, since a BAR
> configured with a resizable sizing scheme results in a corresponding Resizable
> BAR capabilioty/control pair, and the BAR index is there.

It is no secret that the PCI endpoint framework has been largely designed
with DWC based controllers in mind.

After all, 13 out of the 16 EPC drivers are for DWC based controllers.

Only 3 out of the 16 EPC drivers are for non-DWC based contollers:
drivers/pci/controller/cadence/pcie-cadence-ep.c
drivers/pci/controller/pcie-rcar-ep.c
drivers/pci/controller/pcie-rockchip-ep.c

For DWC based contollers, the databook defines three sizing schemes:
BARn_SIZING_SCHEME_N =Fixed Mask (0)
BARn_SIZING_SCHEME_N =Programmable Mask (1)
BARn_SIZING_SCHEME_N =Resizable BAR (2)

Each of these require different ways to program the BAR size/mask.

For Fixed, the BAR mask is fixed, so really nothing to program.

For Programmable, the BAR mask is writable.

For Resizable, the BAR mask is writable, but should be configured
via the Resizable BAR Capability, since you also need to define
which sizes the host side can change between. Right now the PCI endpoint
framework only supports a single supported "Resizable BAR" size.
So essentially it is like a programmable BAR, but still needs to be
program the size via the Resizable BAR Capability (so different from
a programmable BAR).



A Resizable BAR also has a minimum size of 1 MB, whereas the programmable
BAR can be smaller.

A Resizable BAR also has the unfortunate property that the selected BAR
size is a non-sticky register, so it gets reset during any type of reset.
(Unlike the register used for programmable BARs, which is sticky, and thus
keeps its value for most types of reset.)

Thus we already have code to detect and restore the BAR size for Resizable
BARs (if an PCI endpoint function driver has configured a BAR size):
https://github.com/torvalds/linux/blob/v7.0-rc2/drivers/pci/controller/dwc/pcie-designware-ep.c#L1075-L1104

This code works regardless of type configured in epc_features.

It would probably be possible to extend this code to detect that a BAR is
Resizable, and then "override" any default configured type in epc_features.



Note that there are also other things in epc_features that might be able to
be detected in runtime, e.g. msi_capable and msix_capable (by iterating the
capabilities list and see if they are there).

Possibly, it done this way because certain endpoint controllers, specifically
Qcom and Tegra, require a reference clock (i.e. PCI common clock, provided by
the host) before they can access DBI registers, which is needed to iterate the
capabilities list. (Most other EPC drivers provide their own reference clock,
SRNS/SRIS, so they can access DBI registers as soon as the driver has probed.)

By having the Resizable BAR information in the driver, we can do certain
things, e.g. verify that the requested/allocated BAR size, is at least 1 MB,
see pci_epf_alloc_space() and pci_epf_get_required_bar_size() which both have
a BARno param, even before the controller has been provided a reference clock.

So this is not something unique to BAR type/sizing scheme, the same arguments,
for/against, also applies for msi_capable/msix_capable.

Manivannan, would it be possible to automatically initialize msi/msix_capable
on Qcom once a reference is provided, or would this be too late?

I assume that when Kishon added msi_capable/msix_capable, he did so for a
reason. But perhaps it was just to have a way do disable msi/msix for platforms
where MSI/MSI-X is broken?

See e.g. a52587e0bee1 ("PCI: rockchip: Don't advertise MSI-X in PCIe capabilities")

But nowadays we tend to hide broken capabilities. Assuming that we hide the
broken capabilities, before iterating the capabilities list to see which
features are supported, I don't see the need for msi_capable/msix_capable.
(Unless there is some issue for boards like Qcom and Tegra that don't provide
their own reference clock.)


> 
> > 
> >  * @BAR_RESIZABLE: The BAR implements the PCI-SIG Resizable BAR Capability.
> >  *                 NOTE: An EPC driver can currently only set a single supported
> >  *                 size.
> > 
> > Is this comment about the single supported size still accurate?
> 
> Yes, I believe so. The comment still seems to reflect the current
> implementation.
> 
> Niklas, please feel free to correct me here if I'm missing something.

Yes, this limitation is still there.


Kind regards,
Niklas

