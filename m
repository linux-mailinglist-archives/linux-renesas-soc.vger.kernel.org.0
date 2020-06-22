Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89D7203765
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 15:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgFVNCg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 09:02:36 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46264 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728024AbgFVNCg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 09:02:36 -0400
Received: by mail-ot1-f65.google.com with SMTP id g7so12916424oti.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2020 06:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=axtQGLlx977qZvCCo+8HO/WFPhzAShI15n6az+M9Wdc=;
        b=GCOLE4a/6YUCeWOqbk3bDWpeS95dXc6l8AB8z1joKir37gV1rCx6V1vsHH9pTVcHvY
         3wEoWeuEBFMFl3Ep9wTGxXLmPz/hp6gdAS3b6IShYephqDIffStTBKyxD4tOg6kCy72P
         sYidBZh3r94y6llrdjSvVPnrT4wVHjITCVcBEAsBHBPIjEJvZCfcK2uAyO1LcmjW9PFp
         kOyG4gk6m+1VhqonPpxP0aY77Mbs0p2EtAoEGzNlxHJYN1RWEMudOD0ex2GfQn5lDycc
         JOQtFciFWeIpfEPRwBN0yKOonhe29Nof+5bnP9JzgBRsEdf43Y5snF+5VHTHZdierPx7
         eukQ==
X-Gm-Message-State: AOAM531TWVtmvPst2TEO1jVJLzslGG3nyj0TW/G3wY74x+BMUioSrbTP
        pjjpPWCiJrVkLMW8yvBawE7edvdn/aunry5vsKM=
X-Google-Smtp-Source: ABdhPJxHgjDIsw3R5dSK1hQOSW6IbqrZbVAV0vNEZ0112OMf3S1G6hLG6p2ELOpxDxPizHRVx2HpfhPbZ/b2aSEz4QM=
X-Received: by 2002:a05:6830:141a:: with SMTP id v26mr13980985otp.250.1592830955809;
 Mon, 22 Jun 2020 06:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <159282942947.12451.16657662841957319548.sendpatchset@octo>
In-Reply-To: <159282942947.12451.16657662841957319548.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Jun 2020 15:02:24 +0200
Message-ID: <CAMuHMdU=VGppaNb_ybSwG_GocZaZFCcoMkv1_uwoY=9111b92Q@mail.gmail.com>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: r8a77995-draak: gpio-leds prototype
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Mon, Jun 22, 2020 at 2:51 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> This patch adds support for a couple of LEDs on the r8a77995 Draak board.
>
> It also ignores the issue that push switches are also used on the same GPIOs.
>
> The approach is the same as in the earlier posted patch for other boards:
> [PATCH/RFC] arm64: dts: renesas: salvator-common: gpio-leds prototype
>
> The limitations of DT bindings and kernel software support remain the same.
>
> As Geert pointed out we need to extend the software to allow sharing of
> GPIOs somehow. On this board and several others the GPIOs used for LEDs
> are also used for push switches. Both DT bindings and drivers need to
> be extended, most likely together with the GPIO subsystem. And to make it
> more fun it is probably possible to get interrupts from these GPIOs as well.
>
> In the patch the LED order and the GPIO number assignments look quite random
> but match the schematics.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- 0001/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ work/arch/arm64/boot/dts/renesas/r8a77995-draak.dts 2020-06-22 21:00:20.000000000 +0900
> @@ -91,6 +91,20 @@
>                 };
>         };
>
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led13 {

While a name like "led13" is still considered acceptable these days, the
preferred format uses a hyphen ("^led-[0-9a-f]$"; whoops no one thought of
more than 16 LEDs?)

> +                       gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>;
> +               };
> +               led12 {
> +                       gpios = <&gpio1 30 GPIO_ACTIVE_HIGH>;
> +               };
> +               led14 {
> +                       gpios = <&gpio4 25 GPIO_ACTIVE_HIGH>;
> +               };
> +       };
> +
>         memory@48000000 {
>                 device_type = "memory";
>                 /* first 128MB is reserved for secure area. */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
