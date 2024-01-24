Return-Path: <linux-renesas-soc+bounces-1796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2097083B34A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 21:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52EE91C20C1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 20:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67FD134744;
	Wed, 24 Jan 2024 20:50:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4644D131E53;
	Wed, 24 Jan 2024 20:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706129454; cv=none; b=mi0yDlATuWWFS4Gwr6Vtgj61SjKm6MZKyPkD4KeYET4BtyD1VadyFJCmjwwBSPZfGQpQjkMbxfD27BnI5bcx60u1RFWqDipjUWDHRKpKP+DgUA21Lsnhm7nIQ1BeUGqB0r+kIvpZBYR2Jx69tIIyZ7ZaDBKjkBMHZWs3C3QWcb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706129454; c=relaxed/simple;
	bh=rutWW45qOvOA0+vqUP8QLOIEjDbTuqWQVW8R8HLJwlY=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=oOrXi7W7WXrcR0f7yvczw5+bd/gfVBE2+5McDq9rsd1I/IqbY5Ml1efcuRHBmA6LOOvqf0c8hpFzb9QPlkrmapr+UKd3XR6I/0vnIoLPq8YtYFJeNXOUGhVYMcGMUmEAl35jzdDe+jqTICO3XEVT6E0i2fcLLQ3Up9uyCZvzUCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.73.201) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 24 Jan
 2024 23:50:42 +0300
Subject: Re: [PATCH net-next 1/2] ravb: Add Rx checksum offload support
To: Biju Das <biju.das.jz@bp.renesas.com>, Jakub Kicinski <kuba@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
References: <20240123151924.373917-1-biju.das.jz@bp.renesas.com>
 <20240123151924.373917-2-biju.das.jz@bp.renesas.com>
 <20240123170921.51089d41@kernel.org>
 <TYCPR01MB11269BEF48F2C2C111C91858A867B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <e71607dc-d51f-d5b9-e95a-c11b149083cb@omp.ru>
Date: Wed, 24 Jan 2024 23:50:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB11269BEF48F2C2C111C91858A867B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 01/24/2024 20:42:08
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 182912 [Jan 24 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.73.201 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.73.201
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 01/24/2024 20:45:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 1/24/2024 5:13:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 1/24/24 11:31 AM, Biju Das wrote:
[...]

>> -----Original Message-----
>> From: Jakub Kicinski <kuba@kernel.org>
>> Sent: Wednesday, January 24, 2024 1:09 AM
>> Subject: Re: [PATCH net-next 1/2] ravb: Add Rx checksum offload support
>>
>> On Tue, 23 Jan 2024 15:19:23 +0000 Biju Das wrote:
>>> +static void ravb_rx_csum_gbeth(struct sk_buff *skb) {
>>> +	__sum16 csum_ip_hdr, csum_proto;
>>> +	u8 *hw_csum;
>>> +
>>> +	/* The hardware checksum status is contained in sizeof(__sum16) * 2
>> = 4
>>> +	 * bytes appended to packet data. First 2 bytes is ip header csum
>> and
>>> +	 * last 2 bytes is protocol csum.
>>> +	 */
>>> +	if (unlikely(skb->len < sizeof(__sum16) * 2))
>>> +		return;
>>> +
>>> +	hw_csum = skb_tail_pointer(skb) - sizeof(__sum16);
>>> +	csum_proto = csum_unfold((__force
>>> +__sum16)get_unaligned_le16(hw_csum));
>>> +
>>> +	hw_csum -= sizeof(__sum16);
>>> +	csum_ip_hdr = csum_unfold((__force
>> __sum16)get_unaligned_le16(hw_csum));
>>> +	skb_trim(skb, skb->len - 2 * sizeof(__sum16));
>>> +
>>> +	/* TODO: IPV6 Rx csum */
>>> +	if (skb->protocol == htons(ETH_P_IP) && csum_ip_hdr ==
>> TOE_RX_CSUM_OK &&
>>> +	    csum_proto == TOE_RX_CSUM_OK)
>>> +		/* Hardware validated our checksum */
>>> +		skb->ip_summed = CHECKSUM_UNNECESSARY; }
>>
>> sparse does not seem to be onboard:
>>
>> drivers/net/ethernet/renesas/ravb_main.c:771:20: warning: incorrect type
>> in assignment (different base types)
>> drivers/net/ethernet/renesas/ravb_main.c:771:20:    expected restricted
>> __sum16 [usertype] csum_proto
>> drivers/net/ethernet/renesas/ravb_main.c:771:20:    got restricted __wsum
>> drivers/net/ethernet/renesas/ravb_main.c:774:21: warning: incorrect type
>> in assignment (different base types)
>> drivers/net/ethernet/renesas/ravb_main.c:774:21:    expected restricted
>> __sum16 [usertype] csum_ip_hdr
>> drivers/net/ethernet/renesas/ravb_main.c:774:21:    got restricted __wsum
> 
> I have reproduced this issue and the warning is fixed by replacing
> __sum16->__wsum.
> 
> I will send v2 with this fix.

   You could have waited for my review...
   Dave, Jakub, please don't merge these patches before I have a chance
to review them. I'm overwhelmed by reviews (both internal and public)
ATM... :-/

> Cheers,
> Biju

MBR, Sergey

