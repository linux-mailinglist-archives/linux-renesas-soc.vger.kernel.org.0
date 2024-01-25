Return-Path: <linux-renesas-soc+bounces-1849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE24083CDAF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 21:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09EA0B25AE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 20:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D168E13540C;
	Thu, 25 Jan 2024 20:42:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C23F1CFA8;
	Thu, 25 Jan 2024 20:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706215356; cv=none; b=tZDuil2BQcoEoiWwnsvKC1hUfHWEl8HT6efIiWkPJvd97wY9XzG/YLd2Yvn8HASiZUTajx5Ku31/cMDXrH2/bFGYHvyRpViBfChDO/Ft48+vG5wqu6sX+3BCA8dUUsHUFkTOVDEUQ+y7lmAloYdctlTILI2MQ9QlTr0PL681MtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706215356; c=relaxed/simple;
	bh=8PwFDvIdN9vLWvTMmQ79rdoxO9gxmqO8Wcjg2NUNCsc=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FRjPoLwF0/f8CHoLWaAEI6OUgAnkv0GD94hNBv/Iw/A5TYcdYeHmtRfMoYAm46EHFOxhgMBec0KtKr6bjklUObD8kEe/1xHxv9LRTwMHIo3gTLpVU5iZnb/bxCRAvWhFAQYelXqi7yf60SF1TDYe0dRbDEBhd9fB4FUnr9h+wMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.75.111) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 25 Jan
 2024 23:42:15 +0300
Subject: Re: [PATCH net-next v2 1/2] ravb: Add Rx checksum offload support
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
 <20240124102115.132154-2-biju.das.jz@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <e27edbff-8fa9-339a-4e6d-d72776286aa6@omp.ru>
Date: Thu, 25 Jan 2024 23:42:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240124102115.132154-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 01/25/2024 20:29:52
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 182950 [Jan 25 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.75.111 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.111
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 01/25/2024 20:33:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 1/25/2024 6:32:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 1/24/24 1:21 PM, Biju Das wrote:

> TOE has hw support for calculating IP header and TCP/UDP/ICMP checksum

   s/hw/hardware/.

> for both IPV4 and IPV6.

   Those are usually called IPv4 and IPv6, no?

> Add Rx checksum offload supported by TOE for IPV4 and TCP/UDP protocols.
> 
> For Rx, the result of checksum calculation is attached to last 4byte
> of ethernet frames.

   "For Rx, the 4-byte result of checksum calculation is attached to the
Ethernet frames", you wanted to say?

> First 2bytes is result of IPV4 header checksum
> and next 2 bytes is TCP/UDP/ICMP.

   TCP/UDP/ICMP checksum, you mean? Also, you alternatively say
TCP/UDP/ICMP and just TCP/UDP -- which one is correct?

> If frame does not have error "0000" attached to checksum calculation

   "If a frame does not have checksum error, 0x0000 is attached as
a checksum calculation result", you wanted to say?

> result. For unsupported frames "ffff" is attached to checksum calculation

   s/to/as/?

> result. Cases like IPV6, IPV4 header is always set to "FFFF".

   "In case of an IPv6 packet, IPv4 checksum is always set to 0xFFFF",
you wanted to say?

> We can test this functionality by the below commands
> 
> ethtool -K eth0 rx on --> to turn on Rx checksum offload
> ethtool -K eth0 rx off --> to turn off Rx checksum offload
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
[...]

> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index e0f8276cffed..a2c494a85d12 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -44,6 +44,9 @@
>  #define RAVB_RXTSTAMP_TYPE_ALL	0x00000006
>  #define RAVB_RXTSTAMP_ENABLED	0x00000010	/* Enable RX timestamping */
>  
> +/* GbEthernet TOE hardware checksum values */
> +#define TOE_RX_CSUM_OK	0x0000

   As I said before, this is hardly needed...

[...]
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 0e3731f50fc2..59c7bedacef6 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -522,6 +522,26 @@ static int ravb_ring_init(struct net_device *ndev, int q)
>  	return -ENOMEM;
>  }
>  
> +static void ravb_csum_offload_init_gbeth(struct net_device *ndev)

   I'd leave out _offload...

