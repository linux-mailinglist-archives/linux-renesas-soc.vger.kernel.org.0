Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA613A1999
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 17:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236513AbhFIPci (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 11:32:38 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:38629 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbhFIPch (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 11:32:37 -0400
Received: by mail-vs1-f51.google.com with SMTP id x8so144332vso.5;
        Wed, 09 Jun 2021 08:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5VIIkzelMv7/CVp57eQ28eIePtVGukMPb/+T/jS9W/o=;
        b=TMB4eVHvBJgo1R3Lqjb+tYkqUAOxdirBt53RwELF4QPeHYDJF2ut9U00Kx6CQ8MeQr
         3lPGBs6ysLaaorbHfpavanbVbulC42CuAPc/nwLQW8xt/Qj8ueR1wzsX7BF1ihjLZ9Qs
         nr/Hn6yNcmwBpI+paFzR3nUlx/fykZ83JgHasPYymlCQtr9Qx9URiSBwHLmncRIWDpq0
         QeYCjwbCIhIPrlG4Tjrxch5r/EjzdjlhQ6wNRC4dKif+/SkWkuFV1+fhReK2hDfFDwbA
         PSlz0D/ujcZcy5p9Uk2pmxsFIPNcRAPVPP3VyOzChPtfHrO4DVBXhqG9jycRVHfN9/uQ
         jaew==
X-Gm-Message-State: AOAM533EuKzQ9TLQgq1NMzeP0a1+T9vnKX9Zw2aqGZoOOQ/lMnCjNFxy
        Ryg0j655BT5gX2O312xdpbqC4+7W6xYCbgJccO8=
X-Google-Smtp-Source: ABdhPJzLvtMpkpYCQsS5rtqBsZHNCQ1AwyEOm4fpK+Q1sAWXkOVxaVe/oFCRLQe0boUJaNRrPxXofC8QcNUFBf7zW1M=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr728988vsp.3.1623252636626;
 Wed, 09 Jun 2021 08:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210609014902.271237-1-yoshihiro.shimoda.uh@renesas.com> <ac930164-6150-4358-8fe9-ab87654f68ce@gmail.com>
In-Reply-To: <ac930164-6150-4358-8fe9-ab87654f68ce@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jun 2021 17:30:25 +0200
Message-ID: <CAMuHMdW9oV80QdZmgwJBF99jnw56XuTSkanjHCdBY+h4jAVGew@mail.gmail.com>
Subject: Re: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in sci_stop_tx()
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Wed, Jun 9, 2021 at 5:09 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 6/9/21 4:49 AM, Yoshihiro Shimoda wrote:
> > Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> > message is possible output when system enters suspend and while
> > transferring data, because clearing TIE bit in SCSCR is not able to
> > stop any dmaengine transfer.
> >
> >     sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> >
> > Note that this patch uses dmaengine_terminate_async() so that
> > we can apply this patch into longterm kernel v4.9.x or later.
> >
> > Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  Changes from v2:
> >  - Don't use a macro.
> >  - Revise the commit descrption.
> >  https://lore.kernel.org/linux-renesas-soc/20210604095704.756190-1-yoshihiro.shimoda.uh@renesas.com/
> >
> >  Changes from v1:
> >  - Don't put #ifdef in the .c file.
> >  - Update the commit description.
> >  https://lore.kernel.org/linux-renesas-soc/20210602114108.510527-1-yoshihiro.shimoda.uh@renesas.com/
> >
> >  drivers/tty/serial/sh-sci.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > index 4baf1316ea72..2d5487bf6855 100644
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -610,6 +610,14 @@ static void sci_stop_tx(struct uart_port *port)
> >       ctrl &= ~SCSCR_TIE;
> >
> >       serial_port_out(port, SCSCR, ctrl);
> > +
> > +#ifdef CONFIG_SERIAL_SH_SCI_DMA
>
>    Why not use IS_ENABLED() instead? Gets rid of #ifdef. :-)
>
> > +     if (to_sci_port(port)->chan_tx &&
> > +         !dma_submit_error(to_sci_port(port)->cookie_tx)) {
> > +             dmaengine_terminate_async(to_sci_port(port)->chan_tx);
> > +             to_sci_port(port)->cookie_tx = -EINVAL;

Because chan_tx and cookie_tx do not exist if CONFIG_SERIAL_SH_SCI_DMA
is disabled.

Yes, that's why all the DMA code in this driver (.c file) is protected by
#ifdef CONFIG_SERIAL_SH_SCI_DMA.

> > +     }
> > +#endif
> >  }
> >
> >  static void sci_start_rx(struct uart_port *port)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
