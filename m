Return-Path: <linux-renesas-soc+bounces-11605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFE59F8E1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B9641887125
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 08:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32DC1A83E7;
	Fri, 20 Dec 2024 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XupupPfG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B19197A8F;
	Fri, 20 Dec 2024 08:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684104; cv=none; b=F63RFyYl2vIuE7Z7g+8pfNX8XeLkm76Woe8iiWvhd8/sD7+PUpl3qNwo5zCo146za4qa1QDTDlZYhKSDaSjcrAYJxxdeAnO7+alYHgHaRGjdgQuNHr/bSGdC0En0s2xPEajP/S9vlGWsn/hiwA85/Q4AVYns7Ui624GA02iBL/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684104; c=relaxed/simple;
	bh=Qtbfppz/HaVXE/BeA07M+1Tp9cfNt0aMIRIJLlJbctA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDDti8VQApJYK+V+Su6pskEXjM4VbxlMFP2+/4ygNiR2nqSwtXdpttuVLPGwM0VBUjQBzNHPeWygJlUW7LWmzLDHfzo8roNGjwxUvyS9AhIl07XY2goZ8UaI87i2Nu/OvvK2MptlGYFHFYKoeEkwAJSNISKaXdDhFEu+VSzKL7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XupupPfG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734684103; x=1766220103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qtbfppz/HaVXE/BeA07M+1Tp9cfNt0aMIRIJLlJbctA=;
  b=XupupPfG6yUGaCTQNCTwpN6PpDxK2izUPselt749nt4ANJPtPND+CfB9
   0SlYR/dNrcEEMev5dQYTxgcZCxFoInh+muhfYBZO3jhyA/PGuXU0b6gAD
   qtxQ15PEaes49lwUmayQSw8PmnKMnUvFQ9HlDCn4HMkH8E7dOqPUu14VA
   s3618Mb/PLXKghZd+49GSHcCeodAco4xdTow3JV8HJvw4vxab3ct/ZiCj
   90LpCLrOxJMMLjy+mYi8o664I9vu5lvGuzabRftxMInXtSQpXL+17es7I
   OkAW4LWawIyu2jOzPFvczxJub6IGioJWHwAEq/MXxUEROePI9F35ooG4a
   Q==;
X-CSE-ConnectionGUID: 9B3+Nlg+TkyY6Se9KwEn8Q==
X-CSE-MsgGUID: dpXZ63kASEOzOBaCK+0XxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35111945"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="35111945"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 00:41:43 -0800
X-CSE-ConnectionGUID: mjhaqTYlTY2OuJnSpLreWA==
X-CSE-MsgGUID: X+a3B7RBRV+GyXIRJpvbCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135778228"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 00:41:39 -0800
Date: Fri, 20 Dec 2024 09:38:32 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>
Subject: Re: [PATCH net-next 2/2] net: renesas: rswitch: request ts interrupt
 at port open
Message-ID: <Z2UtCBwofyoHlZi0@mev-dev.igk.intel.com>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
 <20241220041659.2985492-3-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220041659.2985492-3-nikita.yoush@cogentembedded.com>

On Fri, Dec 20, 2024 at 09:16:59AM +0500, Nikita Yushchenko wrote:
> Data interrupts are now requested at port open and freed at port close.
> 
> For symmetry, do the same for ts interrupt.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 35 +++++++++++++-------------
>  drivers/net/ethernet/renesas/rswitch.h |  2 +-
>  2 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index eb9dea8b16f3..cc8f2a4e3d70 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -989,18 +989,6 @@ static irqreturn_t rswitch_gwca_ts_irq(int irq, void *dev_id)
>  	return IRQ_NONE;
>  }
>  
> -static int rswitch_gwca_ts_request_irqs(struct rswitch_private *priv)
> -{
> -	int irq;
> -
> -	irq = platform_get_irq_byname(priv->pdev, GWCA_TS_IRQ_RESOURCE_NAME);
> -	if (irq < 0)
> -		return irq;
> -
> -	return devm_request_irq(&priv->pdev->dev, irq, rswitch_gwca_ts_irq,
> -				0, GWCA_TS_IRQ_NAME, priv);
> -}
> -
>  /* Ethernet TSN Agent block (ETHA) and Ethernet MAC IP block (RMAC) */
>  static int rswitch_etha_change_mode(struct rswitch_etha *etha,
>  				    enum rswitch_etha_mode mode)
> @@ -1510,8 +1498,14 @@ static int rswitch_open(struct net_device *ndev)
>  	unsigned long flags;
>  	int ret;
>  
> -	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
> +	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS)) {
> +		ret = request_irq(rdev->priv->gwca.ts_irq, rswitch_gwca_ts_irq,
> +				  0, "rswitch_ts", rdev->priv);
> +		if (ret < 0)
> +			return ret;
> +
>  		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDIE);
> +	}
>  
>  	napi_enable(&rdev->napi);
>  
> @@ -1535,8 +1529,10 @@ static int rswitch_open(struct net_device *ndev)
>  err_request_irq:
>  	napi_disable(&rdev->napi);
>  
> -	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
> +	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS)) {
>  		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
> +		free_irq(rdev->priv->gwca.ts_irq, rdev->priv);
> +	}
>  
>  	return ret;
>  };
> @@ -1562,8 +1558,10 @@ static int rswitch_stop(struct net_device *ndev)
>  
>  	napi_disable(&rdev->napi);
>  
> -	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
> +	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS)) {
>  		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
> +		free_irq(rdev->priv->gwca.ts_irq, rdev->priv);
> +	}
>  
>  	for (tag = find_first_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT);
>  	     tag < TS_TAGS_PER_PORT;
> @@ -2001,9 +1999,10 @@ static int rswitch_init(struct rswitch_private *priv)
>  	if (err < 0)
>  		goto err_ptp_register;
>  
> -	err = rswitch_gwca_ts_request_irqs(priv);
> +	err = platform_get_irq_byname(priv->pdev, GWCA_TS_IRQ_RESOURCE_NAME);
>  	if (err < 0)
> -		goto err_gwca_ts_request_irq;
> +		goto err_gwca_ts_irq;
> +	priv->gwca.ts_irq = err;
>  
>  	err = rswitch_gwca_hw_init(priv);
>  	if (err < 0)
> @@ -2035,7 +2034,7 @@ static int rswitch_init(struct rswitch_private *priv)
>  	rswitch_gwca_hw_deinit(priv);
>  
>  err_gwca_hw_init:
> -err_gwca_ts_request_irq:
> +err_gwca_ts_irq:
>  	rcar_gen4_ptp_unregister(priv->ptp_priv);
>  
>  err_ptp_register:
> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
> index a1e62a6b3844..54b9f059707a 100644
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
> @@ -58,7 +58,6 @@
>  #define GWRO			RSWITCH_GWCA0_OFFSET
>  
>  #define GWCA_TS_IRQ_RESOURCE_NAME	"gwca0_rxts0"
> -#define GWCA_TS_IRQ_NAME		"rswitch: gwca0_rxts0"
>  #define GWCA_TS_IRQ_BIT			BIT(0)
>  
>  #define FWRO	0
> @@ -978,6 +977,7 @@ struct rswitch_gwca {
>  	struct rswitch_gwca_queue *queues;
>  	int num_queues;
>  	struct rswitch_gwca_queue ts_queue;
> +	int ts_irq;
>  	DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
>  };

Wasn't previous implementation more obvious? This ts irq you have one
per device, no per port, so it better fit to one time initialization
instead of checking if it is first and last port.

Anyway, it is your descision, patch looks correct:
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

>  
> -- 
> 2.39.5

