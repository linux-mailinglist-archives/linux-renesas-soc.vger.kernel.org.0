Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D09A199D06
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2020 19:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgCaRiO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Mar 2020 13:38:14 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43757 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgCaRiO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Mar 2020 13:38:14 -0400
Received: by mail-ot1-f67.google.com with SMTP id a6so22884531otb.10;
        Tue, 31 Mar 2020 10:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NatCpzsVL/Jub5SRdDWqKNOUn/yqrxXRqh08wwc8Rqc=;
        b=q7WOvNdBMYWaaTTs44lIA0iZf3uY71uumDtOAzEwNRd4+ZIkKORBNaSe4YzBxhS/K8
         nGThWuu7bA4saYUBkyaHHksD7en8BKTCP3Q5oRYU9cSBGGclIxdjumKmjtiyrQAAP16E
         IxdCuMXO1m4FuoMTffpSu2pcfsJiLll3l+vOM0dYZ+8LIEG43ltGsEpVH63CDnTSn5N8
         EwRYOAaY6PHkx1n3i3Mtc0yMNf4N/eAL4HHUj7KK/TJl1c29pWZP/bCTpBtaSvx/zEc0
         VQGjmfKYbFoZ/IfvOpOLqcnH9f/8ArLaF35lWCWNwP30f2E1e8DrJsR/AzDMmttwLlaO
         sPiw==
X-Gm-Message-State: ANhLgQ0aYmtpiKooaBAu0kWWuUU8+uFq+rY/xhenDKbJnxqBeZh2odG3
        ot8eS09B1P3NTy1efoY198n2ny4mZGanfEDzXfs=
X-Google-Smtp-Source: ADFU+vspEF2v26kohoeQ7QCAm0+UjlxoiRqZx5TDaqKhKoeYsajATEeEwLC7UOQBIc2LLDWOeDRVBW69y/TRQm7lJ2M=
X-Received: by 2002:a9d:7590:: with SMTP id s16mr13796162otk.250.1585676291361;
 Tue, 31 Mar 2020 10:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <1585333048-31828-1-git-send-email-kazuhiro.fujita.jg@renesas.com>
 <CAMuHMdW+u5r6zyxFJsVzj21BYDrKCr=Q6Ojk5VeN+mkhvXX9Jw@mail.gmail.com> <OSBPR01MB3590E3D12546BC6711CEB542AAC80@OSBPR01MB3590.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3590E3D12546BC6711CEB542AAC80@OSBPR01MB3590.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 31 Mar 2020 19:38:00 +0200
