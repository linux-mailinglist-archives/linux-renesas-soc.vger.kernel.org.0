Return-Path: <linux-renesas-soc+bounces-23177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1577BE505D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 20:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A39A486FCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 18:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CDD2236E0;
	Thu, 16 Oct 2025 18:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="k9/Kt1Gn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gWk1J9Q4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB32F1E47C5;
	Thu, 16 Oct 2025 18:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760638665; cv=none; b=D0a4XZfL0d+gsy3lqpejOvBF+4AobcYTy+1yazEx6xxDnMOeIkTTIH510EY1OP5PSP5uqL9XHbc9cvwC9Vc1otFbqqeUz0bOkoQCD2Xk7MUA+AJ1yR0SQRVqoADyWIc4jYBB3/pnBvUx336PeIyAZywfU61BFo+apwIq81DQ3DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760638665; c=relaxed/simple;
	bh=XZpUSqwXqAlNoVOmQ5CdKkY7JlbJYd9hqU2/4DLh1tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeqE798xjkzNt9hZ+2wNBROteKvZq1LKVCteehwktGktaNubfEZ/nvYHPHW3ZoVogfOqTXmpYmh7ZzCOcpXyT43WhnbK5Jd55pLEBZDIo32tUWUjfxZLutTiqOc4KAh+5aG0tNALclbfGILhq77Nie9jvCoWvL5ZyoQl3GbmNhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=k9/Kt1Gn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gWk1J9Q4; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6616A7A0104;
	Thu, 16 Oct 2025 14:17:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 16 Oct 2025 14:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760638661;
	 x=1760725061; bh=O8zQOumHcff5BE41xroWoPjmbin2D8hksjOFqY+GZd0=; b=
	k9/Kt1GnapEnTyTic7al6RjWp2dA+Dtv2FwEgebycgilIgP94ynJNXuetnKEOSeP
	dkl51pj0jpv5vE6e+Q06UJDhfF/JY5MTzpuP3HjTuZDsABv4f5SEs755XbvMEs3/
	RPtRjKJP3CJxiF81S/ZZWUDsWph+SnMndIcBggRSNXu0wjPKxHqlY4accEpqYtVb
	Qr0C6UMFS9NrLkJ0ihfTqpuEHDWX+Pc9KZkbZkSKDumNHInI1UWKQp0nYeoIfgXf
	bnPlg+PZYV7hJa3QeyZsqX6RJjQQkFO4Lz27t/54Ua9rJ8UrEiYlXf7L0OpGz5sU
	nO4mYgaUOke7qf8OECJQRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760638661; x=
	1760725061; bh=O8zQOumHcff5BE41xroWoPjmbin2D8hksjOFqY+GZd0=; b=g
	Wk1J9Q4IvxMkoO0P13doCD/jeH9KxfntY8o4LQAgm1PtdhWA4DBArIFoQ1gGQXjv
	buHlLVa7Oh0LP/8FbR7LsEbIDYYyx2tFmp34mlDiSE3kIwc6Be5uPm5BNOWYXfiG
	eA2q/ak8gxGV5M6CRU2Kg5KDx8MNUtAXFyo2pMbsHbf8H2y7Ode5/tWsUynnusT+
	LZA/E5Rv2tjoimKPrUQATeo3duz5YVtfEcuGXj3LkfKezYnz9xVc5zdvBZizMPMK
	q7j2YwzAVhqm9xLr1hAkAJjJkI4+QfKDb2EhGHkhaMaYV9+oSWjRP7V+45JR7GUZ
	PvvEg3aSvz/1eydg/o1Xg==
X-ME-Sender: <xms:wzbxaHDlevEPLIlPSGnvjXsdZ3d2kyfGttoLvdXIXGuM7Yw9w5JP6Q>
    <xme:wzbxaJMgWeu_gIk1ssIbNuiiqeQM38C4fWNt7H91v33M-oK0GxwaOOQ2triBYoRVd
    Veaq6Bb5KYpGgxvMDEBAxOYKHFwa63bvUCikvuQuXNUpnAWf-XX2epf>
