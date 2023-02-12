Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50B386936F0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Feb 2023 12:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjBLLC7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 Feb 2023 06:02:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBLLC6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Feb 2023 06:02:58 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D577F10E7;
        Sun, 12 Feb 2023 03:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676199777; x=1707735777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YNjknh09RNMSAxmoN0WU44REvp3kR42Rx9R6FHV9/lg=;
  b=QpxOu0OZa+Hd44NXWlerRm0jLdqnapMGnMjcnS1kFAJKQfPpYFq/1Omc
   8Q8iy/lYmDJSHgaoL7yL7Gp9eUzHLSwDiQLbrWWnYeAtYtQPrgBo7vbbh
   UgOmxI75Z0VAlleWfT44lG4M/gMZJIevh//+ncnXaKDuwye0jiggaQg1r
   VJyHkMPlQLH6wc5cJ4nNXCCM82Hr3Dgn+/35C0p3tYdR+WkRk2kE91R16
   j7wrBkxiZc3BKWh/Z/wdY3xGDlPrPzjsen2q7Cnc50/zMb2KjMLn9qqmj
   H2UYqoAE01VYuwbprINMy05Fp+6ptBsSyfInBMmBlotwdEgerMm5XcnB+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="314349675"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="314349675"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 03:02:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="842476310"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="842476310"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 12 Feb 2023 03:02:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pRA8C-005pqO-1w;
        Sun, 12 Feb 2023 13:02:52 +0200
Date:   Sun, 12 Feb 2023 13:02:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-serial@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v3 2/3] serial: 8250_em: Update RZ/V2M port type as
 PORT_16750
Message-ID: <Y+jHXKGlIs1Fnj3x@smile.fi.intel.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230210203439.174913-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 10, 2023 at 08:34:38PM +0000, Biju Das wrote:
> The UART IP found on RZ/V2M SoC is Register-compatible with the
> general-purpose 16750 UART chip. This patch updates RZ/V2M
> port type from 16550A->16750 and also enables 64-bytes fifo support.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
> v2->v3:
>  * Replaced of_device_get_match_data()->device_get_match_data().
>  * Replaced of_device.h->property.h
>  * Dropped struct serial8250_em_hw_info *info from priv and started
>    using a local variable info in probe().
>  * Retained Rb tag from Ilpo as changes are trivial.
> v2:
>  * New patch
> ---
>  drivers/tty/serial/8250/8250_em.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
> index 9781bf73ed0c..69cd3b611501 100644
> --- a/drivers/tty/serial/8250/8250_em.c
> +++ b/drivers/tty/serial/8250/8250_em.c
> @@ -9,6 +9,7 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/property.h>
>  #include <linux/serial_8250.h>
>  #include <linux/serial_reg.h>
>  #include <linux/platform_device.h>
> @@ -19,6 +20,11 @@
>  #define UART_DLL_EM 9
>  #define UART_DLM_EM 10
>  
> +struct serial8250_em_hw_info {
> +	unsigned int type;
> +	upf_t flags;
> +};
> +
>  struct serial8250_em_priv {
>  	int line;
>  };
> @@ -76,6 +82,7 @@ static void serial8250_em_serial_dl_write(struct uart_8250_port *up, int value)
>  
>  static int serial8250_em_probe(struct platform_device *pdev)
>  {
> +	const struct serial8250_em_hw_info *info;
>  	struct serial8250_em_priv *priv;
>  	struct device *dev = &pdev->dev;
>  	struct uart_8250_port up;
> @@ -83,6 +90,8 @@ static int serial8250_em_probe(struct platform_device *pdev)
>  	struct clk *sclk;
>  	int irq, ret;
>  
> +	info = device_get_match_data(dev);
> +
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
> @@ -102,8 +111,8 @@ static int serial8250_em_probe(struct platform_device *pdev)
>  	memset(&up, 0, sizeof(up));
>  	up.port.mapbase = regs->start;
>  	up.port.irq = irq;
> -	up.port.type = PORT_UNKNOWN;
> -	up.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP;
> +	up.port.type = info->type;
> +	up.port.flags = info->flags;
>  	up.port.dev = dev;
>  	up.port.private_data = priv;
>  
> @@ -132,9 +141,20 @@ static int serial8250_em_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct serial8250_em_hw_info emma_mobile_uart_hw_info = {
> +	.type = PORT_UNKNOWN,
> +	.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP,
> +};
> +
> +static const struct serial8250_em_hw_info rzv2m_uart_hw_info = {
> +	.type = PORT_16750,
> +	.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP | UPF_FIXED_TYPE,
> +};
> +
>  static const struct of_device_id serial8250_em_dt_ids[] = {
> -	{ .compatible = "renesas,em-uart", },
> -	{},
> +	{ .compatible = "renesas,r9a09g011-uart", .data = &rzv2m_uart_hw_info },
> +	{ .compatible = "renesas,em-uart", .data = &emma_mobile_uart_hw_info },
> +	{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, serial8250_em_dt_ids);
>  
> -- 
> 2.25.1
> 
> 

-- 
With Best Regards,
Andy Shevchenko


