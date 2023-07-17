Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 806CB755D0B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 09:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbjGQHfx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 03:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbjGQHfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 03:35:52 -0400
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C85A1A4;
        Mon, 17 Jul 2023 00:35:50 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-ca3cc52ee62so4303646276.0;
        Mon, 17 Jul 2023 00:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689579349; x=1692171349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKg2+DpzfdKibka0U2j+DwGVxIJpjVR8W+iKIhuVWts=;
        b=DKaD0TGYz7vFwfXvgE+s4H9xgQ0iSgAhcejeI1CEWtYumBUS6GGwsqz3m8kwNa1/Hy
         SMD90V/HH9UdSxKkgy3Rw0TN/ZIlzvaG0O+ipgc4pEJ0UD7a92MZTMyWX69VU8AqAVTA
         /8peUfrbnqrNXOw5ysVKmoQB/cngizmcqtZgEVV/oRYi8yQfk82Z56BIgA2Lj5TX6RpU
         iEhwwsaob3MZt+UMG55pXPZ/6uNH8mO7wC2G+tnECpSUNhsZPBJcrRAvFi7YH5YvhYDp
         r60fm+piiEHx42HBhkn974Pgu+x2ZD3O10CQp5ZpzkK2yq83AIVQveSDtlHc7zphX9QY
         U/Og==
X-Gm-Message-State: ABy/qLZHa14OJduGISenlJmkQuupuTGECS6qLp+SEYVeoP90buoJ7VgE
        v5brCWP/oDiHjH7odfICI25DHZkiKGDLeA==
X-Google-Smtp-Source: APBJJlF0J6c06diE6/Y8g6b4nqsgS8Bk+X33rGs9i7qGRibo4gC9cwIFAEkcakRxUDQBycZbyBERvA==
X-Received: by 2002:a81:6704:0:b0:56c:fd03:dba with SMTP id b4-20020a816704000000b0056cfd030dbamr11166823ywc.35.1689579348681;
        Mon, 17 Jul 2023 00:35:48 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id d140-20020a814f92000000b00577466cc1f8sm3648745ywb.108.2023.07.17.00.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:35:48 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-cab61f812efso4302113276.1;
        Mon, 17 Jul 2023 00:35:48 -0700 (PDT)
X-Received: by 2002:a5b:40d:0:b0:c49:5b11:8906 with SMTP id
 m13-20020a5b040d000000b00c495b118906mr9594892ybp.61.1689579347794; Mon, 17
 Jul 2023 00:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230716154442.93908-1-biju.das.jz@bp.renesas.com> <20230716154442.93908-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230716154442.93908-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Jul 2023 09:35:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjF-_pX53xaEXJVP1Yvz-o=0bdHLx7ekqbqrGX7ygCLA@mail.gmail.com>
Message-ID: <CAMuHMdUjF-_pX53xaEXJVP1Yvz-o=0bdHLx7ekqbqrGX7ygCLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: vc5: Use i2c_get_match_data() instead of device_get_match_data()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marex@denx.de>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Sun, Jul 16, 2023 at 5:44 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The device_get_match_data(), is to get match data for firmware interfaces
> such as just OF/ACPI. This driver has I2C matching table as well. Use
> i2c_get_match_data() to get match data for I2C, ACPI and DT-based
> matching.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -956,7 +956,9 @@ static int vc5_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, vc5);
>         vc5->client = client;
> -       vc5->chip_info = device_get_match_data(&client->dev);
> +       vc5->chip_info = i2c_get_match_data(client);
> +       if (!vc5->chip_info)
> +               return -ENODEV;

Can this actually happen? All tables have data pointers.

>         vc5->pin_xin = devm_clk_get(&client->dev, "xin");
>         if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