X-ME-Received: <xmr:wzbxaNRJA2Zru8HMu0yxIaA_XAYXGRieanoEAexKACerw9TgUnnQZD2y2MkYpmgkN9wX20ubygf_7_lWRqRtuznzMgn2jBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdeileelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepvhgrughimhdrfhgvughorhgvnhhkoheslhhinhhugidruggvvhdprhgt
    phhtthhopehshhgvnhhjihgrnhduheeshhhurgifvghirdgtohhmpdhrtghpthhtohepsh
    grlhhilhdrmhgvhhhtrgeshhhurgifvghirdgtohhmpdhrtghpthhtohepshhhrghojhhi
    jhhivgeshhhurgifvghirdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvh
    eslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvght
    pdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhope
    hkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgr
    thdrtghomh
X-ME-Proxy: <xmx:wzbxaKsuVRmyWSK7-AFu13ZMAwFQSxOFUOueBGB2HEoR30IYdofQxw>
    <xmx:wzbxaLXAk-myJwjpjgOTVHXPsmqw_91NEpOfDI4YJtgMxKKnaVCcGA>
    <xmx:wzbxaOm7w0H0203kG3OJK8pAD5yEP-glKE4_mNIsuDNQMgSAliK8mw>
    <xmx:wzbxaOCqvvLIYhAJx0wX1BzF4G0BlSaSQn9K9y72O7-P_5Gfa1X36A>
    <xmx:xTbxaFCCX8KDoj1GKkNLs1wzpMGktFhLeSeiVtT4OyyUyWI8iUrxtt49>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 14:17:39 -0400 (EDT)
Date: Thu, 16 Oct 2025 20:17:37 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Paul Barker <paul@pbarker.dev>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 4/6] net: ravb: convert to ndo_hwtstamp API
Message-ID: <20251016181737.GD856714@ragnatech.se>
References: <20251016180727.3511399-1-vadim.fedorenko@linux.dev>
 <20251016180727.3511399-5-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251016180727.3511399-5-vadim.fedorenko@linux.dev>

Hi Vadim,

Thanks for your work.

