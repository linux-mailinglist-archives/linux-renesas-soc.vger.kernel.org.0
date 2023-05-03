Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2855A6F5646
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 May 2023 12:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjECKf5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 May 2023 06:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjECKf4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 May 2023 06:35:56 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23DF649EE;
        Wed,  3 May 2023 03:35:56 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-55a8019379fso26030347b3.0;
        Wed, 03 May 2023 03:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683110155; x=1685702155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzgtCmMtCQLvlMkdI2n+R1kMt6S1df/66NRq9y9X0Ao=;
        b=ZQCaOstH7DFD5P25G+oXWzE53M1+P3k4u2oCEtZNL7hytizn1dy6WgoRlFXjIPR/jH
         5oeNmsVwuZ7NE/m2zA2e75AjY8jh2gEkf9ueLwkrTB1px4WDWiZqWxFjkP0WdkVn4lB1
         H38+5XVX05ZZL86M3j520yN38H6decylcbfQIkCfzM3TuDiPp72vRywW9Wc8+F1rq4Y6
         ESm59BFIF5pzoM4qL7FkpBpUWz0tLAcQT9V2ADW4Mpj8rVJzEz/6jniGGOQI94DjN0bV
         Kxj/VynGP/AM/Bu4IwTGpVYRKtQNeKA32+duAhX9+vqODa/xTSk+yXyzLe7FiVw8jxA9
         0tGw==
X-Gm-Message-State: AC+VfDywKDRQlnCGGPF26Ojh0wY+/g02bnueY6kj9CsOfwFl2kyoQIwc
        aO5NcaRHfXgFLoiQ1ZaxkGvRezpfZuhQmg==
X-Google-Smtp-Source: ACHHUZ5yg9daaNtbWdwlR+5voLLdPpjIDwVphxuo7P6ipTOTIbiLcaAFsghzgq6COjhjXR4u0/vuTQ==
X-Received: by 2002:a81:4f4f:0:b0:55a:aa57:5660 with SMTP id d76-20020a814f4f000000b0055aaa575660mr4669134ywb.20.1683110154939;
        Wed, 03 May 2023 03:35:54 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id n143-20020a0dcb95000000b00555df877a4csm1362642ywd.102.2023.05.03.03.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 03:35:54 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-b9a6d9dcbebso4083238276.2;
        Wed, 03 May 2023 03:35:54 -0700 (PDT)
X-Received: by 2002:a25:f828:0:b0:b9c:715a:9a97 with SMTP id
 u40-20020a25f828000000b00b9c715a9a97mr17569988ybd.29.1683110154053; Wed, 03
 May 2023 03:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230424163908.137535-1-biju.das.jz@bp.renesas.com> <20230424163908.137535-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230424163908.137535-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 May 2023 12:35:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUFusEk4kQLmUTBTF6CMm+8AO7Y_U8ZZrPyqnhXiir4Q@mail.gmail.com>
Message-ID: <CAMuHMdUUFusEk4kQLmUTBTF6CMm+8AO7Y_U8ZZrPyqnhXiir4Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: renesas: rzg2l-smarc: Enable DU and
 link with DSI
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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

Hi Biju,

On Mon, Apr 24, 2023 at 6:39 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable DU and link with DSI on RZ/{G2L,V2L} SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> @@ -49,6 +49,7 @@ ports {
>                 port@0 {
>                         reg = <0>;
>                         dsi0_in: endpoint {
> +                               remote-endpoint = <&du_out_dsi>;
>                         };
>                 };
>
> @@ -62,6 +63,26 @@ dsi0_out: endpoint {
>         };
>  };
>
> +&du {
> +       status = "okay";
> +
> +       ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               port@0 {
> +                       reg = <0>;
> +                       du_out_dsi: endpoint {
> +                               remote-endpoint = <&dsi0_in>;
> +                       };
> +               };
> +
> +               port@1 {
> +                       reg = <1>;
> +               };

Do you need port@1 if it is not connected to anything?
If yes, don't the port@ subnodes and reg properties belong in the
SoC-specific .dtsi?

> +       };
> +};
> +
>  &i2c1 {
>         adv7535: hdmi@3d {
>                 compatible = "adi,adv7535";

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
