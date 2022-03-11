Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7E474D6728
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 18:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346653AbiCKRHd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Mar 2022 12:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240911AbiCKRHc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Mar 2022 12:07:32 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3101D63A0;
        Fri, 11 Mar 2022 09:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647018389; x=1678554389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DSkCyqr3/4yxm2zuRkGhfKUzWvzGnBZv87rd+xNpkfQ=;
  b=bgxtr8QewbR23nOqFDb+3BTnopwhe6cdUTVf0Rtlv6u0G21k9EHqToE/
   SdAxWSrlvDi3P7DLYn27PGy1P5zYXxajxUfFKw2pDoEPIyTDqBMvmqXLY
   BNnQxuny1EHdRrrLWmxelFX7rlA2G4y8nV6VTfgl6SNfSBabP6O7R1w9R
   FIbGce6K5slZtmJ8sRmBy1ZweMFQdsaoyZB4REebIt7NT+M60XpY9lDfa
   O7/Mhwnb6KIsuV3LsqiA/Lty4ZFizJy9+0OAY2CTBqnFi8mWESbyv8uyI
   AQp77U7Erce19iMCKKH5rsgY8npwJT8gUtHaDgo6uT/5MEIiBJ1SdBLqH
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="316332760"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="316332760"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 09:05:54 -0800
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="712903160"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 09:05:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nSihP-00FTaF-OK;
        Fri, 11 Mar 2022 19:05:07 +0200
Date:   Fri, 11 Mar 2022 19:05:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH 3/7] serial: 8250_dw: Use a fallback CPR value if not
 synthesized
Message-ID: <YiuBQ/nDqQNAS+eB@smile.fi.intel.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
 <20220310161650.289387-4-miquel.raynal@bootlin.com>
 <Yio9QcFqqhjiAcMT@smile.fi.intel.com>
 <20220310200101.13233016@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310200101.13233016@xps13>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 10, 2022 at 08:01:01PM +0100, Miquel Raynal wrote:
> andriy.shevchenko@linux.intel.com wrote on Thu, 10 Mar 2022 20:02:41
> +0200:
> > On Thu, Mar 10, 2022 at 05:16:46PM +0100, Miquel Raynal wrote:
> > > From: Phil Edworthy <phil.edworthy@renesas.com>

...

> > > +#include <linux/of_device.h>  
> > 
> > > +	const struct dw8250_platform_data *plat = of_device_get_match_data(up->port.dev);  
> > 
> > No. Please use device property APIs.
> 
> Are you suggesting the use of CPR DT property? If yes, what is the
> point if there is one CPR per SoC? I would argue that DT description is
> already quite complex and supporting one or another register is up to
> the OS as long as we can map CPR registers to SoCs?

I'm suggesting to use device property APIs, I'm not talking about ABI.
In this case instead of above you may simply do

#include <linux/property.h>

	const struct dw8250_platform_data *plat = device_get_match_data(up->port.dev);


-- 
With Best Regards,
Andy Shevchenko


