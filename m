Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D5925E09D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Sep 2020 19:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgIDRPy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 13:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgIDRPv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 13:15:51 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B49EC061244;
        Fri,  4 Sep 2020 10:15:51 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id x10so4886253ybj.13;
        Fri, 04 Sep 2020 10:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/SS7L6jjq/PkiHi0BpEL2RJG6KnZ3YeAsUX9aGxPLU=;
        b=ZmznAuNwO3nYNA0dLCjo1WUEdDHaj1pw+oBHIZUTdVnrg+aig8CreNfiqbzygj59fi
         YebSJafUdoCrE1zHKoU3ciYQD8YFRJwQjuo5xRbRA4O4vkxuy42dzIBJZRP5y086h08h
         UaJcOQQLwg1Ei3oYrsqw7TnATYKVxu1IPz61mcenKpGvv73pvXSdpAjJ9bJ9LyLRrWBu
         z9Iqnvh9xb1FNFYTGcYj4qINQ9Kv71MU3EOQdi6DsVJHGMAvALCqebA5/JvkyHNQMPWo
         txr2oz0OlzudipPSVssC8HBXCAwyXa9ZlvPQuamv26paxh5o8EE+lxM68PZtYuruFSlV
         xZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/SS7L6jjq/PkiHi0BpEL2RJG6KnZ3YeAsUX9aGxPLU=;
        b=jNrytltLxjOSjIDYmF67piqb9aM7NbduEgb97PX7BmH5Jhc/rILjcg8I67ml31oMBw
         FgZOJurtMtnYDlz8JDI1MDpE0f0zDvJn0TO3PbOzIA5gAiShEGt+1Xd67095AlBNz0id
         rNWi02WfePEX8MKBC7a9Ijw1ZLNVTk3rkkmoo+QE8HcogdcKC4LT7UMrV0nThroH7eSW
         q3+mDt/sw5yoxR6vI/34RqRX3Pgw9I9gjhh9mZl/SwP5lOxTlqLa0BotYllau/tJDjuR
         k2BpWg0CKlnNg/xHwjyNT+uP5xhaIVnMxLdtOPuKI5tsD5kVGzApmlBmN/kGgXXs76v4
         Mgsw==
X-Gm-Message-State: AOAM532XeoGrw+YrRkhN/Ynp6fkOsPqOcCvOUSfZ+2Zdmh96MVJk9QG7
        82gXbaxbB2O4asriJXI2Vj0pD1KM9dCN46RDB/k=
X-Google-Smtp-Source: ABdhPJxuOg5fYSy1dGzvnvkYBk+JtuSW6m3awyVSDhO6e062I+QPueGNMaScXLeiHJIteKTmLxrJvWSSX0O3oAMAEF8=
X-Received: by 2002:a25:ada0:: with SMTP id z32mr10674783ybi.401.1599239750386;
 Fri, 04 Sep 2020 10:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825162718.5838-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXkGBfwNOwd5-=U3wg6U0O+3BErbXuybbuytgzsCmZqRQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXkGBfwNOwd5-=U3wg6U0O+3BErbXuybbuytgzsCmZqRQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 4 Sep 2020 18:15:23 +0100
Message-ID: <CA+V-a8uT8d8P8REuXcW9qtCxM84DH+Q4LXZnVTYhT--kswKF=g@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: r8a7742-iwg21d-q7: Enable SD2 LED indication
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Thu, Sep 3, 2020 at 1:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Aug 25, 2020 at 6:28 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add support for LED trigger on SD2 interface.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
>
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > @@ -63,6 +63,16 @@
> >                 enable-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
> >         };
> >
> > +       leds {
> > +               compatible = "gpio-leds";
> > +
> > +               sdhi2_led {
> > +                       label = "sdio-led";
> > +                       gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
>
> GPIO_ACTIVE_HIGH?
>
I did try with GPIO_ACTIVE_HIGH and it didn't work as expected. To
make sure I can control the LED through sysfs I deleted the node from
DTS and exported the pin GP5_22 (858) and writing the value "out"
direction and setting the values 0/1 to value did not toggle the SDIO
LED as expected and it stayed OFF all the time.

Looks like there is some information missing in the schematics.

I did some experiments. I completely removed the SDHI, LED and
regulator  nodes and  booted the system and exported GP1_27 (989) and
wrote values 0/1  and this toggled the SDIO_LED.

U-boot sets the below, so in u-boot the SDIO_LED is ON:
    gpio_direction_output(GPIO_GP_1_27, 0); /* power on */
    gpio_set_value(GPIO_GP_1_27, 0);
    gpio_direction_output(GPIO_GP_5_22, 0); /* LED  */
    gpio_set_value(GPIO_GP_5_22, 1);
    gpio_direction_output(GPIO_GP_1_8, 0); /* 1: 3.3V, 0: 1.8V*/
    gpio_set_value(GPIO_GP_1_8, 1);

So in comparison we would need a hog node as below (and with this the
LED triggers correctly as expected),

&gpio5 {
    sdio-led-gpio {
        gpio-hog;
        gpios = <22 GPIO_ACTIVE_HIGH>;
        output-high;
        line-name = "sdio-led-gpio";
    };
};

Let me know if you are OK with the above.

Looks like the SDIO_PWR is tied up with an SDIO_LED pin and the
information is missing from schematics.

Cheers,
Prabhakar

> The LED is driven by an NPN transistor, with the LED between 3.3V and
> the transistor's collector.
>
> > +                       linux,default-trigger = "mmc1";
> > +               };
> > +       };
> > +
> >         lvds-receiver {
> >                 compatible = "ti,ds90cf384a", "lvds-decoder";
> >                 vcc-supply = <&vcc_3v3_tft1>;
>
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
