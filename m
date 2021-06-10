Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F983A24E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 08:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhFJHA0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 03:00:26 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:38744 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhFJHA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 03:00:26 -0400
Received: by mail-vs1-f50.google.com with SMTP id x8so1311500vso.5;
        Wed, 09 Jun 2021 23:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UUK5A8y0i3CSxDWdiohVrmH14HslBm7Mhl1BivLex1Q=;
        b=K5ClchpojM55/Kw/GNdK5djKJ+muHaM5dygauUqFjxduCp4v5sV0chPI9G6CRnCsCq
         1s0eUf5UyT+XFBJDAPanOAOVRCUlKczwnZELxfY3xDERwtk4Qxmx97JuN1chJt6W2qJx
         LTmkfvtvFAL+2KD0U9dOql7P2iIOOBe0FBnmfXdUbNteJy2e2NJpqV2S8O8WM52NzX4H
         s3XasdgwK0/n6YgpwFz0jxAy1WFbfbPXyE/ndhELV6o30EdiQwL/52GCoNGI/M8blkXz
         fJWwA9F6UFG5Yo4qHAbDFxLPlFvQOM6Gn5w8lSNxTsLf3hvt2/JejeDI0GWGJKBrejCv
         DWHg==
X-Gm-Message-State: AOAM531SbsnIgAonyB5zy2NepoG6cGgSmqxBNtay+OUpKbXb0iHUIKq1
        7h07c3mG7a3kVlF1UA/w/qJrvJsgw/2LXf+7gns=
X-Google-Smtp-Source: ABdhPJzhuPg2ru7G+1D9nNr+e+pWGdEkTyNoRRpoPTOom7myuEb3Hq8mzyQWPXruFXyQdouC2lvZBSHMT6ppEfvo4V0=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr2899706vsr.40.1623308295528;
 Wed, 09 Jun 2021 23:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210609014902.271237-1-yoshihiro.shimoda.uh@renesas.com>
 <ac930164-6150-4358-8fe9-ab87654f68ce@gmail.com> <CAMuHMdW9oV80QdZmgwJBF99jnw56XuTSkanjHCdBY+h4jAVGew@mail.gmail.com>
 <TY2PR01MB369260DF38C0FC6E58D65362D8359@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB369260DF38C0FC6E58D65362D8359@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jun 2021 08:58:04 +0200
Message-ID: <CAMuHMdU23gB8Bap3qoypXkJhu=jwS-MQ=mu-CdzqijoWzc4rOg@mail.gmail.com>
Subject: Re: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in sci_stop_tx()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Jun 10, 2021 at 2:50 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, June 10, 2021 12:30 AM
> > On Wed, Jun 9, 2021 at 5:09 PM Sergei Shtylyov
> > <sergei.shtylyov@gmail.com> wrote:
> > > On 6/9/21 4:49 AM, Yoshihiro Shimoda wrote:
> > > > Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> > > > message is possible output when system enters suspend and while
> > > > transferring data, because clearing TIE bit in SCSCR is not able to
> > > > stop any dmaengine transfer.
> > > >
> > > >     sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> > > >
> > > > Note that this patch uses dmaengine_terminate_async() so that
> > > > we can apply this patch into longterm kernel v4.9.x or later.
> > > >
> > > > Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > ---
> > > >
> > > >  drivers/tty/serial/sh-sci.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > > > index 4baf1316ea72..2d5487bf6855 100644
> > > > --- a/drivers/tty/serial/sh-sci.c
> > > > +++ b/drivers/tty/serial/sh-sci.c
> > > > @@ -610,6 +610,14 @@ static void sci_stop_tx(struct uart_port *port)
> > > >       ctrl &= ~SCSCR_TIE;
> > > >
> > > >       serial_port_out(port, SCSCR, ctrl);
> > > > +
> > > > +#ifdef CONFIG_SERIAL_SH_SCI_DMA
> > >
> > >    Why not use IS_ENABLED() instead? Gets rid of #ifdef. :-)
> > >
> > > > +     if (to_sci_port(port)->chan_tx &&
> > > > +         !dma_submit_error(to_sci_port(port)->cookie_tx)) {
> > > > +             dmaengine_terminate_async(to_sci_port(port)->chan_tx);
> > > > +             to_sci_port(port)->cookie_tx = -EINVAL;
> >
> > Because chan_tx and cookie_tx do not exist if CONFIG_SERIAL_SH_SCI_DMA
> > is disabled.
>
> This is a nit though, chan_tx always exists.

I stand corrected, only cookie_tx depends on CONFIG_SERIAL_SH_SCI_DMA.

> > Yes, that's why all the DMA code in this driver (.c file) is protected by
> > #ifdef CONFIG_SERIAL_SH_SCI_DMA.
>
> I'm thinking we have to remove #ifdef from sh-sci.c file at first...

While I don't disagree that would be worthwhile, do we really need
to refactor a driver first, before a fix that follows the existing
driver style can be applied (and backported)?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
