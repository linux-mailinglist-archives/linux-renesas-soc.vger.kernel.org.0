Return-Path: <linux-renesas-soc+bounces-2297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B98479E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 20:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2053E1F24C07
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 19:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A4280606;
	Fri,  2 Feb 2024 19:47:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0CC80603;
	Fri,  2 Feb 2024 19:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706903248; cv=none; b=u3W0zzB/hKm7t20Xgei7whnlKE1bzXh2Jfw4BBY7jYT4fq7zo7REtnDELqx8TKpUEozj+cqd5Pe7KoYGRmlQLOFMfc8ZUj+Kicwh+mVQscsFDL6ZnwsjHI/cIDktxkQNOKg0KQh6+4dbvCeW7jTmcoQDlbxzy+0XQExN9DOn934=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706903248; c=relaxed/simple;
	bh=g8WdEUjO3MhOqX7G8qPPne2dului+4Z2R4meol+a1Zc=;
	h=Subject:From:To:CC:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=o3muhc7mfIrRvsC64L2GpeUZ+XIFve15dQKJSY0bOrmT6pHNxQB8oBn5f2JjP+bmhFl13xbCghq6rD4rgFq5/t8drzQw+H1YXhuiYUpnK8kZEOp6cGyVS544qBlcCBAKORbwx6d+NxmkzIpJH2+A7nPvqx2yJKYJPqknt7s5E5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.78.128) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 2 Feb
 2024 22:47:10 +0300
Subject: Re: [PATCH v3 net-next 1/2] ravb: Add Rx checksum offload support for
 GbEth
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Biju Das <biju.das.jz@bp.renesas.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Nikita Yushchenko
	<nikita.yoush@cogentembedded.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
References: <20240201194521.139472-1-biju.das.jz@bp.renesas.com>
 <20240201194521.139472-2-biju.das.jz@bp.renesas.com>
 <422974a5-cbce-50ad-5a8c-7588d5eeebc2@omp.ru>
Organization: Open Mobile Platform
Message-ID: <20d6e13e-bfe6-6209-3a81-a9c1e32ce195@omp.ru>
Date: Fri, 2 Feb 2024 22:47:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <422974a5-cbce-50ad-5a8c-7588d5eeebc2@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 02/02/2024 19:34:28
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 183168 [Feb 02 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.128 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.128 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.78.128
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/02/2024 19:38:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/2/2024 4:50:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/2/24 10:12 PM, Sergey Shtylyov wrote:

>> TOE has hardware support for calculating IP header and TCP/UDP/ICMP
>> checksum for both IPv4 and IPv6.
>>
>> Add Rx checksum offload supported by TOE for IPv4 and TCP/UDP protocols.
>>
>> For Rx, the 4-byte result of checksum calculation is attached to the
>> Ethernet frames.First 2-bytes is result of IPv4 header checksum and next
>> 2-bytes is TCP/UDP/ICMP checksum.
>>
>> If a frame does not have checksum error, 0x0000 is attached as checksum
>> calculation result. For unsupported frames 0xFFFF is attached as checksum
>> calculation result. In case of an IPv6 packet, IPv4 checksum is always set
>> to 0xFFFF.
>>
>> We can test this functionality by the below commands
>>
>> ethtool -K eth0 rx on --> to turn on Rx checksum offload
>> ethtool -K eth0 rx off --> to turn off Rx checksum offload
>>
>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
[...]
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index 0e3731f50fc2..c4dc6ec54287 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[...]
>> @@ -2334,11 +2381,49 @@ static void ravb_set_rx_csum(struct net_device *ndev, bool enable)
>>  	spin_unlock_irqrestore(&priv->lock, flags);
>>  }
>>  
>> +static int ravb_endisable_csum_gbeth(struct net_device *ndev, enum ravb_reg reg,
>> +				     u32 val, u32 mask)
> 
>    I'd suggest to mimic ravb_wait() with the the mask param followed by
> the val[ue] param...

   Nevermind, I see now they are for different registers...

[...]

MBR, Sergey

