Return-Path: <linux-renesas-soc+bounces-5755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D118D681F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 19:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87023B20BAD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 17:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6244176ABA;
	Fri, 31 May 2024 17:25:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C7355E4C;
	Fri, 31 May 2024 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717176358; cv=none; b=ta8FjahfJ/VsiEH16ivs/PJ8gwfEBfAlfUiumfbNOr7E0+JZr6JH0K8WZGxqQGCb0NiJZfqjNqSEzu7oXlqLSMyBQSeg3uRHuSasoso/+MUnFCGtQKGxmR9w7vLOB2hrEroAKQKZvZduhlwl9n+ut4NpKft+rE/7wtORa78Etb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717176358; c=relaxed/simple;
	bh=ZWgpS0W3Gu1vL+QPpeRCpIdJcGFrwbbUpa/7iI5oy58=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=UrMObpx+EolmuH+c44FvirMTm2b+/RTcFaXnwOnk8NXQRXCCXbaUXQ9UwLcrqqJKQFAt8I/6WWNeulWp/+15A45FVu8611kyPQ/m/cv2/9HOoS9gyxf81xcDULaO2iib6vM/4SJxEsDlDIe7ehIzq49uqdKMtJc8B5bubQQM1Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.78.69) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 31 May
 2024 20:25:33 +0300
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
 <eefce0af-2771-a56c-753d-85fe991fdf31@omp.ru>
 <e7cf9dd8-9c67-476b-a892-b8dbe9312c4c@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <a59baa2d-0f00-18b9-bdea-0206b7a93f52@omp.ru>
Date: Fri, 31 May 2024 20:25:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e7cf9dd8-9c67-476b-a892-b8dbe9312c4c@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 05/31/2024 17:10:09
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 185664 [May 31 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.69 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.78.69
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/31/2024 17:14:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 5/31/2024 12:02:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 5/30/24 12:21 PM, Paul Barker wrote:
[...]

>>> This patch makes multiple changes that can't be separated:
>>>
>>>   1) Allocate plain RX buffers via a page pool instead of allocating
>>>      SKBs, then use build_skb() when a packet is received.
>>>   2) For GbEth IP, reduce the RX buffer size to 2kB.
>>>   3) For GbEth IP, merge packets which span more than one RX descriptor
>>>      as SKB fragments instead of copying data.
>>>
>>> Implementing (1) without (2) would require the use of an order-1 page
>>> pool (instead of an order-0 page pool split into page fragments) for
>>> GbEth.
>>>
>>> Implementing (2) without (3) would leave us no space to re-assemble
>>> packets which span more than one RX descriptor.
>>>
>>> Implementing (3) without (1) would not be possible as the network stack
>>> expects to use put_page() or page_pool_put_page() to free SKB fragments
>>> after an SKB is consumed.
>>>
>>> RX checksum offload support is adjusted to handle both linear and
>>> nonlinear (fragmented) packets.
>>>
>>> This patch gives the following improvements during testing with iperf3.
>>>
>>>   * RZ/G2L:
>>>     * TCP RX: same bandwidth at -43% CPU load (70% -> 40%)
>>>     * UDP RX: same bandwidth at -17% CPU load (88% -> 74%)
>>>
>>>   * RZ/G2UL:
>>>     * TCP RX: +30% bandwidth (726Mbps -> 941Mbps)
>>>     * UDP RX: +417% bandwidth (108Mbps -> 558Mbps)
>>>
>>>   * RZ/G3S:
>>>     * TCP RX: +64% bandwidth (562Mbps -> 920Mbps)
>>>     * UDP RX: +420% bandwidth (90Mbps -> 468Mbps)
>>>
>>>   * RZ/Five:
>>>     * TCP RX: +217% bandwidth (145Mbps -> 459Mbps)
>>>     * UDP RX: +470% bandwidth (20Mbps -> 114Mbps)
>>>
>>> There is no significant impact on bandwidth or CPU load in testing on
>>> RZ/G2H or R-Car M3N.
>>>
>>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
[...]

>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>> index dd92f074881a..bb7f7d44be6e 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[...]
>>> +	return 0;
>>> +}
>>> +
>>>  static u32
>>>  ravb_rx_ring_refill(struct net_device *ndev, int q, u32 count, gfp_t gfp_mask)
>>>  {
>>>  	struct ravb_private *priv = netdev_priv(ndev);
>>> -	const struct ravb_hw_info *info = priv->info;
>>>  	struct ravb_rx_desc *rx_desc;
>>> -	dma_addr_t dma_addr;
>>>  	u32 i, entry;
>>>  
>>>  	for (i = 0; i < count; i++) {
>>>  		entry = (priv->dirty_rx[q] + i) % priv->num_rx_ring[q];
>>>  		rx_desc = ravb_rx_get_desc(priv, q, entry);
>>> -		rx_desc->ds_cc = cpu_to_le16(info->rx_max_desc_use);
>>>  
>>> -		if (!priv->rx_skb[q][entry]) {
>>> -			priv->rx_skb[q][entry] = ravb_alloc_skb(ndev, info, gfp_mask);
>>> -			if (!priv->rx_skb[q][entry])
>>> +		if (!priv->rx_buffers[q][entry].page) {
>>> +			if (unlikely(ravb_alloc_rx_buffer(ndev, q, entry,
>>
>>    Well, IIRC Greg KH is against using unlikely() unless you have actually
>> instrumented the code and this gives an improvement... have you? :-)
> 
> My understanding was that we should use unlikely() for error checking in
> hot code paths where we want the "good" path to be optimised. I can drop
> this if I'm wrong though.

   OK, keep it... :-)

[...]
>>> @@ -865,7 +894,16 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
>>>  				stats->rx_bytes += skb->len;
>>>  				napi_gro_receive(&priv->napi[q], skb);
>>>  				rx_packets++;
>>> +
>>> +				/* Clear rx_1st_skb so that it will only be
>>> +				 * non-NULL when valid.
>>> +				 */
>>> +				if (die_dt == DT_FEND)
>>> +					priv->rx_1st_skb = NULL;
>>
>>    Hm, can't we do this under *case* DT_FEND above?
> 
> It makes more logical sense to me to do this as the last step, but I
> guess it's a little more optimal to do it earlier. I'll move it.

   Looking at it once more, we can't... unless I'm missing s/th. :-)

> Thanks,

MBR, Sergey

