Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4005511A03
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 16:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238346AbiD0OlK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 10:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238315AbiD0OlE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 10:41:04 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B103832997;
        Wed, 27 Apr 2022 07:37:45 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id ay11so1254780qtb.4;
        Wed, 27 Apr 2022 07:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qeiKbWp7vwKha2y+tOr5UyNjRYsv3iPLRnwqaSMQTOY=;
        b=VMebR58OhYiN732xrsdnXg3QOZU1BAmqXmEcxfUOiJdIeKbu6Z9t+uzmLz42bPo6ve
         U54JIdJ8IHtnAxxgam5mWqsaVLpwsEw7tFr5WtroGeebSxXzAic/pjx89H/+becAw1nW
         7IGJCA/6jgtB/SslVKsBKvqCfT5uUvlmTUsLEZqZQ80PAs/U6K9AMAobsevkRWiWP9XF
         8dGzPpk0pKtqQsvM6KeZcAnqO5Q4FV/9b8vrOj/6ivjVMnC6zvzXr/1ApQas7ClGxNM+
         IzIEsNv5FAnXE1aiFohQQFBS+586sKCENorUVIHlab+67uBlIbGF73sjHxzxpOaIOPtp
         FRmA==
X-Gm-Message-State: AOAM531QbCkcFE02uy93VpWmVI3MJ2memLtaIzFqwgWy6Mzkmusd9ZY8
        +zS00MXH1bK+WZN4BPF96Siwf6amhbfSXg==
X-Google-Smtp-Source: ABdhPJyTq8B0D8txYyF25lB9nEhr1UIP/FyET45MeX68D2fZWidQ9YBe6wZGXE7F2YjHRkPoxEdPog==
X-Received: by 2002:ac8:110a:0:b0:2f1:ea84:b84 with SMTP id c10-20020ac8110a000000b002f1ea840b84mr19071292qtj.463.1651070242003;
        Wed, 27 Apr 2022 07:37:22 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 19-20020a05620a079300b0069eb4c4e007sm7788714qka.29.2022.04.27.07.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 07:37:21 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id m128so3761196ybm.5;
        Wed, 27 Apr 2022 07:37:21 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr25515319ybp.613.1651070241253; Wed, 27
 Apr 2022 07:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com> <20220425064201.459633-7-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220425064201.459633-7-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 16:37:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVffc4iqX6wAKwyq_eTX5c0H3-tqs_pvsec7v1_q6hS3g@mail.gmail.com>
Message-ID: <CAMuHMdVffc4iqX6wAKwyq_eTX5c0H3-tqs_pvsec7v1_q6hS3g@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: renesas: Add Renesas R8A779G0 SoC support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Apr 25, 2022 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add initial support for the Renesas R8A779G0 (R-Car V4H) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi

> +       soc: soc {

> +               hscif0: serial@e6540000 {
> +                       compatible = "renesas,hscif-r8a779g0",
> +                                    "renesas,rcar-gen4-hscif",
> +                                    "renesas,hscif";
> +                       reg = <0 0xe6540000 0 96>;
> +                       interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;

245

> +                       clocks = <&cpg CPG_MOD 514>,
> +                                <&cpg CPG_CORE R8A779G0_CLK_S0D3_PER>,
> +                                <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";
> +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 514>;
> +                       status = "disabled";
> +               };

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
