Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4BB7263375
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 19:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730627AbgIIREF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 13:04:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:57776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730922AbgIIRD7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 13:03:59 -0400
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D796521D40;
        Wed,  9 Sep 2020 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599671038;
        bh=JIDA/cRRI0indPE0r3wuMYo5P+C7fvkBFrVCEVChMe8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=f/YvIKLyyfTdH/P3B2nWwFzJumK0wc+x6JNV89QvHGG8y/xDDKSDI1Etlu41wgLxo
         NlvhFMD/3dP5vO4h46JxzR9HlQFdx2T8SUN1EC805YxOrLNbwOQWDpAvxbjTPPxsnM
         ic2Ei+gt3fV89IQHKswAiynRQRYXnksS9kzatd3I=
Received: by mail-oi1-f177.google.com with SMTP id d189so3031871oig.12;
        Wed, 09 Sep 2020 10:03:57 -0700 (PDT)
X-Gm-Message-State: AOAM53308i3xpmUz1hp6GYkMjYRWRNf6QrDxLAO9vHP/O7Cy2z249V7Q
        VycTC+jtlFWToYlN527i8tXPYtds5plnam9iLA==
X-Google-Smtp-Source: ABdhPJwMDEAWsz0YP+IUUIAwNVr87N71/p34095Drcq1C+VinwmF5SZiMbHS+Zs30a9A/NvW6uK0PeVBiWDbc8U3iGg=
X-Received: by 2002:aca:1711:: with SMTP id j17mr1278976oii.152.1599671037167;
 Wed, 09 Sep 2020 10:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200824141053.5062-1-biju.das.jz@bp.renesas.com>
 <20200824141053.5062-2-biju.das.jz@bp.renesas.com> <20200908223651.GA1042906@bogus>
 <TYBPR01MB5309786FAFF729AB8998B5D786260@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5309786FAFF729AB8998B5D786260@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 9 Sep 2020 11:03:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+TKjfHh=4a-NFUaYzjedVonP69ourL5YzZuxPLEY6T-Q@mail.gmail.com>
Message-ID: <CAL_Jsq+TKjfHh=4a-NFUaYzjedVonP69ourL5YzZuxPLEY6T-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: usb: convert ti,hd3ss3220 bindings to json-schema
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 9, 2020 at 2:21 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Rob,
>
> Thanks for the feedback.
>
> > Subject: Re: [PATCH v3 1/5] dt-bindings: usb: convert ti,hd3ss3220 bindings to
> > json-schema
> >
> > On Mon, Aug 24, 2020 at 03:10:49PM +0100, Biju Das wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Convert ti,hd3ss3220.txt to YAML. Updated the binding documentation as
> > > graph bindings of this device model Super Speed (SS) data bus to the
> > > Super Speed (SS) capable connector.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v2->v3: Replaced Tabs with spaces in the example section.
> > > v1->v2 : No change
> > > Ref: https://patchwork.kernel.org/patch/11669423/
> > > ---
> > >  .../devicetree/bindings/usb/ti,hd3ss3220.txt  | 38 ---------
> > > .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 81
> > +++++++++++++++++++
> > >  2 files changed, 81 insertions(+), 38 deletions(-)  delete mode
> > > 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> > >  create mode 100644
> > > Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> > > b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> > > deleted file mode 100644
> > > index 2bd21b22ce95..000000000000
> > > --- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> > > +++ /dev/null
> > > @@ -1,38 +0,0 @@
> > > -TI HD3SS3220 TypeC DRP Port Controller.
> > > -
> > > -Required properties:
> > > - - compatible: Must be "ti,hd3ss3220".
> > > - - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> > > - - interrupts: An interrupt specifier.
> > > -
> > > -Required sub-node:
> > > - - connector: The "usb-c-connector" attached to the hd3ss3220 chip. The
> > > -   bindings of the connector node are specified in:
> > > -
> > > -Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > -
> > > -Example:
> > > -hd3ss3220@47 {
> > > -compatible = "ti,hd3ss3220";
> > > -reg = <0x47>;
> > > -interrupt-parent = <&gpio6>;
> > > -interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> > > -
> > > -connector {
> > > -compatible = "usb-c-connector";
> > > -label = "USB-C";
> > > -data-role = "dual";
> > > -
> > > -ports {
> > > -#address-cells = <1>;
> > > -#size-cells = <0>;
> > > -
> > > -port@1 {
> > > -reg = <1>;
> > > -hd3ss3220_ep: endpoint {
> > > -remote-endpoint =
> > <&usb3_role_switch>;
> > > -};
> > > -};
> > > -};
> > > -};
> > > -};
> > > diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> > > b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> > > new file mode 100644
> > > index 000000000000..750a099529c0
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> > > @@ -0,0 +1,81 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/usb/ti,hd3ss3220.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: TI HD3SS3220 TypeC DRP Port Controller
> > > +
> > > +maintainers:
> > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > +
> > > +description: |-
> > > +  HD3SS3220 is a USB SuperSpeed (SS) 2:1 mux with DRP port
> > > +controller. The device provides Channel
> > > +  Configuration (CC) logic and 5V VCONN sourcing for ecosystems
> > > +implementing USB Type-C. The
> > > +  HD3SS3220 can be configured as a Downstream Facing Port (DFP),
> > > +Upstream Facing Port (UFP) or a
> > > +  Dual Role Port (DRP) making it ideal for any application.
> > > +
> > > +properties:
> > > +  compatible:
> > > +   const: ti,hd3ss3220
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    description: OF graph bindings (specified in bindings/graph.txt) that
> > model
> > > +      SS data bus to the SS capable connector.
> > > +    type: object
> > > +    properties:
> > > +      port@0:
> > > +        type: object
> > > +        description: Super Speed (SS) capable connector.
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: Super Speed (SS) data bus.
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    i2c0 {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        hd3ss3220@47 {
> > > +                compatible = "ti,hd3ss3220";
> > > +                reg = <0x47>;
> > > +                interrupt-parent = <&gpio6>;
> > > +                interrupts = <3>;
> > > +
> > > +                ports {
> > > +                        #address-cells = <1>;
> > > +                        #size-cells = <0>;
> > > +                        port@0 {
> > > +                                reg = <0>;
> > > +                                hd3ss3220_in_ep: endpoint {
> > > +                                        remote-endpoint = <&ss_ep>;
> > > +                                };
> > > +                        };
> > > +                        port@1 {
> > > +                                reg = <1>;
> > > +                                hd3ss3220_out_ep: endpoint {
> > > +                                        remote-endpoint = <&usb3_role_switch>;
> > > +                                };
> >
> > If you have 2 inputs muxed, then there would be 2 endpoints here? Please
> > show the fullest or most complicated case for the example. The port@1
> > description could be a bit better.
>
> As per [1] "HD3SS3220 has integrated USB 3.0/3.1 SS/SS+ MUX with 2 channel 2:1 switching required to handle cable flips".
> The four Superspeed differential pairs (two Tx and two Rx pairs) pairs from the USB-C receptacle is connected to this device
> and the output of the Mux is connected to the  SoC .

Ah, I was thinking this was muxing 2 functions (such as DP) rather
than cable flip handling. I guess the example doesn't need anything
else, but the description does. In the case of directly connected to
the SoC, how are cable flips handled? The SoC phy handles it?

There's some issues in the connector binding with how the SS signals
are handled that needs to be solved. This all needs to be addressed
looking at various possible h/w designs.

Rob
