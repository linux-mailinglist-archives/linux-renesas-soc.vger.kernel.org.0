Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04092629BF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 15:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiKOOW6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 09:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiKOOW5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 09:22:57 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3CB2B188
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 06:22:53 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id jr19so8754604qtb.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 06:22:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3AoieTF7d46KzXzxvz+DsYH/hS0VZRZZWZjmQxW8KpY=;
        b=U3+70gP064XzeuqvyrNsK1n+/SFIYsXa5EayU0Ym5dvqSgacGo8Lb67Yy+mzM6qV4U
         HfVhq7PEJAPZbkclKfvq2bq9fGvmwgGZzvpidROokjJbg7Sr2aZHWrvL5a304U3I2trJ
         V6f+FyUln+bljFQtM7LskJ4X+awJKM3T4rHzvRJd8TWWZmuWGncjDYm46+9YDALZRDjf
         vW5biBNzbyhaZOTacPgSGqSB18Wt3bYoHcPx/BLQ9g8C4PpoWjwHym+W2rnwc2g1J6wW
         4/ggKTVwQTeL0efD9waGfjj/1FwUzhpPr+evx0m7f2MHB+WHgl/I77XCeoBQKovWUFgM
         IcoQ==
X-Gm-Message-State: ANoB5pnsGOF0k0eroY2oRjl61kAFga6izt0Jfj0wXYz5LWD1jY7PGePt
        UdPeAcEYqMLzxDFjLVgkKF/GGuHE2b2bxw==
X-Google-Smtp-Source: AA0mqf4d584fSzaI58/Vbcw/7CXlqZQDsZGCrxLkszmKrZBeTvtaiZ7jPZdcTVRhlAc3dt2eX8adsg==
X-Received: by 2002:ac8:4111:0:b0:3a5:49f2:5cac with SMTP id q17-20020ac84111000000b003a549f25cacmr16506939qtl.21.1668522172815;
        Tue, 15 Nov 2022 06:22:52 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id de3-20020a05620a370300b006e99290e83fsm8260164qkb.107.2022.11.15.06.22.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 06:22:52 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-368edbc2c18so137915817b3.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 06:22:52 -0800 (PST)
X-Received: by 2002:a0d:dd81:0:b0:373:6180:dae5 with SMTP id
 g123-20020a0ddd81000000b003736180dae5mr17052291ywe.283.1668522171868; Tue, 15
 Nov 2022 06:22:51 -0800 (PST)
MIME-Version: 1.0
References: <Y3OQysxE+f/AmI3y@kili>
In-Reply-To: <Y3OQysxE+f/AmI3y@kili>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Nov 2022 15:22:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWrEii8qCDHYEouQrKv5xaVmNZn7F9QOQeA-70A=A5O2g@mail.gmail.com>
Message-ID: <CAMuHMdWrEii8qCDHYEouQrKv5xaVmNZn7F9QOQeA-70A=A5O2g@mail.gmail.com>
Subject: Re: [bug report] net: ethernet: renesas: Add support for "Ethernet Switch"
To:     Dan Carpenter <error27@gmail.com>
Cc:     yoshihiro.shimoda.uh@renesas.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan,

On Tue, Nov 15, 2022 at 2:17 PM Dan Carpenter <error27@gmail.com> wrote:
> The patch 3590918b5d07: "net: ethernet: renesas: Add support for
> "Ethernet Switch"" from Oct 31, 2022, leads to the following Smatch
> static checker warning:
>
>         drivers/net/ethernet/renesas/rswitch.c:1717 rswitch_init()
>         warn: '%pM' cannot be followed by 'n'
>
> drivers/net/ethernet/renesas/rswitch.c
>     1706
>     1707         for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
>     1708                 err = register_netdev(priv->rdev[i]->ndev);
>     1709                 if (err) {
>     1710                         for (i--; i >= 0; i--)
>     1711                                 unregister_netdev(priv->rdev[i]->ndev);
>     1712                         goto err_register_netdev;
>     1713                 }
>     1714         }
>     1715
>     1716         for (i = 0; i < RSWITCH_NUM_PORTS; i++)
> --> 1717                 netdev_info(priv->rdev[i]->ndev, "MAC address %pMn",
>                                                                           ^
> This 'n' doesn't make sense.  See mac_address_string() for more details.

I guess that should be "\n"?

>     1718                             priv->rdev[i]->ndev->dev_addr);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
