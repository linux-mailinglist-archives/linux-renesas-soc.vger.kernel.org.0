Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 405157829E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 15:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235202AbjHUNEY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 09:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235197AbjHUNEX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 09:04:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDCCBE8;
        Mon, 21 Aug 2023 06:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692623059; x=1724159059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X9lSlZLETGl4RJIsNV24do8v0UhvNbNSiiRfs0d+ZZk=;
  b=IIB3JyRkchGeCmO1FhBVye4adhQ8kpCh27s2IOE3MlmJbL7ptWMmCEb+
   aPTtgf0bgUoYRfV2yV1CYeAeGfb/vLST20LtE4ChC8etmLJz9GAF0bYrs
   W/CjVmlTm+0C2O1fXPD64SF2I/DBzS6eI8ryswG7eSFPXoN6XjGr3Vr+e
   8Inv9NEZ2yABle8KymAyaFMtARBMqWC8fAFgA8qKuFRbvvh7x0T9rulPj
   UbZNxFk2XEdfNYPZAak5KFFxQubPQxL+2sDxSGnGuBEvF3PKOxeMV0Jp2
   ODQoceVB3/fGwR1HoDszxjIYjDYpJQhAHKc6Hxbf4/FJnyXue3fX4aHjC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="459950360"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="459950360"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 06:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685650312"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="685650312"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2023 06:04:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qY4Zq-00F2IH-24;
        Mon, 21 Aug 2023 16:04:14 +0300
Date:   Mon, 21 Aug 2023 16:04:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
Message-ID: <ZONgzqlS8bGP0umn@smile.fi.intel.com>
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820184402.102486-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:
> Convert enum->pointer for data in the match tables, so that
> device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
> bus type match support added to it and it returns NULL for non-match.
> 
> Therefore it is better to convert enum->pointer for data match and extend
> match support for both ID and OF tables by using i2c_get_match_data() by
> adding struct rt1711h_chip_info with did variable and replacing did->info
> in struct rt1711h_chip. Later patches will add more hw differences to
> struct rt1711h_chip_info and avoid checking did for HW differences.

...

> +struct rt1711h_chip_info {
> +	u16 did;
> +};
> +
>  struct rt1711h_chip {
>  	struct tcpci_data data;
>  	struct tcpci *tcpci;
>  	struct device *dev;
>  	struct regulator *vbus;
>  	bool src_en;
> -	u16 did;
> +	const struct rt1711h_chip_info *info;

Have you run pahole? I believe now you wasting a few more bytes
(besides the pointer requirement) due to (mis)placing a new member.

>  };

...

For all your work likes this as I noted in the reply to Guenter that
the couple of the selling points here are:
1) avoidance of the pointer abuse in OF table
   (we need that to be a valid pointer);
2) preservation of the const qualifier (despite kernel_ulong_t
   being used in the middle).

With that added I believe you can sell this much more easier.

-- 
With Best Regards,
Andy Shevchenko


