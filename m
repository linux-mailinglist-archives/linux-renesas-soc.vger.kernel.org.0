Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80BA4FF566
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 13:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234077AbiDMLFO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 07:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbiDMLFN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 07:05:13 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B674A90F;
        Wed, 13 Apr 2022 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649847772; x=1681383772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A+XJCp5gQztNsa+OlESfmlMKh5d6N/D0xnWNY5ISf2M=;
  b=OqZcf8B6DP9h7kKUninFCJaRVr4Ea02Yh3Nmgq4T0tNMPAzgkVmCyYv9
   yJZ0MQWOchvjJipCp2BoMeSibfrmY9Z6ppx0PdeGFCCQhyCeOsr60g6OX
   +Wf57nzExJ4YD/vuZ3BDg+qEY0G8EpRuVJZXMdsxG8wATsvc6h0hbOK22
   wCOS5J121yNEog0HYwW53G/UmyEGhLgBlc6LnB1yzgGjC3Suvgj40zTlM
   XqM7kNYU3R/RVSVwb3GjwU8Xn+2H6Vinj/tFxy1uz7i8bAduekgEyw2gH
   bm1CadJ9oRreuOnmiwroP8hce1bS4fXYpZY1bD8DIIiIHMB9b2LAeDeda
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="249925070"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="249925070"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 04:02:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="802646302"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 04:02:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1neai8-001nXu-Cb;
        Wed, 13 Apr 2022 13:58:56 +0300
Date:   Wed, 13 Apr 2022 13:58:56 +0300
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
Subject: Re: [PATCH v5 09/11] serial: 8250: dw: Add support for DMA flow
 controlling devices
Message-ID: <Ylas8KubwVLEc2sz@smile.fi.intel.com>
References: <20220413075141.72777-1-miquel.raynal@bootlin.com>
 <20220413075141.72777-10-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413075141.72777-10-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 13, 2022 at 09:51:39AM +0200, Miquel Raynal wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> DW based controllers like the one on Renesas RZ/N1 must be programmed as
> flow controllers when using DMA.
> 
> * Table 11.45 of the system manual, "Flow Control Combinations", states
>   that using UART with DMA requires setting the DMA in the peripheral
>   flow controller mode regardless of the direction.
> 
> * Chapter 11.6.1.3 of the system manual, "Basic Interface Definitions",
>   explains that the burst size in the above case must be configured in
>   the peripheral's register DEST/SRC_BURST_SIZE.
> 
> Experiments shown that upon Rx timeout, the DMA transaction needed to be
> manually cleared as well.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
One remark below.

> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 64 +++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 238bcdf1bab0..f8e762e3ef0f 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -34,16 +34,28 @@
>  
>  /* Offsets for the DesignWare specific registers */
>  #define DW_UART_USR	0x1f /* UART Status Register */
> +#define DW_UART_DMASA	0xa8 /* DMA Software Ack */

> +#define RZN1_UART_TDMACR 0x10c /* DMA Control Register Transmit Mode */
> +#define RZN1_UART_RDMACR 0x110 /* DMA Control Register Receive Mode */

This group is different to the DW and OCTEON, but OCTEON starts with smaller
number. I dunno how this will be in the future and if it makes sense to order
now, i.e. to put these two after OCTEON group. In either case I'm fine.

