Return-Path: <linux-renesas-soc+bounces-2337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFED84A7FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 22:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83C741C27A83
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Feb 2024 21:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F69134731;
	Mon,  5 Feb 2024 20:27:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498221339B8;
	Mon,  5 Feb 2024 20:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707164848; cv=none; b=mJGOXuf3S5ngtnq+Sh887Vwrt8uFxjf3FGktzUyjHHDDWgd4CN4yi6g3f9cd/KydU6J/BZ3QOGzZ3zmVnrLpH9HUiZgRiSSvjQlewyYnMP8QEVtn4OAhROOrisXPCNUW/WuWj4RvnW6PYBvDktvrI6DEs5qBBKe7HXnve7NmZLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707164848; c=relaxed/simple;
	bh=iLUOOw1QWDbi1QQztNVRK+vAnuRON36QfpWe2fiMuTs=;
	h=From:Subject:To:CC:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FaJO7nOXWu4lCF3Z53oTDxpS9d7xISR4f9FMdcDKEaZ5HB4Nhr8J2RvfFfi/CLuKiYOvocVFgRS0vPwhkAL5TAiO6GWEgIw6sl+cRpma7kNaZEWNzCfnZLPr79mWVMz/IriLydRdFGvHPdSdSOPRu069lwzygtDkltkMvNSfKLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.75.11) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 5 Feb
 2024 23:27:13 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v4 net-next 2/2] ravb: Add Tx checksum offload support for
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
 <20240203142559.130466-3-biju.das.jz@bp.renesas.com>
Organization: Open Mobile Platform
Message-ID: <76b13c41-9f0b-daf2-9aa8-7fdaf489fe0a@omp.ru>
Date: Mon, 5 Feb 2024 23:27:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240203142559.130466-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 02/05/2024 20:16:46
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 183207 [Feb 05 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.75.11 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
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
X-KSE-Antiphishing-Bases: 02/05/2024 20:20:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/5/2024 5:20:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 2/3/24 5:25 PM, Biju Das wrote:

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
[...]

> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index 64bf29d01ad0..d7b1c6d15a17 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
[...]
> @@ -981,6 +982,21 @@ enum CSR0_BIT {
>  	CSR0_RPE	= 0x00000020,
>  };
>  
> +enum CSR1_BIT {
> +	CSR1_TIP4	= 0x00000001,
> +	CSR1_TTCP4	= 0x00000010,
> +	CSR1_TUDP4	= 0x00000020,
> +	CSR1_TICMP4	= 0x00000040,
> +	CSR1_TTCP6	= 0x00100000,
> +	CSR1_TUDP6	= 0x00200000,
> +	CSR1_TICMP6	= 0x00400000,
> +	CSR1_THOP	= 0x01000000,
> +	CSR1_TROUT	= 0x02000000,
> +	CSR1_TAHD	= 0x04000000,
> +	CSR1_TDHD	= 0x08000000,
> +	CSR1_ALL	= 0x0F700071,

   I doubt we really need CSR1_ALL...

[...]
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 4f310bcee7c0..fee771f14fc5 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[...]
> @@ -524,16 +525,29 @@ static int ravb_ring_init(struct net_device *ndev, int q)
>  
>  static void ravb_csum_init_gbeth(struct net_device *ndev)
>  {
> -	if (!(ndev->features & NETIF_F_RXCSUM))
> +	bool tx_enable = ndev->features & NETIF_F_HW_CSUM;
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
> +			ndev->features &= ~NETIF_F_HW_CSUM;
> +
> +		if (rx_enable)
> +			ndev->features &= ~NETIF_F_RXCSUM;
>  	} else {
> -		ravb_write(ndev, CSR2_ALL & ~(CSR2_RTCP6 | CSR2_RUDP6 |
> -					      CSR2_RICMP6), CSR2);
> +		if (tx_enable)
> +			ravb_write(ndev, CSR1_ALL & ~(CSR1_TICMP4 | CSR1_TTCP6 |
> +						      CSR1_TUDP6 | CSR1_TICMP6), CSR1);

   With the v6 bits 20...22 being 0, the bits 24...27 are ignored anyway,
the manual says. So I think I'd prefer:

			ravb_write(ndev, CSR1_TIP4 | CSR1_TTCP4 | CSR1_TUDP4, CSR1);
[...]
> @@ -2418,6 +2465,18 @@ static int ravb_set_features_gbeth(struct net_device *ndev,
>  			goto done;
>  	}
>  
> +	if (changed & NETIF_F_HW_CSUM) {
> +		if (features & NETIF_F_HW_CSUM)
> +			val = CSR1_ALL & ~(CSR1_TICMP4 | CSR1_TTCP6 |
> +					   CSR1_TUDP6 | CSR1_TICMP6);

   Likewise, I'd prefer:

			val = CSR1_TIP4 | CSR1_TTCP4 | CS12_TUDP4;

[...]

MBR, Sergey

