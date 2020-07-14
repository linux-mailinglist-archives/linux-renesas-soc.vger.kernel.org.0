Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A440C21F341
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2020 15:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbgGNN5a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jul 2020 09:57:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:34928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728095AbgGNN53 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jul 2020 09:57:29 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 890E322512;
        Tue, 14 Jul 2020 13:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594735048;
        bh=anOkgRGBEMl/XKw2buzvSOBQZ/OCdvpI2l0MBdv9laI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ttteglnPO8kwRXFeQtRwVICizqXHDJHt4IvI4Olwam2up4wa0m5vYWHRtK9hY67/n
         hmk9iXjDD9GxA/JQ84LgJgL+x2xGODNe0uMXcm7T0Zn/XZhJkIKRAIw8+yOA4y2bRr
         cvCtWaWII9Yvew6vnirELHNgPZQEACYfv5ds1fyI=
Received: by mail-ot1-f54.google.com with SMTP id t18so13081680otq.5;
        Tue, 14 Jul 2020 06:57:28 -0700 (PDT)
X-Gm-Message-State: AOAM531F90QcZlsGOcOiclKdEsrQ8F95WPFyRW++7eJYz+vy/PBmY2fi
        t+ZERfcJkvwGtsXI6n7qNdcqPK/qRFrnTKJXKA==
X-Google-Smtp-Source: ABdhPJyvJtNZ6AovmC6N3Uf290TAiRrNFPNQ2ge621fVPSlVbwTn0jNpHg5QrJVyxju7szdTK7/jWtfI/J/bQ3Gynjk=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr4257242ots.192.1594735047801;
 Tue, 14 Jul 2020 06:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200713111844.528313-1-niklas.soderlund+renesas@ragnatech.se>
 <20200713111844.528313-3-niklas.soderlund+renesas@ragnatech.se>
 <20200713154449.GA256154@bogus> <20200713181740.GO2866302@oden.dyn.berto.se>
In-Reply-To: <20200713181740.GO2866302@oden.dyn.berto.se>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 14 Jul 2020 07:57:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKJwMET3_VqrJi3KJJMbrNy-aR0yr26VFXYbgN_yPNfGw@mail.gmail.com>
Message-ID: <CAL_JsqKJwMET3_VqrJi3KJJMbrNy-aR0yr26VFXYbgN_yPNfGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: adv7604: Convert bindings to json-schema
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 13, 2020 at 12:17 PM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
>
> Hi Rob,
>
> Thanks for your feedback.
>
> On 2020-07-13 09:44:49 -0600, Rob Herring wrote:
> > On Mon, Jul 13, 2020 at 01:18:43PM +0200, Niklas S=C3=B6derlund wrote:
> > > Convert ADV7604 video decoder documentation to json-schema.
> > >
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> > > ---
> > >  .../devicetree/bindings/media/i2c/adv7604.txt |  87 ---------
> > >  .../bindings/media/i2c/adv7604.yaml           | 171 ++++++++++++++++=
++
> > >  2 files changed, 171 insertions(+), 87 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv76=
04.txt
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/adv76=
04.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt =
b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> > > deleted file mode 100644
> > > index 8c7cdc7cd7aaebc8..0000000000000000
> > > --- a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> > > +++ /dev/null
> > > @@ -1,87 +0,0 @@
> > > -* Analog Devices ADV7604/11/12 video decoder with HDMI receiver
> > > -
> > > -The ADV7604 and ADV7611/12 are multiformat video decoders with an in=
tegrated
> > > -HDMI receiver. The ADV7604 has four multiplexed HDMI inputs and one =
analog
> > > -input, and the ADV7611 has one HDMI input and no analog input. The 7=
612 is
> > > -similar to the 7611 but has 2 HDMI inputs.
> > > -
> > > -These device tree bindings support the ADV7611/12 only at the moment=
.
> > > -
> > > -Required Properties:
> > > -
> > > -  - compatible: Must contain one of the following
> > > -    - "adi,adv7611" for the ADV7611
> > > -    - "adi,adv7612" for the ADV7612
> > > -
> > > -  - reg: I2C slave addresses
> > > -    The ADV76xx has up to thirteen 256-byte maps that can be accesse=
d via the
> > > -    main I2C ports. Each map has it own I2C address and acts as a st=
andard
> > > -    slave device on the I2C bus. The main address is mandatory, othe=
rs are
> > > -    optional and revert to defaults if not specified.
> > > -
> > > -The device node must contain one 'port' child node per device input =
and output
> > > -port, in accordance with the video interface bindings defined in
> > > -Documentation/devicetree/bindings/media/video-interfaces.txt. The po=
rt nodes
> > > -are numbered as follows.
> > > -
> > > -  Port                     ADV7611    ADV7612
> > > -------------------------------------------------------------
> > > -  HDMI                     0             0, 1
> > > -  Digital output   1                2
> > > -
> > > -The digital output port node must contain at least one endpoint.
> > > -
> > > -Optional Properties:
> > > -
> > > -  - hpd-gpios: References to the GPIOs that control the HDMI hot-plu=
g
> > > -    detection pins, one per HDMI input. The active flag indicates th=
e GPIO
> > > -    level that enables hot-plug detection.
> > > -  - reset-gpios: Reference to the GPIO connected to the device's res=
et pin.
> > > -  - default-input: Select which input is selected after reset.
> > > -  - reg-names : Names of maps with programmable addresses.
> > > -           It can contain any map needing a non-default address.
> > > -           Possible maps names are :
> > > -             "main", "avlink", "cec", "infoframe", "esdp", "dpp", "a=
fe",
> > > -             "rep", "edid", "hdmi", "test", "cp", "vdp"
> > > -
> > > -Optional Endpoint Properties:
> > > -
> > > -  The following three properties are defined in video-interfaces.txt=
 and are
