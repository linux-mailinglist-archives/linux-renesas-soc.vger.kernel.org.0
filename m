Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED03638C800
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 15:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbhEUN2j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 09:28:39 -0400
Received: from mail-vk1-f174.google.com ([209.85.221.174]:42624 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbhEUN2V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 09:28:21 -0400
Received: by mail-vk1-f174.google.com with SMTP id m129so4284671vkh.9;
        Fri, 21 May 2021 06:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nALjNO1NNzuBgJsBKkuRLfzdmUfp2pocRq1SvmK+pwE=;
        b=YUJFx5Zmykk5cG0kxcCgQY0g0TaNYgRTnTOEDLcZLbsfElzudVxkBfN/p4W1BBCWAx
         J4a0JCxtrPS0YKnTmlQuAFoVOMpEcCzBQaBegg3BsWL4V8WzHUAiJkTLV/2UKL1GxvnQ
         /q7CsSabHnonJqyBHsjIYyJKdMLt8gamDNjMyD8+KrSx6GK8TJWK5sneQXO2OAGqMbfN
         IqClszA5uXHGTYZ8d9I/oUo+C4kX/2Fm8E7y+/GAOYsbRQHqANYYoef/uyEBL2ez1GZU
         PBA7qDIazQWIEAvZrDl+LE/wlBhULbnev2xjs61eqmHORxungV5VwOlpmFPPKkmBvzxZ
         3q3A==
X-Gm-Message-State: AOAM533PeIEcix13lrA26nenKW2clpCJnAOVMBHofBTa/j9YrPMcZwOn
        W35+GsqV+wNxSP2MeuYFTV5FaSEJtoYi5cD5110=
X-Google-Smtp-Source: ABdhPJygoEQwq7jd+zWCduTRNR1S0jH3r5s+WptgfvrzjUs6HpafzgXjDNeh7jnILhWaxTadyffP3VHnsfRzwl6y/KY=
X-Received: by 2002:a1f:d8c3:: with SMTP id p186mr9636190vkg.1.1621603617121;
 Fri, 21 May 2021 06:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 15:26:45 +0200
Message-ID: <CAMuHMdXNzvTW920fJ2fKDWe=+CppfRdThKudTh51EW4fY2eRFg@mail.gmail.com>
Subject: Re: [PATCH 10/16] serial: sh-sci: Add support for RZ/G2L SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Chris Brandt <Chris.Brandt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add serial support for RZ/G2L SoC with earlycon and
> extended mode register support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -306,6 +306,7 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
>                         [SCFDR]         = { 0x0E, 16 },
>                         [SCSPTR]        = { 0x10, 16 },
>                         [SCLSR]         = { 0x12, 16 },
> +                       [SEMR]          = { 0x14, 8 },

This is the parameter section for RZ/T and RZ/A2.  Please update the
comments above, to say this also applies to RZ/G2L.
I can confirm the documentation for RZ/T1 and RZ/A2 agrees about the
existence and behavior of SEMR.

>                 },
>                 .fifosize = 16,
>                 .overrun_reg = SCLSR,
> @@ -2527,6 +2528,8 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
>                         case 27: smr_val |= SCSMR_SRC_27; break;
>                         }
>                 smr_val |= cks;
> +               if (sci_getreg(port, SEMR)->size)
> +                       serial_port_out(port, SEMR, 0);

As this is done in both branches of the if() statement, I think it
should be moved up.

>                 serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
>                 serial_port_out(port, SCSMR, smr_val);
>                 serial_port_out(port, SCBRR, brr);
> @@ -2561,6 +2564,8 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
>                 scr_val = s->cfg->scscr & (SCSCR_CKE1 | SCSCR_CKE0);
>                 smr_val |= serial_port_in(port, SCSMR) &
>                            (SCSMR_CKEDG | SCSMR_SRC_MASK | SCSMR_CKS);
> +               if (sci_getreg(port, SEMR)->size)
> +                       serial_port_out(port, SEMR, 0);

(else branch)

>                 serial_port_out(port, SCSCR, scr_val | s->hscif_tot);
>                 serial_port_out(port, SCSMR, smr_val);
>         }
> @@ -3170,6 +3175,10 @@ static const struct of_device_id of_sci_match[] = {
>                 .compatible = "renesas,scif-r7s9210",
>                 .data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE),
>         },
> +       {
> +               .compatible = "renesas,scif-r9a07g044",
> +               .data = SCI_OF_DATA(PORT_SCIF, SCIx_RZ_SCIFA_REGTYPE),
> +       },
>         /* Family-specific types */
>         {
>                 .compatible = "renesas,rcar-gen1-scif",

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
