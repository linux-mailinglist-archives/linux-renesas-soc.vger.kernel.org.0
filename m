Return-Path: <linux-renesas-soc+bounces-25576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DABCCA4ACB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 18:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A38B330202D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 17:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2462D7DEC;
	Thu,  4 Dec 2025 17:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="a27VijN9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B247326C384;
	Thu,  4 Dec 2025 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764868037; cv=none; b=uZdUVF7zW+rkvf5pO901DAczfzlCQLOYkZU4q59Akbq8BAyRSyW1Ujui4MMKpXJKP7Xczc74QXRtW/4wkS5QLdZ2KXKvK5PqD4Fqr7QgXF2GZUtEMaRKBa1IAvruI8nw4pVW3pnWalTqYXfj+T5pCUT3265pxT641IRCYdaZb98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764868037; c=relaxed/simple;
	bh=5bx90WoBo03a+iP1LHikx+WKE6go9Zlhxll3VSP5OHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFhlbhzStlWPpk5VdoiUNQNl5XNyGXMFfBiX7mcUG078qd0+2eGqcqU4TwUimfc8kfvzOf9yPmqkXv/W4G2urljwS1HEol3kGYISJEp842pvJ+Waya1Y1aLEmeVL5hg2bXV0Vhd5XD2371RcoJrjA2t09w77kE+gZUKDy27HUnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=a27VijN9; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x+DA9DqJYTMgGbBAG3F0o3MGMgQLdHjVX9AFF5VQTZk=; b=a27VijN9KnOnVEkF6RjBg5/Imx
	wrEJK3aMu4X2qzQOARvATbb0w5eEhSiz5D8wWox/pVK2oobePxNuaSzTvXA3jgTYAxD+nveOuQmup
	E1CDtZshcmuQR0WOnzYhK9eXcsheatg3DA6qwUr2NQfRcsbMxr4BXUKFWbvskEWBosbJbpoZVz3HV
	Zpml8pY2hFmiRnuRgaP43UmJiF1WhdvNfTmPg5Ab9+6DIFyNTdnr+f2qvIHH7GAcRhwT7K4u99UdP
	BkwRvyORTPFFIA9d54d1ozLxpHo5EjULS86E+1o09abCz4a2MZfgBt0CUkfluMUx0iR5veJ8xF19f
	c7knF9ig==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56126)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vRCnG-000000003nl-31Ph;
	Thu, 04 Dec 2025 17:07:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vRCnE-000000001AO-2WM4;
	Thu, 04 Dec 2025 17:07:00 +0000
Date: Thu, 4 Dec 2025 17:07:00 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be,
	biju.das.jz@bp.renesas.com, claudiu.beznea@tuxon.dev,
	magnus.damm@gmail.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 0/3]  net: stmmac: add physical port
 identification support
Message-ID: <aTG_tJGs7-p5kJzD@shell.armlinux.org.uk>
References: <20251204163729.3036329-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204163729.3036329-1-john.madieu.xa@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

See comments on the previous posting of this patch series (why it was
reposted in as little as six minutes apart...)

netdev has a rule: allow 24 hours between re-posts.

netdev has another rule: don't post new material, except for bug fixes
for the net tree, while netdev is closed (in other words, while the
merge window is open.) If you wish to post new material, mark it RFC.

Thanks.

On Thu, Dec 04, 2025 at 04:37:26PM +0000, John Madieu wrote:
> This series adds physical port identification support to the stmmac driver,
> enabling userspace to query hardware-stable identifiers for network interfaces
> via ndo_get_phys_port_id() and ndo_get_phys_port_name().
> 
> On systems with multiple ethernet controllers sharing the same driver,
> physical port identification provides stable identifiers that persist
> across reboots and are independent of interface enumeration order.
> This is particularly useful for predictable network interface naming
> and for correlating interfaces with physical connectors.
> 
> The implementation follows a two-tier approach:
> 
> 1. Generic stmmac support: Default implementations use the permanent MAC
>    address as port ID and bus_id for port naming. This provides immediate
>    benefit for all stmmac-based platforms.
> 
> 2. Glue driver override: Platform drivers can provide custom callbacks
>    for hardware-specific identification schemes. The Renesas GBETH driver
>    implements this to support device tree-based port identification,
>    addressing cases where hardware lacks unique identification registers.
> 
> The Renesas implementation constructs an 8-byte port identifier from:
> - Permanent MAC address (if available) or Renesas OUI (74:90:50) as fallback
> - Port index from device tree property or ethernet alias
> 
> 
> John Madieu (3):
>   net: stmmac: add physical port identification support
>   dt-bindings: net: renesas-gbeth: Add port-id property
>   net: stmmac: dwmac-renesas-gbeth: add physical port identification
> 
>  .../bindings/net/renesas,rzv2h-gbeth.yaml     | 19 +++++++
>  .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 56 +++++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 54 ++++++++++++++++++
>  include/linux/stmmac.h                        |  5 ++
>  4 files changed, 134 insertions(+)
> 
> -- 
> 2.25.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

