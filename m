Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 618BE56745F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 18:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiGEQcC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 12:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiGEQcC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 12:32:02 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4FF18B0C;
        Tue,  5 Jul 2022 09:32:00 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i18so21456817lfu.8;
        Tue, 05 Jul 2022 09:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4NbkobGzDYSn8V9S6l0le1zTKfSXv2REJlNDOFKrDaY=;
        b=EHlsKLGkyfVfDz9obNnJaUFz9EVbphNwYOyWUubOTbvGPQfIl25DlGHBxz8PvAx6VK
         Ds3uReSnfmW6n22ccpDslHIDC2jqFXYPTB/+jFeHK/hDBnXuD6GBB351dY+V0NHSKpb0
         rxf+Se2ETd0zECmDpAJ/Igq4Gkt8sh8+FUv4QztPK9LCTCYpZMSWEtjC5FBGMnCxgCWF
         qaM2lMtwJgbU+akDNEpVmajG9eNtHED4L0WxEKlw8fcQ+qfKHTe5MqgHpR+OHD3wXIUK
         Kk5zYEK4z/jt8jWbuS90zAHnnwFrrYVpWjJD+PXANhiGqzDxxaPhuNLpWAShE7e5mAod
         fHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4NbkobGzDYSn8V9S6l0le1zTKfSXv2REJlNDOFKrDaY=;
        b=0oxmBJUH0lCP9xgZ8TNLuxeOsE/KcM8hsdQhsbKqyafKwGMUy2s9kNwN8msQ6RPV2q
         CQuB2KuZCa8BslK8nvEtobOWargwDw17zVWV58jU5q7gvOiyeP55YR68Ilh4nfi4H8X0
         bdcxvnZd0jd3o3olfIzKUHb/zYbQ0lKgADsh4++/PUK4edvSzRlxCXFISSI6UGK/7zLR
         xIAHt8FYDIVdRxp7bbYgskO9B/z4oPIMeZUTUxJ6zApKL7XRvuEGG7nHsObD17Wmrrkr
         DcSRJeGghecnTi6GACEALe83q+c5L95WOObQk7OeEpiAAYsPtD3LnexYmyaP7LNWSg6K
         f+eQ==
X-Gm-Message-State: AJIora87wClsGtTL0d/8+Rk+TtzcQvrTqHPzLJY7DiH20FNPktaB+D5+
        nbLBvF4M/CI6ZJYHRCILDzo=
X-Google-Smtp-Source: AGRyM1uTgVG1uciR/SjcTbkcBiDpIihw393o1ScHTp83oPUxLEwvqOf6j+GNv3jz/PPALR09GSTD8Q==
X-Received: by 2002:a05:6512:1292:b0:481:4cf5:f27a with SMTP id u18-20020a056512129200b004814cf5f27amr18697869lfs.656.1657038719153;
        Tue, 05 Jul 2022 09:31:59 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id s11-20020a056512214b00b0047fbc399ad2sm5669723lfr.245.2022.07.05.09.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 09:31:58 -0700 (PDT)
Date:   Tue, 5 Jul 2022 19:31:56 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
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
Message-ID: <20220705163156.56ybg35w3ytdmhgl@mobilestation>
References: <20220630083909.4294-1-biju.das.jz@bp.renesas.com>
 <7431817a-ed5e-1de6-9f69-fda2c1907861@kernel.org>
 <OS0PR01MB5922F80CCAF4DFA9C2970FB686BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922189B75A4C3A93BFE273B86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfBPou1TLk4ygsqF3VSJV84_UQLpwSojELsOt9F42Z_4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfBPou1TLk4ygsqF3VSJV84_UQLpwSojELsOt9F42Z_4w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

On Tue, Jul 05, 2022 at 11:30:01AM +0200, Andy Shevchenko wrote:
> +Cc: Ilpo, the 8250_dw maintainer

> +Cc: Serge, who I believe is the author of the lines in 8250_port you
> cited, sorry if I'm mistaken.

