Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B81942F0B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Oct 2021 14:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbhJOM1S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Oct 2021 08:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbhJOM1R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 08:27:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3994BC061570
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Oct 2021 05:25:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D306C2E3;
        Fri, 15 Oct 2021 14:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634300707;
        bh=U/dzodaqINJD6I5Q7B0ekaBvNIWHSSLqZJqA/JZMN2w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=W1aB/osx+XbyeYnxcv+qNyL8OGEHr/slHlleCFhJuwqoSyFHMyq1QXycUx4EDoNpB
         NDicy9ealRaRZdWkL+WyAq948YoIufih44a6fjZGVanhZWTI67MiIqUSxus1KSJ0qh
         OiuKAeoK1i+Sd4+2XVWRRx48vWfo7Yuus0LdyWl0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <163430024769.4171071.7250599031921542063@Monstersaurus>
References: <300149c730931914b77e17df6bcce89b67c3005f.1634222546.git.geert+renesas@glider.be> <163430024769.4171071.7250599031921542063@Monstersaurus>
Subject: Re: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add missing camera regulators
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>
Date:   Fri, 15 Oct 2021 13:25:05 +0100
Message-ID: <163430070537.11213.4575574202675979669@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Kieran Bingham (2021-10-15 13:17:27)
> Quoting Geert Uytterhoeven (2021-10-14 15:44:12)
> > make dtbs_check:
> >=20
> >     arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dt.yaml: ov5640@3c: 'AV=
DD-supply' is a required property
> >             From schema: Documentation/devicetree/bindings/media/i2c/ov=
ti,ov5640.yaml
> >     arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dt.yaml: ov5640@3c: 'DV=
DD-supply' is a required property
> >             From schema: Documentation/devicetree/bindings/media/i2c/ov=
ti,ov5640.yaml
> >     arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dt.yaml: ov5640@3c: 'DO=
VDD-supply' is a required property
> >             From schema: Documentation/devicetree/bindings/media/i2c/ov=
ti,ov5640.yaml
> >=20
> > Fix this by describing the missing regulators.
> >=20
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > [PATCH v2 27/52] dt-bindings: media: Convert OV5640 binding to a schema
> > https://lore.kernel.org/all/20210901091852.479202-28-maxime@cerno.tech/
>=20
> Given that the OV5640 datasheet explicitly states=20
>=20
>  "
>  If 2.8V is used for I/O power, due to a high voltage drop at the
>  internal DVDD regulator, there is a potential heat issue. Hence, for a
>  2.8V power system, OmniVision recommends using an external DVDD source.
>  Due to the higher power down current when using an external DVDD
>  source, OmniVision strongly recommends cutting off all powers,
>  including the external DVDD, when the sensor is not in use in the case
>  of 2.8V I/O and external DVDD.
>  "
>=20
> I was expecting these not to be fixed regulators. But having checked in
> with you, I hear you've followed the schematics so that is what we have
> to live with ;-)
>=20
>=20
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> > ---
> >  arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts  | 16 ++++++++++++++++
> >  .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi    |  3 +++
> >  2 files changed, 19 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm=
/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > index 7e7b1028108dd133..75258f480a99a57c 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > @@ -44,6 +44,22 @@ mclk_cam4: mclk-cam4 {
> >                 #clock-cells =3D <0>;
> >                 clock-frequency =3D <26000000>;
> >         };
> > +
> > +       reg_1p8v: 1p8v {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "1P8V";
> > +               regulator-min-microvolt =3D <1800000>;
> > +               regulator-max-microvolt =3D <1800000>;
> > +               regulator-always-on;
> > +       };
> > +
> > +       reg_2p8v: 2p8v {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "2P8V";
> > +               regulator-min-microvolt =3D <2800000>;
> > +               regulator-max-microvolt =3D <2800000>;
> > +               regulator-always-on;
> > +       };
> >  };
> > =20
> >  &avb {
> > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dts=
i b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > index 70c72ba4fe724a70..40cef0b1d1e6267f 100644
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> > @@ -17,6 +17,9 @@ ov5640@3c {
> >                 reg =3D <0x3c>;
> >                 clocks =3D <&MCLK_CAM>;
> >                 clock-names =3D "xclk";
> > +               AVDD-supply =3D <&reg_2p8v>;
> > +               DOVDD-supply =3D <&reg_2p8v>;
> > +               DVDD-supply =3D <&reg_1p8v>;

I see in the bindings however that this DVDD is specified as 1.5v.
I assume 1.8 is how the hardware is wired, and is within a tolerence
range?

The OV5640 datasheet does show=20
 - VDD-A: Analog: 2.8v (AVDD)
 - VDD-DA: Digital Core: 1.5v (DVDD)
 - VDD-IO: Digital IO: 1.8v (DOVDD)

(Brackets my interpretations)

Should DVDD be 1.5v?

--
Kieran


> >                 status =3D "okay";
> > =20
> >                 port {
> > --=20
> > 2.25.1
> >
