Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF284EEBE2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 12:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345199AbiDAK6w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 06:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244272AbiDAK6w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 06:58:52 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1758826B3AD;
        Fri,  1 Apr 2022 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648810621; x=1680346621;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5FJzMWBGQ//xzF1sSbPPyai5Ulzm/2PfDun4fIr6bUI=;
  b=MlrpST4AkelMjpGmBOr0ldbzoHYxKI92rvoyyNDnVNzv6cGYtCxayYpT
   wpdDULiXp1Oq93xEEsTs+dFTOVetv9b0umoylCeQhjqTGtkP3/JSue6Pv
   glMc11F5qv+dJojmNAEajHq8qyLJMsfh5C9U/mBbGl40nXitDHftErtAO
   gCUxKYDuoXKVG2Zs+vPGb6x6xvEEJAzlt2MnbS/VoGIv72kd8b5776nzG
   xLzxoOSoSaT/z4Bwou5dtBskRtfqxrMjiu/oij6kcKqwiiE55Pz6tjK6Y
   ZsqTxgyQ4YDXQI6J8JBTj3UOwxK6Ib28bU8EVExoWaEuOEFsH7JrR4JJG
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="247612605"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; 
   d="scan'208";a="247612605"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 03:57:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; 
   d="scan'208";a="567389981"
Received: from elsaidmo-mobl1.ger.corp.intel.com ([10.252.40.187])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 03:56:55 -0700
Date:   Fri, 1 Apr 2022 13:56:49 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-serial <linux-serial@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: Re: [PATCH v4 7/9] serial: 8250: dw: Add support for DMA flow
 controlling devices
In-Reply-To: <20220330132038.808679-8-miquel.raynal@bootlin.com>
Message-ID: <24becf8-82c5-5a12-690-5b9e067ec1c@linux.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com> <20220330132038.808679-8-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 30 Mar 2022, Miquel Raynal wrote:

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
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 64 +++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index a156c6d2f866..977a473535e8 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -34,14 +34,26 @@
>  
>  /* Offsets for the DesignWare specific registers */
>  #define DW_UART_USR	0x1f /* UART Status Register */
> +#define DW_UART_DMASA	0xa8 /* DMA Software Ack */
> +
> +#define RZN1_UART_TDMACR 0x10c /* DMA Control Register Transmit Mode */
> +#define RZN1_UART_RDMACR 0x110 /* DMA Control Register Receive Mode */
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
> @@ -224,6 +236,7 @@ static int dw8250_handle_irq(struct uart_port *p)
>  	struct dw8250_data *d = to_dw8250_data(p->private_data);
>  	unsigned int iir = p->serial_in(p, UART_IIR);
>  	bool rx_timeout = (iir & 0x3f) == UART_IIR_RX_TIMEOUT;
> +	unsigned int quirks = d->pdata->quirks;
>  	unsigned int status;
>  	unsigned long flags;
>  
> @@ -247,6 +260,15 @@ static int dw8250_handle_irq(struct uart_port *p)
>  		spin_unlock_irqrestore(&p->lock, flags);
>  	}
>  
> +	/* Manually stop the Rx DMA transfer when acting as flow controller */
> +	if (up->dma && up->dma->rx_running && rx_timeout && quirks & DW_UART_QUIRK_IS_DMA_FC) {
> +		status = p->serial_in(p, UART_LSR);
> +		if (status & (UART_LSR_DR | UART_LSR_BI)) {
> +			writel(0, p->membase + RZN1_UART_RDMACR);
> +			writel(1, p->membase + DW_UART_DMASA);

Currently there is serial_out(), dw8250_writel_ext(), and a few writel()s 
too for writing to registers. It would be nice to move towards more 
homogeneous approach rather than adding more writel()s.

I suggest dw8250_writel_ext() is moved to dwlib.h. Then it could be used 
here (and dw8250_readl_ext() too should be moved but IIRC there wasn't 
any reads added by this series).

-- 
 i.

