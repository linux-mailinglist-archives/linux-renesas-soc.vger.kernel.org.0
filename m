Return-Path: <linux-renesas-soc+bounces-24280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8FBC3D637
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 21:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B06204E5EEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 20:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0DF2222A0;
	Thu,  6 Nov 2025 20:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CAX3J1Pd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC2B1D516C;
	Thu,  6 Nov 2025 20:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762461954; cv=none; b=Dcwk7UNF5t+41BsIQoTQc2MoCKpWlanUctMIH6eK5MaOe8dHqy9aKlRBICzJK/q4u7lywk2ujcEr0bmf2+pPn9lElS6Tu4Xmq4tLU0KtHn6uLtyGW+W1HxYUEqU9ZxGP11XVMIz2VqpOuRrrxQWBY+PL0fiot2QP0CEPxfDQkC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762461954; c=relaxed/simple;
	bh=Xmy7dRDkdvm9ZQu6DdJB/1Iur4dRUNxZ9WIXCSto8MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRtiu0ajRs4ulm8Xve6BMF0/283eHXRV/AAI/aJQKvFBfmfjjsjsk5gKRlFFj+vekIVEdoV6R0ESCAKZq55dDwRNPypO1W43iqbQxs0+bkxMb1WhvmAAxwAfFLSGwgHEJi+TtBOTlN3FlnDuhZCmWkjgpUEihYY0wk8Z488hOS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=CAX3J1Pd; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5AYqrRoYwJz/XyJvEoRwNxN1N+YQADetwp+SfH4UdUk=; b=CAX3J1Pd096lssKD0ylA10kO/a
	7u6kBhpgX/inZlV7YVn0O6Es3sBa7Nop38PJLER60aKLJzESNkznNYjZ9Wb09MufyjaY95v+AYbT3
	famsDQ6yGXmAu5otVLtsaQ0r7EHeQ/nN2pDZw7jPxV5qcECkUJkq1f5hmYPQo0f16D70=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vH6rG-00D9aH-Rx; Thu, 06 Nov 2025 21:45:26 +0100
Date: Thu, 6 Nov 2025 21:45:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next] net: phy: mscc: Add support for PHY LEDs on
 VSC8541
Message-ID: <ee6a79ae-4857-44e4-b8e9-29cdd80d828f@lunn.ch>
References: <20251106200309.1096131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106200309.1096131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

> +static int vsc85xx_led_cntl_set_lock_unlock(struct phy_device *phydev,
> +					    u8 led_num,
> +					    u8 mode, bool lock)
>  {
>  	int rc;
>  	u16 reg_val;
>  
> -	mutex_lock(&phydev->lock);
> +	if (lock)
> +		mutex_lock(&phydev->lock);
>  	reg_val = phy_read(phydev, MSCC_PHY_LED_MODE_SEL);
>  	reg_val &= ~LED_MODE_SEL_MASK(led_num);
>  	reg_val |= LED_MODE_SEL(led_num, (u16)mode);
>  	rc = phy_write(phydev, MSCC_PHY_LED_MODE_SEL, reg_val);
> -	mutex_unlock(&phydev->lock);
> +	if (lock)
> +		mutex_unlock(&phydev->lock);
>  
>  	return rc;
>  }

The normal way to do this is have _vsc85xx_led_cntl_set() manipulate
the hardware, no locking. And have vsc85xx_led_cntl_set() take the
lock, call _vsc85xx_led_cntl_set(), and then release the lock. You can
then call _vsc85xx_led_cntl_set() if needed.

