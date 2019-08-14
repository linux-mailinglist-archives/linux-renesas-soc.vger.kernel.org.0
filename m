Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7A68D1B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Aug 2019 13:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbfHNLIU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Aug 2019 07:08:20 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45199 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfHNLIU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 07:08:20 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hxr8R-0006S4-9I; Wed, 14 Aug 2019 13:08:07 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hxr8O-0000eI-EU; Wed, 14 Aug 2019 13:08:04 +0200
Date:   Wed, 14 Aug 2019 13:08:04 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Richard Genoud <richard.genoud@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 1/3] serial: atmel: Don't check for mctrl_gpio_to_gpiod()
 returning error
Message-ID: <20190814110804.2ceo2upc3su7muup@pengutronix.de>
References: <20190814092757.13726-1-geert+renesas@glider.be>
 <20190814092924.13857-1-geert+renesas@glider.be>
 <20190814092924.13857-2-geert+renesas@glider.be>
 <20190814093558.xlx5ck54dw2dgb6k@pengutronix.de>
 <CAMuHMdWNj-H9B8E9=NeCgLracBuJODfPyBYJERh=vt4oNFUkGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWNj-H9B8E9=NeCgLracBuJODfPyBYJERh=vt4oNFUkGw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 14, 2019 at 12:20:33PM +0200, Geert Uytterhoeven wrote:
> Hi Uwe,
> 
> On Wed, Aug 14, 2019 at 11:36 AM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Wed, Aug 14, 2019 at 11:29:22AM +0200, Geert Uytterhoeven wrote:
> > > Since commit 1d267ea6539f2663 ("serial: mctrl-gpio: simplify init
> > > routine"), mctrl_gpio_init() returns failure if the assignment to any
> > > member of the gpio array results in an error pointer.
> > > Since commit c359522194593815 ("serial: mctrl_gpio: Avoid probe failures
> > > in case of missing gpiolib"), mctrl_gpio_to_gpiod() returns NULL in the
> > > !CONFIG_GPIOLIB case.
> > > Hence there is no longer a need to check for mctrl_gpio_to_gpiod()
> > > returning an error value.  A simple NULL check is sufficient.
> > >
> > > This follows the spirit of commit 445df7ff3fd1a0a9 ("serial: mctrl-gpio:
> > > drop usages of IS_ERR_OR_NULL") in the mctrl-gpio core.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  drivers/tty/serial/atmel_serial.c | 12 ++++--------
> > >  1 file changed, 4 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> > > index 19a85d6fe3d20541..e9620a81166b7dc1 100644
> > > --- a/drivers/tty/serial/atmel_serial.c
> > > +++ b/drivers/tty/serial/atmel_serial.c
> > > @@ -303,32 +303,28 @@ static unsigned int atmel_get_lines_status(struct uart_port *port)
> > >
> > >       mctrl_gpio_get(atmel_port->gpios, &ret);
> > >
> > > -     if (!IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(atmel_port->gpios,
> > > -                                             UART_GPIO_CTS))) {
> > > +     if (mctrl_gpio_to_gpiod(atmel_port->gpios, UART_GPIO_CTS)) {
> > >               if (ret & TIOCM_CTS)
> > >                       status &= ~ATMEL_US_CTS;
> > >               else
> > >                       status |= ATMEL_US_CTS;
> > >       }
> >
> > The change is fine, but it seems the atmel driver doesn't use mctrl_gpio
> > as expected (at least as expected by me). IMHO driving the hardware
> > function of the CTS pin shouldn't be conditional on the presence of a
> > cts-gpio. Is there a reason not to just drop the if completely?
> 
> The above code returns the hardware status if CTS is not a GPIO, and
> returns (overrides with) the GPIO status if CTS is a GPIO.
> Isn't that correct, or am I missing something?

I took a deeper look into this driver now. The task for
atmel_get_lines_status() isn't to implement the get_mctrl() callback.

Instead this is called in the irqhandler to set ATMEL_US_RI in a
"pending" value that then later in atmel_handle_status() is translated
to a "ring" event that is handled there.

So the right cleanup would be to let atmel_get_lines_status() just be

	return atmel_uart_readl(port, ATMEL_US_CSR);

. If something happend on the lines implemented as gpio the driver's irq
function isn't called anyhow.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
