Return-Path: <linux-renesas-soc+bounces-5761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A95588D6F4D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Jun 2024 12:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EEB6B22170
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Jun 2024 10:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611B77E766;
	Sat,  1 Jun 2024 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q+bgHmRq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C192773C;
	Sat,  1 Jun 2024 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717236786; cv=none; b=bmEUxJLyDblu4KMIp6MJ3Lt4ad9YPMqktyXGAFi31sMnlUmkBpZqftDQF9iBUArWjxfsjq9EdT6DSGhZBFKYo9uA6Z8NJWOr7sGyIpTA448eqmzr9NKc3FawT1+3xPdtRZZCIprrSggA+C3OXt+/ieAt06dVHmtUdQ2JaZaOwvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717236786; c=relaxed/simple;
	bh=y8LFDIhCtkCTRkCYcSsuv/OeLC7SceD2Woukxe9WDvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnZ7nnt22/UaIDPZQtlw+wbGleA/14kv7tfkkbrDtETqWZ2F49i/SCIT3nENJx17owEuVo+ocZK7Kyvd8VgZEp2/0rPKwRL/4Otlp3+D7XuXbmf1A+SwXocIPZKQ9gQj4FsWwp0UmcGi0diXR667ZWUF8jQF93sRWt1VNbqA8BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q+bgHmRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D739FC116B1;
	Sat,  1 Jun 2024 10:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717236785;
	bh=y8LFDIhCtkCTRkCYcSsuv/OeLC7SceD2Woukxe9WDvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q+bgHmRqpK9secEMpGmkvUrAp8EqcPx4c7pTF9sEEkxOD5FTLr6CZx49dg8bSvUJE
	 IoGiMJ40rE1aLu3K6Mhfux0r/dfddJEHBWQwyLwQQr4toHEEzWCaYsgEvjtamm75on
	 vIgt26c8bvBI/4WTSvtr06IOJJw4ny6Jh5minCb05lmcaEK+H0drCmbXKRg8i8Jj6q
	 GSS5ER1rFKQt3WoOcAtLT4ubaenvt5P9kRcTkCyzv9N28g3Y/c/+gp9ib5V9K0ApAl
	 KuCIjtoq3Eipcx1NgPa9eDoKwZACUI1pxHYbGwKiXtXjSvN0xMrKfn+dhXiI8El3mb
	 Fh1E1PI4oVSXA==
Date: Sat, 1 Jun 2024 11:13:00 +0100
From: Simon Horman <horms@kernel.org>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v4 7/7] net: ravb: Allocate RX buffers via page
 pool
Message-ID: <20240601101300.GA491852@kernel.org>
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-8-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528150339.6791-8-paul.barker.ct@bp.renesas.com>

On Tue, May 28, 2024 at 04:03:39PM +0100, Paul Barker wrote:
> This patch makes multiple changes that can't be separated:
> 
>   1) Allocate plain RX buffers via a page pool instead of allocating
>      SKBs, then use build_skb() when a packet is received.
>   2) For GbEth IP, reduce the RX buffer size to 2kB.
>   3) For GbEth IP, merge packets which span more than one RX descriptor
>      as SKB fragments instead of copying data.
> 
> Implementing (1) without (2) would require the use of an order-1 page
> pool (instead of an order-0 page pool split into page fragments) for
> GbEth.
> 
> Implementing (2) without (3) would leave us no space to re-assemble
> packets which span more than one RX descriptor.
> 
> Implementing (3) without (1) would not be possible as the network stack
> expects to use put_page() or page_pool_put_page() to free SKB fragments
> after an SKB is consumed.
> 
> RX checksum offload support is adjusted to handle both linear and
> nonlinear (fragmented) packets.
> 
> This patch gives the following improvements during testing with iperf3.
> 
>   * RZ/G2L:
>     * TCP RX: same bandwidth at -43% CPU load (70% -> 40%)
>     * UDP RX: same bandwidth at -17% CPU load (88% -> 74%)
> 
>   * RZ/G2UL:
>     * TCP RX: +30% bandwidth (726Mbps -> 941Mbps)
>     * UDP RX: +417% bandwidth (108Mbps -> 558Mbps)
> 
>   * RZ/G3S:
>     * TCP RX: +64% bandwidth (562Mbps -> 920Mbps)
>     * UDP RX: +420% bandwidth (90Mbps -> 468Mbps)
> 
>   * RZ/Five:
>     * TCP RX: +217% bandwidth (145Mbps -> 459Mbps)
>     * UDP RX: +470% bandwidth (20Mbps -> 114Mbps)
> 
> There is no significant impact on bandwidth or CPU load in testing on
> RZ/G2H or R-Car M3N.
> 
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Hi Paul,

