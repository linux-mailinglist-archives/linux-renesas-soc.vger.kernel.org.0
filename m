Return-Path: <linux-renesas-soc+bounces-247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F19AF7F7A56
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 18:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83A39B20AAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 17:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DE3364D5;
	Fri, 24 Nov 2023 17:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB4F1733;
	Fri, 24 Nov 2023 09:27:30 -0800 (PST)
Received: from [192.168.1.103] (31.173.82.189) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 24 Nov
 2023 20:27:21 +0300
Subject: Re: [PATCH 06/13] net: ravb: Let IP specific receive function to
 interrogate descriptors
To: claudiu beznea <claudiu.beznea@tuxon.dev>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<p.zabel@pengutronix.de>, <yoshihiro.shimoda.uh@renesas.com>,
	<geert+renesas@glider.be>, <wsa+renesas@sang-engineering.com>,
	<biju.das.jz@bp.renesas.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<sergei.shtylyov@cogentembedded.com>, <mitsuhiro.kimura.kc@renesas.com>,
	<masaru.nagai.vx@renesas.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120084606.4083194-7-claudiu.beznea.uj@bp.renesas.com>
 <b626455a-f7a4-2684-725c-c679dd75a515@omp.ru>
 <199ae595-5097-4ec6-bbff-86a3e2260b23@tuxon.dev>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <158b4b42-ab90-87b3-7345-646e9cd3844e@omp.ru>
Date: Fri, 24 Nov 2023 20:27:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <199ae595-5097-4ec6-bbff-86a3e2260b23@tuxon.dev>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 11/24/2023 17:00:24
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181588 [Nov 24 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 4 0.3.4 720d3c21819df9b72e78f051e300e232316d302a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.82.189 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.82.189
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/24/2023 17:09:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/24/2023 2:00:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 11/23/23 8:15 PM, claudiu beznea wrote:

[...]

>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> ravb_poll() initial code used to interrogate the first descriptor of the
>>> RX queue in case gptp is false to know if ravb_rx() should be called.
>>> This is done for non GPTP IPs. For GPTP IPs the driver PTP specific
>>
>>    It's called gPTP, AFAIK.
>>
>>> information was used to know if receive function should be called. As
>>> every IP has it's own receive function that interrogates the RX descriptor
>>
>>    Its own.
>>
>>> list in the same way the ravb_poll() was doing there is no need to double
>>> check this in ravb_poll(). Removing the code form ravb_poll() and
>>
>>    From ravb_poll().
>>
>>> adjusting ravb_rx_gbeth() leads to a cleaner code.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>> ---
>>>  drivers/net/ethernet/renesas/ravb_main.c | 18 ++++++------------
>>>  1 file changed, 6 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>> index 588e3be692d3..0fc9810c5e78 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>> @@ -771,12 +771,15 @@ static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
>>>  	int limit;
>>>  
>>>  	entry = priv->cur_rx[q] % priv->num_rx_ring[q];
>>> +	desc = &priv->gbeth_rx_ring[entry];
>>> +	if (desc->die_dt == DT_FEMPTY)
>>> +		return false;
>>> +
>>
>>    I don't understand what this buys us, the following *while* loop will
>> be skipped anyway, and the *for* loop as well, I think... And ravb_rx_rcar()
> 
> Yes, I kept it because of the for loop and the update of the *quota.
> 
> As commit specifies the code has been moved in IP specific RX function
> keeping the initial functionality.

   Please pull this perplexed code out completely instead. It's not needed
according to Biju.

>> doesn't have that anyway...

[...]

MBR, Sergey

