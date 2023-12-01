Return-Path: <linux-renesas-soc+bounces-490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8AF800654
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 09:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A1E22816B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 08:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD38D1C699;
	Fri,  1 Dec 2023 08:55:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDADC12A;
	Fri,  1 Dec 2023 00:55:08 -0800 (PST)
Received: from [192.168.1.103] (178.176.73.221) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 1 Dec
 2023 11:54:59 +0300
Subject: Re: [PATCH net-next v2 8/9] net: rswitch: Add jumbo frames handling
 for TX
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <20231201054655.3731772-1-yoshihiro.shimoda.uh@renesas.com>
 <20231201054655.3731772-9-yoshihiro.shimoda.uh@renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <3d3d27f6-a0ee-993e-f5b8-cd940a5e042f@omp.ru>
Date: Fri, 1 Dec 2023 11:54:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231201054655.3731772-9-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 12/01/2023 08:39:42
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181754 [Dec 01 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 5 0.3.5 98d108ddd984cca1d7e65e595eac546a62b0144b
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.73.221
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 12/01/2023 08:45:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 12/1/2023 5:09:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 12/1/23 8:46 AM, Yoshihiro Shimoda wrote:

> If the driver would like to transmit a jumbo frame like 2KiB or more,
> it should be split into multiple queues. In the near future, to support
> this, add handling specific descriptor types F{START,MID,END}. However,
> such jumbo frames will not happen yet because the maximum MTU size is
> still default for now.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[...]

> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index 009e6bfdad27..c5e3ee8f82bc 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1631,15 +1631,44 @@ static bool rswitch_ext_desc_set(struct rswitch_device *rdev,
[...]
>  static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  {
>  	struct rswitch_device *rdev = netdev_priv(ndev);
>  	struct rswitch_gwca_queue *gq = rdev->tx_queue;
> +	dma_addr_t dma_addr, dma_addr_orig;
>  	netdev_tx_t ret = NETDEV_TX_OK;
>  	struct rswitch_ext_desc *desc;
> -	dma_addr_t dma_addr;
> +	unsigned int i, nr_desc;
> +	u8 die_dt;
> +	u16 len;
>  
> -	if (rswitch_get_num_cur_queues(gq) >= gq->ring_size - 1) {
> +	nr_desc = (skb->len - 1) / RSWITCH_DESC_BUF_SIZE + 1;
> +	if (rswitch_get_num_cur_queues(gq) >= gq->ring_size - nr_desc) {
>  		netif_stop_subqueue(ndev, 0);
>  		return NETDEV_TX_BUSY;
>  	}
> @@ -1647,19 +1676,26 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
>  	if (skb_put_padto(skb, ETH_ZLEN))
>  		return ret;
>  
> -	dma_addr = dma_map_single(ndev->dev.parent, skb->data, skb->len, DMA_TO_DEVICE);
> +	dma_addr_orig = dma_map_single(ndev->dev.parent, skb->data, skb->len, DMA_TO_DEVICE);
>  	if (dma_mapping_error(ndev->dev.parent, dma_addr))

   Not dma_addr_orig? dma_addr isn't even set at this point, no?

[...]

MBR, Sergey

