Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B501B6CC781
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Mar 2023 18:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbjC1QIg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Mar 2023 12:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbjC1QId (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2023 12:08:33 -0400
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA154E1A7;
        Tue, 28 Mar 2023 09:08:31 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id b18so15759782ybp.1;
        Tue, 28 Mar 2023 09:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680019711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyMC3NXXKfhS+g+wUNoY13/mmDk8SHY9GdaZw/yUsUo=;
        b=HyV+Yrplnl/Ly3Ij2GpDo8Aokal5Qrse0PMR69nSp7BA4nlJYCXrNdiwH9RMhN+EDB
         aXpPaguYSqEvrJAagFK1Ehwj9wqbZXodDHXjvUBe+jvitYXQgSPiGnE2cCNFN9ydzdq+
         ZQfFQYC253I49fEMHv8wacKXo0chWXoDzSPVKc8tEbZhyRjsowiryki6XR0vaDbwphQ0
         hLSOmPnpOmtEpNTytCxv77t66bHhjJQH5SbTKULC97WLiwfqRtqzhOSXL38AB6cM9vUM
         C5gvtZy2f/5yjszdDLQfdQIVVfW8IbuYukjeFf6Q29WcOEAmv9IzOahnxS6o90jmFv+O
         HEiQ==
X-Gm-Message-State: AAQBX9cQWVA5FrDwUODWkzJHgp5tgMM7SSUtVP6zyZaEZaUzYxyM1oHT
        +SFSlviuUyI0kSIJtC0bFBgtB3OTaJLfUA==
X-Google-Smtp-Source: AKy350a9JzcjmgHtqxbU1LeNv2T5iAH0oDqd9fjyYYfYyuvbDyJUJ5vQ3N1lEYfGFIS+lWMpdu18Dw==
X-Received: by 2002:a25:23d6:0:b0:b33:2664:169d with SMTP id j205-20020a2523d6000000b00b332664169dmr19020522ybj.13.1680019710813;
        Tue, 28 Mar 2023 09:08:30 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id q206-20020a25d9d7000000b00b7767ca746esm2960777ybg.11.2023.03.28.09.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 09:08:30 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id p204so15701959ybc.12;
        Tue, 28 Mar 2023 09:08:30 -0700 (PDT)
X-Received: by 2002:a25:2749:0:b0:a99:de9d:d504 with SMTP id
 n70-20020a252749000000b00a99de9dd504mr10294893ybn.12.1680019710146; Tue, 28
 Mar 2023 09:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230324100222.116666-1-biju.das.jz@bp.renesas.com>
 <20230324100222.116666-4-biju.das.jz@bp.renesas.com> <CAMuHMdWQQrjOZk4CHyhMgK0BJjHiRjraDxLtHxx+Ugn10O9ZPA@mail.gmail.com>
 <OS0PR01MB59224361222866394841AB4B86889@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59224361222866394841AB4B86889@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Mar 2023 18:08:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGAs9iZGqvWSz6tjCq+L8D8HMiZB03SbG83j=JT=R+vQ@mail.gmail.com>
Message-ID: <CAMuHMdVGAs9iZGqvWSz6tjCq+L8D8HMiZB03SbG83j=JT=R+vQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tty: serial: sh-sci: Add RZ/G2L SCIF DMA rx support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Mar 28, 2023 at 5:36 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v2 3/3] tty: serial: sh-sci: Add RZ/G2L SCIF DMA rx
> > support
> > On Fri, Mar 24, 2023 at 11:02 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Add SCIF DMA rx support for RZ/G2L alike SoCs.
> > >
> > > RZ/G2L alike SoCs use the same signal for both interrupt and DMA
> > > transfer requests, so we must disable line interrupt while transferring
> > DMA.
> > >
> > > We must set FIFO trigger to 1 so that SCIF will request DMA when there
> > > is a character as SCIF DMA request is based on FIFO data full RDF.
> > >
> > > Based on a patch in the BSP by Long Luu <long.luu.ur@renesas.com>
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/tty/serial/sh-sci.c
> > > +++ b/drivers/tty/serial/sh-sci.c
> > > @@ -1312,9 +1312,13 @@ static void sci_dma_rx_reenable_irq(struct
> > > sci_port *s)
> > >
> > >         /* Direct new serial port interrupts back to CPU */
> > >         scr = serial_port_in(port, SCSCR);
> > > -       if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
> > > -               scr &= ~SCSCR_RDRQE;
> > > +       if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
> > > +           is_rz_scif_port(port, s)) {
> > >                 enable_irq(s->irqs[SCIx_RXI_IRQ]);
> > > +               if (port->type == PORT_SCIF)
> > > +                       scif_set_rtrg(port, s->rx_trigger);
> > > +               else
> > > +                       scr &= ~SCSCR_RDRQE;
> > >         }
> > >         serial_port_out(port, SCSCR, scr | SCSCR_RIE);  } @@ -1735,7
> > > +1739,15 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
> > >                         if (sci_dma_rx_submit(s, false) < 0)
> > >                                 goto handle_pio;
> > >
> > > -                       scr &= ~SCSCR_RIE;
> > > +                       if (is_rz_scif_port(port, s)) {
> > > +                               /* Switch irq from SCIF to DMA */
> > > +
> > > + disable_irq_nosync(s->irqs[SCIx_RXI_IRQ]);
> >
> > Perhaps this can be combined with the disable_irq_nosync() above?
>
> OK, will do, As per Table 22.19 SCIFA Interrupt Sources, DMAC activation
> Only possible with RXI interrupt.
>
> So we need to use "s->irqs[SCIx_RXI_IRQ]" instead of "irq" for RZ/G2L SCIFA.
>
>
> >
> > > +                               scif_set_rtrg(port, 1);
> > > +                               /* DMA need RIE enable */
> > > +                               scr |= SCSCR_RIE;
> > > +                       } else {
> > > +                               scr &= ~SCSCR_RIE;
> > > +                       }
> >
> > ... and this with some other SCIFA code path?
>
> OK.
>
> >
> > Looks like RZ/A2 and RZ/G2L "SCIFA" does have some resemblance with SCIFA,
> > contrary to earlier statements?
> > Perhaps the code can be simplified by treating it even more like a SCIFA?
>
> Yes, new patch looks like
>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 367bdb913d4a..146409e44556 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1299,9 +1299,13 @@ static void sci_dma_rx_reenable_irq(struct sci_port *s)
>
>         /* Direct new serial port interrupts back to CPU */
>         scr = serial_port_in(port, SCSCR);
> -       if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
> -               scr &= ~SCSCR_RDRQE;
> +       if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
> +           s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
>                 enable_irq(s->irqs[SCIx_RXI_IRQ]);
> +               if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
> +                       scif_set_rtrg(port, s->rx_trigger);
> +               else
> +                       scr &= ~SCSCR_RDRQE;
>         }
>         serial_port_out(port, SCSCR, scr | SCSCR_RIE);
>  }
> @@ -1538,7 +1542,8 @@ static enum hrtimer_restart sci_dma_rx_timer_fn(struct hrtimer *t)
>                         tty_flip_buffer_push(&port->state->port);
>         }
>
> -       if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
> +       if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
> +           s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
>                 sci_dma_rx_submit(s, true);
>
>         sci_dma_rx_reenable_irq(s);
> @@ -1662,7 +1667,8 @@ static void sci_request_dma(struct uart_port *port)
>
>                 s->chan_rx_saved = s->chan_rx = chan;
>
> -               if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
> +               if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
> +                   s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
>                         sci_dma_rx_submit(s, false);
>         }
>  }
> @@ -1715,9 +1721,16 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
>                 u16 ssr = serial_port_in(port, SCxSR);
>
>                 /* Disable future Rx interrupts */
> -               if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
> -                       disable_irq_nosync(irq);
> -                       scr |= SCSCR_RDRQE;
> +               if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
> +                   s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE) {
> +                       if (s->cfg->regtype != SCIx_RZ_SCIFA_REGTYPE) {

Please reverse order, and use "==", to match the flow in
sci_dma_rx_reenable_irq() above.

> +                               disable_irq_nosync(irq);

I think that can be s->irqs[SCIx_RXI_IRQ] unconditionally, i.e. outside
the if/else?

> +                               scr |= SCSCR_RDRQE;
> +                       } else {
> +                               disable_irq_nosync(s->irqs[SCIx_RXI_IRQ]);
> +                               scif_set_rtrg(port, 1);
> +                               scr |= SCSCR_RIE;
> +                       }
>                 } else {
>                         if (sci_dma_rx_submit(s, false) < 0)
>                                 goto handle_pio;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
