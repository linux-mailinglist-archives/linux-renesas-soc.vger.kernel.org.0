Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6B74FF544
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 12:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbiDMK4Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 06:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbiDMK4O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 06:56:14 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3F35A085;
        Wed, 13 Apr 2022 03:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649847233; x=1681383233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5430s+I0Ykpy6ZOeJHUqJLV8XA/h74bJovQpcF5OkCc=;
  b=VEmfMGp99cykt9dpXdg951RcQoZPftPkAZKkCa4x3ErImDvNj7CSa6+A
   mokIwCdHliYs4G8uAHEGvrJk2MVeS8lGr+JJXdxjEmzM01jvf7NmMLFk/
   rdIJx2MYm94tnnvwKgYSkPE3XsNTMSG0bKey3lwUiPZZTl0ta12zx9uey
   +eCeQFztPDTR1P7jrvFVZTj8szTRbwum0e46BRyh0jI640iEjiTuMRBGt
   +WsaIdNyq1scAYCh/IP5lHvqip0uUszY+VzE+FKZdVRPGgZvGpw9BmPfg
   rE0K240f40DhJxBFz8xq/AbLNEdj90sO47vd+B6HFBPU5R1wFiIvrDzNd
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="242571352"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="242571352"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 03:53:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="507935555"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 03:53:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1neaZY-001nTJ-C8;
        Wed, 13 Apr 2022 13:50:04 +0300
Date:   Wed, 13 Apr 2022 13:50:04 +0300
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
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v5 04/11] serial: 8250: dw: Move the USR register to pdata
Message-ID: <Ylaq3M0FyJsklZ8O@smile.fi.intel.com>
References: <20220413075141.72777-1-miquel.raynal@bootlin.com>
 <20220413075141.72777-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413075141.72777-5-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 13, 2022 at 09:51:34AM +0200, Miquel Raynal wrote:
> This offset is a good candidate to pdata's because it changes depending
> on the vendor implementation. Let's move the usr_reg entry from regular
> to pdata. This way we can drop initializing it at run time.
> 
> Let's also use a define for it instead of defining only the default
> value.

Yep, thanks!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c    | 11 ++++++++---
>  drivers/tty/serial/8250/8250_dwlib.h |  2 +-
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 93b112f3bc49..babf5dc597a8 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -35,6 +35,8 @@
>  /* Offsets for the DesignWare specific registers */
>  #define DW_UART_USR	0x1f /* UART Status Register */
>  
> +#define OCTEON_UART_USR	0x27 /* UART Status Register */
> +
>  /* DesignWare specific register fields */
>  #define DW_UART_MCR_SIRE		BIT(6)
>  
> @@ -251,7 +253,7 @@ static int dw8250_handle_irq(struct uart_port *p)
>  
>  	if ((iir & UART_IIR_BUSY) == UART_IIR_BUSY) {
>  		/* Clear the USR */
> -		(void)p->serial_in(p, d->usr_reg);
> +		(void)p->serial_in(p, d->pdata->usr_reg);
>  
>  		return 1;
>  	}
> @@ -387,7 +389,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>  			p->serial_out = dw8250_serial_outq;
>  			p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
>  			p->type = PORT_OCTEON;
> -			data->usr_reg = 0x27;
>  			data->skip_autocfg = true;
>  		}
>  #endif
> @@ -462,7 +463,6 @@ static int dw8250_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	data->data.dma.fn = dw8250_fallback_dma_filter;
> -	data->usr_reg = DW_UART_USR;
>  	data->pdata = device_get_match_data(p->dev);
>  	p->private_data = &data->data;
>  
> @@ -681,20 +681,25 @@ static const struct dev_pm_ops dw8250_pm_ops = {
>  };
>  
>  static const struct dw8250_platform_data dw8250_dw_apb = {
> +	.usr_reg = DW_UART_USR,
>  };
>  
>  static const struct dw8250_platform_data dw8250_octeon_3860_data = {
> +	.usr_reg = OCTEON_UART_USR,
>  	.quirks = DW_UART_QUIRK_OCTEON,
>  };
>  
>  static const struct dw8250_platform_data dw8250_armada_38x_data = {
> +	.usr_reg = DW_UART_USR,
>  	.quirks = DW_UART_QUIRK_ARMADA_38X,
>  };
>  
>  static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
> +	.usr_reg = DW_UART_USR,
>  };
>  
>  static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
> +	.usr_reg = DW_UART_USR,
>  	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
>  };
>  
> diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
> index 68bb81bee660..0df6baa6eaee 100644
> --- a/drivers/tty/serial/8250/8250_dwlib.h
> +++ b/drivers/tty/serial/8250/8250_dwlib.h
> @@ -22,6 +22,7 @@ struct dw8250_port_data {
>  };
>  
>  struct dw8250_platform_data {
> +	u8 usr_reg;
>  	unsigned int quirks;
>  };
>  
> @@ -29,7 +30,6 @@ struct dw8250_data {
>  	struct dw8250_port_data	data;
>  	const struct dw8250_platform_data *pdata;
>  
> -	u8			usr_reg;
>  	int			msr_mask_on;
>  	int			msr_mask_off;
>  	struct clk		*clk;
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


