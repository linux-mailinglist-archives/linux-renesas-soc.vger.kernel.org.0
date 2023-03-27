Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDBD6CA0EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 12:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjC0KKm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 06:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232861AbjC0KKl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 06:10:41 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC71246BC;
        Mon, 27 Mar 2023 03:10:39 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id y5so9816127ybu.3;
        Mon, 27 Mar 2023 03:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679911839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38eRzXnmQTJoOZfFPWe4mS/rjKUbad7ZNg+N0ueJexA=;
        b=OMDcbebzwqb4zeQ4f6dhwv9A7FOFZJRunhWMXuAF7o+gHWbGGVBcs5gtrjvsTdUjtX
         655WWcvdoRpzw5NeIU68Pvv/m/H9KUyJSYmR2UJIwb5/OcXTwTnA0ILHTJn/KgVLf/3H
         pCcf+t6rcRahBD9RtbkuY+mfI2C3TsCj5QXKhbV9RaQiUNyRANr+bU4lxUxVkmi/EuFw
         1c4BCl2KG29ckeuUNmYrL64wbEBWSFbQIBxNwcSU4HmeZBA2CAizcR7oqlOX2j9f1THf
         VLcqkgR+jXgHaQAq6lUPnJ1ga3hVwYKOv3tqw0W44yd+9g4vzJWgktFqeHf/Y1cygnRN
         c5Rw==
X-Gm-Message-State: AAQBX9cRGxODmnmU4bYkVuSzUA6ryZw2eqRXcsVryQhl26iNvB1ga4mt
        0VLPYofMoZKZlixC7imDpS17btATJj1Low==
X-Google-Smtp-Source: AKy350bVR/KSZWGnvwPHHXd7I2gDX1Soaoe3BBVM8lWybXjnN/85esq6eWphGoRgQZa9hVEGc/v7Sw==
X-Received: by 2002:a25:468a:0:b0:b3d:5a52:5c6b with SMTP id t132-20020a25468a000000b00b3d5a525c6bmr14736567yba.21.1679911838878;
        Mon, 27 Mar 2023 03:10:38 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id i11-20020a25220b000000b00b7767ca7488sm2203469ybi.37.2023.03.27.03.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:10:38 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-544787916d9so159794547b3.13;
        Mon, 27 Mar 2023 03:10:38 -0700 (PDT)
X-Received: by 2002:a05:690c:3:b0:541:698b:7bdb with SMTP id
 bc3-20020a05690c000300b00541698b7bdbmr3655230ywb.2.1679911838380; Mon, 27 Mar
 2023 03:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230324100222.116666-1-biju.das.jz@bp.renesas.com> <20230324100222.116666-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230324100222.116666-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Mar 2023 12:10:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQQrjOZk4CHyhMgK0BJjHiRjraDxLtHxx+Ugn10O9ZPA@mail.gmail.com>
Message-ID: <CAMuHMdWQQrjOZk4CHyhMgK0BJjHiRjraDxLtHxx+Ugn10O9ZPA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tty: serial: sh-sci: Add RZ/G2L SCIF DMA rx support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
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
> Add SCIF DMA rx support for RZ/G2L alike SoCs.
>
> RZ/G2L alike SoCs use the same signal for both interrupt and DMA transfer
> requests, so we must disable line interrupt while transferring DMA.
>
> We must set FIFO trigger to 1 so that SCIF will request DMA when there is
> a character as SCIF DMA request is based on FIFO data full RDF.
>
> Based on a patch in the BSP by Long Luu
> <long.luu.ur@renesas.com>
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1312,9 +1312,13 @@ static void sci_dma_rx_reenable_irq(struct sci_port *s)
>
>         /* Direct new serial port interrupts back to CPU */
>         scr = serial_port_in(port, SCSCR);
> -       if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
> -               scr &= ~SCSCR_RDRQE;
> +       if (port->type == PORT_SCIFA || port->type == PORT_SCIFB ||
> +           is_rz_scif_port(port, s)) {
>                 enable_irq(s->irqs[SCIx_RXI_IRQ]);
> +               if (port->type == PORT_SCIF)
> +                       scif_set_rtrg(port, s->rx_trigger);
> +               else
> +                       scr &= ~SCSCR_RDRQE;
>         }
>         serial_port_out(port, SCSCR, scr | SCSCR_RIE);
>  }
> @@ -1735,7 +1739,15 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
>                         if (sci_dma_rx_submit(s, false) < 0)
>                                 goto handle_pio;
>
> -                       scr &= ~SCSCR_RIE;
> +                       if (is_rz_scif_port(port, s)) {
> +                               /* Switch irq from SCIF to DMA */
> +                               disable_irq_nosync(s->irqs[SCIx_RXI_IRQ]);

Perhaps this can be combined with the disable_irq_nosync() above?

> +                               scif_set_rtrg(port, 1);
> +                               /* DMA need RIE enable */
> +                               scr |= SCSCR_RIE;
> +                       } else {
> +                               scr &= ~SCSCR_RIE;
> +                       }

... and this with some other SCIFA code path?

Looks like RZ/A2 and RZ/G2L "SCIFA" does have some resemblance with
SCIFA, contrary to earlier statements?
Perhaps the code can be simplified by treating it even more like
a SCIFA?

>                 }
>                 serial_port_out(port, SCSCR, scr);
>                 /* Clear current interrupt */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
