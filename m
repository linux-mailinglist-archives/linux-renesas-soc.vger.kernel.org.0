Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B0D782A55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 15:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbjHUNTi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 09:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbjHUNTi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 09:19:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124BCEC;
        Mon, 21 Aug 2023 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692623970; x=1724159970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1wYeJYw71qbCvfIz8mkJJd6mGYKVHhE9MzqLAXOdvcY=;
  b=EjOb/k10nkED41XK1ku5jMXnCcza08I3FSeQGzeO+Mkd7ZFMW5nzb0bO
   uiOM8hD5WWT6A44d/ZithDt0o8mgQ5kG23AWkxrv0/8hN2/ums5ntyzy+
   gjrwipU4uK/CnYuB5UMdcla7+FTE6wvjG4WbNuy5xeO2g0WJIBwq6TwDJ
   g/GN18O0nQoveJYEUNI2ywIoKWPRN9XWSwsC8Yo9SKHr3YS0NF0M0msp2
   DOgMIIRU2UFn0w6NBt9uD/1t8EfnDtvlQejNK2ZtzIeOQH/5mOgDL0obf
   gvX0IPwBV93EsH2pQeazQs4tM9hpGq3rRv6iATzOf/TKZKMV7gfLkZ5yJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376336619"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="376336619"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 06:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="825920231"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="825920231"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2023 06:19:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qY4oW-00FYqX-1h;
        Mon, 21 Aug 2023 16:19:24 +0300
Date:   Mon, 21 Aug 2023 16:19:24 +0300
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
Message-ID: <ZONkXO0HS5C9awfR@smile.fi.intel.com>
References: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
 <ce30e9ad-67e8-4dfb-93f9-e9a6a89d6bbe@roeck-us.net>
 <OS0PR01MB592225A290451B07E5BA42698619A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ea0eccc0-a29f-41e4-9049-a1a13f8b16f1@roeck-us.net>
 <ZOMrrrxto6TtJQzt@smile.fi.intel.com>
 <5392e46f-8174-4c14-96f6-04a61a2ccacc@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5392e46f-8174-4c14-96f6-04a61a2ccacc@roeck-us.net>
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

On Mon, Aug 21, 2023 at 05:59:57AM -0700, Guenter Roeck wrote:
> On Mon, Aug 21, 2023 at 12:17:34PM +0300, Andy Shevchenko wrote:
> > On Sun, Aug 20, 2023 at 08:55:18AM -0700, Guenter Roeck wrote:

...

> > Those drivers are hackishly abusing OF ID tables. Those, that have _no_ OF ID
> > tables are okay.
> 
> This is what you are saying. That doesn't make it true. With the same logic
> I could claim that drivers providing a pointer in i2c_device_id would
> hackishly abuse i2c_device_id tables.

...because kernel_ulong_t was poorly chosen type for that to begin with?

Abusing pointer is much worse than using long as a pointer holder. Moreover
the latter is valid case (okay, not as kernel_ulong_t, but unsigned long)
in many places in the kernel, starting from the memory manager, so your
argument doesn't look like a good one to me.

-- 
With Best Regards,
Andy Shevchenko


