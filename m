Return-Path: <linux-renesas-soc+bounces-5220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B938B8BF3DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 02:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E78ED1C236C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 00:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE437637;
	Wed,  8 May 2024 00:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1gI1okya"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB78399;
	Wed,  8 May 2024 00:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715129755; cv=none; b=FuiwWk7HT6dgKis6KqR0WMU4syaJRZXNyF+0vOfnwZ3LOCbSw04cxZpoqPUzrEgZCXdDZFZEOjqF9hDucb7iUi6FHp8rP6lLW5ZeqgMPGVhwkfMH7iKZdJZ0GRHmZIKiA56ij0LnIFR/wBuIsEGFgJvt6fc9QKE1QELZoXD+1TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715129755; c=relaxed/simple;
	bh=pBHHYSsmzy00dc1fni0zriJfLcMDz0mkgyUoJiDXets=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDks4h4VvK171oLd/l1ufiGr2WByrLzJDUDVUTakCPfuTJcXXetxi5VWZrJyJflTUvG6fKeY9pO2oqdaFG1NJUyjt8BFRlksvu1upufj+6As7Rb5hEvoUOCkup45M0o8o76LbzwMtY+a8c31KjNXNItbwsXwpmSrqzzCWFV5acs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1gI1okya; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YVZjE1+5CXpPIzEnIp9i8JTcErwf0y2crJAt76oMoMw=; b=1gI1okyaXB3lOrPYFHieKd7cDl
	KoluifXyxyNlaZV71IP5SRgrQsGP4Jr8qRBPzFmsWRyUY1ZypxJHlN6bilT9KlzgTob0FLboD8R+v
	eyd1damuWzdi0phnBTIIV7bIV/OLY1+OiKGnnYUTel53+rA8f9ycgvZFwO0/F97OSUxM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s4Vay-00Eu5G-4D; Wed, 08 May 2024 02:55:44 +0200
Date: Wed, 8 May 2024 02:55:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <4970fd77-504c-4fb3-9c47-e4185d03e74a@lunn.ch>
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>

> +static int rtsn_probe(struct platform_device *pdev)
> +{


> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);


> +static int rtsn_remove(struct platform_device *pdev)
> +{
> +	struct rtsn_private *priv = platform_get_drvdata(pdev);
> +
> +	unregister_netdev(priv->ndev);
> +	rtsn_mdio_free(priv);
> +	rcar_gen4_ptp_unregister(priv->ptp_priv);
> +	rtsn_change_mode(priv, OCR_OPC_DISABLE);
> +	netif_napi_del(&priv->napi);
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);

These appear to be the only two places you do any pm_ stuff. So it
seems pointless. Maybe delete this for the moment, and come back later
to add proper runtime power management?

       Andrew

