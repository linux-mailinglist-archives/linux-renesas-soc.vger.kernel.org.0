Return-Path: <linux-renesas-soc+bounces-3444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A070D870303
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 14:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 248B9B27ED0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 13:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AC93EA88;
	Mon,  4 Mar 2024 13:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ORLEHsLx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AC73B797;
	Mon,  4 Mar 2024 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559679; cv=none; b=QUDHA39oi7GneyoCxtvs9/zSvvJDCnTSuI4TArrwfA2UK5iz5xjJFNHV3pemtwCVPWr5GtZqPqYe7Ibj98cs5QDDcQ220ENTNPV2gWpAhBBVQH/9k2JaMBecSAktWMfDj1vSk9enW2JL5q76wUqqpEKs0oivcMoJdCWE1ffXWhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559679; c=relaxed/simple;
	bh=t3k+MyRt0+tJNjx0lQrdE99K6VlUnlEb0oNTZhrUYP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2YH1AEvl7jKir74jgYzWJcwxSHwKmQKLJPsgEkeTwcin8EsKkBkC09uDB+8IchSEHjRmIxF9SXl6fkUU8/Nq80YK7kpobft+ncLingyZ8BLr6gmMtsLK7fGw5Ep5egyLQULnC0sWyGUucInk8jkWCapifb59DawuHpSgTt3u1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ORLEHsLx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2RW00RRdJ6/9wrHmluqjDPjlTXkXPk/qAZGZtAc5LPI=; b=ORLEHsLxjgg68h8f3PfgQQvANt
	d1VjRjf9sezt5tDvz/VlOumWsegsoZkBZXiXB85yh7QHLJKiQqWU1mowD0afmlsHJcSnGsArJN72M
	qCUG1QThw5k85wPg/dsv1/edDr/SlXwYN9/bvImRxWjCyMebatRRUtg9wNq5FwYMoZ/A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rh8ZJ-009KLR-47; Mon, 04 Mar 2024 14:41:25 +0100
Date: Mon, 4 Mar 2024 14:41:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
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
Subject: Re: [PATCH net-next v5 3/7] net: stmmac: don't rely on lynx_pcs
 presence to check for a PHY
Message-ID: <b5e2a507-d3ad-449b-9da7-6767efd6d886@lunn.ch>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-3-8dac30230050@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301-rxc_bugfix-v5-3-8dac30230050@bootlin.com>

On Fri, Mar 01, 2024 at 04:35:00PM +0100, Romain Gantois wrote:
> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> When initializing attached PHYs, there are some cases where we don't expect
> any PHY to be connected. The logic uses conditions based on various local
> PCS configuration, but also calls-in phylink_expects_phy() via
> stmmac_init_phy(), which is enough to ensure we don't try to initialize a
> PHY when using a Lynx PCS, as long as we have the phy_interface set to a
> 802.3z mode and are using inband negociation.
> 
> Drop the lynx check, making the stmmac generic code more pcs_lynx-agnostic.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [rgantois: commit log]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

