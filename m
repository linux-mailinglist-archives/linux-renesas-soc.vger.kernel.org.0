Return-Path: <linux-renesas-soc+bounces-25580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 579BECA4B81
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 18:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4C9E304A7ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 17:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101CC2F12B2;
	Thu,  4 Dec 2025 17:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="iWcApV5M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6189E2ED85D;
	Thu,  4 Dec 2025 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764868197; cv=none; b=JjCTQy2UJOJh/YrX3RrBQjCJznjZSslc4lQ74BAbI30lkWaldoE7cWHdxkaAIFeo5FgfUfEE/XxJSgE/0SJEafAePAPTcQW5xQjb6zL82ZmlPvRJOEDOJJaRidX4QWs3a0bStI1ka/fXGDYQ+ww+HeSNqArbh1bN01RZ69yXwTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764868197; c=relaxed/simple;
	bh=BNdqFoChM4Dg1gXgtTdOSxkekvylSf4HlVcI2srGEg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOd50GPZAkqoZZlyQ0j85OZyuvyRmGfQ+6PjIuGo5QwtouogIQwsqrFm73piGGqZadtawQWCu4X/baQ0NmJteyC0nO7HmZiYIVPSMapwLXDCFuUnmKxTe8ZSe4pWB8BX76+e62Thjrt1bu5EWKSWpypX9anY01Y+t9NIEU8BlYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=iWcApV5M; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UL1o65RZF394mtenVHi6rNznonj7OEHTfj3BoGUFlN8=; b=iWcApV5M0WBXsDuxeeItZNns/S
	02v7uWaUbmSJyTk0DdMg6ODCLjJKb2P+feKaKXBVV9MO3smiOL5zqp2JAp+fgG1NC95mHjBn+uINr
	6jk+2b3yJprhJiHhUMOOJ2bYbaAz3lelCdgE3n86agoiTN2e21fbMBNBj6zQqe/3h45d1F/gNXFtF
	oEFvdiRVdnObly3IUpUfRAHfbau2PcoHZ+c4NnSgvz/rOkaDZBgjuJEeGd6uG3kOdaqBcLCDYepBJ
	dEBAeAe3eo0e19kpZIfxEJEKRAVv/GXQsgBpEfFaeZA/sX+K9+A1AXf8VcPDTvWUFNBWC1HnuKVav
	YG8aKJ5Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44150)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vRCpp-000000003oF-49tr;
	Thu, 04 Dec 2025 17:09:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vRCpn-000000001BO-2O36;
	Thu, 04 Dec 2025 17:09:39 +0000
Date: Thu, 4 Dec 2025 17:09:39 +0000
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
Message-ID: <aTHAU2i4chYpQPSY@shell.armlinux.org.uk>
References: <20251204164028.7321-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204164028.7321-1-john.madieu.xa@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Not another bloody posting of this.

Stop it right now. Just stop.

I've reviewed your first series. You are diluting the potential reviews
of your code, making it harder for people to review and track what
people have said.

So just stop this stupid behaviour right away. Do not re-post until
after the merge window is over. Read the networking maintainence
documentation. Documentation/process/maintainer-netdev.rst

On Thu, Dec 04, 2025 at 05:40:25PM +0100, John Madieu wrote:
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

