Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A220B3DFBD4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Aug 2021 09:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbhHDHLE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 03:11:04 -0400
Received: from mga12.intel.com ([192.55.52.136]:27174 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235219AbhHDHLD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 03:11:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="193459269"
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
   d="scan'208";a="193459269"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 00:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
   d="scan'208";a="466996613"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by orsmga008.jf.intel.com with ESMTP; 04 Aug 2021 00:10:49 -0700
Subject: Re: [RFC PATCH] mmc: only print retune error when we don't check for
 card removal
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210630041658.7574-1-wsa+renesas@sang-engineering.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <610ab795-22b2-1efe-d3a9-2724ec44c8b6@intel.com>
Date:   Wed, 4 Aug 2021 10:11:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210630041658.7574-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 30/06/21 7:16 am, Wolfram Sang wrote:
> Skip printing a retune error when we scan for a removed card because we
> then expect a failed command.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Seems OK to me, but needs re-base. Nevertheless:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> 
> In my tests, detect_change was only set when a card was removed.
> Inserting a card or resuming from RPM would print an error. Did I
> overlook somethign or is this good to go?
> 
>  drivers/mmc/core/core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index b039dcff17f8..b7e6e5640640 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -937,11 +937,13 @@ int mmc_execute_tuning(struct mmc_card *card)
>  
>  	err = host->ops->execute_tuning(host, opcode);
>  
> -	if (err)
> +	if (!err)
> +		mmc_retune_enable(host);
> +
> +	/* Only print error when we don't check for card removal */
> +	if (err && !host->detect_change)
>  		pr_err("%s: tuning execution failed: %d\n",
>  			mmc_hostname(host), err);
> -	else
> -		mmc_retune_enable(host);
>  
>  	return err;
>  }
> 

