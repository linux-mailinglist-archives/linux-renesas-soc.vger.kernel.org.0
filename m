Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5136434C9E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 10:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233456AbhC2IeG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 04:34:06 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:41489 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbhC2IbB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 04:31:01 -0400
Received: by mail-ua1-f41.google.com with SMTP id g5so3720391uan.8;
        Mon, 29 Mar 2021 01:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DIyfy1DYdEXzkjvr5K0gqsI3w0hd8ue7rLH1IVU2OAM=;
        b=ITvs0m3QY3hrYNV6UZDzhNSOrOcpxwYAAdU57BAz3p4FreEccT0js+O45hAs9lavYA
         1cSlZUt91JZUpFwqjqWJgqGhf80sLRJWqUPr6H1TPy/SynYSe1z99+x6URahmil4/rNc
         vI9x1BHnJkMYfiFCMu4QPmvoIr31kMmLwb1uNhzImgW/Gzr0O8k5nmkUj0z2YU8FT1BJ
         hrz4VhzwvkqCszU45E9tGujhQiPZbiKBZvg9H+0l/g3P1BF89Iyl8iVs44HOPkyJv2lq
         xM7biJq96fUBPZtKgSersMsmfmjfFsxJH6xVMb01Ka4/GtGiRXwp9BcePjn/bhp25DZ/
         x/Bw==
X-Gm-Message-State: AOAM5308Bp82qk//3ewZ5yoZuS0NMkp0bmIlS+s8S+4YtWFY6In6+KzI
        4DaLY4xU3+fKvKKT6CGFMNodNBWqT4AJx49j5myVvW5QiH4=
X-Google-Smtp-Source: ABdhPJzYZjPGlZS19eR5C99Z75A0Qz5bhqSseWx1ml+X60Y+xeqB25MaEGgEm0gR4RIBnTwzPp98lt/FKCq9YNyO9og=
X-Received: by 2002:ab0:2c16:: with SMTP id l22mr13576385uar.100.1617006660653;
 Mon, 29 Mar 2021 01:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210322172013.1152121-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20210322172013.1152121-1-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Mar 2021 10:30:49 +0200
Message-ID: <CAMuHMdVzW=pAbJzSmC3Wt3zH4F8kUfd-s0JkQeg5NdPsGJAVrw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: falcon-cpu: Add GP LEDs
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Mon, Mar 22, 2021 at 6:20 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Three general purpose LEDs are provided on the Falcon CPU board.
>
> Connect GP_LED1, GP_LED2, and GP_LED3 to the gpio-leds frameworks as
> indicator LEDs.
>
> These LEDs are arranged in a block of four LEDs on the board itself, but
> the fourth LED is as yet unidentified.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks for your patch (which does not apply against renesas-devel)!

> --

--- ;-)

> v2:
>  - Move to r8a779a0-falcon-cpu.dtsi
>  - Define the colour, and function.

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> @@ -6,12 +6,37 @@
>   */
>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
>  #include "r8a779a0.dtsi"
>
>  / {
>         model = "Renesas Falcon CPU board";
>         compatible = "renesas,falcon-cpu", "renesas,r8a779a0";
>
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led1 {

led-1?

Documentation/devicetree/bindings/leds/leds-gpio.yaml says:

  # The first form is preferred, but fall back to just 'led' anywhere in the
  # node name to at least catch some child nodes.
  "(^led-[0-9a-f]$|led)":

> +                       gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       function = LED_FUNCTION_INDICATOR;
> +                       function-enumerator = <1>;
> +               };
> +               led2 {
> +                       gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>;
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       function = LED_FUNCTION_INDICATOR;
> +                       function-enumerator = <2>;
> +               };
> +               led3 {
> +                       gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       function = LED_FUNCTION_INDICATOR;
> +                       function-enumerator = <3>;
> +               };
> +       };
> +
>         memory@48000000 {
>                 device_type = "memory";
>                 /* first 128MB is reserved for secure area. */

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
