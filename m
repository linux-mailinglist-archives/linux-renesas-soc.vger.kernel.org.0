Return-Path: <linux-renesas-soc+bounces-30438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ejZhO5K1xmnoNwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 17:51:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A04347D2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 17:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A10B30B3ADA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 16:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CE7346A02;
	Fri, 27 Mar 2026 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftfgFWUi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE6341ADF;
	Fri, 27 Mar 2026 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629772; cv=none; b=dA8TlioAm+v8NjGZsCqT1rrK5xI7HcHip7lzTG6axMuDzX1kirduzRR2bYcUFIZtKxijtKKzd+H3CHtntC6uGGcvay9DBfB7kxw8jzUJ2TIgiGiwkJmR7gMhGS81yNNAiyGRuZJBUSITelM8fbEGX8PC1El8AD3j6MUu3pRbC8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629772; c=relaxed/simple;
	bh=1H+anKqAj6Tq4LBNW0lKVeIqT1Ggz4JI2pHYhsTtQEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=M8aSppIS7OATrthC43/wzCjrPvS3Enfs+mBUV45jsTXaNuWBvr2RfecNimR5WPYAuv9DV7f3rV1abanim/bgc65+Rekx1+GAllk4DyknO1OkS+dyOfCZF57qMkcx3KK0hpm3HQP/wXdAt+iUOWymUv6NDzvK80O/5TEGTa3P/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftfgFWUi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7162C19423;
	Fri, 27 Mar 2026 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774629771;
	bh=1H+anKqAj6Tq4LBNW0lKVeIqT1Ggz4JI2pHYhsTtQEI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ftfgFWUiv2uIubpclBsTMgch+7bJqtUKOxfMVaaCQtoLdH8F8J1p1cp4toGBDqkXT
	 sJ831ziotFibjYpRgrSCx4HUgGpsvsLk2TrWdLSEKIv0GFInB4FCfzank/hsbzjTph
	 1QporGojGUe6IEdMqfTJsyYg2KvgX2wSANQVlM1602xbg+UTyyx3kRi1pg9TOuA8mh
	 a4wctNMVne9H+wKlG8LvuvC8GMGDl4dPO+0Z8G73IEwmHb3C2c0aTPjV5UWDVSSNeD
	 NfDAcpIJWg7aBEOfbglGtBdJBFHQA5o5jVEQDIiuhWelclc0gRawFLpRjQX42v5SDs
	 dTggbqCGp+6Ug==
Date: Fri, 27 Mar 2026 11:42:50 -0500
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
Subject: Re: [PATCH v9 0/5] PCI: of: Remove max-link-speed generation
 validation
Message-ID: <20260327164250.GA1513325@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30438-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 89A04347D2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 12:55:17AM +0800, Hans Zhang wrote:
> Hi,
> 
> This series moves the validation from the common OF function to the
> individual PCIe controller drivers.  To protect against out-of-bounds
> accesses to the pcie_link_speed[] array, we first introduce a helper
> function pcie_get_link_speed() that safely returns the speed value
> (or PCI_SPEED_UNKNOWN) for a given generation number.
> 
> Then all direct uses of pcie_link_speed[] as an array are converted to
> use the new helper, ensuring that even if an invalid generation number
> reaches those code paths, no out-of-bounds access occurs.
> 
> For several drivers that read the "max-link-speed" property
> (pci-j721e, brcmstb, mediatek-gen3, rzg3s-host), we add an explicit
> validation step: if the value is missing, out of range, or unsupported
> by the hardware, a safe default is used (usually Gen2). Other drivers
> (mainly DesignWare glue drivers) rely on the helper to safely handle
> invalid values, but do not yet include fallback logic or warnings.
> 
> Finally, the range check is removed from of_pci_get_max_link_speed(),
> so that future PCIe generations can be supported without modifying
> drivers/pci/of.c.

Thanks for this series.

We still have a couple references to pcie_link_speed[] that bypass
pcie_get_link_speed().  These are safe because PCI_EXP_LNKSTA_CLS is
0xf and pcie_link_speed[] is size 16, but I'm not sure the direct
reference is necessary.

The array itself is exported, which I suppose we needed for modular
PCI controller drivers, but we probably don't need it now that
pcie_get_link_speed() is exported?

  $ git grep "\<pcie_link_speed\>"
  drivers/pci/pci-sysfs.c:        speed = pcie_link_speed[linkstat & PCI_EXP_LNKSTA_CLS];
  drivers/pci/pci.c:      return pcie_link_speed[FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta)];
  drivers/pci/pci.h:extern const unsigned char pcie_link_speed[];
  drivers/pci/pci.h:      bus->cur_bus_speed = pcie_link_speed[linksta & PCI_EXP_LNKSTA_CLS];
  drivers/pci/probe.c:const unsigned char pcie_link_speed[] = {
  drivers/pci/probe.c:EXPORT_SYMBOL_GPL(pcie_link_speed);
  drivers/pci/probe.c:    if (speed >= ARRAY_SIZE(pcie_link_speed))
  drivers/pci/probe.c:    return pcie_link_speed[speed];
  drivers/pci/probe.c:            bus->max_bus_speed = pcie_link_speed[linkcap & PCI_EXP_LNKCAP_SLS];


