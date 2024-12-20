Return-Path: <linux-renesas-soc+bounces-11604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E99A9F8DF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AD4B1894F9C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 08:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020B31A76D5;
	Fri, 20 Dec 2024 08:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAMvZfxu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3D9111A8;
	Fri, 20 Dec 2024 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734683296; cv=none; b=kOOBH55zIidxf9WHpjwY9c5pLUnC+yRQllxVZmN7iVimAivJTfBZyBpzPk4YLBNkEd+kK8ZJhTHys5M0ANOeF8fGFtFeY4gULmEBxnMC1BC2+YrOEKxG+X12NJfauzL1orsUzsXXUwk3mDq0bWe+0N+jLgR9NLN7Ag+wkh6hVX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734683296; c=relaxed/simple;
	bh=BUolVDBtIQse8zvCr3DUE4Z0Avb/V8drmUsWv5/dC0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nb3yXpMBzJo3fsJ5zv7ecpCIiAcR23KKVgbSCokYAFJjHyusboPBAWIvxW3EPOPXfar18cVvcipMs0cWZaw7ZfyJQ5toFja0eNReWzSbn+T6AzFxLxvrsn8jqsBnCoEsXd4rh0QDgoUqUuWC0U+WLxl0CwFA3tnEw1HQME0Zbas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAMvZfxu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734683295; x=1766219295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BUolVDBtIQse8zvCr3DUE4Z0Avb/V8drmUsWv5/dC0A=;
  b=aAMvZfxu8ERkPm0eG8bOWc2JxzAdyMnd4IDgNenTrACAG5Rk9NfUfHjS
   pQ/ExzE5e5L//KCnMd7ogEtICBkkTeSjZujDoL2E1AA9kFDvGSn+ushGF
   P1Y5mTpIm9rat6NfZInSe4ihQ5E8vCVqbGz1aqwYiHssMwWC8P5MpEUSU
   GrmtrQr/eiwVw9CHmf0Dwd4A6CpS/2atcvCS6e8n887Hfs2OIMYEbMAE/
   TLgJvzvWNKny5B9+1tTRLRusZlniEcEAOKbhSEpJxXDxniC4sB4YBn+8P
   7juHLq9362TJ3OkhcJWjm+pmTd6ETm8u6At8zBG6CIZ5a3q23JhldPQZT
   A==;
X-CSE-ConnectionGUID: 4rFGvaYySouChL0aa5GBfw==
X-CSE-MsgGUID: lAyx/gHsRMy1DBsYmaRjsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35373820"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="35373820"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 00:28:13 -0800
X-CSE-ConnectionGUID: HtS1U8X0TKykMA0wnal21A==
X-CSE-MsgGUID: U8Vo4j0TQU6ybbq5q3G2WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="103528709"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 00:28:10 -0800
Date: Fri, 20 Dec 2024 09:25:02 +0100
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
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq
 handlers
Message-ID: <Z2Up3mE5ED6uYVGP@mev-dev.igk.intel.com>
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com>
 <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>

