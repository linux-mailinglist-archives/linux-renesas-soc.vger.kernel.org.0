Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F13FD755D14
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 09:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjGQHhF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 03:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbjGQHhE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 03:37:04 -0400
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CD0E7;
        Mon, 17 Jul 2023 00:37:03 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5833b517b32so9346477b3.3;
        Mon, 17 Jul 2023 00:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689579422; x=1692171422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNPNfuOdvZzfaDVKNsKDUen8WLGYm2zCUDyy4Ze/CkY=;
        b=Nwgjjq/vtxn8ZCiItnpmeXtMJjMXIpTb6T2PscHHNTQlCEfCCs7MUYx1NvbJRhmBfa
         gesIYBzrGJn726/WhpXXzK/SqaQPr6GF6WuN72CwFATHTOFHPHgNrZx/iOp/kycWCp/H
         QJ/udB20n/8FiKJkDz68VMC1obGTU9xvz5fFeKaqB4Ta09ioZswNVlikDh/OqQs6ocgy
         wpbcRVVCSsrBnRAn7fJ2cWx6KsxsBPKgeOTcw3KsT/kz3sEGKAjaeGsl79wXpZGe+HxX
         w5En6mcl4aAcb/5YLSsYaUWWxKYj/ssR9CIBMCre+jwAVfgqwnt2gXNjoacuOHDSitx3
         o2Ig==
X-Gm-Message-State: ABy/qLYYLXBI7LRBqA8zum5MncRi8Ganx4BwN3P0tggi10CPgSA+hxp8
        mgs/B1NYERyPREfFOeLCZfPBi17JF7otGw==
X-Google-Smtp-Source: APBJJlGl7PynqTOEuRkW+CZS6CxK4UHugn5GBzMiOPN9SXeNCGBIS0UOBrNXMJYG+dEDHhAMPSYqJQ==
X-Received: by 2002:a81:a14b:0:b0:579:dfd8:d4b3 with SMTP id y72-20020a81a14b000000b00579dfd8d4b3mr12842719ywg.17.1689579422558;
        Mon, 17 Jul 2023 00:37:02 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id k1-20020a0dfa01000000b005771bb5a25dsm3660634ywf.61.2023.07.17.00.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:37:02 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-bff27026cb0so4469209276.1;
        Mon, 17 Jul 2023 00:37:02 -0700 (PDT)
X-Received: by 2002:a25:590:0:b0:cc0:eeed:b0ca with SMTP id
 138-20020a250590000000b00cc0eeedb0camr7590471ybf.51.1689579421946; Mon, 17
 Jul 2023 00:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230716154442.93908-1-biju.das.jz@bp.renesas.com> <20230716154442.93908-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230716154442.93908-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Jul 2023 09:36:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW7ss_rDdf+ZGUHCzDW0Ur4qesX11sMoRiJf7dieaw9Pw@mail.gmail.com>
Message-ID: <CAMuHMdW7ss_rDdf+ZGUHCzDW0Ur4qesX11sMoRiJf7dieaw9Pw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: vc7: Use i2c_get_match_data() instead of device_get_match_data()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alex Helms <alexander.helms.jy@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marex@denx.de>,
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

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/clk-versaclock7.c
> +++ b/drivers/clk/clk-versaclock7.c
> @@ -1109,7 +1109,9 @@ static int vc7_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, vc7);
>         vc7->client = client;
> -       vc7->chip_info = device_get_match_data(&client->dev);
> +       vc7->chip_info = i2c_get_match_data(client);
> +       if (!vc7->chip_info)
> +               return -ENODEV;

Can this actually fail? All tables have data pointers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
