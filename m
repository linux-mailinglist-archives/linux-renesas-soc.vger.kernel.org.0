Return-Path: <linux-renesas-soc+bounces-5894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B718FD758
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 22:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFE211C23214
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 20:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B54158A27;
	Wed,  5 Jun 2024 20:14:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F140915747A;
	Wed,  5 Jun 2024 20:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717618498; cv=none; b=FvUfs7MIFRMzU2mc2VQ47nH9RT2kj5gqmPysUlVKo/mCLhC+J37qe/XO2bvZNWdd7O+huLxWc07QqaSWO9yxvj5TaakOnnK6b/JQ5NmQ70ZKnabNGhzr/dmY7Hodw5nUS2TrXTI3pAW1bUnxGRw1XwQ+cOdZnA5AvCldBBFRAgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717618498; c=relaxed/simple;
	bh=czaT3riewmwV9YjIqTwjHN+Vw/gRYXlQLIGHV9vRW8U=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=MPag8igdFBcbqHtvzfz//fFMKDKM71M+QQsAPfxjqsq08v01uW5ABcrHg19EOPC2NIplMN/bXsg3oBsB2AL/jFMYcrZAFwaXFhCyE/eZCKkTrMzG5rm/FXaVOYjm6GFZRYRfghki+R9EDoAMvvn8K/lqEhEYBEOesrTIja/v1A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.84.195) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 5 Jun
 2024 23:14:50 +0300
Subject: Re: [net-next PATCH v5 7/7] net: ravb: Allocate RX buffers via page
 pool
To: Paul Barker <paul.barker.ct@bp.renesas.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Simon Horman <horms@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240604072825.7490-1-paul.barker.ct@bp.renesas.com>
 <20240604072825.7490-8-paul.barker.ct@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <49755f09-66de-71f2-bf66-ccd0d94d3f04@omp.ru>
Date: Wed, 5 Jun 2024 23:14:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240604072825.7490-8-paul.barker.ct@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 06/05/2024 19:37:21
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 185750 [Jun 05 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1;31.173.84.195:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.84.195
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/05/2024 19:41:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/5/2024 6:43:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 6/4/24 10:28 AM, Paul Barker wrote:

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

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey

