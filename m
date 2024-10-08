Return-Path: <linux-renesas-soc+bounces-9605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB66995598
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 19:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BE441C23E52
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 17:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73021F9AB0;
	Tue,  8 Oct 2024 17:26:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242161F9A9F;
	Tue,  8 Oct 2024 17:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728408391; cv=none; b=Zo+jfIX2Q4EkYCDh6l7wJgSJOjAMrEGA6phi13OJFcYknSjNCesgAgU0F5wf857L3v6RxhwWJEvsScJXcBF6IwG/pY7bvDY5UbWoZyyIIx7Knv94nxK6J3pYctkLRkvZEuCTVpmiV9MFfleJAFDlkgoPB/3uHqxdm8w+HLiOBsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728408391; c=relaxed/simple;
	bh=b7rmrrrvJLSfVciQyO3OtPm6DaLqWFsb3bZAhTmR8xc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=WqK9/A4MVTCROlMKblm2qdRf9A/c18JpjnjKQ0FxAotFef+V3QjO0cWdxOq0MJjPBgLG9+OyADFRz1tBv2fhsQ01wWGjVIjqXIJB/9oHDfCN0j2VM+xjClIg3iFnnmo2EiLMuMnoZMAlZx3bINYddQQ0PhAPu2l7qdLdutBwIMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.101] (213.87.132.215) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 8 Oct
 2024 20:26:22 +0300
Message-ID: <6737d975-cf87-452b-92b2-abc7141a98cd@omp.ru>
Date: Tue, 8 Oct 2024 20:26:21 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next] net: ravb: Only advertise Rx/Tx timestamps if hardware
 supports it
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, <netdev@vger.kernel.org>
CC: <linux-renesas-soc@vger.kernel.org>
References: <20241005121411.583121-1-niklas.soderlund+renesas@ragnatech.se>
 <a733e3df-1fc3-41a1-9025-0eb02c5ffd0a@omp.ru>
Content-Language: en-US
Organization: Open Mobile Platform
In-Reply-To: <a733e3df-1fc3-41a1-9025-0eb02c5ffd0a@omp.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 10/08/2024 17:07:01
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 188308 [Oct 08 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 39 0.3.39
 e168d0b3ce73b485ab2648dd465313add1404cce
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.132.215
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/08/2024 17:11:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/8/2024 2:00:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 10/7/24 10:05 PM, Sergey Shtylyov wrote:
[...]

>> Recent work moving the reporting of Rx software timestamps to the core
>> [1] highlighted an issue where hardware time stamping where advertised
>> for the platforms where it is not supported.
>>
>> Fix this by covering advertising support for hardware timestamps only if
>> the hardware supports it. Due to the Tx implementation in RAVB software
>> Tx timestamping is also only considered if the hardware supports
>> hardware timestamps. This should be addressed in future, but this fix
>> only reflects what the driver currently implements.
>>
>> 1. Commit 277901ee3a26 ("ravb: Remove setting of RX software timestamp")
>>
>> Fixes: 7e09a052dc4e ("ravb: Exclude gPTP feature support for RZ/G2L")
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> [...]
> 
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index d2a6518532f3..907af4651c55 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -1750,20 +1750,19 @@ static int ravb_get_ts_info(struct net_device *ndev,
>>  	struct ravb_private *priv = netdev_priv(ndev);
>>  	const struct ravb_hw_info *hw_info = priv->info;
>>  
>> -	info->so_timestamping =
>> -		SOF_TIMESTAMPING_TX_SOFTWARE |
>> -		SOF_TIMESTAMPING_TX_HARDWARE |
>> -		SOF_TIMESTAMPING_RX_HARDWARE |
>> -		SOF_TIMESTAMPING_RAW_HARDWARE;
>> -	info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
>> -	info->rx_filters =
>> -		(1 << HWTSTAMP_FILTER_NONE) |
>> -		(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
>> -		(1 << HWTSTAMP_FILTER_ALL);
>> -	if (hw_info->gptp || hw_info->ccc_gac)
>> +	if (hw_info->gptp || hw_info->ccc_gac) {
>> +		info->so_timestamping =
>> +			SOF_TIMESTAMPING_TX_SOFTWARE |
>> +			SOF_TIMESTAMPING_TX_HARDWARE |
>> +			SOF_TIMESTAMPING_RX_HARDWARE |
>> +			SOF_TIMESTAMPING_RAW_HARDWARE;
>> +		info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
>> +		info->rx_filters =
>> +			(1 << HWTSTAMP_FILTER_NONE) |
>> +			(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
>> +			(1 << HWTSTAMP_FILTER_ALL);
>>  		info->phc_index = ptp_clock_index(priv->ptp.clock);
>> -	else
>> -		info->phc_index = 0;
> 
>    Is it OK to remove this line?

   Also, how about inverting the *if* condition above (and doing an early
*return*) and avoiding reindenting the code below it?

[...]

MBR, Sergey


