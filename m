Return-Path: <linux-renesas-soc+bounces-5794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E068D8B09
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 22:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 634FEB2354B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 20:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648AA57C8D;
	Mon,  3 Jun 2024 20:46:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C32B651;
	Mon,  3 Jun 2024 20:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717447574; cv=none; b=Bp8k6QPsb1D1sUWELzrEcxSWOcu9mQ1JxQa2zQgcjfAP/u9tlbMQfiXR81KQmryhojTnmliWq0yNxWKnoGfES61noUS7z/dyLzh0I2/XjIfvxNQU8AaN7uqpeirDmtavW44I1CS45T/OLtxz8S9EKB0gz0QZ25iArJSTN/yw8Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717447574; c=relaxed/simple;
	bh=R2QkOlhuMFFxiF5tENr/6ZI22OVqBhT81sSAayPR0k8=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=e1ZLvQtS2gtADCItfXNu5m1/nZO7m4EQk/zRMQz1T2BhL4S17T6cLindZpLTYcZbpTvNckISBKLM3Lh95g58V7SSxdkW4UgF9jd7ZLLKEMExEiQP6pV6paqVIcyz0tlSiuT4XVwB1qowZMDbRUCq/c37v1IQEKHDuQveaPDCOPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.75.167) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 3 Jun
 2024 23:45:52 +0300
Subject: Re: [net-next PATCH v4 7/7] net: ravb: Allocate RX buffers via page
 pool
To: Paul Barker <paul.barker.ct@bp.renesas.com>, Simon Horman
	<horms@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, =?UTF-8?Q?Niklas_S=c3=b6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>, Biju Das
	<biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-8-paul.barker.ct@bp.renesas.com>
 <20240601101300.GA491852@kernel.org>
 <6165a9a3-15ec-4a40-901a-17c2be64daf1@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <d0c47784-ec5f-eabf-8fe9-9405093accf8@omp.ru>
Date: Mon, 3 Jun 2024 23:45:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <6165a9a3-15ec-4a40-901a-17c2be64daf1@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 06/03/2024 20:26:14
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 185692 [Jun 03 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.75.167 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.75.167 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	lore.kernel.org:7.1.1;www.kernel.org:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.167
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/03/2024 20:31:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/3/2024 5:58:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 6/3/24 11:02 AM, Paul Barker wrote:
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
[...]
>>> @@ -298,13 +269,14 @@ static void ravb_ring_free(struct net_device *ndev, int q)
>>>  		priv->tx_ring[q] = NULL;
>>>  	}
>>>  
>>> -	/* Free RX skb ringbuffer */
>>> -	if (priv->rx_skb[q]) {
>>> -		for (i = 0; i < priv->num_rx_ring[q]; i++)
>>> -			dev_kfree_skb(priv->rx_skb[q][i]);
>>> +	/* Free RX buffers */
>>> +	for (i = 0; i < priv->num_rx_ring[q]; i++) {
>>> +		if (priv->rx_buffers[q][i].page)
>>> +			page_pool_put_page(priv->rx_pool[q], priv->rx_buffers[q][i].page, 0, true);
>>
>> nit: Networking still prefers code to be 80 columns wide or less.
>>      It looks like that can be trivially achieved here.
>>
>>      Flagged by checkpatch.pl --max-line-length=80
> 
> Sergey has asked me to wrap to 100 cols [1]. I can only find a reference
> to 80 in the docs though [2], so I guess you may be right.
> 
> [1]: https://lore.kernel.org/all/611a49b8-ecdb-6b91-9d3e-262bf3851f5b@omp.ru/
> [2]: https://www.kernel.org/doc/html/latest/process/coding-style.html

   Note that I (mostly) meant the comments...

[...]

MBR, Sergey