Some minor feedback from my side.

...

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c

...

> @@ -298,13 +269,14 @@ static void ravb_ring_free(struct net_device *ndev, int q)
>  		priv->tx_ring[q] = NULL;
>  	}
>  
> -	/* Free RX skb ringbuffer */
> -	if (priv->rx_skb[q]) {
> -		for (i = 0; i < priv->num_rx_ring[q]; i++)
> -			dev_kfree_skb(priv->rx_skb[q][i]);
> +	/* Free RX buffers */
> +	for (i = 0; i < priv->num_rx_ring[q]; i++) {
> +		if (priv->rx_buffers[q][i].page)
> +			page_pool_put_page(priv->rx_pool[q], priv->rx_buffers[q][i].page, 0, true);

nit: Networking still prefers code to be 80 columns wide or less.
     It looks like that can be trivially achieved here.

     Flagged by checkpatch.pl --max-line-length=80

>  	}
> -	kfree(priv->rx_skb[q]);
> -	priv->rx_skb[q] = NULL;
> +	kfree(priv->rx_buffers[q]);
> +	priv->rx_buffers[q] = NULL;
> +	page_pool_destroy(priv->rx_pool[q]);
>  
>  	/* Free aligned TX buffers */
>  	kfree(priv->tx_align[q]);
> @@ -317,35 +289,56 @@ static void ravb_ring_free(struct net_device *ndev, int q)
>  	priv->tx_skb[q] = NULL;
>  }
>  
> +static int
> +ravb_alloc_rx_buffer(struct net_device *ndev, int q, u32 entry, gfp_t gfp_mask,
> +		     struct ravb_rx_desc *rx_desc)
> +{
> +	struct ravb_private *priv = netdev_priv(ndev);
> +	const struct ravb_hw_info *info = priv->info;
> +	struct ravb_rx_buffer *rx_buff = &priv->rx_buffers[q][entry];
> +	dma_addr_t dma_addr;
> +	unsigned int size;

nit: I would appreciate it if some consideration could be given to
     moving this driver towards rather than away from reverse xmas
     tree - longest line to shortest - for local variable declarations.

     I'm not suggesting a clean-up patch. Rather, that in cases
     like this where new code is added, and also in cases where
     code is modified, reverse xmas tree is preferred.

     Here I would suggest separating the assinment of rx_buf from
     it's declaration (completely untested!):

	struct ravb_private *priv = netdev_priv(ndev);
	const struct ravb_hw_info *info = priv->info;
	struct ravb_rx_buffer *rx_buff;
	dma_addr_t dma_addr;
	unsigned int size;

	rx_buff = &priv->rx_buffers[q][entry];

     Edward Cree's xmastree tool can be helpful here:
     https://github.com/ecree-solarflare/xmastree

> +
> +	size = info->rx_buffer_size;
> +	rx_buff->page = page_pool_alloc(priv->rx_pool[q], &rx_buff->offset, &size,
> +					gfp_mask);
> +	if (unlikely(!rx_buff->page)) {
> +		/* We just set the data size to 0 for a failed mapping
> +		 * which should prevent DMA from happening...
> +		 */
> +		rx_desc->ds_cc = cpu_to_le16(0);
> +		return -ENOMEM;
> +	}
> +
> +	dma_addr = page_pool_get_dma_addr(rx_buff->page) + rx_buff->offset;
> +	dma_sync_single_for_device(ndev->dev.parent, dma_addr,
> +				   info->rx_buffer_size, DMA_FROM_DEVICE);
> +	rx_desc->dptr = cpu_to_le32(dma_addr);
> +
> +	/* The end of the RX buffer is used to store skb shared data, so we need
> +	 * to ensure that the hardware leaves enough space for this.
> +	 */
> +	rx_desc->ds_cc = cpu_to_le16(info->rx_buffer_size
> +				     - SKB_DATA_ALIGN(sizeof(struct skb_shared_info))
> +				     - ETH_FCS_LEN + sizeof(__sum16));
> +	return 0;
> +}

