Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF7132ECCA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 15:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhCEOLZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 09:11:25 -0500
Received: from mail-vs1-f48.google.com ([209.85.217.48]:33645 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbhCEOK4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 09:10:56 -0500
Received: by mail-vs1-f48.google.com with SMTP id b189so1030265vsd.0;
        Fri, 05 Mar 2021 06:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OmgaCqzYZtdNpJ3SZEq/xbrWUa3xhPvp+tDi/EiuDcU=;
        b=XPQe7WMYhKkiLTpkkWqi2nU8OI5GdrtB+lCG4jTsmhxXwU0rBmTlvxy1fddOLhTM0j
         w3Fz/X3PRFsQjO+3Ujwo4+PG9ZHJVliDGodZwAmqXr4wkT9843kAj2tVKbkKZowhPInL
         W5M0eHcyA9+dIcyzu5i4pO7PaYFYgpJhzDgcZr7AAh8Al/vTRBGYSf1eEEJle41PJfch
         tCq8Pq8eIDwLVKxzjMYzL0rAT5BvJRg9kenLVRwAI0J57LHp4GeXNq3FUMHCCHkxWr48
         Io8F8+MBsUW4nDM2OymeKHDEdwgBpoUgpkZrzjPcQGxDDk82mzr/GQmq8M6rBE18r/iE
         lyNA==
X-Gm-Message-State: AOAM5309dn5XBDsoxJbkKlAQgLVYo5wEoDNrornz3+t+teexvtjvYBm2
        zZ9TeKuG5DkS0dNGHGbUX7LjfQcTPjbVvah0gW7Rwat0fCw=
X-Google-Smtp-Source: ABdhPJzhouCjSuRHOWoYAl/WPpvPMyCVObRioJ++SqBI/oXwTZQvjf8/PMpTFbhnqDJYoqBS7MjNJHsDgxc6xVUV68E=
X-Received: by 2002:a67:2245:: with SMTP id i66mr7055441vsi.18.1614953453536;
 Fri, 05 Mar 2021 06:10:53 -0800 (PST)
MIME-Version: 1.0
References: <20210304165300.295952-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20210304165300.295952-1-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 5 Mar 2021 15:10:42 +0100
Message-ID: <CAMuHMdWRe0HVzQD9U_8+35_HTaK28Ayb+9tsb8q5+3VNpYniHg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: falcon: Add GP LEDs
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

On Thu, Mar 4, 2021 at 5:53 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Three general purpose LEDs are provided on the Falcon CPU board.
>
> Connect GP_LED1, GP_LED2, and GP_LED3 to the gpio-leds frameworks.
> These LEDs are arranged in a block of four LEDs on the board itself, but
> the fourth LED is as yet unidentified.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts

I believe the LEDs are on the CPU board, so they belong in
r8a779a0-falcon-cpu.dtsi instead?

> @@ -20,6 +20,20 @@ aliases {
>         chosen {
>                 stdout-path = "serial0:115200n8";
>         };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led1 {
> +                       gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;

Any need for other properties from
Documentation/devicetree/bindings/leds/common.yaml, like
color = <LED_COLOR_ID_GREEN>?

> +               };
> +               led2 {
> +                       gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>;
> +               };
> +               led3 {
> +                       gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
> +               };
> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