Right, I was the one who got back the line with the proper max baud rate
calculation procedure in commit 7b668c064ec3 ("serial: 8250: Fix max
baud limit in generic 8250 port"). In accordance with [1, 2] the
interface baud rate is (DIV*16)-th of the reference clock frequency. So
the patch suggested by Biju will work only until he gets to the zero
divisor value. Without my fix the baud-rate search algorithm may
end up with getting unsupported baud-rates causing to have
zero-divisor, which will lead to the serial interface freeze/disable
[2].

[1] DesignWare DW_apb_uart Databook 4.03a, December 2020, p. 24
[2] DesignWare DW_apb_uart Databook 4.03a, December 2020, p. 125

> 
> On Tue, Jul 5, 2022 at 8:25 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> >
> > Hi Jiri and Miquel,
> >
> > While testing serial driver with RZ/N1 on 5.15 kernel, which is the backport of mainline kernel,
> > I seen performance issue with serial DMA for higher baud rates.
> >
> > The test app is taking 25 minutes finish, whereas with the below patch[1] it takes only 3 minutes to finish.
> >
> > Not sure has anyone seen this performance issue?
> >
> > [1]
> > diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> > index 468d1aca5968..321430176698 100644
> > --- a/drivers/tty/serial/8250/8250_port.c
> > +++ b/drivers/tty/serial/8250/8250_port.c
> > @@ -2680,7 +2680,7 @@ static unsigned int serial8250_get_baud_rate(struct uart_port *port,
> >                 max = (port->uartclk + tolerance) / 4;
> >         } else {
> >                 min = port->uartclk / 16 / UART_DIV_MAX;

> > -               max = (port->uartclk + tolerance) / 16;
> > +               max = port->uartclk;

Are you sure uartclk is initialized with a real reference clock value?

-Sergey

> >         }
> >
> > Note:-
> > I have added below change on 5.15 kernel to test on all possible use cases.
> >
> > diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> > index 7884fcd66d39..6d352981fb3e 100644
> > --- a/drivers/tty/serial/8250/8250_dw.c
> > +++ b/drivers/tty/serial/8250/8250_dw.c
> > @@ -643,6 +643,26 @@ static int dw8250_probe(struct platform_device *pdev)
> >                 up->dma = &data->data.dma;
> >         }
> >
> > +       if (data->pdata->quirks & DW_UART_QUIRK_IS_DMA_FC) {
> > +               /*
> > +                * When the 'char timeout' irq fires because no more data has
> > +                * been received in some time, the 8250 driver stops the DMA.
> > +                * However, if the DMAC has been setup to write more data to mem
> > +                * than is read from the UART FIFO, the data will *not* be
> > +                * written to memory.
> > +                * Therefore, we limit the width of writes to mem so that it is
> > +                * the same amount of data as read from the FIFO. You can use
> > +                * anything less than or equal, but same size is optimal
> > +                */
> > +               data->data.dma.rxconf.dst_addr_width = p->fifosize / 4;
> > +
> > +               /*
> > +                * Unless you set the maxburst to 1, if you send only 1 char, it
> > +                * doesn't get transmitted
> > +                */
> > +               data->data.dma.txconf.dst_maxburst = 1;
> > +       }
> > +
> >
> > Cheers,
> > Biju
> >
> > > -----Original Message-----
> > > From: Biju Das
> > > Sent: 04 July 2022 08:12
> > > To: Jiri Slaby <jirislaby@kernel.org>; Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Miquel Raynal
> > > <miquel.raynal@bootlin.com>; Emil Renner Berthing <kernel@esmil.dk>; Phil
> > > Edworthy <phil.edworthy@renesas.com>; Johan Hovold <johan@kernel.org>;
> > > linux-serial@vger.kernel.org; Geert Uytterhoeven
> > > <geert+renesas@glider.be>; Chris Paterson <Chris.Paterson2@renesas.com>;
> > > Biju Das <biju.das@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> > > Subject: RE: [PATCH] serial: 8250: dw: Fix the macro
> > > RZN1_UART_xDMACR_8_WORD_BURST
> > >
> > > Hi Jiri,
> > >
> > > Thanks for the feedback.
> > >
> > > > Subject: Re: [PATCH] serial: 8250: dw: Fix the macro
> > > > RZN1_UART_xDMACR_8_WORD_BURST
> > > >
> > > > On 30. 06. 22, 10:39, Biju Das wrote:
> > > > > As per RZ/N1 peripheral user
> > > > > manual(r01uh0752ej0100-rzn1-peripheral.pdf)
> > > > > rev 1.0.0 Mar,2019,
> > > >
> > > > Is this public anywhere?
> > >
> > > Yes, It is available here[1] see page 72 and 73.
> > >
> > > [1] https://www.renesas.com/us/en/document/mah/rzn1d-group-rzn1s-group-
> > > rzn1l-group-users-manual-peripherals?language=en&r=1054561
> > >
> > >
> > > >
> > > > > the value for 8_WORD_BURST is 4(b2,b1=2’b10).
> > > > >
> > > > > This patch fixes the macro as per the user manual.
> > > >
> > > > I'm curious, is the bottom bit from "3" ignored by the HW or does this
> > > > fix a real problem in behavior? Stating that might help backporters to
> > > > decide if to take the patch or not.
> > >
> > > See page 72 and 73.
> > >
> > > Yes, it fixes a real problem as by using a value of 8 , you are wrongly
> > > configuring DMA_BURST_SIZE of 1 instead of DMA_BURST_SIZE of 8.
> > >
> > > b2, b1 bUart_DEST_BURST
> > > _SIZE
> > > DEST_BURST_SIZE
> > > Destination Burst Transaction Size in Transmit FIFO.
> > > UART is the flow controller. Thus, the user must write this field before
> > > or at the same time the DMA mode is enabled. Number of data byte, to be
> > > written to the Transmit FIFO every time a transmit burst transaction
> > > request are made on DMA request.
> > > 2’b00 = 1 byte
> > > 2’b01 = 4 bytes
> > > 2’b10 = 8 bytes
> > > 2’b11 = Reserved, not used
> > >
> > > Cheers,
> > > Biju
> > >
> > >
> > > >
> > > > > Fixes: aa63d786cea2 ("serial: 8250: dw: Add support for DMA flow
> > > > > controlling devices")
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > >   drivers/tty/serial/8250/8250_dw.c | 2 +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/tty/serial/8250/8250_dw.c
> > > > > b/drivers/tty/serial/8250/8250_dw.c
> > > > > index f57bbd32ef11..931490b27d6b 100644
> > > > > --- a/drivers/tty/serial/8250/8250_dw.c
> > > > > +++ b/drivers/tty/serial/8250/8250_dw.c
> > > > > @@ -47,7 +47,7 @@
> > > > >   #define RZN1_UART_xDMACR_DMA_EN         BIT(0)
> > > > >   #define RZN1_UART_xDMACR_1_WORD_BURST   (0 << 1)
> > > > >   #define RZN1_UART_xDMACR_4_WORD_BURST   (1 << 1)
> > > > > -#define RZN1_UART_xDMACR_8_WORD_BURST    (3 << 1)
> > > > > +#define RZN1_UART_xDMACR_8_WORD_BURST    (2 << 1)
> > > > >   #define RZN1_UART_xDMACR_BLK_SZ(x)      ((x) << 3)
> > > > >
> > > > >   /* Quirks */
> > > >
> > > > thanks,
> > > > --
> > > > js
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
