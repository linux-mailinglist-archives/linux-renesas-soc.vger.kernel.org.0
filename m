Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC7B6923A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 17:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232608AbjBJQt6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 11:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232229AbjBJQt6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 11:49:58 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB380EB72;
        Fri, 10 Feb 2023 08:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676047797; x=1707583797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/rKaF5EqFNjGc23k0swncVA/vWBkA9YjUn0r/wXg7Dk=;
  b=HwRhllL5GvwaUsnTtA1tJkmfjSBT0w/Fa/39z5qWHYdMqvDxCz2eLEKX
   K5u9SX+TznNm2wyxTK3+wPm0RtrM70agXgqsuhXwcZycis3VhQ5iBnXdI
   vTaX3B/DxAScioAR0WDe3VJYcBafrOFJBIPbRr0NRHeVyMcdulVzdkti9
   TlbMUHGOV9PnwKkx7hzpPiI1HFLlwxvhFm9o9faIT3RM8d1BOKzGlYv+J
   dlWIwxBj8O/rzOWqY/B22mvvjK6cCZ7GDYkYLzRxgMJ4nXwb1rt5bfIRG
   vuXd/IhkZ+SwmQ5eHUFZTeK+CB48X8OV37c0TBjG+zckSGmE0xaoo/E9/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="416689092"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="416689092"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 08:49:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="617940807"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="617940807"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 10 Feb 2023 08:49:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pQWaT-005876-11;
        Fri, 10 Feb 2023 18:49:25 +0200
Date:   Fri, 10 Feb 2023 18:49:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-serial@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] serial: 8250_em: Update RZ/V2M port type as
 PORT_16750
Message-ID: <Y+Z1lWnUNWC0IJFz@smile.fi.intel.com>
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com>
 <20230210154140.338352-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210154140.338352-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 10, 2023 at 03:41:39PM +0000, Biju Das wrote:
> The UART IP found on RZ/V2M SoC is Register-compatible with the
> general-purpose 16750 UART chip. This patch updates RZ/V2M
> port type from 16550A->16750 and also enables 64-bytes fifo support.

...

> +#include <linux/of_device.h>

property.h

...

> +	priv->info = of_device_get_match_data(dev);

device_get_match_data()

...

With Ilpo's comment addressed this looks good!

-- 
With Best Regards,
Andy Shevchenko


