Return-Path: <linux-renesas-soc+bounces-9239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDD598ACF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 21:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C951A284053
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 19:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C2D199252;
	Mon, 30 Sep 2024 19:30:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3A94206E;
	Mon, 30 Sep 2024 19:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727724631; cv=none; b=DLpfaMaBkFxhbA6+/JtCngOPsfP99wQTdNdqAVJEOM+GEBrTmqdzldzt0B4g0WV/lUbN1L6Z13mXVqtW2X16r84s3gl5Z5TwYJfDutmKsXhHIuY7K5mXaghTiQUrhNRKYHtHAkXGQYW8Ct38h5Yggpzt8tJbWMMWCs39pUdr8nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727724631; c=relaxed/simple;
	bh=OVm5n8rRgeWWLWcPZNj0/VWtcXnxpJfHbaBD144bNzk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=LVdiEXFrbH/SM3xG6KGaJ9GBRDN3m2BqY3hTeK+MOXll4D0rX40V0V6daVLOFsK4ITaqvObaSiXOdNkQjvqPinLKf9ZUAOsbkTAXS2GwQlRyNZqUpc+14WqVAOioQLpLoGgy0FTCsgdw9nJjp912hUxRAsHEYI3V1MheuMwOnkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.100] (213.87.154.82) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 30 Sep
 2024 22:30:25 +0300
Message-ID: <8cb1de35-a40a-4d1b-a081-1b8fc08e0a6a@omp.ru>
Date: Mon, 30 Sep 2024 22:30:25 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 05/11] net: ravb: Simplify types in RX csum
 validation
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Paul Barker <paul@pbarker.dev>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
CC: Paul Barker <paul.barker.ct@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>, Biju Das
	<biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240930160845.8520-1-paul@pbarker.dev>
 <20240930160845.8520-6-paul@pbarker.dev>
 <b4707880-2be4-4132-a3e1-8b104b89828c@omp.ru>
Content-Language: en-US
Organization: Open Mobile Platform
In-Reply-To: <b4707880-2be4-4132-a3e1-8b104b89828c@omp.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 09/30/2024 19:14:44
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 188102 [Sep 30 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 35 0.3.35
 d90443ea3cdf6e421a9ef5a0a400f1251229ba23
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.154.82
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/30/2024 19:18:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/30/2024 3:37:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 9/30/24 22:11, Sergey Shtylyov wrote:
[...]

>> From: Paul Barker <paul.barker.ct@bp.renesas.com>
>>
>> The HW checksum value is used as a 16-bit flag, it is zero when the
> 
>    I think I prefer s/HW/hardware/ but there's no hard feelings... :-)
> 
>> checksum has been validated and non-zero otherwise. Therefore we don't
>> need to treat this as an actual __wsum type or call csum_unfold(), we
>> can just use a u16 pointer.
>>
>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> [...]
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index 1dd2152734b0..9350ca10ab22 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> [...]
>> @@ -762,23 +761,22 @@ static void ravb_rx_csum_gbeth(struct sk_buff *skb)
[...]
>> +	if (unlikely(skb->len < csum_len))
>>  		return;
>>  
>>  	if (skb_is_nonlinear(skb)) {
>> -		last_frag = &shinfo->frags[shinfo->nr_frags - 1];
>> -		hw_csum = skb_frag_address(last_frag) +
>> -			  skb_frag_size(last_frag);
>> -		skb_frag_size_sub(last_frag, 2 * sizeof(__sum16));
>> +		skb_frag_t *last_frag = &shinfo->frags[shinfo->nr_frags - 1];
> 
>    Could've been done in the previous patch...

   Even fit better there, I think...

>> +
>> +		hw_csum = (u16 *)(skb_frag_address(last_frag) +
>> +				  skb_frag_size(last_frag));
>> +		skb_frag_size_sub(last_frag, csum_len);
>>  	} else {
>> -		hw_csum = skb_tail_pointer(skb);
>> -		skb_trim(skb, skb->len - 2 * sizeof(__sum16));
>> +		hw_csum = (u16 *)skb_tail_pointer(skb);
>> +		skb_trim(skb, skb->len - csum_len);
>>  	}
>>  
>> -	hw_csum -= sizeof(__sum16);
>> -	csum_proto = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
>> -
>> -	if (!csum_proto)
>> +	if (!*--hw_csum)
> 
>    Hm, you lost get_unaligned_le16() here. The checksum can be anywhere,
> unaligned too...

   No need to keep using get_unaligned_le16() itself but you should then switch to 
using get_unaligned().

[...]

MBR, Sergey


