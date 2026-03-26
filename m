Return-Path: <linux-renesas-soc+bounces-30391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB5UGL58xWnw+QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:36:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E3A33A366
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC70C30D3D1E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C1C3A254C;
	Thu, 26 Mar 2026 18:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAK06jIG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1224339FCA0;
	Thu, 26 Mar 2026 18:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549971; cv=none; b=H6xkBSE+Hb3DYLxotAh0ab7mE+WpKyKkpyLUbmfH4UfUlVtEdwhFIwoNVT4SDQxpb19ppc1EUEdPfYvUJnm7d3IJLkMiqTtxMn9MFdUn2L5t73QE9rpxf16mrP3Yxofpj4JW/FQqDh0Qy7wHBKeAcV1YgcmcOOrVgJIaQXrrlwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549971; c=relaxed/simple;
	bh=XR7anxY/aULN0YoI5XPa/sNu7iBMedYBtJCjhMTLsFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ky9956xcvVt5Ar+nOu7UqDPPGMTC5auWHnxkZBczVEl7t1SyZHzDbGnx1lOtPF07j1jKIPQdaNp6M3R+77p1+GCHmxwziusga3OdXcV/CyRHnx2VLoMAyvhMiTZq68vX0uE26mxQYUqfPSRiQwO+ifxrX54lRUcM7y5s1fLvE64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAK06jIG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0F5C116C6;
	Thu, 26 Mar 2026 18:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774549970;
	bh=XR7anxY/aULN0YoI5XPa/sNu7iBMedYBtJCjhMTLsFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAK06jIGTbcIopqhOIH234wqe1F7Qll2yeR6S6Qa8cnQnDQe/jXb8LhKAdS9+wkW/
	 HPiM2pAHgINa1O6cYQEVbxzyg6P7OP5gpCjepaYPUPTRxynTQZZz7mAQavfo6y09mi
	 n0LhyOjfNYGf7c7kx/Mf3bV02YFiADOBLl6/eHhbUURx7oXHaflHOJr0gm/7V3hnVr
	 NCFpY9OYaKP2rvckHz4//1hUp0xvri3t3eMEg3VPRKjCRekmFcYSMI/L9kBZWuMAFr
	 ikx2pAyIx89gFR3gYahrfC/l+iGzxHseJU8zdUDf/Ybn+fWqk2tK7P7zkM+UCiBVji
	 6lwqhYMRenmZg==
Date: Fri, 27 Mar 2026 00:02:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org, 
	jingoohan1@gmail.com, kwilczynski@kernel.org, bhelgaas@google.com, 
	florian.fainelli@broadcom.com, jim2101024@gmail.com, robh@kernel.org, 
	ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	claudiu.beznea.uj@bp.renesas.com, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com
Subject: Re: [PATCH v9 1/5] PCI: Add pcie_get_link_speed() helper for safe
 array access
Message-ID: <zcctd7y75nbdxca7dlltvr7dsdrpxphlaq63l64hob3sxzrnwl@zheojrqwfp3j>
References: <20260313165522.123518-2-18255117159@163.com>
 <20260326181624.GA1331242@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326181624.GA1331242@bhelgaas>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30391-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[163.com,kernel.org,gmail.com,google.com,broadcom.com,linux.intel.com,vger.kernel.org,lists.infradead.org,bp.renesas.com,rock-chips.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Queue-Id: C7E3A33A366
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 01:16:24PM -0500, Bjorn Helgaas wrote:
> On Sat, Mar 14, 2026 at 12:55:18AM +0800, Hans Zhang wrote:
> > The pcie_link_speed[] array is indexed by PCIe generation numbers
> > (1 = 2.5 GT/s, 2 = 5 GT/s, ...).  Several drivers use it directly,
> > which can lead to out-of-bounds accesses if an invalid generation
> > number is used.
> > 
> > Introduce a helper function pcie_get_link_speed() that returns the
> > corresponding enum pci_bus_speed value for a given generation number,
> > or PCI_SPEED_UNKNOWN if the generation is out of range.  This will
> > allow us to safely handle invalid values after the range check is
> > removed from of_pci_get_max_link_speed().
> > 
> > Signed-off-by: Hans Zhang <18255117159@163.com>
> > ---
> >  drivers/pci/pci.h   |  2 ++
> >  drivers/pci/probe.c | 16 ++++++++++++++++
> >  2 files changed, 18 insertions(+)
> > 
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index 13d998fbacce..409aca7d737a 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -108,6 +108,8 @@ struct pcie_tlp_log;
> >  				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)
> >  
> >  extern const unsigned char pcie_link_speed[];
> > +unsigned char pcie_get_link_speed(unsigned int speed);
> > +
> >  extern bool pci_early_dump;
> >  
> >  extern struct mutex pci_rescan_remove_lock;
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index bccc7a4bdd79..d6592898330c 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -783,6 +783,22 @@ const unsigned char pcie_link_speed[] = {
> >  };
> >  EXPORT_SYMBOL_GPL(pcie_link_speed);
> >  
> > +/**
> > + * pcie_link_speed_value - Get speed value from PCIe generation number
> 
> Wrong name here (pcie_link_speed_value vs pcie_get_link_speed)
> (pointed out by Sashiko).
> 

Noticed this one while applying.

> > + * @speed: PCIe speed (1-based: 1 = 2.5GT, 2 = 5GT, ...)
> > + *
> > + * Returns the speed value (e.g., PCIE_SPEED_2_5GT) if @speed is valid,
> > + * otherwise returns PCI_SPEED_UNKNOWN.
> > + */
> > +unsigned char pcie_get_link_speed(unsigned int speed)
> 
> Sashiko also pointed out that the commit log says this returns "enum
> pci_bus_speed", while here we return unsigned char (which is also the
> type of pcie_link_speed[x]).
> 
> https://sashiko.dev/#/patchset/20260313165522.123518-1-18255117159%40163.com
> 

This one I didn't, but fixed now, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

