Return-Path: <linux-renesas-soc+bounces-9321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A57B898DF3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 17:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AF31B27DD0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 15:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945771D0F63;
	Wed,  2 Oct 2024 15:28:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CBF1D0B8F;
	Wed,  2 Oct 2024 15:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882900; cv=none; b=iFFlWA9qlCQod1CE8A8+H/MG4oNLc+UjAtGt5+ayDnvMoGkVnPU5z5326Q3hbkYezyjunMFe7Cq13+pWQ93R8Ec74ef8P3+YcaXImt0ziEg5/QFZXj++dZv1m93jaSPV5DoYJHEQctXPOpljjjcxyJa5lShVE91T7LLH1WQjj5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882900; c=relaxed/simple;
	bh=s909y36e9mKu8s5Q9LIIZ6Cw/fps2pQmVXwqol99ppU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hLpLfLE3BusuiV5RlOKdIUnSSwCMh6/k73eJZqtq1CnfXZf2NZkwzCPEwmfafzrOsKxre+hxSLBCeAX17uHSeDXdZA4D8EhTug6ZJiDxTYgjbD575zYziF0rBp84n8Cciy09BUhuC7sp6f7eDqxSSa10eyxLQVHNXI5n+SUKpGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.100] (213.87.134.133) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 2 Oct
 2024 18:27:59 +0300
Message-ID: <04de48d4-12dc-4dd9-a234-afd26be02561@omp.ru>
Date: Wed, 2 Oct 2024 18:27:58 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 11/11] net: ravb: Add VLAN checksum support
To: Simon Horman <horms@kernel.org>
CC: Paul Barker <paul@pbarker.dev>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Paul Barker <paul.barker.ct@bp.renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>, Biju Das
	<biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240930160845.8520-1-paul@pbarker.dev>
 <20240930160845.8520-12-paul@pbarker.dev>
 <ab7482f9-6833-416f-8adf-5e1347628dec@omp.ru>
 <20241001104413.GK1310185@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20241001104413.GK1310185@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 10/02/2024 15:09:45
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 188158 [Oct 02 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 37 0.3.37
 76d1f08bc1e1f80c2a3a76a1cc8929a49fe2f262
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.134.133 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.134.133 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;213.87.134.133:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.134.133
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/02/2024 15:13:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/2/2024 1:10:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 10/1/24 13:44, Simon Horman wrote:
[...]

>>> From: Paul Barker <paul.barker.ct@bp.renesas.com>
>>>
>>> The GbEth IP supports offloading checksum calculation for VLAN-tagged
>>> packets, provided that the EtherType is 0x8100 and only one VLAN tag is
>>> present.
>>>
>>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
>> [...]
>>
>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>> index 832132d44fb4..eb7499d42a9b 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>> @@ -2063,11 +2063,30 @@ static void ravb_tx_timeout_work(struct work_struct *work)
>>>  
>>>  static bool ravb_can_tx_csum_gbeth(struct sk_buff *skb)
>>>  {
>>> -	/* TODO: Need to add support for VLAN tag 802.1Q */
>>> -	if (skb_vlan_tag_present(skb))
>>> +	u16 net_protocol = ntohs(skb->protocol);
>>> +
>>> +	/* GbEth IP can calculate the checksum if:
>>> +	 * - there are zero or one VLAN headers with TPID=0x8100
>>> +	 * - the network protocol is IPv4 or IPv6
>>> +	 * - the transport protocol is TCP, UDP or ICMP
>>> +	 * - the packet is not fragmented
>>> +	 */
>>> +
>>> +	if (skb_vlan_tag_present(skb) &&
>>> +	    (skb->vlan_proto != ETH_P_8021Q || net_protocol == ETH_P_8021Q))
>>
>>    Not sure I understand this check... Maybe s/==/!=/?
> 
> A minor nit if the check stays in some form:
> vlan_proto is big endian, while ETH_P_8021Q is host byte order.

   Not minor at all, thanks for spotting!
   Luckily, we also have a kernel test robot which runs sparse. :-)

[...]

MBR, Sergey


