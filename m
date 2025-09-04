Return-Path: <linux-renesas-soc+bounces-21398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA2B447AA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B0371BC3CEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A79284B33;
	Thu,  4 Sep 2025 20:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="cafd0cQl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A521B4223;
	Thu,  4 Sep 2025 20:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757018996; cv=none; b=Zp7aX1rG5Cx2xyFQZG9XnKJQ0fiCh2i6adL7FoOLXJNcRB10ejivKnGElunSWafGP1JH7nqfjuxRTK8Ff0qw4G8+V5hfXkMfvZGNZPUTGw4KVyUdKrLSnLHF75MI/E1R8xLu8zxZrD4q9oUfWEUtJXTyTB+j60VjumCAgfwiGPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757018996; c=relaxed/simple;
	bh=0Ia6nloHQ0Ff9r1ulZPnl3Zod+d/yZqUp95nBs/ncxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxszOGD5CdJiZJ8wINM0FM/eyC3iYtEuoM4lrmknkhMAjBoiI1qKWv+8HJ79vhp1l2IqgE1iDQAPHEWMatSDNzdNPnQFmUDY7mnj32MxWaydzoDDEsGzzJ6FZcOCnpXzANjUiqYyEJfhnEZj1V/Dc45V8pTuSNZJ7UtynT22+JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=cafd0cQl; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MgQkSL1KPd31q0yGx1YBfBg/BNXTL/hwsPCMI8L4USk=; b=cafd0cQl9t9SZ6QiVZLpIxJfk1
	nSGxl+L3uTgjh2c26Pg8GivhTLKLI9rB5WC2JhFEvZ7VO5rU3HCGFQ3pXcyRAsXbYnLDPllgZoYYg
	LtpX1A890+XJGATjLiJUfNfqo7RM9SxLuDg7hLT1XWKLURmspGmuSxCpnPdCz0odRK8XbWovJdMDx
	yDLtxick2P47burx74WmW4HcMGAQpWah/L4XyGHN7QVmhVZ6rexPUR0bIwvPXGsGTVfJ4HTAa+5Wt
	XIMg0VOvEWPuugPUjlQHfafL0bRsgUj7xEhA+K61CnKQHtq6OuXyyNsZo+GRwZRf6cTzhFubCO29n
	XeiF82Kg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57380)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uuGtn-000000002X1-2IMh;
	Thu, 04 Sep 2025 21:49:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uuGth-000000001qx-3mKy;
	Thu, 04 Sep 2025 21:49:33 +0100
Date: Thu, 4 Sep 2025 21:49:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 2/3] net: stmmac: dwmac-renesas-gbeth: Use OF
 data for configuration
Message-ID: <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Sep 04, 2025 at 09:39:48PM +0100, Prabhakar wrote:
>  	plat_dat->init = renesas_gbeth_init;
>  	plat_dat->exit = renesas_gbeth_exit;
> -	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> -			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> -			   STMMAC_FLAG_SPH_DISABLE;
> +	plat_dat->flags |= gbeth->of_data->stmmac_flags;

You include the first two flags in your new device. I would like to see
at least STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP always being set. The only
reason we have the STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is to avoid
changing existing behaviour and causing regressions. New stuff should
always set this.

If there is a reason not to have this set (e.g., PCS doesn't support
it) then we need to make that a PCS property and extend phylink's EEE
support. If there's something wrong in the setup that stmmac does for
EEE, then I'd like to hear about it as well.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

