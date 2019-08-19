Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A60B6920B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 11:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfHSJvv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 05:51:51 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:60998 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfHSJvv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 05:51:51 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 123D625AF0E;
        Mon, 19 Aug 2019 19:51:49 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D24679406ED; Mon, 19 Aug 2019 11:51:46 +0200 (CEST)
Date:   Mon, 19 Aug 2019 11:51:46 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Richard Genoud <richard.genoud@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] serial: sh-sci: Don't check for
 mctrl_gpio_to_gpiod() returning error
Message-ID: <20190819095146.2g4sd732sqesnbs2@verge.net.au>
References: <20190814092757.13726-1-geert+renesas@glider.be>
 <20190814092924.13857-1-geert+renesas@glider.be>
 <20190814092924.13857-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814092924.13857-4-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 14, 2019 at 11:29:24AM +0200, Geert Uytterhoeven wrote:
> Since commit 1d267ea6539f2663 ("serial: mctrl-gpio: simplify init
> routine"), mctrl_gpio_init() returns failure if the assignment to any
> member of the gpio array results in an error pointer.
> Since commit c359522194593815 ("serial: mctrl_gpio: Avoid probe failures
> in case of missing gpiolib"), mctrl_gpio_to_gpiod() returns NULL in the
> !CONFIG_GPIOLIB case.
> Hence there is no longer a need to check for mctrl_gpio_to_gpiod()
> returning an error value.  A simple NULL check is sufficient.
> 
> This follows the spirit of commit 445df7ff3fd1a0a9 ("serial: mctrl-gpio:
> drop usages of IS_ERR_OR_NULL") in the mctrl-gpio core.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/tty/serial/sh-sci.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 7f565fcbf1ca4c5e..4e754a4850e6db63 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2099,12 +2099,12 @@ static unsigned int sci_get_mctrl(struct uart_port *port)
>  	if (s->autorts) {
>  		if (sci_get_cts(port))
>  			mctrl |= TIOCM_CTS;
> -	} else if (IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(gpios, UART_GPIO_CTS))) {
> +	} else if (!mctrl_gpio_to_gpiod(gpios, UART_GPIO_CTS)) {
>  		mctrl |= TIOCM_CTS;
>  	}
> -	if (IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(gpios, UART_GPIO_DSR)))
> +	if (!mctrl_gpio_to_gpiod(gpios, UART_GPIO_DSR))
>  		mctrl |= TIOCM_DSR;
> -	if (IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(gpios, UART_GPIO_DCD)))
> +	if (!mctrl_gpio_to_gpiod(gpios, UART_GPIO_DCD))
>  		mctrl |= TIOCM_CAR;
>  
>  	return mctrl;
> @@ -3285,10 +3285,8 @@ static int sci_probe_single(struct platform_device *dev,
>  		return PTR_ERR(sciport->gpios);
>  
>  	if (sciport->has_rtscts) {
> -		if (!IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(sciport->gpios,
> -							UART_GPIO_CTS)) ||
> -		    !IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(sciport->gpios,
> -							UART_GPIO_RTS))) {
> +		if (mctrl_gpio_to_gpiod(sciport->gpios, UART_GPIO_CTS) ||
> +		    mctrl_gpio_to_gpiod(sciport->gpios, UART_GPIO_RTS)) {
>  			dev_err(&dev->dev, "Conflicting RTS/CTS config\n");
>  			return -EINVAL;
>  		}
> -- 
> 2.17.1
> 
