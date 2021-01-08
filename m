Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3B42EF2C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 14:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbhAHNAW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 08:00:22 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:46174 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbhAHNAU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 08:00:20 -0500
Received: by mail-ot1-f41.google.com with SMTP id w3so9501560otp.13;
        Fri, 08 Jan 2021 05:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nK3cWo1amowhiwULtOouzGk6luz5/qofhSkKlFioO3k=;
        b=cC8Qj2ffdr8c7tAD151+DWsrnMgb1ABfrDQnZN+v8SHha04UHz/KTRLgLlaVN19PYI
         AwCQp87dY6MY94GXJ+osY0egjWx22Sw2QzZ3c2/ulTfPmUdjQXZ/wxpAb/tCJ7xJjPch
         gwGCkCCM+yPWR4flL/8UKB/zVsQdQQyNqDKtBksZbWmqt+MVTfO1u3aKQrQMFOaPFgDm
         l2ikKvTxv3gtoQa3f9auCnDoGbEMtT1f+fxXZ7L6kHPC5ORJ0TiHv6pv1kPlRvzuVPHy
         b7+hZwTM88NOtI55bLUJchi0cIJOlbsF6CjKFezboNdlSFBeAG3e4tO0GdcLm8WVwevW
         FQXg==
X-Gm-Message-State: AOAM531W3HHDoWJ3oAHVhliMZwofkAG5ms7uKmIQUbqcaxuj53HSEQI2
        AQPiRaFKjQGvA/8hyAIVAZvfKJ6WLOC53iYtM7k=
X-Google-Smtp-Source: ABdhPJyXHMuGda2nzp/UaHZmPhb9ahjx0nuAZYkHw7x/W8zRv3eJhC3BNCFyRSG1LicuLkDVg1Wbdz1MAZSPnwe6YJU=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr2419145otr.107.1610110778895;
 Fri, 08 Jan 2021 04:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com> <20201227174202.40834-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201227174202.40834-7-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 13:59:27 +0100
Message-ID: <CAMuHMdWs5SWUpDkcX4m9MqVKa4KJvAfXSsRt=Fq3c9=2JtdwHQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: falcon: Enable MMC
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Sun, Dec 27, 2020 at 6:42 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>
> Enable MMC on the Falcon board.
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [wsa: double checked & rebased]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> @@ -20,6 +20,24 @@ aliases {
>         chosen {
>                 stdout-path = "serial0:115200n8";
>         };
> +
> +       reg_1p8v: regulator0 {

Please use a better node name, to avoid accidental duplicates, cfr. commit
45f5d5a9e34d3fe4 ("arm64: dts: renesas: r8a77995: draak: Fix backlight
regulator name")

> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.8V";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       reg_3p3v: regulator1 {

Likewise

> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-3.3V";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
>  };
>
>  &avb0 {
> @@ -169,6 +187,23 @@ &i2c6 {
>         clock-frequency = <100000>;
>  };
>
> +&mmc0 {
> +       pinctrl-0 = <&mmc_pins>;
> +       pinctrl-1 = <&mmc_pins>;
> +       pinctrl-names = "default", "state_uhs";
> +
> +       vmmc-supply = <&reg_3p3v>;
> +       vqmmc-supply = <&reg_1p8v>;
> +       mmc-hs200-1_8v;
> +       mmc-hs400-1_8v;
> +       bus-width = <8>;
> +       no-sd;
> +       no-sdio;

I'm no expert on the no-sd{,io} properties.
Just wondering if we need them on other R-Car gen3 boards with eMMC, too/

> +       non-removable;
> +       full-pwr-cycle-in-suspend;
> +       status = "okay";
> +};

With the node names fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
