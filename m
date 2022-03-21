Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECAF4E2DA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Mar 2022 17:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350964AbiCUQQf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Mar 2022 12:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350877AbiCUQQd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 12:16:33 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F0D26C4;
        Mon, 21 Mar 2022 09:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647879308; x=1679415308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zpL1KC/LzFW3XuDbWTk/8gL8h7ax9edy561qrE2wzY0=;
  b=iSlxh+qKJhugBVJVdrRWVspVnBiG7ewWUgWgyNlfObIM1Finp/vT0a5j
   i74fK4RTMy6qzkAi/zx3nAknfFoyze1Dq/a06xkM+SYLdl0O72Cd+hVq5
   DAwXtkahXHmXpoCPoddEAYk/YffI26pXffTH11Nuy/GmM3SXuo4Nymy2J
   Y4JcJhdGzSrQD7E1BQ8jAB52Q+wUUSpjg50u80SMqhiCHsdHg/KI4dWhK
   TW1fMCojGStPRhNi4hYtq90Gt7CXvsXTzvn2ynLhnUdWwR8BasBDwiwDU
   /wswymrgRaInlPe+c0UCklyqi4imfSIiZcfw8CSI717FqhWwMODp5p92l
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257306807"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="257306807"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 09:15:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="559934756"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 09:15:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nWKfr-0040kY-OS;
        Mon, 21 Mar 2022 18:14:27 +0200
Date:   Mon, 21 Mar 2022 18:14:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Al Cooper <alcooperx@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 06/14] serial: 8250: Make SERIAL_8250_EM available for
 arm64 systems
Message-ID: <YjikYxGyUQfvqsiO@smile.fi.intel.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-7-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321154232.56315-7-phil.edworthy@renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 21, 2022 at 03:42:24PM +0000, Phil Edworthy wrote:
> This is needed for the Renesas RZ/V2M (r9a09g011) SoC.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/tty/serial/8250/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
> index cd93ea6eed65..fdb6c4188695 100644
> --- a/drivers/tty/serial/8250/Kconfig
> +++ b/drivers/tty/serial/8250/Kconfig
> @@ -380,7 +380,7 @@ config SERIAL_8250_DW
>  config SERIAL_8250_EM
>  	tristate "Support for Emma Mobile integrated serial port"
>  	depends on SERIAL_8250 && HAVE_CLK
> -	depends on (ARM && ARCH_RENESAS) || COMPILE_TEST
> +	depends on ARCH_RENESAS || COMPILE_TEST
>  	help
>  	  Selecting this option will add support for the integrated serial
>  	  port hardware found on the Emma Mobile line of processors.
> -- 
> 2.32.0
> 

-- 
With Best Regards,
Andy Shevchenko


