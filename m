Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDCB7CE468
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Oct 2023 19:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjJRR10 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Oct 2023 13:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjJRR1Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2023 13:27:25 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E51449A;
        Wed, 18 Oct 2023 10:27:22 -0700 (PDT)
Received: from [192.168.1.103] (178.176.75.93) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Wed, 18 Oct
 2023 20:27:14 +0300
Subject: Re: [PATCH net] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20231017085341.813335-1-yoshihiro.shimoda.uh@renesas.com>
 <7b153bc6-2094-eee5-f506-0c1615032edb@omp.ru>
 <OSYPR01MB533414034BFE166BA7344025D8D5A@OSYPR01MB5334.jpnprd01.prod.outlook.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <7da31dea-091a-5858-d3bb-928c8546a059@omp.ru>
Date:   Wed, 18 Oct 2023 20:27:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <OSYPR01MB533414034BFE166BA7344025D8D5A@OSYPR01MB5334.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.75.93]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 10/18/2023 17:12:44
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 180713 [Oct 18 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 541 541 6f62a06a82e8ec968d29b8e7c7bba6aeceb34f57
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.75.93 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.93
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/18/2023 17:18:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/18/2023 2:17:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/18/23 12:39 PM, Yoshihiro Shimoda wrote:
[...]
>>> Fix races between ravb_tx_timeout_work() and functions of net_device_ops
>>> and ethtool_ops by using rtnl_trylock() and rtnl_unlock(). Note that
>>> since ravb_close() is under the rtnl lock and calls cancel_work_sync(),
>>> ravb_tx_timeout_work() calls rtnl_trylock() to avoid a deadlock.
>>
>>    I don't quite follow... how calling cancel_work_sync() is a problem?
>> I thought the problem was that unregister_netdev() can be called with
>> the TX timeout work still pending? And, more generally, shouldn't we
>> protect against the TX timeout work being executed on a different CPU
>> than the {net_device|ethtool}_ops methods are being executed (is that
>> possible?)?
> 
> __dev_close_many() in net/core/dev.c calls ASSERT_RTNL() and ops->ndo_stop().
> So, the ravb_close() is under rtnl lock. While locking the rtnl, it's
> possible to call ravb_tx_timeout_work() on other CPU. In such a case,
> it's possible to cause a deadlock between ravb_close() and ravb_tx_timeout_work()
> 
> CPU0				CPU1
> 				ravb_tx_timeout()
> 				schedule_work()
> ...
> __dev_close_many()
> // this is under rtnl lock
> ravb_close()
> cancel_work_sync()
> 				ravb_tx_timeout_work()
> 				rtnl_lock()
> 				// this is possible to cause a deadlock

   Ah, cancel_work_sync() means we have to wait for the work to
finish -- indeed a deadlock is possiblet then. 
>>    I also had a suspicion that we still miss the spinlock calls in
>> ravb_tx_timeout_work() but nothing in particular jumped at me...

   We mainly need to protect against the interrupts in this case...

>> mind looking into that? :-)
> 
> Yes, perhaps we have to check it somehow...

   Unfortunately, I don't seem to have no bandwidth to do that myself...

[...]

MBR, Sergey
