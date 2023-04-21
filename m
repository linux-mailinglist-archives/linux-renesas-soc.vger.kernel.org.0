Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACAC6EA7CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 12:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbjDUKER convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 06:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbjDUKEP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 06:04:15 -0400
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71154AD1C;
        Fri, 21 Apr 2023 03:04:14 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-b8ed0d0a33dso1886622276.1;
        Fri, 21 Apr 2023 03:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682071453; x=1684663453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXfq5wPcYig3ttn/WfDfPN5Eq2yimQwaoQDMVt582eE=;
        b=U7SZyhaLQF+vuTMA2SzTLXyS5RCre66PwxilzHZmkqrLmfuViQG4GwKR+KsS14rMNw
         KPbB37vIPi8tOQV5pQqOlYkHlKmHF4J+G50IDtm6fxr1ZwZ4KJ+6NWYPX9d9W+B3YmSc
         mfFU3pssBY8GCvgu/BBFkNEIT9D7KUhpuJ/0e3vbGPLST3DkQmDwopa3Ph6eMpg5bW/7
         iHK27YlnxkwgdI4RsVWXPunln1ldNv5uX9//7EgrezOBfd7poHc56Bqkm3xBGIY3g5fc
         3T6meP835rPjzeAUbMsuJpn3mP2u28cX1WFmQdCGprjHGigQ5sIGU+tP2VcYIZmn7avb
         TYIg==
X-Gm-Message-State: AAQBX9f1quO2hIkqII4sm/LEf9+lhYyuebk4RfM+pJx0hSbvysma9uyE
        sGmFOLvFSkh3UntRn+ymGqU6gMo3ltMHK/c7
X-Google-Smtp-Source: AKy350b3e7+T9/qtnqW52e4II+EiDW42l6+2Q2aRsAK2jP1MyG2wJqGcAVeUf4Fkf3rgeQEZyauEfA==
X-Received: by 2002:a25:b0a4:0:b0:b8f:6c2b:8fcf with SMTP id f36-20020a25b0a4000000b00b8f6c2b8fcfmr2076203ybj.13.1682071453312;
        Fri, 21 Apr 2023 03:04:13 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id r125-20020a818183000000b00552ccda9bb3sm858960ywf.92.2023.04.21.03.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 03:04:13 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-b8f5219653fso1875240276.2;
        Fri, 21 Apr 2023 03:04:13 -0700 (PDT)
X-Received: by 2002:a25:6e07:0:b0:b96:ca60:b043 with SMTP id
 j7-20020a256e07000000b00b96ca60b043mr1384310ybc.59.1682071452891; Fri, 21 Apr
 2023 03:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230412145053.114847-1-biju.das.jz@bp.renesas.com>
 <20230412145053.114847-2-biju.das.jz@bp.renesas.com> <CAMuHMdWozy3JLxomwv44aqKFGavC5zyeX6RY7rraR=+CcaB11w@mail.gmail.com>
 <OS0PR01MB59220F311276F8C09603A1AC86609@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59220F311276F8C09603A1AC86609@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Apr 2023 12:04:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZZiy8J7qF+Reij3zFnw3Xvax96FzTzBUmf_=BDpO4vg@mail.gmail.com>
Message-ID: <CAMuHMdXZZiy8J7qF+Reij3zFnw3Xvax96FzTzBUmf_=BDpO4vg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Apr 21, 2023 at 11:56 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Friday, April 21, 2023 10:22 AM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Jiri Slaby
> > <jirislaby@kernel.org>; linux-serial@vger.kernel.org; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> > Subject: Re: [PATCH v4 1/5] tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx
> > support
> >
> > Hi Biju,
> >
> > On Wed, Apr 12, 2023 at 4:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > SCIFA IP on RZ/G2L SoC has the same signal for both interrupt and DMA
> > > transfer request. Setting DMARS register for DMA transfer makes the
> > > signal to work as a DMA transfer request signal and subsequent
> > > interrupt requests to the interrupt controller are masked. Similarly
> > > clearing DMARS register makes signal to work as interrupt signal and
> > > subsequent interrupt requests to the interrupt controller are
> > > unmasked.
> > >
> > > Add SCIFA DMA tx support for RZ/G2L alike SoCs by disabling TXI line
> > > interrupt and setting DMARS registers by DMA api for DMA transfer request.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v3->v4:
> > >  * Updated commit description by removing tx end interrupt.
> >
> > Thanks for the update!
> >
> > > --- a/drivers/tty/serial/sh-sci.c
> > > +++ b/drivers/tty/serial/sh-sci.c
> > > @@ -588,12 +588,17 @@ static void sci_start_tx(struct uart_port *port)
> > >
> > >         if (s->chan_tx && !uart_circ_empty(&s->port.state->xmit) &&
> > >             dma_submit_error(s->cookie_tx)) {
> > > +               if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
> > > +                       /* Switch irq from SCIF to DMA */
> > > +                       disable_irq(s->irqs[SCIx_TXI_IRQ]);
> >
> > Please wrap this block inside curly braces.
>
> I thought, for single if statement braces not needed.
> That is why I haven't added. Am I missing anything here?

Technically, it's indeed a single statement.  But combined with the comment,
it spans multiple lines.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
