Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6895A6CA0CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 12:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbjC0KGs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 06:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbjC0KGr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 06:06:47 -0400
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67B119AC;
        Mon, 27 Mar 2023 03:06:46 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id cf7so9804338ybb.5;
        Mon, 27 Mar 2023 03:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679911606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZM8jmxEwwQzX+T6xlQC5mMvyxg/fLXphXlsDB+rOsjI=;
        b=SJYFufU08Chq6+GVhhoig07ELAoRQJh1EANgledr3W5V+4u+6bmY8CyYg3bbHbCrDL
         IeiOBiQf04idr8NrV6SDSBNpyAoWgFqBvuUWfFquDhB3YNNikNi/hh+UEswV986vi0AE
         +ITwd9zGR2Fnmt1toa5qmANaa3JzEa3SPRGuiDM8WBSpBvfUg1+fTp/PWIPxme3x0rjX
         mnlsHj2TuutQe1Z5AxPX86fRtjZVYtifYRF0rbwJUl71Ru+S9XQ8c2J6KyFg5tm+jiQU
         QOTWyteDs/ONgWN77bH/2oyk0FUvBL0N7gfTU6Fa3KxIypNUEtNhWSYcUz5vS0OUGENh
         cs8w==
X-Gm-Message-State: AAQBX9emMK98kpcJwBZ6+5s/a2YBZ/ZFeCSprUUoQ2of2XBtkG72Pe93
        Tce1Bvg8XSNtBh1sAZrZR0XDBaTOPtOlfg==
X-Google-Smtp-Source: AKy350ZxiLxlCuUvrRv4B3KJGPpFu/cJvDKsW5NOagMiYg7SvqjO/5zkY8RXw8urjZho8Jaad1QTmg==
X-Received: by 2002:a25:ac0e:0:b0:b75:eb12:6a59 with SMTP id w14-20020a25ac0e000000b00b75eb126a59mr12193486ybi.37.1679911605709;
        Mon, 27 Mar 2023 03:06:45 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 64-20020a250643000000b00b7767ca749esm2187513ybg.59.2023.03.27.03.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:06:45 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id r187so9786626ybr.6;
        Mon, 27 Mar 2023 03:06:45 -0700 (PDT)
X-Received: by 2002:a25:bb85:0:b0:b7c:1144:a708 with SMTP id
 y5-20020a25bb85000000b00b7c1144a708mr627103ybg.12.1679911605042; Mon, 27 Mar
 2023 03:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230324100222.116666-1-biju.das.jz@bp.renesas.com> <20230324100222.116666-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230324100222.116666-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Mar 2023 12:06:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxf1Vc0wERHTAPB2BSGZVUnfuBR_ueNXM+hcm92ibr4g@mail.gmail.com>
Message-ID: <CAMuHMdUxf1Vc0wERHTAPB2BSGZVUnfuBR_ueNXM+hcm92ibr4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] tty: serial: sh-sci: Add RZ/G2L SCIF DMA tx support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
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

On Fri, Mar 24, 2023 at 11:02 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SCIF DMA tx support for RZ/G2L alike SoCs.
>
> RZ/G2L alike SoC use the same signal for both interrupt and DMA
> transfer requests, so we must disable line interrupts(tx and tx end)
> while transferring DMA and enable the TIE source interrupt.
>
> Based on a patch in the BSP by Long Luu
> <long.luu.ur@renesas.com>
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -172,6 +172,13 @@ to_sci_port(struct uart_port *uart)
>         return container_of(uart, struct sci_port, port);
>  }
>
> +static inline bool is_rz_scif_port(struct uart_port *port, struct sci_port *s)
> +{
> +       const struct plat_sci_port *p = s->cfg;
> +
> +       return port->type == PORT_SCIF && p->regtype == SCIx_RZ_SCIFA_REGTYPE;

The latter implies the former, so you can drop the first check.
After that, the check becomes sufficiently simple to inline?

> +}
> +
>  static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
>         /*
>          * Common SCI definitions, dependent on the port's regshift
> @@ -588,6 +595,16 @@ static void sci_start_tx(struct uart_port *port)
>
>         if (s->chan_tx && !uart_circ_empty(&s->port.state->xmit) &&
>             dma_submit_error(s->cookie_tx)) {
> +               if (is_rz_scif_port(port, s)) {
> +                       /* Switch irq from SCIF to DMA */
> +                       disable_irq(s->irqs[SCIx_TXI_IRQ]);
> +                       disable_irq(s->irqs[SCIx_TEI_IRQ]);
> +
> +                       /* DMA need TIE enable */
> +                       ctrl = serial_port_in(port, SCSCR);
> +                       serial_port_out(port, SCSCR, ctrl | SCSCR_TIE);

Enabling TIE is also done for SCIFA below (out of visible context).
Perhaps you can combine?

> +               }
> +
>                 s->cookie_tx = 0;
>                 schedule_work(&s->work_tx);
>         }
> @@ -1214,9 +1231,16 @@ static void sci_dma_tx_complete(void *arg)
>                 schedule_work(&s->work_tx);
>         } else {
>                 s->cookie_tx = -EINVAL;
> -               if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
> +               if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
> +                   is_rz_scif_port(port, s)) {
>                         u16 ctrl = serial_port_in(port, SCSCR);
>                         serial_port_out(port, SCSCR, ctrl & ~SCSCR_TIE);
> +                       if (port->type == PORT_SCIF) {

"if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)"?

> +                               /* Switch irq from DMA to SCIF */
> +                               dmaengine_pause(s->chan_tx_saved);
> +                               enable_irq(s->irqs[SCIx_TXI_IRQ]);
> +                               enable_irq(s->irqs[SCIx_TEI_IRQ]);
> +                       }
>                 }
>         }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
