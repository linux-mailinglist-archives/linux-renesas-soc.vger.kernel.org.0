Return-Path: <linux-renesas-soc+bounces-28463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCdWCOYOn2neYgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 16:01:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D815F199215
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 16:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25D18303E492
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 14:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7ED3C199F;
	Wed, 25 Feb 2026 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axqu1wIa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041203B8BB5;
	Wed, 25 Feb 2026 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031402; cv=none; b=tktjas7bY5H4BHMqNbAUONbV+YkXoxvcQiSy2NXivzD8BYdZ5uQ6+CGGhsA+ETbP3hKLLL2So7Ep1EJFDCMwNqerQoHGqIn5QPfd+iQ2pRhCF+hcGZJygNhj+jK/boihKVAJtmJA3OzTyqkQxM3enEuFCjUZJitrhlhLBKIE+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031402; c=relaxed/simple;
	bh=/ekAI3FxEdBx7sDxmd8e8+qIb8tpNERvcll8LbBLE/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YW30GxjBX9wvBBDbq/O7Yymhc7+a/RgcB1kKjVrEbJ4ZFqFWP91Fx0dcxMqeAWS5O8qYy3XE46kPfXPxOUlJHTLjT+Tu5WGMsriAvPBLAnEE62JypVfQjaUvM6/9dYu4rUozAL9U6Pk1YutVxKLKgdXzNgN6shs6PCHc4wBq5BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axqu1wIa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96BDC116D0;
	Wed, 25 Feb 2026 14:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772031401;
	bh=/ekAI3FxEdBx7sDxmd8e8+qIb8tpNERvcll8LbBLE/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=axqu1wIaL2/ctIDTLk86l1FqIjBKZEVDSINEXFudV+MBsskAR9rsTAyDwpUrI5JJm
	 mtErxFDeN3PzpCOH8msfSvguy4/7cuC7jJFRHAvw4FGXzJGRN7Mjys/gHkLVAnVedy
	 Ol4p16uTOJN3Mg3RiHELnqFagmyA2m3ip7J7UfQCWZsfJaU1RqjlTgI8L2XqZm8Yy+
	 YV67o2Gli0kR7+BKwXrmJs0YkwkStO2tk7bjc6UM3QL9u6HeAguiRleO3v+oJtavi9
	 9qaAWTTpi084DL0GDHmDXmuL8hPts3cHccNHu7DUeuOq14571C13WjhU5kf2qzVu8F
	 Z52b7DeQ1R31A==
Date: Wed, 25 Feb 2026 15:56:34 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Frank Li <Frank.li@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/9] PCI: dwc: Replace BAR_RESERVED with BAR_DISABLED in
 glue drivers
Message-ID: <aZ8Nom0TJKnYdIiJ@ryzen>
References: <20260217212707.2450423-11-cassel@kernel.org>
 <20260217212707.2450423-16-cassel@kernel.org>
 <aZToh35w7GYrOmgc@lizhi-Precision-Tower-5810>
 <bc3e8be5-8ffa-47f3-91e2-b3c0e9f8a28b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc3e8be5-8ffa-47f3-91e2-b3c0e9f8a28b@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	TAGGED_FROM(0.00)[bounces-28463-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,kernel.org,google.com,gmail.com,renesas.com,glider.be,nvidia.com,socionext.com,valinux.co.jp,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[mmaddireddy.nvidia.com:query timed out];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D815F199215
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:16:51AM +0530, Manikanta Maddireddy wrote:
> 
> On 18/02/26 3:45 am, Frank Li wrote:
> > On Tue, Feb 17, 2026 at 10:27:11PM +0100, Niklas Cassel wrote:
> > > Most DWC based EPC glue drivers that have BARs marked as BAR_RESERVED in
> > > epc_features also call dw_pcie_ep_reset_bar() for these reserved BARs in
> > > ep->ops->init().
> > > 
> > > An EPF driver will be able to get/enable BARs that have been disabled/reset
> > > unless they are marked as BAR_RESERVED (see pci_epc_get_next_free_bar()).
> > > 
> > > Thus all EPC drivers that have a BAR marked as BAR_RESERVED in epc_features
> > > AND call dw_pcie_ep_reset_bar() should really be marked as BAR_DISABLED.
> > > 
> > > BARs that are marked as BAR_RESERVED in epc_features but for which
> > > dw_pcie_ep_reset_bar() is not called in ep->ops->init() are still kept as
> > > BAR_RESERVED.
> > combine the same condition together to make easy to read. like
> > 
> > "For BAR_RESERVED bars, change to BAR_DISABLED if call dw_pcie_ep_reset_bar().
> > and keep as BAR_RESERVED if not dw_pcie_ep_reset_bar() in ep-ops-init()"
> > 
> > Frank
> > 
> > > No EPC drivers outside drivers/pci/controllers/dwc mark their BARs as
> > > BAR_RESERVED, so there is nothing to do in non-DWC based EPC drivers.
> > > 
> > > Signed-off-by: Niklas Cassel <cassel@kernel.org>

Note: the proper tag is Tested-by.
(I noticed that b4 did not pick up your tags.)

> Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> > > ---
> > >   drivers/pci/controller/dwc/pci-imx6.c         | 12 ++++++------
> > >   drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  6 +++---
> > >   drivers/pci/controller/dwc/pcie-tegra194.c    |  8 ++++----
> > >   drivers/pci/controller/dwc/pcie-uniphier-ep.c |  4 ++--

> I see BAR_RESERVED in pci-keystone.c driver in linux-next branch.
> Do you have any patch which changed BAR_RESERVED to different type
> in pci-keystone.c driver?

No, I did not change keystone, because that is the only DWC base glue driver
that has never disabled these BARs by default.

I will add a TODO to the keystone driver:

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 20fa4dadb82a..576a78a9f6e5 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -933,6 +933,11 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
        DWC_EPC_COMMON_FEATURES,
        .msi_capable = true,
        .msix_capable = true,
+       /*
+        * TODO: BAR_RESERVED should either be replaced with BAR_DISABLED or,
+        * if the should continue to be enabled, then the driver should define
+        * what is behind the reserved BARs, see struct pci_epc_bar_rsvd_region.
+        */
        .bar[BAR_0] = { .type = BAR_RESERVED, },
        .bar[BAR_1] = { .type = BAR_RESERVED, },
        .bar[BAR_2] = { .type = BAR_RESIZABLE, },

