Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3997A5A9722
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Sep 2022 14:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233291AbiIAMqA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Sep 2022 08:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbiIAMp6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 08:45:58 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31C0550B4;
        Thu,  1 Sep 2022 05:45:54 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id a10so9277487qkl.13;
        Thu, 01 Sep 2022 05:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vS+usMfLGbT5fQCFXjFiDO/fX31xuBdF9BsWhygIDxI=;
        b=pPRwemEZXguAu+Kew+ZX2wCb7q2TQh7/xCDQRPSDtkFIc+o7uk0/WeubNu4+D5Y6+S
         ilkY2ZFJmnxqTp0t8icfx9Gq/W0kFCTr1ND8Gxp5oWLGAwW4VGCd0c/uuFjCnxUu8E1h
         7rcuQ+1IgQK3T6IQ9Zn8At08PMUmUErok9kUo3ilvsQuyJXhT2r3ve5qauAsQLvHf9fj
         HgbkLtt8rFMrkF2eoLUsEhYf+dtQHgF2zubXj9lWINYEfkWRTJ1vx/bVbUhZHBoX2Zyd
         N1K4eMJL3FdNag5wwvxNvdh8I20PVgqwq+FUxhVBjhF0EbgcS7OImbzgEa6mTLnkMiE7
         q8rw==
X-Gm-Message-State: ACgBeo06V4U7RjCxCcCOL9BDN1hoFvXrP/KgEW1wEvjNpaFq7Jxw+TfF
        hOsRx68veNomJxuknmGK5dW+lvVsWoLk0w==
X-Google-Smtp-Source: AA6agR6iZTCFYhYE0YMx/JWPi1eHckDkCz8l4mT0kVK0bIGqXgx4wmPTJEGGfBZmZV/pqLvKUHOAFQ==
X-Received: by 2002:a05:620a:31a4:b0:6bc:138:27c9 with SMTP id bi36-20020a05620a31a400b006bc013827c9mr7895624qkb.2.1662036352940;
        Thu, 01 Sep 2022 05:45:52 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id ez5-20020a05622a4c8500b00342fb07944fsm10217925qtb.82.2022.09.01.05.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 05:45:52 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-33dce2d4bc8so335351317b3.4;
        Thu, 01 Sep 2022 05:45:52 -0700 (PDT)
X-Received: by 2002:a0d:d691:0:b0:340:f6e7:5654 with SMTP id
 y139-20020a0dd691000000b00340f6e75654mr17032580ywd.502.1662036352100; Thu, 01
 Sep 2022 05:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220830164518.1381632-1-biju.das.jz@bp.renesas.com> <20220830164518.1381632-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220830164518.1381632-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Sep 2022 14:45:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_+VSbTj1qidjiHZX+0ryCSFj3AQskM3oX4PKjHD-9ow@mail.gmail.com>
Message-ID: <CAMuHMdW_+VSbTj1qidjiHZX+0ryCSFj3AQskM3oX4PKjHD-9ow@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN{0,1}
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
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

Hi Biju,

On Tue, Aug 30, 2022 at 6:45 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable CAN{0,1} on RZ/N1D-DB board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change

Thanks for your patch!

> --- a/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
> +++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
> @@ -26,6 +26,20 @@ aliases {
>         };
>  };
>
> +&can0 {
> +       pinctrl-0 = <&pins_can0>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};
> +
> +&can1 {
> +       pinctrl-0 = <&pins_can1>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};

According to the schematics and board documentation, only a single CAN
connector is present, and the CAN interface to use must be selected
using the CN10/CN11 jumpers.  Hence I think we need a #define and
an #ifdef to configure this, or at least keep one interface disabled,
and add a comment explaining why.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
