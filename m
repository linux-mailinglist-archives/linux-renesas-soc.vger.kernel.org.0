Return-Path: <linux-renesas-soc+bounces-1896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D383E389
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 22:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD971F24126
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 21:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66C123770;
	Fri, 26 Jan 2024 21:00:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578D249EC;
	Fri, 26 Jan 2024 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706302840; cv=none; b=PQsaPMwvdv5YLi5uloI8qDUDNg2FeZMTlXcXGDH9MY+b3MEzDplOJCKj1kba+NKHfPv5igt2wC9H5I+QD5uYOo55YpRDVqkcUySnd0Xt19qDsSbtWC6kBy/J7+FEIqyRI5DbJuMnV2CicB7adAyw8M3+fOQGdWOsk1S2Wvd9pfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706302840; c=relaxed/simple;
	bh=CXgc0JmqWScFz/gV3042EpSrbQV32DXfyhpoAl1QqUs=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=CvBq/nwQMxznyQmucT3nyiY8yHlYT8VLKgFCd9JJ6mwlb633XVlVwGCMxzbvhJ6R9lggDhpeT6Mn2Gdru/989oi5hSK5riy7IbAaCEtI60Jp2/Wb4Usb6PQRbR1ib7TQenU1fZdHnai+fKJ5e4Fz0e65PkIrskofN/GqaMUvROk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.87.141) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Sat, 27 Jan
 2024 00:00:21 +0300
Subject: Re: [PATCH net-next v2 2/2] ravb: Add Tx checksum offload support
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
References: <20240124102115.132154-1-biju.das.jz@bp.renesas.com>
 <20240124102115.132154-3-biju.das.jz@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <fb8302e3-8491-09d0-3f94-1599bbe42743@omp.ru>
Date: Sat, 27 Jan 2024 00:00:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240124102115.132154-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 01/26/2024 20:51:42
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 182973 [Jan 26 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.141 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.87.141
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 01/26/2024 20:56:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 1/26/2024 4:55:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 1/24/24 1:21 PM, Biju Das wrote:

> TOE has hw support for calculating IP header and TCP/UDP/ICMP checksum for

   s/hw/hardware/, please...

> both IPV4 and IPV6.
> 
> Add Tx checksum offload supported by TOE for IPv4 and TCP/UDP.
> 
> For Tx, the result of checksum calculation is set to the checksum field of
> each IPv4 Header/TCP/UDP/ICMP of ethernet frames. For the unsupported
> frames, those fields are not changed. If a transmission frame is an UDP
> frame of IPv4 and its checksum value in the UDP header field is H’0000,
> TOE does not calculate checksum for UDP part of this frame as it is
> optional function as per standards.
> 
> We can test this functionality by the below commands
> 
> ethtool -K eth0 tx on --> to turn on Tx checksum offload
> ethtool -K eth0 tx off --> to turn off Tx checksum offload
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
[...]

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 59c7bedacef6..3c748a54fae0 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -29,6 +29,7 @@
>  #include <linux/spinlock.h>
>  #include <linux/reset.h>
>  #include <linux/math64.h>
> +#include <net/ip.h>

   What do you need from that header, BTW?

[...]
> @@ -1990,6 +2001,39 @@ static void ravb_tx_timeout_work(struct work_struct *work)
>  	rtnl_unlock();
>  }
>  
> +static bool ravb_is_tx_checksum_offload_gbeth_possible(struct sk_buff *skb)

   I'd suggest s/th shorter and more consistent with the used naming,
like ravb_tx_csum_possible_gbeth()...

> +{
> +	struct iphdr *ip = ip_hdr(skb);
> +
> +	/* TODO: Need to add support for VLAN tag 802.1Q */
> +	if (skb_vlan_tag_present(skb))
> +		return false;
> +
> +	/* TODO: Need to add HW checksum for IPV6 */
> +	if (skb->protocol != htons(ETH_P_IP))
> +		return false;

   So maybe we need to report just NETIF_F_IP_CSUM, not NETIF_F_HW_CSUM
ATM?

> +
> +	switch (ip->protocol) {
> +	case IPPROTO_TCP:
> +		break;
> +	case IPPROTO_UDP:
> +		/* If the checksum value in the UDP header field is “H’0000”,

   Use 0x0000 or just 0, please. I don't know where Renesas found this
weird hex notation...

[...]
> @@ -2005,6 +2049,11 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  	u32 entry;
>  	u32 len;
>  
> +	if (skb->ip_summed == CHECKSUM_PARTIAL) {
> +		if (!ravb_is_tx_checksum_offload_gbeth_possible(skb))

   I'd collapse those 2 *if* statements...

[...]

MBR, Sergey

