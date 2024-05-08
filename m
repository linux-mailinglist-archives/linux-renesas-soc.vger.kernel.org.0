Return-Path: <linux-renesas-soc+bounces-5219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE6A8BF3DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 02:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5175F1F24D86
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 00:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A212622;
	Wed,  8 May 2024 00:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hoCn9aqo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2368621;
	Wed,  8 May 2024 00:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715129551; cv=none; b=jg1YnfVyars937N2tWbicZFkL8w3Y2TJ2L366IGq+ioxD0KLtzzoVfm88Vh0y+lI5jM9S/05GBtCDn4zpUTNy/QYlpJ5OpLETBcbAizpv9GTUlAC8GeyWqcVGUFhdupfUNNC+NKQ5rJsLwuqMTftBTgXs/mMFCrOweMnRIFtZLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715129551; c=relaxed/simple;
	bh=sB4/qry+pSodw3Z8qdjDOAT+IY/uNcQ8+nikFMiTH/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYPGznwtGKuoBHgZE3QA0srSZI4kUwRkxzJjmW6Ul5olw2r8a9VjUI3/F4vizvxmg6Tu2SmyWL7gjeVNtO0HoKChD2n83DCSpjRmKrV1ZcwfqbstdwJrTa8AxfV99W/Lx+7Kk2/FUEYqjqCr5/GjVYQtd6tDHMElf9S1FTCJYWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=hoCn9aqo; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RnwzN1zFiKJ6Mo+l9B22ekjNNfXtVqYT9pVfZnBjIcw=; b=hoCn9aqoXBt+6g6FY71YGYuK7V
	ZF1F6NsbzCvsj3Ai7iLJ2T3BkulFkuatwlcdn0w7Bhc66ofNIFVsTMyvAwoas69IUXuJSa5ZOfoSC
	Y0VtFYC6HX+H8p9jfLZi4nxeZqC3F6kRPTyBtXdvNYIhFbQQkSsHa8OOXA2KAWhnknck=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s4VXf-00Eu4O-0V; Wed, 08 May 2024 02:52:19 +0200
Date: Wed, 8 May 2024 02:52:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <25f23887-061f-4ce6-a424-e5bf269cf8b5@lunn.ch>
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
> +	struct rtsn_private *priv;
> +	struct net_device *ndev;
> +	struct resource *res;
> +	int ret;
> +
> +	ndev = alloc_etherdev_mqs(sizeof(struct rtsn_private), TX_NUM_CHAINS,

...

> +	ether_setup(ndev);

struct net_device *alloc_etherdev_mqs(int sizeof_priv, unsigned int txqs,
				      unsigned int rxqs)
{
	return alloc_netdev_mqs(sizeof_priv, "eth%d", NET_NAME_ENUM,
				ether_setup, txqs, rxqs);
}

Notice the ether_setup here? I think you end up calling it twice.

       Andrew

