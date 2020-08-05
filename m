Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC01123CD58
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 19:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgHERZR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 13:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbgHERZG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 13:25:06 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34BAC0086AB;
        Wed,  5 Aug 2020 07:47:02 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id t7so19695374otp.0;
        Wed, 05 Aug 2020 07:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EwNbORxDFIbm44T1fVXX43x3s7U+jU8SsrHPB/cPJqU=;
        b=WN/1bEFCBuQuFMVyLXsLFREdhs5LBhNQDp9WlpeR8TFfmrsaiar8PDzY8vtjTLeeym
         NFBWux02Y5Pb0QK/RldxA7IjdZwx6B8QR+cV1LJyLY9slvVlcK6yzCVSWNpa9PkycwUU
         rbUu0mrPH6iyAYUcE7pod0BoNbNhKE9WJY2tK5w8cFi5/juzE8TIWJi2HHLdc6NYWW6g
         UDXYnU2TX5zHGAV2GOfVLWoIOxb2kn82/UVIhSxKUJynCZ5lwzd/CP1Bb78leIujhMOY
         /iiVTsnBVWtW8QQKU8lKrt8Cy497lmMco0lTmKtakxHOFeKYMSE7w9AdvE/j32lgkJM0
         4lUg==
X-Gm-Message-State: AOAM530gplRzia9Htz6QHmP6qv4JA8qk2/s6ujy1nysTa5Klo2rm4D5v
        x09bKW138Vfbmva7mMl298XRwrnpT37rnVfKNOo/7g==
X-Google-Smtp-Source: ABdhPJzt7h8RrIxvZX2vRMm2/bzqaHnsQxVVdhFRu4B03RG5Stg3lPBllx3+yunGKjo04+1O1mlapSD/aeoZS8HU1PE=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr2165602otl.145.1596627711771;
 Wed, 05 Aug 2020 04:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200729122602.9561-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200729122602.9561-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Aug 2020 13:41:40 +0200
Message-ID: <CAMuHMdXPRsB3N=sfL0VgvAxxHLNCHhotsc501kG9-KMDoYXRJA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: iwg22d-sodimm: Fix dt nodes sorting
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
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Jul 29, 2020 at 2:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Some device nodes in the r8a7745-iwg22d-sodimm.dts are not sorted
> alphabetically. This patch fixes the sorting of nodes and also fixes a
> typo in the stmpe node.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> @@ -53,6 +53,25 @@
>                 clock-frequency = <26000000>;
>         };
>
> +       backlight_lcd: backlight {
> +               compatible = "pwm-backlight";
> +               pwms = <&tpu 3 5000000 PWM_POLARITY_INVERTED>;
> +               brightness-levels = <0 4 8 16 32 64 128 255>;
> +               default-brightness-level = <7>;
> +       };
> +
> +       lcd_panel: lcd {
> +               compatible = "edt,etm043080dh6gp";
> +               power-supply = <&vccq_panel>;
> +               backlight = <&backlight_lcd>;
> +
> +               port {
> +                       lcd_in: endpoint {
> +                               remote-endpoint = <&du_out_rgb0>;
> +                       };
> +               };
> +       };
> +
>         rsnd_sgtl5000: sound {

Shouldn't the sound node be moved below the regulator nodes?

>                 compatible = "simple-audio-card";
>                 simple-audio-card,format = "i2s";
> @@ -68,18 +87,6 @@
>                 };
>         };
>
> -       vccq_sdhi0: regulator-vccq-sdhi0 {
> -               compatible = "regulator-gpio";
> -
> -               regulator-name = "SDHI0 VccQ";
> -               regulator-min-microvolt = <1800000>;
> -               regulator-max-microvolt = <3300000>;
> -
> -               gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
> -               gpios-states = <1>;
> -               states = <3300000 1>, <1800000 0>;
> -       };
> -
>         vccq_panel: regulator-vccq-panel {
>                 compatible = "regulator-fixed";
>                 regulator-name = "Panel VccQ";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
