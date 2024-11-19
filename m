Return-Path: <linux-renesas-soc+bounces-10599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A53DF9D2F38
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 21:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DBAB1F22FB4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 20:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80031192D77;
	Tue, 19 Nov 2024 20:03:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698BB145B00;
	Tue, 19 Nov 2024 20:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732046581; cv=none; b=JfhGFeqC2jCla+36PaHPrbp/MyMXrEjguJLXhHNWWtibViLmkiV3hkEKVf0FvB+HpEUl0cDqMbDV5BPFDTBNVqxucxg5Qaonzs5tbUUJdkUosVX8oALQ+pRUvXGeGFyBS985CoX+9wy8vuSB2HLZw9yLfk7GuyzgopgYq/fpSsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732046581; c=relaxed/simple;
	bh=oyrP4rEhqW2swy9d4IavgjUCNO+af0YxVMiwwPcePOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hrVFQpZHjC07ZFBYl+g89eYUrlpcAeQikiiNjs3tGWToY+5/h1M3LmxiZlESzE+vloIgRh5ZqEjzcqZU+W5LrR5QTLKjkcOEXAvrgwmLDSoMvVzyrjBuykrzJ0KHiuRO7RTDyRMCkBItt0/4M3JbawSGNtfz8la7hk35uebdiDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.150.95) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 19 Nov
 2024 23:02:34 +0300
Message-ID: <26a1dd4d-80b1-411a-abb5-92e20f5751e7@omp.ru>
Date: Tue, 19 Nov 2024 23:02:33 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 net-next] net: modernize ioremap in probe
To: Rosen Penev <rosenp@gmail.com>, <netdev@vger.kernel.org>
CC: Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Chris Snook <chris.snook@gmail.com>, Marcin Wojtas
	<marcin.s.wojtas@gmail.com>, Russell King <linux@armlinux.org.uk>, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund@ragnatech.se>, Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, open list
	<linux-kernel@vger.kernel.org>, "open list:RENESAS ETHERNET SWITCH DRIVER"
	<linux-renesas-soc@vger.kernel.org>
References: <20241117212711.13612-1-rosenp@gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20241117212711.13612-1-rosenp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 11/19/2024 19:48:47
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 189278 [Nov 19 2024]
X-KSE-AntiSpam-Info: Version: 6.1.1.7
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 41 0.3.41
 623e98d5198769c015c72f45fabbb9f77bdb702b
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.150.95 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.150.95
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/19/2024 19:51:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/19/2024 7:05:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 11/18/24 12:27 AM, Rosen Penev wrote:

> Convert platform_get_resource_bynam + devm_ioremap_resource to
> devm_platform_ioremap_resource_byname.
> 
> Convert platform_get_resource + devm_ioremap_resource to
> devm_platform_ioremap_resource.
> 
> resource aquisition and ioremap can be performed in one step.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v3: reworded commit message again. Also removed devm_ioremap
>  conversions. Even though they use normal resource, they are not
>  the same.
>  v2: fixed compilation errors on PPC and reworded commit message
>  drivers/net/dsa/hirschmann/hellcreek.c         | 18 +++---------------
>  drivers/net/ethernet/atheros/ag71xx.c          | 13 +++++--------
>  drivers/net/ethernet/broadcom/bcm63xx_enet.c   |  6 ++----
>  .../net/ethernet/marvell/mvpp2/mvpp2_main.c    | 14 +++++---------
>  drivers/net/ethernet/renesas/rswitch.c         |  9 +--------
>  drivers/net/ethernet/renesas/rtsn.c            | 10 ++--------
>  drivers/net/mdio/mdio-ipq4019.c                |  5 +----
>  7 files changed, 19 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hirschmann/hellcreek.c
> index 283ec5a6e23c..940c4fa6a924 100644
> --- a/drivers/net/dsa/hirschmann/hellcreek.c
> +++ b/drivers/net/dsa/hirschmann/hellcreek.c
[...]
> @@ -1982,23 +1981,12 @@ static int hellcreek_probe(struct platform_device *pdev)
>  
>  	hellcreek->dev = dev;
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tsn");
> -	if (!res) {
> -		dev_err(dev, "No memory region provided!\n");
> -		return -ENODEV;
> -	}
> -
> -	hellcreek->base = devm_ioremap_resource(dev, res);
> +	hellcreek->base = devm_platform_ioremap_resource_byname(pdev, "tsn");
>  	if (IS_ERR(hellcreek->base))
>  		return PTR_ERR(hellcreek->base);
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ptp");
> -	if (!res) {
> -		dev_err(dev, "No PTP memory region provided!\n");
> -		return -ENODEV;
> -	}
> -
> -	hellcreek->ptp_base = devm_ioremap_resource(dev, res);
> +	hellcreek->ptp_base = 
> +		devm_platform_ioremap_resource_byname(pdev, "ptp");

   You have full 100 columns now, so doing this with 2 lines doesn't seem necessary --
checkpatch.pl shouldn't complain...

[...]

   Other than that, looks saner now... :-)

MBR, Sergey


