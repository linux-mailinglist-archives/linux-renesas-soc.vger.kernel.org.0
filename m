Return-Path: <linux-renesas-soc+bounces-9346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7D98F039
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 15:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20F53B20DBE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 13:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE05319B3F6;
	Thu,  3 Oct 2024 13:20:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7803010A1E;
	Thu,  3 Oct 2024 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961625; cv=none; b=ChnS0+QMGndjnKxe+Y+Yhyb/nRDlFITVBpZEh6OLvCSPhzuGp/blGPqpn8mSvDHkKtCklUASCOvXE7mzGKHo3DSuXopA2kqZgALweQP0MEgaq8B9oYN+/fEgXj4QB3QUcvVzM1jFcNPx31HnqCqfpTsnNazb56Jm2nNYgAdktjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961625; c=relaxed/simple;
	bh=c6qomeuKw5BgmzWPNaiQbIe2j5SW6v5hqko7bfAiwXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U3xtCZBCtT3NsgRR3MDqq+NAJbjacUefzIRwG4gquzEkfpJj8S6I/494z1QBRl+4TE8g5UAbE+zzYqfANEC+4yagFGyh3KYsT1en7gSoDleffoT8VKQvVuiUPi2IX90tY7iTk4TXO8YFnKB1tcpuum+ebbZYoC86FiAZXM/qU2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.100] (213.87.159.233) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 3 Oct
 2024 16:20:04 +0300
Message-ID: <bfb2ebd9-0d96-4ce2-b766-358c7253e065@omp.ru>
Date: Thu, 3 Oct 2024 16:20:01 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 05/11] net: ravb: Simplify types in RX csum
 validation
To: Paul Barker <paul.barker.ct@bp.renesas.com>, Paul Barker
	<paul@pbarker.dev>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240930160845.8520-1-paul@pbarker.dev>
 <20240930160845.8520-6-paul@pbarker.dev>
 <b4707880-2be4-4132-a3e1-8b104b89828c@omp.ru>
 <0a779070-d91a-49df-a606-5fc9428e312c@bp.renesas.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <0a779070-d91a-49df-a606-5fc9428e312c@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 10/03/2024 12:53:14
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 188181 [Oct 03 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 37 0.3.37
 76d1f08bc1e1f80c2a3a76a1cc8929a49fe2f262
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.159.233 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.159.233 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2;213.87.159.233:7.1.2
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.159.233
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/03/2024 12:57:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/3/2024 10:36:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 10/3/24 12:23, Paul Barker wrote:
[...]

>>> From: Paul Barker <paul.barker.ct@bp.renesas.com>
>>>
>>> The HW checksum value is used as a 16-bit flag, it is zero when the
>>
>>    I think I prefer s/HW/hardware/ but there's no hard feelings... :-)
>>
>>> checksum has been validated and non-zero otherwise. Therefore we don't
>>> need to treat this as an actual __wsum type or call csum_unfold(), we
>>> can just use a u16 pointer.
>>>
>>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
>> [...]
>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>> index 1dd2152734b0..9350ca10ab22 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> [...]
>>> @@ -762,23 +761,22 @@ static void ravb_rx_csum_gbeth(struct sk_buff *skb)
>>>  	 * The last 2 bytes are the protocol checksum status which will be zero
>>>  	 * if the checksum has been validated.
>>>  	 */
>>> -	if (unlikely(skb->len < sizeof(__sum16) * 2))
>>> +	csum_len = sizeof(*hw_csum) * 2;
>>
>>    Could've been done by an initializer instead?
> 
> So, if I move this to the initializers at the start of the function,
> csum_len must be declared after hw_csum which breaks reverse Christmas
> tree ordering:
> 
>     struct skb_shared_info *shinfo = skb_shinfo(skb);
>     u16 *hw_csum;
>     size_t csum_len = sizeof(*hw_csum) * 2;

   Could use sizeof(u16) instead, but it's OK to ignore me on this
matter. :-)

> Thanks,

MBR, Sergey


