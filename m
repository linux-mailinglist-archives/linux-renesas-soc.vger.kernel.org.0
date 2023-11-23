Return-Path: <linux-renesas-soc+bounces-192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BA17F6503
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 18:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6C931C20992
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 17:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897833FE3A;
	Thu, 23 Nov 2023 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A859D68;
	Thu, 23 Nov 2023 09:15:52 -0800 (PST)
Received: from [192.168.1.103] (178.176.78.136) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 23 Nov
 2023 20:15:44 +0300
Subject: Re: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com>
 <f5421248-3341-a5f7-84e6-c601df470a63@omp.ru>
 <TYBPR01MB5341061AB0A805D0AF71FBB5D8B1A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <69392d22-8ade-81aa-72b1-6a4abce8a4a7@omp.ru>
 <TYBPR01MB5341A4AE46EA9261469C735DD8B0A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <29603244-d65a-5ca0-90d4-fdd9f410e180@omp.ru>
 <TYBPR01MB5341FE9976E52CD8F6509B8ED8B7A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <5028f8cb-7d4e-e026-c4a9-3fabf22a1385@omp.ru>
Date: Thu, 23 Nov 2023 20:15:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <TYBPR01MB5341FE9976E52CD8F6509B8ED8B7A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
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

Hello!

   Sorry for the late reply -- the damn dozen of the AVB patches fell on me this
Monday... :-/

On 11/17/23 3:07 AM, Yoshihiro Shimoda wrote:
[...]

>>> In the function(s), since WORK_STRUCT_PENDING_BIT is set, schedule_{delayed_}work()
>>> will not schedule the work anymore. So, I'll drop a condition netif_running()
>>> from the ravb_tx_timeout_work().
>>
>>   Hm, this caused me to rummage in the work queue code for more time than
>> I could afford... still not sure what you meant... :-/
> 
> I'm sorry for bothering you about this topic...
> In the v3 patch, the rescheduling code was:
> ---
> +	if (!rtnl_trylock()) {
> +		if (netif_running(ndev))
> +			schedule_delayed_work(&priv->work, msecs_to_jiffies(10));
> +		return;
> +	}
> ---
> 
> However, we can implement this like the following:
> ---
> +	if (!rtnl_trylock()) {
> +		schedule_delayed_work(&priv->work, msecs_to_jiffies(10));
> +		return;
> +	}
> ---
> 
> The schedule_{delayed}_work() will not be queued after cancel_{delayed_}work_sync()
> was called, because WORK_STRUCT_PENDING_BIT was set in cancel_{delayed_}work_sync()
> like the following:
> ---
> cancel_work_sync()
> -> __cancel_work_timer()
>   -> try_to_grab_pending()
>    -> if (!test_and_set_bit(WORK_STRUCT_PENDING_BIT, ...)
> 
> schedule_work()
>  -> queue_work()
>   -> queue_work_on()
>    -> if (test_and_set_bit(WORK_STRUCT_PENDING_BIT, ...)

   You seem to have lost ! here. :-)

>     -> __queue_work()

   Ah! Now it makes perfect sense. Sorry, this somehow evaded me... :-/

> ---
> 
> Best regards,
> Yoshihiro Shimoda

[...]

MBR, Sergey

