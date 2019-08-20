Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8AD963D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 17:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbfHTPMK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 11:12:10 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33779 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729084AbfHTPMK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 11:12:10 -0400
Received: by mail-wr1-f68.google.com with SMTP id u16so12800387wrr.0;
        Tue, 20 Aug 2019 08:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dKdQuwZho07axOitnBUWXA6Q8k137FEMkmPLh6RmOhw=;
        b=G1ymaBsxmt35xAAfqF7fRnZ/ONwJaQUIH39QLqJp40qLd/v9GATTe1V1qZ+acBGrF5
         uCQAjFQN9UwH3q0sMK/9tkBPWemv0hG6F5oj5GL7+zIObz+r3xx6pcx8IfJDGKr3YMZ2
         665a4w3gwpwvChxHQqcj3W1Mgz4bZ7QIS/XQNAUvzAbp99Ba4zHEU8vnnPv+RP4eZIXG
         clNmHfP52jOsqPB4M1qtQC379AlMFbOlbhh9esTnMnBJt5Nswr3otIPRBJE74eMmBRYx
         DqL7e2WfUv71WGeIUiLis22x5zJDsd/4Rn+T9Xg4LTJvLHrsk9xo1qj1MBayZnn8fbaJ
         7Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dKdQuwZho07axOitnBUWXA6Q8k137FEMkmPLh6RmOhw=;
        b=NmqN/yFOmAS3BgQfir6Bdg44YZhaq2EQ17//xlffkz/t+2cUFPkUGawLlpv+4ajLWj
         nA0Rwd7v1A+toVlOsac1R52hvbOvZoPePJrXgCogeLCCr5zdrLZ1Uvefq5t5l4cUkcb8
         zhf6UbRv0IqV97cOF5UTQFu/kQqply91gUNog7BEfn8OGi+4I+Hts2eVM/jiOGwYtI8z
         1IqYSTQ304vMynxv7mUzGkBn5y45YEhp/66g0SsL64pNbC1RTICPZ2MLp38g7wkbrlms
         tibQVBoizm9ARybW4idAb+peJuy2bbezcZh+yF+ZjSuhcR2S6HPAC+EBeHTEr5eLXiVr
         LJTA==
X-Gm-Message-State: APjAAAXHsPIwpy8CxrZ23gwSoF4KqKo+/ApCUSmSb/vJz2df/cPnFDT5
        z3+4r/2fkQCYCKu6kwJbvj6FdE7d
X-Google-Smtp-Source: APXvYqxO0jy9AQ8t47aDAVTk1kfQTXX8cglGGpZTPFubBItCMScY6EqdbmFATv4grXtnt25iNMncLA==
X-Received: by 2002:a05:6000:1085:: with SMTP id y5mr34675544wrw.285.1566313928659;
        Tue, 20 Aug 2019 08:12:08 -0700 (PDT)
Received: from [192.168.2.41] ([46.227.18.67])
        by smtp.gmail.com with ESMTPSA id u129sm212061wmb.12.2019.08.20.08.12.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 08:12:07 -0700 (PDT)
Subject: Re: [PATCH 1/3] serial: atmel: Don't check for mctrl_gpio_to_gpiod()
 returning error
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
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
From:   Richard Genoud <richard.genoud@gmail.com>
Message-ID: <fc23b475-db5f-a311-5c7e-9fac15da3684@gmail.com>
Date:   Tue, 20 Aug 2019 17:11:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWNj-H9B8E9=NeCgLracBuJODfPyBYJERh=vt4oNFUkGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,
Le 14/08/2019 à 12:20, Geert Uytterhoeven a écrit :
> Hi Uwe,
> 
> On Wed, Aug 14, 2019 at 11:36 AM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
>> On Wed, Aug 14, 2019 at 11:29:22AM +0200, Geert Uytterhoeven wrote:
>>> Since commit 1d267ea6539f2663 ("serial: mctrl-gpio: simplify init
>>> routine"), mctrl_gpio_init() returns failure if the assignment to any
>>> member of the gpio array results in an error pointer.
>>> Since commit c359522194593815 ("serial: mctrl_gpio: Avoid probe failures
>>> in case of missing gpiolib"), mctrl_gpio_to_gpiod() returns NULL in the
>>> !CONFIG_GPIOLIB case.
>>> Hence there is no longer a need to check for mctrl_gpio_to_gpiod()
>>> returning an error value.  A simple NULL check is sufficient.
>>>
>>> This follows the spirit of commit 445df7ff3fd1a0a9 ("serial: mctrl-gpio:
>>> drop usages of IS_ERR_OR_NULL") in the mctrl-gpio core.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>>  drivers/tty/serial/atmel_serial.c | 12 ++++--------
>>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
>>> index 19a85d6fe3d20541..e9620a81166b7dc1 100644
>>> --- a/drivers/tty/serial/atmel_serial.c
>>> +++ b/drivers/tty/serial/atmel_serial.c
>>> @@ -303,32 +303,28 @@ static unsigned int atmel_get_lines_status(struct uart_port *port)
>>>
>>>       mctrl_gpio_get(atmel_port->gpios, &ret);
>>>
>>> -     if (!IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(atmel_port->gpios,
>>> -                                             UART_GPIO_CTS))) {
>>> +     if (mctrl_gpio_to_gpiod(atmel_port->gpios, UART_GPIO_CTS)) {
>>>               if (ret & TIOCM_CTS)
>>>                       status &= ~ATMEL_US_CTS;
>>>               else
>>>                       status |= ATMEL_US_CTS;
>>>       }
>>
>> The change is fine, but it seems the atmel driver doesn't use mctrl_gpio
>> as expected (at least as expected by me). IMHO driving the hardware
>> function of the CTS pin shouldn't be conditional on the presence of a
>> cts-gpio. Is there a reason not to just drop the if completely?
> 
> The above code returns the hardware status if CTS is not a GPIO, and
> returns (overrides with) the GPIO status if CTS is a GPIO.
> Isn't that correct, or am I missing something?
Yes, that's correct.
