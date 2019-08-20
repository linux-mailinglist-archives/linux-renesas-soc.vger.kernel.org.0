Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A089650D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 17:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfHTPrw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 11:47:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44352 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbfHTPrv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 11:47:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id p17so12894372wrf.11;
        Tue, 20 Aug 2019 08:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CQXdl8MQKSfAVMGTcNyhlk2RDIadKLCT6/GSCMZ/+7Q=;
        b=g4+C/cCKU1zuU7pgUVuybaSTEWXVz9x5UXtyitwUC1J2PUjIxgdrVahwEygsEYbSlA
         qL1ICqq/Kgwk8D9Y0UMpv39w9bPxXdein8NRDb1LDk/W/fZUgWJTzincMarkF8WF7xbe
         RNjW38KDttZaFRHxuuq0/II+bqJAJYSPIkdLL4zfrrpA/F50EwSgeO+U6Ac6XPczncrx
         I4QUCca/GQA5+kfih92cjQ2m89wYXdfWuDnEu4Uv3Hj0E5p5QvlJax3iXag466U4WM5o
         gHsiY0O8poqoNMlduuVjPx6yyzsIYKjdjExkEYZYi5Qv664JhjBziQL7ZZqDRiMhVFiP
         uhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CQXdl8MQKSfAVMGTcNyhlk2RDIadKLCT6/GSCMZ/+7Q=;
        b=AAYpxna+VBbvTCNvsk60SC94GRisD+Hm4tKz2cX/3OCLqwaj+8iAsmgTGj/xHGqoJX
         9JCHZVKHE5rYThjUoTRlptEnR5UumZsgEelJ6exE3rh7ZcMw2KgjR4dtOqzOFUnsixBz
         hdxRPZKWXwsZZrgLTKzwTdaItzIzSLIgsR7aUfO8xUPldQaXvUhmX374AX+M67e0wnOX
         7NtjMbZ/yWXoBCtGjq6PKXX/YQtUkHUDWWlKk2KndmxsO6UU4M8e/dBspJvoOI1nxJQk
         uUG64UGLT6RBRzrIba6JekCoaZKz/UFc6v0lrj2HhExDEm93zLmz7jvSHlCCEhWWJtbr
         A7jQ==
X-Gm-Message-State: APjAAAVEYRplI76VXchjppEzUhPKfMen3Ih0IeUKrlr8KkDDIWCFvheu
        JkXBQGtrKkmvfzkXap3ihHU=
X-Google-Smtp-Source: APXvYqxL6PKxMepQ+OYGPx47LNzVl74MWc8etEYRwm2GcdIgYDs9tXF+lOR42vlVB9NtT7N45IqdbQ==
X-Received: by 2002:adf:c7cb:: with SMTP id y11mr28615611wrg.281.1566316069291;
        Tue, 20 Aug 2019 08:47:49 -0700 (PDT)
Received: from [192.168.2.41] ([46.227.18.67])
        by smtp.gmail.com with ESMTPSA id g14sm36284276wrb.38.2019.08.20.08.47.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 08:47:48 -0700 (PDT)
Subject: Re: [PATCH 1/3] serial: atmel: Don't check for mctrl_gpio_to_gpiod()
 returning error
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
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
References: <20190814092757.13726-1-geert+renesas@glider.be>
 <20190814092924.13857-1-geert+renesas@glider.be>
 <20190814092924.13857-2-geert+renesas@glider.be>
 <20190814093558.xlx5ck54dw2dgb6k@pengutronix.de>
 <CAMuHMdWNj-H9B8E9=NeCgLracBuJODfPyBYJERh=vt4oNFUkGw@mail.gmail.com>
 <20190814110804.2ceo2upc3su7muup@pengutronix.de>
From:   Richard Genoud <richard.genoud@gmail.com>
Message-ID: <95a9b7ed-71a5-f58c-92dd-913893535f3a@gmail.com>
Date:   Tue, 20 Aug 2019 17:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814110804.2ceo2upc3su7muup@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Le 14/08/2019 à 13:08, Uwe Kleine-König a écrit :
> On Wed, Aug 14, 2019 at 12:20:33PM +0200, Geert Uytterhoeven wrote:
>> Hi Uwe,
>>
>> On Wed, Aug 14, 2019 at 11:36 AM Uwe Kleine-König
>> <u.kleine-koenig@pengutronix.de> wrote:
>>> On Wed, Aug 14, 2019 at 11:29:22AM +0200, Geert Uytterhoeven wrote:
>>>> Since commit 1d267ea6539f2663 ("serial: mctrl-gpio: simplify init
>>>> routine"), mctrl_gpio_init() returns failure if the assignment to any
>>>> member of the gpio array results in an error pointer.
>>>> Since commit c359522194593815 ("serial: mctrl_gpio: Avoid probe failures
>>>> in case of missing gpiolib"), mctrl_gpio_to_gpiod() returns NULL in the
>>>> !CONFIG_GPIOLIB case.
>>>> Hence there is no longer a need to check for mctrl_gpio_to_gpiod()
>>>> returning an error value.  A simple NULL check is sufficient.
>>>>
>>>> This follows the spirit of commit 445df7ff3fd1a0a9 ("serial: mctrl-gpio:
>>>> drop usages of IS_ERR_OR_NULL") in the mctrl-gpio core.
>>>>
>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> ---
>>>>  drivers/tty/serial/atmel_serial.c | 12 ++++--------
>>>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
>>>> index 19a85d6fe3d20541..e9620a81166b7dc1 100644
>>>> --- a/drivers/tty/serial/atmel_serial.c
>>>> +++ b/drivers/tty/serial/atmel_serial.c
>>>> @@ -303,32 +303,28 @@ static unsigned int atmel_get_lines_status(struct uart_port *port)
>>>>
>>>>       mctrl_gpio_get(atmel_port->gpios, &ret);
>>>>
>>>> -     if (!IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(atmel_port->gpios,
>>>> -                                             UART_GPIO_CTS))) {
>>>> +     if (mctrl_gpio_to_gpiod(atmel_port->gpios, UART_GPIO_CTS)) {
>>>>               if (ret & TIOCM_CTS)
>>>>                       status &= ~ATMEL_US_CTS;
>>>>               else
>>>>                       status |= ATMEL_US_CTS;
>>>>       }
>>>
>>> The change is fine, but it seems the atmel driver doesn't use mctrl_gpio
>>> as expected (at least as expected by me). IMHO driving the hardware
>>> function of the CTS pin shouldn't be conditional on the presence of a
>>> cts-gpio. Is there a reason not to just drop the if completely?
>>
>> The above code returns the hardware status if CTS is not a GPIO, and
>> returns (overrides with) the GPIO status if CTS is a GPIO.
>> Isn't that correct, or am I missing something?
> 
> I took a deeper look into this driver now. The task for
> atmel_get_lines_status() isn't to implement the get_mctrl() callback.
> 
> Instead this is called in the irqhandler to set ATMEL_US_RI in a
> "pending" value that then later in atmel_handle_status() is translated
> to a "ring" event that is handled there.
> 
> So the right cleanup would be to let atmel_get_lines_status() just be
> 
> 	return atmel_uart_readl(port, ATMEL_US_CSR);
> 
> . If something happend on the lines implemented as gpio the driver's irq
> function isn't called anyhow.

I'd like to give it a good test to be sure, and I'll get back to you.

Thanks,
Richard
