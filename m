Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3D34EC62F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 16:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346625AbiC3OK2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 10:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346606AbiC3OKU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:10:20 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA9A19953F;
        Wed, 30 Mar 2022 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648649314; x=1680185314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OyxRUGrwm3w4ZfG3q5TyQTuBcEpsbNY9cFD4uvra/FU=;
  b=eZQZQp2uCCAbYaGr+99DSLzxL5lDeA9gWCyzrqUcHym3Xftvq4FpNTeX
   zszo6Fuvj5NqRwgj4FD4XZ4tGktnVjy4rAxQFr6QRfeXDStwsTHCWSjs6
   jB60dKx/oEAqd2/NA2ykdbqBA0MJyDtPc3gDC9rmlKNOwzakexekAqQw9
   /0ekQfyA6lbSQ81ZSEaQmWob1AEw6VNCoBwV5KxBikPPixM7djfSUC66l
   /NFOIG6U+eqB+F+V/l+AvPXB3H3TfJQSRVk9IfcejdkF69S6bxCHIBw36
   Qrsdu5ty+Hn60lzj1T542Vjeeg8VF39yJdwEr4sKDlajXe+OxiWAJaKQL
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="241706119"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="241706119"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:08:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="719987909"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:08:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZYzN-009RTH-Us;
        Wed, 30 Mar 2022 17:07:57 +0300
Date:   Wed, 30 Mar 2022 17:07:57 +0300
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
Subject: Re: [PATCH v4 5/9] serial: 8250: dma: Allow driver operations before
 starting DMA transfers
Message-ID: <YkRkPWPigPFjBDpc@smile.fi.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
 <20220330132038.808679-6-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330132038.808679-6-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 30, 2022 at 03:20:34PM +0200, Miquel Raynal wrote:
> One situation where this could be used is when configuring the UART
> controller to be the DMA flow controller. This is a typical case where
> the driver might need to program a few more registers before starting a
> DMA transfer. Provide the necessary infrastructure to support this
> case.

OK!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/tty/serial/8250/8250.h     | 18 ++++++++++++++++++
>  drivers/tty/serial/8250/8250_dma.c |  4 ++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> index db784ace25d8..d19f24e4d13e 100644
> --- a/drivers/tty/serial/8250/8250.h
> +++ b/drivers/tty/serial/8250/8250.h
> @@ -17,6 +17,8 @@
>  struct uart_8250_dma {
>  	int (*tx_dma)(struct uart_8250_port *p);
>  	int (*rx_dma)(struct uart_8250_port *p);
> +	void (*prepare_tx_dma)(struct uart_8250_port *p);
> +	void (*prepare_rx_dma)(struct uart_8250_port *p);
>  
>  	/* Filter function */
>  	dma_filter_fn		fn;
> @@ -301,6 +303,22 @@ extern int serial8250_rx_dma(struct uart_8250_port *);
>  extern void serial8250_rx_dma_flush(struct uart_8250_port *);
>  extern int serial8250_request_dma(struct uart_8250_port *);
>  extern void serial8250_release_dma(struct uart_8250_port *);
> +
> +static inline void serial8250_do_prepare_tx_dma(struct uart_8250_port *p)
> +{
> +	struct uart_8250_dma *dma = p->dma;
> +
> +	if (dma->prepare_tx_dma)
> +		dma->prepare_tx_dma(p);
> +}
> +
> +static inline void serial8250_do_prepare_rx_dma(struct uart_8250_port *p)
> +{
> +	struct uart_8250_dma *dma = p->dma;
> +
> +	if (dma->prepare_rx_dma)
> +		dma->prepare_rx_dma(p);
> +}
>  #else
>  static inline int serial8250_tx_dma(struct uart_8250_port *p)
>  {
> diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
> index 890fa7ddaa7f..558d3a2ac65b 100644
> --- a/drivers/tty/serial/8250/8250_dma.c
> +++ b/drivers/tty/serial/8250/8250_dma.c
> @@ -77,6 +77,8 @@ int serial8250_tx_dma(struct uart_8250_port *p)
>  
>  	dma->tx_size = CIRC_CNT_TO_END(xmit->head, xmit->tail, UART_XMIT_SIZE);
>  
> +	serial8250_do_prepare_tx_dma(p);
> +
>  	desc = dmaengine_prep_slave_single(dma->txchan,
>  					   dma->tx_addr + xmit->tail,
>  					   dma->tx_size, DMA_MEM_TO_DEV,
> @@ -114,6 +116,8 @@ int serial8250_rx_dma(struct uart_8250_port *p)
>  	if (dma->rx_running)
>  		return 0;
>  
> +	serial8250_do_prepare_rx_dma(p);
> +
>  	desc = dmaengine_prep_slave_single(dma->rxchan, dma->rx_addr,
>  					   dma->rx_size, DMA_DEV_TO_MEM,
>  					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


