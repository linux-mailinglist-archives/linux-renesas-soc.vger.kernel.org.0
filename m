Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1484EC631
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 16:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344299AbiC3OLA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 10:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346620AbiC3OKt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:10:49 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3070C1AE614;
        Wed, 30 Mar 2022 07:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648649344; x=1680185344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ppXtG78gcagRxH0GizMycd2tyke4vj55zM9MOpyQ9bU=;
  b=LFdkW599yrC/pB+St1t71UAgF7hjPyEWL9/ULeouLUQElPzMB3Zy6rB0
   SmzfHaedb6kUi20bUI8Sj9iQ2H4OXBDFCQIqVO/8m/7+zLLie1lDHqMdr
   qXrXb47YsWigy3qfgSRm+LWZze01KpeyyAyMxGtYTrIHUr8tUv5NR5nKW
   Fep9Q81Ugug2nNm9VkF3JKYuMNl1HwXHSoTTIdJzP6kLSZwoK7jSvg4Tr
   D1euyr6cT+nvE8QjffEsCQr4pVaYsWan2nPdCAKLS6Z0bMxMdF4NjrnAC
   HpJFzhOfAwWMjnFt1B209jTdipA5k+UGkjlUooGBHsWW+q9YGa7Q6dB7f
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="247051071"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="247051071"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:09:03 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="649879235"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:08:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZYzq-009RU8-7f;
        Wed, 30 Mar 2022 17:08:26 +0300
Date:   Wed, 30 Mar 2022 17:08:25 +0300
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
Subject: Re: [PATCH v4 1/9] serial: 8250: dw: Move definitions to the shared
 header
Message-ID: <YkRkWQCPUMWTbOzg@smile.fi.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
 <20220330132038.808679-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330132038.808679-2-miquel.raynal@bootlin.com>
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

On Wed, Mar 30, 2022 at 03:20:30PM +0200, Miquel Raynal wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> Move the per-device structure and a helper out of the main .c file, into
> a shared header as they will both be reused from another .c file.
> 
> There is no functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> [miquel.raynal@bootlin.com: Extracted from a bigger change]
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c    | 21 ---------------------
>  drivers/tty/serial/8250/8250_dwlib.h | 26 ++++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 96a62e95726b..1666041513a5 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -42,27 +42,6 @@
>  #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
>  #define DW_UART_QUIRK_SKIP_SET_RATE	BIT(2)
>  
> -struct dw8250_data {
> -	struct dw8250_port_data	data;
> -
> -	u8			usr_reg;
> -	int			msr_mask_on;
> -	int			msr_mask_off;
> -	struct clk		*clk;
> -	struct clk		*pclk;
> -	struct notifier_block	clk_notifier;
> -	struct work_struct	clk_work;
> -	struct reset_control	*rst;
> -
> -	unsigned int		skip_autocfg:1;
> -	unsigned int		uart_16550_compatible:1;
> -};
> -
> -static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
> -{
> -	return container_of(data, struct dw8250_data, data);
> -}
> -
>  static inline struct dw8250_data *clk_to_dw8250_data(struct notifier_block *nb)
>  {
>  	return container_of(nb, struct dw8250_data, clk_notifier);
> diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
> index 83d528e5cc21..72e7dbcccad0 100644
> --- a/drivers/tty/serial/8250/8250_dwlib.h
> +++ b/drivers/tty/serial/8250/8250_dwlib.h
> @@ -1,10 +1,15 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
>  /* Synopsys DesignWare 8250 library header file. */
>  
> +#include <linux/notifier.h>
>  #include <linux/types.h>
> +#include <linux/workqueue.h>
>  
>  #include "8250.h"
>  
> +struct clk;
> +struct reset_control;
> +
>  struct dw8250_port_data {
>  	/* Port properties */
>  	int			line;
> @@ -16,5 +21,26 @@ struct dw8250_port_data {
>  	u8			dlf_size;
>  };
>  
> +struct dw8250_data {
> +	struct dw8250_port_data	data;
> +
> +	u8			usr_reg;
> +	int			msr_mask_on;
> +	int			msr_mask_off;
> +	struct clk		*clk;
> +	struct clk		*pclk;
> +	struct notifier_block	clk_notifier;
> +	struct work_struct	clk_work;
> +	struct reset_control	*rst;
> +
> +	unsigned int		skip_autocfg:1;
> +	unsigned int		uart_16550_compatible:1;
> +};
> +
>  void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, struct ktermios *old);
>  void dw8250_setup_port(struct uart_port *p);
> +
> +static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
> +{
> +	return container_of(data, struct dw8250_data, data);
> +}
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


