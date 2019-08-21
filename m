Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6303597FA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 18:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbfHUQEr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 12:04:47 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40459 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbfHUQEr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 12:04:47 -0400
Received: by mail-oi1-f196.google.com with SMTP id h21so1977691oie.7;
        Wed, 21 Aug 2019 09:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RynLZSvey/kZnxVVVLyjk8KwWQHiCOLQUV51xUwB0Yk=;
        b=jsnfETkQFCYWNk6Plf4XBGVI1KifG4CRFEWAVr1j6Hmkr8Wr+3UmPKm6NgGnNj6z3N
         eoHKttBLjrqrgr8c5r+gU3cPDwduOI8zp5oyTfm+EBTCyfXl4Dw6Zn46CQNnWzjkN1+b
         1Z/5Jzu/R17qr3LoLxvRAd1lgsvpTyMdkP4Dr0kExWuguRulJcP7+EmilgWqPp7ocVLM
         oaFKDGWXNjUEYyCJlBKmy9wMZR9eOfXkio2s/+ClQW4OKMJnceQI3s0XYO/zddPZW8UG
         k9oUL46dlLigdy0vzZkXtLpQf9X2FXJl9IsDRRfnIhayY73jeTQ7kPrXTIQzzOpHWOt6
         ckBQ==
X-Gm-Message-State: APjAAAXDrMcR8tbaSRyGUZin3qA8dutbN0XpIm5iN7bXC/rb+/Ey2qk7
        tgqz+G6uF0QiR7tEKKe/EgvDsql8vF/SGFnSUFs=
X-Google-Smtp-Source: APXvYqyCyYAXkVjRaQGsnU23tWjV9XaQliV6h6E6vgonh7EnvSf18y72SQkeo8O2ThkeTII/zk4tfeUibNzePnGmHQk=
X-Received: by 2002:aca:ea82:: with SMTP id i124mr538173oih.153.1566403485948;
 Wed, 21 Aug 2019 09:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190814092757.13726-1-geert+renesas@glider.be>
 <20190814092924.13857-1-geert+renesas@glider.be> <20190814092924.13857-2-geert+renesas@glider.be>
 <20190814093558.xlx5ck54dw2dgb6k@pengutronix.de> <CAMuHMdWNj-H9B8E9=NeCgLracBuJODfPyBYJERh=vt4oNFUkGw@mail.gmail.com>
 <20190814110804.2ceo2upc3su7muup@pengutronix.de> <95a9b7ed-71a5-f58c-92dd-913893535f3a@gmail.com>
 <352d8f55-afe2-9f76-ad92-f15a9faa16a8@gmail.com>
In-Reply-To: <352d8f55-afe2-9f76-ad92-f15a9faa16a8@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 18:04:34 +0200
Message-ID: <CAMuHMdU0c_QRFm8Y=mJmuX9HHXGugcmLVwyQRZKqnTj+C5r6RQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] serial: atmel: Don't check for mctrl_gpio_to_gpiod()
 returning error
To:     Richard Genoud <richard.genoud@gmail.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
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

Hi Richard,

On Wed, Aug 21, 2019 at 5:27 PM Richard Genoud <richard.genoud@gmail.com> wrote:
> Le 20/08/2019 à 17:47, Richard Genoud a écrit :
> > Le 14/08/2019 à 13:08, Uwe Kleine-König a écrit :
> >> On Wed, Aug 14, 2019 at 12:20:33PM +0200, Geert Uytterhoeven wrote:
> >>> Hi Uwe,
> >>>
> >>> On Wed, Aug 14, 2019 at 11:36 AM Uwe Kleine-König
> >>> <u.kleine-koenig@pengutronix.de> wrote:
> >>>> On Wed, Aug 14, 2019 at 11:29:22AM +0200, Geert Uytterhoeven wrote:
> >>>>> Since commit 1d267ea6539f2663 ("serial: mctrl-gpio: simplify init
> >>>>> routine"), mctrl_gpio_init() returns failure if the assignment to any
> >>>>> member of the gpio array results in an error pointer.
> >>>>> Since commit c359522194593815 ("serial: mctrl_gpio: Avoid probe failures
> >>>>> in case of missing gpiolib"), mctrl_gpio_to_gpiod() returns NULL in the
> >>>>> !CONFIG_GPIOLIB case.
> >>>>> Hence there is no longer a need to check for mctrl_gpio_to_gpiod()
> >>>>> returning an error value.  A simple NULL check is sufficient.
> >>>>>
> >>>>> This follows the spirit of commit 445df7ff3fd1a0a9 ("serial: mctrl-gpio:
> >>>>> drop usages of IS_ERR_OR_NULL") in the mctrl-gpio core.
> >>>>>
> >>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>>> ---
> >>>>>  drivers/tty/serial/atmel_serial.c | 12 ++++--------
> >>>>>  1 file changed, 4 insertions(+), 8 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> >>>>> index 19a85d6fe3d20541..e9620a81166b7dc1 100644
> >>>>> --- a/drivers/tty/serial/atmel_serial.c
> >>>>> +++ b/drivers/tty/serial/atmel_serial.c
> >>>>> @@ -303,32 +303,28 @@ static unsigned int atmel_get_lines_status(struct uart_port *port)
> >>>>>
> >>>>>       mctrl_gpio_get(atmel_port->gpios, &ret);
> >>>>>
> >>>>> -     if (!IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(atmel_port->gpios,
> >>>>> -                                             UART_GPIO_CTS))) {
> >>>>> +     if (mctrl_gpio_to_gpiod(atmel_port->gpios, UART_GPIO_CTS)) {
> >>>>>               if (ret & TIOCM_CTS)
> >>>>>                       status &= ~ATMEL_US_CTS;
> >>>>>               else
> >>>>>                       status |= ATMEL_US_CTS;
> >>>>>       }
> >>>>
> >>>> The change is fine, but it seems the atmel driver doesn't use mctrl_gpio
> >>>> as expected (at least as expected by me). IMHO driving the hardware
> >>>> function of the CTS pin shouldn't be conditional on the presence of a
> >>>> cts-gpio. Is there a reason not to just drop the if completely?
> >>>
> >>> The above code returns the hardware status if CTS is not a GPIO, and
> >>> returns (overrides with) the GPIO status if CTS is a GPIO.
> >>> Isn't that correct, or am I missing something?
> >>
> >> I took a deeper look into this driver now. The task for
> >> atmel_get_lines_status() isn't to implement the get_mctrl() callback.
> >>
> >> Instead this is called in the irqhandler to set ATMEL_US_RI in a
> >> "pending" value that then later in atmel_handle_status() is translated
> >> to a "ring" event that is handled there.
> >>
> >> So the right cleanup would be to let atmel_get_lines_status() just be
> >>
> >>      return atmel_uart_readl(port, ATMEL_US_CSR);
> >>
> >> . If something happend on the lines implemented as gpio the driver's irq
> >> function isn't called anyhow.
> >
> > I'd like to give it a good test to be sure, and I'll get back to you.
>
> So, Uwe is right.
> Since commit ce59e48fdbad ("serial: mctrl_gpio: implement interrupt handling"),
> atmel_get_lines_status() can be completly killed and replaced by :
> atmel_uart_readl(port, ATMEL_US_CSR);
>
> Geert, do you want to send a patch for that, or should I do it ?

Feel free to send a  patch.
I don't have the Atmel hardware  anyway.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
