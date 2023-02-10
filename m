Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B2C69239B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 17:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbjBJQsP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 11:48:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232704AbjBJQsP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 11:48:15 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A28EFA1;
        Fri, 10 Feb 2023 08:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676047692; x=1707583692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=itfI7GFRolRVM8Mv8GEVLPZACYEq7Xm3LMJoqhkZnBE=;
  b=SHaIyceT6vhV+peIO1H/Q29fdL2yYgkD8cTiYg0pBEMLyJPOJIzE9veD
   HTDhpsOdouMRrjxD3M3s1UAmOylRy2akX7Tgk8wt1z7cfhvOoCBHTCczH
   YmlvRTnXy7EtrL9kgwaVKbzA+loZYpP5TmS5Js7Me5QwJbsS8npdBfPkf
   YDzWBrXRqWDejQBZK3nSJFi5spTOikS14jeCmDv+IpvQU+1oYLkdEyPvQ
   Uiw4XXaGFwpSxIz7ygvDqzoWRmZq6HVb2SmTjAzmDC2WSt4v1nM4eH9a+
   nZk7n4CRicJdk50gZl1wfGl2hGbZqp4pZXMV0NuNYv3ilAt8i2YvhoEID
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="318480364"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="318480364"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 08:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="700531617"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="700531617"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 10 Feb 2023 08:48:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pQWZD-00585Y-0X;
        Fri, 10 Feb 2023 18:48:07 +0200
Date:   Fri, 10 Feb 2023 18:48:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] serial: 8250_em: Use dev_err_probe()
Message-ID: <Y+Z1Ru10HcstKU8D@smile.fi.intel.com>
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com>
 <20230210154140.338352-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210154140.338352-2-biju.das.jz@bp.renesas.com>
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

On Fri, Feb 10, 2023 at 03:41:38PM +0000, Biju Das wrote:
> This patch simplifies probe() function by using dev_err_probe()
> instead of dev_err in probe().
> 
> While at it, remove the unused header file slab.h and added a
> local variable 'dev' to replace '&pdev->dev' in probe().
> 
> Also replace devm_clk_get->devm_clk_get_enabled and updated the
> clk handling in probe().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * replaced devm_clk_get->devm_clk_get_enabled() and updated clk
>    handling in probe().
>  * Added Rb tag from Geert.
> ---
>  drivers/tty/serial/8250/8250_em.c | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
> index f8e99995eee9..b78c74755735 100644
> --- a/drivers/tty/serial/8250/8250_em.c
> +++ b/drivers/tty/serial/8250/8250_em.c
> @@ -13,7 +13,6 @@
>  #include <linux/serial_reg.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk.h>
> -#include <linux/slab.h>
>  
>  #include "8250.h"
>  
> @@ -79,6 +78,7 @@ static void serial8250_em_serial_dl_write(struct uart_8250_port *up, int value)
>  static int serial8250_em_probe(struct platform_device *pdev)
>  {
>  	struct serial8250_em_priv *priv;
> +	struct device *dev = &pdev->dev;
>  	struct uart_8250_port up;
>  	struct resource *regs;
>  	int irq, ret;
> @@ -88,30 +88,25 @@ static int serial8250_em_probe(struct platform_device *pdev)
>  		return irq;
>  
>  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!regs) {
> -		dev_err(&pdev->dev, "missing registers\n");
> -		return -EINVAL;
> -	}
> +	if (!regs)
> +		return dev_err_probe(dev, -EINVAL, "missing registers\n");
>  
> -	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	priv->sclk = devm_clk_get(&pdev->dev, "sclk");
> -	if (IS_ERR(priv->sclk)) {
> -		dev_err(&pdev->dev, "unable to get clock\n");
> -		return PTR_ERR(priv->sclk);
> -	}
> +	priv->sclk = devm_clk_get_enabled(dev, "sclk");
> +	if (IS_ERR(priv->sclk))
> +		return dev_err_probe(dev, PTR_ERR(priv->sclk), "unable to get clock\n");
>  
>  	memset(&up, 0, sizeof(up));
>  	up.port.mapbase = regs->start;
>  	up.port.irq = irq;
>  	up.port.type = PORT_UNKNOWN;
>  	up.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP;
> -	up.port.dev = &pdev->dev;
> +	up.port.dev = dev;
>  	up.port.private_data = priv;
>  
> -	clk_prepare_enable(priv->sclk);
>  	up.port.uartclk = clk_get_rate(priv->sclk);
>  
>  	up.port.iotype = UPIO_MEM32;
> @@ -121,11 +116,8 @@ static int serial8250_em_probe(struct platform_device *pdev)
>  	up.dl_write = serial8250_em_serial_dl_write;
>  
>  	ret = serial8250_register_8250_port(&up);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "unable to register 8250 port\n");
> -		clk_disable_unprepare(priv->sclk);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "unable to register 8250 port\n");
>  
>  	priv->line = ret;
>  	platform_set_drvdata(pdev, priv);
> -- 
> 2.25.1
> 
> 

-- 
With Best Regards,
Andy Shevchenko


