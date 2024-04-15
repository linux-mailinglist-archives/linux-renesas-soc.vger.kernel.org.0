Return-Path: <linux-renesas-soc+bounces-4629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B75AB8A5DE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 00:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A97EF1C20B52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 22:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EF91581E2;
	Mon, 15 Apr 2024 22:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CHbuCJWH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809B637163;
	Mon, 15 Apr 2024 22:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713221728; cv=none; b=UeryxojHvdy6br3WVBxLsYTLFHFyGNNkNmlzcUyiu8JfbWUngxeUpD/mW3YAb1Q3iPX5e+CtgW5cZZVAKNvgzX4R7/cZbFfMmk2rfUSZPWOJ07kjVg+528mX6kROGQU0Q1OCNLpq4KDXlZbMvedEGRfb9VN8wr3KeiQj/bqdcc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713221728; c=relaxed/simple;
	bh=vNrWg79zp8E9Gy10UqKJrgchk27U7xmOVr++0im7i1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFf6yueyElKTKFjgyvvc/uDeopfpMJQKxcdHBOguZ8nUJlufoItKu7H0AdyKkEgo0SPhZudE0mrQh1iINXDjRmSmEwbcejLOhrPChZ4WGHODXyfGYU5gOY2Tv3v7Z5nmqCfGOjqe+1Q6/S1DaYyoe7RgxjWM2rBxp/62prrUwAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=CHbuCJWH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eahv/bklwljDptMn1vlz60ty2xXz5774rXfatfdTHfI=; b=CHbuCJWHxLTd954WWlWQbHeXnZ
	Gr8gMM/HN/ZsbGlSIyPU7ynh9Pd6PsloQQDWMhkYWVxE8JMa9r/wdY0lynnQj4/u5Xci8Js7oJP46
	WIBdo0WWsIPoIQJcJHsGZ51l9TsWhpi6YGh0y7aBKAYDeGkxMWtjIioH2PmHIZAL2pWw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rwVEG-00D59n-9K; Tue, 16 Apr 2024 00:55:12 +0200
Date: Tue, 16 Apr 2024 00:55:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>

> +static int rtsn_get_phy_params(struct rtsn_private *priv)
> +{
> +	struct device_node *np = priv->ndev->dev.parent->of_node;
> +
> +	of_get_phy_mode(np, &priv->iface);
> +	switch (priv->iface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		priv->speed = 100;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:

There are 4 different RGMII modes, and you probably should be using
PHY_INTERFACE_MODE_RGMII_ID with the PHY. So you should list them all
here.

> +		priv->speed = 1000;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static void rtsn_set_phy_interface(struct rtsn_private *priv)
> +{
> +	u32 val;
> +
> +	switch (priv->iface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		val = MPIC_PIS_MII;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:

And here.

> +		val = MPIC_PIS_GMII;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	rtsn_modify(priv, MPIC, MPIC_PIS_MASK, val);
> +}
> +
> +static void rtsn_set_delay_mode(struct rtsn_private *priv)
> +{
> +	struct device_node *np = priv->ndev->dev.parent->of_node;
> +	u32 delay;
> +	u32 val;
> +
> +	val = 0;
> +
> +	/* Valid values are 0 and 1800, according to DT bindings */

The bindings should not matter. It is what the hardware supports. The
bindings should match the hardware, since it is hard to modify the
hardware to make it match the binding.

> +	if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay))
> +		if (delay)
> +			val |= GPOUT_RDM;
> +
> +	/* Valid values are 0 and 2000, according to DT bindings */
> +	if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay))
> +		if (delay)
> +			val |= GPOUT_TDM;
> +
> +	rtsn_write(priv, GPOUT, val);

So you seem to be using it as bool? That is wrong. It is a number of
pico seconds!

