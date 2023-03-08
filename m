Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C716B0E87
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 17:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjCHQWr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 11:22:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjCHQWq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 11:22:46 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EFFBE5CD
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Mar 2023 08:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678292565; x=1709828565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ko9kQctfLRT98NL58ITdfcYDexpET1KrsYUUHXjWGCU=;
  b=iMWCrEE7LkMzejVJuT1lMG/YAurSyxdCdvS8pTAlNdBXqpBvibWaluxP
   ekZHv8Dy/iVVymI6jJ7n/j6vENENx7uUVjBYOJ2FIkZo7c16sZW6H6OOA
   4DfNrfIlg/6SYHsygi7BwfNOBVG+d8glGAXPhd5ax0REF12OkhI8uUA6m
   EuZ+7yHm/WsahD7beo7Xxm/CggBaHqcorvjr/+60vBulKbBQMrhrYlHwe
   zWtW6IH7+jgHJkq/rigaXOAGVxUqVPbP4sFvsVI8pm8yWwdWHpv82CESB
   7lWLWP6rg4UCm1fIfGa1q9en2XrUAZ8R2hVp7YKtB9cZqmtr9STOHtRe/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="320029051"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="320029051"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 08:22:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006380199"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="1006380199"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 08:22:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZwYp-00HVcu-2a;
        Wed, 08 Mar 2023 18:22:39 +0200
Date:   Wed, 8 Mar 2023 18:22:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Saravana Kannan <saravanak@google.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: renesas: rmobile-sysc: Use of_fwnode_handle() helper
Message-ID: <ZAi2T4mYefbLTI9U@smile.fi.intel.com>
References: <d49b9fb20d68709b12692558aca91997e6b06fb4.1678272276.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d49b9fb20d68709b12692558aca91997e6b06fb4.1678272276.git.geert+renesas@glider.be>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 08, 2023 at 11:48:17AM +0100, Geert Uytterhoeven wrote:
> Use the existing of_fwnode_handle() helper instead of open-coding the
> same operation.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel-for-v6.4.
> 
>  drivers/soc/renesas/rmobile-sysc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/renesas/rmobile-sysc.c b/drivers/soc/renesas/rmobile-sysc.c
> index 204e6135180b919c..728ebac98e14a5cc 100644
> --- a/drivers/soc/renesas/rmobile-sysc.c
> +++ b/drivers/soc/renesas/rmobile-sysc.c
> @@ -343,7 +343,7 @@ static int __init rmobile_init_pm_domains(void)
>  			break;
>  		}
>  
> -		fwnode_dev_initialized(&np->fwnode, true);
> +		fwnode_dev_initialized(of_fwnode_handle(np), true);
>  	}
>  
>  	put_special_pds();

-- 
With Best Regards,
Andy Shevchenko