> +{
> +	bool rx_enable = ndev->features & NETIF_F_RXCSUM;
> +	u32 csr0;
> +
> +	if (!rx_enable)
> +		return;
> +
> +	csr0 = ravb_read(ndev, CSR0);

   Why read it here, if we'll write a constant to this reg at the end
of ravb_emac_init_gbeth()?

> +	ravb_write(ndev, csr0 & ~(CSR0_RPE | CSR0_TPE), CSR0);

   We can just write 0 here, no?

> +	if (ravb_wait(ndev, CSR0, CSR0_RPE | CSR0_TPE, 0)) {
> +		netdev_err(ndev, "Timeout Enabling HW CSUM failed\n");

   "Timeout enabling hardware checksum\n", perhaps?

[...]
> +
> +	ravb_write(ndev, csr0, CSR0);

    I think we should move:

	ravb_write(ndev, CSR0_TPE | CSR0_RPE, CSR0);

from ravb_emac_init_gbeth() here...

> +}
> +
[...]
> @@ -734,6 +755,32 @@ static void ravb_get_tx_tstamp(struct net_device *ndev)
>  	}
>  }
>  
> +static void ravb_rx_csum_gbeth(struct sk_buff *skb)
> +{
> +	__wsum csum_ip_hdr, csum_proto;
> +	u8 *hw_csum;
> +
> +	/* The hardware checksum status is contained in sizeof(__sum16) * 2 = 4
> +	 * bytes appended to packet data. First 2 bytes is ip header csum and
> +	 * last 2 bytes is protocol csum.
> +	 */
> +	if (unlikely(skb->len < sizeof(__sum16) * 2))
> +		return;
> +
> +	hw_csum = skb_tail_pointer(skb) - sizeof(__sum16);
> +	csum_proto = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
> +
> +	hw_csum -= sizeof(__sum16);
> +	csum_ip_hdr = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
> +	skb_trim(skb, skb->len - 2 * sizeof(__sum16));
> +
> +	/* TODO: IPV6 Rx csum */
> +	if (skb->protocol == htons(ETH_P_IP) && csum_ip_hdr == TOE_RX_CSUM_OK &&
> +	    csum_proto == TOE_RX_CSUM_OK)
> +		/* Hardware validated our checksum */
> +		skb->ip_summed = CHECKSUM_UNNECESSARY;

   Don't we need to set skb->csum_level?

[...]
> @@ -2337,8 +2388,32 @@ static void ravb_set_rx_csum(struct net_device *ndev, bool enable)
>  static int ravb_set_features_gbeth(struct net_device *ndev,
>  				   netdev_features_t features)
>  {
> -	/* Place holder */
> -	return 0;
> +	netdev_features_t changed = ndev->features ^ features;
> +	struct ravb_private *priv = netdev_priv(ndev);
> +	unsigned long flags;
> +	u32 csr0;
> +	int ret;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	csr0 = ravb_read(ndev, CSR0);
> +	ravb_write(ndev, csr0 & ~(CSR0_RPE | CSR0_TPE), CSR0);
> +	ret = ravb_wait(ndev, CSR0, CSR0_RPE | CSR0_TPE, 0);
> +	if (ret)
> +		goto err_wait;

   I don't understand: why do you clear the CSR0 bits even if
(changed & NETIF_F_RXCSUM) is 0? This looks very wrong...

> +
> +	if (changed & NETIF_F_RXCSUM) {
> +		if (features & NETIF_F_RXCSUM)
> +			ravb_write(ndev, CSR2_ALL, CSR2);
> +		else
> +			ravb_write(ndev, 0, CSR2);
> +	}

   I think you should put that into a separate function, like
is done for the EhterAVB...

[...]
> @@ -2518,6 +2593,8 @@ static const struct ravb_hw_info gbeth_hw_info = {
>  	.emac_init = ravb_emac_init_gbeth,
>  	.gstrings_stats = ravb_gstrings_stats_gbeth,
>  	.gstrings_size = sizeof(ravb_gstrings_stats_gbeth),
> +	.net_hw_features = NETIF_F_RXCSUM,
> +	.net_features = NETIF_F_RXCSUM,

   What about NETIF_F_IP_CSUM, BTW?

[...]

MBR, Sergey

