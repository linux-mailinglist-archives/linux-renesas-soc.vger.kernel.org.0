Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD437782622
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 11:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234214AbjHUJRn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 05:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbjHUJRm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 05:17:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED21C9;
        Mon, 21 Aug 2023 02:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692609460; x=1724145460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hPYdVIS7EEAfOKyVDfo5dggoqfeqmlZB/rwYlbrSeZM=;
  b=a9XewLUtaSC971tRgbPWfFX46uZ8tyrevqcX/GG7hnEaVtDrDSv6DqQi
   qXFRTxf8GB8zTz6N0ohbw9MaO9x39AnDOzvaxxyHmgZKsXIvmMwt95shw
   +JafuPnU04urskC5OIMoawKzvPg3x2JiFx9Jn+xwsWjX5BFAty8pSHr9K
   +41Df2T77s7LssHZd1iUJIwLpRmkNf6+xWDD5bowqO4SgQLMCi0OLIbeP
   LNOEuYEcYYPBN/CW+E/Ub7+oBgLpDBTR6Iu7VlHoy2FzXkoczUJvMJpNP
   ZLNoNnCnVDdKZwipYh1yr54bcYOw58/FMyGcImAdl47hH64ALkjM1oo2x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="353859564"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="353859564"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 02:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="735788607"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="735788607"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 21 Aug 2023 02:17:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qY12U-007JfC-2Y;
        Mon, 21 Aug 2023 12:17:34 +0300
Date:   Mon, 21 Aug 2023 12:17:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 0/2] Convert enum->pointer for data in the tmp51x match
 tables
Message-ID: <ZOMrrrxto6TtJQzt@smile.fi.intel.com>
References: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
 <ce30e9ad-67e8-4dfb-93f9-e9a6a89d6bbe@roeck-us.net>
 <OS0PR01MB592225A290451B07E5BA42698619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ea0eccc0-a29f-41e4-9049-a1a13f8b16f1@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea0eccc0-a29f-41e4-9049-a1a13f8b16f1@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 20, 2023 at 08:55:18AM -0700, Guenter Roeck wrote:
> On Sun, Aug 20, 2023 at 02:55:08PM +0000, Biju Das wrote:
> > > On Sun, Aug 20, 2023 at 01:49:08PM +0100, Biju Das wrote:

...

> > While doing this Jonathan found an issue where it won't work if OF table is
> > using pointer and ID is using enum in the match data. Moreover,the proposed
> > API returns NULL for non-match.
> 
> I think that is may be problem because many drivers don't have a value
> in the driver_data field. Maybe that doesn't matter because such drivers
> would normally not call device_get_match_data() or i2c_match_id(),
> but it would create some ambiguity because those functions would no
> longer work for all cases.

Are you talking here about the cases where 0 / NULL makes things optional?
Like when driver data is defined, we use its value, otherwise apply some
defaults? If so, where do you see a problem?

> > So Andy proposed to convert the valid enums to non-zero or use a pointer.
> > 
> There are _lots_ of drivers where the chip ID is in driver_data and starts
> with 0, or with the field not used. It is not my call to make, but I really
> think that demanding that this field is always != 0 is just wrong.

Those drivers are hackishly abusing OF ID tables. Those, that have _no_ OF ID
tables are okay.

Moreover this approach allows to have the driver data to be const, and keep it
that way which now is problematic and in some cases may even be broken (due to
wrong assumptions made by drivers). I.o.w. this makes code more robust against
the possible mangling of driver data contents at runtime.

-- 
With Best Regards,
Andy Shevchenko


