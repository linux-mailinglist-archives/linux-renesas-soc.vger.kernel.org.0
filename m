Return-Path: <linux-renesas-soc+bounces-12356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFFDA1987C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 19:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFFC0188AFE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 18:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2192921519B;
	Wed, 22 Jan 2025 18:33:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF31215057;
	Wed, 22 Jan 2025 18:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737570821; cv=none; b=tzIGwJteST6K4mt7lzS/HtaI+RdHO+2mcZvbo4/qD5phm0Ud8dP4cP5YqeW0k8bWI32USZFaqdz0+uoktKt+WVWYUooiWPPaK05ViikmwdiTF6C/k9ZdNQbGWcf+q846k63AmQh2qlPcP/paJmpGoY9qIc8fw0SPNwtDg0wBQMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737570821; c=relaxed/simple;
	bh=7xIBfRYOkjL4QTxozYv9TNw+XCxxGMDYX0hPUlOezRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GfKMc0j4HPeCktT3rGIm099DgtxyNSNe28DzzetQ8J9d+5PgnJNbN4DtxOON4rhUoBqWfTBzB7c6WwtagxYGKvqG3yts8POpAlKNuuotJCGvzplO2TvfqRzeIdXbrwMvnsPo1VEZL+mpV54yGHen7hLYOIUVTK183VSqr7FSmL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.159.248) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 22 Jan
 2025 21:33:16 +0300
Message-ID: <c3c57c62-f5f7-4b80-aa8f-d6edefbb5493@omp.ru>
Date: Wed, 22 Jan 2025 21:33:15 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: ravb: Fix missing rtnl lock in suspend path
To: Kory Maincent <kory.maincent@bootlin.com>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
	<niklas.soderlund@ragnatech.se>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Mikhail Ulyanov
	<mikhail.ulyanov@cogentembedded.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, <netdev@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com>
 <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 01/22/2025 17:29:55
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 190517 [Jan 22 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.7
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 50 0.3.50
 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.159.248 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1;lore.kernel.org:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.159.248
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 01/22/2025 18:04:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 1/22/2025 3:28:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Hello!

  My Cogent Embedded tenure is long over, so I dropped my old email... :-)

On 1/22/25 7:19 PM, Kory Maincent wrote:

> Fix the suspend path by ensuring the rtnl lock is held where required.

   Maybe suspend/resume path (the same w/the subject)?

> Calls to ravb_open, ravb_close and wol operations must be performed under
> the rtnl lock to prevent conflicts with ongoing ndo operations.

[...]

> Reported-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Closes: https://lore.kernel.org/netdev/4c6419d8-c06b-495c-b987-d66c2e1ff848@tuxon.dev/
> Fixes: 0184165b2f42 ("ravb: add sleep PM suspend/resume support")
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

    FWIW:

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index bc395294a32d..2c6d8e4966c3 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[...]
> @@ -3245,19 +3250,25 @@ static int ravb_resume(struct device *dev)
>  	if (!netif_running(ndev))
>  		return 0;
>  
> +	rtnl_lock();
>  	/* If WoL is enabled restore the interface. */
>  	if (priv->wol_enabled) {
>  		ret = ravb_wol_restore(ndev);
> -		if (ret)
> +		if (ret)  {
> +			rtnl_unlock();
>  			return ret;
> +		}
>  	} else {
>  		ret = pm_runtime_force_resume(dev);
> -		if (ret)
> +		if (ret) {
> +			rtnl_unlock();
>  			return ret;

   Hm, are you sure we need to have rtnl_lock around pm_runtime_force_resume() too?

[...]

MBR, Sergey