On 2025-10-16 18:07:25 +0000, Vadim Fedorenko wrote:
> Convert driver to use .ndo_hwtstamp_set()/.ndo_hwtstamp_get callbacks.
> ravb_do_ioctl() becomes pure phy_do_ioctl_running(), remove it and
> replace in callbacks.
> 
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 61 ++++++++----------------
>  1 file changed, 19 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 9d3bd65b85ff..113d7c7bd921 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2390,41 +2390,38 @@ static int ravb_close(struct net_device *ndev)
>  	return 0;
>  }
>  
> -static int ravb_hwtstamp_get(struct net_device *ndev, struct ifreq *req)
> +static int ravb_hwtstamp_get(struct net_device *ndev,
> +			     struct kernel_hwtstamp_config *config)
>  {
>  	struct ravb_private *priv = netdev_priv(ndev);
> -	struct hwtstamp_config config;
>  
> -	config.flags = 0;
> -	config.tx_type = priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON :
> -						HWTSTAMP_TX_OFF;
> +	config->flags = 0;
> +	config->tx_type = priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON :
> +						 HWTSTAMP_TX_OFF;
>  	switch (priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE) {
>  	case RAVB_RXTSTAMP_TYPE_V2_L2_EVENT:
> -		config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> +		config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
>  		break;
>  	case RAVB_RXTSTAMP_TYPE_ALL:
> -		config.rx_filter = HWTSTAMP_FILTER_ALL;
> +		config->rx_filter = HWTSTAMP_FILTER_ALL;
>  		break;
>  	default:
> -		config.rx_filter = HWTSTAMP_FILTER_NONE;
> +		config->rx_filter = HWTSTAMP_FILTER_NONE;
>  	}
>  
> -	return copy_to_user(req->ifr_data, &config, sizeof(config)) ?
> -		-EFAULT : 0;
> +	return 0;
>  }
>  
>  /* Control hardware time stamping */
> -static int ravb_hwtstamp_set(struct net_device *ndev, struct ifreq *req)
> +static int ravb_hwtstamp_set(struct net_device *ndev,
> +			     struct kernel_hwtstamp_config *config,
> +			     struct netlink_ext_ack *extack)
>  {
>  	struct ravb_private *priv = netdev_priv(ndev);
> -	struct hwtstamp_config config;
>  	u32 tstamp_rx_ctrl = RAVB_RXTSTAMP_ENABLED;
>  	u32 tstamp_tx_ctrl;
>  
> -	if (copy_from_user(&config, req->ifr_data, sizeof(config)))
> -		return -EFAULT;
> -
> -	switch (config.tx_type) {
> +	switch (config->tx_type) {
>  	case HWTSTAMP_TX_OFF:
>  		tstamp_tx_ctrl = 0;
>  		break;
> @@ -2435,7 +2432,7 @@ static int ravb_hwtstamp_set(struct net_device *ndev, struct ifreq *req)
>  		return -ERANGE;
>  	}
>  
> -	switch (config.rx_filter) {
> +	switch (config->rx_filter) {
>  	case HWTSTAMP_FILTER_NONE:
>  		tstamp_rx_ctrl = 0;
>  		break;
> @@ -2443,36 +2440,14 @@ static int ravb_hwtstamp_set(struct net_device *ndev, struct ifreq *req)
>  		tstamp_rx_ctrl |= RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
>  		break;
>  	default:
> -		config.rx_filter = HWTSTAMP_FILTER_ALL;
> +		config->rx_filter = HWTSTAMP_FILTER_ALL;
>  		tstamp_rx_ctrl |= RAVB_RXTSTAMP_TYPE_ALL;
>  	}
>  
>  	priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
>  	priv->tstamp_rx_ctrl = tstamp_rx_ctrl;
>  
> -	return copy_to_user(req->ifr_data, &config, sizeof(config)) ?
> -		-EFAULT : 0;
> -}
> -
> -/* ioctl to device function */
> -static int ravb_do_ioctl(struct net_device *ndev, struct ifreq *req, int cmd)
> -{
> -	struct phy_device *phydev = ndev->phydev;
> -
> -	if (!netif_running(ndev))
> -		return -EINVAL;
> -
> -	if (!phydev)
> -		return -ENODEV;
> -
> -	switch (cmd) {
> -	case SIOCGHWTSTAMP:
> -		return ravb_hwtstamp_get(ndev, req);
> -	case SIOCSHWTSTAMP:
> -		return ravb_hwtstamp_set(ndev, req);
> -	}
> -
> -	return phy_mii_ioctl(phydev, req, cmd);
> +	return 0;
>  }
>  
>  static int ravb_change_mtu(struct net_device *ndev, int new_mtu)
> @@ -2608,11 +2583,13 @@ static const struct net_device_ops ravb_netdev_ops = {
>  	.ndo_get_stats		= ravb_get_stats,
>  	.ndo_set_rx_mode	= ravb_set_rx_mode,
>  	.ndo_tx_timeout		= ravb_tx_timeout,
> -	.ndo_eth_ioctl		= ravb_do_ioctl,
> +	.ndo_eth_ioctl		= phy_do_ioctl_running,
>  	.ndo_change_mtu		= ravb_change_mtu,
>  	.ndo_validate_addr	= eth_validate_addr,
>  	.ndo_set_mac_address	= eth_mac_addr,
>  	.ndo_set_features	= ravb_set_features,
> +	.ndo_hwtstamp_get	= ravb_hwtstamp_get,
> +	.ndo_hwtstamp_set	= ravb_hwtstamp_set,
>  };
>  
>  /* MDIO bus init function */
> -- 
> 2.47.3
> 

-- 
Kind Regards,
Niklas Söderlund

