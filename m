Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7435A4EB128
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 17:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239108AbiC2QBU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 12:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236624AbiC2QBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 12:01:10 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA108140DE;
        Tue, 29 Mar 2022 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648569567; x=1680105567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gNHHB7leAHtb7Q/wj8FnI4OMlNWqrpOwN82fZxOmZh8=;
  b=LfAXo56pcDgHwzJuN/iJnngRmDqM9zq2S18YfMq7UkXF4lUWbi/g0yIF
   V7kYQJaLqjNYboWOEsBBClSwPWTPPoBxooESWr2AS7nN/LgsUv1/cWH7X
   gAdggwtLkoWiyjicsSm4k3q7rbrs16yk8u+4tYGczsD0cU/BQ6JUXvOvt
   Lcq54FpGrYGmBQZ5+8UninaYW2KU9zjE1pWXJhf/6w9ejHGOO+n53WO7b
   /bFyrsb4MSzWAc9dAwU03wiafzEe8b5OLDUj3vcnPW+FQMGBClfM/Lg1U
   2U4biOFIDL+8GoNOlNS/RF6yvnFNBPXgNSswG306JYx+zfZBiTyN5koYk
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="241437634"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="241437634"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 08:59:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="653065178"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 08:59:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZEF7-008qMZ-Ve;
        Tue, 29 Mar 2022 18:58:49 +0300
Date:   Tue, 29 Mar 2022 18:58:49 +0300
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
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: Re: [PATCH v3 08/10] serial: 8250: dw: Add support for DMA flow
 controlling devices
Message-ID: <YkMsubn0I7TOT0KC@smile.fi.intel.com>
References: <20220329152430.756947-1-miquel.raynal@bootlin.com>
 <20220329152430.756947-9-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329152430.756947-9-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 29, 2022 at 05:24:28PM +0200, Miquel Raynal wrote:
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

...

>  #define DW_UART_USR	0x1f /* UART Status Register */
> +#define DW_UART_DMASA	0xa8 /* DMA Software Ack */
> +#define RZN1_UART_TDMACR 0x10c /* DMA Control Register Transmit Mode */
> +#define RZN1_UART_RDMACR 0x110 /* DMA Control Register Receive Mode */

Yep!

Since it seems we may have a v4, I would add a blank line between Synopsys
and custom register groups.

...

>  #define DW_UART_QUIRK_OCTEON		BIT(0)
>  #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
>  #define DW_UART_QUIRK_SKIP_SET_RATE	BIT(2)
> +#define DW_UART_QUIRK_IS_DMA_FLOW_CONTROLLER BIT(3)

Seems the last has no TAB in it. It may require to indent the above as well.
Alternatively you may rename FLOW_CONTROLLER --> FC and add a comment on top
to explain this.

...

> +	const struct dw8250_platform_data *pdata = device_get_match_data(p->dev);

Third one!

> +	/* Manually stop the Rx DMA transfer when acting as flow controller */
> +	if (up->dma && up->dma->rx_running && rx_timeout && pdata &&
> +	    pdata->quirks & DW_UART_QUIRK_IS_DMA_FLOW_CONTROLLER) {

For example,

	unsigned int quirks = data->pdata.quirks;

	if (up->dma && up->dma->rx_running && rx_timeout && quirks & DW_UART_QUIRK_IS_DMA_FC) {

(It's also fine to have that on one line)

> +		status = p->serial_in(p, UART_LSR);
> +		if (status & (UART_LSR_DR | UART_LSR_BI)) {
> +			writel(0, p->membase + RZN1_UART_RDMACR);
> +			writel(1, p->membase + DW_UART_DMASA);
> +		}
> +	}

-- 
With Best Regards,
Andy Shevchenko


