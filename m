Return-Path: <linux-renesas-soc+bounces-2296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A875C847980
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 20:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C26C91C28A69
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 19:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB8D8173B;
	Fri,  2 Feb 2024 19:13:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264B481736;
	Fri,  2 Feb 2024 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706901213; cv=none; b=Wek+spnhYTqSsRXRy1s6hIIGclRBmo4tOdSwP5h9OxFdjZma3ZtKfcQ5cGXkgskXpvSwGK/o0ysUO/w9QWqNdmMTzPbkovphaVsa906OOK2mef3XNU8xYBZyT2HQ2v2iLgoEcHl02/dWvZqnVMz8hmslWcLtTlRmZ+y8/OobuGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706901213; c=relaxed/simple;
	bh=rzlfmMyxIUPML5UmgYuHNkvNuJEdS7uMNKcOjGaZI8Y=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ITppFGa91sm+MiN6k8bZF50z5sv4N7LK45wzVnLopvVEaSSl2U1ja4DT393om9QjKpHjk47s1Lb/FLg5gOHgSYjG57W3xCSSyDUFtLn52+qrgwR69q6/n3aiVanKlFKoKDp5fLqCCxGMOoC4PO3QAxd0D/zARU3nSFxhh5gN/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.78.128) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 2 Feb
 2024 22:13:19 +0300
Subject: Re: [PATCH v3 net-next 1/2] ravb: Add Rx checksum offload support for
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
 <20240201194521.139472-2-biju.das.jz@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <422974a5-cbce-50ad-5a8c-7588d5eeebc2@omp.ru>
Date: Fri, 2 Feb 2024 22:12:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240201194521.139472-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 02/02/2024 18:49:06
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
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
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
X-KSE-Antiphishing-Bases: 02/02/2024 18:54:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/2/2024 4:50:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/1/24 10:45 PM, Biju Das wrote:

> TOE has hardware support for calculating IP header and TCP/UDP/ICMP
> checksum for both IPv4 and IPv6.
> 
> Add Rx checksum offload supported by TOE for IPv4 and TCP/UDP protocols.
> 
> For Rx, the 4-byte result of checksum calculation is attached to the
> Ethernet frames.First 2-bytes is result of IPv4 header checksum and next
> 2-bytes is TCP/UDP/ICMP checksum.
> 
> If a frame does not have checksum error, 0x0000 is attached as checksum
> calculation result. For unsupported frames 0xFFFF is attached as checksum
> calculation result. In case of an IPv6 packet, IPv4 checksum is always set
> to 0xFFFF.
> 
> We can test this functionality by the below commands
> 
> ethtool -K eth0 rx on --> to turn on Rx checksum offload
> ethtool -K eth0 rx off --> to turn off Rx checksum offload
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
[...]

> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index e0f8276cffed..a7fe9d8b6b41 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -206,6 +206,7 @@ enum ravb_reg {
>  	RFCR	= 0x0760,
>  	MAFCR	= 0x0778,

   Would be good to add this comment here:

	/* TOE registers */

>  	CSR0    = 0x0800,	/* RZ/G2L only */
> +	CSR2    = 0x0808,	/* RZ/G2L only */
>  };
>  
>  
[...]
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 0e3731f50fc2..c4dc6ec54287 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -522,6 +522,23 @@ static int ravb_ring_init(struct net_device *ndev, int q)
>  	return -ENOMEM;
>  }
>  
> +static void ravb_csum_init_gbeth(struct net_device *ndev)
> +{
> +	if (!(ndev->features & NETIF_F_RXCSUM))
> +		goto done;
> +
> +	ravb_write(ndev, 0, CSR0);
> +	if (ravb_wait(ndev, CSR0, CSR0_RPE, 0)) {
> +		netdev_err(ndev, "Timeout enabling hardware checksum\n");
> +		ndev->features &= ~NETIF_F_RXCSUM;
> +	} else {
> +		ravb_write(ndev, CSR2_ALL, CSR2);

   Does it make sense to set the IPv6 specific bits if we don't yet
support IPv6 checksumming anyways?

> +	}
> +
> +done:
> +	ravb_write(ndev, CSR0_TPE | CSR0_RPE, CSR0);
> +}
> +
>  static void ravb_emac_init_gbeth(struct net_device *ndev)
>  {
>  	struct ravb_private *priv = netdev_priv(ndev);
[...]
> @@ -734,6 +752,31 @@ static void ravb_get_tx_tstamp(struct net_device *ndev)
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

   Hm, maybe spell out csum as checksum?

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
> +	if (skb->protocol == htons(ETH_P_IP) && !csum_ip_hdr && !csum_proto)
> +		/* Hardware validated our checksum */
> +		skb->ip_summed = CHECKSUM_UNNECESSARY;

   I think you need {} because of the comment (but would be good without it
as well)...

[...]
> @@ -2334,11 +2381,49 @@ static void ravb_set_rx_csum(struct net_device *ndev, bool enable)
>  	spin_unlock_irqrestore(&priv->lock, flags);
>  }
>  
> +static int ravb_endisable_csum_gbeth(struct net_device *ndev, enum ravb_reg reg,
> +				     u32 val, u32 mask)

   I'd suggest to mimic ravb_wait() with the the mask param followed by
the val[ue] param...

> +{
> +	u32 csr0;
> +	int ret;
> +
> +	csr0 = ravb_read(ndev, CSR0);

   Hm... I think we already know CSR0's value as ravb_csum_init_gbeth()
sets it to (CSR0_TPE | CSR0_RPE) on exit...

> +	ravb_write(ndev, csr0 & ~mask, CSR0);
> +	ret = ravb_wait(ndev, CSR0, mask, 0);
> +	if (!ret)
> +		ravb_write(ndev, val, reg);
> +
> +	ravb_write(ndev, csr0, CSR0);
> +
> +	return ret;
> +}
> +
>  static int ravb_set_features_gbeth(struct net_device *ndev,
>  				   netdev_features_t features)
>  {
> -	/* Place holder */
> -	return 0;
> +	netdev_features_t changed = ndev->features ^ features;
> +	struct ravb_private *priv = netdev_priv(ndev);
> +	unsigned long flags;
> +	int ret = 0;
> +	u32 val;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	if (changed & NETIF_F_RXCSUM) {
> +		if (features & NETIF_F_RXCSUM)
> +			val = CSR2_ALL;

   Again, does it make sense to set the IPv6 bits in CSR2?

> +		else
> +			val = 0;
> +
> +		ret = ravb_endisable_csum_gbeth(ndev, CSR2, val, CSR0_RPE);
> +		if (ret)
> +			goto done;
> +	}
> +
> +	ndev->features = features;
> +done:
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return ret;
>  }
>  
>  static int ravb_set_features_rcar(struct net_device *ndev,
[...]

MBR, Sergey

