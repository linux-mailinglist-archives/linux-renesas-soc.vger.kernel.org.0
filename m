Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6208A4FF54A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 12:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbiDMK7H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 06:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbiDMK7F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 06:59:05 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4765A09C;
        Wed, 13 Apr 2022 03:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649847404; x=1681383404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RlKLj1TlJBJHedR0yUQxy2M+trwUto7AUld+GifxygA=;
  b=K2XZ7rVYgmxa+3DBKlPj41yWtPL8FWUKVD+sc8B30I3VeVIEfa1JoJzn
   IOiRubai4raTU4tZyavivJB4DyflLZLW+BF8e3fRmZ0uRxWcuYxak9yDr
   7ClIH+3EYmuvOlbHPQunAa9tloTmiB3oLHTISHu0v4OXDuSXRycFIlnO1
   mAjfVTJKejf26r8YRTZDoZ5GTG1vPQlPsN+9yj59UE7qksL4sbqGYo5Tc
   RJnKQX0Ridy+8i/16Nu1usG6GjBhjiDX8CXrX3HuwZPLMcgrNY4gUscst
   5xgBtsdRIAfWRZ48mbaJA+762hpwx0Y/DxWlGhyEZ+OBVmNa6XCUYr2LQ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262816417"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="262816417"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 03:56:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="590714014"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 03:56:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1neacO-001nUh-Li;
        Wed, 13 Apr 2022 13:53:00 +0300
Date:   Wed, 13 Apr 2022 13:53:00 +0300
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
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: Re: [PATCH v5 05/11] serial: 8250: dw: Allow to use a fallback CPR
 value if not synthesized
Message-ID: <YlarjAniao3v+Pg9@smile.fi.intel.com>
References: <20220413075141.72777-1-miquel.raynal@bootlin.com>
 <20220413075141.72777-6-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413075141.72777-6-miquel.raynal@bootlin.com>
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

On Wed, Apr 13, 2022 at 09:51:35AM +0200, Miquel Raynal wrote:
> DW UART controllers can be synthesized without the CPR register.
> In this case, allow to the platform information to provide a CPR value.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Some nit-picks below.

> Co-developed-by: Phil Edworthy <phil.edworthy@renesas.com>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/tty/serial/8250/8250_dwlib.c | 10 +++++++---
>  drivers/tty/serial/8250/8250_dwlib.h |  1 +
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
> index 622d3b0d89e7..22154b5848d5 100644
> --- a/drivers/tty/serial/8250/8250_dwlib.c
> +++ b/drivers/tty/serial/8250/8250_dwlib.c
> @@ -89,6 +89,8 @@ EXPORT_SYMBOL_GPL(dw8250_do_set_termios);
>  
>  void dw8250_setup_port(struct uart_port *p)
>  {
> +	struct dw8250_port_data *pd = p->private_data;
> +	struct dw8250_data *data = to_dw8250_data(pd);
>  	struct uart_8250_port *up = up_to_u8250p(p);
>  	u32 reg;
>  
> @@ -108,14 +110,16 @@ void dw8250_setup_port(struct uart_port *p)
>  	dw8250_writel_ext(p, DW_UART_DLF, 0);
>  
>  	if (reg) {
> -		struct dw8250_port_data *d = p->private_data;
> -
> -		d->dlf_size = fls(reg);
> +		pd->dlf_size = fls(reg);
>  		p->get_divisor = dw8250_get_divisor;
>  		p->set_divisor = dw8250_set_divisor;
>  	}
>  
>  	reg = dw8250_readl_ext(p, DW_UART_CPR);
> +	if (!reg) {
> +		reg = data->pdata->cpr;
> +		dev_dbg(p->dev, "CPR is not available, using 0x%08x instead\n", reg);
> +	}
>  	if (!reg)
>  		return;
>  
> diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
> index 0df6baa6eaee..412f4e83e0b3 100644
> --- a/drivers/tty/serial/8250/8250_dwlib.h
> +++ b/drivers/tty/serial/8250/8250_dwlib.h
> @@ -24,6 +24,7 @@ struct dw8250_port_data {
>  struct dw8250_platform_data {
>  	u8 usr_reg;
>  	unsigned int quirks;
> +	u32 cpr;

I would probably name it cpr_val (to be in align with _reg above) and move it
after the usr_reg member. But it's minor, up to you.

>  };
>  
>  struct dw8250_data {

-- 
With Best Regards,
Andy Shevchenko


