Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39BF14EC61E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 16:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346538AbiC3OFK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 10:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346534AbiC3OFK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:05:10 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 148A02662;
        Wed, 30 Mar 2022 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648649005; x=1680185005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z1XmaWYhQB3CgKr4UCJ17LcDDppqpoTAYeKotOG6x+U=;
  b=KL2LmMbogd9iRrbjQR5teM2u4JN5uTZfWfy6EHOlaDkorqwJlm8iH2Mr
   03N7S1mXbSFkHndcn9yRfc19EC3kW5Cy+T+7aIIP4yzx9v2GX6yvoS0oq
   +PHXvE4vNeZq11w0WIo3x9sYSCXpPqwm42DbN77VV6Sq+QmC5WEalkvmz
   IDq6+rQAoktnMKNMbUkMLz7KKIPotP+HvzivGpZwDuFgh6sEG4QgnG2Nw
   EajfBWV1p8fiFBQWwlG7JFT6fBlFXCl+znntBE7aHYXainpv9m+vlXmBm
   jk3JPMXG4j0OIwVH9Z0yBYK0uN/OWxTq6RADGfD/js4JQF/2iVG4Ghb8K
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="257128317"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="257128317"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:03:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="519689372"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:03:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZYuN-009RKv-Ib;
        Wed, 30 Mar 2022 17:02:47 +0300
Date:   Wed, 30 Mar 2022 17:02:47 +0300
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
Message-ID: <YkRjB5jxIJ9Zk0oL@smile.fi.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
 <20220330132038.808679-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330132038.808679-4-miquel.raynal@bootlin.com>
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

On Wed, Mar 30, 2022 at 03:20:32PM +0200, Miquel Raynal wrote:
> Before adding more platform data information, let's turn the quirks
> information as being a member of a wider structure. More fields will be
> added later.
> 
> At the same time, change the quirks type to unsigned int, as its size
> won't change between setups and we don't really need this variable to be
> more than a few bits wide anyway.
> 
> Provide a stub to the compatibles without quirks to simplify handling.
> Keep two different empty structure for the base DW compatible and the
> Renesas one because the latter will soon be fulfilled anyway.

I'm almost fine with it,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Please, see below remarks.

> Cc: Emil Renner Berthing <kernel@esmil.dk>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/8250/8250_dw.c    | 32 ++++++++++++++++++++++------
>  drivers/tty/serial/8250/8250_dwlib.h |  5 +++++
>  2 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index b6238b9bf0b2..70a843e31ffd 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -19,6 +19,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/workqueue.h>
>  #include <linux/notifier.h>
>  #include <linux/slab.h>
> @@ -371,7 +372,7 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
>  static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>  {
>  	struct device_node *np = p->dev->of_node;
> -	unsigned long quirks = (unsigned long)device_get_match_data(p->dev);
> +	unsigned int quirks = data->pdata->quirks;
>  
>  	if (np) {
>  		int id;
> @@ -462,6 +463,7 @@ static int dw8250_probe(struct platform_device *pdev)
>  
>  	data->data.dma.fn = dw8250_fallback_dma_filter;
>  	data->usr_reg = DW_UART_USR;

(1)

> +	data->pdata = device_get_match_data(p->dev);
>  	p->private_data = &data->data;
>  
>  	data->uart_16550_compatible = device_property_read_bool(dev,
> @@ -678,13 +680,29 @@ static const struct dev_pm_ops dw8250_pm_ops = {
>  	SET_RUNTIME_PM_OPS(dw8250_runtime_suspend, dw8250_runtime_resume, NULL)
>  };
>  
> +static const struct dw8250_platform_data dw8250_dw_apb = {};

(2)


' = {}' part is actually redundant in (2), but can we move (1) to pdata
(perhaps as a separate patch)?

In such case I would change (2) to

  static const struct dw8250_platform_data dw8250_dw_apb = {
  };

> +static const struct dw8250_platform_data dw8250_octeon_3860_data = {
> +	.quirks = DW_UART_QUIRK_OCTEON,
> +};
> +
> +static const struct dw8250_platform_data dw8250_armada_38x_data = {
> +	.quirks = DW_UART_QUIRK_ARMADA_38X,
> +};
> +
> +static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {};
> +
> +static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
> +	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
> +};
> +
>  static const struct of_device_id dw8250_of_match[] = {
> -	{ .compatible = "snps,dw-apb-uart" },
> -	{ .compatible = "cavium,octeon-3860-uart", .data = (void *)DW_UART_QUIRK_OCTEON },
> -	{ .compatible = "marvell,armada-38x-uart", .data = (void *)DW_UART_QUIRK_ARMADA_38X },
> -	{ .compatible = "renesas,rzn1-uart" },
> -	{ .compatible = "starfive,jh7100-hsuart",  .data = (void *)DW_UART_QUIRK_SKIP_SET_RATE },
> -	{ .compatible = "starfive,jh7100-uart",    .data = (void *)DW_UART_QUIRK_SKIP_SET_RATE },
> +	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
> +	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
> +	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
> +	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
> +	{ .compatible = "starfive,jh7100-hsuart", .data = &dw8250_starfive_jh7100_data },
> +	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
>  	{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dw8250_of_match);
> diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
> index 72e7dbcccad0..68bb81bee660 100644
> --- a/drivers/tty/serial/8250/8250_dwlib.h
> +++ b/drivers/tty/serial/8250/8250_dwlib.h
> @@ -21,8 +21,13 @@ struct dw8250_port_data {
>  	u8			dlf_size;
>  };
>  
> +struct dw8250_platform_data {
> +	unsigned int quirks;
> +};
> +
>  struct dw8250_data {
>  	struct dw8250_port_data	data;
> +	const struct dw8250_platform_data *pdata;
>  
>  	u8			usr_reg;
>  	int			msr_mask_on;
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


