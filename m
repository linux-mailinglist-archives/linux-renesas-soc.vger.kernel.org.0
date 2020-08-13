Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1B4243A5A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 14:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgHMMzE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Aug 2020 08:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgHMMzC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 08:55:02 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E34C061757;
        Thu, 13 Aug 2020 05:55:02 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id x2so3225762ybf.12;
        Thu, 13 Aug 2020 05:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=75NAxvaDs5TZCdspioaGSmnreFOKWfDZk5QjErLtQWo=;
        b=CDjvd4jRQ4l4RbEGS7kLoVz83KH2o2s7f6rdC0YEkG0f8Va0KUGU5njmNmvWD0j9O2
         RfANcDqb2X+yWziaXZEzlqOWhHgeTL5f/SXl5lb/HJJBolKmL8PtCbAybApFYU+4oNy+
         lnxF35PhN+5FMSGJj7yvZ7+IaMhqk+Zr8Er4UrJAtC1B6RMdi44Rt0whIC9p5hiRDI5t
         RfaFR/cw7Y4b7tmBtWDoizH2xMs4738luDMcpqysPS53DKQksGYxvXrMEIOO6EKOPvsf
         ii3XQiL+ZlfdLla0STQiINsAwKKJAMkoTsBMKTHQiS4jiBtGJI7vp72c0zujwo8S7HEC
         Lxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=75NAxvaDs5TZCdspioaGSmnreFOKWfDZk5QjErLtQWo=;
        b=pQ3fxRiFz/MNTGAP4wzAT1dLR12EBDDoDzr1Xn13iatBmTT7Kc8N0iXbdQ/5pmxIWA
         Q232MDbEPhWLndhwp3Hx1NVilBSzpsCgTIl2wZPP0Qut35qY1MEyCb3M3a6ilNA+jAlV
         sqbZ4XmpNurUON0t39OBzOpBd87/16GTZqY+DCDu5LO73A5g8crgZGmD1NGhGF8toKs6
         kEyQ0fyheNpnNPXBk8tzoZRM90YfI0AuOVjkgrjqP/h24oyVNN16ZDUocKjo6q2At/bo
         3LTy6Q9PWyplTaAqYtAlhjK4SF11KBMxF/ieQ2huj7f9uEIyanJxf3ohYcd4XRJYnB6k
         XrEA==
X-Gm-Message-State: AOAM530oeceWO/0FA1vHeHY5fZT1xeIRTZfQ0XqClBt1UA6KJCTBnyRg
        jLEx+BcX2PYRwPsTVoY2RBC82UVl36ZPrKgpisjf2krQ
X-Google-Smtp-Source: ABdhPJyorRbchJgGCyTLDbB3eJQXWKepkgtINQSgf1E6LPJzQ0rtraBZ92Kn14p9F4+c7jW6VIEg4dj5p7BbrEEtpHs=
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr6436845ybc.76.1597323301408;
 Thu, 13 Aug 2020 05:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200811112638.GF6054@pendragon.ideasonboard.com>
In-Reply-To: <20200811112638.GF6054@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 13 Aug 2020 13:54:35 +0100
Message-ID: <CA+V-a8sVA9r3_yrM6z7EX-XGp1d6Wy-6LjWsO7Td93C-236jvg@mail.gmail.com>
Subject: Re: [PATCH 7/7] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
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

On Tue, Aug 11, 2020 at 12:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Aug 07, 2020 at 06:49:54PM +0100, Lad Prabhakar wrote:
> > The iwg21d comes with a 7" capacitive touch screen, therefore
> > add support for it.
> >
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
>
> It's actually a power supply, not an enable GPIO, but it doesn't matter
> much, I don't think there's a need to declare a regulator just for the
> sake of it.
>
Agreed will leave it as is.

> > +     };
> > +
> > +     lvds-receiver {
> > +             compatible = "ti,ds90cf384a", "lvds-decoder";
> > +             powerdown-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;
>
> This should be handled as a shared power supply, as it's also needed for
> the touch screen. Biju has sent patches for the iwg20d that fixes a
> probe issue due to that problem, I think you can just copy the fix.
>
Done.

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
>
> Should the reset GPIO also be wired ? It seems to be shared with the
> audio codec though, which is annoying.
>
Done.

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
> > +     };
>
> Is this needed, or does requesting the interrupt in the touch screen
> driver configured the GPIO to an input automatically ?
>
Yes this is needed, the touch driver does not configure the pin as
GPIO input without this touch doesn't work.

Cheers,
Prabhakar
