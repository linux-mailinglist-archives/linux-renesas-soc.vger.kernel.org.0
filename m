Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 121BF7177FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 May 2023 09:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234659AbjEaHXT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 May 2023 03:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234697AbjEaHWv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 May 2023 03:22:51 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C3118D;
        Wed, 31 May 2023 00:22:31 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-565ca65e7ffso36175857b3.0;
        Wed, 31 May 2023 00:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685517750; x=1688109750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/WHCq8jPwA2zngW84yg7XRtXszELkTMTFuhdg7hSrw=;
        b=BT5j2Kb7qNgQ8no0zoXaMSBEeWEKgc/jxKrISqGxZSGz7Reoj4Yi2na+ed2LRsbva8
         NsMHnkOqIRue96O54Zqhcua+delagkK3DmJlHQk5Z96MrNykFlUgRspqIJ/8O1VsMvJP
         fSyNlcfe0OSkHYBFwN6HRmoqcMY/i8XpkW3FXzugzO6ulGGK8r5qbkuhqks3BVE65l2S
         pwBVgvxs0s1/QiyYimfGlQ4k6KtyNvv8sNWU5RWum5eyP/euDasfW9EASe+JsUkgi6kn
         /jHee52Ea1zdarcXkYBuUrKvZ/vOdqF0QASIFQX3EEa9LUz5zPRoFHFOm4XX/hPvptTs
         +Oeg==
X-Gm-Message-State: AC+VfDyNdzApRD/cEKqaNr5m10E3+N4iOmjauvgyhJaD2nR7v/a3qlLa
        JKJR8DYH4VBF3Dr7A1rR0viQu/hRfoHzjg==
X-Google-Smtp-Source: ACHHUZ5e8Xgqcp4junm5e5QE9X83Er5U03MW0jMpqLmRvGRfPgDDZk8vRJaiPBAro2PaXwYRjWssrQ==
X-Received: by 2002:a81:83cf:0:b0:561:b58e:31ff with SMTP id t198-20020a8183cf000000b00561b58e31ffmr4463225ywf.44.1685517750222;
        Wed, 31 May 2023 00:22:30 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id s130-20020a817788000000b00559ec10f245sm5124138ywc.103.2023.05.31.00.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 00:22:29 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-565c9109167so36894997b3.2;
        Wed, 31 May 2023 00:22:28 -0700 (PDT)
X-Received: by 2002:a0d:dd92:0:b0:568:be91:c2c0 with SMTP id
 g140-20020a0ddd92000000b00568be91c2c0mr4648284ywe.6.1685517748466; Wed, 31
 May 2023 00:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230530161720.179927-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230530161720.179927-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 May 2023 09:22:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUY=tBdCuz=GD+8C9N395oXT+2OTSZpoWFz8SqSo8FVuA@mail.gmail.com>
Message-ID: <CAMuHMdUY=tBdCuz=GD+8C9N395oXT+2OTSZpoWFz8SqSo8FVuA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: udc: renesas_usb3: Fix RZ/V2M
 {modprobe,bind} error
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Zheng Wang <zyytlz.wz@163.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-usb@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marc Zyngier <maz@kernel.org>,
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

On Tue, May 30, 2023 at 6:17 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Currently {modprobe, bind} after {rmmod, unbind} results in probe failure.
>
> genirq: Flags mismatch irq 22. 00000004 (85070400.usb3drd) vs. 00000004 (85070400.usb3drd)
> renesas_usb3: probe of 85070000.usb3peri failed with error -16
>
> The reason is, it is trying to register an interrupt handler for the same
> IRQ twice. The devm_request_irq() was called with the parent device.
> So the interrupt handler won't be unregistered when the usb3-peri device
> is unbound.
>
> Fix this issue by replacing "parent dev"->"dev" as the irq resource
> is managed by this driver.
>
> Fixes: 9cad72dfc556 ("usb: gadget: Add support for RZ/V2M USB3DRD driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added missing ')' at the end of the line for fixes tag.
>  * Updated commit description.
>  * Replaced "ddata->dev"->"&pdev->dev" for the devname parameter.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
