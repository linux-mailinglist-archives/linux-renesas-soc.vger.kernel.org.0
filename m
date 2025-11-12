Return-Path: <linux-renesas-soc+bounces-24512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7D4C53D3C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 19:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC96A4FBFB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 17:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3600F345CA4;
	Wed, 12 Nov 2025 17:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="U0/Szjvc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DAC241CA2;
	Wed, 12 Nov 2025 17:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762969130; cv=none; b=LLrr08vVXPXrUuHl3zP+SLKrSnJbdyuVTvlMXW29Qe2bMecpn2dS/SzlCxusl/C1Ko0BshLyBFgiyE6Pm3a45SjlIEfg/YiZGiA+R9UkOcd2CcPbC1yrtGR/vUGDhzj5V2eYF8KzlSns/53CfvG5b57cWa5bbpIAipLhsMKseq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762969130; c=relaxed/simple;
	bh=T6wwWFSTnItcdc5yMdVMVsKsPomTGf54rYyP4+Tt5xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwYna+0oP7dUy9g6ee1lXFkobtME2UwXEg81B+gLV0/x9bG2PLaqH3bzsrGJRzUxoOZIAR72WcYjWG06qgYBxaWMtm6cFhMLRTVvqkKmo5EPmv61KbfU/g6F3J9477QZRpkkiMyKh+xN/82ny7JPwNChUNclZhOuCy9W991Az1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=U0/Szjvc; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UXZ/s6t7sJ9Qp3PethT4d8yK0n0au/aJOKUiInvHzXc=; b=U0/Szjvcjwy9Y6qt8iTfYoP9dv
	JVtfOX+CSFBlQwxE7SdhkJMPPsjT9tKN5jqIMf6tv35tGzBv9lrn+mFLKQieBSF7t9GcLkzscL3rh
	xPL5ZGi/PUOgYbVSB2JytAtDdzCKWqyFMfuDMSLV0jxWTGRGfm1StGUdfV7yYEuAqY2HSgSwhOajP
	knX6EmcoT47Pn7tN6wBRww3PLjbRYa8oDMy4j3TqwpUBQpqXQ+j8/c8ZuqpDh5RPIiIJ5W5kAGJ2A
	wr/WDxMYmainPmF/lru+i8FlZzRYDaABzGj0oURpZsjNu3DbikWreuFlQPcPWW8ZMCdOMy11Kcizc
	us/mtvhg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58098)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJEnj-000000004Jk-2D9c;
	Wed, 12 Nov 2025 17:38:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJEnf-0000000043t-2fFW;
	Wed, 12 Nov 2025 17:38:31 +0000
Date: Wed, 12 Nov 2025 17:38:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Parthiban.Veerasooran@microchip.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v4 1/4] net: phy: mscc: Simplify LED mode update
 using phy_modify()
Message-ID: <aRTGFzSfcKiBtg-_@shell.armlinux.org.uk>
References: <20251112135715.1017117-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251112135715.1017117-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112135715.1017117-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 12, 2025 at 01:57:12PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The vsc85xx_led_cntl_set() function currently performs a manual
> read-modify-write sequence protected by the PHY lock to update the
> LED mode register (MSCC_PHY_LED_MODE_SEL).
> 
> Replace this sequence with a call to phy_modify(), which already
> handles read-modify-write operations with proper locking inside
> the PHY core.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

