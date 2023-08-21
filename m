Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C19DC7829F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 15:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbjHUNGr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 09:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbjHUNGq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 09:06:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BDCCD;
        Mon, 21 Aug 2023 06:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692623204; x=1724159204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QaWjSelXk5bpzfcwif/epeeUyKK86U6mEXh/YCF60Oo=;
  b=g6xne8FGU8vT8eU7mhKnVdvS7te8wiEiN63ifbaRxFHSeROMTBZAWtnr
   9+xKaZdple3n/UodWkcCW2tiyC8uRyUBhLq9KAAbkd40pLQsoH5HBAOAL
   TdMTfN7gJwroJddzocyA5eQhobmvQBI4owO9sIjo7M1Mxlqj66CcJ2AIF
   j2kFX67mwMk6RThnYfNuIAQV1tsi779JjLkBdU792b8W9Zu0K1+6W1MWx
   I5nU5PPN2hJ2Y6uCwGcUdP2vDhZkJWk+j2mkJMscrBdG+HNTj/r/4wI7v
   i7t2dibJ+lUjeWaeSIeHfSZaqXG+Owvm/SB61PRuZQo+HAdke2mVUl3Gy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="459950971"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="459950971"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 06:06:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685650504"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="685650504"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2023 06:06:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qY4cA-00F7Ug-1E;
        Mon, 21 Aug 2023 16:06:38 +0300
Date:   Mon, 21 Aug 2023 16:06:38 +0300
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
Subject: Re: [PATCH 3/4] usb: typec: tcpci_rt1711h: Add rxdz_sel variable to
 struct rt1711h_chip_info
Message-ID: <ZONhXitn/aX6smxv@smile.fi.intel.com>
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820184402.102486-4-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 20, 2023 at 07:44:01PM +0100, Biju Das wrote:
> The RT1715 needs 0.35V/0.75V rx threshold for rd/rp whereas it is 0.4V/0.7V
> for RT1711H. Add rxdz_sel variable to struct rt1711h_chip_info for
> handling this difference.

...

>  struct rt1711h_chip_info {
>  	u16 did;
> +	u32 rxdz_sel;
>  };

Again, run pahole. And see the difference, if any, depending on the place of a
new member. Note, some 64-bit architectures may require 8-byte alignment even
for 4-byte members.

...

>  static const struct rt1711h_chip_info rt1711h = {
>  	.did = RT1711H_DID,
> +	.rxdz_sel = 0,
>  };

Unneeded change.

-- 
With Best Regards,
Andy Shevchenko