> +static int vsc8541_led_combine_disable_set(struct phy_device *phydev, u8 led_num,
> +					   bool combine_disable)
> +{
> +	u16 reg_val;
> +
> +	reg_val = phy_read(phydev, MSCC_PHY_LED_BEHAVIOR);

phy_read() can return a negative value. You should not assign that to
a u16.

Also, BEHAVIOUR.

> +	reg_val &= ~LED_COMBINE_DIS_MASK(led_num);
> +	reg_val |= LED_COMBINE_DIS(led_num, combine_disable);
> +
> +	return phy_write(phydev, MSCC_PHY_LED_BEHAVIOR, reg_val);

You can probably use phy_modify() here.

> +static int vsc8541_led_hw_is_supported(struct phy_device *phydev, u8 index,
> +				       unsigned long rules)
> +{
> +	struct vsc8531_private *vsc8531 = phydev->priv;
> +	static const unsigned long supported = BIT(TRIGGER_NETDEV_LINK) |
> +					       BIT(TRIGGER_NETDEV_LINK_1000) |
> +					       BIT(TRIGGER_NETDEV_LINK_100) |
> +					       BIT(TRIGGER_NETDEV_LINK_10) |
> +					       BIT(TRIGGER_NETDEV_RX) |
> +					       BIT(TRIGGER_NETDEV_TX);
> +

Reverse Christmas tree. The lines should be sorted, longest first,
shortest last.

> +static int vsc8541_led_hw_control_get(struct phy_device *phydev, u8 index,
> +				      unsigned long *rules)
> +{
> +	struct vsc8531_private *vsc8531 = phydev->priv;
> +	u16 reg;
> +
> +	if (index >= vsc8531->nleds)
> +		return -EINVAL;
> +
> +	reg = phy_read(phydev, MSCC_PHY_LED_MODE_SEL) & LED_MODE_SEL_MASK(index);

Another cause of u16, when int should be used. Please check all
instances of phy_read().

> +	reg >>= LED_MODE_SEL_POS(index);
> +	switch (reg) {
> +	case VSC8531_LINK_ACTIVITY:
> +		*rules = BIT(TRIGGER_NETDEV_LINK) |
> +			 BIT(TRIGGER_NETDEV_RX) |
> +			 BIT(TRIGGER_NETDEV_TX);
> +		break;
> +
> +	case VSC8531_LINK_1000_ACTIVITY:
> +		*rules = BIT(TRIGGER_NETDEV_LINK) |
> +			 BIT(TRIGGER_NETDEV_LINK_1000) |
> +			 BIT(TRIGGER_NETDEV_RX) |
> +			 BIT(TRIGGER_NETDEV_TX);
> +		break;
> +
> +	case VSC8531_LINK_100_ACTIVITY:
> +		*rules = BIT(TRIGGER_NETDEV_LINK) |
> +			 BIT(TRIGGER_NETDEV_LINK_100) |
> +			 BIT(TRIGGER_NETDEV_RX) |
> +			 BIT(TRIGGER_NETDEV_TX);
> +		break;
> +
> +	case VSC8531_LINK_10_ACTIVITY:
> +		*rules = BIT(TRIGGER_NETDEV_LINK) |
> +			 BIT(TRIGGER_NETDEV_LINK_10) |
> +			 BIT(TRIGGER_NETDEV_RX) |
> +			 BIT(TRIGGER_NETDEV_TX);
> +		break;
> +
> +	case VSC8531_LINK_100_1000_ACTIVITY:
> +		*rules = BIT(TRIGGER_NETDEV_LINK) |
> +			 BIT(TRIGGER_NETDEV_LINK_100) |
> +			 BIT(TRIGGER_NETDEV_LINK_1000) |
> +			 BIT(TRIGGER_NETDEV_RX) |
> +			 BIT(TRIGGER_NETDEV_TX);
> +		break;
> +
> +	case VSC8531_LINK_10_1000_ACTIVITY:
> +		*rules = BIT(TRIGGER_NETDEV_LINK) |
> +			 BIT(TRIGGER_NETDEV_LINK_10) |
> +			 BIT(TRIGGER_NETDEV_LINK_1000) |
> +			 BIT(TRIGGER_NETDEV_RX) |
> +			 BIT(TRIGGER_NETDEV_TX);
> +		break;
> +
> +	case VSC8531_LINK_10_100_ACTIVITY:
> +		*rules = BIT(TRIGGER_NETDEV_LINK) |
> +			 BIT(TRIGGER_NETDEV_LINK_10) |
> +			 BIT(TRIGGER_NETDEV_LINK_100) |
> +			 BIT(TRIGGER_NETDEV_RX) |
> +			 BIT(TRIGGER_NETDEV_TX);
> +		break;
> +
> +	case VSC8531_ACTIVITY:
> +		*rules = BIT(TRIGGER_NETDEV_LINK) |
> +			 BIT(TRIGGER_NETDEV_RX) |
> +			 BIT(TRIGGER_NETDEV_TX);
> +		break;

Should the combine bit be taken into account here?

> @@ -2343,6 +2532,26 @@ static int vsc85xx_probe(struct phy_device *phydev)
>  	if (!vsc8531->stats)
>  		return -ENOMEM;
>  
> +	phy_id = phydev->drv->phy_id & phydev->drv->phy_id_mask;
> +	if (phy_id == PHY_ID_VSC8541) {

The VSC8541 has its own probe function, vsc8514_probe(). Why is this
needed?

    Andrew

---
pw-bot: cr

