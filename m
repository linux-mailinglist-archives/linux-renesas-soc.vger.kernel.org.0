Return-Path: <linux-renesas-soc+bounces-5680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D2F8D3FE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 22:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B23FC1C21B6C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 20:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11671C8FD9;
	Wed, 29 May 2024 20:52:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D6C1C8FC3;
	Wed, 29 May 2024 20:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717015965; cv=none; b=H3e6HtjzSYZ2QjujaLDDzw+Q1wBNhB8RdHW+q+xpLIJ6QyWxn5+1FqxHCY1euva6FhUhVfvdLcd/H4UHvnlD6pykJaBIeM3vcOFqTb6vZxBofOSf9oEyMghR7vmrQiTCJBkuQEbocDECAEcJ9MGQSfIZNd3h2SGpHiEMJoGnLgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717015965; c=relaxed/simple;
	bh=XrL17gMzC899ukvGXP1nNVuCb5iGiNqOEboHSMDscGw=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Eqjankd5cqMOdXMgH0zLgPoSbMbzKeUtmAya4TdnLyU0RRyU6HrR+N/p6tsHzNVME0+rOOGoefMYzzZdSrSWau04dqPDYQUl6Gmp85DdMMMugbgt6hw9sMp54eUbf5omH1CgkV2ON2wW+eMoF+QfU1q57LJ+qBHm2sTMnAWrHj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.72.107) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 29 May
 2024 23:52:31 +0300
Subject: Re: [net-next PATCH v4 7/7] net: ravb: Allocate RX buffers via page
 pool
To: Paul Barker <paul.barker.ct@bp.renesas.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-8-paul.barker.ct@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <eefce0af-2771-a56c-753d-85fe991fdf31@omp.ru>
Date: Wed, 29 May 2024 23:52:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240528150339.6791-8-paul.barker.ct@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 05/29/2024 20:36:54
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 185600 [May 29 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.72.107 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.72.107
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/29/2024 20:41:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 5/29/2024 5:02:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 5/28/24 6:03 PM, Paul Barker wrote:

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
> ---
> Changes v3->v4:
>   * Used a separate page pool for each RX queue.
>   * Passed struct ravb_rx_desc to ravb_alloc_rx_buffer() so that we can
>     simplify the calling function.
>   * Explained the calculation of rx_desc->ds_cc.
>   * Added handling of nonlinear SKBs in ravb_rx_csum_gbeth().
> 
>  drivers/net/ethernet/renesas/ravb.h      |  10 +-
>  drivers/net/ethernet/renesas/ravb_main.c | 230 ++++++++++++++---------
>  2 files changed, 146 insertions(+), 94 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index 6a7aa7dd17e6..f2091a17fcf7 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
[...]> @@ -1094,7 +1099,8 @@ struct ravb_private {
>  	struct ravb_tx_desc *tx_ring[NUM_TX_QUEUE];
>  	void *tx_align[NUM_TX_QUEUE];
>  	struct sk_buff *rx_1st_skb;
> -	struct sk_buff **rx_skb[NUM_RX_QUEUE];
> +	struct page_pool *rx_pool[NUM_RX_QUEUE];

   Don't we need #include <net/page_pool/types.h>

[...]
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index dd92f074881a..bb7f7d44be6e 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[...]
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

   Do we really need this call?

> +	rx_desc->dptr = cpu_to_le32(dma_addr);
> +
> +	/* The end of the RX buffer is used to store skb shared data, so we need
> +	 * to ensure that the hardware leaves enough space for this.
> +	 */
> +	rx_desc->ds_cc = cpu_to_le16(info->rx_buffer_size
> +				     - SKB_DATA_ALIGN(sizeof(struct skb_shared_info))

   Please leave the - operator on the previous line...

> +				     - ETH_FCS_LEN + sizeof(__sum16));

   Here as well...

> +	return 0;
> +}
> +
>  static u32
>  ravb_rx_ring_refill(struct net_device *ndev, int q, u32 count, gfp_t gfp_mask)
>  {
>  	struct ravb_private *priv = netdev_priv(ndev);
> -	const struct ravb_hw_info *info = priv->info;
>  	struct ravb_rx_desc *rx_desc;
> -	dma_addr_t dma_addr;
>  	u32 i, entry;
>  
>  	for (i = 0; i < count; i++) {
>  		entry = (priv->dirty_rx[q] + i) % priv->num_rx_ring[q];
>  		rx_desc = ravb_rx_get_desc(priv, q, entry);
> -		rx_desc->ds_cc = cpu_to_le16(info->rx_max_desc_use);
>  
> -		if (!priv->rx_skb[q][entry]) {
> -			priv->rx_skb[q][entry] = ravb_alloc_skb(ndev, info, gfp_mask);
> -			if (!priv->rx_skb[q][entry])
> +		if (!priv->rx_buffers[q][entry].page) {
> +			if (unlikely(ravb_alloc_rx_buffer(ndev, q, entry,

   Well, IIRC Greg KH is against using unlikely() unless you have actually
instrumented the code and this gives an improvement... have you? :-)

[...]
> @@ -727,12 +739,22 @@ static void ravb_rx_csum_gbeth(struct sk_buff *skb)
>  	if (unlikely(skb->len < sizeof(__sum16) * 2))
>  		return;
>  
> -	hw_csum = skb_tail_pointer(skb) - sizeof(__sum16);
> +	if (skb_is_nonlinear(skb)) {
> +		last_frag = &shinfo->frags[shinfo->nr_frags - 1];
> +		hw_csum = skb_frag_address(last_frag) + skb_frag_size(last_frag) - sizeof(__sum16);
> +	} else {
> +		hw_csum = skb_tail_pointer(skb) - sizeof(__sum16);
> +	}

   We can do the subtraction only once here...

[...]
> @@ -816,14 +824,26 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
>  			if (desc_status & MSC_CEEF)
>  				stats->rx_missed_errors++;
>  		} else {
> +			struct ravb_rx_buffer *rx_buff = &priv->rx_buffers[q][entry];
> +			void *rx_addr = page_address(rx_buff->page) + rx_buff->offset;

   Need an empty line here...

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

   I'd prefer calling it skb in the comments...

[...]
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

   Hm, can't we do this under *case* DT_FEND above?

[...]

MBR, Sergey

