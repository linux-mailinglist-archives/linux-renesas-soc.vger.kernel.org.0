Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F54078AE1F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 12:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbjH1K5F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 06:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbjH1K4a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 06:56:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047BF2703
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 03:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693220158; x=1724756158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BYRLaBu0bU3O00zzYsNS65DjNaDaIKA5Bs+hoe4tLJ8=;
  b=cXLicLKEYcZxLMGKxeGNChtxagOWHt0b2FYIb1XIVyXDbXTExrCZU6/g
   pM2D/SVbbPuTwMC7WW4HH9ZBg4jlIVa1SwI6ZaU95ez+NCemY6kIFzvd5
   hoEaUEIBp978Cpcj96+L0heK+wvfX2gNwe0PutnoB9YuQuGP51Q3QYp+J
   VrJOIqLi11/RnhhvmUIGvFdb092Qsb/cXJtXSaF36ySnpup48TQGwM//4
   uGokOBYYUZWuCXtohXdPTgndsItTVYsTG2wDicYG+jFsFHxb1LW90eu0H
   BS+uILeityPniBhijsZeyoPk8MMe1/mRYI7XsH4dIxVdu/G9v/LsQ4mmw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372478716"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="372478716"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 03:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="731783702"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="731783702"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 28 Aug 2023 03:55:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaZuM-00F7Nk-2Y;
        Mon, 28 Aug 2023 13:55:46 +0300
Date:   Mon, 28 Aug 2023 13:55:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>, patches@opensource.cirrus.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: arizona-i2c: Simplify probe()
Message-ID: <ZOx9MoBVYDr+Fv8z@smile.fi.intel.com>
References: <20230826092721.55225-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826092721.55225-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 10:27:21AM +0100, Biju Das wrote:
> Simplify probe() by replacing device_get_match_data() and ID lookup for
> retrieving match data by i2c_get_match_data().

...

> -	match_data = device_get_match_data(&i2c->dev);
> -	if (match_data)
> -		type = (unsigned long)match_data;
> -	else if (id)
> -		type = id->driver_data;
> +	type = (unsigned long)i2c_get_match_data(i2c);

>  

You now can drop this blank line.

>  	switch (type) {

-- 
With Best Regards,
Andy Shevchenko