On Fri, Dec 20, 2024 at 09:16:58AM +0500, Nikita Yushchenko wrote:
> Instead of handling all possible data interrupts in the same handler,
> switch to per-port handlers.
> 
> This significantly simplifies handling: when the same interrupt is used
> for several ports, system calls all handlers, and each handler only has
> to check interrupts for one port's tx and rx queues.
> 
> But it is not required to use the same interrupt for all ports - GWCA
> provides 8 data interrupts and allows arbitrary per-queue assignment
> of those. Support that by reading interrupt index for each port from
> optional 'irq-index' device tree property.
> 
> With per-port interrupts it becomes possible to configure affinity such
> that traffic coming from different ports is serviced simultaneously on
> different CPUs.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 190 ++++++++++---------------
>  drivers/net/ethernet/renesas/rswitch.h |  10 +-
>  2 files changed, 82 insertions(+), 118 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index 84d09a8973b7..eb9dea8b16f3 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -99,15 +99,6 @@ static void rswitch_coma_init(struct rswitch_private *priv)
>  	iowrite32(CABPPFLC_INIT_VALUE, priv->addr + CABPPFLC0);
>  }
>  
> -/* R-Switch-2 block (TOP) */
> -static void rswitch_top_init(struct rswitch_private *priv)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < RSWITCH_MAX_NUM_QUEUES; i++)
> -		iowrite32((i / 16) << (GWCA_INDEX * 8), priv->addr + TPEMIMC7(i));
> -}
> -
>  /* Forwarding engine block (MFWD) */
>  static void rswitch_fwd_init(struct rswitch_private *priv)
>  {
> @@ -175,29 +166,6 @@ static int rswitch_gwca_axi_ram_reset(struct rswitch_private *priv)
>  	return rswitch_reg_wait(priv->addr, GWARIRM, GWARIRM_ARR, GWARIRM_ARR);
>  }
>  
> -static bool rswitch_is_any_data_irq(struct rswitch_private *priv, u32 *dis, bool tx)
> -{
> -	u32 *mask = tx ? priv->gwca.tx_irq_bits : priv->gwca.rx_irq_bits;
> -	unsigned int i;
> -
> -	for (i = 0; i < RSWITCH_NUM_IRQ_REGS; i++) {
> -		if (dis[i] & mask[i])
> -			return true;
> -	}
> -
> -	return false;
> -}
> -
> -static void rswitch_get_data_irq_status(struct rswitch_private *priv, u32 *dis)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < RSWITCH_NUM_IRQ_REGS; i++) {
> -		dis[i] = ioread32(priv->addr + GWDIS(i));
> -		dis[i] &= ioread32(priv->addr + GWDIE(i));
> -	}
> -}
> -
>  static void rswitch_enadis_data_irq(struct rswitch_private *priv,
>  				    unsigned int index, bool enable)
>  {
> @@ -206,12 +174,18 @@ static void rswitch_enadis_data_irq(struct rswitch_private *priv,
>  	iowrite32(BIT(index % 32), priv->addr + offs);
>  }
>  
> -static void rswitch_ack_data_irq(struct rswitch_private *priv,
> -				 unsigned int index)
> +static bool rswitch_check_ack_data_irq(struct rswitch_private *priv,
> +				       unsigned int index)
>  {
> -	u32 offs = GWDIS(index / 32);
> +	u32 reg = GWDIS(index / 32);
> +	u32 bit = BIT(index % 32);
>  
> -	iowrite32(BIT(index % 32), priv->addr + offs);
> +	if (ioread32(priv->addr + reg) & bit) {
> +		iowrite32(bit, priv->addr + reg);
> +		return true;
> +	}
> +
> +	return false;
>  }
>  
>  static unsigned int rswitch_next_queue_index(struct rswitch_gwca_queue *gq,
> @@ -314,8 +288,6 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
>  				    struct rswitch_gwca_queue *gq,
>  				    bool dir_tx, unsigned int ring_size)
>  {
> -	unsigned int i, bit;
> -
>  	gq->dir_tx = dir_tx;
>  	gq->ring_size = ring_size;
>  	gq->ndev = ndev;
> @@ -345,13 +317,6 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
>  	if (!gq->rx_ring && !gq->tx_ring)
>  		goto out;
>  
> -	i = gq->index / 32;
> -	bit = BIT(gq->index % 32);
> -	if (dir_tx)
> -		priv->gwca.tx_irq_bits[i] |= bit;
> -	else
> -		priv->gwca.rx_irq_bits[i] |= bit;
> -
>  	return 0;
>  
>  out:
> @@ -583,6 +548,15 @@ static void rswitch_gwca_put(struct rswitch_private *priv,
>  	clear_bit(gq->index, priv->gwca.used);
>  }
>  
> +static void rswitch_gwca_queue_assign_irq(struct rswitch_private *priv,
> +					  struct rswitch_gwca_queue *gq,
> +					  unsigned int irq_index)
> +{
> +	rswitch_modify(priv->addr, TPEMIMC7(gq->index),
> +		       TPEMIMC7_GDICM(GWCA_INDEX),
> +		       TPEMIMC7_GDICM_PREP(GWCA_INDEX, irq_index));
> +}
> +
>  static int rswitch_txdmac_alloc(struct net_device *ndev)
>  {
>  	struct rswitch_device *rdev = netdev_priv(ndev);
> @@ -614,6 +588,7 @@ static int rswitch_txdmac_init(struct rswitch_private *priv, unsigned int index)
>  {
>  	struct rswitch_device *rdev = priv->rdev[index];
>  
> +	rswitch_gwca_queue_assign_irq(priv, rdev->tx_queue, rdev->irq_index);
>  	return rswitch_gwca_queue_format(rdev->ndev, priv, rdev->tx_queue);
>  }
>  
> @@ -649,6 +624,7 @@ static int rswitch_rxdmac_init(struct rswitch_private *priv, unsigned int index)
>  	struct rswitch_device *rdev = priv->rdev[index];
>  	struct net_device *ndev = rdev->ndev;
>  
> +	rswitch_gwca_queue_assign_irq(priv, rdev->rx_queue, rdev->irq_index);
>  	return rswitch_gwca_queue_ext_ts_format(ndev, priv, rdev->rx_queue);
>  }
>  
> @@ -933,9 +909,13 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
>  	return 0;
>  }
>  
> -static void rswitch_queue_interrupt(struct net_device *ndev)
> +static irqreturn_t rswitch_gwca_data_irq(int irq, void *data)
>  {
> -	struct rswitch_device *rdev = netdev_priv(ndev);
> +	struct rswitch_device *rdev = data;
> +
> +	if (!rswitch_check_ack_data_irq(rdev->priv, rdev->tx_queue->index) &&
> +	    !rswitch_check_ack_data_irq(rdev->priv, rdev->rx_queue->index))
> +		return IRQ_NONE;
>  
>  	if (napi_schedule_prep(&rdev->napi)) {
>  		spin_lock(&rdev->priv->lock);
> @@ -944,71 +924,10 @@ static void rswitch_queue_interrupt(struct net_device *ndev)
>  		spin_unlock(&rdev->priv->lock);
>  		__napi_schedule(&rdev->napi);
>  	}
> -}
> -
> -static irqreturn_t rswitch_data_irq(struct rswitch_private *priv, u32 *dis)
> -{
> -	struct rswitch_gwca_queue *gq;
> -	unsigned int i, index, bit;
> -
> -	for (i = 0; i < priv->gwca.num_queues; i++) {
> -		gq = &priv->gwca.queues[i];
> -		index = gq->index / 32;
> -		bit = BIT(gq->index % 32);
> -		if (!(dis[index] & bit))
> -			continue;
> -
> -		rswitch_ack_data_irq(priv, gq->index);
> -		rswitch_queue_interrupt(gq->ndev);
> -	}
>  
>  	return IRQ_HANDLED;
>  }
>  
> -static irqreturn_t rswitch_gwca_irq(int irq, void *dev_id)
> -{
> -	struct rswitch_private *priv = dev_id;
> -	u32 dis[RSWITCH_NUM_IRQ_REGS];
> -	irqreturn_t ret = IRQ_NONE;
> -
> -	rswitch_get_data_irq_status(priv, dis);
> -
> -	if (rswitch_is_any_data_irq(priv, dis, true) ||
> -	    rswitch_is_any_data_irq(priv, dis, false))
> -		ret = rswitch_data_irq(priv, dis);
> -
> -	return ret;
> -}
> -
> -static int rswitch_gwca_request_irqs(struct rswitch_private *priv)
> -{
> -	char *resource_name, *irq_name;
> -	int i, ret, irq;
> -
> -	for (i = 0; i < GWCA_NUM_IRQS; i++) {
> -		resource_name = kasprintf(GFP_KERNEL, GWCA_IRQ_RESOURCE_NAME, i);
> -		if (!resource_name)
> -			return -ENOMEM;
> -
> -		irq = platform_get_irq_byname(priv->pdev, resource_name);
> -		kfree(resource_name);
> -		if (irq < 0)
> -			return irq;
> -
> -		irq_name = devm_kasprintf(&priv->pdev->dev, GFP_KERNEL,
> -					  GWCA_IRQ_NAME, i);
> -		if (!irq_name)
> -			return -ENOMEM;
> -
> -		ret = devm_request_irq(&priv->pdev->dev, irq, rswitch_gwca_irq,
> -				       0, irq_name, priv);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static void rswitch_ts(struct rswitch_private *priv)
>  {
>  	struct rswitch_gwca_queue *gq = &priv->gwca.ts_queue;
> @@ -1589,12 +1508,18 @@ static int rswitch_open(struct net_device *ndev)
>  {
>  	struct rswitch_device *rdev = netdev_priv(ndev);
>  	unsigned long flags;
> +	int ret;
>  
>  	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
>  		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDIE);
>  
>  	napi_enable(&rdev->napi);
>  
> +	ret = request_irq(rdev->irq, rswitch_gwca_data_irq, IRQF_SHARED,
It wasn't shared previously, maybe some notes in commit message about
that.

> +			  netdev_name(ndev), rdev);
> +	if (ret < 0)
> +		goto err_request_irq;
> +
>  	spin_lock_irqsave(&rdev->priv->lock, flags);
>  	bitmap_set(rdev->priv->opened_ports, rdev->port, 1);
>  	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, true);
> @@ -1606,6 +1531,14 @@ static int rswitch_open(struct net_device *ndev)
>  	netif_start_queue(ndev);
>  
>  	return 0;
> +
> +err_request_irq:
> +	napi_disable(&rdev->napi);
> +
> +	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
> +		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
> +
> +	return ret;
>  };
>  
>  static int rswitch_stop(struct net_device *ndev)
> @@ -1625,6 +1558,8 @@ static int rswitch_stop(struct net_device *ndev)
>  	bitmap_clear(rdev->priv->opened_ports, rdev->port, 1);
>  	spin_unlock_irqrestore(&rdev->priv->lock, flags);
>  
> +	free_irq(rdev->irq, rdev);
> +
>  	napi_disable(&rdev->napi);
>  
>  	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
> @@ -1906,6 +1841,34 @@ static void rswitch_etha_init(struct rswitch_private *priv, unsigned int index)
>  	etha->psmcs = clk_get_rate(priv->clk) / 100000 / (25 * 2) - 1;
>  }
>  
> +static int rswitch_port_get_irq(struct rswitch_device *rdev)
> +{
> +	unsigned int irq_index;
> +	char *name;
> +	int err;
> +
> +	err = of_property_read_u32(rdev->np_port, "irq-index", &irq_index);
> +	if (err == 0) {
Usually if (!err) is used.

> +		if (irq_index < GWCA_NUM_IRQS)
> +			rdev->irq_index = irq_index;
> +		else
> +			dev_warn(&rdev->priv->pdev->dev,
> +				 "%pOF: irq-index out of range\n",
> +				 rdev->np_port);
Why not return here? It is a little counter intuitive, maybe:
if (err) {
	dev_warn();
	return -ERR;
}

if (irq_index < NUM_IRQS) {
	dev_warn();
	return -ERR;
}
> +	}
> +
> +	name = kasprintf(GFP_KERNEL, GWCA_IRQ_RESOURCE_NAME, rdev->irq_index);

In case with not returning you are using invalid rdev_irq_index here
(probably 0, so may it be fine, I am only wondering).

> +	if (!name)
> +		return -ENOMEM;
> +	err = platform_get_irq_byname(rdev->priv->pdev, name);
> +	kfree(name);
> +	if (err < 0)
> +		return err;
> +	rdev->irq = err;

If you will be changing sth here consider:
rdev->irq = platform()
if (rdev->irq < 0)
	return rdev->irq;
> +
> +	return 0;
> +}
> +
>  static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index)
>  {
>  	struct platform_device *pdev = priv->pdev;
> @@ -1954,6 +1917,10 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
>  	if (err < 0)
>  		goto out_get_params;
>  
> +	err = rswitch_port_get_irq(rdev);
> +	if (err < 0)
You are returning 0 in case of success, the netdev code style is to
check it like that: if (!err)

> +		goto out_get_irq;
If you will use the label name according to what does happen under label
you will not have to add another one. Feel free to leave it as it is, as
you have the same scheme across driver with is completle fine. You can
check Przemek's answer according "came from" convention [1].

[1] https://lore.kernel.org/netdev/20241218150949.1037752-1-tariqt@nvidia.com/T/#m577436e76d3d1afce18676ad87be74e8f5b3cc02
> +
>  	err = rswitch_rxdmac_alloc(ndev);
>  	if (err < 0)
>  		goto out_rxdmac;
> @@ -1968,6 +1935,7 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
>  	rswitch_rxdmac_free(ndev);
>  
>  out_rxdmac:
> +out_get_irq:
>  out_get_params:
>  	of_node_put(rdev->np_port);
>  	netif_napi_del(&rdev->napi);
> @@ -2003,7 +1971,6 @@ static int rswitch_init(struct rswitch_private *priv)
>  	rswitch_reset(priv);
>  
>  	rswitch_clock_enable(priv);
> -	rswitch_top_init(priv);
>  	err = rswitch_bpool_config(priv);
>  	if (err < 0)
>  		return err;
> @@ -2034,10 +2001,6 @@ static int rswitch_init(struct rswitch_private *priv)
>  	if (err < 0)
>  		goto err_ptp_register;
>  
> -	err = rswitch_gwca_request_irqs(priv);
> -	if (err < 0)
> -		goto err_gwca_request_irq;
> -
>  	err = rswitch_gwca_ts_request_irqs(priv);
>  	if (err < 0)
>  		goto err_gwca_ts_request_irq;
> @@ -2073,7 +2036,6 @@ static int rswitch_init(struct rswitch_private *priv)
>  
>  err_gwca_hw_init:
>  err_gwca_ts_request_irq:
> -err_gwca_request_irq:
>  	rcar_gen4_ptp_unregister(priv->ptp_priv);
>  
>  err_ptp_register:
> diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
> index 532192cbca4b..a1e62a6b3844 100644
> --- a/drivers/net/ethernet/renesas/rswitch.h
> +++ b/drivers/net/ethernet/renesas/rswitch.h
> @@ -51,7 +51,6 @@
>  
>  /* TODO: hardcoded ETHA/GWCA settings for now */
>  #define GWCA_IRQ_RESOURCE_NAME	"gwca0_rxtx%d"
> -#define GWCA_IRQ_NAME		"rswitch: gwca0_rxtx%d"
>  #define GWCA_NUM_IRQS		8
>  #define GWCA_INDEX		0
>  #define AGENT_INDEX_GWCA	3
> @@ -828,6 +827,10 @@ enum rswitch_gwca_mode {
>  
>  /* TOP */
>  #define TPEMIMC7(queue)		(TPEMIMC70 + (queue) * 4)
> +#define TPEMIMC7_GDICM0			GENMASK(2, 0)
> +#define TPEMIMC7_GDICM_SHIFT(i)		((i) * 8)
> +#define TPEMIMC7_GDICM(i)		(TPEMIMC7_GDICM0 << TPEMIMC7_GDICM_SHIFT(i))
> +#define TPEMIMC7_GDICM_PREP(i, val)	(((val) & TPEMIMC7_GDICM0) << TPEMIMC7_GDICM_SHIFT(i))
>  
>  /* Descriptors */
>  enum RX_DS_CC_BIT {
> @@ -967,7 +970,6 @@ struct rswitch_gwca_queue {
>  	};
>  };
>  
> -#define RSWITCH_NUM_IRQ_REGS	(RSWITCH_MAX_NUM_QUEUES / BITS_PER_TYPE(u32))
>  struct rswitch_gwca {
>  	unsigned int index;
>  	struct rswitch_desc *linkfix_table;
> @@ -977,8 +979,6 @@ struct rswitch_gwca {
>  	int num_queues;
>  	struct rswitch_gwca_queue ts_queue;
>  	DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
> -	u32 tx_irq_bits[RSWITCH_NUM_IRQ_REGS];
> -	u32 rx_irq_bits[RSWITCH_NUM_IRQ_REGS];
>  };
>  
>  #define NUM_QUEUES_PER_NDEV	2
> @@ -990,6 +990,8 @@ struct rswitch_device {
>  	void __iomem *addr;
>  	struct rswitch_gwca_queue *tx_queue;
>  	struct rswitch_gwca_queue *rx_queue;
> +	unsigned int irq_index;
> +	int irq;
>  	struct sk_buff *ts_skb[TS_TAGS_PER_PORT];
>  	DECLARE_BITMAP(ts_skb_used, TS_TAGS_PER_PORT);
>  	bool disabled;
> -- 
> 2.39.5

