Return-Path: <linux-renesas-soc+bounces-250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B607F828B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 20:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D39F2857CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 19:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5AC35F04;
	Fri, 24 Nov 2023 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF932699;
	Fri, 24 Nov 2023 11:04:32 -0800 (PST)
Received: from [192.168.1.103] (31.173.82.189) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 24 Nov
 2023 22:04:25 +0300
Subject: Re: [PATCH 01/13] net: ravb: Check return value of
 reset_control_deassert()
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
 <20231120084606.4083194-2-claudiu.beznea.uj@bp.renesas.com>
 <2ac71d8d-84d8-2092-70b4-9ed21e78541f@omp.ru>
 <12e63ae7-bc25-4790-883a-ee0eaa28317d@tuxon.dev>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <06c3815d-3ec7-7e2e-8ef7-6fd9caa4cf04@omp.ru>
Date: Fri, 24 Nov 2023 22:04:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <12e63ae7-bc25-4790-883a-ee0eaa28317d@tuxon.dev>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 11/24/2023 18:48:20
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181589 [Nov 24 2023]
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
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
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
X-KSE-Antiphishing-Bases: 11/24/2023 18:53:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/24/2023 4:10:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 11/21/23 8:59 AM, claudiu beznea wrote:

[...]
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> reset_control_deassert() could return an error. Some devices cannot work
>>> if reset signal de-assert operation fails. To avoid this check the return
>>> code of reset_control_deassert() in ravb_probe() and take proper action.
>>>
>>> Fixes: 0d13a1a464a0 ("ravb: Add reset support")
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>> ---
>>>  drivers/net/ethernet/renesas/ravb_main.c | 7 ++++++-
>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>> index c70cff80cc99..342978bdbd7e 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>> @@ -2645,7 +2645,12 @@ static int ravb_probe(struct platform_device *pdev)
>>>  	ndev->features = info->net_features;
>>>  	ndev->hw_features = info->net_hw_features;
>>>  
>>> -	reset_control_deassert(rstc);
>>> +	error = reset_control_deassert(rstc);
>>> +	if (error) {
>>> +		free_netdev(ndev);
>>> +		return error;
>>
>>   No, please use *goto* here. And please fix up the order of statements under
>> the out_release label before doing that.
> 
> This will lead to a bit more complicated patch, AFAICT. I tried to keep it

   It's OK! :-)

> simple for a fix. Same thing for patch 2.

   Patch 2 is not as simple as it could have been...

[...]

MBR, Sergey

