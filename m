Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 085BD696660
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 15:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233183AbjBNORn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 09:17:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232691AbjBNORi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 09:17:38 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765A0298C7;
        Tue, 14 Feb 2023 06:17:14 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id q13so17512637qtx.2;
        Tue, 14 Feb 2023 06:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txOq0wK14R9XBDOLfNIXE8XNcrkhv0L/Yt0VKlFt/UI=;
        b=6OV+BFFv41CLUJv5gqwuC8qmXbuTUBWG+dyqEZnimFnZ4YNCZ6NyFJdNrwfSI1SIzQ
         +6LgNED30FlNCXYstbE9Nbv87hMn2XjnwHok/OBCaiMJpts2Z36yDke087gFXLlVkuJY
         TvoO2M0Su1tFkILYrbLFyl4lx8iRl6BnQbFjZQKmty4i2uXJ7BCQfIVYfIJIt+IR69sl
         MBQbaBM1Le1AXGYGGN2WcUL/GEe8Y6oumxUvC72TX/+oVptX7e0s/GyOzs2+UBucW/xA
         +PxVTSffIGV+YWM6QfkgsiBZUFQyBjBRcABEuIgYbyYBLvuEisWJEItDvTSXRLcyAobQ
         PfTw==
X-Gm-Message-State: AO0yUKUrjaK7prUBMl40vJ1Wf2WZhvOncaNx0UQC211O6UHgAr/F8We1
        osG/IxrrLGGNc48erODMZ8ca5PAqby2d1OLh
X-Google-Smtp-Source: AK7set+pxq0D+YoEb+29+sMoAedG0vvgUHsYqGPUJ1Lu7S5meKoDplMTxYo6NKPjXmSbcIpD9e5poA==
X-Received: by 2002:a05:622a:1648:b0:3b8:6bf8:9584 with SMTP id y8-20020a05622a164800b003b86bf89584mr2857014qtj.35.1676384173039;
        Tue, 14 Feb 2023 06:16:13 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id l12-20020ac8724c000000b003b8238114d9sm11143353qtp.12.2023.02.14.06.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 06:16:12 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id s203so13201798ybc.11;
        Tue, 14 Feb 2023 06:16:12 -0800 (PST)
X-Received: by 2002:a05:6902:14d:b0:921:783:f2f5 with SMTP id
 p13-20020a056902014d00b009210783f2f5mr213282ybh.574.1676384172257; Tue, 14
 Feb 2023 06:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20230209164016.645399-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230209164016.645399-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 15:16:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMuNrSY=79wCbgpQU_QGzJkk3mPHm35a0c+dMaSqH0XQ@mail.gmail.com>
Message-ID: <CAMuHMdWMuNrSY=79wCbgpQU_QGzJkk3mPHm35a0c+dMaSqH0XQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR flash
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Feb 9, 2023 at 5:40 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable Renesas at25ql128a flash connected to QSPI0. Also disable
> the node from rzfive-smarc-som as it is untested.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> @@ -179,6 +179,18 @@ eth1_pins: eth1 {
>                          <RZG2L_PORT_PINMUX(18, 5, 1)>; /* IRQ7 */
>         };
>
> +       qspi0_pins: qspi0 {
> +               qspi0-data {
> +                       pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3";
> +                       power-source = <1800>;
> +               };
> +
> +               qspi0-ctrl {
> +                       pins = "QSPI0_SPCLK", "QSPI0_SSL";
> +                       power-source = <1800>;
> +               };

I guess there is no need for the subnodes, as all pins use the
same power-source value?

> +       };
> +
>         sdhi0_emmc_pins: sd0emmc {
>                 sd0_emmc_data {
>                         pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
> @@ -230,6 +242,38 @@ sd0_mux_uhs {
>         };
>  };
>
> +&sbc {
> +       pinctrl-0 = <&qspi0_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       flash@0 {
> +               compatible = "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <1>;

Why not <4>? According to the datasheet, AT25QL128A supports
quad read and write.

> +               spi-rx-bus-width = <4>;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
