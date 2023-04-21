Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59D936EA794
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 11:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjDUJuO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 05:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbjDUJuL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 05:50:11 -0400
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9CDB770;
        Fri, 21 Apr 2023 02:49:51 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-b992ed878ebso1431886276.0;
        Fri, 21 Apr 2023 02:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682070591; x=1684662591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrQ6XHX+t6SNbeGs4+tmUT1mKD/RRbbd4Hf3TK6UCe4=;
        b=WC2CaBM/kl39ZUZzrc+iY6lHjivBFtmN3I/wg1tpRZ/PgUiBDbIdtePYL+jIRfWHS5
         0hOTNc3mz57D+GtNomrumNRcr+IaafmxzSmoNhucpgKv8z7S+XC/IK219TjGONPYoHfh
         Tjsa5iqJHb2vxyZzzDAt6nZs+3cy7uKLmfaXk7oFJiZ9mTnrcaVTfI6RrJrSSqekaPgw
         i3/YG+//EwuYHN/EK9MSG+kSAwrWA7rnQOiX+Tv7lMN+LTazcdkRx9b1nCRaueCMmvEz
         LdQtcIrkWZQ8PIhWEeQwmlK984d8vQlUnaEu6Bhcd2+tYuihe/fvnbvbm5mETU0q10MH
         3wPA==
X-Gm-Message-State: AAQBX9exraMYTXx2BBObCIG3NtOkYiCT8oYbRBStb9s4oofyL13mr4yy
        GmQ/i30cSxqDqQ0PI1FvYQMhQjPGsOU0AWzZ
X-Google-Smtp-Source: AKy350Z2k1erHwszvDWF8M+vaWUDoC4gGIK1ncc26yy5BaC64P7LXXzYF2guCgXQl2k86pzxtoszog==
X-Received: by 2002:a25:38a:0:b0:b95:71e8:f22f with SMTP id 132-20020a25038a000000b00b9571e8f22fmr1736661ybd.10.1682070590679;
        Fri, 21 Apr 2023 02:49:50 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id v187-20020a0dd3c4000000b00555c30ec361sm835132ywd.143.2023.04.21.02.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 02:49:50 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-b95c3b869dcso3457080276.1;
        Fri, 21 Apr 2023 02:49:50 -0700 (PDT)
X-Received: by 2002:a0d:dbcb:0:b0:54f:8636:2152 with SMTP id
 d194-20020a0ddbcb000000b0054f86362152mr1409409ywe.15.1682070590014; Fri, 21
 Apr 2023 02:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230412145053.114847-1-biju.das.jz@bp.renesas.com> <20230412145053.114847-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230412145053.114847-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Apr 2023 11:49:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQ05U9oiepVJsShg8xFoHTD6M7XczQ2=Qce+pE+0RPag@mail.gmail.com>
Message-ID: <CAMuHMdUQ05U9oiepVJsShg8xFoHTD6M7XczQ2=Qce+pE+0RPag@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] tty: serial: sh-sci: Fix end of transmission on SCI
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

On Wed, Apr 12, 2023 at 4:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> We need to set TE to "0" (i.e., disable serial transmission) to
> get the expected behavior of the end of serial transmission.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -847,6 +847,11 @@ static void sci_transmit_chars(struct uart_port *port)
>                 } else if (!uart_circ_empty(xmit) && !stopped) {
>                         c = xmit->buf[xmit->tail];
>                         xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
> +               } else if (port->type == PORT_SCI && uart_circ_empty(xmit)) {
> +                       ctrl = serial_port_in(port, SCSCR);
> +                       ctrl &= ~SCSCR_TE;
> +                       serial_port_out(port, SCSCR, ctrl);
> +                       return;

So nothing after the while loop should be done anymore?
What about clearing SCSCR_TE in sci_stop_tx() (which is called after
the while loop) instead?

>                 } else {
>                         break;
>                 }

So combined with my comments on patch 4/5, that would become

-    if (port->type == PORT_SCI)
+    if (port->type == PORT_SCI) {
             ctrl |= SCSCR_TEIE;
+            ctrl &= ~SCSCR_TE;
+    }

in sci_stop_tx().

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
