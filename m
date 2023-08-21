Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E5D7829F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 15:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbjHUNIi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 09:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbjHUNIh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 09:08:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC40B1;
        Mon, 21 Aug 2023 06:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692623316; x=1724159316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6v5ctJIhB+VhdFzIute5HhhKnJI6Fhi2YZLI4e1wi9Y=;
  b=mkcmkuZaded5LsXYYSt0YQTfwal7jNMRweNqrqF3znSwXH714U3foDtM
   s4GnREkM/3XT8pTsIruhFHTIS4wGhLvH/Gg22hHRZ4u9nhZPRs5BfztM6
   e2tUcumNnbkOeTOHdOw7R6ya6Oc3r/36twEra8m8YEyLL7718K/FbETf1
   W+J+i7TX5/m5S9owxAR2t1+PC5PKF29Ma00djjrCCZ7wWmg3O7eWPAHK2
   CrsR0egr1e3zKda3NVXxCTg9ayDuDdzGF9Uhqt1gOF4sW7+fpJuEKCsSt
   BQsjADf37OdQmre/7ausHyU+KkDUjUqCaabm5IML1+Nw4wefmO40KAzmD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376334060"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="376334060"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 06:08:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="735826773"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="735826773"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 21 Aug 2023 06:08:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qY4dj-00FB1e-1n;
        Mon, 21 Aug 2023 16:08:15 +0300
Date:   Mon, 21 Aug 2023 16:08:15 +0300
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
Subject: Re: [PATCH 4/4] usb: typec: tcpci_rt1711h: Add
 enable_pd30_extended_message feature bit to struct rt1711h_chip_info
Message-ID: <ZONhv2L1DYQ8EEFZ@smile.fi.intel.com>
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820184402.102486-5-biju.das.jz@bp.renesas.com>
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

On Sun, Aug 20, 2023 at 07:44:02PM +0100, Biju Das wrote:
> The RT1715 has PD30 extended message compared to RT1711H. Add a feature bit
> enable_pd30_extended_message to struct rt1711h_chip_info to enable this
> feature only for RT1715.

...

>  struct rt1711h_chip_info {
>  	u16 did;
>  	u32 rxdz_sel;
> +	unsigned enable_pd30_extended_message:1;

Besides pahole results, the unsigned is deprecated to use, spell it as
unsigned int or u32 or... (find the best match).

>  };

...

> +	.enable_pd30_extended_message = 1,

Maybe even bool?

-- 
With Best Regards,
Andy Shevchenko