...

> @@ -816,14 +824,26 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
>  			if (desc_status & MSC_CEEF)
>  				stats->rx_missed_errors++;
>  		} else {
> +			struct ravb_rx_buffer *rx_buff = &priv->rx_buffers[q][entry];
> +			void *rx_addr = page_address(rx_buff->page) + rx_buff->offset;
>  			die_dt = desc->die_dt & 0xF0;
> -			skb = ravb_get_skb_gbeth(ndev, entry, desc);
> +			dma_sync_single_for_cpu(ndev->dev.parent, le32_to_cpu(desc->dptr),
> +						desc_len, DMA_FROM_DEVICE);
> +
>  			switch (die_dt) {
>  			case DT_FSINGLE:
>  			case DT_FSTART:
>  				/* Start of packet:
> -				 * Set initial data length.
> +				 * Prepare an SKB and add initial data.
>  				 */
> +				skb = napi_build_skb(rx_addr, info->rx_buffer_size);
> +				if (unlikely(!skb)) {
> +					stats->rx_errors++;
> +					page_pool_put_page(priv->rx_pool[q],
> +							   rx_buff->page, 0, true);

Here skb is NULL.

> +					break;
> +				}
> +				skb_mark_for_recycle(skb);
>  				skb_put(skb, desc_len);
>  
>  				/* Save this SKB if the packet spans multiple
> @@ -836,14 +856,23 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
>  			case DT_FMID:
>  			case DT_FEND:
>  				/* Continuing a packet:
> -				 * Move data into the saved SKB.
> +				 * Add this buffer as an RX frag.
>  				 */
> -				skb_copy_to_linear_data_offset(priv->rx_1st_skb,
> -							       priv->rx_1st_skb->len,
> -							       skb->data,
> -							       desc_len);
> -				skb_put(priv->rx_1st_skb, desc_len);
> -				dev_kfree_skb(skb);
> +
> +				/* rx_1st_skb will be NULL if napi_build_skb()
> +				 * failed for the first descriptor of a
> +				 * multi-descriptor packet.
> +				 */
> +				if (unlikely(!priv->rx_1st_skb)) {
> +					stats->rx_errors++;
> +					page_pool_put_page(priv->rx_pool[q],
> +							   rx_buff->page, 0, true);

And here skb seems to be uninitialised.

> +					break;
> +				}
> +				skb_add_rx_frag(priv->rx_1st_skb,
> +						skb_shinfo(priv->rx_1st_skb)->nr_frags,
> +						rx_buff->page, rx_buff->offset,
> +						desc_len, info->rx_buffer_size);
>  
>  				/* Set skb to point at the whole packet so that
>  				 * we only need one code path for finishing a

The code between the hunk above and the hunk below is:

				/* Set skb to point at the whole packet so that
				 * we only need one code path for finishing a
				 * packet.
				 */
				skb = priv->rx_1st_skb;
			}
			switch (die_dt) {
			case DT_FSINGLE:
			case DT_FEND:
				/* Finishing a packet:
				 * Determine protocol & checksum, hand off to
				 * NAPI and update our stats.
				 */
				skb->protocol = eth_type_trans(skb, ndev);
				if (ndev->features & NETIF_F_RXCSUM)
					ravb_rx_csum_gbeth(skb);
				stats->rx_bytes += skb->len;
				napi_gro_receive(&priv->napi[q], skb);
				rx_packets++;

It seems that the inter-hunk code above may dereference skb when it is NULL
or uninitialised.

Flagged by Smatch.

> @@ -865,7 +894,16 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
>  				stats->rx_bytes += skb->len;
>  				napi_gro_receive(&priv->napi[q], skb);
>  				rx_packets++;
> +
> +				/* Clear rx_1st_skb so that it will only be
> +				 * non-NULL when valid.
> +				 */
> +				if (die_dt == DT_FEND)
> +					priv->rx_1st_skb = NULL;
>  			}
> +
> +			/* Mark this RX buffer as consumed. */
> +			rx_buff->page = NULL;
>  		}
>  	}
>  

...

