Return-Path: <linux-renesas-soc+bounces-5217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5728BEF33
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2024 23:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D53B2860A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2024 21:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3527352D;
	Tue,  7 May 2024 21:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="F4xxBMMf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PEGh8iku"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1F18732F;
	Tue,  7 May 2024 21:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715118625; cv=none; b=fcHzidQkXu5OUuZ0ESTj22AfQYU6VpSUNdlN+dOW9Ao+N9XRCMbSVxMDXELXhYJZjETGZrhbJTi4thQz7lu/MPk8+yb3JLbQy4btJu9uogzkUMD0vBQKN+SKifgcweYOr4YR6JohFkV8zALwgUgaxFiPWKuZ7kCj+AMbHcyPXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715118625; c=relaxed/simple;
	bh=ZQk9M16jF0ICzFFHyB7Ults1MX2CLo+0C5A57sTxXc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJj9P37Ms25vcg4vTGbW6gWZY56LVNIqdHajzOauOR+ujnbqOP5n2V3+/g+C/uy2V42T0DUJ5YTWRbyc4+juaGw52+UAGOhUKzYH4nl9eLe7trw6gViFRbXPP4c1Y8sfQJ+iRdy+/oY3u/ABPFeb1S8ciunTXiCPgmdMzdwmAe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=F4xxBMMf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PEGh8iku; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id D0BDA18000FE;
	Tue,  7 May 2024 17:50:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 07 May 2024 17:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715118620;
	 x=1715205020; bh=azEQRhWXetyDTf0LTHtjgBlUDKQ1T7fZgopwKD7cazg=; b=
	F4xxBMMf4LflRAqK5pD8iTl5RONApGW0paWjykBsP3faj1QjTYBNNmwKUTHqeWSD
	bBuggXmyNuH833iey/ZTLN+xIZu0Eq59f31IsUfCHcARJp0jjqErq+KcUJfGwQvW
	S/7u0w6G3fUjxrSdMZ+H7Ri0bizsqcndTpGhsWdRIxef9LLOyGEoERP6HqZe6/Ns
	bv8dCtzSWtHKp9oQGoLPz30NGMAhVsmT3N0sDnd18WMBEL6deURVMz2x9jZDMN2U
	tQaSiK7D983r7m3sPvrYXMkIhjfy5yOWGWC/Q+LndpTPhcyg7pDBZJaIswbTabO3
	V/zUqL/rB2MeJ7WUB546ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715118620; x=
	1715205020; bh=azEQRhWXetyDTf0LTHtjgBlUDKQ1T7fZgopwKD7cazg=; b=P
	EGh8ikuFxQIAY0WXufbVRVwl3eC3KfFKPC7ErmVYc/SDN6sLXDooFgcuuaouYD7x
	xMG8wwrFgQjwGxjN3YhL+x+Kym4X/wv6IR3PVfyy9FtCQ80Yu6Xnnb9XIMPoCFZD
	KdyECOS+PoowsSAoCKaD42b3tchbV2ODIDlW74kJDtTOe1+GWiaaqEXXwSbZBzfg
	RquI1rcY2gzgQGr0CnPH6ogLlYU97MsEVybMEB3iIH07yoyzCjhPEsx4lk3cKGud
	G1IxNB/7UNrOTreNiraRohoNniOy9Y+tb/olCWWg88LhiIxlSVD1nCyWaPwKaKns
	DSUYsWtHEUvXfCCyitSrw==
X-ME-Sender: <xms:G6I6ZgTP-8t30wpN9J2kcz_LorL9npDdqpomNxi2XXxl5xz55ZfdFg>
    <xme:G6I6ZtzY2q0k0YeCQRga9UAvjk-tLS7wHHVKY94PIunbhEYZGC3-reCmqiAS5y11p
    WcanHAyRr_qqVkI8_o>
