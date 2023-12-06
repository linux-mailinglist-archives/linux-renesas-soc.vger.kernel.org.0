Return-Path: <linux-renesas-soc+bounces-791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC22807861
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 20:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02524B20E3E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 19:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2E149F73;
	Wed,  6 Dec 2023 19:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzQiPI39"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5838439FF5;
	Wed,  6 Dec 2023 19:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDACC433C7;
	Wed,  6 Dec 2023 19:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701889682;
	bh=mk22NdkfBNdfAfeeQw1EbdrJEVgfDlAix+kmVnh+OAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzQiPI39g4aUTdmFWCiaHbxzhkqLL06D3ySAS2tTCyPd+pkunmeniZn2Wc/h8DrtC
	 8tftlBzMZKVLLYBhFoWPzlaogzqzOP7gGhQrB3dQ+lHJ0vhmV3v5CmfucCRF1+ZbcM
	 KjqDixsz8OZEoxpbYcX+TR/Z31E2Lygf/+BvN4Ky204Dlzvtlii0CbcGEWg/siFt3b
	 3i/gmOMRnhHgP8t/9y/lOjPdqruEM/nmri3epkrqUliDcZPRqT74ZNvku3gCyGa7aY
	 9JfcriU8Y3QHhGMZEItCHhCOX64mPI+jdwwVXaz21oC5tgVKwsznLuYufJU/MqQ3dV
	 3q7OptYErEaHA==
Date: Wed, 6 Dec 2023 19:07:58 +0000
From: Simon Horman <horms@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v3 3/9] net: rswitch: Use build_skb() for RX
Message-ID: <20231206190758.GZ50400@kernel.org>
References: <20231204012058.3876078-1-yoshihiro.shimoda.uh@renesas.com>
 <20231204012058.3876078-4-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204012058.3876078-4-yoshihiro.shimoda.uh@renesas.com>

On Mon, Dec 04, 2023 at 10:20:52AM +0900, Yoshihiro Shimoda wrote:
> If this hardware receives a jumbo frame like 2KiB or more, it will be
> split into multiple queues. In the near future, to support this, use
> build_skb() instead of netdev_alloc_skb_ip_align().
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

...

>  static void rswitch_gwca_ts_queue_free(struct rswitch_private *priv)
> @@ -308,17 +308,19 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
>  	gq->ring_size = ring_size;
>  	gq->ndev = ndev;
>  
> -	gq->skbs = kcalloc(gq->ring_size, sizeof(*gq->skbs), GFP_KERNEL);
> -	if (!gq->skbs)
> -		return -ENOMEM;
> -
>  	if (!dir_tx) {
> -		rswitch_gwca_queue_alloc_skb(gq, 0, gq->ring_size);
> +		gq->rx_bufs = kcalloc(gq->ring_size, sizeof(*gq->rx_bufs), GFP_KERNEL);
> +		if (!gq->rx_bufs)
> +			goto out;

Hi Shimoda-san,

there is no need to re-spin because of this,
but I have some commends on error handling.

I think that for consistency this can just return -ENOMEM.
Or alternatively, perhaps 'goto out' can be used for the (!gq->skbs)
condition below.

> +		rswitch_gwca_queue_alloc_rx_buf(gq, 0, gq->ring_size);

Not strictly related to this patch, but should
the return value of rswitch_gwca_queue_alloc_rx_buf be checked?

>  
>  		gq->rx_ring = dma_alloc_coherent(ndev->dev.parent,
>  						 sizeof(struct rswitch_ext_ts_desc) *
>  						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
>  	} else {
> +		gq->skbs = kcalloc(gq->ring_size, sizeof(*gq->skbs), GFP_KERNEL);
> +		if (!gq->skbs)
> +			return -ENOMEM;
>  		gq->tx_ring = dma_alloc_coherent(ndev->dev.parent,
>  						 sizeof(struct rswitch_ext_desc) *
>  						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);

...

