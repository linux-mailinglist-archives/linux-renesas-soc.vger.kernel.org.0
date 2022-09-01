Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06CF45A9DCC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Sep 2022 19:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbiIARKe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Sep 2022 13:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233560AbiIARKd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 13:10:33 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D992D558E1;
        Thu,  1 Sep 2022 10:10:31 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id l5so13954179qtv.4;
        Thu, 01 Sep 2022 10:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4KmeqDd8PfnUzUpXpZxbTzeeJqhW5o6jQQAlhmqw40s=;
        b=YwhK/rC1bmCRYdnQz3MT1xhkvT2SIG8CJn3v/08jeThFvFQtUCUEAlgyqI9L1uftE9
         ZLq8vRWHmTf4+hli/CjCGpmQu03CTEp07L51v7Hm/Spr4I/BcmPHkj8grLfthmui+lyu
         GAP0r3Exp6ug/wUYX+5hVMNWKYdZX7Y+n0akgTFaNvzWof76jm3JeGmRmqvgK/ksytUO
         dJtwRzNuuoChfiMPLQEDvBY9K1OSC7MvLJkmOzpRrw2J1JO+HnjXi956URTsw6kEi1Cy
         NArk/fP5sUA3U/3+AkEhShPxOo00JRrhnlaVBqzWTpIh0nZYfYY/qhJuLMihKCKxw1vK
         VGOg==
X-Gm-Message-State: ACgBeo3Oe58llEwgdpxA7cPuYplZEzY1KReXkh3C/QrYCAE3lH4GDww8
        68DG6oFGFnknPoxzas7DuAGnztVEtIfp2Q==
X-Google-Smtp-Source: AA6agR6UX68c74d8sFwJsN8ygjrgR5xJMnmZGKdEoWJe0W/JqPrRRjMpg+rKy4ANvcp1XqtsQ+mM5Q==
X-Received: by 2002:ac8:57d6:0:b0:344:997f:557 with SMTP id w22-20020ac857d6000000b00344997f0557mr24619520qta.345.1662052230801;
        Thu, 01 Sep 2022 10:10:30 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id m27-20020a05620a13bb00b006bbf85cad0fsm11643418qki.20.2022.09.01.10.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 10:10:30 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id y197so9514772yby.13;
        Thu, 01 Sep 2022 10:10:30 -0700 (PDT)
X-Received: by 2002:a25:415:0:b0:696:814:7c77 with SMTP id 21-20020a250415000000b0069608147c77mr20049456ybe.36.1662052230126;
 Thu, 01 Sep 2022 10:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220901162919.47090-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220901162919.47090-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Sep 2022 19:10:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0ZG3ENobSP-0wS9WhpmPqLt91Omauj5wMOthfBLsoOA@mail.gmail.com>
Message-ID: <CAMuHMdW0ZG3ENobSP-0wS9WhpmPqLt91Omauj5wMOthfBLsoOA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN2
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Sep 1, 2022 at 6:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable CAN2 on RZ/N1-EB board by default.
> Also add a macro to enable CAN1, if the board
> support it.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Updated commit descriptiom
>  * Enabled CAN2 by default
>  * Added a macro BOARD_HAS_CAN1_ENABLED to configure CAN1,
>    if the board supports it.

Thanks for the update!

> --- a/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
> +++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
> @@ -26,6 +26,22 @@ aliases {
>         };
>  };
>
> +#if BOARD_HAS_CAN1_ENABLED /* CN10 on RZ/N1-EB board */
> +&can0 {
> +       pinctrl-0 = <&pins_can0>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};
> +#endif
> +
> +&can1 {
> +       pinctrl-0 = <&pins_can1>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};

AFAIU, CN10 and CN11 are not the real CAN connectors, they are headers
to add jumpers to select which CAN interface to route to the real CAN
connector J16.

Hence I was thinking of something along the line:

    #ifdef BOARD_HAS_CAN1_ENABLED
    &can0 {
           pinctrl-0 = <&pins_can0>;
           pinctrl-names = "default";

           status = "okay";
    };
    #else
    &can1 {
           pinctrl-0 = <&pins_can1>;
           pinctrl-names = "default";

           status = "okay";
    };
    #endif

or:

   &can0 {
           pinctrl-0 = <&pins_can0>;
           pinctrl-names = "default";

           /* Assuming CN10/CN11 are wired for CAN1 */
           status = "okay";
    };

    &can1 {
           pinctrl-0 = <&pins_can1>;
           pinctrl-names = "default";

           /* Please only enable can0 or can1, depending on CN10/CN11 */
           /* status = "okay"; */
    };


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
