Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0138F4FF553
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 12:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235088AbiDMLB2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 07:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235072AbiDMLB0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 07:01:26 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D4A5AA46;
        Wed, 13 Apr 2022 03:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649847544; x=1681383544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=humrNH20r5IURvd4iK6tmUhFbpYYALMUtITPO8Mne4w=;
  b=Ihkm5t/nYOmtzv31MmDbykB+Ab9dXZjPMBhEf+CJtmg3PUpYVbhnobv9
   NeT2B6DURYWj37nu4+EMGAdLbsLYnA6E3UhFg1bkpkNM/f+b5ozJ3kgam
   rWIkP9sxHU495SIAFsqIeYSAIOnYOGeoeknKw78b5aNB2AsPGywnRAQBr
   w4RvYBXS2LeVyPilil3GSx7BLhXacxl7CwkuCQ+mSeXlznJG4SeKA1AQS
   GKdvRmucxT7GW0ZkjKA1MYdnn5IpGQKFxF/eX/IIU2dLaJrTRWAmitQgf
   R5eSaTkp+8IPaaz25dwy27N75L0FNIk+y9cOCjNymOp/TFSR8Z9ZF6h2Y
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="261483789"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="261483789"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 03:59:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="724856751"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 03:59:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1neaef-001nVo-9N;
        Wed, 13 Apr 2022 13:55:21 +0300
Date:   Wed, 13 Apr 2022 13:55:20 +0300
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
Subject: Re: [PATCH v5 08/11] serial: 8250: dw: Move the IO accessors to
 8250_dwlib.h
Message-ID: <YlasGPvSUGUDqcfM@smile.fi.intel.com>
References: <20220413075141.72777-1-miquel.raynal@bootlin.com>
 <20220413075141.72777-9-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220413075141.72777-9-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 13, 2022 at 09:51:38AM +0200, Miquel Raynal wrote:
> These accessors should be used instead of the regular readl/writel()
> helpers. In order to use them also from 8250_dw.c in this directory,
> move the helpers to 8250_dwlib.h
> 
> There is no functional change.
> 
> There is no need for declaring `struct uart_port` or even UPIO_MEM32BE
> which both are already included in the 8250_dwlib.h header by 8250.h.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/tty/serial/8250/8250_dwlib.c | 16 ----------------
>  drivers/tty/serial/8250/8250_dwlib.h | 16 ++++++++++++++++
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
> index 22154b5848d5..02b6422c26c7 100644
> --- a/drivers/tty/serial/8250/8250_dwlib.c
> +++ b/drivers/tty/serial/8250/8250_dwlib.c
> @@ -3,7 +3,6 @@
>  
>  #include <linux/bitops.h>
>  #include <linux/device.h>
> -#include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/serial_8250.h>
>  #include <linux/serial_core.h>
> @@ -32,21 +31,6 @@
>  /* Helper for FIFO size calculation */
>  #define DW_UART_CPR_FIFO_SIZE(a)	(((a >> 16) & 0xff) * 16)
>  
> -static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)
> -{
> -	if (p->iotype == UPIO_MEM32BE)
> -		return ioread32be(p->membase + offset);
> -	return readl(p->membase + offset);
> -}
> -
> -static inline void dw8250_writel_ext(struct uart_port *p, int offset, u32 reg)
> -{
> -	if (p->iotype == UPIO_MEM32BE)
> -		iowrite32be(reg, p->membase + offset);
> -	else
> -		writel(reg, p->membase + offset);
> -}
> -
>  /*
>   * divisor = div(I) + div(F)
>   * "I" means integer, "F" means fractional
> diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
> index 412f4e83e0b3..b2a7cff671bf 100644
> --- a/drivers/tty/serial/8250/8250_dwlib.h
> +++ b/drivers/tty/serial/8250/8250_dwlib.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
>  /* Synopsys DesignWare 8250 library header file. */
>  
> +#include <linux/io.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
> @@ -50,3 +51,18 @@ static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
>  {
>  	return container_of(data, struct dw8250_data, data);
>  }
> +
> +static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)
> +{
> +	if (p->iotype == UPIO_MEM32BE)
> +		return ioread32be(p->membase + offset);
> +	return readl(p->membase + offset);
> +}
> +
> +static inline void dw8250_writel_ext(struct uart_port *p, int offset, u32 reg)
> +{
> +	if (p->iotype == UPIO_MEM32BE)
> +		iowrite32be(reg, p->membase + offset);
> +	else
> +		writel(reg, p->membase + offset);
> +}
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


