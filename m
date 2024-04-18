Return-Path: <linux-renesas-soc+bounces-4718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B638AA212
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Apr 2024 20:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71347282342
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Apr 2024 18:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CBF15DBA2;
	Thu, 18 Apr 2024 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0hbyUyr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F88D4F8A3;
	Thu, 18 Apr 2024 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713465131; cv=none; b=LOr1ci1UU9eJp8nYvKOdH1y8vmmkJoIkjf72ODbU5s8VyV8EdZd3vTXYEqgyh2hZiZBKZY95Adx4CQsaMsHi0hqpP07tyVMEgRJDOstn4SSfqZ7eM8qz1zg7oKR74ZvpGDc2R9c6Bnk2gGmvu0h8YSv6tz+aqLGBXR01mOoIaUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713465131; c=relaxed/simple;
	bh=7sczPp8/SmE/hE0h09WAHN4ww6pQIJKKLQzot8pmz1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anrC0Ws1DB1p025qYn1rRU9/OVI/zBAoKU5zkg+CJOOKDmO0ZPhrBEiOsvfQYOrNWqSMV0ypTpFiD99sZw5IbK6RO7g0SZL/BviXGOirFD5HLrsmsd/glTqabu000e/W9pGQJ+9Awghl4+pvm/6Nlbjye5iRp4iIyVJd37dv3rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0hbyUyr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A252C113CC;
	Thu, 18 Apr 2024 18:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713465131;
	bh=7sczPp8/SmE/hE0h09WAHN4ww6pQIJKKLQzot8pmz1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0hbyUyruW91HfTrk/OeOt++hOlJ1MdUe1Ja1sVyu41OqD3EMdJFL8dvcUBJ/t6yJ
	 ektpOJOmK3gjLn3SI/PVsCvnHz444bI6bdM5eCht3lIGboP1N8sTa+OUMViWTYBwBG
	 vYkGLpvb/psvLzxOGwBFUr/tQnCcC1/VLics6GKtMjt+aB0KVsmmuEZK43lR6PaCYh
	 wpRtSfsRjCO3yyXilD9qcN1HZ1gAnkT2mlxKHO4hcewXTO5Tcgom0Zu9PClxdHk/2K
	 0QANbg5ASzm2MjEpiZ/WZeHbuR4sb1/G30OP+k+LxQxVuXxGCIXOI3+1awOY4DoRa+
	 qJKmHl0E7+ETw==
Date: Thu, 18 Apr 2024 19:32:07 +0100
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240418183207.GL3975545@kernel.org>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>

+ Arnd

On Sun, Apr 14, 2024 at 03:59:37PM +0200, Niklas Söderlund wrote:
> Add initial support for Renesas Ethernet-TSN End-station device of R-Car
> V4H. The Ethernet End-station can connect to an Ethernet network using a
> 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> Depending on the connected PHY.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

...

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

Hi Niklas,

I think that the use of __iowbm() means that this will not
compile for many architectures: grep indicates it
is only defined for arm, arm64, and arc.

Perhaps COMPILE_TEST should be qualified somehow?

> +	depends on PTP_1588_CLOCK
> +	select CRC32
> +	select MII
> +	select PHYLIB
> +	select RENESAS_GEN4_PTP
> +	help
> +	  Renesas Ethernet-TSN device driver.
> +
>  endif # NET_VENDOR_RENESAS

...

> diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
>

...

> +static int rtsn_poll(struct napi_struct *napi, int budget)
> +{
> +	struct rtsn_private *priv;
> +	struct net_device *ndev;
> +	unsigned long flags;
> +	int quota = budget;
> +
> +	ndev = napi->dev;
> +	priv = netdev_priv(ndev);
> +
> +	/* Processing RX Descriptor Ring */
> +	if (rtsn_rx(ndev, &quota))
> +		goto out;
> +
> +	/* Processing TX Descriptor Ring */
> +	spin_lock_irqsave(&priv->lock, flags);
> +	rtsn_tx_free(ndev, true);
> +	netif_wake_subqueue(ndev, 0);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	napi_complete(napi);
> +
> +	/* Re-enable TX/RX interrupts */
> +	spin_lock_irqsave(&priv->lock, flags);
> +	rtsn_ctrl_data_irq(priv, true);
> +	__iowmb();
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +out:
> +	return budget - quota;
> +}

...


