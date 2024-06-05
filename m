Return-Path: <linux-renesas-soc+bounces-5887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA21E8FD3BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 19:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 041451C22B6B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 17:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34FB061FF7;
	Wed,  5 Jun 2024 17:18:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01D479DE;
	Wed,  5 Jun 2024 17:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717607932; cv=none; b=E72XI37a8O+5tRSh63rTS32pbTxk0aYqCwBjyCdCkKIo8lRwHEVF1pkibRBTl0Kds2I5jo8bMYwWF4FVoMO6C/HM2UOZwi8ezFiPaFu1GycrDqAetbCespXW3HSjir35yV7CvrB+zDOJKA4Wjc+rO5mD+ngUzIKS+7HDlV0crZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717607932; c=relaxed/simple;
	bh=CfOaJg5zpEDxXsvOH7x53ahefWZN6KU6Mu/FJ8+Hmjw=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=tsgnMawKfX5dskO9YPQeLRJmJyslkK8zLJw1A8u3bXoCftUY9ra2hg7NyZe1XdBOKU/cpWPw33efSIYJDjfR/yWhpTOIPZYBXWunJ6AoBkm35vNWfSuIe1QjCU3TqDmyQv1gm5PLSqyplXY/Ov7SSz+/GmdgLJna4aMxQynd324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.84.195) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 5 Jun
 2024 20:18:38 +0300
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
 <20240603120757.GX491852@kernel.org>
 <3eeff8ed-231c-4810-ba99-371524db2f90@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <444f035e-cd07-842d-aacd-b8f720c172da@omp.ru>
Date: Wed, 5 Jun 2024 20:18:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3eeff8ed-231c-4810-ba99-371524db2f90@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 06/05/2024 16:56:56
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 185750 [Jun 05 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.84.195 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	31.173.84.195:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;www.kernel.org:7.1.1;127.0.0.199:7.1.2;patchwork.kernel.org:7.1.1;omp.ru:7.1.1;lore.kernel.org:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.84.195
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/05/2024 17:00:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/5/2024 11:45:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 6/3/24 3:15 PM, Paul Barker wrote:
[...]

>>>>> @@ -298,13 +269,14 @@ static void ravb_ring_free(struct net_device *ndev, int q)
>>>>>  		priv->tx_ring[q] = NULL;
>>>>>  	}
>>>>>  
>>>>> -	/* Free RX skb ringbuffer */
>>>>> -	if (priv->rx_skb[q]) {
>>>>> -		for (i = 0; i < priv->num_rx_ring[q]; i++)
>>>>> -			dev_kfree_skb(priv->rx_skb[q][i]);
>>>>> +	/* Free RX buffers */
>>>>> +	for (i = 0; i < priv->num_rx_ring[q]; i++) {
>>>>> +		if (priv->rx_buffers[q][i].page)
>>>>> +			page_pool_put_page(priv->rx_pool[q], priv->rx_buffers[q][i].page, 0, true);
>>>>
>>>> nit: Networking still prefers code to be 80 columns wide or less.
>>>>      It looks like that can be trivially achieved here.
>>>>
>>>>      Flagged by checkpatch.pl --max-line-length=80
>>>
>>> Sergey has asked me to wrap to 100 cols [1]. I can only find a reference
>>> to 80 in the docs though [2], so I guess you may be right.
>>>
>>> [1]: https://lore.kernel.org/all/611a49b8-ecdb-6b91-9d3e-262bf3851f5b@omp.ru/
>>> [2]: https://www.kernel.org/doc/html/latest/process/coding-style.html
>>
>> Hi Paul,
>>
>> If Sergey prefers 100 then I won't argue :)
>>
>> FWIIW, think what has happened here relates to the Kernel, at some point,
>> going from 80 to 100 columns as the preferred maximum width, while Networking
>> stuck with 80.
> 
> I saw that netdevbpf patchwork is configured for 80 cols and it has
> warnings for v4 of this patch [1], so I've already re-wrapped the
> changes in this series to 80 cols (excluding a couple of lines where
> using slightly more than 80 cols significantly improves readability).
> I'm planning to send that in the next hour or so, assuming my tests
> pass.
> 
> [1]: https://patchwork.kernel.org/project/netdevbpf/patch/20240528150339.6791-8-paul.barker.ct@bp.renesas.com/

   Sorry for misinforming you about 100 coulmns -- I had no idea netdev stuck
to 80! :-)

MBR, Sergey

