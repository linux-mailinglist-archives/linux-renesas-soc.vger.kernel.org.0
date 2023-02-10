Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307EA69257C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 19:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbjBJSj4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 13:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232575AbjBJSj4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 13:39:56 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8D722A23;
        Fri, 10 Feb 2023 10:39:54 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id q13so6868340qtx.2;
        Fri, 10 Feb 2023 10:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0YSePjb0L3KZWyxU8wMeNkMM7neyI5evs0/4kJAdso=;
        b=OgIdas6PrWi559bJ5F639I83FgWd5EqtAyRkICMgcDWp/TWAJ2LidaVqJxsJbEzVBA
         2gkGOJao2FkWzxUh7aO1P74YuCl7zkcM2ymrcPqdPsZicNYDsFJ7kmeihTm6LGtJVlkz
         4ghbIfv2h68jC43gkygEDegYrggReTBK3oQfUBOFqlhIMANaRcqHbGZDrPCTDhWO/DEg
         cNd4IOulWC2idubtn9vUIZMTW6hDcq/aCnez1wRx1ot01feRyZUaVMjcPR0xm6apq6NQ
         WiwHkS3VdrepSREupJdHh1l+zuzg3fAMh19P8pSv76HNGXGG6V7+DMhr+FqaNJPZBj4Q
         Q57Q==
X-Gm-Message-State: AO0yUKUbMB56P19HNV/RKMkErWU7YVE1Q3svsvK7aoqNsnXIZIjR3vql
        oENaa9CnFpTNPZHCStAjO13eAu0LGucZTg==
X-Google-Smtp-Source: AK7set/RCV9vkV+xX0Je4abKQV1HhLxmnI0Su/8Qkj7Jhoz5wrGhBuRTc3grH/H0emuopaOxklfC+g==
X-Received: by 2002:a05:622a:1386:b0:3b8:58d0:b4d5 with SMTP id o6-20020a05622a138600b003b858d0b4d5mr26559939qtk.0.1676054393803;
        Fri, 10 Feb 2023 10:39:53 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id t3-20020a379103000000b0070617deb4b7sm3986682qkd.134.2023.02.10.10.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 10:39:53 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-52ec329dc01so60127407b3.10;
        Fri, 10 Feb 2023 10:39:53 -0800 (PST)
X-Received: by 2002:a0d:e28f:0:b0:52b:f563:2da3 with SMTP id
 l137-20020a0de28f000000b0052bf5632da3mr957207ywe.235.1676054392940; Fri, 10
 Feb 2023 10:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com> <20230210154140.338352-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230210154140.338352-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Feb 2023 19:39:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhzBj88AkZ_DR5mzbPKYX2eRH7wvFAn8zF_nq2ytCaJQ@mail.gmail.com>
Message-ID: <CAMuHMdUhzBj88AkZ_DR5mzbPKYX2eRH7wvFAn8zF_nq2ytCaJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] serial: 8250_em: Use dev_err_probe()
To:     biju.das.jz@bp.renesas.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Feb 10, 2023 at 4:41 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch simplifies probe() function by using dev_err_probe()
> instead of dev_err in probe().
>
> While at it, remove the unused header file slab.h and added a
> local variable 'dev' to replace '&pdev->dev' in probe().
>
> Also replace devm_clk_get->devm_clk_get_enabled and updated the
> clk handling in probe().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * replaced devm_clk_get->devm_clk_get_enabled() and updated clk
>    handling in probe().
>  * Added Rb tag from Geert.

Thanks for the update!

> --- a/drivers/tty/serial/8250/8250_em.c
> +++ b/drivers/tty/serial/8250/8250_em.c

> @@ -121,11 +116,8 @@ static int serial8250_em_probe(struct platform_device *pdev)
>         up.dl_write = serial8250_em_serial_dl_write;
>
>         ret = serial8250_register_8250_port(&up);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "unable to register 8250 port\n");
> -               clk_disable_unprepare(priv->sclk);

You forgot to remove the call to clk_disable_unprepare()
in serial8250_em_remove().
After that, there is no longer a need to store the clock pointer
in priv->sclk.

> -               return ret;
> -       }
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "unable to register 8250 port\n");
>
>         priv->line = ret;
>         platform_set_drvdata(pdev, priv);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
