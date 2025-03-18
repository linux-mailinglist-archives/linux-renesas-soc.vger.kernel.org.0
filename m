Return-Path: <linux-renesas-soc+bounces-14585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A825A6737A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 13:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13F1417229E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 12:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DC420B1EA;
	Tue, 18 Mar 2025 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="QvwZTRgb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86CC207A2A;
	Tue, 18 Mar 2025 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742299584; cv=none; b=E5WYawyRr6I4WLlWXZwYpVL6qXsbNQi48cbPAqerc45PMadCuKrkns/1b9InVIa12ZAJ2tCQCGDaTYL7BHit9MCL6/lCyOhW6g64R3loKxdfP9IAkw0/tfnGxXd4Q2h0Ddmrd368hLkfsFiqbbwwBfY8IU7D/atA0Ny1uFk8CGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742299584; c=relaxed/simple;
	bh=0JaZCOTH8Jjx0qjJdoGPbmQF61FvhC22nq5egy1XMg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKNfMu2bmULFNdEMtsUpMCNuhBe6f0gmJ9CdjRDJtj0cPSL5kfJyuGw48NShFcjKmP0xXetu6t0RBZI2h46c1dtTZ2H7VbwOhjDCtwd7k3uKerQ3DYLdacKrCOSH+5cV/Xh7jkfF4P8IVRN/Js70YD/kTinMkSGF/FZyTgZxNI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=QvwZTRgb; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dv+wiBLWCTtLgXAmyneq/DtP+nJJ2dua6jFkgXIEs88=; b=QvwZTRgbp3wb0I32oRxLzYmTa0
	jQL6x4EwT6s29QfnPfg4ZXTeWAzigt1bxuvDQhlZZv+AGmed7exIFUUFIS3PQ7vfgK94uHAGzF8S1
	qBBsd5mV1mxfgvm0sY/cR+Qc2icD1HKNPDUeQT6XPRLCwg4J+fasyEnuSlOyx/k12yuM0a8H+x8Qg
	3SRpdYcTpf47Tc7bVhuCVwSsYmh9+93Le/ITP7kQ75gV86jYBq6WQBznCaeahvPhWHWbhvpWr9wRT
	GR077XlC9leNwW7+rvka0w8jma5AlAuI3qE2iaARgkNcapi4Xgxc8xpaznR1iNLiZux5Lbco9R5KG
	+/bOWXrA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43826)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tuVhq-0004zy-2s;
	Tue, 18 Mar 2025 12:06:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tuVhk-0004Zm-1O;
	Tue, 18 Mar 2025 12:05:56 +0000
Date: Tue, 18 Mar 2025 12:05:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Message-ID: <Z9lhpCp3Nc2vgk52@shell.armlinux.org.uk>
References: <20250311221730.40720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250311221730.40720-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <8e804715-3123-4ab5-94ce-625060df4835@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e804715-3123-4ab5-94ce-625060df4835@redhat.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Mar 18, 2025 at 12:49:00PM +0100, Paolo Abeni wrote:
> On 3/11/25 11:17 PM, Prabhakar wrote:
> > +	gbeth->dev = dev;
> > +	gbeth->regs = stmmac_res.addr;
> > +	gbeth->plat_dat = plat_dat;
> > +	plat_dat->bsp_priv = gbeth;
> > +	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
> > +	plat_dat->clks_config = renesas_gbeth_clks_config;
> > +	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > +			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> 
> The above does not compile:
> 
> ../drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:124:7:
> error: use of undeclared identifier 'STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP'

This is because this patch depends on patches that I previously
submitted on the 10th March, but because of a cockup with the
Cc header, were re-submitted on 12th March:

https://patchwork.kernel.org/project/netdevbpf/patch/E1tsITp-005vG9-Px@rmk-PC.armlinux.org.uk/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