> +static int rtsn_mii_access_indirect(struct mii_bus *bus, bool read, int phyad,
> +				    int devnum, int regnum, u16 data)
> +{
> +	int ret;
> +
> +	ret = rtsn_mii_access(bus, false, phyad, MII_MMD_CTRL, devnum);
> +	if (ret)
> +		return ret;
> +
> +	ret = rtsn_mii_access(bus, false, phyad, MII_MMD_DATA, regnum);
> +	if (ret)
> +		return ret;
> +
> +	ret = rtsn_mii_access(bus, false, phyad, MII_MMD_CTRL,
> +			      devnum | MII_MMD_CTRL_NOINCR);

This looks to be C45 over C22. phylib core knows how to do this, since
it should be the same for all PHYs which implement C45 over C22. So
there is no need for you to implement it again.

> +static int rtsn_mii_register(struct rtsn_private *priv)
> +{
> +	struct platform_device *pdev = priv->pdev;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *mdio_node;
> +	struct mii_bus *mii;
> +	int ret;
> +
> +	mii = mdiobus_alloc();
> +	if (!mii)
> +		return -ENOMEM;
> +
> +	mdio_node = of_get_child_by_name(dev->of_node, "mdio");
> +	if (!mdio_node) {
> +		ret = -ENODEV;
> +		goto out_free_bus;
> +	};
> +
> +	mii->name = "rtsn_mii";
> +	sprintf(mii->id, "%s-%x", pdev->name, pdev->id);
> +	mii->priv = priv;
> +	mii->read = rtsn_mii_read;
> +	mii->write = rtsn_mii_write;
> +	mii->read_c45 = rtsn_mii_read_c45;
> +	mii->write_c45 = rtsn_mii_write_c45;

Just leave these two empty, and the core will do C45 over C22 for you.

> +static void rtsn_phy_deinit(struct rtsn_private *priv)
> +{
> +	phy_stop(priv->ndev->phydev);

I would normally expect rtsn_phy_init() and rtsn_phy_deinit() to be
mirrors. You don't call phy_start() in rtsn_phy_init(), so why do you
call phy_stop() here? It probably should be somewhere else.

> +	phy_disconnect(priv->ndev->phydev);
> +	priv->ndev->phydev = NULL;
> +}


> +static int rtsn_open(struct net_device *ndev)
> +{
> +	struct rtsn_private *priv = netdev_priv(ndev);
> +	int ret;
> +
> +	napi_enable(&priv->napi);
> +
> +	ret = rtsn_init(priv);
> +	if (ret) {
> +		napi_disable(&priv->napi);
> +		return ret;
> +	}
> +
> +	phy_start(ndev->phydev);
> +
> +	netif_start_queue(ndev);
> +
> +	return 0;
> +}
> +
> +static int rtsn_stop(struct net_device *ndev)
> +{
> +	struct rtsn_private *priv = netdev_priv(ndev);

This is probably where your phy_stop() belongs.

> +
> +	napi_disable(&priv->napi);
> +	rtsn_change_mode(priv, OCR_OPC_DISABLE);
> +	rtsn_deinit(priv);
> +
> +	return 0;
> +}

> +
> +static int rtsn_do_ioctl(struct net_device *ndev, struct ifreq *req, int cmd)
> +{
> +	if (!netif_running(ndev))
> +		return -EINVAL;
> +
> +	switch (cmd) {
> +	case SIOCGHWTSTAMP:
> +		return rtsn_hwstamp_get(ndev, req);
> +	case SIOCSHWTSTAMP:
> +		return rtsn_hwstamp_set(ndev, req);
> +	default:
> +		break;
> +	}
> +
> +	return 0;

Call phy_do_ioctl() rather than return 0. That allows the PHY driver
to handle its IOCTLs.

> +static int rtsn_probe(struct platform_device *pdev)
> +{
> +	struct rtsn_private *priv;
> +	struct net_device *ndev;
> +	struct resource *res;
> +	int ret;
> +
> +	ndev = alloc_etherdev_mqs(sizeof(struct rtsn_private), TX_NUM_CHAINS,
> +				  RX_NUM_CHAINS);
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	priv = netdev_priv(ndev);
> +	priv->pdev = pdev;
> +	priv->ndev = ndev;
> +	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev);
> +
> +	spin_lock_init(&priv->lock);
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		ret = -PTR_ERR(priv->clk);
> +		goto error_alloc;
> +	}
> +
> +	priv->reset = devm_reset_control_get(&pdev->dev, NULL);
> +	if (IS_ERR(priv->reset)) {
> +		ret = -PTR_ERR(priv->reset);
> +		goto error_alloc;
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tsnes");
> +	if (!res) {
> +		dev_err(&pdev->dev, "Can't find tsnes resource\n");
> +		ret = -EINVAL;
> +		goto error_alloc;
> +	}
> +
> +	priv->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(priv->base)) {
> +		ret = PTR_ERR(priv->base);
> +		goto error_alloc;
> +	}
> +
> +	SET_NETDEV_DEV(ndev, &pdev->dev);
> +	ether_setup(ndev);
> +
> +	ndev->features = NETIF_F_RXCSUM;
> +	ndev->hw_features = NETIF_F_RXCSUM;
> +	ndev->base_addr = res->start;
> +	ndev->netdev_ops = &rtsn_netdev_ops;
> +	ndev->ethtool_ops = &rtsn_ethtool_ops;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp");
> +	if (!res) {
> +		dev_err(&pdev->dev, "Can't find gptp resource\n");
> +		ret = -EINVAL;
> +		goto error_alloc;
> +	}
> +	priv->ptp_priv->addr = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(priv->ptp_priv->addr)) {
> +		ret = -PTR_ERR(priv->ptp_priv->addr);
> +		goto error_alloc;
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
> +
> +	netif_napi_add(ndev, &priv->napi, rtsn_poll);
> +
> +	rtsn_parse_mac_address(pdev->dev.of_node, ndev);
> +
> +	ret = register_netdev(ndev);
> +	if (ret)
> +		goto error_pm;
> +
> +	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));

You need to be careful what you put after register_netdev(). The
kernel can be sending packets before register_netdev() even
returns. This can happen with NFS root, when the kernel will
immediately try to mount the root file system. Is it safe to handle
packets with the DMA mask set wrong?

	Andrew

