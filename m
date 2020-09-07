Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7456525FCF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 17:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730181AbgIGPYZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 11:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730153AbgIGPXj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 11:23:39 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FF5C061573;
        Mon,  7 Sep 2020 08:23:37 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id r7so9411736ybl.6;
        Mon, 07 Sep 2020 08:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=atNQu443wohaZMIITwmFzOCQT4mAdD+gEFufNnG4IJE=;
        b=ZSd/QbpLkn/LjM7Y2du9R/pLZypRLQpjjYyVcOS0+/oHAl7CvAy0/+UAWQPn7BL4bj
         E2HUCzUQIo2TIJ+bosFjR3mQgxKe9GEJAdilc0QEIv/p+HnNDN+wT/BjrwWhGNPIFXha
         q3n3OJcCIfARs/2DIW/iaCoVvQ0jSChSm7RC+IF5L4h9dB19N3x7fXYvT5VLH7pax8mk
         fbMVrgI/VzOlUaZEOArUfRo0Y+DwEHLvfQhUaUwSQmDw10tKrrVeHJ2BGvavpeNQYB+a
         ETZgnbtU1Wrj4kHJ0EHhTbcGWmWZF/yoKBNX62U3xrEXa4PDMeVmvDoFbM9pHCvsOHWk
         qCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=atNQu443wohaZMIITwmFzOCQT4mAdD+gEFufNnG4IJE=;
        b=gmLS6DwIOIYwyIe+Gv54Ypo/4nUfTmKn/LD5DY9JsLFUDkuZuFOJq9hNsFn32EXQpT
         y03HSToFHv6HP2VNcMBi3pp9+mWRvWcui/T82tzC2odkPxLiiLfQgtPey5tZExTuVwFS
         s6yx8OvS/POtnArKxZTGmvUuSt4xlvlsJj3FZu46Cr8ZAtNyIk2P8Gu5FWTTZqcoHX57
         JwdxqvN70MldelE0t5NBAlpuk9jCog5ph+0OSWs1ZBoRRh+Al34uT+hhgHWtJsOfcKnh
         PXfLKboNOcVfuvzbSW8KU6h2UGXHCIKcv6fSORiEHLvvyyinYDdprNCVf71bb8AjiFtO
         cDsA==
X-Gm-Message-State: AOAM533Cx0mpLB9uNh9AR3/mVd2smPnBl2crdTY3Z4Knqu3z58V2yLAX
        uX9BHAICmqQ9XXYVZFHFHizk8O8NNOuIHXPcZBJCGUDrkppgrg==
X-Google-Smtp-Source: ABdhPJy3zKtooXkqbJLFceevNpH4Mj2uLh3ybXnb6/QzswnK4s67ONxNoQ25ri4wXoVAjymqjj82QIJaCffrAFaaKtc=
X-Received: by 2002:a25:7608:: with SMTP id r8mr30831434ybc.518.1599492215825;
 Mon, 07 Sep 2020 08:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825162718.5838-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXkGBfwNOwd5-=U3wg6U0O+3BErbXuybbuytgzsCmZqRQ@mail.gmail.com>
 <CA+V-a8uT8d8P8REuXcW9qtCxM84DH+Q4LXZnVTYhT--kswKF=g@mail.gmail.com> <CAMuHMdW+JBd2iu4BsQHdEV=4dt7mh_14TyHLMQcywAJVPFZZCg@mail.gmail.com>
In-Reply-To: <CAMuHMdW+JBd2iu4BsQHdEV=4dt7mh_14TyHLMQcywAJVPFZZCg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 7 Sep 2020 16:23:09 +0100
Message-ID: <CA+V-a8so3b7A-KdVN5DZEEwUwPckut_v0DDnw6r_ci=wL9owUw@mail.gmail.com>
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

On Mon, Sep 7, 2020 at 8:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Sep 4, 2020 at 7:15 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Thu, Sep 3, 2020 at 1:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Aug 25, 2020 at 6:28 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > Add support for LED trigger on SD2 interface.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> > >
> > > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > > > @@ -63,6 +63,16 @@
> > > >                 enable-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
> > > >         };
> > > >
> > > > +       leds {
> > > > +               compatible = "gpio-leds";
> > > > +
> > > > +               sdhi2_led {
> > > > +                       label = "sdio-led";
> > > > +                       gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
> > >
> > > GPIO_ACTIVE_HIGH?
> > >
> > > The LED is driven by an NPN transistor, with the LED between 3.3V and
> > > the transistor's collector.
>
> Oops, 3.3V is not VCC_3V3, but SD_3V3, so it is not always-on, but
> controlled by SDIO_PWR.
>
> > I did try with GPIO_ACTIVE_HIGH and it didn't work as expected. To
> > make sure I can control the LED through sysfs I deleted the node from
> > DTS and exported the pin GP5_22 (858) and writing the value "out"
> > direction and setting the values 0/1 to value did not toggle the SDIO
> > LED as expected and it stayed OFF all the time.
>
> Hence when SDIO_PWR is turned off, you cannot control the LED just by
> toggling GP5_22.
>
> > Looks like there is some information missing in the schematics.
> >
> > I did some experiments. I completely removed the SDHI, LED and
> > regulator  nodes and  booted the system and exported GP1_27 (989) and
> > wrote values 0/1  and this toggled the SDIO_LED.
> >
> > U-boot sets the below, so in u-boot the SDIO_LED is ON:
> >     gpio_direction_output(GPIO_GP_1_27, 0); /* power on */
> >     gpio_set_value(GPIO_GP_1_27, 0);
> >     gpio_direction_output(GPIO_GP_5_22, 0); /* LED  */
> >     gpio_set_value(GPIO_GP_5_22, 1);
> >     gpio_direction_output(GPIO_GP_1_8, 0); /* 1: 3.3V, 0: 1.8V*/
> >     gpio_set_value(GPIO_GP_1_8, 1);
> >
> > So in comparison we would need a hog node as below (and with this the
> > LED triggers correctly as expected),
> >
> > &gpio5 {
> >     sdio-led-gpio {
> >         gpio-hog;
> >         gpios = <22 GPIO_ACTIVE_HIGH>;
> >         output-high;
> >         line-name = "sdio-led-gpio";
> >     };
> > };
> >
> > Let me know if you are OK with the above.
>
> The above means the LED is always lit when SDIO_PWR is enabled.
> While I agree that's some kind of SD activity indicator, probably it's less
> fine-grained than using the mmc1 trigger?
> I assume the mmc1 trigger is only activated when SDIO_PWR is enabled.
> Are you sure this doesn't work?
> Perhaps your kernel was missing SD trigger support, or "mmc1" is the
> wrong SD instance?
>
> > Looks like the SDIO_PWR is tied up with an SDIO_LED pin and the
> > information is missing from schematics.
>
> No, I think we just misread the schematics.
>
My bad I misinterpreted the trigger, with GP5_22 being GPIO_ACTIVE_LOW
the LED remained ON when the card was inserted and turned OFF when the
card was pulled out.

When GP5_22 being GPIO_ACTIVE_HIGH the LED blinked and stayed OFF when
the card was inserted and remained OFF when the card was pulled out.
As a result I misinterpreted it.

I can confirm when GP5_22 is GPIO_ACTIVE_HIGH and there is any
activity on SD (read/write) the led turns ON.

Cheers,
Prabhakar