Message-ID: <CAMuHMdW+CACQXNa4RZwU4WgPY=Hw4w+o6vQ_c7=PemJOF+Ct6w@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Make sure status register SCxSR is read
 in correct sequence
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hao Bui <hao.bui.yg@renesas.com>,
        KAZUMI HARADA <kazumi.harada.rh@renesas.com>,
        Sasha Levin <sashal@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Tue, Mar 31, 2020 at 5:58 PM Prabhakar Mahadev Lad
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 31 March 2020 16:18
> > To: Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Jiri Slaby <jslaby@suse.com>; open list:SERIAL DRIVERS <linux-
> > serial@vger.kernel.org>; Linux-Renesas <linux-renesas-soc@vger.kernel.org>; Prabhakar <prabhakar.csengg@gmail.com>; Linux Kernel
> > Mailing List <linux-kernel@vger.kernel.org>; Hao Bui <hao.bui.yg@renesas.com>; KAZUMI HARADA <kazumi.harada.rh@renesas.com>;
> > Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Sasha Levin <sashal@kernel.org>; Chris Brandt
> > <Chris.Brandt@renesas.com>
> > Subject: Re: [PATCH] serial: sh-sci: Make sure status register SCxSR is read in correct sequence
>> > On Fri, Mar 27, 2020 at 7:17 PM Kazuhiro Fujita
> > <kazuhiro.fujita.jg@renesas.com> wrote:
> > > For SCIF and HSCIF interfaces the SCxSR register holds the status of
> > > data that is to be read next from SCxRDR register, But where as for
> > > SCIFA and SCIFB interfaces SCxSR register holds status of data that is
> > > previously read from SCxRDR register.
> > >
> > > This patch makes sure the status register is read depending on the port
> > > types so that errors are caught accordingly.
> > >
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>
> > > Signed-off-by: Hao Bui <hao.bui.yg@renesas.com>
> > > Signed-off-by: KAZUMI HARADA <kazumi.harada.rh@renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/tty/serial/sh-sci.c
> > > +++ b/drivers/tty/serial/sh-sci.c
> > > @@ -870,9 +870,16 @@ static void sci_receive_chars(struct uart_port *port)
> > >                                 tty_insert_flip_char(tport, c, TTY_NORMAL);
> > >                 } else {
> > >                         for (i = 0; i < count; i++) {
> > > -                               char c = serial_port_in(port, SCxRDR);
> > > -
> > > -                               status = serial_port_in(port, SCxSR);
> > > +                               char c;
> > > +
> > > +                               if (port->type == PORT_SCIF ||
> > > +                                   port->type == PORT_HSCIF) {
> > > +                                       status = serial_port_in(port, SCxSR);
> > > +                                       c = serial_port_in(port, SCxRDR);
> > > +                               } else {
> > > +                                       c = serial_port_in(port, SCxRDR);
> > > +                                       status = serial_port_in(port, SCxSR);
> > > +                               }
> > >                                 if (uart_handle_sysrq_char(port, c)) {
> > >                                         count--; i--;
> > >                                         continue;
> >
> > I can confirm that the documentation for the Serial Status Register on
> >   1. (H)SCIF on R-Car Gen1/2/3 says the framing/error flag applies to
> >      the data that is "to be read next" from the FIFO., and that the
> >      "Sample Flowchart for Serial Reception (2)" confirms this,
> >   2. SCIF[AB] on R-Car Gen2, SH-Mobile AG5, R-Mobile A1 and APE6 says
> >      the framing/error flag applies to the receive data that is "read"
> >      from the FIFO, and that the "Example of Flow for Serial Reception
> >      (2)" confirms this,
> >   3. SCIF on RZ/A1H says something similar as for (H)SCIF above, using
> >      slightly different wording, also confirmed by the "Sample Flowchart
> >      for Receiving Serial Data (2)".
> >
> > However, the documentation for "SCIFA" on RZ/A2 (for which we use
> > PORT_SCIF, not PORT_SCIFA, in the driver) has conflicting information:
> >   1. Section 17.2.7 "Serial Status Register (FSR)" says:
> >        - A receive framing/parity error occurred in the "next receive
> >          data read" from the FIFO,
> >        - Indicates whether there is a framing/parity error in the data
> >          "read" from the FIFO.
> >   2. Figure 17.8 "Sample Flowchart for Receiving Serial Data in
> >      Asynchronous Mode (2)".
> >        - Whether a framing error or parity error has occurred in the
> >          received data that is "read" from the FIFO.
> >
> > So while the change looks OK for most Renesas ARM SoCs, the situation
> > for RZ/A2 is unclear.
> > Note that the above does not take into account variants used on SuperH
> > SoCs.
> >
> I'll dig out some documentation wrt RZ/A2 & SuperH. Also H8300 needs to be considered.

AFAIK, H8/300 has SCI only, so is not affected.

> By any chance do you have RZ/A2 to test .

Actually I do.

> > Nevertheless, this patch will need some testing on various hardware.
> > Do you have a test case to verify the broken/fixed behavior?
> >
> Agreed, its been tested on RZ/G2x & RZ/G1x  by doing a loopback test, configure one interface as CS8 mode(8-bits data, No parity) and other as CS7 mode (7-bits data, 1-bit Parity) and parity errors should be detected.

Thanks, that's good to know!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
