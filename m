Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1923DFBB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Aug 2021 09:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235758AbhHDHF4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 03:05:56 -0400
Received: from mga05.intel.com ([192.55.52.43]:50832 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234328AbhHDHF4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 03:05:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="299453125"
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
   d="scan'208";a="299453125"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 00:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
   d="scan'208";a="466995486"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by orsmga008.jf.intel.com with ESMTP; 04 Aug 2021 00:05:42 -0700
Subject: Re: [RFC PATCH] mmc: core: ensure flags are always cleared when
 retune gets enabled
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210625190107.8160-1-wsa+renesas@sang-engineering.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <6564ac18-259f-5857-7986-6b7ae162f4a4@intel.com>
Date:   Wed, 4 Aug 2021 10:06:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210625190107.8160-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 25/06/21 10:01 pm, Wolfram Sang wrote:
> Move the call to clear the retune flags into mmc_retune_enable() to
> ensure they are always cleared. With current code, there is no
> functional change. But it is more future-proof this way.

To me they seem conceptually separate functions.

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> After reviewing my own code, I thought this is even a tad better. What
> do you guys think? Based on the series "[PATCH 0/3] mmc: avoid vicious
> circle when retuning", of course.
> 
>  drivers/mmc/core/core.c | 6 ++----
>  drivers/mmc/core/host.c | 1 +
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 84f39a59a28e..b039dcff17f8 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -937,13 +937,11 @@ int mmc_execute_tuning(struct mmc_card *card)
>  
>  	err = host->ops->execute_tuning(host, opcode);
>  
> -	if (err) {
> +	if (err)
>  		pr_err("%s: tuning execution failed: %d\n",
>  			mmc_hostname(host), err);
> -	} else {
> -		mmc_retune_clear(host);
> +	else
>  		mmc_retune_enable(host);
> -	}
>  
>  	return err;
>  }
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 52d37587cf45..8ca1db6413f8 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -101,6 +101,7 @@ void mmc_unregister_host_class(void)
>   */
>  void mmc_retune_enable(struct mmc_host *host)
>  {
> +	mmc_retune_clear(host);
>  	host->can_retune = 1;
>  	if (host->retune_period)
>  		mod_timer(&host->retune_timer,
> 

