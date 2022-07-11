Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98FC1570072
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Jul 2022 13:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiGKL1O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jul 2022 07:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiGKL0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jul 2022 07:26:55 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EA36C13A;
        Mon, 11 Jul 2022 04:03:05 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bp17so204985lfb.3;
        Mon, 11 Jul 2022 04:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/biTmow2vD5S8l/beJ7QanR8t1BNsf9ojRn7igZJ4Hc=;
        b=fROqCJFGCtCh2xeJMCd4oheXIunawrv4Dfcydcoc4XvVCS0aHNW7JvDAImJWZsiXE1
         uodoDAO9gMxd05ZGjog1euOdRJvQu+uoAgMzZhy/+TEUI/Hk41ajNsPy99qkLLzSCHbd
         bH0/D9SkLh7PHyqC/YI6ujxqkJtLwXWNy1nqTolyUxd5xFVjNzl+lc0r56O0i05rFWF+
         K5J5rIUdp0lovLd/9RYjoMPnqk2cvunnlSGDe/nFaGK0qU5ILF47O2+Q6N57j0mvYZCy
         i79ScOKJYZOSAC9Xs93kCZ7g7LyentpcFtiaOB+Nd14vDZ6QZ8uuBM3htZz7aKUrnPKO
         LjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/biTmow2vD5S8l/beJ7QanR8t1BNsf9ojRn7igZJ4Hc=;
        b=jFkDPXrQzuYv3h2vNqB2qHPLqXoju8geOV+Si9VrusRPok27vnMneu5PfkPPc7D2Zs
         zf3LDSKQtEfmIKWE100Bd2z8eUvDn7TIcKCzFygaRhfdaZEk/6IuOI8qsvRgOcd3C388
         DFNCfwM8uJPdMHf2t2Hy3+F024Y5me1P2rYqLt2v/vgFv/VeHFKmA2KyOTkCffDefh22
         Srt6T1yENwb39YfD+uRV2Rkoue5OoIE5yPlU2eml+bw4WUvtrPTwEbYFT8+w8HTZRCRZ
         aN7GbuvoHM9B+q2R8oyDrTNiLdQpglr3Qx9OqN+PQVAoiR1/i+rVt18K3MRviG1TsEVw
         0SRQ==
X-Gm-Message-State: AJIora+DJ4y3KVm5viGiZ/2K+5HFd8lMvbwu0DRb0axjzQA1HTwtXcK7
        Z9XoLgIasc+sqodrFH1RnR72+KrOSkwoTQ==
X-Google-Smtp-Source: AGRyM1v4EcW0eoRJbdCaRcELfjOLa0zEtxeSYP+h8LegnSzpOBqI2nfOy54Ilx0EZoX2Q567Yzusdw==
X-Received: by 2002:a05:6512:1590:b0:47f:6e14:a782 with SMTP id bp16-20020a056512159000b0047f6e14a782mr11386032lfb.131.1657537382367;
        Mon, 11 Jul 2022 04:03:02 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b0047fb0d5e049sm1483835lfr.273.2022.07.11.04.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 04:03:01 -0700 (PDT)
Date:   Mon, 11 Jul 2022 14:02:59 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Johan Hovold <johan@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] serial: 8250: dw: Fix the macro
 RZN1_UART_xDMACR_8_WORD_BURST
Message-ID: <20220711110259.cbmc6c5liu7xmudx@mobilestation>
References: <20220630083909.4294-1-biju.das.jz@bp.renesas.com>
 <7431817a-ed5e-1de6-9f69-fda2c1907861@kernel.org>
 <OS0PR01MB5922F80CCAF4DFA9C2970FB686BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922189B75A4C3A93BFE273B86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfBPou1TLk4ygsqF3VSJV84_UQLpwSojELsOt9F42Z_4w@mail.gmail.com>
 <20220705163156.56ybg35w3ytdmhgl@mobilestation>
 <OS0PR01MB5922893187635B2F128CA93B86849@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922893187635B2F128CA93B86849@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Jul 10, 2022 at 08:46:46AM +0000, Biju Das wrote:
