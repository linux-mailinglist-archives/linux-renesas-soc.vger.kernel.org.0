Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0A27EE673
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Nov 2023 19:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjKPSLq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Nov 2023 13:11:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjKPSLp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2023 13:11:45 -0500
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF009195;
        Thu, 16 Nov 2023 10:11:40 -0800 (PST)
Received: from [192.168.1.103] (31.173.84.76) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 16 Nov
 2023 21:11:31 +0300
Subject: Re: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com>
 <f5421248-3341-a5f7-84e6-c601df470a63@omp.ru>
 <TYBPR01MB5341061AB0A805D0AF71FBB5D8B1A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <69392d22-8ade-81aa-72b1-6a4abce8a4a7@omp.ru>
 <TYBPR01MB5341A4AE46EA9261469C735DD8B0A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <29603244-d65a-5ca0-90d4-fdd9f410e180@omp.ru>
Date:   Thu, 16 Nov 2023 21:11:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <TYBPR01MB5341A4AE46EA9261469C735DD8B0A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.84.76]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 11/16/2023 17:56:40
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181428 [Nov 16 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.84.76 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.84.76
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/16/2023 18:01:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/16/2023 3:28:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/16/23 5:15 AM, Yoshihiro Shimoda wrote:
[...]

>>>>> Fix races between ravb_tx_timeout_work() and functions of net_device_ops
>>>>> and ethtool_ops by using rtnl_trylock() and rtnl_unlock(). Note that
>>>>> since ravb_close() is under the rtnl lock and calls cancel_work_sync(),
>>>>> ravb_tx_timeout_work() should calls rtnl_trylock(). Otherwise, a deadlock
>>>>> may happen in ravb_tx_timeout_work() like below:
>>>>>
>>>>> CPU0			CPU1
>>>>> 			ravb_tx_timeout()
>>>>> 			schedule_work()
>>>>> ...
>>>>> __dev_close_many()
>>>>> // Under rtnl lock
>>>>> ravb_close()
>>>>> cancel_work_sync()
>>>>> // Waiting
>>>>> 			ravb_tx_timeout_work()
>>>>> 			rtnl_lock()
>>>>> 			// This is possible to cause a deadlock
>>>>>
>>>>> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
>>>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>>>>
>>>> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> [...]
>>
>>>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>>>> index 0ef0b88b7145..300c1885e1e1 100644
>>>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>>>> @@ -1874,6 +1874,9 @@ static void ravb_tx_timeout_work(struct work_struct *work)
>>>>>  	struct net_device *ndev = priv->ndev;
>>>>>  	int error;
>>>>>
>>>>> +	if (!rtnl_trylock())
>>>>> +		return;
>>>>
>>>>    I wonder if we should reschedule the work here...
>>>
>>> I think so. But, it should reschedule the work if the netif is still running because
>>> Use-after-free issue happens again when cancel_work_sync() is calling. Also, I also think
>>> we should use schedule_delayed_work() instead. So, I'll submit such a patch as v3.
>>
>>    I'm not really sure about that one. Note that cancel_work_sync() should
>> work with the works requeueing themselves, the comments say...
> 
> I'm sorry, I completely mistook to explain this... I should have said:

   Don't worry, my uncertainty was about using the "delayed" flavor of
the works. :-)

> It should not reschedule the work if the netif is not running because
>           ~~~                                     ~~~
> use-after-free issue happens again when cancel_work_sync() is called from ravb_remove().
>                                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Well, it's called from ravb_close() -- which is called by the networking
core when unregister_netdev() is called bt ravb_remove()...

> Also, I completely misunderstood the behavior of cancel_{schedule_}work_sync().

   cancel_{delayed_}work_sync(), you meant...

> In the function(s), since WORK_STRUCT_PENDING_BIT is set, schedule_{delayed_}work()
> will not schedule the work anymore. So, I'll drop a condition netif_running()
> from the ravb_tx_timeout_work().

  Hm, this caused me to rummage in the work queue code for more time than
I could afford... still not sure what you meant... :-/

> Best regards,
> Yoshihiro Shimoda
[...]

MBR, Sergey
