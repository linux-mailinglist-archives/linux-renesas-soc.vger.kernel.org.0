Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D689B6FB0DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 15:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbjEHNES convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 09:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjEHNER (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 09:04:17 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88CABF3;
        Mon,  8 May 2023 06:04:16 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-559e2051d05so64419657b3.3;
        Mon, 08 May 2023 06:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683551055; x=1686143055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+94YNKHbygTrD0zR+QZe6FQ/frgl7NCtawENxX722AI=;
        b=Q9B+vD8q91Zd91Z8ZK+iBFTDQhAmu9cDMO0n0nx2fe6ziqPAeFDFwbXfQtoLKO5oXG
         lPOY4ENDfJK6NUGJXkTAVKAqxvez+57UWqp/Xm5ajiGq28CFAu0CYW2hFJBLp5DIooJy
         v6mwyzmXYVg9a0AYDYi+janCzCLlVhS4ZVSeHGpnZFaXFKfgUsWNhL95wZwkSLHTn/Gl
         p6rmQLMHu2AoyKYTGZee8uAdEn5Gpxm1IyPly5iCNPkDmjit3p+JaxIHU6dNx2bJMN3N
         DrYqj4XyPuHqdyrxGvd4YLOtAQzU4qtiJhIxgAslokO/Dj3Qiejo9wwDFU89RF1jrCG5
         XwEw==
X-Gm-Message-State: AC+VfDzC4dVqDNFgGp6AcQsuEedPQ/TE2LIGg6vT6JVNuGpTGqCA266k
        sh/zRyIDj7x6UddVu/MK/Uun44UK72FjWw==
X-Google-Smtp-Source: ACHHUZ5/twaer0S07BkhPttnZCVMZTa5sxe7zguOtpDlGRaevHnv3/xj6KkudCDfCE1X73s/n+UMbQ==
X-Received: by 2002:a0d:e60d:0:b0:55d:7fc2:b710 with SMTP id p13-20020a0de60d000000b0055d7fc2b710mr11602995ywe.17.1683551055403;
        Mon, 08 May 2023 06:04:15 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id w129-20020a0ded87000000b0054f8b1f21e5sm967381ywe.85.2023.05.08.06.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 06:04:14 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-b983027d0faso5967202276.0;
        Mon, 08 May 2023 06:04:14 -0700 (PDT)
X-Received: by 2002:a25:b11a:0:b0:b9e:889:420f with SMTP id
 g26-20020a25b11a000000b00b9e0889420fmr12227598ybj.12.1683551054275; Mon, 08
 May 2023 06:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230507134148.16530-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230507134148.16530-1-marek.vasut+renesas@mailbox.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 May 2023 15:04:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGbbHxZMG6Bp78DqODYFKYKBh6m_OpKKj=GtGgOqvToA@mail.gmail.com>
Message-ID: <CAMuHMdWGbbHxZMG6Bp78DqODYFKYKBh6m_OpKKj=GtGgOqvToA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: vc5: Use device_get_match_data() instead of of_device_get_match_data()
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc:     linux-clk@vger.kernel.org,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <sboyd@kernel.org>, Tom Rix <trix@redhat.com>,
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

Hi Marek,

On Sun, May 7, 2023 at 3:42 PM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use device_get_match_data() which, unlike of_device_get_match_data(),
> is compatible with other firmware interfaces than just OF.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -953,7 +953,7 @@ static int vc5_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, vc5);
>         vc5->client = client;
> -       vc5->chip_info = of_device_get_match_data(&client->dev);
> +       vc5->chip_info = device_get_match_data(&client->dev);
>
>         vc5->pin_xin = devm_clk_get(&client->dev, "xin");
>         if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)

LGTM, but probably you want to include <linux/property.h> explicitly?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
