Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85C13AE7DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 13:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhFULGT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 07:06:19 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:37642 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhFULGT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 07:06:19 -0400
Received: by mail-ua1-f42.google.com with SMTP id f34so6181090uae.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jun 2021 04:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uPUsGchIZ6bXU4q2jWS0k80WUp/+NvqHfkslZ8zQI+U=;
        b=PM/i4zIB2vqG0gxi+AqXj9w+90K7hmqBV/Y53/tawkA3k2xbQhXwDWDAGfUWh/5KVC
         uLNjC2Fvebk2Ri6JYM6vL2TV1Zx+LjR2BGhtTAXcpKRjsl/w8LR8w66ImTBinSKuTeqB
         fKt9jUlGK1L3wF/1EkVlL0ikujbIcAM3exL795AP9vrEdVh0dwLt2Ta3NRt1qABj8MTu
         xnCUICPif3gK8x2zogdbKnyPF0HsfdTPGbf8+VmGjjetflaUjUcvZGiOz5sLGXY68yqE
         c++8l1YU66BqqBF3XJgX508t+VVRtgWKdjPw55/kjiAOMvVIRO/zvwJRXyIo6izTDhg2
         nybw==
X-Gm-Message-State: AOAM531vq6nzVWS9sxOxBK18HwwjZCy/evYA1i6Mk9NWSG6yZWPCN8i6
        8InM0/jrzCLUSJxV6GMXv5HZ+peZGo9TCK5s4SFvJKUp4B+Hjg==
X-Google-Smtp-Source: ABdhPJyi82MM1BpXqunG4T+WfJ70OJo5jq6/DKKUjEwoCCwMZ9Uu9ejDnXE6JQBdkr2ZMm/iwA16V85gjNZZRitVlN4=
X-Received: by 2002:ab0:70b3:: with SMTP id q19mr21114562ual.2.1624273444774;
 Mon, 21 Jun 2021 04:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <162416647337.11444.4467438519249633023.sendpatchset@octo> <162416648909.11444.15000511904887495628.sendpatchset@octo>
In-Reply-To: <162416648909.11444.15000511904887495628.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jun 2021 13:03:53 +0200
Message-ID: <CAMuHMdVx-6m0wE-D_6ZUhsLc=wX13eMYLOGkKhcT-6L=YbrwVQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77970: eagle: Add SW2 support
To:     Magnus Damm <damm@opensource.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Sun, Jun 20, 2021 at 8:01 AM Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add support for SW2 via "gpio-keys" on the R-Car V3M Eagle board.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks for your patch!

> --- 0001/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ work/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts 2021-06-19 19:26:28.399714892 +0900
> @@ -8,6 +8,8 @@
>
>  /dts-v1/;
>  #include "r8a77970.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>
>  / {
>         model = "Renesas Eagle board based on r8a77970";
> @@ -43,6 +45,42 @@
>                 };
>         };
>
> +       keys {
> +               compatible = "gpio-keys";
> +
> +               pinctrl-0 = <&keys_pins>;
> +               pinctrl-names = "default";
> +
> +               key-1 {
> +                       gpios = <&gpio1 21 GPIO_ACTIVE_LOW>;
> +                       linux,code = <KEY_1>;
> +                       label = "SW2-1";
> +                       wakeup-source;
> +                       debounce-interval = <20>;
> +               };
> +               key-2 {
> +                       gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
> +                       linux,code = <KEY_2>;
> +                       label = "SW2-2";
> +                       wakeup-source;
> +                       debounce-interval = <20>;
> +               };
> +               key-3 {
> +                       gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
> +                       linux,code = <KEY_3>;
> +                       label = "SW2-3";
> +                       wakeup-source;
> +                       debounce-interval = <20>;
> +               };
> +               key-4 {
> +                       gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
> +                       linux,code = <KEY_4>;
> +                       label = "SW2-4";
> +                       wakeup-source;
> +                       debounce-interval = <20>;
> +               };
> +       };
> +
>         lvds-decoder {
>                 compatible = "thine,thc63lvd1024";
>
> @@ -196,6 +234,11 @@

>                 function = "i2c0";
>         };
>
> +       keys_pins: keys {
> +               pins = "GP_1_21", "GP_1_22", "GP_1_23", "GP_1_24";

While Section 2.11 ("GPIO Interfaces for Debugging") of the "R-CarV3M
System Evaluation Board / Eagle Hardware Manual" (Rev 0.08) says:

    When using the software switches, enable the internal pull-up
    functions of GP1_21, GP1_22, GP1_23, and GP1_24.

I think GP_1_21 should be dropped, as it's already pulled-up by R427.

Furthermore, as the Eagle DTS has CANFD enabled, SW2-1 and SW2-2
are not available, so both should be dropped.

Presumably you have SW32=on, so SW2-2 works, and CANFD doesn't?
Probably we should document this in the DTS.

> +               bias-pull-up;
> +       };
> +
>         qspi0_pins: qspi0 {
>                 groups = "qspi0_ctrl", "qspi0_data4";
>                 function = "qspi0";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
