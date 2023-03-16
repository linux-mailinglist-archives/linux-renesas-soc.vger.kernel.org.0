Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 685E96BD4CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Mar 2023 17:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjCPQNQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Mar 2023 12:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbjCPQNP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 12:13:15 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09704E5ED;
        Thu, 16 Mar 2023 09:13:13 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id y10so2284552qtj.2;
        Thu, 16 Mar 2023 09:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678983192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmrKyJrBgaovJFPyfCA+cqiXaPEYkBUbzyxvJZb9dZM=;
        b=KRq78lyExKHBBJ5ddxeiXq8o3UBpfi+q3iiuvUkAh9f2fxIicJUYf3/duSNhGKUtbY
         f/zBr/BS1fDnfNRUpOdNuVj1ok+ADND/rCRVYeQq/vJHn++yxskoTHZ2JDeA80I5YsS7
         IxHxGZA+cIqq2SSOb+b0qS7yFAENJYFsLm7zwA7/V0tNpowMA49rpwnunOOlindYbb9I
         h40a9j2//tx3ySAVQuOHTN6/XA+Gpzt7qL2lliBKonTvTUHiJGNB6pjkr3esV5l+GaZG
         VNT2WisaYSXXEf0iPmcIEjDMh2BB/wEQzc3VHKSsQN9POHJ/U3U0aOsNeYPqgetNQZUM
         Bzlw==
X-Gm-Message-State: AO0yUKUCKuPx5PbkMiVFb4CBPsxiAy8zXkpno/Q9I0BA/tVDYjnJS9KK
        Xb4CedrfV2yPZnPOmBk8k0rBOUPRGQ4udQ==
X-Google-Smtp-Source: AK7set+eVJgiwVCW97iTF18e2xcc//jVn0FQJDMUMBZT9ts9aWhrQpZa9Un1UmaZZbD+YvDHSe5NtA==
X-Received: by 2002:ac8:5b85:0:b0:3d9:cb72:3643 with SMTP id a5-20020ac85b85000000b003d9cb723643mr97799qta.66.1678983192510;
        Thu, 16 Mar 2023 09:13:12 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id g14-20020a05620a218e00b007457bc9a047sm6040626qka.50.2023.03.16.09.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 09:13:12 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id e71so2575777ybc.0;
        Thu, 16 Mar 2023 09:13:11 -0700 (PDT)
X-Received: by 2002:a05:6902:145:b0:ac2:a7a7:23c3 with SMTP id
 p5-20020a056902014500b00ac2a7a723c3mr21862516ybh.12.1678983191743; Thu, 16
 Mar 2023 09:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Mar 2023 17:13:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
Message-ID: <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-serial@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
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

On Thu, Mar 16, 2023 at 5:01 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The RZ SCI/ RZ/A1 SCIF has only 4 interrupts. The fourth interrupt
> is transmit end interrupt, so shuffle the interrupts to fix the
> transmit end interrupt handler for these IPs.
>
> Fixes: 392fb8df528b ("serial: sh-sci: Use platform_get_irq_optional() for optional interrupts")

I don't think that's the right bad commit.

> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -31,6 +31,7 @@
>  #include <linux/ioport.h>
>  #include <linux/ktime.h>
>  #include <linux/major.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/of.h>
> @@ -2841,6 +2842,7 @@ static int sci_init_single(struct platform_device *dev,
>         struct uart_port *port = &sci_port->port;
>         const struct resource *res;
>         unsigned int i;
> +       int irq_cnt;
>         int ret;
>
>         sci_port->cfg   = p;
> @@ -2864,6 +2866,14 @@ static int sci_init_single(struct platform_device *dev,
>                         sci_port->irqs[i] = platform_get_irq(dev, i);
>         }
>
> +       /*
> +        * RZ SCI/ RZ/A1 SCIF has only 4 interrupts. The fourth interrupt
> +        * is transmit end interrupt, so shuffle the interrupts.
> +        */
> +       irq_cnt = platform_irq_count(dev);
> +       if (irq_cnt == 4)
> +               swap(sci_port->irqs[SCIx_BRI_IRQ], sci_port->irqs[SCIx_TEI_IRQ]);
> +

I think it's simpler to just check if SCIx_TEI_IRQ is missing:

    if (sci_port->irqs[SCIx_TEI_IRQ] < 0)
            swap(sci_port->irqs[SCIx_BRI_IRQ], sci_port->irqs[SCIx_TEI_IRQ]);

We already rely on "make dtbs_check" to catch invalid combinations
(anything different from 1/4/6 interrupts).

And please move that code below, together with the other checks for
non-existing interrupts.

>         /* The SCI generates several interrupts. They can be muxed together or
>          * connected to different interrupt lines. In the muxed case only one
>          * interrupt resource is specified as there is only one interrupt ID.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
