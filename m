Return-Path: <linux-renesas-soc+bounces-2240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D051184622E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 21:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603C328CBDC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 20:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6D83CF5D;
	Thu,  1 Feb 2024 20:56:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7120029403;
	Thu,  1 Feb 2024 20:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706820971; cv=none; b=AYwcY1gICv9w00NLlb/Hxw74BwCHsVVsLFc1hoMdpA/g36JvwBScSx/Uzdw2B6DDCrC5XdjoUwb840mZy0HhBFO5D5ph8xqwyf8WRYp1daN4qSqlsUKrxsKgZmyk65r2TVfknTMd0trw2wGNSzAgFmN8MiXPOQicz0O8eQkgiIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706820971; c=relaxed/simple;
	bh=Bv9jOktnPbtdFkXhdqLZdhGAbc1vG2EGLSIiPMVmd0g=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=F3PaZWPVHtallRNQ9bI2x11qvHI1ksiMRrpUxwEn9RlKwFjL6bWc8L/LG5Bh5SHtvN2zcEvq2o741qxsH88UA+VSfiso6+I4ruu4K6DYSAtZoMm0XjwAlAY5tIXbpXKuUjmS791f2SGJ+9ZsK2MubMaOWcEHFSZZpCQFSyBMuNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.82.6) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 1 Feb
 2024 23:55:58 +0300
Subject: Re: [PATCH v3 net-next 2/2] ravb: Add Tx checksum offload support for
 GbEth
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
 <20240201194521.139472-3-biju.das.jz@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <d3a6657d-0a67-a826-24b1-17ec8f43ee81@omp.ru>
Date: Thu, 1 Feb 2024 23:55:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240201194521.139472-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 02/01/2024 20:39:37
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 183136 [Feb 01 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.82.6 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.82.6 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.82.6
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/01/2024 20:44:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/1/2024 7:00:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/1/24 10:45 PM, Biju Das wrote:

> TOE has hardware support for calculating IP header and TCP/UDP/ICMP
> checksum for both IPv4 and IPv6.
> 
> Add Tx checksum offload supported by TOE for IPv4 and TCP/UDP.
> 
> For Tx, the result of checksum calculation is set to the checksum field of
> each IPv4 Header/TCP/UDP/ICMP of ethernet frames. For the unsupported
> frames, those fields are not changed. If a transmission frame is an UDPv4
> frame and its checksum value in the UDP header field is 0x0000, TOE does
> not calculate checksum for UDP part of this frame as it is optional
> function as per standards.
> 
> We can test this functionality by the below commands
> 
> ethtool -K eth0 tx on --> to turn on Tx checksum offload
> ethtool -K eth0 tx off --> to turn off Tx checksum offload
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated commit header and description as suggested by Sergey.
>  * Replaced NETIF_F_IP_CSUM->NETIF_F_HW_CSUM as we are supporting only IPv4.

   You do vice versa, NETIF_F_HW_CSUM->NETIF_F_IP_CSUM. :-)
   However, I'm now seeing this comment under CHECKSM_PATIAL:

 *   %NETIF_F_IP_CSUM and %NETIF_F_IPV6_CSUM are being deprecated in favor of
 *   %NETIF_F_HW_CSUM. New devices should use %NETIF_F_HW_CSUM to indicate
 *   checksum offload capability.

   So probably we should've kept NETIF_F_HW_CSUM? :-/
 
>  * Updated the comment related to UDP header field.
>  * Renamed ravb_is_tx_checksum_offload_gbeth_possible()->ravb_is_tx_csum_gbeth().
> v1->v2:
>  * No change.
[...]

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index c4dc6ec54287..042dc565d1a5 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[...]
> @@ -524,15 +525,27 @@ static int ravb_ring_init(struct net_device *ndev, int q)
>  
>  static void ravb_csum_init_gbeth(struct net_device *ndev)
>  {
> -	if (!(ndev->features & NETIF_F_RXCSUM))
> +	bool tx_enable = ndev->features & NETIF_F_IP_CSUM;
> +	bool rx_enable = ndev->features & NETIF_F_RXCSUM;
> +
> +	if (!(tx_enable || rx_enable))
>  		goto done;
>  
>  	ravb_write(ndev, 0, CSR0);
> -	if (ravb_wait(ndev, CSR0, CSR0_RPE, 0)) {
> +	if (ravb_wait(ndev, CSR0, CSR0_TPE | CSR0_RPE, 0)) {
>  		netdev_err(ndev, "Timeout enabling hardware checksum\n");
> -		ndev->features &= ~NETIF_F_RXCSUM;
> +
> +		if (tx_enable)
> +			ndev->features &= ~NETIF_F_IP_CSUM;
> +
> +		if (rx_enable)
> +			ndev->features &= ~NETIF_F_RXCSUM;
>  	} else {
> -		ravb_write(ndev, CSR2_ALL, CSR2);
> +		if (tx_enable)
> +			ravb_write(ndev, CSR1_ALL, CSR1);
> +
> +		if (rx_enable)
> +			ravb_write(ndev, CSR2_ALL, CSR2);
>  	}
>  
>  done:
> @@ -1986,6 +1999,35 @@ static void ravb_tx_timeout_work(struct work_struct *work)
>  	rtnl_unlock();
>  }
>  
> +static bool ravb_is_tx_csum_gbeth(struct sk_buff *skb)

   Hm, this new name doesn't parse well for me... :-(
   Maybe ravb_can_tx_csum_gbeth() or ravb_tx_csum_possible_gbeth()?

> +{
> +	struct iphdr *ip = ip_hdr(skb);
> +
> +	/* TODO: Need to add support for VLAN tag 802.1Q */
> +	if (skb_vlan_tag_present(skb))
> +		return false;
> +
> +	switch (ip->protocol) {
> +	case IPPROTO_TCP:
> +		break;
> +	case IPPROTO_UDP:
> +		/* If the checksum value in the UDP header field is 0, TOE does
> +		 * not calculate checksum for UDP part of this frame as it is
> +		 * optional function as per standards.
> +		 */
> +		if (udp_hdr(skb)->check == 0)
> +			return false;
> +		break;
> +	/* TODO: Need to add HW checksum for ICMP */

   s/HW/hardware/?

> +	case IPPROTO_ICMP:
> +		fallthrough;

   You don't even need fallthrough, actually...
   But why do you return false for ICMP? Isn't it supported by TOE?

> +	default:
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  /* Packet transmit function for Ethernet AVB */
>  static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  {
[...]

MBR, Sergey

