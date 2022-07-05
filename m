Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB5956662F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 11:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiGEJbH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 05:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbiGEJaq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 05:30:46 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07B3A470;
        Tue,  5 Jul 2022 02:30:44 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id e80so13548452ybb.4;
        Tue, 05 Jul 2022 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ds+q9Soow6oXLmxqWRIB62iNIxiKRRwbc52wJjtzGl4=;
        b=cSVrWoND00cYNK9sFrNUzKcJ72YmVF7LPyg3X+X8RuLseNTP0oYmxiZxmfsin83oXk
         UXCaOARoGZWSnYWoqvV7OP866bYt61N/5Ysy80Wa4kD69gysKUAR4NIyN5xAZ7pBHYRh
         GYOU5OnmT/2SIy5XPZKY0RlpX4QhZh/DFfnAMkDFEtrxhfVqC7Ro1EDiELt7Ia2tPtii
         RGyNlLoHKqr623wavWufADKhtfBXO/WQDpLwREmKaq4wl8N0vIZkoln/8FfXdAoTDZib
         nxOESmkydTX98xyZ7Q/pSFR4PgmhziVn+EWr4wTFtGEOyW5BWaA1W1fHB10BnlhKr5SH
         9qAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ds+q9Soow6oXLmxqWRIB62iNIxiKRRwbc52wJjtzGl4=;
        b=vQRFykA4KQiJnflG4hQ9yr7JUIbTRL6uHe6pGVsUM52ROVbzxoz9prqw75Ij+gl1cO
         Tpn1z+LxGINqasEtL8U6vE4UDdXhE526phPQ1QxJ2UWH+g8blppHgSutymnfMV7S94SZ
         G8tI/v8MMWqT0oj4scLf6DsY1N7rZWf2K9kK1dMGDgMxLuddbTZFopezJQhpcDIWVbjn
         dNVMSqxuXXuA+d44842ddG/9MsaGItAROZDDvA768SQb5ml+fhJCbTKHFmAFRmyT9MDa
         tPwoyNeO3uKx2bb2EUuWcyDt/EPRYZFnQlLvV8pgf9/GtPYkazI25SAPDdWGKdJLIVSm
         NlqA==
X-Gm-Message-State: AJIora+GAqcP0P8Gt3EqiHqLq7Gv6I8qlXw3mBZR3yMq22tNoudDucmi
        l96S/vZKzF2/+Vvvcw+AiPdcNKsBKQdf92+ePhM=
X-Google-Smtp-Source: AGRyM1uDdt7yoYDhELvy1MqxRxn944S/XwIBqxd7Fnfd8WaF5OnaZi6XEfOvWMya8MQ3lj/eBUAiQki3+yzIQawq2jg=
X-Received: by 2002:a25:dd83:0:b0:66c:8d8d:4f5f with SMTP id
 u125-20020a25dd83000000b0066c8d8d4f5fmr35985776ybg.79.1657013444032; Tue, 05
 Jul 2022 02:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220630083909.4294-1-biju.das.jz@bp.renesas.com>
 <7431817a-ed5e-1de6-9f69-fda2c1907861@kernel.org> <OS0PR01MB5922F80CCAF4DFA9C2970FB686BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922189B75A4C3A93BFE273B86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922189B75A4C3A93BFE273B86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 Jul 2022 11:30:01 +0200
Message-ID: <CAHp75VfBPou1TLk4ygsqF3VSJV84_UQLpwSojELsOt9F42Z_4w@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250: dw: Fix the macro RZN1_UART_xDMACR_8_WORD_BURST
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+Cc: Ilpo, the 8250_dw maintainer
+Cc: Serge, who I believe is the author of the lines in 8250_port you
cited, sorry if I'm mistaken.

On Tue, Jul 5, 2022 at 8:25 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Jiri and Miquel,
>
> While testing serial driver with RZ/N1 on 5.15 kernel, which is the backp=
ort of mainline kernel,
> I seen performance issue with serial DMA for higher baud rates.
>
> The test app is taking 25 minutes finish, whereas with the below patch[1]=
 it takes only 3 minutes to finish.
