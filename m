Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6651D4EC626
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 16:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346574AbiC3OI4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 10:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346573AbiC3OIz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:08:55 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE82139CD3;
        Wed, 30 Mar 2022 07:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648649231; x=1680185231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HerHvl1Bq2nBz+F2CJSHRdkjw5OtOR3D4tefm7Hej4I=;
  b=cf0V+Iyi1fgpAr84/XwZG5StA1SWGoltXTheGWgv+b40lre80t9EvJmj
   asVjuJMjnKjBvNLGMjXl10woiSqNupGaGAwkBi2TvRao38g2HmJOI1GdU
   gqrX4vpmFEhIwWoqQNS4tDOLylNOJA7w1lTxGj+MceSmgSCvgjxux6GAQ
   ayCZJQPkQIDbxP61QQVuX6DrhvmlJhfgnzXvqDNAz5lwFGVkc1Oyqbou9
   U49B0FdsP8SQyDbzbxsr72pUtLyfoidARvNOcc+AeOv1zOwZ7eQJdxF8g
   /UTzZbnp888v9iYTBgQ9UnLGYhBYTdxaPPJQPPWDM/O1YL53lFHjUzIg3
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259735564"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="259735564"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:07:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="618542513"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:07:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZYvu-009RNx-8v;
        Wed, 30 Mar 2022 17:04:22 +0300
Date:   Wed, 30 Mar 2022 17:04:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v4 3/9] serial: 8250: dw: Create a more generic platform
 data structure
Message-ID: <YkRjZoTTAzb1NFsn@smile.fi.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
 <20220330132038.808679-4-miquel.raynal@bootlin.com>
 <YkRjB5jxIJ9Zk0oL@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkRjB5jxIJ9Zk0oL@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 30, 2022 at 05:02:47PM +0300, Andy Shevchenko wrote:
> On Wed, Mar 30, 2022 at 03:20:32PM +0200, Miquel Raynal wrote:

...

> In such case I would change (2) to
> 
>   static const struct dw8250_platform_data dw8250_dw_apb = {
>   };

...

> > +static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {};

Btw, it makes sense to apply the above suggestion here as well

  static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
  };

-- 
With Best Regards,
Andy Shevchenko


