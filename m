Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6189F6FB0E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 15:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbjEHNHb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 09:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbjEHNHa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 09:07:30 -0400
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2C086BF;
        Mon,  8 May 2023 06:07:29 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-b9a6ab9ede3so5931461276.2;
        Mon, 08 May 2023 06:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683551248; x=1686143248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEZM/FLT8czpURra54RVcfiT2woYlfxfEYrENN5OWis=;
        b=XJHCoJVPXjQRyj2OFjOWkxPt0/QxtA7Ftalv7G9c8UlpeYsvEetjWwYCX5wprtLbr9
         7IXhgCBnQGUYpA3vPVgqpC3Q8KmqMYH6EBrPz6PNT3lEKjpnW1FIRIJaubsxi7PATSto
         yqErDiisVQQvLWTBJQunqtiVwHQk+wKvFEHN2YN9nzO8rMp9QTnV3VqgB3fI3EA5+3tz
         mbdtS8cmKCqpGnP6dKj3EKcTmUQMO+5v2pxh6Mgt+uf30s26anAVXESQTLX/89U7jOEI
         +t2YmNs3ot087vHcAiTaP6kcQ0dLBvCkVr/dlQzdwDfzKL48RC7C3RofJEmU27vwkIom
         bYkQ==
X-Gm-Message-State: AC+VfDx8u7s2KZbEek7DVoggkMBO70++3XZdclbPvlOa+p9rsZOwPkLV
        yDFYlm64klmJpqrQ6SWiHdw9iHGmaT86oA==
X-Google-Smtp-Source: ACHHUZ73fhGNFxTtZ9DRpiG+mcesX+eSRMjGYHPnB8Nkx8/1et2APgj6y/wJRsKlTb5qLuid5ETB2w==
X-Received: by 2002:a25:da8d:0:b0:b92:3b1d:f21e with SMTP id n135-20020a25da8d000000b00b923b1df21emr12001180ybf.1.1683551248576;
        Mon, 08 May 2023 06:07:28 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id a205-20020a254dd6000000b00b8f54571fc0sm2335485ybb.5.2023.05.08.06.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 06:07:27 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-b9a6ab9ede3so5931413276.2;
        Mon, 08 May 2023 06:07:27 -0700 (PDT)
X-Received: by 2002:a05:7500:6a2:b0:fc:ee04:b201 with SMTP id
 bv34-20020a05750006a200b000fcee04b201mr306593gab.52.1683551246751; Mon, 08
 May 2023 06:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230507134148.16530-1-marek.vasut+renesas@mailbox.org> <20230507134148.16530-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230507134148.16530-2-marek.vasut+renesas@mailbox.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 May 2023 15:07:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4Lkq40OwUuMvakOw6Ggrs4bKuOK2AmRmsFyBGL0NsLw@mail.gmail.com>
Message-ID: <CAMuHMdW4Lkq40OwUuMvakOw6Ggrs4bKuOK2AmRmsFyBGL0NsLw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: vc7: Use device_get_match_data() instead of of_device_get_match_data()
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

> --- a/drivers/clk/clk-versaclock7.c
> +++ b/drivers/clk/clk-versaclock7.c
> @@ -1108,7 +1108,7 @@ static int vc7_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, vc7);
>         vc7->client = client;
> -       vc7->chip_info = of_device_get_match_data(&client->dev);
> +       vc7->chip_info = device_get_match_data(&client->dev);
>
>         vc7->pin_xin = devm_clk_get(&client->dev, "xin");
>         if (PTR_ERR(vc7->pin_xin) == -EPROBE_DEFER) {

LGTM, but probably you want to include <linux/property.h> explicitly?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