> Hi Serge Semin,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH] serial: 8250: dw: Fix the macro
> > RZN1_UART_xDMACR_8_WORD_BURST
> > 
> > Hi Andy,
> > 
> > On Tue, Jul 05, 2022 at 11:30:01AM +0200, Andy Shevchenko wrote:
> > > +Cc: Ilpo, the 8250_dw maintainer
> > 
> > > +Cc: Serge, who I believe is the author of the lines in 8250_port you
> > > cited, sorry if I'm mistaken.
> > 
> > Right, I was the one who got back the line with the proper max baud rate
> > calculation procedure in commit 7b668c064ec3 ("serial: 8250: Fix max baud
> > limit in generic 8250 port"). In accordance with [1, 2] the interface
> > baud rate is (DIV*16)-th of the reference clock frequency. So the patch
> > suggested by Biju will work only until he gets to the zero divisor value.
> > Without my fix the baud-rate search algorithm may end up with getting
> > unsupported baud-rates causing to have zero-divisor, which will lead to
> > the serial interface freeze/disable [2].
> > 
> > [1] DesignWare DW_apb_uart Databook 4.03a, December 2020, p. 24 [2]
> > DesignWare DW_apb_uart Databook 4.03a, December 2020, p. 125
> 
> Thanks for sharing the details.
> 
> > 
> > >
> > > On Tue, Jul 5, 2022 at 8:25 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > >
> > > > Hi Jiri and Miquel,
> > > >
> > > > While testing serial driver with RZ/N1 on 5.15 kernel, which is the
> > > > backport of mainline kernel, I seen performance issue with serial DMA
> > for higher baud rates.
> > > >
> > > > The test app is taking 25 minutes finish, whereas with the below
> > patch[1] it takes only 3 minutes to finish.
> > > >
> > > > Not sure has anyone seen this performance issue?
> > > >
> > > > [1]
> > > > diff --git a/drivers/tty/serial/8250/8250_port.c
> > > > b/drivers/tty/serial/8250/8250_port.c
> > > > index 468d1aca5968..321430176698 100644
> > > > --- a/drivers/tty/serial/8250/8250_port.c
> > > > +++ b/drivers/tty/serial/8250/8250_port.c
> > > > @@ -2680,7 +2680,7 @@ static unsigned int
> > serial8250_get_baud_rate(struct uart_port *port,
> > > >                 max = (port->uartclk + tolerance) / 4;
> > > >         } else {
> > > >                 min = port->uartclk / 16 / UART_DIV_MAX;
> > 
> > > > -               max = (port->uartclk + tolerance) / 16;
> > > > +               max = port->uartclk;
> > 
> > Are you sure uartclk is initialized with a real reference clock value?
> 
> Looks like your code is correct.
> 
> The reason for performance issue is because of the out of range and it defaults to 9600 instead of the nearest possible max baud value. The requested baud rate(for eg:-5M), is higher than max possible baud rate(4.9M), because of the rounding of the clocks and uart baud calculation defaults to 9600.
> 
> We have PLL(1 GHz)->PLL Divider(12to 128)-> UARTCLK
> Currently clk driver uses default divider value of 21 which set by the
> Bootloader and it doesn't allow to change this as it has other users.
> 
> With this max possible baud rate is (1G/21)/16=2.97M
> 

> If we want to test baudrate in the order of 5M(1G/12)/16= 83MHz/16 = 5.2M , we need to remove the hack from Clk driver[1]
> [1] https://elixir.bootlin.com/linux/v5.19-rc5/source/drivers/clk/renesas/r9a06g032-clocks.c#L658
> 
> But the clk driver finds best divider as 13 instead of 12 and reduces the 
> Rate from 83MHz to 76.9MHz.

Hmm, the same approach has been implemented on our SoC too. There
are two DW APB UARTs with common reference clock attached. That's why
I've introduced the commit cc816969d7b5 ("serial: 8250_dw: Fix common
clocks usage race condition"). It provides a way to update the clock
divider of the uart interface in case if the reference clock rate has
changed. The implemented approach has some drawbacks though:
1. If the divider gets out of range, then the affected interfaces will
fallback to 9600.
2. For some time between the clock rate change and until the divider is
updated the affected UART interfaces will work with the undetermined baud
rate.

So to speak, if you don't mind about the drawbacks above you can at
least give it a try. Fixing the clock rate is a good alternative though.

-Sergey

> 
> With 76.9Mhz, max possible baud rate is ~4.8M as per your calculation. The original requested baud rate 5.2M is now out of bound and baud rate is defaulted to Very low value say 9600, this results in the performance issue.
> 
> Cheers,
> Biju
> 
> 
> > 
> > -Sergey
> > 
> > > >         }
> > > >
> > > > Note:-
> > > > I have added below change on 5.15 kernel to test on all possible use
> > cases.
> > > >
> > > > diff --git a/drivers/tty/serial/8250/8250_dw.c
> > > > b/drivers/tty/serial/8250/8250_dw.c
> > > > index 7884fcd66d39..6d352981fb3e 100644
> > > > --- a/drivers/tty/serial/8250/8250_dw.c
> > > > +++ b/drivers/tty/serial/8250/8250_dw.c
> > > > @@ -643,6 +643,26 @@ static int dw8250_probe(struct platform_device
> > *pdev)
> > > >                 up->dma = &data->data.dma;
> > > >         }
> > > >
> > > > +       if (data->pdata->quirks & DW_UART_QUIRK_IS_DMA_FC) {
> > > > +               /*
> > > > +                * When the 'char timeout' irq fires because no more
> > data has
> > > > +                * been received in some time, the 8250 driver stops
> > the DMA.
> > > > +                * However, if the DMAC has been setup to write more
> > data to mem
> > > > +                * than is read from the UART FIFO, the data will
> > *not* be
> > > > +                * written to memory.
> > > > +                * Therefore, we limit the width of writes to mem so
> > that it is
> > > > +                * the same amount of data as read from the FIFO. You
> > can use
> > > > +                * anything less than or equal, but same size is
> > optimal
> > > > +                */
> > > > +               data->data.dma.rxconf.dst_addr_width = p->fifosize /
> > > > + 4;
> > > > +
> > > > +               /*
> > > > +                * Unless you set the maxburst to 1, if you send only
> > 1 char, it
> > > > +                * doesn't get transmitted
> > > > +                */
> > > > +               data->data.dma.txconf.dst_maxburst = 1;
> > > > +       }
> > > > +
> > > >
> > > > Cheers,
> > > > Biju
> > > >
> > > > > -----Original Message-----
> > > > > From: Biju Das
> > > > > Sent: 04 July 2022 08:12
> > > > > To: Jiri Slaby <jirislaby@kernel.org>; Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org>
> > > > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Miquel
> > > > > Raynal <miquel.raynal@bootlin.com>; Emil Renner Berthing
> > > > > <kernel@esmil.dk>; Phil Edworthy <phil.edworthy@renesas.com>;
> > > > > Johan Hovold <johan@kernel.org>; linux-serial@vger.kernel.org;
> > > > > Geert Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> > > > > <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com>;
> > > > > linux-renesas-soc@vger.kernel.org
> > > > > Subject: RE: [PATCH] serial: 8250: dw: Fix the macro
> > > > > RZN1_UART_xDMACR_8_WORD_BURST
> > > > >
> > > > > Hi Jiri,
> > > > >
> > > > > Thanks for the feedback.
> > > > >
> > > > > > Subject: Re: [PATCH] serial: 8250: dw: Fix the macro
> > > > > > RZN1_UART_xDMACR_8_WORD_BURST
> > > > > >
> > > > > > On 30. 06. 22, 10:39, Biju Das wrote:
> > > > > > > As per RZ/N1 peripheral user
> > > > > > > manual(r01uh0752ej0100-rzn1-peripheral.pdf)
> > > > > > > rev 1.0.0 Mar,2019,
> > > > > >
> > > > > > Is this public anywhere?
> > > > >
> > > > > Yes, It is available here[1] see page 72 and 73.
> > > > >
> > > > > [1]
> > > > > https://www.renesas.com/us/en/document/mah/rzn1d-group-rzn1s-group
> > > > > -
> > > > > rzn1l-group-users-manual-peripherals?language=en&r=1054561
> > > > >
> > > > >
> > > > > >
> > > > > > > the value for 8_WORD_BURST is 4(b2,b1=2'b10).
> > > > > > >
> > > > > > > This patch fixes the macro as per the user manual.
> > > > > >
> > > > > > I'm curious, is the bottom bit from "3" ignored by the HW or
> > > > > > does this fix a real problem in behavior? Stating that might
> > > > > > help backporters to decide if to take the patch or not.
> > > > >
> > > > > See page 72 and 73.
> > > > >
> > > > > Yes, it fixes a real problem as by using a value of 8 , you are
> > > > > wrongly configuring DMA_BURST_SIZE of 1 instead of DMA_BURST_SIZE
> > of 8.
> > > > >
> > > > > b2, b1 bUart_DEST_BURST
> > > > > _SIZE
> > > > > DEST_BURST_SIZE
> > > > > Destination Burst Transaction Size in Transmit FIFO.
> > > > > UART is the flow controller. Thus, the user must write this field
> > > > > before or at the same time the DMA mode is enabled. Number of data
> > > > > byte, to be written to the Transmit FIFO every time a transmit
> > > > > burst transaction request are made on DMA request.
> > > > > 2'b00 = 1 byte
> > > > > 2'b01 = 4 bytes
> > > > > 2'b10 = 8 bytes
> > > > > 2'b11 = Reserved, not used
> > > > >
> > > > > Cheers,
> > > > > Biju
> > > > >
> > > > >
> > > > > >
> > > > > > > Fixes: aa63d786cea2 ("serial: 8250: dw: Add support for DMA
> > > > > > > flow controlling devices")
> > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > ---
> > > > > > >   drivers/tty/serial/8250/8250_dw.c | 2 +-
> > > > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/tty/serial/8250/8250_dw.c
> > > > > > > b/drivers/tty/serial/8250/8250_dw.c
> > > > > > > index f57bbd32ef11..931490b27d6b 100644
> > > > > > > --- a/drivers/tty/serial/8250/8250_dw.c
> > > > > > > +++ b/drivers/tty/serial/8250/8250_dw.c
> > > > > > > @@ -47,7 +47,7 @@
> > > > > > >   #define RZN1_UART_xDMACR_DMA_EN         BIT(0)
> > > > > > >   #define RZN1_UART_xDMACR_1_WORD_BURST   (0 << 1)
> > > > > > >   #define RZN1_UART_xDMACR_4_WORD_BURST   (1 << 1)
> > > > > > > -#define RZN1_UART_xDMACR_8_WORD_BURST    (3 << 1)
> > > > > > > +#define RZN1_UART_xDMACR_8_WORD_BURST    (2 << 1)
> > > > > > >   #define RZN1_UART_xDMACR_BLK_SZ(x)      ((x) << 3)
> > > > > > >
> > > > > > >   /* Quirks */
> > > > > >
> > > > > > thanks,
> > > > > > --
> > > > > > js
> > >
> > >
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
