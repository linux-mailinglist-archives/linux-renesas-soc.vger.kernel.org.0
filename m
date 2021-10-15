Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB66142F47C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Oct 2021 15:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236614AbhJON6j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Oct 2021 09:58:39 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:38494 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236490AbhJON6i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 09:58:38 -0400
Received: by mail-ua1-f50.google.com with SMTP id h19so18147944uax.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Oct 2021 06:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bTTqVZ2tPPXWPEijyhZacayflMGLoamWWhQSL1X+Q+w=;
        b=vIV5Wi+7plfhEsqgJGw+iaeF8R1+Rfh6TVs+ShJLnoZN7xV9kw4Vy3doCOviqPvM7F
         l/VVA1D0pqUst6drsGcI/nCJDMH4f6hZLCXPyImsHb3jmxRIoVsuSi/c10BscJ/MQED+
         Ec4CKACp65c0EiR1rZ3KVYoJy95DdrXBX1JyDg+lQAJgRbmPaUqDVMGDwF7RvQcNFpWe
         021QVWdVbiOcE+U0VBrCeU5euDbTYrXB/qgC0H6lWw01X6WL1Cj7zw6SsG8lH3//grat
         r6XG4KGNT+bydgkcaDBnjWV9A4huMyZ+a2efBjroFQ+HlOFf1ii5nTAgwtPMlYz1+Wnh
         K3LQ==
X-Gm-Message-State: AOAM532cqGa8VTjfkzQzG1NkuvN/L87rbru8aGRHYUhrLIhIMzw9m6Wy
        Qtg8EEWAdXw8DuW6S5b/9LymAcOhXRurIQ==
X-Google-Smtp-Source: ABdhPJxSz1XYsHNAcWAbFHbVdjIJdp8gpQDVby0gqYGRqll9UXNUo2vYlltv+V5hyYG6X0LvgA/Q+g==
X-Received: by 2002:a05:6102:5114:: with SMTP id bm20mr4923728vsb.15.1634306191313;
        Fri, 15 Oct 2021 06:56:31 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 36sm3602992uak.12.2021.10.15.06.56.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 06:56:31 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id e2so18138786uax.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Oct 2021 06:56:30 -0700 (PDT)
X-Received: by 2002:ab0:538a:: with SMTP id k10mr13239708uaa.14.1634306190734;
 Fri, 15 Oct 2021 06:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <300149c730931914b77e17df6bcce89b67c3005f.1634222546.git.geert+renesas@glider.be>
 <163430024769.4171071.7250599031921542063@Monstersaurus> <163430070537.11213.4575574202675979669@Monstersaurus>
In-Reply-To: <163430070537.11213.4575574202675979669@Monstersaurus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Oct 2021 15:56:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6KgM8f2UziXoq3djQgCd+C_LwPg+AWCU7+OqCCTnZMg@mail.gmail.com>
Message-ID: <CAMuHMdX6KgM8f2UziXoq3djQgCd+C_LwPg+AWCU7+OqCCTnZMg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add missing camera regulators
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Fri, Oct 15, 2021 at 2:25 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Quoting Kieran Bingham (2021-10-15 13:17:27)
> > Quoting Geert Uytterhoeven (2021-10-14 15:44:12)
> > > make dtbs_check:
> > >
> > >     arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dt.yaml: ov5640@3c: 'AVDD-supply' is a required property
> > >             From schema: Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> > >     arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dt.yaml: ov5640@3c: 'DVDD-supply' is a required property
> > >             From schema: Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> > >     arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dt.yaml: ov5640@3c: 'DOVDD-supply' is a required property
> > >             From schema: Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
> > >
> > > Fix this by describing the missing regulators.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > [PATCH v2 27/52] dt-bindings: media: Convert OV5640 binding to a schema
> > > https://lore.kernel.org/all/20210901091852.479202-28-maxime@cerno.tech/
> >
> > Given that the OV5640 datasheet explicitly states
> >
> >  "
> >  If 2.8V is used for I/O power, due to a high voltage drop at the
> >  internal DVDD regulator, there is a potential heat issue. Hence, for a
> >  2.8V power system, OmniVision recommends using an external DVDD source.
> >  Due to the higher power down current when using an external DVDD
> >  source, OmniVision strongly recommends cutting off all powers,
> >  including the external DVDD, when the sensor is not in use in the case
> >  of 2.8V I/O and external DVDD.
> >  "
> >
> > I was expecting these not to be fixed regulators. But having checked in
> > with you, I hear you've followed the schematics so that is what we have
> > to live with ;-)
> >
> >
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

> > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > @@ -44,6 +44,22 @@ mclk_cam4: mclk-cam4 {
> > >                 #clock-cells = <0>;
> > >                 clock-frequency = <26000000>;
> > >         };
> > > +
> > > +       reg_1p8v: 1p8v {
> > > +               compatible = "regulator-fixed";
> > > +               regulator-name = "1P8V";
> > > +               regulator-min-microvolt = <1800000>;
> > > +               regulator-max-microvolt = <1800000>;
> > > +               regulator-always-on;
> > > +       };
> > > +
> > > +       reg_2p8v: 2p8v {
> > > +               compatible = "regulator-fixed";
> > > +               regulator-name = "2P8V";
> > > +               regulator-min-microvolt = <2800000>;
> > > +               regulator-max-microvolt = <2800000>;
> > > +               regulator-always-on;
> > > +       };
> > >  };
> > >
> > >  &avb {
> > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > index 70c72ba4fe724a70..40cef0b1d1e6267f 100644
> > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > > @@ -17,6 +17,9 @@ ov5640@3c {
> > >                 reg = <0x3c>;
> > >                 clocks = <&MCLK_CAM>;
> > >                 clock-names = "xclk";
> > > +               AVDD-supply = <&reg_2p8v>;
> > > +               DOVDD-supply = <&reg_2p8v>;
> > > +               DVDD-supply = <&reg_1p8v>;
>
> I see in the bindings however that this DVDD is specified as 1.5v.
> I assume 1.8 is how the hardware is wired, and is within a tolerence
> range?
>
> The OV5640 datasheet does show
>  - VDD-A: Analog: 2.8v (AVDD)
>  - VDD-DA: Digital Core: 1.5v (DVDD)
>  - VDD-IO: Digital IO: 1.8v (DOVDD)
>
> (Brackets my interpretations)

That matches the part "digital inputs (typical conditions: AVDD =
2.8V, DVDD = 1.5V, DOVDD = 1.8V)" in Table 8-3 of the datasheet.

> Should DVDD be 1.5v?

I have used what's in the schematics I have.  Which matches the
part "internal DVDD short to DVDD, DVP output, AVDD = 2.8V, DOVDD =
2.8V" with footnote "using the internal DVDD regulator is strongly
recommended for minimum power down current" in Table 8-3, I guess.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
