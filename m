Return-Path: <linux-renesas-soc+bounces-3446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 453F3870310
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 14:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECFA128BFA4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 13:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DD53E462;
	Mon,  4 Mar 2024 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="KsdJvDHe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27E93E481;
	Mon,  4 Mar 2024 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559824; cv=none; b=am471Hsud7W5ArWS3YK2AsUA8uFOtxKRA6EjOL9GYdkpoRjULOouTWyMeRpP220D9etFwDZmu6nf5/ZCdllGfOYkvlHvoaGMYuN1o5Po++GBV5cPTjVvts1/o830UDxCkPn9/gUa4Q/yOtsjuxQe4TOHxL94hW5fMIewVSOIGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559824; c=relaxed/simple;
	bh=GpGIGR8a0PLYOlDZcdapTA7qAc6xyvC4OfBEjxkBRGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gN/gbotdFsAfm/mMckApa+daYGydyylmDcwwhZVFuVBGDvIoqNtu/iapq0U1/NhKX1ppDt5K5xnfOQLB8mQCYasRzRIlPU0M/RVKMHT/N6WIlZ6pIxtHsP6bRI2spbPRKFX6wyiDJb7/UtS8L6r8l+V2dAZrZWJPBia90hMkplI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=KsdJvDHe; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=LHWC4yjR7dMPopgRGrLarTpfMPRFEdgB+yWuIYlJ4X8=; b=Ks
	dJvDHerFUPLfp91YL40jef6+jfTfWZ9ruw4bATP8P/vX3mC1kC2DMQl/arXYgk2ela7OvPLH1wOrm
	6pDDItd4qdYbw1wOqNzrY4ewPrtwlMY7z+pX3WkjCsHflpfMieZLXTuuhkDXCrP4fUR1+xKZL/9gu
	35mAhWTCaEhl+1k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rh8bk-009KNt-Ff; Mon, 04 Mar 2024 14:43:56 +0100
Date: Mon, 4 Mar 2024 14:43:56 +0100
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
	linux-renesas-soc@vger.kernel.org,
	Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH net-next v5 5/7] net: stmmac: Signal to PHY/PCS drivers
 to keep RX clock on
Message-ID: <c115735a-d909-4185-82a5-6bcb797f6a60@lunn.ch>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-5-8dac30230050@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301-rxc_bugfix-v5-5-8dac30230050@bootlin.com>

On Fri, Mar 01, 2024 at 04:35:02PM +0100, Romain Gantois wrote:
> There is a reocurring issue with stmmac controllers where the MAC fails to
> initialize its hardware if an RX clock signal isn't provided on the MAC/PHY
> link.
> 
> This causes issues when PHY or PCS devices either go into suspend while
> cutting the RX clock or do not bring the clock signal up early enough for
> the MAC to initialize successfully.
> 
> Set the mac_requires_rxc flag in the stmmac phylink config so that PHY/PCS
> drivers know to keep the RX clock up at all times.
> 
> Reported-by: Clark Wang <xiaoning.wang@nxp.com>
> Link: https://lore.kernel.org/all/20230202081559.3553637-1-xiaoning.wang@nxp.com/
> Reported-by: Clément Léger <clement.leger@bootlin.com>
> Link: https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-clement.leger@bootlin.com/
> Suggested-by: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

