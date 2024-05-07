Return-Path: <linux-renesas-soc+bounces-5216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA8B8BEE76
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2024 22:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37A411F2610D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2024 20:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B07756B6F;
	Tue,  7 May 2024 20:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0a2Wyvey"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13FF54BDE;
	Tue,  7 May 2024 20:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715115483; cv=none; b=qD7cpD9ayXFYk4f6X5gdIDGIzlfEtkygJ8U4VttDazAV270FcOlUQoWGXzNdGwWdKvlm/B0hdCzIcFTqmsEv5BdrmBnlbDAdY51lDxN4RK8nHh7GgZPAP5M4Qu/OLxrki6daHL+AtsIxqu0XrzZRIg0kZO0XlML1bLN63L0xgKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715115483; c=relaxed/simple;
	bh=tHqx6j2RJAN0zoXfEpVpNWdAuCWsQBQlFivx6gEBV50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXU+4Z6IneaqEgRpLepvIPHi4MqOjAkdGLcvyCWz2EGrXBEEFQIeo1hSrec+P2mGsLXCrRAWawfxTcB308zNzofj0Yy+zdGfe0WzVVZICcXN2Z1CqQkMd+QR6DjmMuNRzD4EIyvF6/Vd3nVVW6jjtcxCbAdOZceWa3Xa4bWsbyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0a2Wyvey; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=KkxFR776rqvf78Kq5FtE9NX0Qwi+nHjJxAwCt3Qwpyo=; b=0a
	2WyveyXsVnSgkTGqrrHD1gbw2Ft6P+Xy9iCRjo2nytup4Y0Gkd3Oly9DopM7Q/4+0lLi+ZgZ3T/Pq
	CrAkb9ZZe2OQFolufG2KDRBrAAWxOOiPeHrlfJMx5d9hhhb6dYukkE+7Aqm2jQtzE+LnNmNpp+Aix
	gqBSYNe6CH6c/8Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s4Rsh-00EtE4-OQ; Tue, 07 May 2024 22:57:47 +0200
Date: Tue, 7 May 2024 22:57:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <b51b7b2d-c6d0-49ef-8b84-b9ed8368c797@lunn.ch>
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>

> +RENESAS ETHERNET TSN DRIVER
> +M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +L:	netdev@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
> +F:	drivers/net/ethernet/renesas/rtsn.*
> +
>  RENESAS IDT821034 ASoC CODEC
>  M:	Herve Codina <herve.codina@bootlin.com>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
> index b03fae7a0f72..ea4aca5f406f 100644
> --- a/drivers/net/ethernet/renesas/Kconfig
> +++ b/drivers/net/ethernet/renesas/Kconfig
> @@ -58,4 +58,15 @@ config RENESAS_GEN4_PTP
>  	help
>  	  Renesas R-Car Gen4 gPTP device driver.
>  
> +config RTSN
> +	tristate "Renesas Ethernet-TSN support"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	depends on PTP_1588_CLOCK
> +	select CRC32
> +	select MII

That is an interesting one. What are you using from MII?

> +static int rtsn_request_irq(unsigned int irq, irq_handler_t handler,
> +			    unsigned long flags, struct rtsn_private *priv,
> +			    const char *ch)
> +{
> +	char *name;
> +	int ret;
> +
> +	name = devm_kasprintf(&priv->pdev->dev, GFP_KERNEL, "%s:%s",
> +			      priv->ndev->name, ch);
> +	if (!name)
> +		return -ENOMEM;
> +
> +	ret = request_irq(irq, handler, flags, name, priv);
> +	if (ret) {
> +		netdev_err(priv->ndev, "Cannot request IRQ %s\n", name);
> +		free_irq(irq, priv);

If requesting an IRQ fails, do you need to free it?

> +static void rtsn_free_irqs(struct rtsn_private *priv)
> +{
> +	free_irq(priv->tx_data_irq, priv);
> +	free_irq(priv->rx_data_irq, priv);
> +}
> +
> +static int rtsn_request_irqs(struct rtsn_private *priv)
> +{
> +	int ret;
> +
> +	priv->rx_data_irq = platform_get_irq_byname(priv->pdev, "rx");
> +	if (priv->rx_data_irq < 0)
> +		return priv->rx_data_irq;
> +
> +	priv->tx_data_irq = platform_get_irq_byname(priv->pdev, "tx");
> +	if (priv->tx_data_irq < 0)
> +		return priv->tx_data_irq;
> +
> +	ret = rtsn_request_irq(priv->tx_data_irq, rtsn_irq, 0, priv, "tx");
> +	if (ret)
> +		goto error;
> +
> +	ret = rtsn_request_irq(priv->rx_data_irq, rtsn_irq, 0, priv, "rx");
> +	if (ret)
> +		goto error;
> +
> +	return 0;
> +error:
> +	rtsn_free_irqs(priv);

This also looks to free IRQs which we potentially never requested.

> +static void rtsn_set_delay_mode(struct rtsn_private *priv)
> +{
> +	struct device_node *np = priv->ndev->dev.parent->of_node;
> +	u32 delay;
> +	u32 val;
> +
> +	val = 0;
> +
> +	/* The MAC is capable of applying a delay on both Rx and Tx. Each
> +	 * delay can either be on or off, there is no way to set its length.
> +	 *
> +	 * The exact delay applied depends on electric characteristics of the
> +	 * board. The datasheet describes a typical Rx delay of 1800 ps and a
> +	 * typical Tx delay of 2000 ps.
> +	 *
> +	 * There are boards where the RTSN device is used together with PHYs
> +	 * who do not support a large enough internal delays to function. These
> +	 * boards depends on the MAC applying these inexact delays.
> +	 */
> +
> +	/* If the phy-mode is rgmii or rgmii-txid apply Rx delay on the MAC */
> +	if (priv->iface == PHY_INTERFACE_MODE_RGMII ||
> +	    priv->iface == PHY_INTERFACE_MODE_RGMII_TXID)
> +		if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay))
> +			if (delay)
> +				val |= GPOUT_RDM;
> +
> +	/* If the phy-mode is rgmii or rgmii-rxid apply Tx delay on the MAC */
> +	if (priv->iface == PHY_INTERFACE_MODE_RGMII ||
> +	    priv->iface == PHY_INTERFACE_MODE_RGMII_RXID)
> +		if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay))
> +			if (delay)
> +				val |= GPOUT_TDM;

This looks wrong. You should be applying delays for rgmii-id and
rgmii-rxid. Plain rgmii means no delays are required, because the
board has extra long clock lines. Same for TX delays, only for
rgmii-tx or rgmii-id.

> +static int rtsn_phy_init(struct rtsn_private *priv)
> +{
> +	struct device_node *np = priv->ndev->dev.parent->of_node;
> +	struct phy_device *phydev;
> +	struct device_node *phy;
> +
> +	priv->link = 0;
> +
> +	phy = of_parse_phandle(np, "phy-handle", 0);
> +	if (!phy)
> +		return -ENOENT;
> +
> +	phydev = of_phy_connect(priv->ndev, phy, rtsn_adjust_link, 0,
> +				priv->iface);

This also looks wrong. Since you have applied the delays in the MAC,
you need to mask the value passed to the PHY so it also does not apply
delays.

    Andrew

---
pw-bot: cr

