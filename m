Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7798F4D5126
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 19:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbiCJSEh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 13:04:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239223AbiCJSEg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 13:04:36 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D23D14076D;
        Thu, 10 Mar 2022 10:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646935415; x=1678471415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=USeMBfA1GZknJ/QfufCF/Woi1F8tPQcpUrNiIKEwmrc=;
  b=baVETSrXUhX8/NM7cEAHByv1XBtl/dzx204436aVeWSFPlq9dvY96spD
   vO9AwT6/L35Hn6YWp41iCSwQMuOHLiCSVud7rbFG8ijXIhPsO2y5sKpno
   4RJBBI2KIB2vfJZQXVcgEmQ0/8DHNjlOKAfzK0TtWtDADr8YJuCEPpAXV
   jxq/KK9Lg1iwC/HonXQYqCev9nrEDURtiKikrud8IY1nGBnnOurobiK9M
   TlixVQZwcy1dFS38oTHgNV1NIIyeYeqOaUinF+hoAIy4qUbHcXaPZm0yo
   rR+5puEtY0vWoNz7mFuaL4W4Kbqu3gk1To7a9thulMxmSOGZZrYkkESkW
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="252890761"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="252890761"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 10:03:28 -0800
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="578889041"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 10:03:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nSN7Z-00ErPp-PU;
        Thu, 10 Mar 2022 20:02:41 +0200
Date:   Thu, 10 Mar 2022 20:02:41 +0200
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
Message-ID: <Yio9QcFqqhjiAcMT@smile.fi.intel.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
 <20220310161650.289387-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310161650.289387-4-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 10, 2022 at 05:16:46PM +0100, Miquel Raynal wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> This UART controller can be synthesized without the CPR register.
> In that case, let's use the platform information to provide a CPR value.

...

> +#include <linux/of_device.h>

> +	const struct dw8250_platform_data *plat = of_device_get_match_data(up->port.dev);

No. Please use device property APIs.

-- 
With Best Regards,
Andy Shevchenko


