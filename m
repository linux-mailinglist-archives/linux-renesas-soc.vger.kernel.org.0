Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B035240031
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Aug 2020 23:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgHIVgU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Aug 2020 17:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgHIVgT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Aug 2020 17:36:19 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5DBC061756;
        Sun,  9 Aug 2020 14:36:19 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id e14so4143279ybf.4;
        Sun, 09 Aug 2020 14:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gSgeMeM92UZgCX6qDhSZFFvtX43xfRefeT6Hws5M7oI=;
        b=XQCqbz9WfysmOgYmCKuxLbxrP7Oa3PJYKZHPk4tTYoiNcL6xw3dGbGxCtbPlj5sCZ3
         NFcIpOV5Ze7UObTmt5FVJTH0AhOCwM0emH5wiXY947E3W9g7etNrbsm3JqYjyRQUQYcr
         +6Mwt0Ez7KVSGmXOhT9B7+rVZpdrsQAdpowPb/EluQ4QAEHvZG8kVSqoaG0/sQ5TQ8or
         ftH4q5JatOohq5T9K4aWna8sTu6pACBDAB9ywTZU3L/EYKEoFLnwgf7FlKeLQxx+BIFo
         ekjSz6bPDrmSgPahYgHLkyOs10pqGvFHCg8dSLYTOycxaiwbghhVcUq3oFaktg26Fdh3
         mHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gSgeMeM92UZgCX6qDhSZFFvtX43xfRefeT6Hws5M7oI=;
        b=k32STlGqGE4IbK284OKZ2Tw8scOUfQGJJ5WVfYxqbGUPdF3TpO4fUOX/5F5VxKWGIa
         TrkjqOUW6FLPMue9GaU787I5tJko7V8p8Hb1epdPDuJzVlqPCAA2Xtf/A8XtmtXG9vig
         W3dUXjJgJ2kusARYURlZaFhQPeJ57kUhoYXLSG8HH3FzWtI0j9VrQ862rdG1mYdp+9re
         dfwcA4Zl6I0PleYR11qPlttMlerDMpSNtvkK3A3rOZkghFtsPkdzVJHSQKmaX1nUma9+
         lM3i/nmUvSd6P9OCUBmr/i3k5ntpgTZBUEoOjUhKlCCHz5fq7hEPwpeaoL2ooNegsGwC
         PglA==
X-Gm-Message-State: AOAM533LdTRJ3qUsf1mvRjugdrwtMddVKoYcP92arG+uOmJWMkb0CXyo
        5zLm7fNDLpxDTiLviFDBI1mf2CRYX8NySHqObvU=
X-Google-Smtp-Source: ABdhPJxoVO1r86GGnFCKO+vhg2M3UxMaaechdbpAQp++qmRpPuBLos7WAHroyuf2blk9J3m4QQTX3cr9vMgKYKekOJ8=
X-Received: by 2002:a25:3355:: with SMTP id z82mr36932104ybz.445.1597008978611;
 Sun, 09 Aug 2020 14:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200808212259.GT6186@pendragon.ideasonboard.com>
In-Reply-To: <20200808212259.GT6186@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 9 Aug 2020 22:35:52 +0100
Message-ID: <CA+V-a8uQg3Jjdwe7PQM=v3Hs+Hm9yKGbQ0G0v5B17QAqjNy6MA@mail.gmail.com>
Subject: Re: [PATCH 7/7] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thank you for the review.


