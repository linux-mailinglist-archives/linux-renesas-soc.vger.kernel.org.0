Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 721584EECBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 14:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244115AbiDAMEC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 08:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233112AbiDAMD7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 08:03:59 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6B9269A7B;
        Fri,  1 Apr 2022 05:02:10 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id v2so1940812qtc.5;
        Fri, 01 Apr 2022 05:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t9Wo/cU/iKKQyEg8YiMM/+tVeVg2N56NAMeVbYnz6jc=;
        b=70XAUdqkrUzsF4acs6KWMk8VpAPe/2+T5tYmR3zKbvd9Rp7wwR8kOWfSx9QYgPq8w5
         rkr5tUhVKtyHSTy0HCYe3TaXvCkh6jO8cwelLFLmqwzjFosv7lTU/ST3p+qkoZcphtxG
         Vi3OLNgZnmQzv/qEXG71FEDxM/m0RBYuh15GCEg3gUFGyLFeaYI8h5+FJPYQLLE22Gkl
         XUUxzIDl0clGNj9hnvTFXQ/uP9y3cCqmcMCB1NAkaTnvj6RQTNNdGTzlkzyR6Kseub1Z
         Kci2kJqJToro822ytcwPpkLyAZ0D162P3btJcZBxWn18QQVjs0QMSQdJZZf52eR9ppPK
         PWsA==
X-Gm-Message-State: AOAM530+eh5FiOdW2pEkP9HB+3GDy47Z++rXM8ncBsc5erWXO0feeyTm
        e6tKTTKs9wANMkyF6ZPxKWjaEAQNYT04kw==
X-Google-Smtp-Source: ABdhPJxXhAnwdMEZbNqonSRK9eKfpmi7TUorgurJHAYHmH1xXMKoE5FLWsLWMlNxzq6dETLY93rp6Q==
X-Received: by 2002:a05:622a:14c8:b0:2e1:d626:66ea with SMTP id u8-20020a05622a14c800b002e1d62666eamr8096056qtx.58.1648814527938;
        Fri, 01 Apr 2022 05:02:07 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 78-20020a370551000000b0067e3a58c090sm1158291qkf.82.2022.04.01.05.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 05:02:07 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id v35so4556585ybi.10;
        Fri, 01 Apr 2022 05:02:07 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id 66-20020a250045000000b0063396e22179mr8451190yba.393.1648814527141;
 Fri, 01 Apr 2022 05:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220315155919.23451-1-biju.das.jz@bp.renesas.com> <20220315155919.23451-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315155919.23451-8-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 14:01:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW15oNDrDk0CGvf9ABX83HB6rs3tXz+33a80K-dmJ0fuA@mail.gmail.com>
Message-ID: <CAMuHMdW15oNDrDk0CGvf9ABX83HB6rs3tXz+33a80K-dmJ0fuA@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 Ethernet on SMARC platform
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Tue, Mar 15, 2022 at 4:59 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable Ethernet{0,1} interfaces on RZ/G2UL SMARC EVK.
>
> Ethernet0 pins are muxed with CAN0, CAN1, SSI1 and RSPI1 pins and Ethernet0
> device selection is based on the SW1[3] switch position.
>
> Set SW1[3] to position OFF for selecting CAN0, CAN1, SSI1 and RSPI1.
> Set SW1[3] to position ON for selecting Ethernet0.
>
> This patch disables Ethernet0 on RZ/G2UL SMARC platform by default.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> @@ -52,11 +57,101 @@
>  #endif
>  };
>
> +#if (!SW_ET0_EN_N)
> +&eth0 {
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy0>;
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +
> +       phy0: ethernet-phy@7 {
> +               compatible = "ethernet-phy-id0022.1640",
> +                            "ethernet-phy-ieee802.3-c22";

To be augmented with interrupt properties when the RZ/G2L IRQC driver
and bindings have been completed.  But that can be done later..

> +               reg = <7>;
> +               rxc-skew-psec = <2400>;
> +               txc-skew-psec = <2400>;
> +               rxdv-skew-psec = <0>;
> +               txdv-skew-psec = <0>;
> +               rxd0-skew-psec = <0>;
> +               rxd1-skew-psec = <0>;
> +               rxd2-skew-psec = <0>;
> +               rxd3-skew-psec = <0>;
> +               txd0-skew-psec = <0>;
> +               txd1-skew-psec = <0>;
> +               txd2-skew-psec = <0>;
> +               txd3-skew-psec = <0>;
> +       };
> +};
> +#endif
> +
> +&eth1 {
> +       pinctrl-0 = <&eth1_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy1>;
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +
> +       phy1: ethernet-phy@7 {
> +               compatible = "ethernet-phy-id0022.1640",
> +                            "ethernet-phy-ieee802.3-c22";
> +               reg = <7>;

Likewise.

> +               rxc-skew-psec = <2400>;
> +               txc-skew-psec = <2400>;
> +               rxdv-skew-psec = <0>;
> +               txdv-skew-psec = <0>;
> +               rxd0-skew-psec = <0>;
> +               rxd1-skew-psec = <0>;
> +               rxd2-skew-psec = <0>;
> +               rxd3-skew-psec = <0>;
> +               txd0-skew-psec = <0>;
> +               txd1-skew-psec = <0>;
> +               txd2-skew-psec = <0>;
> +               txd3-skew-psec = <0>;
> +       };
> +};

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
