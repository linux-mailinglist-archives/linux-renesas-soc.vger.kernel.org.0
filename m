Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010596BD798
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Mar 2023 18:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbjCPRzZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Mar 2023 13:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbjCPRzR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 13:55:17 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03344CDF7;
        Thu, 16 Mar 2023 10:54:59 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id fy17so119666qtb.2;
        Thu, 16 Mar 2023 10:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678989297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XEqXJNTIv0ppIS+gmuWapWAt4V7zUutlS0jW2Y5bsWU=;
        b=e/v2SS5ydH3N3r9T/CDQFv67+nMujWt4I2Ov+ZQMvjAtO6ce2lLOE6zmH08j4q+PmP
         xbZsy34zxBBc4vbltctMsW4wrpWclGSykchWUoUjQCfmWC093sJc7xSBHeQLqw7govSD
         deyoHXpFyCYGulc/UstkPOXptcH3Xovo4uS1aRl5IAE0qa8xd9ikyhoOu+teFZp7VSHf
         Cihe2IArL63WjWletbvP8L+hqSMDwYA+lPDaZ8C22ndJ14IK554iFkRyuhr4qrV89D/F
         DkCEydyzLqE+M10XdbnCWlGbhY0b03HfFZZG2GwM+kk6QvZSlMHr0Jn0stgmz9KhKxCM
         pADw==
X-Gm-Message-State: AO0yUKWQLaqIp1/VF3Ng4n4MyJVwbEI/vLyGsJiR1mP4YcGUFhMU3s80
        9H3P8MBl68y3HXMLLN6RibIvJDQ3OumXyg==
X-Google-Smtp-Source: AK7set+xoAy4XXLwn3W5jSjNSXmG1340rKwFWY0WlqOBYst1KllSnjZ/YK/j070m3rsDJ3lRySjBpw==
X-Received: by 2002:a05:622a:10b:b0:3d8:a785:ec01 with SMTP id u11-20020a05622a010b00b003d8a785ec01mr3505501qtw.48.1678989297694;
        Thu, 16 Mar 2023 10:54:57 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id f33-20020a05622a1a2100b003bfb5fd72a7sm6389630qtb.86.2023.03.16.10.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 10:54:57 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id r1so2911181ybu.5;
        Thu, 16 Mar 2023 10:54:57 -0700 (PDT)
X-Received: by 2002:a5b:68c:0:b0:b30:d9c:b393 with SMTP id j12-20020a5b068c000000b00b300d9cb393mr14551387ybq.12.1678989296781;
 Thu, 16 Mar 2023 10:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com> <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Mar 2023 18:54:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
Message-ID: <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Mar 16, 2023 at 5:34 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler

> > On Thu, Mar 16, 2023 at 5:01 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > The RZ SCI/ RZ/A1 SCIF has only 4 interrupts. The fourth interrupt is
> > > transmit end interrupt, so shuffle the interrupts to fix the transmit
> > > end interrupt handler for these IPs.
> > >
> > > Fixes: 392fb8df528b ("serial: sh-sci: Use platform_get_irq_optional()
> > > for optional interrupts")
> >
> > I don't think that's the right bad commit.
>
> OK. I will use below commit as fixes one,
> that is the commit which added RZ/A1 SCIF with 4 interrupts.
>
> commit 8b0bbd956228ae87 ("serial: sh-sci: Add support for R7S9210")

That one added support for RZ/A2, and is also not the bad
commit?

> > > --- a/drivers/tty/serial/sh-sci.c
> > > +++ b/drivers/tty/serial/sh-sci.c
> > > @@ -31,6 +31,7 @@
> > >  #include <linux/ioport.h>
> > >  #include <linux/ktime.h>
> > >  #include <linux/major.h>
> > > +#include <linux/minmax.h>
> > >  #include <linux/module.h>
> > >  #include <linux/mm.h>
> > >  #include <linux/of.h>
> > > @@ -2841,6 +2842,7 @@ static int sci_init_single(struct platform_device
> > *dev,
> > >         struct uart_port *port = &sci_port->port;
> > >         const struct resource *res;
> > >         unsigned int i;
> > > +       int irq_cnt;
> > >         int ret;
> > >
> > >         sci_port->cfg   = p;
> > > @@ -2864,6 +2866,14 @@ static int sci_init_single(struct platform_device
> > *dev,
> > >                         sci_port->irqs[i] = platform_get_irq(dev, i);
> > >         }
> > >
> > > +       /*
> > > +        * RZ SCI/ RZ/A1 SCIF has only 4 interrupts. The fourth interrupt
> > > +        * is transmit end interrupt, so shuffle the interrupts.
> > > +        */
> > > +       irq_cnt = platform_irq_count(dev);
> > > +       if (irq_cnt == 4)
> > > +               swap(sci_port->irqs[SCIx_BRI_IRQ],
> > > + sci_port->irqs[SCIx_TEI_IRQ]);
> > > +
> >
> > I think it's simpler to just check if SCIx_TEI_IRQ is missing:
> >
> >     if (sci_port->irqs[SCIx_TEI_IRQ] < 0)
> >             swap(sci_port->irqs[SCIx_BRI_IRQ], sci_port-
> > >irqs[SCIx_TEI_IRQ]);
>
> OK.
>
> >
> > We already rely on "make dtbs_check" to catch invalid combinations (anything
> > different from 1/4/6 interrupts).
> >
> > And please move that code below, together with the other checks for non-
> > existing interrupts.
>
> OK, Will add below code in probe
>
> +       irq_cnt = platform_irq_count(dev);
> +       if (irq_cnt != 1 && irq_cnt != 4 && irq_cnt != 6)
> +               return -EINVAL;
> +

IMHO none of these checks are needed. "make dtbs_check" takes
care of that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
