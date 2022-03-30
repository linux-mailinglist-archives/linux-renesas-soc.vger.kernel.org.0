Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E92F34EC648
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 16:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346672AbiC3OQZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 10:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346662AbiC3OQY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:16:24 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB0E41998;
        Wed, 30 Mar 2022 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648649679; x=1680185679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wApBMaUPiZFKdyxTjPkgju1mD4jufamqSDGmXbka1hw=;
  b=GkjHljy/qNgzPKj+l5nxveo2IJ9PBnNQ43gxnKZuxGB1Zr6r8hfs3Mdn
   M/gF9ecukLzAay7qN0jV3voNJRb5Saym5OdyTpo3nzv2i2C5tIAe2Fa9X
   dKhjNHyVFxVCMTZou5gahgUR3v4xPwILruPEo7+CbTAf5NJxGMFUIzzQj
   qeWAJZMe6PbcHLtqdlE8bfklC0seny+DGFM3I4BSQjDWVlWgVosJ7TG47
   5dy6U/QI1QbQGkD1CXezpKwfY9WhYmJXjv5CSX1siCIWwPTpsMEP/BXWy
   bd6h7AZwT2GLcjP/9XJujeoebenI/IHP85dBtTTEUNWitoWHXLIGkMQ9R
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239482345"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="239482345"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:14:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="695113217"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:14:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZZ5G-009RcN-Ss;
        Wed, 30 Mar 2022 17:14:02 +0300
Date:   Wed, 30 Mar 2022 17:14:02 +0300
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
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v4 6/9] serial: 8250: dw: Introduce an rx_timeout
 variable in the IRQ path
Message-ID: <YkRlqkEhf8yzuPsv@smile.fi.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
 <20220330132038.808679-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330132038.808679-7-miquel.raynal@bootlin.com>
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

On Wed, Mar 30, 2022 at 03:20:35PM +0200, Miquel Raynal wrote:
> In a next change we are going to need the same Rx timeout condition as
> we already have in the IRQ handling code. Let's just create a boolean to
> clarify what this operation does before reusing it.
> 
> There is no functional change.

OK!

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 70a843e31ffd..a156c6d2f866 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -223,6 +223,7 @@ static int dw8250_handle_irq(struct uart_port *p)
>  	struct uart_8250_port *up = up_to_u8250p(p);
>  	struct dw8250_data *d = to_dw8250_data(p->private_data);
>  	unsigned int iir = p->serial_in(p, UART_IIR);
> +	bool rx_timeout = (iir & 0x3f) == UART_IIR_RX_TIMEOUT;
>  	unsigned int status;
>  	unsigned long flags;
>  
> @@ -236,7 +237,7 @@ static int dw8250_handle_irq(struct uart_port *p)
>  	 * This problem has only been observed so far when not in DMA mode
>  	 * so we limit the workaround only to non-DMA mode.
>  	 */
> -	if (!up->dma && ((iir & 0x3f) == UART_IIR_RX_TIMEOUT)) {
> +	if (!up->dma && rx_timeout) {
>  		spin_lock_irqsave(&p->lock, flags);
>  		status = p->serial_in(p, UART_LSR);
>  
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


