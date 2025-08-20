Return-Path: <linux-renesas-soc+bounces-20779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83394B2E44B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E42B5C7E57
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5396126B2D7;
	Wed, 20 Aug 2025 17:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="cQiIzGxd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CAB259C93;
	Wed, 20 Aug 2025 17:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755712014; cv=none; b=Lp1xMVnS2V0FPrmntrr9KLxdGZjapeUWucoVa6bOc+lFBAeV+3zdu0xsp02lSbv1L2eBUvLLufL+P72Jp7lCOWe+JS43dfp41o4+q+tv5b1yhejmUWbhiQ5nQzgBWsfThz1dmXPY/Hn1bV1Lc92inAVHuNSmtkZ5XHrbPMANH/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755712014; c=relaxed/simple;
	bh=jgJSWGXo6CZ+lCD/doF+gwZ91JG6VSTUICKNOcge20o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htM6tTnVHkLgtW1O75Ofw3Ceb/E3r5LOBxIt8rIWUqrHzg9W517WLAwqxicSnQsTavg81QUN1caiqL5csdQNpeYkwlMwJo5YkhCezC6RCRBiOD+KDNOEKhPndyRiRvqU3VlgEe0VGitiOiNoRBbdTy1aA2PO01COO0vCX7kXqU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=cQiIzGxd; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+kZ4lkixRDn9IjHCTHI8jOI8o7eMwRKPi5/Bfyz0HXM=; b=cQiIzGxd47kM58KRcmpGsNzqKy
	oD+M3p1G7sBrh7zxBLipbebJIyJ0nY6hCCZ/+8I0iK4phyOUiaaXk5lolbCJb/J+1N1M2uyHNW3L1
	FkmfgywUr+DTv1LekOsYaJhhOOimPrpM1lV9EbhA68wb3IzmCPfuESh7NXocfasMkzBgJ8uckZxGz
	+XNgRLvp16X4sYKxv8XE8zZAKwt4ZD7rt6gcKyJJ3unWNRxncn+DWlYN2+wRgTYw4Nfvy+F9FOZXM
	L2SOnk2mY761FLa+cxMlK+Oy+LUlSQxUuFKidfErPE7Tb5l+9/8wLmdskZrDMyo0+T0oznfgrzr0N
	rr43rdzg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36078)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uomtU-00058L-1t;
	Wed, 20 Aug 2025 18:46:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uomtR-000000001Mt-0Dbq;
	Wed, 20 Aug 2025 18:46:37 +0100
Date: Wed, 20 Aug 2025 18:46:36 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@kernel.org
Subject: Re: [PATCH net-next v2] net: pcs: rzn1-miic: Correct MODCTRL
 register offset
Message-ID: <aKYJ_OOOFcNeDp_u@shell.armlinux.org.uk>
References: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Aug 20, 2025 at 06:09:13PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Correct the Mode Control Register (MODCTRL) offset for RZ/N MIIC.
> According to the R-IN Engine and Ethernet Peripherals Manual (Rev.1.30)
> [0], Table 10.1 "Ethernet Accessory Register List", MODCTRL is at offset
> 0x8, not 0x20 as previously defined.
> 
> Offset 0x20 actually maps to the Port Trigger Control Register (PTCTRL),
> which controls PTP_MODE[3:0] and RGMII_CLKSEL[4]. Using this incorrect
> definition prevented the driver from configuring the SW_MODE[4:0] bits
> in MODCTRL, which control the internal connection of Ethernet ports. As
> a result, the MIIC could not be switched into the correct mode, leading
> to link setup failures and non-functional Ethernet ports on affected
> systems.
> 
> [0] https://www.renesas.com/en/document/mah/rzn1d-group-rzn1s-group-rzn1l-group-users-manual-r-engine-and-ethernet-peripherals?r=1054571
> 
> Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
> Cc: stable@kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

