Return-Path: <linux-renesas-soc+bounces-3450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E49870439
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 15:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 556ACB27326
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 14:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCA83EA66;
	Mon,  4 Mar 2024 14:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="wB+R7DNU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6911E484;
	Mon,  4 Mar 2024 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709562797; cv=none; b=CXaBk2FDnD4L9gw7ICOC7wmyrel8uwx2hEm5wOimoZcakmWiQpjgPiRle/G2bTR0AdTU8jU9v6iXHHaF3hBxZe+wGBnygDBxlA6HoG4cxCKrXcU7JLfamJH4NrSTJfiMn9WKtEQw85FUACEAN4CEqBJJaXzozHJgLBTiai1816g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709562797; c=relaxed/simple;
	bh=xLE7bPcXX1RmOT5U2LVXea4qsChyvC0pK29H8Z/Iqqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PswTd8YbzbihonS1EuI+eSeEU92++1JDXreMg9G+mry+LDf1OxXUBhctqiRHLQcrxLS11Px3qCla0ePgZoFofC2kN8L/eAq+zttSZwuqtBwGeoEG2PQphss4GB0S5A6qf0bV1hy35N0ZQwOJ3/sb0ESqj3gu0jFu7BJz1alP23c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=wB+R7DNU; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wRopBagK4PzSmOlB5j0pJxRv6DYM1p2O2ZjwhN9VoqE=; b=wB+R7DNUYNqQRGU933WTZiLRjk
	yHZFIW9bXImt1vd8AhUGj/2sOmmZGxKIvLywerjKxjZmSCLvIRUSfknMPXKhv/Es6VrN0t9hY7lnl
	jAcLnJBDBg/OiRq3hxOlNH43/BFx19j4jgFyrTp5G8/NyBIfIE9RibPgyInobGdy0d9pNSIwDX37d
	vNVnaHo9TKdRBr3sxEQBUHvE4yMfgWcFu1CSwNH2McU5T+9PWRhXRcSwVTie8yKB+MRjntauLVKVI
	Gtf7zATZjsfqp3tVnQ1ibrNlz1r2So2yZ9ypfGklkZS1zcUV8dgFog2U7XMKjTt9Vb547OeKHyrDR
	+NGM65Uw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42658)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rh9NJ-0005lg-0B;
	Mon, 04 Mar 2024 14:33:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rh9NG-0004Yn-KR; Mon, 04 Mar 2024 14:33:02 +0000
Date: Mon, 4 Mar 2024 14:33:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/7] net: phylink: add rxc_always_on flag to
 phylink_pcs
Message-ID: <ZeXbnmxoFWoWnq+s@shell.armlinux.org.uk>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-2-8dac30230050@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301-rxc_bugfix-v5-2-8dac30230050@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Mar 01, 2024 at 04:34:59PM +0100, Romain Gantois wrote:
> Some MAC drivers (e.g. stmmac) require a continuous receive clock signal to
> be generated by a PCS that is handled by a standalone PCS driver.
> 
> Such a PCS driver does not have access to a PHY device, thus cannot check
> the PHY_F_RXC_ALWAYS_ON flag. They cannot check max_requires_rxc in the
> phylink config either, since it is a private member. Therefore, a new flag
> is needed to signal to the PCS that it should keep the RX clock signal up
> at all times.
> 
> Suggested-by: Russell King <linux@armlinux.org.uk>

Given that this contains some of my code, this is slightly more than
"suggested by", it's probably more accurately co-developed-by.

All the same comments apply to this attributation as the sign-off in
patch 1.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

