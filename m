Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16FEC7ECA93
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Nov 2023 19:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjKOSha (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Nov 2023 13:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjKOSh3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2023 13:37:29 -0500
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03FDAF;
        Wed, 15 Nov 2023 10:37:25 -0800 (PST)
Received: from [192.168.1.103] (31.173.82.108) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 15 Nov
 2023 21:37:17 +0300
Subject: Re: [PATCH net v3] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>
CC:     <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@kernel.org>
References: <20231115022644.2316961-1-yoshihiro.shimoda.uh@renesas.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <903d8187-3979-22b4-0849-43e84560ea4b@omp.ru>
Date:   Wed, 15 Nov 2023 21:37:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20231115022644.2316961-1-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.82.108]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 11/15/2023 18:23:47
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181389 [Nov 15 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.82.108 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.82.108
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/15/2023 18:27:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/15/2023 4:29:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/15/23 5:26 AM, Yoshihiro Shimoda wrote:

> Fix races between ravb_tx_timeout_work() and functions of net_device_ops
> and ethtool_ops by using rtnl_trylock() and rtnl_unlock(). Note that
> since ravb_close() is under the rtnl lock and calls cancel_work_sync(),
> ravb_tx_timeout_work() should calls rtnl_trylock(). Otherwise, a deadlock
> may happen in ravb_tx_timeout_work() like below:
> 
> CPU0			CPU1
> 			ravb_tx_timeout()
> 			schedule_work()
> ...
> __dev_close_many()
> // Under rtnl lock
> ravb_close()
> cancel_work_sync()
> // Waiting
> 			ravb_tx_timeout_work()
> 			rtnl_lock()
> 			// This is possible to cause a deadlock
> 
> And, if rtnl_trylock() fails and the netif is still running,
> rescheduling the work with 1 msec delayed. So, using
> schedule_delayed_work() instead of schedule_work().
> 
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

   Hm, I haven't reviewed this version... :-)

> Reviewed-by: Simon Horman <horms@kernel.org>
[...]
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index e0f8276cffed..e9bb8ee3ba2d 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -1081,7 +1081,7 @@ struct ravb_private {
>  	u32 cur_tx[NUM_TX_QUEUE];
>  	u32 dirty_tx[NUM_TX_QUEUE];
>  	struct napi_struct napi[NUM_RX_QUEUE];
> -	struct work_struct work;
> +	struct delayed_work work;

   Not sure this is justified...
   Then again, what do I know about workqueues? Not much... :-)

[...]
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index c70cff80cc99..ca7db8a5b412 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1863,17 +1863,24 @@ static void ravb_tx_timeout(struct net_device *ndev, unsigned int txqueue)
>  	/* tx_errors count up */
>  	ndev->stats.tx_errors++;
>  
> -	schedule_work(&priv->work);
> +	schedule_delayed_work(&priv->work, 0);
>  }
>  
>  static void ravb_tx_timeout_work(struct work_struct *work)
>  {
> -	struct ravb_private *priv = container_of(work, struct ravb_private,
> +	struct delayed_work *dwork = to_delayed_work(work);
> +	struct ravb_private *priv = container_of(dwork, struct ravb_private,
>  						 work);
>  	const struct ravb_hw_info *info = priv->info;
>  	struct net_device *ndev = priv->ndev;
>  	int error;
>  
> +	if (!rtnl_trylock()) {
> +		if (netif_running(ndev))
> +			schedule_delayed_work(&priv->work, msecs_to_jiffies(10));

   The delay is rather arbitrary. Why not e.g. 1 ms?

[...]

MBR, Sergey
