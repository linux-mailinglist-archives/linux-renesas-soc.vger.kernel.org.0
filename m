Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289803A24E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 09:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhFJHEG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 03:04:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:56406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229778AbhFJHEE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 03:04:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1E6961374;
        Thu, 10 Jun 2021 07:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623308514;
        bh=kH4pnvJ0MpZOy3As+Jz/LPNcbVZsxfO3CyyE6Knr5Vc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GSDwBMIza/j1wufCVzOT+v6HFmmoDgj/KPuTWQ8QCWxjiIPxBUbjWb8tzOiSraTh5
         Eqh1K/JiPsIdxQ5jm+Is+PIqZSCDGy2XQlQGDWfQVxF4qpZCHoWhDI7QmNK29niNAh
         VP6OBNd7UDRc5p+iAWwr5ezIvJBcpY9NMdk5FYP0=
Date:   Thu, 10 Jun 2021 09:01:52 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Message-ID: <YMG44NgJVTB5tbfI@kroah.com>
References: <20210609014902.271237-1-yoshihiro.shimoda.uh@renesas.com>
 <ac930164-6150-4358-8fe9-ab87654f68ce@gmail.com>
 <CAMuHMdW9oV80QdZmgwJBF99jnw56XuTSkanjHCdBY+h4jAVGew@mail.gmail.com>
 <TY2PR01MB369260DF38C0FC6E58D65362D8359@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdU23gB8Bap3qoypXkJhu=jwS-MQ=mu-CdzqijoWzc4rOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU23gB8Bap3qoypXkJhu=jwS-MQ=mu-CdzqijoWzc4rOg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 10, 2021 at 08:58:04AM +0200, Geert Uytterhoeven wrote:
> Hi Shimoda-san,
> 
> On Thu, Jun 10, 2021 at 2:50 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > From: Geert Uytterhoeven, Sent: Thursday, June 10, 2021 12:30 AM
> > > On Wed, Jun 9, 2021 at 5:09 PM Sergei Shtylyov
> > > <sergei.shtylyov@gmail.com> wrote:
> > > > On 6/9/21 4:49 AM, Yoshihiro Shimoda wrote:
> > > > > Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> > > > > message is possible output when system enters suspend and while
> > > > > transferring data, because clearing TIE bit in SCSCR is not able to
> > > > > stop any dmaengine transfer.
> > > > >
> > > > >     sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> > > > >
> > > > > Note that this patch uses dmaengine_terminate_async() so that
> > > > > we can apply this patch into longterm kernel v4.9.x or later.
> > > > >
> > > > > Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> > > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > > ---
> > > > >
> > > > >  drivers/tty/serial/sh-sci.c | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > >
> > > > > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > > > > index 4baf1316ea72..2d5487bf6855 100644
> > > > > --- a/drivers/tty/serial/sh-sci.c
> > > > > +++ b/drivers/tty/serial/sh-sci.c
> > > > > @@ -610,6 +610,14 @@ static void sci_stop_tx(struct uart_port *port)
> > > > >       ctrl &= ~SCSCR_TIE;
> > > > >
> > > > >       serial_port_out(port, SCSCR, ctrl);
> > > > > +
> > > > > +#ifdef CONFIG_SERIAL_SH_SCI_DMA
> > > >
> > > >    Why not use IS_ENABLED() instead? Gets rid of #ifdef. :-)
> > > >
> > > > > +     if (to_sci_port(port)->chan_tx &&
> > > > > +         !dma_submit_error(to_sci_port(port)->cookie_tx)) {
> > > > > +             dmaengine_terminate_async(to_sci_port(port)->chan_tx);
> > > > > +             to_sci_port(port)->cookie_tx = -EINVAL;
> > >
> > > Because chan_tx and cookie_tx do not exist if CONFIG_SERIAL_SH_SCI_DMA
> > > is disabled.
> >
> > This is a nit though, chan_tx always exists.
> 
> I stand corrected, only cookie_tx depends on CONFIG_SERIAL_SH_SCI_DMA.
> 
> > > Yes, that's why all the DMA code in this driver (.c file) is protected by
> > > #ifdef CONFIG_SERIAL_SH_SCI_DMA.
> >
> > I'm thinking we have to remove #ifdef from sh-sci.c file at first...
> 
> While I don't disagree that would be worthwhile, do we really need
> to refactor a driver first, before a fix that follows the existing
> driver style can be applied (and backported)?

No we do not.  Sorry if this usage is already in the driver, might as
well keep it there, I thought this was an exception and was being added
for the first time here.

thanks,

greg k-h
