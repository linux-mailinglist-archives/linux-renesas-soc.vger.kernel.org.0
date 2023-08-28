Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4079A78A8A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 11:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjH1JTa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 05:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjH1JTS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 05:19:18 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25E710C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693214355; x=1724750355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pwcKM9ImQnHotrWIjRxgD4lolnpUj4hVuJsJe6W9S7Y=;
  b=hZu0obJJaGxRj/LB5dy7pVi2NyVgDZ92+oXARzgxnVX9oQJWGwHg21li
   Ahws4/egmYoRzC5eQhqriYtvB/3CRkmWJsRRiPTLPDdABgC0WiYny/R5A
   YyDHj1yR+V+L3XW1ognfyLdSEmSvOqfLsWE3V8RhcWYQ+oVP5OA4rt7IP
   owfXj82mno1UIPJyBq+6OCnQMK7gmMRBsMGSRWRhpT7J/cTQz44dTTvsP
   xOoQdJoXykRvL8lmMW41AsrZM76iOypqjyPtmSWFRPIIUualThrAHDkas
   yqEPdbghQjHVQn3HRtuvl39SgYiTEYv9GRPM7OHm2KHtburgFqqjX2cP2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="377786952"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="377786952"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 02:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="767592161"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="767592161"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 28 Aug 2023 02:19:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaYOu-00Bvum-01;
        Mon, 28 Aug 2023 12:19:12 +0300
Date:   Mon, 28 Aug 2023 12:19:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: pv880x0: Simplify probe()
Message-ID: <ZOxmj4A5gx2Vra3L@smile.fi.intel.com>
References: <20230826114919.73897-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826114919.73897-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 12:49:19PM +0100, Biju Das wrote:
> Replace pv88080_types->pv88080_compatible_regmap in OF/ID tables and
> simplify the probe() by replacing of_match_node() and ID lookup for
> retrieving match data by i2c_get_match_data(). After this there is
> no user of enum pv88080_types. So drop it.

...

>  #ifdef CONFIG_OF
>  static const struct of_device_id pv88080_dt_ids[] = {
> -	{ .compatible = "pvs,pv88080",    .data = (void *)TYPE_PV88080_AA },
> -	{ .compatible = "pvs,pv88080-aa", .data = (void *)TYPE_PV88080_AA },
> -	{ .compatible = "pvs,pv88080-ba", .data = (void *)TYPE_PV88080_BA },
> +	{ .compatible = "pvs,pv88080",    .data = &pv88080_aa_regs },
> +	{ .compatible = "pvs,pv88080-aa", .data = &pv88080_aa_regs  },
> +	{ .compatible = "pvs,pv88080-ba", .data = &pv88080_ba_regs },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, pv88080_dt_ids);
>  #endif

With this patch it makes sense to get rid of ugly ifdeffery, correct header
inclusions (if needed) and Kconfig.

See similar patches
$ git log --no-merges --grep "Make use of device properties"

> +static const struct i2c_device_id pv88080_i2c_id[] = {
> +	{ "pv88080",    (kernel_ulong_t)&pv88080_aa_regs },
> +	{ "pv88080-aa", (kernel_ulong_t)&pv88080_aa_regs },
> +	{ "pv88080-ba", (kernel_ulong_t)&pv88080_ba_regs },

> +	{},

Please, remove trailing comma in the terminator entry. Same you can do for
other ID tables and in other patches you prepared.

> +};

...

> -static const struct i2c_device_id pv88080_i2c_id[] = {
> -	{ "pv88080",    TYPE_PV88080_AA },
> -	{ "pv88080-aa", TYPE_PV88080_AA },
> -	{ "pv88080-ba", TYPE_PV88080_BA },
> -	{},
> -};
> -MODULE_DEVICE_TABLE(i2c, pv88080_i2c_id);
> -

Why do you move this one up? Shouldn't it be other way around, i.e. moving the
other closer to its user, namely here?

>  static struct i2c_driver pv88080_regulator_driver = {

-- 
With Best Regards,
Andy Shevchenko


