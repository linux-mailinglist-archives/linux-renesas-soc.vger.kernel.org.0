Return-Path: <linux-renesas-soc+bounces-1984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9086C8420D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 11:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 476AC287A70
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 10:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61AD605DD;
	Tue, 30 Jan 2024 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="JfrL0mLt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C7D60DC9;
	Tue, 30 Jan 2024 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706609480; cv=none; b=rAl88wkYzVqzsaLD08+4nRoCGw6pe0rSLiEaD5jJNNaJm64gDylJQP39DWl02iq+oZpJOh2oHsT7fU6RjlETABZ9DI/d4XrgdI0Y/0oQUhzmgLuFmWeNdM9V4hgeTBbMoVBsAN9ymReOuXkv/4oord4ck56fSg8UTrmDh0LVUwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706609480; c=relaxed/simple;
	bh=W7QoO6iHgwZjAZsVyUc+ghmM/zWF/h6xMYSv88tUaAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+0v6zG0qigCkooweauANEdigCQfAeJJ3DWkANptyv587LVccYU0s9t0mfi6dE6HjutX7QM997tRb9lS9hWFXSt2+t8rH0uesA6IcYn7TbcAr22erPuWeAyKEYctMe3rJ0MbGGrLBuaJygPSdKm5uWv44Wu4CggWNOnA8Iglnyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=JfrL0mLt; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9dRwOtvvYYVVB2IliD6ZhiJqf0MxLPS/IjbSsebQhBA=; b=JfrL0mLtG1TD0e6GhhCsVGjpGM
	0O0EouCiyqwAId/45+/giUJrsH9jdrLQMp5YV9No6ugeK+3F0jE6OEYih0dKOqnrHEgP3/y+Zzmwp
	Nli35PRdH7jRs0Jn1g8C4u/T2CcB2TB78w2XxK+NLq3tyZYAa0WpWGBN6PoHvbdiP+PP4O0SN067l
	9KwaO2xIc6j+9kGSJY+81MQGBlFViZquMbLMKyEjsOWa8Ed/uTQU6X470qmddesTtclYJ9jLlY68V
	UxWo1eVipwWdN/mhdEaJIY8uFZBO8j96NnTNuETgCZ6WTf399crIF/53o7ZxJSIjx+Lo4cp4SKRvl
	1pnP0pfA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49382)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rUl59-0001cF-0L;
	Tue, 30 Jan 2024 10:11:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rUl55-0005QY-CY; Tue, 30 Jan 2024 10:11:03 +0000
Date: Tue, 30 Jan 2024 10:11:03 +0000
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
Subject: Re: [PATCH net-next v2 2/7] net: phy: add rxc_always_on flag to
 phylink_pcs
Message-ID: <ZbjLN+FzBSohg1c2@shell.armlinux.org.uk>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
 <20240130-rxc_bugfix-v2-2-5e6c3168e5f0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130-rxc_bugfix-v2-2-5e6c3168e5f0@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Jan 30, 2024 at 10:28:37AM +0100, Romain Gantois wrote:
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
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  drivers/net/phy/phylink.c | 14 ++++++++++++++
>  include/linux/phylink.h   | 11 +++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 851049096488..6fcc0a8ba122 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1042,6 +1042,20 @@ static void phylink_pcs_poll_start(struct phylink *pl)
>  		mod_timer(&pl->link_poll, jiffies + HZ);
>  }
>  
> +int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs)
> +{
> +	int ret = 0;
> +
> +	/* Signal to PCS driver that MAC requires RX clock for init */
> +	if (pl->config->mac_requires_rxc)
> +		pcs->rxc_always_on = true;
> +
> +	if (pcs->ops->pcs_pre_init)
> +		ret = pcs->ops->pcs_pre_init(pcs, pl->link_config.interface);

Given that:
1) phylink supports switching between mutliple different interfaces,
2) from what I can see you are only calling this from stmmac's
   initialisation path,
3) you pass the interface mode to the PCS here

then we don't want the PCS to configure itself for the interface mode
passed in, because this function won't be called when the interface
mode changes - and PCS driver authors will have to bear that in mind.
So...

> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index fcee99632964..71e970271fd3 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -422,6 +427,8 @@ struct phylink_pcs {
>   * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
>   * @pcs_link_up: program the PCS for the resolved link configuration
>   *               (where necessary).
> + * @pcs_pre_init: configure PCS components necessary for MAC hardware
> + *                initialization e.g. RX clock for stmmac.

This is fine as a short description.

>   */
>  struct phylink_pcs_ops {
>  	int (*pcs_validate)(struct phylink_pcs *pcs, unsigned long *supported,
> @@ -441,6 +448,8 @@ struct phylink_pcs_ops {
>  	void (*pcs_an_restart)(struct phylink_pcs *pcs);
>  	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
>  			    phy_interface_t interface, int speed, int duplex);
> +	int (*pcs_pre_init)(struct phylink_pcs *pcs,
> +			    phy_interface_t interface);

... I would prefer this to be called initial_interface to make it
clear that it's just the initial interface mode.

However, do we really need it - if the PCS is supplying the RXC to
the MAC, then is the interface mode between the PCS and PHY all that
relevant at this point?

Also, please note that this is poor documentation for this function
(encouraged by broken kernel doc not able to properly describe "ops"
structures). See further down in the #if 0..#endif block where each
and every function in this ops structure is fully documented. Please
do the same for any new functions added.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

