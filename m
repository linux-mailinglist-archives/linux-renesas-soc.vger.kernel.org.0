Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75DDE25F464
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 09:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgIGH4E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 03:56:04 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45072 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbgIGHz7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 03:55:59 -0400
Received: by mail-oi1-f195.google.com with SMTP id d189so12821566oig.12;
        Mon, 07 Sep 2020 00:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uuBwypJmHWQd5+fhA+Qi5ygJwZd3WxmHZlgvS26xGCM=;
        b=GtOSW2MJgduv5NPEDLskPJLOojRpBiRg3hHAx5UNhBY8LlJ6aKraRwa1+s/vMj7xZF
         etwr8rUWgVySyHcNTzD6seOgivEmMWPRaobsPpAnrJK/fU7eQAefoTZU1KP6IyuIMJxh
         FRCSEF85pvpMvMfrLKt/ohLojmPph3+T6obI40Qod5NYHBwqdPA8vNVv6xUXWdUYpByw
         zJr+m8IXEqAeptEMmLgXx33H/ERFocolgAG8uAuz+MeUW25kDQc299VI8AG41S1OykwV
         TtDMq4RAcWqQtrVC0qc+1/E50u+sZIXhZPbMYbN2Bm6XhOBSqFtBdjtrSfaseFSgfUxK
         1qmw==
X-Gm-Message-State: AOAM5334dcRNXxsfmCCWQhh+9zZiGg4u0z3FBRlBWq9TRXYxpUDYzlDP
        e+4Hgc6WCKSq5amCKXgS8EdaLAc0QK2J3Tov0rs=
X-Google-Smtp-Source: ABdhPJw7BBFktIEQUB+STV6VUKMgajK/DnzWMIBlXP6kmOSIVV2532SU9YvqzAL5tzHBtDMz4jSG1EpLv2CV/1B5P6o=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr11714334oib.54.1599465358239;
 Mon, 07 Sep 2020 00:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825162718.5838-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXkGBfwNOwd5-=U3wg6U0O+3BErbXuybbuytgzsCmZqRQ@mail.gmail.com> <CA+V-a8uT8d8P8REuXcW9qtCxM84DH+Q4LXZnVTYhT--kswKF=g@mail.gmail.com>
In-Reply-To: <CA+V-a8uT8d8P8REuXcW9qtCxM84DH+Q4LXZnVTYhT--kswKF=g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 09:55:46 +0200
Message-ID: <CAMuHMdW+JBd2iu4BsQHdEV=4dt7mh_14TyHLMQcywAJVPFZZCg@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: r8a7742-iwg21d-q7: Enable SD2 LED indication
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Fri, Sep 4, 2020 at 7:15 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Sep 3, 2020 at 1:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Aug 25, 2020 at 6:28 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Add support for LED trigger on SD2 interface.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> >
> > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > > @@ -63,6 +63,16 @@
> > >                 enable-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
> > >         };
> > >
> > > +       leds {
> > > +               compatible = "gpio-leds";
> > > +
> > > +               sdhi2_led {
> > > +                       label = "sdio-led";
> > > +                       gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
> >
> > GPIO_ACTIVE_HIGH?
> >
> > The LED is driven by an NPN transistor, with the LED between 3.3V and
> > the transistor's collector.

Oops, 3.3V is not VCC_3V3, but SD_3V3, so it is not always-on, but
controlled by SDIO_PWR.

> I did try with GPIO_ACTIVE_HIGH and it didn't work as expected. To
> make sure I can control the LED through sysfs I deleted the node from
> DTS and exported the pin GP5_22 (858) and writing the value "out"
> direction and setting the values 0/1 to value did not toggle the SDIO
> LED as expected and it stayed OFF all the time.

Hence when SDIO_PWR is turned off, you cannot control the LED just by
toggling GP5_22.

> Looks like there is some information missing in the schematics.
>
> I did some experiments. I completely removed the SDHI, LED and
> regulator  nodes and  booted the system and exported GP1_27 (989) and
> wrote values 0/1  and this toggled the SDIO_LED.
>
> U-boot sets the below, so in u-boot the SDIO_LED is ON:
>     gpio_direction_output(GPIO_GP_1_27, 0); /* power on */
>     gpio_set_value(GPIO_GP_1_27, 0);
>     gpio_direction_output(GPIO_GP_5_22, 0); /* LED  */
>     gpio_set_value(GPIO_GP_5_22, 1);
>     gpio_direction_output(GPIO_GP_1_8, 0); /* 1: 3.3V, 0: 1.8V*/
>     gpio_set_value(GPIO_GP_1_8, 1);
>
> So in comparison we would need a hog node as below (and with this the
> LED triggers correctly as expected),
>
> &gpio5 {
>     sdio-led-gpio {
>         gpio-hog;
>         gpios = <22 GPIO_ACTIVE_HIGH>;
>         output-high;
>         line-name = "sdio-led-gpio";
>     };
> };
>
> Let me know if you are OK with the above.

The above means the LED is always lit when SDIO_PWR is enabled.
While I agree that's some kind of SD activity indicator, probably it's less
fine-grained than using the mmc1 trigger?
I assume the mmc1 trigger is only activated when SDIO_PWR is enabled.
Are you sure this doesn't work?
Perhaps your kernel was missing SD trigger support, or "mmc1" is the
wrong SD instance?

> Looks like the SDIO_PWR is tied up with an SDIO_LED pin and the
> information is missing from schematics.

No, I think we just misread the schematics.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
