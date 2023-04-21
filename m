Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D91C06EA729
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 11:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbjDUJhv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 05:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbjDUJhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 05:37:48 -0400
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DAAAD30;
        Fri, 21 Apr 2023 02:37:46 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-b8f72e5bd9bso1840464276.0;
        Fri, 21 Apr 2023 02:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682069865; x=1684661865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDaFFYSp/Gl66tOipOPliy8BxJXdpMtAui8WP2vHJIM=;
        b=fIX7FNZwNbLBJhVK4GXVw5yRP+JfX8bXuo4pRRCSjnNpV0CAWFP7a81jVrp7fQGvby
         U2cqtqS+eChn4o1URA+VSms2qzHB9LE0o6jqge0pc5wDzdE/8cG1G5SJcvBX18iwnNHh
         lPGMGdyDH+xv16Sic6nVfQSrCFxMDMtOJPudrLFbzpe6u87nIFChhB9jYu9dFtw25cLz
         sKnXMHAZUcaFZqSZkQH1+Zh5wWadyUlpV5d5RLg97g3NYLp2Uf/8x8rNZkDGkw6bbp9w
         w2FD9bRTsdwa1cXNLxWyvJWb0rYJBXnt7lzCq2lcpjVn4MNoqIttFZRmnDxrQIGpuhtc
         XF/g==
X-Gm-Message-State: AAQBX9dwNMByyUxrqGHezfiX4DwkqQQE6RA51d4ebTsbj6arSbv+pGhg
        VRJbqt/b6CqmLiPftlEG8Bo7erwpgBSDBTkN
X-Google-Smtp-Source: AKy350Ypm/4/blvIZ7/4arSVor/Yxf7YX9aaj+cjByUXen+JLuJxnv8G3zZwXd0wW+6aPo0HBx4uWA==
X-Received: by 2002:a25:d049:0:b0:b8f:9b8:ceb7 with SMTP id h70-20020a25d049000000b00b8f09b8ceb7mr1722959ybg.44.1682069865201;
        Fri, 21 Apr 2023 02:37:45 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id b85-20020a253458000000b00b92579d3d7csm837616yba.52.2023.04.21.02.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 02:37:44 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-b8f5400de9eso1822768276.3;
        Fri, 21 Apr 2023 02:37:44 -0700 (PDT)
X-Received: by 2002:a25:d8a:0:b0:b67:3785:823c with SMTP id
 132-20020a250d8a000000b00b673785823cmr1567543ybn.36.1682069864432; Fri, 21
 Apr 2023 02:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230412145053.114847-1-biju.das.jz@bp.renesas.com> <20230412145053.114847-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230412145053.114847-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Apr 2023 11:37:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUa9W3y0uXtKJYBeK57UoD9hz=6c3frXXswpqV16-5mbg@mail.gmail.com>
Message-ID: <CAMuHMdUa9W3y0uXtKJYBeK57UoD9hz=6c3frXXswpqV16-5mbg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] tty: serial: sh-sci: Add support for tx end
 interrupt handling
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial@vger.kernel.org,
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

On Wed, Apr 12, 2023 at 4:57 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per the RZ/G2L users hardware manual (Rev.1.20 Sep, 2022), section
> 23.3.7 Serial Data Transmission (Asynchronous Mode), it is mentioned
> that, set the SCR.TIE bit to 0 and SCR.TEIE bit to 1, after the last
> data to be transmitted are written to the TDR.
>
> This will generate tx end interrupt and in the handler set SCR.TE and
> SCR.TEIE to 0.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -860,9 +860,16 @@ static void sci_transmit_chars(struct uart_port *port)
>
>         if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
>                 uart_write_wakeup(port);
> -       if (uart_circ_empty(xmit))
> -               sci_stop_tx(port);
> +       if (uart_circ_empty(xmit)) {
> +               if (port->type == PORT_SCI) {
> +                       ctrl = serial_port_in(port, SCSCR);
> +                       ctrl &= ~SCSCR_TIE;
> +                       ctrl |= SCSCR_TEIE;
> +                       serial_port_out(port, SCSCR, ctrl);

Clearing SCSCR_TIE is already done in sci_stop_tx() below,
so I think it would be better to just add

    if (port->type == PORT_SCI)
            ctrl |= SCSCR_TEIE

to sci_stop_tx() instead.

> +               }
>
> +               sci_stop_tx(port);
> +       }
>  }

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
