Return-Path: <linux-renesas-soc+bounces-13869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2D8A4B469
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 20:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F4791891802
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 19:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC941EB1BB;
	Sun,  2 Mar 2025 19:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="XMiFu5Q5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DD81E1A08;
	Sun,  2 Mar 2025 19:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740944005; cv=none; b=M0ZQxqftVqJWUFtx8bnEV2OimgjYh0888RlKSof/u6oGEounHCPWYo9UvAMjT5qf8AxL+tLZC556dU4gDZz6+Wv7mYjrbrGce+SSUevnJPPBcX4T3EFbok6O2ZI2uDP7aWW5XBvyoIcR1MInZMcSti3pAMAdEljAfh+6sK9Aiss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740944005; c=relaxed/simple;
	bh=XHYRSAm4M2ld3p9O6V343foNQyXByWOceS45B7y36Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FA9m1UvPWGx597HY2s1vj5X5zvwo43iAZKQEtZPrZ80sCqCTtCb0ADcKnqsGMPkJBKUC65x1QDVrF2JqUYYThe+VCb6UfUcbz7tzKM9Auu4ILn8m6O9hjgEM7/M6QrI+Jr2Z4x/YYo7pvWT7o2kCq2V/fNfQnfo4qH2rrVfNDow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=XMiFu5Q5; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=du+ZXY9U7ped2ODAI60TrmZmm0v5NBy9O3dw/M6vUbA=; b=XMiFu5Q5AU+1pQJXWn9Ub/fN3J
	3x+r8iXiUsL5EdkF+YcWxELux3j/4jJpkGwaK1A0YCxhg/EIU47lcHq/YpHRl4TCduf39xqPx5F/Y
	Bydr4ifl1d03wgLiW0jJ/ntPYbp8xIyATkk48WZxwuqXtsVK5OJJNy4KXXm241cJ3KQ19IquZ68n/
	sxLzd4u5bpDz/pGr8h6ukADmPTDIHRUdn1eT3VXHKZCNhzW9h1E13aSURK90Ylf4q+VHLe5XTtla8
	iYyyefJTqmjkVHVi9HIaSsHxSrjR0g0aJexNXiezsuJWxiets5jlC8C2Z0mO60EgeI+P9/IBnDqbc
	zq/LhEnw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52282)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1top3p-00074a-1j;
	Sun, 02 Mar 2025 19:33:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1top3m-00030i-20;
	Sun, 02 Mar 2025 19:33:10 +0000
Date: Sun, 2 Mar 2025 19:33:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Message-ID: <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Mar 02, 2025 at 06:18:08PM +0000, Prabhakar wrote:
> +	gbeth->dev = dev;
> +	gbeth->regs = stmmac_res.addr;
> +	plat_dat->bsp_priv = gbeth;
> +	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;

Thanks for using that!

> +	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> +			   STMMAC_FLAG_EN_TX_LPI_CLOCKGATING |

I would like to know what value tx_clk_stop is in
stmmac_mac_enable_tx_lpi() for your setup. Ideally, stmmac should
use the capability report from the PHY to decide whether the
transmit clock can be gated, but sadly we haven't had any support
in phylib/phylink for that until recently, and I haven't modified
stmmac to allow use of that. However, it would be good to gain
knowledge in this area.

> +			   STMMAC_FLAG_RX_CLK_RUNS_IN_LPI |

What is the reason for setting this flag? If it's because of suspend/
resume failures, does my "net: stmmac: fix resume failures due to
RX clock" series solve this for you without requiring this flag?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

