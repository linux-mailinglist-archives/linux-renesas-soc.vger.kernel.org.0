Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2814B4EB125
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 17:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236464AbiC2QAh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 12:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbiC2QAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 12:00:37 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F3E3140DE;
        Tue, 29 Mar 2022 08:58:54 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id kd21so11791275qvb.6;
        Tue, 29 Mar 2022 08:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6+WmnTJxOFwxQWCEL6DrdbnoZwCmM3ipAFq3iiXlCUA=;
        b=2Q0QUMmEIV4+ZUmDxQVvkd05XWq1ecxArhenz12toHM3OrHIT5n8Pp7Uug3BqTDBPJ
         aUpIap992yYrXb2UUYiw90U/cr6AVbt+YT/4hoiwp8OT8og+tkQI7taX98fuSZqkR1CQ
         Zy7UWTCHtn03VtPwB8Cp4/7l3/41J252/twwZa9AsNM3+HJmnvxZDRMKGf28hdFQBKQ7
         3M70Vhp5ftZEn+5cndgd8c+6LC23V06UmRmgMg4Qihz6GUvWbHhrd82oN5KwjM29+mJJ
         o5EBU0ft1k4P4NEcG1dp/pqXq2peGvRCkuj84v3Ru0aX6vor+0SUA/KstQqEgCdHy1o2
         w4KA==
X-Gm-Message-State: AOAM532Rc3KZb9fzowuBButEc5Rhg6XWbctps/C1xHdrFa5Y6fCDA1CW
        YzQ/8OLcUyALUUos7hWFmIGKTLmQuzA9vA==
X-Google-Smtp-Source: ABdhPJxv2YzKoPn2Xf1/88BG0xdZUhWMU6zzVWUwan8PsnVzZZ4MgtoIH3wkdjUsUTgOxzrxC2EJBQ==
X-Received: by 2002:a05:6214:27e9:b0:440:f6c9:dbe0 with SMTP id jt9-20020a05621427e900b00440f6c9dbe0mr27095594qvb.22.1648569532899;
        Tue, 29 Mar 2022 08:58:52 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id q8-20020a05622a030800b002e1c9304db8sm15103583qtw.38.2022.03.29.08.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 08:58:52 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id y38so29679640ybi.8;
        Tue, 29 Mar 2022 08:58:52 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr13900472ybq.342.1648569531851; Tue, 29
 Mar 2022 08:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152430.756947-1-miquel.raynal@bootlin.com> <20220329152430.756947-4-miquel.raynal@bootlin.com>
In-Reply-To: <20220329152430.756947-4-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Mar 2022 17:58:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXh-6YWvQUJ957PNB_fv+3+L-GbGg3dYDCZhp5+g7fcSQ@mail.gmail.com>
Message-ID: <CAMuHMdXh-6YWvQUJ957PNB_fv+3+L-GbGg3dYDCZhp5+g7fcSQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] serial: 8250: dw: Change the quirks type to
 unsigned int
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

On Tue, Mar 29, 2022 at 5:24 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Unsigned int is better than unsigned long as its size does not change
> between setups and we don't really need this variable to be more than a
> few bits wide for now.
>
> Suggested-by: Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -376,7 +376,7 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
>  static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>  {
>         struct device_node *np = p->dev->of_node;
> -       unsigned long quirks = (unsigned long)device_get_match_data(p->dev);
> +       unsigned int quirks = (unsigned int)device_get_match_data(p->dev);

"(uintptr_t)" (or "(unsigned long)" ;-), else you'll get a "cast from
pointer to integer of different size" warning on 64-bit builds.

>
>         if (np) {
>                 int id;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