X-ME-Received: <xmr:G6I6Zt1VNE9_iJ2IMkBx7sic1jKA6AmXHiKciZq-zA9hdJj83w7z-s_CUhLbPYZmlk1Xidyse_R3CRPM6tNL8Uj8iUslI6U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvledgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:G6I6ZkCJDNFrGQoSbIR4TcQ15PWWAuTnIDZHAfkeyYaadI1_k593xw>
    <xmx:G6I6Zpi06YhAbA3pWs0EZ8Mp8jsJWrzC8_Tk2QgjZXkxTmiw8_rE8w>
    <xmx:G6I6ZgoRyRBsZTABr_1hvG_XLRBk9StH6JR78SK8e5q7WBAaHCf6FQ>
    <xmx:G6I6ZsjOwJ4y49H6H8ghqVOSDt8bkn8rwtmth_dfLbWFM3OmWBt8pA>
    <xmx:HKI6ZqVvyISRnUWXTfjED-0cGo2MqWVafJ-dN6RuVtCJrXLjOaKr8v0N>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 17:50:19 -0400 (EDT)
Date: Tue, 7 May 2024 23:50:17 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240507215017.GA1385281@ragnatech.se>
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
 <b51b7b2d-c6d0-49ef-8b84-b9ed8368c797@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b51b7b2d-c6d0-49ef-8b84-b9ed8368c797@lunn.ch>

Hi Andrew,

Thanks for your feedback.

On 2024-05-07 22:57:47 +0200, Andrew Lunn wrote:
> > +RENESAS ETHERNET TSN DRIVER
> > +M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > +L:	netdev@vger.kernel.org
> > +L:	linux-renesas-soc@vger.kernel.org
> > +S:	Supported
> > +F:	Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
> > +F:	drivers/net/ethernet/renesas/rtsn.*
> > +
> >  RENESAS IDT821034 ASoC CODEC
> >  M:	Herve Codina <herve.codina@bootlin.com>
> >  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> > diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
> > index b03fae7a0f72..ea4aca5f406f 100644
> > --- a/drivers/net/ethernet/renesas/Kconfig
> > +++ b/drivers/net/ethernet/renesas/Kconfig
> > @@ -58,4 +58,15 @@ config RENESAS_GEN4_PTP
> >  	help
> >  	  Renesas R-Car Gen4 gPTP device driver.
> >  
> > +config RTSN
> > +	tristate "Renesas Ethernet-TSN support"
> > +	depends on ARCH_RENESAS || COMPILE_TEST
> > +	depends on PTP_1588_CLOCK
> > +	select CRC32
> > +	select MII
> 
> That is an interesting one. What are you using from MII?

Nothing it seems, this is cargo copied from other renesas drivers, will 
fix for next version.

