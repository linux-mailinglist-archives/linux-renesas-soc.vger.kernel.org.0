Return-Path: <linux-renesas-soc+bounces-13870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4075EA4B49D
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 21:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CA8E16C7D1
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 20:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202751EBA0C;
	Sun,  2 Mar 2025 20:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="E29usM+M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A03EEB3;
	Sun,  2 Mar 2025 20:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740945955; cv=none; b=pKlvK9AfWdT5IQoebwi2w4balXJHGA2G7pVkcKrINt6iU3pWFCsz+bftf+L1ri+MgohU2DnWoSRiJFE38fzrM4KC4EiOI8xaauIC/HWXuQJ8vXJWis8tfnNG+3z6NnoisCG5v+YhNQ53isrt06rNwHyJs/0NGZd5U/GDF7sN2Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740945955; c=relaxed/simple;
	bh=l7r/HCUaTIK1g55CQDzaQ6ozYGYg/jgdbNNO3ks1Ya4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shEQrg/c/odGxZ17zvWSvC2/aQr678ikeX1N6Y4eu16LPr7ENEzHWL7JUj6+s8tT/hHyU3CssxZbx/hi5dgkRnd6I959VkqiQ/VXe/za1pR8J48KbdTsVMcwaz/OFQtzSzY0MQSeKD59pMOF0Zhg7qaHN3oiTs1f7EokBwD784c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=E29usM+M; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WzvWBw+oK+hBsKWeM78G3AyVRzsimST5eDKa118KrqU=; b=E29usM+Me+EHYxRpXxr2flusGl
	Cj7NZbEQSPdciN+22cLWH89aCqLjc4/RdRCzpbadvfcaoaM4rb3GINBo748kTsc8MptQUelhMyz/d
	r3O3raud4qWQACzd51t+lGZs5uwV8Wn2Pyi+p7l9duDYQJBr+v78D5DR/+cI7YJ+18bh2SDJgrjsN
	noOoaYOejJprrH3624LokYIVTjpOse6LKcvikpN3pCzs/NLf0i95UNJCsHgf5WEw0RRDP0ETGqldZ
	yhSPduh5BskDtw1Y76cYYGPPccema5dUEy3Ck/PDs2ANiwKDkdSQCRXGLAWItwyPoemmk2nOAQr41
	OgLsa1oQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40514)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1topZB-00077z-2x;
	Sun, 02 Mar 2025 20:05:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1topZ6-00031q-30;
	Sun, 02 Mar 2025 20:05:32 +0000
Date: Sun, 2 Mar 2025 20:05:32 +0000
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
Message-ID: <Z8S6DM8ySpoyb8No@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Mar 02, 2025 at 07:33:10PM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 02, 2025 at 06:18:08PM +0000, Prabhakar wrote:
> > +	gbeth->dev = dev;
> > +	gbeth->regs = stmmac_res.addr;
> > +	plat_dat->bsp_priv = gbeth;
> > +	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
> 
> Thanks for using that!
> 
> > +	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > +			   STMMAC_FLAG_EN_TX_LPI_CLOCKGATING |
> 
> I would like to know what value tx_clk_stop is in
> stmmac_mac_enable_tx_lpi() for your setup. Ideally, stmmac should
> use the capability report from the PHY to decide whether the
> transmit clock can be gated, but sadly we haven't had any support
> in phylib/phylink for that until recently, and I haven't modified
> stmmac to allow use of that. However, it would be good to gain
> knowledge in this area.
> 
> > +			   STMMAC_FLAG_RX_CLK_RUNS_IN_LPI |
> 
> What is the reason for setting this flag? If it's because of suspend/
> resume failures, does my "net: stmmac: fix resume failures due to
> RX clock" series solve this for you without requiring this flag?

https://lore.kernel.org/r/Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

