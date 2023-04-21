Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B25C26EA6D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 11:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjDUJWd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 05:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjDUJWc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 05:22:32 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FCB1B5;
        Fri, 21 Apr 2023 02:22:31 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b8f557b241fso571499276.0;
        Fri, 21 Apr 2023 02:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682068951; x=1684660951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEKA1Gx7mJciCmuYCrZqOgGmz04NJJ/oYo7VmE63L90=;
        b=D8xC/E5mLG1hVgwAgUqVBgGq5fh8DdmPakZ87600JPU1iZ2pprjldCVxRvOdozy3zD
         LX4N4h6X1fciYLaXshC54p0s7DK81ZaUsb2LQZ9MNJH9shLxiXnXvruN7XuDEoK7m/YF
         nIjKA1tszH3SdfyjHm49jRCa8sS6LK6TLr58t5u27VnTqqxbnQTMCVLVhvEqzv3W3bmx
         p8492eSR+RRj3rBKyxXV9F1KF2Em5jGpaoSFBjj8libRGfcQtQKHKy8qa1Qp0x+rKZk5
         EdpQ7ieEAZDmmSkf7TxCmss3CMbTCVUjYj8UkgHtAjtT1aTAuk9/RQLlfLCjfUYE/q0c
         wMag==
X-Gm-Message-State: AAQBX9dZEUsVSdl68sP1FDBE8bjdznyAoSlRoRqhMbnX1Z0eW7RnLYTQ
        jVKyEuLDWXopYGEcbFLwoRUseKdSF8u7mF2X
X-Google-Smtp-Source: AKy350a6C8bonRIoNjdJexdFWFIucGl/xDTjSymQiv8lwC4Epqk+VCG3LdDLmpHJBF648Sm9z0AZIA==
X-Received: by 2002:a25:d8c5:0:b0:b92:5af3:43cf with SMTP id p188-20020a25d8c5000000b00b925af343cfmr1566075ybg.63.1682068950726;
        Fri, 21 Apr 2023 02:22:30 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id e131-20020a253789000000b00b7767ca7473sm848176yba.16.2023.04.21.02.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 02:22:30 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-b97ec4bbc5aso563679276.3;
        Fri, 21 Apr 2023 02:22:29 -0700 (PDT)
X-Received: by 2002:a81:8302:0:b0:54f:9b01:b353 with SMTP id
 t2-20020a818302000000b0054f9b01b353mr1184520ywf.9.1682068949777; Fri, 21 Apr
 2023 02:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230412145053.114847-1-biju.das.jz@bp.renesas.com> <20230412145053.114847-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230412145053.114847-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Apr 2023 11:22:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWozy3JLxomwv44aqKFGavC5zyeX6RY7rraR=+CcaB11w@mail.gmail.com>
Message-ID: <CAMuHMdWozy3JLxomwv44aqKFGavC5zyeX6RY7rraR=+CcaB11w@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] tty: serial: sh-sci: Add RZ/G2L SCIFA DMA tx support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
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

On Wed, Apr 12, 2023 at 4:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> SCIFA IP on RZ/G2L SoC has the same signal for both interrupt
> and DMA transfer request. Setting DMARS register for DMA transfer
> makes the signal to work as a DMA transfer request signal and
> subsequent interrupt requests to the interrupt controller
> are masked. Similarly clearing DMARS register makes signal to work as
> interrupt signal and subsequent interrupt requests to the interrupt
> controller are unmasked.
>
> Add SCIFA DMA tx support for RZ/G2L alike SoCs by disabling TXI line
> interrupt and setting DMARS registers by DMA api for DMA transfer request.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Updated commit description by removing tx end interrupt.

Thanks for the update!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -588,12 +588,17 @@ static void sci_start_tx(struct uart_port *port)
>
>         if (s->chan_tx && !uart_circ_empty(&s->port.state->xmit) &&
>             dma_submit_error(s->cookie_tx)) {
> +               if (s->cfg->regtype == SCIx_RZ_SCIFA_REGTYPE)
> +                       /* Switch irq from SCIF to DMA */
> +                       disable_irq(s->irqs[SCIx_TXI_IRQ]);

Please wrap this block inside curly braces.

> +

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