>
> Not sure has anyone seen this performance issue?
>
> [1]
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/825=
0/8250_port.c
> index 468d1aca5968..321430176698 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -2680,7 +2680,7 @@ static unsigned int serial8250_get_baud_rate(struct=
 uart_port *port,
>                 max =3D (port->uartclk + tolerance) / 4;
>         } else {
>                 min =3D port->uartclk / 16 / UART_DIV_MAX;
> -               max =3D (port->uartclk + tolerance) / 16;
> +               max =3D port->uartclk;
>         }
>
> Note:-
> I have added below change on 5.15 kernel to test on all possible use case=
s.
>
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/=
8250_dw.c
> index 7884fcd66d39..6d352981fb3e 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -643,6 +643,26 @@ static int dw8250_probe(struct platform_device *pdev=
)
>                 up->dma =3D &data->data.dma;
>         }
>
> +       if (data->pdata->quirks & DW_UART_QUIRK_IS_DMA_FC) {
> +               /*
> +                * When the 'char timeout' irq fires because no more data=
 has
> +                * been received in some time, the 8250 driver stops the =
DMA.
> +                * However, if the DMAC has been setup to write more data=
 to mem
> +                * than is read from the UART FIFO, the data will *not* b=
e
> +                * written to memory.
> +                * Therefore, we limit the width of writes to mem so that=
 it is
> +                * the same amount of data as read from the FIFO. You can=
 use
> +                * anything less than or equal, but same size is optimal
> +                */
> +               data->data.dma.rxconf.dst_addr_width =3D p->fifosize / 4;
> +
> +               /*
> +                * Unless you set the maxburst to 1, if you send only 1 c=
har, it
> +                * doesn't get transmitted
> +                */
> +               data->data.dma.txconf.dst_maxburst =3D 1;
> +       }
> +
>
> Cheers,
> Biju
>
> > -----Original Message-----
> > From: Biju Das
> > Sent: 04 July 2022 08:12
> > To: Jiri Slaby <jirislaby@kernel.org>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Miquel Raynal
> > <miquel.raynal@bootlin.com>; Emil Renner Berthing <kernel@esmil.dk>; Ph=
il
> > Edworthy <phil.edworthy@renesas.com>; Johan Hovold <johan@kernel.org>;
> > linux-serial@vger.kernel.org; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Chris Paterson <Chris.Paterson2@renesas.com>=
;
> > Biju Das <biju.das@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> > Subject: RE: [PATCH] serial: 8250: dw: Fix the macro
> > RZN1_UART_xDMACR_8_WORD_BURST
> >
> > Hi Jiri,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH] serial: 8250: dw: Fix the macro
> > > RZN1_UART_xDMACR_8_WORD_BURST
> > >
> > > On 30. 06. 22, 10:39, Biju Das wrote:
> > > > As per RZ/N1 peripheral user
> > > > manual(r01uh0752ej0100-rzn1-peripheral.pdf)
> > > > rev 1.0.0 Mar,2019,
> > >
> > > Is this public anywhere?
> >
> > Yes, It is available here[1] see page 72 and 73.
> >
> > [1] https://www.renesas.com/us/en/document/mah/rzn1d-group-rzn1s-group-
> > rzn1l-group-users-manual-peripherals?language=3Den&r=3D1054561
> >
> >
> > >
> > > > the value for 8_WORD_BURST is 4(b2,b1=3D2=E2=80=99b10).
> > > >
> > > > This patch fixes the macro as per the user manual.
> > >
> > > I'm curious, is the bottom bit from "3" ignored by the HW or does thi=
s
> > > fix a real problem in behavior? Stating that might help backporters t=
o
> > > decide if to take the patch or not.
> >
> > See page 72 and 73.
> >
> > Yes, it fixes a real problem as by using a value of 8 , you are wrongly
> > configuring DMA_BURST_SIZE of 1 instead of DMA_BURST_SIZE of 8.
> >
> > b2, b1 bUart_DEST_BURST
> > _SIZE
> > DEST_BURST_SIZE
> > Destination Burst Transaction Size in Transmit FIFO.
> > UART is the flow controller. Thus, the user must write this field befor=
e
> > or at the same time the DMA mode is enabled. Number of data byte, to be
> > written to the Transmit FIFO every time a transmit burst transaction
> > request are made on DMA request.
> > 2=E2=80=99b00 =3D 1 byte
> > 2=E2=80=99b01 =3D 4 bytes
> > 2=E2=80=99b10 =3D 8 bytes
> > 2=E2=80=99b11 =3D Reserved, not used
> >
> > Cheers,
> > Biju
> >
> >
> > >
> > > > Fixes: aa63d786cea2 ("serial: 8250: dw: Add support for DMA flow
> > > > controlling devices")
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > >   drivers/tty/serial/8250/8250_dw.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/tty/serial/8250/8250_dw.c
> > > > b/drivers/tty/serial/8250/8250_dw.c
> > > > index f57bbd32ef11..931490b27d6b 100644
> > > > --- a/drivers/tty/serial/8250/8250_dw.c
> > > > +++ b/drivers/tty/serial/8250/8250_dw.c
> > > > @@ -47,7 +47,7 @@
> > > >   #define RZN1_UART_xDMACR_DMA_EN         BIT(0)
> > > >   #define RZN1_UART_xDMACR_1_WORD_BURST   (0 << 1)
> > > >   #define RZN1_UART_xDMACR_4_WORD_BURST   (1 << 1)
> > > > -#define RZN1_UART_xDMACR_8_WORD_BURST    (3 << 1)
> > > > +#define RZN1_UART_xDMACR_8_WORD_BURST    (2 << 1)
> > > >   #define RZN1_UART_xDMACR_BLK_SZ(x)      ((x) << 3)
> > > >
> > > >   /* Quirks */
> > >
> > > thanks,
> > > --
> > > js



--=20
With Best Regards,
Andy Shevchenko
