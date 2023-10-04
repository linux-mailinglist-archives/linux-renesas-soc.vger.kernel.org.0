Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150F47B89DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Oct 2023 20:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244304AbjJDSaL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Oct 2023 14:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244263AbjJDSaI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2023 14:30:08 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F72BF;
        Wed,  4 Oct 2023 11:30:03 -0700 (PDT)
Received: from [192.168.1.103] (31.173.82.102) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Wed, 4 Oct 2023
 21:29:58 +0300
Subject: Re: [PATCH net 2/2] ravb: Fix use-after-free issue in ravb_remove and
 ravb_tx_timeout_work
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>
CC:     <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Zheng Wang <zyytlz.wz@163.com>
References: <20231004091253.4194205-1-yoshihiro.shimoda.uh@renesas.com>
 <20231004091253.4194205-3-yoshihiro.shimoda.uh@renesas.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <f4cf24ff-2576-6031-e482-ebd8fa1d9659@omp.ru>
Date:   Wed, 4 Oct 2023 21:29:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20231004091253.4194205-3-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.82.102]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 10/04/2023 17:55:38
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 180363 [Oct 04 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 535 535 da804c0ea8918f802fc60e7a20ba49783d957ba2
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_phishing_log_reg_60_70}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.82.102 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.82.102 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lore.kernel.org:7.1.1;31.173.82.102:7.4.1,7.7.3,7.1.2;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: {cloud_iprep_silent}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.82.102
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/04/2023 18:01:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/4/2023 5:06:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

   Hm, concerning the subject: don't we actually have use-after-free in ravb_tx_timeout()
only? Also, you place () after the function names in patch #1 but not in this patch, why?

On 10/4/23 12:12 PM, Yoshihiro Shimoda wrote:

> The ravb_stop() should call cancel_work_sync(). Otherwise,
> ravb_tx_timeout_work() is possible to use the freed priv after
> ravb_remove() was called like below:
> 
> CPU0			CPU1
> 			ravb_tx_timeout()
> ravb_remove()
> unregister_netdev()
> free_netdev(ndev)
> // free priv
> 			ravb_tx_timeout_work()
> 			// use priv
> 
> unregister_netdev() will call .ndo_stop() so that ravb_stop() is
> called. And, after phy_stop() was called, netif_carrier_off()

   s/was/is/?

> is also called. So that .ndo_tx_timeout() will be not called

   Will not be...

> after phy_stop().
> 
> Link: https://lore.kernel.org/netdev/872cf8d7-3bd6-b11a-82ac-a9f4c82d0a02@omp.ru/
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Reported-by: Zheng Wang <zyytlz.wz@163.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

   Otherwise:

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey
