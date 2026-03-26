Return-Path: <linux-renesas-soc+bounces-30384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJOAA2x5xWnw+QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:22:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A0339FF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92AFB310107F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7B638E132;
	Thu, 26 Mar 2026 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPQKysa2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EE937F8AD;
	Thu, 26 Mar 2026 18:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548587; cv=none; b=rKNnJeSNpaUGfiFKeqEWQPan2gvv2zJBT53YvIiQEZHe6erhsGVWRB9vUoEJmW5CpX82J0sJNoeZAAJRKDuml25sxCPIJQmzsRT2X1nJdyuehdckkbq/M/Kzqs4+0tAcy+KpDiDkiEr9p6w8dl4CW57wq3lXc2Nlti8y6twr/7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548587; c=relaxed/simple;
	bh=Rn+vhInqQodS/bAOEwWYdnq6SYa4NomZ2mbnsMoy6H0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=AHVzbyTqW3EaElpxV1iixRRmR/zXMCmo3/EBt9CcUdGKHDFNTFpLphKWVjDdZibxPyk0Z7WevwfOqLvnKl6vCYczTdGZgW3gPaJIUpFe9cK3PU1iHfwgDMP2shJb8oOA/NNlKgx5zxE7zJcG1GI8wMqgPra55iNiyeyGFSPYEm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPQKysa2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9922C116C6;
	Thu, 26 Mar 2026 18:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774548586;
	bh=Rn+vhInqQodS/bAOEwWYdnq6SYa4NomZ2mbnsMoy6H0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=GPQKysa2Kkl0pnDdhP2t5CHyGa0cSastDgmKm1O2tVeZiouqwEbsOgxTrwYLdJo+p
	 Ufja9z0tJ2PtiRx9h6st1c6T9AoJRU36LL+yeBp8LiylI7/3RBzBX12VaEnqZNdgr7
	 CA+E7cZdX0iMz4YCgV4wa0RAs2ytQxQNOrpeU+P/G7dkkXQcaLNf4hc1u87LijDMYT
	 YK89haZnBIMHtd6lRQxHNY8CBETPQVS3QsUUPzBlpSyp7lGtqMmmkCDEgL5jqJl8N1
	 WRrCF+Z4e5BzM1QOPKpSOgWr/y59L1IZRZ2xky1NUV6h8K+Mbe8i5vnaHXu6BC0S5Y
	 i1dnY6VpNPZ8A==
Date: Thu, 26 Mar 2026 13:09:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
	kwilczynski@kernel.org, bhelgaas@google.com,
	florian.fainelli@broadcom.com, jim2101024@gmail.com,
	robh@kernel.org, ilpo.jarvinen@linux.intel.com,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	shawn.lin@rock-chips.com
Subject: Re: [PATCH v9 1/5] PCI: Add pcie_get_link_speed() helper for safe
 array access
Message-ID: <20260326180945.GA1331170@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313165522.123518-2-18255117159@163.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30384-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,broadcom.com,linux.intel.com,vger.kernel.org,lists.infradead.org,bp.renesas.com,rock-chips.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 368A0339FF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 12:55:18AM +0800, Hans Zhang wrote:
> The pcie_link_speed[] array is indexed by PCIe generation numbers
> (1 = 2.5 GT/s, 2 = 5 GT/s, ...).  Several drivers use it directly,
> which can lead to out-of-bounds accesses if an invalid generation
> number is used.
> 
> Introduce a helper function pcie_get_link_speed() that returns the
> corresponding enum pci_bus_speed value for a given generation number,
> or PCI_SPEED_UNKNOWN if the generation is out of range.  This will
> allow us to safely handle invalid values after the range check is
> removed from of_pci_get_max_link_speed().
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/pci.h   |  2 ++
>  drivers/pci/probe.c | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 13d998fbacce..409aca7d737a 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -108,6 +108,8 @@ struct pcie_tlp_log;
>  				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)
>  
>  extern const unsigned char pcie_link_speed[];
> +unsigned char pcie_get_link_speed(unsigned int speed);
> +
>  extern bool pci_early_dump;
>  
>  extern struct mutex pci_rescan_remove_lock;
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index bccc7a4bdd79..d6592898330c 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -783,6 +783,22 @@ const unsigned char pcie_link_speed[] = {
>  };
>  EXPORT_SYMBOL_GPL(pcie_link_speed);
>  
> +/**
> + * pcie_link_speed_value - Get speed value from PCIe generation number
> + * @speed: PCIe speed (1-based: 1 = 2.5GT, 2 = 5GT, ...)
> + *
> + * Returns the speed value (e.g., PCIE_SPEED_2_5GT) if @speed is valid,
> + * otherwise returns PCI_SPEED_UNKNOWN.
> + */
> +unsigned char pcie_get_link_speed(unsigned int speed)
> +{
> +	if (speed >= ARRAY_SIZE(pcie_link_speed))
> +		return PCI_SPEED_UNKNOWN;
> +
> +	return pcie_link_speed[speed];
> +}
> +EXPORT_SYMBOL_GPL(pcie_get_link_speed);
> +
>  const char *pci_speed_string(enum pci_bus_speed speed)
>  {
>  	/* Indexed by the pci_bus_speed enum */
> -- 
> 2.34.1
> 

