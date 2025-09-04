Return-Path: <linux-renesas-soc+bounces-21414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 156ACB44885
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 23:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA141487AE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 21:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A0129A30E;
	Thu,  4 Sep 2025 21:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KkMgZWe+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2038621FF44;
	Thu,  4 Sep 2025 21:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757021495; cv=none; b=NhDGUguzKw/ZJ2nfM+aayTtWhKwdldwx39G+DUvhUlSAf+fwvy9QqTo4IRw1i48wudUsJaA6u5QZNsgA7/OWPypPihln4snvf9xPYRP/EiTGvAFPfCTlxuSsmNRcyBwR9lPrpn9o4DVSjq3m/rLNOcsIZPfGXflHsAMgAe9FnpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757021495; c=relaxed/simple;
	bh=+sm4UcxA0vSUoTY8xGWPKzfLP4Q5abU5CRVblQJLvNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2WQ7T9PkECehLtBcPrxbP3h1WxSKhnwbx9Qg4rWJJTSrw13FkzUYkaIYvlRC1EtA4FNhdrGPZG9T5pwxCGaBV1SooL7TKoZSlg3dKKXTHKNOctapRedd4kqc74h/W9e++I+5JdeWkpq10kWbbJGFmKTddx32idAwimk05hXRro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=KkMgZWe+; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6H1pSOS0tE8x4+w4j5sSTNSvLpOtXpis8kCsGfo1lcM=; b=KkMgZWe+XVf2JxNzPK4es8X5Pk
	08NY++duiwnRg15poUU2Xa53D+o5nE3vzxllBZdeJDRLTejJKchTMJIf3qjK5EyxV6ZpE1AZMFQR2
	UE2uvX8UmgWim2jW90temcr6HpOXtagXU9OIu3+sHOzxalUz5zBukXlR6r6H1zvPR+qfS4/waOn65
	Cm44rA5rJDq3iWf2cA6Fyv3Pz861y67zugaUaa6T+ZysZGg7YzULl5Mh4WcqmC0xWj3dR/fT0uffh
	tDEbUQc+fjqUV060l0CY6vBVs0P1i08ZCg04FpwjwQqJ13b8upZlbpdrUlgvX102c42IFL33cBIRk
	twajxq3A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35846)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uuHY7-000000002ZH-0ZPb;
	Thu, 04 Sep 2025 22:31:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uuHY2-000000001sE-2wEY;
	Thu, 04 Sep 2025 22:31:14 +0100
Date: Thu, 4 Sep 2025 22:31:14 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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
Message-ID: <aLoFIoqT2A2RmrfR@shell.armlinux.org.uk>
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
 <CA+V-a8umpEzwO5XnFVNB-TkDtEh9K48OKqaDE_SwzGfXk+9qEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8umpEzwO5XnFVNB-TkDtEh9K48OKqaDE_SwzGfXk+9qEA@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Sep 04, 2025 at 10:10:32PM +0100, Lad, Prabhakar wrote:
> Hi Russell,
> 
> On Thu, Sep 4, 2025 at 9:49 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Thu, Sep 04, 2025 at 09:39:48PM +0100, Prabhakar wrote:
> > >       plat_dat->init = renesas_gbeth_init;
> > >       plat_dat->exit = renesas_gbeth_exit;
> > > -     plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > > -                        STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> > > -                        STMMAC_FLAG_SPH_DISABLE;
> > > +     plat_dat->flags |= gbeth->of_data->stmmac_flags;
> >
> > You include the first two flags in your new device. I would like to see
> > at least STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP always being set. The only
> > reason we have the STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is to avoid
> > changing existing behaviour and causing regressions. New stuff should
> > always set this.
> >
> Me confused, STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is set in the new
> device [0]. The reason STMMAC_FLAG_SPH_DISABLE flag being dropped in
> the new device is SPHEN=1 in MAC HW feature reg for the new device.

What I'm saying is I'd like to see:

	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
			   gbeth->of_data->stmmac_flags;

iow, it is set unconditionally, even if forgotten in a future patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

