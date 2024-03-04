Return-Path: <linux-renesas-soc+bounces-3447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB4870317
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 14:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B821D1C21930
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 13:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7756A3E47B;
	Mon,  4 Mar 2024 13:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Jq4KxQfC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE1C381B6;
	Mon,  4 Mar 2024 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559880; cv=none; b=BFcqk9TXuFMFKMBtdODe81VrELB1RGCaEB/Hsu3mLnnAEUbzYh+lGqtrUccHDyOUjpj56Xe37d9amd0BrbxDcgU1pxv2oHlC7elU/Fa2sYdgw8CAwwWNCmX3U2mmkYnP9GfyEWtpEQNCy5UnIgsCqq+vGDtM6rskIYmdp+9d3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559880; c=relaxed/simple;
	bh=nb0a84r91may5bi4iIT+zMXSm51IJtl2gyiNzRLhUL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqMIZ7btYnRUH6vQlDJz5Rk/DOx5uZpkIRXsZqhM76nmFiOzn8ug7cg6fkwYpouuM11mJMyg4Mji55K5hyoidcPKD4Gzf/sTprg2+pK0qA2ryefFcKR68VFeMERKv3aD71oXYbnA49/aMvLkJofBKgHqsRjeBlYfUACOSxIeYT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Jq4KxQfC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IGf6vxf9zsypeky0r4seWiQtaBkES6aZXzLPl8n5KAA=; b=Jq4KxQfCQ7p8BT2GZGItfwIqJG
	R5lPmk/wiWsZosR8nBx1ByyvGhAu5Smjx2rpvNa9MQrY26r2pRkjrot7IAd76UuzxyatsDPE1lrG5
	myttpdJ9KtXx76ZmrCNwDhAhSs/B4RWdep3mK9LRl2KtE63J9Tma3RofXRxFrLss6zps=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rh8cf-009KPU-0U; Mon, 04 Mar 2024 14:44:53 +0100
Date: Mon, 4 Mar 2024 14:44:52 +0100
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
Subject: Re: [PATCH net-next v5 6/7] net: phy: qcom: at803x: Avoid
 hibernating if MAC requires RX clock
Message-ID: <5118ea7b-8f43-4644-8c42-bd1f37db3eb6@lunn.ch>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-6-8dac30230050@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301-rxc_bugfix-v5-6-8dac30230050@bootlin.com>

On Fri, Mar 01, 2024 at 04:35:03PM +0100, Romain Gantois wrote:
> From: Russell King <linux@armlinux.org.uk>
> 
> Stmmac controllers connected to an at803x PHY cannot resume properly after
> suspend when WoL is enabled. This happens because the MAC requires an RX
> clock generated by the PHY to initialize its hardware properly. But the RX
> clock is cut when the PHY suspends and isn't brought up until the MAC
> driver resumes the phylink.
> 
> Prevent the at803x PHY driver from going into suspend if the attached MAC
> driver always requires an RX clock signal.
> 
> Reported-by: Clark Wang <xiaoning.wang@nxp.com>
> Link: https://lore.kernel.org/all/20230202081559.3553637-1-xiaoning.wang@nxp.com/
> Signed-off-by: Russell King <linux@armlinux.org.uk>
> [rgantois: commit log]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

