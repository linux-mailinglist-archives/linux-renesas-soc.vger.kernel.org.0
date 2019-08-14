Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 603AB8D09E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Aug 2019 12:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfHNKUp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Aug 2019 06:20:45 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35664 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfHNKUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 06:20:45 -0400
Received: by mail-ot1-f66.google.com with SMTP id g17so30094257otl.2;
        Wed, 14 Aug 2019 03:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5lSlPgg3xC115OeKKRGpU0WE/kSSKOVNwSmAsaRTAXc=;
        b=oCb1t0OYxVupeP3rw/jb2S9oi/P+wrIIJhRvcpgBtnik32uKsAXdkgkwpH5w4zRonX
         tYuFwSI+Mf8GkNbEggbLHGdO1u9ThevPDdrgsxbvC730OEW4+TH9n15Exg5BWHETY3Bp
         IDdyROpbUn3eDKYpvyOYI2M+k0kucanXL+sn2a4ggDjNtpgEl5c67Fy49/t86eC934Wb
         ZhyLyCZMYdZP0hPvs7t5lM/a3tKK4RHLKwDFAqe4qpV0AE7VYsQt8vQZ7ANKJpOj6Y9j
         l0v6YSE4nJIXQqmTWbIn6Hrg4Ar8DkwUNX7iFajr2zYuj95VFnll5MwLuMPi83qaN2px
         p/Lg==
X-Gm-Message-State: APjAAAXf5SzAfCo54RZS8q/wSODmeetWAtg/es310SSQNy8K94xuoUT5
        W8eZgpIFYhvuwhEQL9sbrtmbHtJY0BkU47itp9s=
X-Google-Smtp-Source: APXvYqwp8nNz8kvOejBIjZmKo0UwGElSRWItdKkBCkr/K+Q1M2uPBbQY/Jc+cxAK9yij+FCXBzlHPzvd6LtG7yuVlAQ=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr26113661otk.145.1565778044448;
 Wed, 14 Aug 2019 03:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190814092757.13726-1-geert+renesas@glider.be>
 <20190814092924.13857-1-geert+renesas@glider.be> <20190814092924.13857-2-geert+renesas@glider.be>
 <20190814093558.xlx5ck54dw2dgb6k@pengutronix.de>
In-Reply-To: <20190814093558.xlx5ck54dw2dgb6k@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Aug 2019 12:20:33 +0200
Message-ID: <CAMuHMdWNj-H9B8E9=NeCgLracBuJODfPyBYJERh=vt4oNFUkGw@mail.gmail.com>
Subject: Re: [PATCH 1/3] serial: atmel: Don't check for mctrl_gpio_to_gpiod()
 returning error
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uwe,

On Wed, Aug 14, 2019 at 11:36 AM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> On Wed, Aug 14, 2019 at 11:29:22AM +0200, Geert Uytterhoeven wrote:
> > Since commit 1d267ea6539f2663 ("serial: mctrl-gpio: simplify init
> > routine"), mctrl_gpio_init() returns failure if the assignment to any
> > member of the gpio array results in an error pointer.
> > Since commit c359522194593815 ("serial: mctrl_gpio: Avoid probe failures
> > in case of missing gpiolib"), mctrl_gpio_to_gpiod() returns NULL in the
> > !CONFIG_GPIOLIB case.
> > Hence there is no longer a need to check for mctrl_gpio_to_gpiod()
> > returning an error value.  A simple NULL check is sufficient.
> >
> > This follows the spirit of commit 445df7ff3fd1a0a9 ("serial: mctrl-gpio:
> > drop usages of IS_ERR_OR_NULL") in the mctrl-gpio core.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/tty/serial/atmel_serial.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> > index 19a85d6fe3d20541..e9620a81166b7dc1 100644
> > --- a/drivers/tty/serial/atmel_serial.c
> > +++ b/drivers/tty/serial/atmel_serial.c
> > @@ -303,32 +303,28 @@ static unsigned int atmel_get_lines_status(struct uart_port *port)
> >
> >       mctrl_gpio_get(atmel_port->gpios, &ret);
> >
> > -     if (!IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(atmel_port->gpios,
> > -                                             UART_GPIO_CTS))) {
> > +     if (mctrl_gpio_to_gpiod(atmel_port->gpios, UART_GPIO_CTS)) {
> >               if (ret & TIOCM_CTS)
> >                       status &= ~ATMEL_US_CTS;
> >               else
> >                       status |= ATMEL_US_CTS;
> >       }
>
> The change is fine, but it seems the atmel driver doesn't use mctrl_gpio
> as expected (at least as expected by me). IMHO driving the hardware
> function of the CTS pin shouldn't be conditional on the presence of a
> cts-gpio. Is there a reason not to just drop the if completely?

The above code returns the hardware status if CTS is not a GPIO, and
returns (overrides with) the GPIO status if CTS is a GPIO.
Isn't that correct, or am I missing something?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
