Return-Path: <linux-renesas-soc+bounces-9609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C65F995888
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 22:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A521EB2112B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 20:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04CE215014;
	Tue,  8 Oct 2024 20:36:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2844B213EF9;
	Tue,  8 Oct 2024 20:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728419774; cv=none; b=HPCTj0n7rh23dH1t66XbcVF4j9BaxHk852o77xs6ane5eNN5mCivbA9EWThFwFSW4v2nsJgoEKElTLuvVwUmYDyFBgo8VhfeewSyTaIVqRCKUnqdfBdX9sS//UjAChswNqMTfmjHRTjmKLzBEmfEhAsgh+u+y50c05i1tBUq+k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728419774; c=relaxed/simple;
	bh=wgqyHfk/ndHoYa6+URH97TEM/hg5nZNzH6pNcRMhlk8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=BRD6emBBjc7oSSYPh7QptPGT8RCOAQGAn2yMzrQsnaUsvciHu6N0KC6vrSTqrtW7T6minNg+B4rY18JdXI3ycVUv2s2asXn72JqKBFxY4Sc0tjUFmo80HAD88qrzaOmta2V9+VFBjxlfcQ/DimCMaQsZDCf6Cl+07KTFWW8JNdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.101] (213.87.132.215) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 8 Oct
 2024 23:35:54 +0300
Message-ID: <3ece7089-6881-47b9-bcde-cafb15115167@omp.ru>
Date: Tue, 8 Oct 2024 23:35:53 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [net-next] net: ravb: Only advertise Rx/Tx timestamps if hardware
 supports it
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Paul
 Barker <paul.barker.ct@bp.renesas.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>
References: <20241005121411.583121-1-niklas.soderlund+renesas@ragnatech.se>
 <a733e3df-1fc3-41a1-9025-0eb02c5ffd0a@omp.ru>
 <6737d975-cf87-452b-92b2-abc7141a98cd@omp.ru>
 <20241008174512.GA4146181@ragnatech.se>
Content-Language: en-US
Organization: Open Mobile Platform
In-Reply-To: <20241008174512.GA4146181@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 10/08/2024 20:26:32
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 188310 [Oct 08 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 39 0.3.39
 e168d0b3ce73b485ab2648dd465313add1404cce
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.132.215 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.132.215 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.132.215
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/08/2024 20:29:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/8/2024 7:32:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 10/8/24 8:45 PM, Niklas Söderlund wrote:
[...]

> Sorry for missing your comment earlier.

   I prolly shouldn't have stamped my R-b tag so easily before
asking a question. :-)

[...]

>>>> Recent work moving the reporting of Rx software timestamps to the core
>>>> [1] highlighted an issue where hardware time stamping where advertised

   s/where/was/.

>>>> for the platforms where it is not supported.
>>>>
>>>> Fix this by covering advertising support for hardware timestamps only if
>>>> the hardware supports it. Due to the Tx implementation in RAVB software
>>>> Tx timestamping is also only considered if the hardware supports
>>>> hardware timestamps. This should be addressed in future, but this fix
>>>> only reflects what the driver currently implements.
>>>>
>>>> 1. Commit 277901ee3a26 ("ravb: Remove setting of RX software timestamp")
>>>>
>>>> Fixes: 7e09a052dc4e ("ravb: Exclude gPTP feature support for RZ/G2L")
>>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> [...]
>>>
>>> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>>
>>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>>> index d2a6518532f3..907af4651c55 100644
>>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>>> @@ -1750,20 +1750,19 @@ static int ravb_get_ts_info(struct net_device *ndev,
>>>>  	struct ravb_private *priv = netdev_priv(ndev);
>>>>  	const struct ravb_hw_info *hw_info = priv->info;
>>>>  
>>>> -	info->so_timestamping =
>>>> -		SOF_TIMESTAMPING_TX_SOFTWARE |
>>>> -		SOF_TIMESTAMPING_TX_HARDWARE |
>>>> -		SOF_TIMESTAMPING_RX_HARDWARE |
>>>> -		SOF_TIMESTAMPING_RAW_HARDWARE;
>>>> -	info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
>>>> -	info->rx_filters =
>>>> -		(1 << HWTSTAMP_FILTER_NONE) |
>>>> -		(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
>>>> -		(1 << HWTSTAMP_FILTER_ALL);
>>>> -	if (hw_info->gptp || hw_info->ccc_gac)
>>>> +	if (hw_info->gptp || hw_info->ccc_gac) {
>>>> +		info->so_timestamping =
>>>> +			SOF_TIMESTAMPING_TX_SOFTWARE |
>>>> +			SOF_TIMESTAMPING_TX_HARDWARE |
>>>> +			SOF_TIMESTAMPING_RX_HARDWARE |
>>>> +			SOF_TIMESTAMPING_RAW_HARDWARE;
>>>> +		info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
>>>> +		info->rx_filters =
>>>> +			(1 << HWTSTAMP_FILTER_NONE) |
>>>> +			(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
>>>> +			(1 << HWTSTAMP_FILTER_ALL);
>>>>  		info->phc_index = ptp_clock_index(priv->ptp.clock);
>>>> -	else
>>>> -		info->phc_index = 0;
>>>
>>>    Is it OK to remove this line?
> 
> Yes it is OK, see the discussion that sparked this patch.
> 
> https://lore.kernel.org/netdev/20240829204429.GA3708622@ragnatech.se/

   Ah, now I'm seeing where that 0 came from... :-)

>>    Also, how about inverting the *if* condition above (and doing an early
>> *return*) and avoiding reindenting the code below it?
> 
> I thought about that but opted not to do so. The same check is used all 
> over the code and I think it's value in keeping it similar. I will go 
> over all this code again as Gen4 will need more work to fully enable 
> gPTP. My hope is to abstract the check into something bore descriptive 

   s/bore/more/? :-)

> instead of sprinkling yet more conditions on to this one. Is it OK for 
> you to keep them aligned for now?

   Fine by me.

>> [...]

MBR, Sergey

