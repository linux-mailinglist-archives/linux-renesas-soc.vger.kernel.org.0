Return-Path: <linux-renesas-soc+bounces-2336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A63B84A2FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 20:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC6D31C24853
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 19:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21BA4BAAA;
	Mon,  5 Feb 2024 19:01:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E0048CC6;
	Mon,  5 Feb 2024 19:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159701; cv=none; b=XR5bSuiY+rJWa8Ojo0v7xpZX/DAdwziiIIxKl6hmhAa5tabmkUULL/yejmBWgcjqxdQJP4v8QJJlpTwpKWBpMi/olG9+DWzGHQQ/ignWOX5OeUQBAQGPmKhiyXRlJ5w64pX+VU4hZaZ/s6Vg9W3jrsShEScMoEolKCvpRJpTrCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159701; c=relaxed/simple;
	bh=YI+Cz/rxozFyg8d5Ypa8dOeLaDC4ZN+36rCKd3WdcmE=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=NRzJcbrVSpeCaF3E9ETCr+LZLzCY5oOwF3qyn8vjIID95e8izLj0kD/0hZXZ4Xj7xw8YvqhlRZ8xBEdQ4KTzHY49DpBSdQpbeeZOeow+nNxWhRdWMZEKtJp10iWhNDL7ermvCDJ4/ga6Q598owpIWvMmg2rQ5OhskV0sBOjcxZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.75.11) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 5 Feb
 2024 22:01:22 +0300
Subject: Re: [PATCH v4 net-next 1/2] ravb: Add Rx checksum offload support for
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
References: <20240203142559.130466-1-biju.das.jz@bp.renesas.com>
 <20240203142559.130466-2-biju.das.jz@bp.renesas.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <dd3ffb2d-23f4-49a6-e427-2b6afb96ddfd@omp.ru>
Date: Mon, 5 Feb 2024 22:01:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240203142559.130466-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 02/05/2024 18:41:57
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 183206 [Feb 05 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.75.11 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.75.11 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.11
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/05/2024 18:48:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/5/2024 3:37:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/3/24 5:25 PM, Biju Das wrote:

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
> index e0f8276cffed..64bf29d01ad0 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -205,7 +205,10 @@ enum ravb_reg {
>  	TLFRCR	= 0x0758,
>  	RFCR	= 0x0760,
>  	MAFCR	= 0x0778,
> -	CSR0    = 0x0800,	/* RZ/G2L only */
> +
> +	/* RZ/G2L TOE registers */

   Thanks. Though I think I'd prefer /* TOE registers (RZ/G2L only) */...

[...]
> @@ -978,6 +981,21 @@ enum CSR0_BIT {
>  	CSR0_RPE	= 0x00000020,
>  };
>  
> +enum CSR2_BIT {
> +	CSR2_RIP4	= 0x00000001,
> +	CSR2_RTCP4	= 0x00000010,
> +	CSR2_RUDP4	= 0x00000020,
> +	CSR2_RICMP4	= 0x00000040,
> +	CSR2_RTCP6	= 0x00100000,
> +	CSR2_RUDP6	= 0x00200000,
> +	CSR2_RICMP6	= 0x00400000,
> +	CSR2_RHOP	= 0x01000000,
> +	CSR2_RROUT	= 0x02000000,
> +	CSR2_RAHD	= 0x04000000,
> +	CSR2_RDHD	= 0x08000000,
> +	CSR2_ALL	= 0x0F700071,

  I doubt we really need CSR2_ALL...

[...]
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 0e3731f50fc2..4f310bcee7c0 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -522,6 +522,24 @@ static int ravb_ring_init(struct net_device *ndev, int q)
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
> +		ravb_write(ndev, CSR2_ALL & ~(CSR2_RTCP6 | CSR2_RUDP6 |
> +					      CSR2_RICMP6), CSR2);

   With these 3 bits being 0, the bits 24...27 are ignored anyway,
the manual says. So I think I'd prefer:

		ravb_write(ndev, CSR2_RIP4 | CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4,
			   CSR2);

> +	}
> +
> +done:
> +	ravb_write(ndev, CSR0_TPE | CSR0_RPE, CSR0);

   I think we shouldn't set CSR0.TPE yet at this point, as we n't setup
CSR1 yet...

[...]
> @@ -2334,11 +2381,48 @@ static void ravb_set_rx_csum(struct net_device *ndev, bool enable)
[...]
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
> +			val = CSR2_ALL & ~(CSR2_RTCP6 | CSR2_RUDP6 | CSR2_RICMP6);

   Likewise, I'd prefer:

			val = CSR2_RIP4 | CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4;

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

   Otherwise LGTM. We're close! :-)

MBR, Sergey

