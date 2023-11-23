Return-Path: <linux-renesas-soc+bounces-188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 185707F6469
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 17:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48B7E1C20A99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 16:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF933D990;
	Thu, 23 Nov 2023 16:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 077AE101;
	Thu, 23 Nov 2023 08:54:53 -0800 (PST)
Received: from [192.168.1.103] (178.176.78.136) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 23 Nov
 2023 19:54:44 +0300
Subject: Re: [PATCH 06/13] net: ravb: Let IP specific receive function to
 interrogate descriptors
To: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, Masaru Nagai
	<masaru.nagai.vx@renesas.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120084606.4083194-7-claudiu.beznea.uj@bp.renesas.com>
 <b626455a-f7a4-2684-725c-c679dd75a515@omp.ru>
 <TYVPR01MB112791203FFACF4484A9EAC4E86B9A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <874ab7c1-19b4-bee1-9473-cfa6e37a8efc@omp.ru>
Date: Thu, 23 Nov 2023 19:54:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <TYVPR01MB112791203FFACF4484A9EAC4E86B9A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 11/21/2023 23:48:29
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181514 [Nov 21 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 3 0.3.3 e5c6a18a9a9bff0226d530c5b790210c0bd117c8
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.136 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.78.136
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/21/2023 23:54:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/21/2023 8:06:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 11/23/23 7:48 PM, Biju Das wrote:
[...]

>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> ravb_poll() initial code used to interrogate the first descriptor of
>>> the RX queue in case gptp is false to know if ravb_rx() should be
>> called.
>>> This is done for non GPTP IPs. For GPTP IPs the driver PTP specific
>>
>>    It's called gPTP, AFAIK.
>>
>>> information was used to know if receive function should be called. As
>>> every IP has it's own receive function that interrogates the RX
>>> descriptor
>>
>>    Its own.
>>
>>> list in the same way the ravb_poll() was doing there is no need to
>>> double check this in ravb_poll(). Removing the code form ravb_poll()
>>> and
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
>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c
>>> b/drivers/net/ethernet/renesas/ravb_main.c
>>> index 588e3be692d3..0fc9810c5e78 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>> @@ -771,12 +771,15 @@ static bool ravb_rx_gbeth(struct net_device *ndev,
>> int *quota, int q)
>>>     int limit;
>>>
>>>     entry = priv->cur_rx[q] % priv->num_rx_ring[q];
>>> +   desc = &priv->gbeth_rx_ring[entry];
>>> +   if (desc->die_dt == DT_FEMPTY)
>>> +           return false;
>>> +
>>
>>    I don't understand what this buys us, the following *while* loop will
>> be skipped anyway, and the *for* loop as well, I think... And
>> ravb_rx_rcar() doesn't have that anyway...
>>
>>> @@ -1279,25 +1282,16 @@ static int ravb_poll(struct napi_struct *napi,
>> int budget)
>>>     struct net_device *ndev = napi->dev;
>>>     struct ravb_private *priv = netdev_priv(ndev);
>>>     const struct ravb_hw_info *info = priv->info;
>>> -   bool gptp = info->gptp || info->ccc_gac;
>>> -   struct ravb_rx_desc *desc;
>>>     unsigned long flags;
>>>     int q = napi - priv->napi;
>>>     int mask = BIT(q);
>>>     int quota = budget;
>>> -   unsigned int entry;
>>>
>>> -   if (!gptp) {
>>> -           entry = priv->cur_rx[q] % priv->num_rx_ring[q];
>>> -           desc = &priv->gbeth_rx_ring[entry];
>>> -   }
>>>     /* Processing RX Descriptor Ring */
>>>     /* Clear RX interrupt */
>>>     ravb_write(ndev, ~(mask | RIS0_RESERVED), RIS0);
>>> -   if (gptp || desc->die_dt != DT_FEMPTY) {
>>> -           if (ravb_rx(ndev, &quota, q))
>>> -                   goto out;
>>> -   }
>>
>>   I don't really understand this code (despite I've AKCed it)...
>> Biju, could you explain this (well, you tried already but I don't buy it
>> anymore)?
> 
> It was initial version of the driver. Now Claudiu optimized.

   I fail to understand why you had (GBEth-specific) pre-conditions here to call
ravb_rx()... and involving gPTP only further confused things...

> Cheers,
> Biju

[...]

MBR, Sergey

