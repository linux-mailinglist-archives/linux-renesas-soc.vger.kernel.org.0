Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA21690B91
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 15:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbjBIOVA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 09:21:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbjBIOVA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 09:21:00 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2692D5ACF3;
        Thu,  9 Feb 2023 06:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675952459; x=1707488459;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3OKG+SLB6cKWJv5MA0soRqwY5z5cwII5yrQWmN8hNlI=;
  b=mbPJMavT04F93AiFNGMEtKnyt6Hx5dOYrSLuzp5iUdzlBeyjcXO4a0eG
   Ho2MzDsfp8z6KOffDIXqrTZpiIOAndRE/yxjEW3DMHz5WGurNU9BBBGNV
   wDE7t5QJfD9Fy4FUtLh5rFJxZhOfcNOgLNdrLrsONJsF6vwyQ88zF7fta
   OniKDi+5gpUI9vY0x4xfDG+AJjVxpjhuEkMJsWH7o+iTD2MED0Fpg4yEJ
   4NZdMRovRHls+KJZOivypktj/w8Tsnc8yThiegl7J2ieoi/oq0NaoRwHj
   k2UFnJmEGzVGQ0VIoMwgKp9HmfIdU6USBO3QdIqSH9e87QQjcVZKmx8Yj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="318115361"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="318115361"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 06:09:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="810357643"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="810357643"
Received: from enguerra-mobl.ger.corp.intel.com ([10.249.36.120])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 06:09:03 -0800
Date:   Thu, 9 Feb 2023 16:08:57 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Wander Lairson Costa <wander@redhat.com>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
In-Reply-To: <20230209132630.194947-2-biju.das.jz@bp.renesas.com>
Message-ID: <4470e054-ebe6-b3ca-ffd7-1c7c3ae09f1a@linux.intel.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com> <20230209132630.194947-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 9 Feb 2023, Biju Das wrote:

> Add identification support for RZ/V2M 16750 UART.
> 
> Currently, RZ/V2M UART is detected as 16550A instead of 16750.
> "a4040000.serial: ttyS0 at MMIO 0xa4040000 (irq = 14, base_baud = 3000000)
> is a 16550A"
> 
> After adding identification support, it is detected as
> "a4040000.serial: ttyS0 at MMIO 0xa4040000 (irq = 24, base_baud = 3000000)
> is a Renesas RZ/V2M 16750".
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/tty/serial/8250/8250_port.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index e61753c295d5..e4b205e3756b 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -111,6 +111,15 @@ static const struct serial8250_config uart_config[] = {
>  		.rxtrig_bytes	= {1, 16, 32, 56},
>  		.flags		= UART_CAP_FIFO | UART_CAP_SLEEP | UART_CAP_AFE,
>  	},
> +	[PORT_16750] = {
> +		.name		= "Renesas RZ/V2M 16750",
> +		.fifo_size	= 64,
> +		.tx_loadsz	= 64,
> +		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10 |
> +				  UART_FCR7_64BYTE,
> +		.rxtrig_bytes	= {1, 16, 32, 56},
> +		.flags		= UART_CAP_FIFO | UART_CAP_AFE,
> +	},

Eh, how can you reuse [PORT_16750] again in the initializer like that?

-- 
 i.

>  	[PORT_STARTECH] = {
>  		.name		= "Startech",
>  		.fifo_size	= 1,
> @@ -1142,6 +1151,24 @@ static void autoconfig_16550a(struct uart_8250_port *up)
>  		return;
>  	}
>  
> +	/*
> +	 * No EFR.  Try to detect a Renesas RZ/V2M 16750, which only sets bit 5
> +	 * of the IIR when 64 byte FIFO mode is enabled.
> +	 * Try setting/clear bit5 of FCR.
> +	 */
> +	serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO);
> +	status1 = serial_in(up, UART_IIR) & (UART_IIR_64BYTE_FIFO | UART_IIR_FIFO_ENABLED);
> +
> +	serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO | UART_FCR7_64BYTE);
> +	status2 = serial_in(up, UART_IIR) & (UART_IIR_64BYTE_FIFO | UART_IIR_FIFO_ENABLED);
> +
> +	if (status1 == UART_IIR_FIFO_ENABLED_16550A &&
> +	    status2 == (UART_IIR_64BYTE_FIFO | UART_IIR_FIFO_ENABLED_16550A)) {
> +		up->port.type = PORT_16750;
> +		up->capabilities |= UART_CAP_AFE;
> +		return;
> +	}
> +
>  	/*
>  	 * Try writing and reading the UART_IER_UUE bit (b6).
>  	 * If it works, this is probably one of the Xscale platform's
> 

