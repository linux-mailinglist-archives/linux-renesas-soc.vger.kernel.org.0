Return-Path: <linux-renesas-soc+bounces-9567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 640839936F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 21:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 883861C2143F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 19:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394B51D90CB;
	Mon,  7 Oct 2024 19:05:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1C22098;
	Mon,  7 Oct 2024 19:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728327931; cv=none; b=MvQ3rA0jEJZB6hcJxWkOtTZxvMAnqRGeUITuuhGlnPFHK/XL3VlwX6GC5mAkbFsDVfPOPRZJVmc3jfAQJ7rVFdgEBLw+S2AUY6UCoaZIuO7bsohdn93dLgxWkoRpwghrvXUFvNDIpMFxDQTZksaLG+1oBf/Dmm/N1hyp0jU387I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728327931; c=relaxed/simple;
	bh=5C8FnDYbKcBoRPSYMx5j7pldvPgXbkOVg9Ey6mLyces=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nveqElak30gV5xrIEjSEL2EBwbzqJvMg6YMVylWC1qplBtCYeV0dnUXPPFf5VsB3MKBvE8sI4EjZmmQuCleSGvRG0CQel4LxXw2ZqjniA2WbJo6Kyr/2zlmIM2eSdKBsIfu5s5TOr1RWHcW9ry+z64mtB03J91mTJptCRH4MLuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.100] (213.87.153.120) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 7 Oct
 2024 22:05:08 +0300
Message-ID: <a733e3df-1fc3-41a1-9025-0eb02c5ffd0a@omp.ru>
Date: Mon, 7 Oct 2024 22:05:08 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next] net: ravb: Only advertise Rx/Tx timestamps if hardware
 supports it
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, <netdev@vger.kernel.org>
CC: <linux-renesas-soc@vger.kernel.org>
References: <20241005121411.583121-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20241005121411.583121-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 10/07/2024 18:47:22
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 188276 [Oct 07 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 39 0.3.39
 e168d0b3ce73b485ab2648dd465313add1404cce
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;213.87.153.120:7.1.2
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.153.120
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/07/2024 18:51:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/7/2024 5:10:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 10/5/24 15:14, Niklas Söderlund wrote:

> Recent work moving the reporting of Rx software timestamps to the core
> [1] highlighted an issue where hardware time stamping where advertised
> for the platforms where it is not supported.
> 
> Fix this by covering advertising support for hardware timestamps only if
> the hardware supports it. Due to the Tx implementation in RAVB software
> Tx timestamping is also only considered if the hardware supports
> hardware timestamps. This should be addressed in future, but this fix
> only reflects what the driver currently implements.
> 
> 1. Commit 277901ee3a26 ("ravb: Remove setting of RX software timestamp")
> 
> Fixes: 7e09a052dc4e ("ravb: Exclude gPTP feature support for RZ/G2L")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index d2a6518532f3..907af4651c55 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1750,20 +1750,19 @@ static int ravb_get_ts_info(struct net_device *ndev,
>  	struct ravb_private *priv = netdev_priv(ndev);
>  	const struct ravb_hw_info *hw_info = priv->info;
>  
> -	info->so_timestamping =
> -		SOF_TIMESTAMPING_TX_SOFTWARE |
> -		SOF_TIMESTAMPING_TX_HARDWARE |
> -		SOF_TIMESTAMPING_RX_HARDWARE |
> -		SOF_TIMESTAMPING_RAW_HARDWARE;
> -	info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
> -	info->rx_filters =
> -		(1 << HWTSTAMP_FILTER_NONE) |
> -		(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
> -		(1 << HWTSTAMP_FILTER_ALL);
> -	if (hw_info->gptp || hw_info->ccc_gac)
> +	if (hw_info->gptp || hw_info->ccc_gac) {
> +		info->so_timestamping =
> +			SOF_TIMESTAMPING_TX_SOFTWARE |
> +			SOF_TIMESTAMPING_TX_HARDWARE |
> +			SOF_TIMESTAMPING_RX_HARDWARE |
> +			SOF_TIMESTAMPING_RAW_HARDWARE;
> +		info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
> +		info->rx_filters =
> +			(1 << HWTSTAMP_FILTER_NONE) |
> +			(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
> +			(1 << HWTSTAMP_FILTER_ALL);
>  		info->phc_index = ptp_clock_index(priv->ptp.clock);
> -	else
> -		info->phc_index = 0;

   Is it OK to remove this line?

> +	}
[...]

MBR, Sergey