> 
> > +static int rtsn_request_irq(unsigned int irq, irq_handler_t handler,
> > +			    unsigned long flags, struct rtsn_private *priv,
> > +			    const char *ch)
> > +{
> > +	char *name;
> > +	int ret;
> > +
> > +	name = devm_kasprintf(&priv->pdev->dev, GFP_KERNEL, "%s:%s",
> > +			      priv->ndev->name, ch);
> > +	if (!name)
> > +		return -ENOMEM;
> > +
> > +	ret = request_irq(irq, handler, flags, name, priv);
> > +	if (ret) {
> > +		netdev_err(priv->ndev, "Cannot request IRQ %s\n", name);
> > +		free_irq(irq, priv);
> 
> If requesting an IRQ fails, do you need to free it?

Will fix.

> 
> > +static void rtsn_free_irqs(struct rtsn_private *priv)
> > +{
> > +	free_irq(priv->tx_data_irq, priv);
> > +	free_irq(priv->rx_data_irq, priv);
> > +}
> > +
> > +static int rtsn_request_irqs(struct rtsn_private *priv)
> > +{
> > +	int ret;
> > +
> > +	priv->rx_data_irq = platform_get_irq_byname(priv->pdev, "rx");
> > +	if (priv->rx_data_irq < 0)
> > +		return priv->rx_data_irq;
> > +
> > +	priv->tx_data_irq = platform_get_irq_byname(priv->pdev, "tx");
> > +	if (priv->tx_data_irq < 0)
> > +		return priv->tx_data_irq;
> > +
> > +	ret = rtsn_request_irq(priv->tx_data_irq, rtsn_irq, 0, priv, "tx");
> > +	if (ret)
> > +		goto error;
> > +
> > +	ret = rtsn_request_irq(priv->rx_data_irq, rtsn_irq, 0, priv, "rx");
> > +	if (ret)
> > +		goto error;
> > +
> > +	return 0;
> > +error:
> > +	rtsn_free_irqs(priv);
> 
> This also looks to free IRQs which we potentially never requested.

Will fix.

> 
> > +static void rtsn_set_delay_mode(struct rtsn_private *priv)
> > +{
> > +	struct device_node *np = priv->ndev->dev.parent->of_node;
> > +	u32 delay;
> > +	u32 val;
> > +
> > +	val = 0;
> > +
> > +	/* The MAC is capable of applying a delay on both Rx and Tx. Each
> > +	 * delay can either be on or off, there is no way to set its length.
> > +	 *
> > +	 * The exact delay applied depends on electric characteristics of the
> > +	 * board. The datasheet describes a typical Rx delay of 1800 ps and a
> > +	 * typical Tx delay of 2000 ps.
> > +	 *
> > +	 * There are boards where the RTSN device is used together with PHYs
> > +	 * who do not support a large enough internal delays to function. These
> > +	 * boards depends on the MAC applying these inexact delays.
> > +	 */
> > +
> > +	/* If the phy-mode is rgmii or rgmii-txid apply Rx delay on the MAC */
> > +	if (priv->iface == PHY_INTERFACE_MODE_RGMII ||
> > +	    priv->iface == PHY_INTERFACE_MODE_RGMII_TXID)
> > +		if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay))
> > +			if (delay)
> > +				val |= GPOUT_RDM;
> > +
> > +	/* If the phy-mode is rgmii or rgmii-rxid apply Tx delay on the MAC */
> > +	if (priv->iface == PHY_INTERFACE_MODE_RGMII ||
> > +	    priv->iface == PHY_INTERFACE_MODE_RGMII_RXID)
> > +		if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay))
> > +			if (delay)
> > +				val |= GPOUT_TDM;
> 
> This looks wrong. You should be applying delays for rgmii-id and
> rgmii-rxid. Plain rgmii means no delays are required, because the
> board has extra long clock lines. Same for TX delays, only for
> rgmii-tx or rgmii-id.

This confuses me a bit, from the bindings in ethernet-controller.yaml I 
get this the other way around,

      # RX and TX delays are added by the MAC when required
      - rgmii

      # RGMII with internal RX and TX delays provided by the PHY,
      # the MAC should not add the RX or TX delays in this case
      - rgmii-id

      # RGMII with internal RX delay provided by the PHY, the MAC
      # should not add an RX delay in this case
      - rgmii-rxid

      # RGMII with internal TX delay provided by the PHY, the MAC
      # should not add an TX delay in this case
      - rgmii-txid

The way I understand it is that if if the phy-mode is 'rgmii' the MAC 
shall apply delays if requested and only if the phy-mode is 'rgmii-id' 
shall the MAC completely ignore the delays and let the PHY handle it.

I might just be confused by the bindings. I will reverse the above for 
next version, but want to understand this correctly as this might need 
to be fixed in the other Renesas drivers as well.

> 
> > +static int rtsn_phy_init(struct rtsn_private *priv)
> > +{
> > +	struct device_node *np = priv->ndev->dev.parent->of_node;
> > +	struct phy_device *phydev;
> > +	struct device_node *phy;
> > +
> > +	priv->link = 0;
> > +
> > +	phy = of_parse_phandle(np, "phy-handle", 0);
> > +	if (!phy)
> > +		return -ENOENT;
> > +
> > +	phydev = of_phy_connect(priv->ndev, phy, rtsn_adjust_link, 0,
> > +				priv->iface);
> 
> This also looks wrong. Since you have applied the delays in the MAC,
> you need to mask the value passed to the PHY so it also does not apply
> delays.

Just so I understand correctly, if the phy-mode is A I should pass B to 
of_phy_connect() if I apply the delays in the MAC.

A               B
rgmii           rgmii-id
rgmii-id        rgmii
rgmii-rxid      rgmii-txid
rgmii-txid      rgmii-rxid

> 
>     Andrew
> 
> ---
> pw-bot: cr

-- 
Kind Regards,
Niklas Söderlund

