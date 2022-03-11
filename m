Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6844D679B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 18:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344114AbiCKR26 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Mar 2022 12:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350770AbiCKR25 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Mar 2022 12:28:57 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835766583A;
        Fri, 11 Mar 2022 09:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647019671; x=1678555671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+UESiiPffXEq5ga4C+WRh4syawdhOPkfzoMuLxmJMlY=;
  b=hP1YAAdU+uDVwTK26eGITrtk3raKErOI/DMOTMVsk0qJMZREzKgf5K01
   byAM4SDX2EJJL9swXV+e6ZaKV+YkXn8dE1SGMu+h+kVLd8PtyzTjcRYqG
   UmJm4uJ3nIf6xxP3U/39MFXubs6sNRlqQ8/w+8w4aG3diGG0OOU5aBI4s
   mK6wxNCnf4N3UruAGNBeg96ZBWydzmGEM9L/4sqWtdGquaVCfVLbvW4XR
   gV1OCn9WYhUEhHSK4CxjvAT8fK3Sf3V2/y4lAp5htV2vd4APtWiFe8Ob3
   2XyAHHfyCAJ7EFo6ihxK8zlcvEM6sKV4pgoFPqtur3knvsvcH4B9ryVrR
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="316337226"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="316337226"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 09:27:50 -0800
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="644992701"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 09:27:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nSj2d-00FU94-LA;
        Fri, 11 Mar 2022 19:27:03 +0200
Date:   Fri, 11 Mar 2022 19:27:03 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] serial: 8250_dw: Use device tree match data
Message-ID: <YiuGZwnL1Zm01fBA@smile.fi.intel.com>
References: <20220311105934.5827d0d6@xps13>
 <20220311144814.21944-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311144814.21944-1-kernel@esmil.dk>
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

On Fri, Mar 11, 2022 at 03:48:14PM +0100, Emil Renner Berthing wrote:
> ..rather than multiple calls to of_device_is_compatible().

> For reference this is the patch I wrote for the StarFive JH7100 tree.
> Feel free to use it or do something better as you see fit.

>  	if (np) {
> +		unsigned long quirks = (unsigned long)of_device_get_match_data(p->dev);

It can be done outside of the np check with device property APIs in use.
Also it needs to use (uintptr_t) for better coverage.

		unsigned long quirks = (uintptr_t)device_get_match_data(p->dev);

Or use data structure as driver_data.

		const struct ... *data = device_get_match_data(p->dev);

-- 
With Best Regards,
Andy Shevchenko


