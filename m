Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7207CCB6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Oct 2023 20:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbjJQS6q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Oct 2023 14:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbjJQS6p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 14:58:45 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5E690;
        Tue, 17 Oct 2023 11:58:42 -0700 (PDT)
Received: from [192.168.1.103] (178.176.75.209) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Tue, 17 Oct
 2023 21:58:37 +0300
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH net] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>
CC:     <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <20231017085341.813335-1-yoshihiro.shimoda.uh@renesas.com>
Organization: Open Mobile Platform
Message-ID: <7b153bc6-2094-eee5-f506-0c1615032edb@omp.ru>
Date:   Tue, 17 Oct 2023 21:58:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20231017085341.813335-1-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.75.209]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 10/17/2023 18:43:21
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 180688 [Oct 17 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 540 540 2509a3fe0f7fdc802e7154a32be7c2dd394ab987
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.75.209 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.209
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/17/2023 18:48:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/17/2023 2:36:00 PM
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

Hello!

On 10/17/23 11:53 AM, Yoshihiro Shimoda wrote:

> Fix races between ravb_tx_timeout_work() and functions of net_device_ops
> and ethtool_ops by using rtnl_trylock() and rtnl_unlock(). Note that
> since ravb_close() is under the rtnl lock and calls cancel_work_sync(),
> ravb_tx_timeout_work() calls rtnl_trylock() to avoid a deadlock.

   I don't quite follow... how calling cancel_work_sync() is a problem?
I thought the problem was that unregister_netdev() can be called with
the TX timeout work still pending? And, more generally, shouldn't we
protect against the TX timeout work being executed on a different CPU
than the {net_device|ethtool}_ops methods are being executed (is that
possible?)?
   I also had a suspicion that we still miss the spinlock calls in
ravb_tx_timeout_work() but nothing in particular jumped at me...
mind looking into that? :-)

> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 0ef0b88b7145..b53533ab4599 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[...]
> @@ -1907,6 +1910,7 @@ static void ravb_tx_timeout_work(struct work_struct *work)
>  		 */
>  		netdev_err(ndev, "%s: ravb_dmac_init() failed, error %d\n",
>  			   __func__, error);
> +		rtnl_unlock();
>  		return;

   Perhaps *goto* instead here?

>  	}
>  	ravb_emac_init(ndev);
> @@ -1917,6 +1921,7 @@ static void ravb_tx_timeout_work(struct work_struct *work)
>  		ravb_ptp_init(ndev, priv->pdev);
>  
>  	netif_tx_start_all_queues(ndev);

   ... and add label here?

> +	rtnl_unlock();
>  }

MBR, Sergey
