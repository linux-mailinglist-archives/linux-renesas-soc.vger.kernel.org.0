Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 359624D518A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 20:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbiCJS2E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 13:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238705AbiCJS2D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 13:28:03 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD210158D96;
        Thu, 10 Mar 2022 10:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646936820; x=1678472820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XAlKDXqiQfOaTdOU/lfgyFC9vnJAIdUuMofC2PNYdto=;
  b=nxA9JkHe73ESMmtFJJ83iXy8qii36V6K+hn+l7YazOS0QQnMRJ3wreI0
   PGKnapBsBo3sVRImtTwHS3Vk32UUCCmKntFgJJRCeWIsnRsDitLnydSDF
   ENiVv95j7vWD7j9nZZ9P5evB9ZdTI6Tb2HROJq9Kz28AVQnFPsAukjpM8
   YwRwDTEAbrtJcwr6lNeolWyFPYb88yS9pfokZ2p5c6itUskIZockxQKPE
   aCS9egnCUaxYgIg/uHlKjciCfZT6QU0SSUfLSxGrYMTegOLjABwHmVLec
   rkamAUAHun6huPtcXVts+wGewTXzAwdMUP3ZLx2zev/ImznT8M4W6URWz
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="235935896"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="235935896"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 10:26:40 -0800
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="511007377"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 10:26:36 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nSNU1-00Es0O-DU;
        Thu, 10 Mar 2022 20:25:53 +0200
Date:   Thu, 10 Mar 2022 20:25:52 +0200
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
Subject: Re: [PATCH 6/7] serial: 8250_dw: Add support for RZ/N1 DMA
Message-ID: <YipCsO+UMcGOqLaG@smile.fi.intel.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
 <20220310161650.289387-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310161650.289387-7-miquel.raynal@bootlin.com>
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

On Thu, Mar 10, 2022 at 05:16:49PM +0100, Miquel Raynal wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> The Renesas RZ/N1 devices have a modified Synopsys DW UART. The
> modifications are mostly related to the DMA handlnig, and so this patch
> adds support for DMA.

> The RZ/N1 UART must be used with the peripheral as the flow
> controller.

(1)

> This means the DMA length should also be programmed into
> UART registers.

(2)

Hmm... DMA controller vs. Peripheral flow control is about signalling on the HW
level on who starts the transaction. This is programmed in the DMA controller
device driver. Is it what you do in DesignWare DMA patch series?

Ah, I see now, you set fc here.

But still it's not clear how (2) and (1) are related.

> Aside from this, there are some points to note about DMA burst sizes.
> First, DMA must not remove all of the data from the rx FIFO. Otherwise,
> we do not get a 'character timeout' interrupt, and so do not know that
> we should push data up the serial stack. Therefore, we have the rx
> threshold for generating an interrupt set to half the FIFO depth (this
> is the default for 16550A), and set the DMA burst size when reading the
> FIFO to a quarter of the FIFO depth.
> 
> Second, when transmitting data using DMA, the burst size must be limited
> to 1 byte to handle then case when transmitting just 1 byte. Otherwise
> the DMA doesn't complete the burst, and nothing happens.

...

> +/* Offsets for the Renesas RZ/N1 DesignWare specific registers */
> +/* DMA Software Ack */
> +#define RZN1_UART_DMASA			0xa8

Is it specific to Renesas? IIRC it's Synopsys DesignWare register, makes
sense to use appropriate prefix or no prefix.

...

> +#define RZN1_UART_xDMACR_1_WORD_BURST	0
> +#define RZN1_UART_xDMACR_4_WORD_BURST	BIT(1)
> +#define RZN1_UART_xDMACR_8_WORD_BURST	(BIT(1) | BIT(2))

This looks like incorrect use of BIT() macro.
Please, use plain decimal integers. Something like

	1	(0 << 1)
	4	(1 << 1)
	8	(3 << 1)

If I'm mistaken, describe the meaning of each bit there.

...

> +static void rzn1_8250_handle_irq(struct uart_port *port, unsigned int iir)
> +{
> +	struct uart_8250_port *up = up_to_u8250p(port);
> +	struct uart_8250_dma *dma = up->dma;
> +	unsigned char status;

> +	if (up->dma && dma->rx_running) {

With

	if (!)up->dma && dma->rx_running))
		return;

maybe easier to read the rest.

> +		status = port->serial_in(port, UART_LSR);
> +		if (status & (UART_LSR_DR | UART_LSR_BI)) {
> +			/* Stop the DMA transfer */
> +			writel(0, port->membase + RZN1_UART_RDMACR);
> +			writel(1, port->membase + RZN1_UART_DMASA);
> +		}
> +	}
> +}

...

> +	if (d->is_rzn1 && ((iir & 0x3f) == UART_IIR_RX_TIMEOUT))
> +		rzn1_8250_handle_irq(p, iir);

A few years ago it was a discussion about broken timeout on some platforms
with Synopsys DesignWare UART + DMA. Can it be that this is actually required
for all of them that uses same combination of IPs?

...

> +static u32 rzn1_get_dmacr_burst(int max_burst)
> +{

> +	u32 val = 0;

Redundant assignment and variable itself. Use return statements directly.

> +	if (max_burst >= 8)
> +		val = RZN1_UART_xDMACR_8_WORD_BURST;
> +	else if (max_burst >= 4)
> +		val = RZN1_UART_xDMACR_4_WORD_BURST;
> +	else
> +		val = RZN1_UART_xDMACR_1_WORD_BURST;
> +
> +	return val;
> +}

...

> +static int rzn1_dw8250_tx_dma(struct uart_8250_port *p)
> +{
> +	struct uart_port		*up = &p->port;
> +	struct uart_8250_dma		*dma = p->dma;
> +	struct circ_buf			*xmit = &p->port.state->xmit;
> +	int tx_size;
> +	u32 val;
> +
> +	if (uart_tx_stopped(&p->port) || dma->tx_running ||
> +	    uart_circ_empty(xmit))
> +		return 0;
> +
> +	tx_size = CIRC_CNT_TO_END(xmit->head, xmit->tail, UART_XMIT_SIZE);

> +	writel(0, up->membase + RZN1_UART_TDMACR);
> +	val = rzn1_get_dmacr_burst(dma->txconf.dst_maxburst);
> +	val |= tx_size << RZN1_UART_xDMACR_BLK_SZ_OFFSET;
> +	val |= RZN1_UART_xDMACR_DMA_EN;
> +	writel(val, up->membase + RZN1_UART_TDMACR);

Can this be added as a callback to the serial8250_tx_dma()?
Ditto for Rx counterpart.

> +	return serial8250_tx_dma(p);
> +}

...

> +	data->is_rzn1 = of_device_is_compatible(dev->of_node, "renesas,rzn1-uart");

Device property API.

>  	/* Always ask for fixed clock rate from a property. */
>  	device_property_read_u32(dev, "clock-frequency", &p->uartclk);

-- 
With Best Regards,
Andy Shevchenko


