Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0BC690F96
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 18:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjBIRx7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 12:53:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBIRx7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 12:53:59 -0500
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC9936458;
        Thu,  9 Feb 2023 09:53:58 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id j6so1882709qvm.1;
        Thu, 09 Feb 2023 09:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zp99djD9GrZg80V7KOzngX5TgriwArmheztI23QviLE=;
        b=0tT9l8cCDulp1Yb6lBvQDo32dQjI7OeqyMR2Imj1VL9IXvY0QGJeTeM20hDm9k+d3h
         WswTfqzhEtIAWSTl3xxMS+CUULOs19C1v9bOtA6mYlaEvEbrwsqxUWUNkbAP7WAO0aey
         FKOdUTVTvl+T/7+MFmX2zAaxv2jg34n1TqPT+yLNyX+1w4OZ/WN224u/7F2IsKsN+i9+
         4cOHr/nXBH1Hifq98hL87pwoxJnqtRNoIZaS0pkXxu5y1cr53u0bGnPhwTkNVOwRg/vY
         hyb94qZKlTlix1XRCI+eRZ4lqo+NLeeIaopmG5s6bW2Axk3LBN5pv0o8o10cnA9Qi92b
         a2pA==
X-Gm-Message-State: AO0yUKV0qovsp1Yz/1NUBSbNzUHz8j/2fHI26wtG3lzJ1Bt7zCSttQ3N
        1SKBWYtDaSMxSWVYBUIMapYUpVxF/0xQz8sS
X-Google-Smtp-Source: AK7set94KrJkAeNRtmk8dSfe9vzStOLpuaf3oVrFGkfUCuLLe/J53JfWs/pfKWsqJSPx/HgFFBA6mA==
X-Received: by 2002:ad4:4eef:0:b0:538:9623:f077 with SMTP id dv15-20020ad44eef000000b005389623f077mr23817114qvb.12.1675965237384;
        Thu, 09 Feb 2023 09:53:57 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id u63-20020a379242000000b00731c30ac2e8sm1797510qkd.74.2023.02.09.09.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 09:53:55 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-52bdbd30328so35365537b3.8;
        Thu, 09 Feb 2023 09:53:54 -0800 (PST)
X-Received: by 2002:a0d:e004:0:b0:52a:7505:84bc with SMTP id
 j4-20020a0de004000000b0052a750584bcmr1284991ywe.383.1675965234435; Thu, 09
 Feb 2023 09:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com> <20230209132630.194947-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230209132630.194947-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Feb 2023 18:53:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUXyM52qK1=yPq10i9n2apqO_Xvkvbvo6m5pYQebrJ7DQ@mail.gmail.com>
Message-ID: <CAMuHMdUXyM52qK1=yPq10i9n2apqO_Xvkvbvo6m5pYQebrJ7DQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Feb 9, 2023 at 2:30 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per HW manual section 40.6.1, we need to perform FIFO reset + SW
> reset before updating the below registers
>
> FCR[7:5], FCR[3:0], LCR[7][5:0], MCR[6:4], DLL[7:0], DLM[7:0] and
> HCR0[6:5][3:2].
>
> This patch adds serial8250_rzv2m_reg_update() to handle it.
>
> DLL/DLM register can be updated only by setting LCR[7]. So the
> updation of LCR[7] will perform reset for DLL/DLM register changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/8250/8250_em.c
> +++ b/drivers/tty/serial/8250/8250_em.c

> @@ -111,6 +156,10 @@ static int serial8250_em_probe(struct platform_device *pdev)
>         up.port.uartclk = clk_get_rate(priv->sclk);
>
>         up.port.iotype = UPIO_MEM32;
> +
> +       if (of_device_is_compatible(dev->of_node, "renesas,r9a09g011-uart"))
> +               priv->is_rzv2m = true;

Please add an entry to serial8250_em_dt_ids[] instead, providing
a feature flag in of_device_id.data.

> +
>         up.port.serial_in = serial8250_em_serial_in;
>         up.port.serial_out = serial8250_em_serial_out;
>         up.dl_read = serial8250_em_serial_dl_read;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