> > > -  valid for source endpoints only.
> > > -
> > > -  - hsync-active: Horizontal synchronization polarity. Defaults to a=
ctive low.
> > > -  - vsync-active: Vertical synchronization polarity. Defaults to act=
ive low.
> > > -  - pclk-sample: Pixel clock polarity. Defaults to output on the fal=
ling edge.
> > > -
> > > -  If none of hsync-active, vsync-active and pclk-sample is specified=
 the
> > > -  endpoint will use embedded BT.656 synchronization.
> > > -
> > > -Example:
> > > -
> > > -   hdmi_receiver@4c {
> > > -           compatible =3D "adi,adv7611";
> > > -           /*
> > > -            * The edid page will be accessible @ 0x66 on the I2C bus=
. All
> > > -            * other maps will retain their default addresses.
> > > -            */
> > > -           reg =3D <0x4c>, <0x66>;
> > > -           reg-names =3D "main", "edid";
> > > -
> > > -           reset-gpios =3D <&ioexp 0 GPIO_ACTIVE_LOW>;
> > > -           hpd-gpios =3D <&ioexp 2 GPIO_ACTIVE_HIGH>;
> > > -
> > > -           #address-cells =3D <1>;
> > > -           #size-cells =3D <0>;
> > > -
> > > -           default-input =3D <0>;
> > > -
> > > -           port@0 {
> > > -                   reg =3D <0>;
> > > -           };
> > > -           port@1 {
> > > -                   reg =3D <1>;
> > > -                   hdmi_in: endpoint {
> > > -                           remote-endpoint =3D <&ccdc_in>;
> > > -                   };
> > > -           };
> > > -   };
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml=
 b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> > > new file mode 100644
> > > index 0000000000000000..d354fd8e0cc88d93
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> > > @@ -0,0 +1,171 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/adv7604.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Analog Devices ADV7604/11/12 video decoder with HDMI receiver
> > > +
> > > +maintainers:
> > > +  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > +
> > > +description:
> > > +  The ADV7604 and ADV7611/12 are multiformat video decoders with an =
integrated
> > > +  HDMI receiver. The ADV7604 has four multiplexed HDMI inputs and on=
e analog
> > > +  input, and the ADV7611 has one HDMI input and no analog input. The=
 7612 is
> > > +  similar to the 7611 but has 2 HDMI inputs.
> > > +
> > > +  These device tree bindings support the ADV7611/12 only at the mome=
nt.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +        - adi,adv7611
> > > +        - adi,adv7612
> > > +
> > > +  reg:
> > > +    minItems: 1
> > > +    maxItems: 13
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> > > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, e=
did, hdmi, test, cp, vdp ]
> >
> > This can be simplified to:
> >
> > items:
> >   enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi=
, test, cp, vdp ]
>
> I tried this at first,
>
> properties:
>   reg-names:
>     items:
>       enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hd=
mi, test, cp, vdp ]
>
> But running the dt_binding_check on it fails with,
>
> $ make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devicetree/bindin=
gs/media/i2c/adv7604.yaml
>   CHKDT   Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> /mnt/build/linux/Documentation/devicetree/bindings/media/i2c/adv7604.yaml=
: properties:reg-names:items: {'enum': ['main', 'avlink', 'cec', 'infoframe=
', 'esdp', 'dpp', 'afe', 'rep', 'edid', 'hdmi', 'test', 'cp', 'vdp']} is no=
t of type 'array'
> make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentatio=
n/devicetree/bindings/media/i2c/adv7604.example.dts] Error 1
> make: *** [Makefile:1334: dt_binding_check] Error 2
>
> What am I missing? I'm using latest master of dt-schema [1] if it makes
> any difference.

If 'items' is not an array, you need 'minItems' and 'maxItems' since
there is no size.

> 1. 1330cddcba757bee ("schemas: Make additionalProperties/unevaluatedPrope=
rties explicit")
>
> >
> > (Make items a schema applying to all items, rather than a list)
> >
> > Though we may want to enforce 'main' is first with:
> >
> > minItems: 1
> > maxItems: 13
> > items:
> >   - const: main
> >
> > These 2 can be combined under an 'allOf'.
>
> I also had this idea by dropping main from the list of enums for all but
> the first one. But I can't find any argument for why main needs to go
> first, but I agree it feels like the right thing.

For DT we want the order defined as much as possible which is usually
required entries first, then optional entries. Unfortunately there's
no way in json-schema to express entries may be missing from a list.

Rob