On Sat, Aug 8, 2020 at 10:23 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Aug 07, 2020 at 06:49:54PM +0100, Lad Prabhakar wrote:
> > The iwg21d comes with a 7" capacitive touch screen, therefore
> > add support for it.
>
> I can't review most of this properly as I don't have access to the
> schematics. Is there a way to get it ?
>
I'll check with Chris, how we could get the schematics for you.

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 84 +++++++++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > index b3461a61a4bf..cf59fd61e422 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > @@ -30,6 +30,7 @@
> >
> >  /dts-v1/;
> >  #include "r8a7742-iwg21m.dtsi"
> > +#include <dt-bindings/pwm/pwm.h>
> >
> >  / {
> >       model = "iWave Systems RainboW-G21D-Qseven board based on RZ/G1H";
> > @@ -52,6 +53,50 @@
> >               clock-frequency = <26000000>;
> >       };
> >
> > +     lcd_backlight: backlight {
> > +             compatible = "pwm-backlight";
> > +             pwms = <&tpu 2 5000000 0>;
> > +             brightness-levels = <0 4 8 16 32 64 128 255>;
> > +             pinctrl-0 = <&backlight_pins>;
> > +             pinctrl-names = "default";
> > +             default-brightness-level = <7>;
> > +             enable-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
> > +     };
> > +
> > +     lvds-receiver {
> > +             compatible = "ti,ds90cf384a", "lvds-decoder";
> > +             powerdown-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;
> > +
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     port@0 {
> > +                             reg = <0>;
> > +                             lvds_receiver_in: endpoint {
> > +                                     remote-endpoint = <&lvds0_out>;
> > +                             };
> > +                     };
> > +                     port@1 {
> > +                             reg = <1>;
> > +                             lvds_receiver_out: endpoint {
> > +                                     remote-endpoint = <&panel_in>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     panel {
> > +             compatible = "edt,etm0700g0dh6";
> > +             backlight = <&lcd_backlight>;
> > +
> > +             port {
> > +                     panel_in: endpoint {
> > +                             remote-endpoint = <&lvds_receiver_out>;
> > +                     };
> > +             };
> > +     };
> > +
> >       reg_1p5v: 1p5v {
> >               compatible = "regulator-fixed";
> >               regulator-name = "1P5V";
> > @@ -129,12 +174,31 @@
> >               VDDIO-supply = <&reg_3p3v>;
> >               VDDD-supply = <&reg_1p5v>;
> >       };
> > +
> > +     touch: touchpanel@38 {
> > +             compatible = "edt,edt-ft5406";
> > +             reg = <0x38>;
> > +             interrupt-parent = <&gpio0>;
> > +             interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
> > +     };
> >  };
> >
> >  &cmt0 {
> >       status = "okay";
> >  };
> >
> > +&du {
> > +     status = "okay";
> > +};
> > +
> > +&gpio0 {
> > +     touch-interrupt {
> > +             gpio-hog;
> > +             gpios = <24 GPIO_ACTIVE_LOW>;
> > +             input;
>
> Is this required, won't requesting the interrupt be enough to configure
> the pin properly ?
>
Agreed.

Cheers,
Prabhakar

> > +     };
> > +};
> > +
> >  &hsusb {
> >       pinctrl-0 = <&usb0_pins>;
> >       pinctrl-names = "default";
> > @@ -165,6 +229,11 @@
> >               function = "avb";
> >       };
> >
> > +     backlight_pins: backlight {
> > +             groups = "tpu0_to2";
> > +             function = "tpu0";
> > +     };
> > +
> >       i2c2_pins: i2c2 {
> >               groups = "i2c2_b";
> >               function = "i2c2";
> > @@ -208,6 +277,17 @@
> >       };
> >  };
> >
> > +&lvds0 {
> > +     status = "okay";
> > +     ports {
> > +             port@1 {
> > +                     lvds0_out: endpoint {
> > +                             remote-endpoint = <&lvds_receiver_in>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> >  &rcar_sound {
> >       pinctrl-0 = <&sound_pins>;
> >       pinctrl-names = "default";
> > @@ -261,6 +341,10 @@
> >       shared-pin;
> >  };
> >
> > +&tpu {
> > +     status = "okay";
> > +};
> > +
> >  &usbphy {
> >       status = "okay";
> >  };
>
> --
> Regards,
>
> Laurent Pinchart