>  #define OCTEON_UART_USR	0x27 /* UART Status Register */
>  
>  /* DesignWare specific register fields */
>  #define DW_UART_MCR_SIRE		BIT(6)
>  
> +/* Renesas specific register fields */
> +#define RZN1_UART_xDMACR_DMA_EN		BIT(0)
> +#define RZN1_UART_xDMACR_1_WORD_BURST	(0 << 1)
> +#define RZN1_UART_xDMACR_4_WORD_BURST	(1 << 1)
> +#define RZN1_UART_xDMACR_8_WORD_BURST	(3 << 1)
> +#define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
> +
>  /* Quirks */
>  #define DW_UART_QUIRK_OCTEON		BIT(0)
>  #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
>  #define DW_UART_QUIRK_SKIP_SET_RATE	BIT(2)
> +#define DW_UART_QUIRK_IS_DMA_FC		BIT(3)
>  
>  static inline struct dw8250_data *clk_to_dw8250_data(struct notifier_block *nb)
>  {
> @@ -226,6 +238,7 @@ static int dw8250_handle_irq(struct uart_port *p)
>  	struct dw8250_data *d = to_dw8250_data(p->private_data);
>  	unsigned int iir = p->serial_in(p, UART_IIR);
>  	bool rx_timeout = (iir & 0x3f) == UART_IIR_RX_TIMEOUT;
> +	unsigned int quirks = d->pdata->quirks;
>  	unsigned int status;
>  	unsigned long flags;
>  
> @@ -249,6 +262,15 @@ static int dw8250_handle_irq(struct uart_port *p)
>  		spin_unlock_irqrestore(&p->lock, flags);
>  	}
>  
> +	/* Manually stop the Rx DMA transfer when acting as flow controller */
> +	if (quirks & DW_UART_QUIRK_IS_DMA_FC && up->dma && up->dma->rx_running && rx_timeout) {
> +		status = p->serial_in(p, UART_LSR);
> +		if (status & (UART_LSR_DR | UART_LSR_BI)) {
> +			dw8250_writel_ext(p, RZN1_UART_RDMACR, 0);
> +			dw8250_writel_ext(p, DW_UART_DMASA, 1);
> +		}
> +	}
> +
>  	if (serial8250_handle_irq(p, iir))
>  		return 1;
>  
> @@ -372,6 +394,42 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
>  	return param == chan->device->dev;
>  }
>  
> +static u32 dw8250_rzn1_get_dmacr_burst(int max_burst)
> +{
> +	if (max_burst >= 8)
> +		return RZN1_UART_xDMACR_8_WORD_BURST;
> +	else if (max_burst >= 4)
> +		return RZN1_UART_xDMACR_4_WORD_BURST;
> +	else
> +		return RZN1_UART_xDMACR_1_WORD_BURST;
> +}
> +
> +static void dw8250_prepare_tx_dma(struct uart_8250_port *p)
> +{
> +	struct uart_port *up = &p->port;
> +	struct uart_8250_dma *dma = p->dma;
> +	u32 val;
> +
> +	dw8250_writel_ext(up, RZN1_UART_TDMACR, 0);
> +	val = dw8250_rzn1_get_dmacr_burst(dma->txconf.dst_maxburst) |
> +	      RZN1_UART_xDMACR_BLK_SZ(dma->tx_size) |
> +	      RZN1_UART_xDMACR_DMA_EN;
> +	dw8250_writel_ext(up, RZN1_UART_TDMACR, val);
> +}
> +
> +static void dw8250_prepare_rx_dma(struct uart_8250_port *p)
> +{
> +	struct uart_port *up = &p->port;
> +	struct uart_8250_dma *dma = p->dma;
> +	u32 val;
> +
> +	dw8250_writel_ext(up, RZN1_UART_RDMACR, 0);
> +	val = dw8250_rzn1_get_dmacr_burst(dma->rxconf.src_maxburst) |
> +	      RZN1_UART_xDMACR_BLK_SZ(dma->rx_size) |
> +	      RZN1_UART_xDMACR_DMA_EN;
> +	dw8250_writel_ext(up, RZN1_UART_RDMACR, val);
> +}
> +
>  static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>  {
>  	struct device_node *np = p->dev->of_node;
> @@ -404,6 +462,12 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>  			p->serial_out = dw8250_serial_out38x;
>  		if (quirks & DW_UART_QUIRK_SKIP_SET_RATE)
>  			p->set_termios = dw8250_do_set_termios;
> +		if (quirks & DW_UART_QUIRK_IS_DMA_FC) {
> +			data->data.dma.txconf.device_fc = 1;
> +			data->data.dma.rxconf.device_fc = 1;
> +			data->data.dma.prepare_tx_dma = dw8250_prepare_tx_dma;
> +			data->data.dma.prepare_rx_dma = dw8250_prepare_rx_dma;
> +		}
>  
>  	} else if (acpi_dev_present("APMC0D08", NULL, -1)) {
>  		p->iotype = UPIO_MEM32;
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


