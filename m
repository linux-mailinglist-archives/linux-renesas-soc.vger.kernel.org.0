Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A352A2EC202
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Jan 2021 18:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbhAFRVs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Jan 2021 12:21:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:33456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbhAFRVs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jan 2021 12:21:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81F7A23132
        for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Jan 2021 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609953666;
        bh=cnw3GynrKyo3dlLPVXLO0TCrqrfIsT5WryEQsmZUU94=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XXxjrGabz5YpTV0ZiYykJlBmIOa7n4AJZ2oUo8yCIbZfiLMv6fuZWBKm4lchB5LpK
         JZeLWXh+DvnA6OdLcjexKNfFVcF73kng2IoDgN+MXdj81ljyndEi0tVu4s3GiyETEY
         Ue+waDT4AuiNH+77yNq2WXi4jiU6mj8xsqlzpKT5ZHsGRJxqx2uD+bzKYrb1vNEBIP
         uhc1o0X3xBP4k+2Hn8yo8HddY0iZg6tIc1h6a43EcGKwCIStK+bfwndV31ysUuHlvM
         VVITuiSbE46hokGsUEo7VXZcsxzOjsGju4YPXew3UzkHBoiHBfcIHFgs09dAHvJ8+5
         egrH7LYwjY+OA==
Received: by mail-ed1-f51.google.com with SMTP id i24so5060829edj.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Jan 2021 09:21:06 -0800 (PST)
X-Gm-Message-State: AOAM530p1KGtG0KBRE8hRHLCHtU9jYxWFrsFJzMYmGVGqHhekyKvvMQG
        l1hDSUqyz9lnjKj55bIo+YAku91fkPEeQtZYVw==
X-Google-Smtp-Source: ABdhPJyOLyyeFx8yoKOp4OtqzviFmaEqRT2VI1WPg68NkowbxnEB38zDK/jSoHfWUrHhFs+3QohMLCuYwuuRJz+ke5Y=
X-Received: by 2002:a05:6402:ca2:: with SMTP id cn2mr4623743edb.137.1609953665046;
 Wed, 06 Jan 2021 09:21:05 -0800 (PST)
MIME-Version: 1.0
References: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201220195005.26438-4-laurent.pinchart+renesas@ideasonboard.com>
 <810947ea1a18e06db1f36a4a8013fbca17e0ea89.camel@pengutronix.de>
 <X/P94CIrNtGkoZ4k@pendragon.ideasonboard.com> <dc0a8b0568c2b3f550a3069e4a34dd5e90079c8f.camel@pengutronix.de>
 <X/RShZkMICSW7Jnn@pendragon.ideasonboard.com> <aa406fa475100d30706025259527817c7f8d8b5b.camel@pengutronix.de>
 <X/XGfRCOWIBbJhek@pendragon.ideasonboard.com>
In-Reply-To: <X/XGfRCOWIBbJhek@pendragon.ideasonboard.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 6 Jan 2021 10:20:52 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKk5LyhNDRcSg86BF6pLYOO=iW-zSTo5BkaRFaDXytUAg@mail.gmail.com>
Message-ID: <CAL_JsqKk5LyhNDRcSg86BF6pLYOO=iW-zSTo5BkaRFaDXytUAg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: imx: hdmi: Convert binding
 to YAML
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sandy Huang <hjc@rock-chips.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 6, 2021 at 7:17 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Philipp,
>
> On Wed, Jan 06, 2021 at 03:10:32PM +0100, Philipp Zabel wrote:
> > On Tue, 2021-01-05 at 13:50 +0200, Laurent Pinchart wrote:
> > > On Tue, Jan 05, 2021 at 10:32:01AM +0100, Philipp Zabel wrote:
> > > > On Tue, 2021-01-05 at 07:49 +0200, Laurent Pinchart wrote:
> > > > > On Mon, Jan 04, 2021 at 04:30:36PM +0100, Philipp Zabel wrote:
> > > > > > On Sun, 2020-12-20 at 21:50 +0200, Laurent Pinchart wrote:
> > > > > > > Convert the i.MX6 HDMI TX text binding to YAML.
> > > > > > >
> > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > > > ---
> > > > > > > Changes since v1:
> > > > > > >
> > > > > > > - Only specify maxItems for clocks
> > > > > > > - Drop reg and interrupts as they're checked in the base schema
> > > > > > > - Rebase on top of OF graph schema, dropped redundant properties
> > > > > > > - Fix identation for enum entries
> > > > > > > - Drop clock-names items, use maxItems only
> > > > > > > ---
> > > > > > >  .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 130 ++++++++++++++++++
> > > > > > >  .../devicetree/bindings/display/imx/hdmi.txt  |  65 ---------
> > > > > > >  2 files changed, 130 insertions(+), 65 deletions(-)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> > > > > > >  delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..f9b131bb3339
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> > > > > > > @@ -0,0 +1,130 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/display/imx/fsl,imx6-hdmi.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: Freescale i.MX6 DWC HDMI TX Encoder
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > > > > > > +
> > > > > > > +description: |
> > > > > > > +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> > > > > > > +  with a companion PHY IP.
> > > > > > > +
> > > > > > > +allOf:
> > > > > > > +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    enum:
> > > > > > > +      - fsl,imx6dl-hdmi
> > > > > > > +      - fsl,imx6q-hdmi
> > > > > > > +
> > > > > > > +  reg-io-width:
> > > > > > > +    const: 1
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    maxItems: 2
> > > > > > > +
> > > > > > > +  clock-names:
> > > > > > > +    maxItems: 2
> > > > > > > +
> > > > > > > +  ddc-i2c-bus:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > > > +    description:
> > > > > > > +      The HDMI DDC bus can be connected to either a system I2C master or the
> > > > > > > +      functionally-reduced I2C master contained in the DWC HDMI. When connected
> > > > > > > +      to a system I2C master this property contains a phandle to that I2C
> > > > > > > +      master controller.
> > > > > > > +
> > > > > > > +  gpr:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > > > +    description:
> > > > > > > +      phandle to the iomuxc-gpr region containing the HDMI multiplexer control
> > > > > > > +      register.
> > > > > > > +
> > > > > > > +  ports:
> > > > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > > +    description: |
> > > > > > > +      This device has four video ports, corresponding to the four inputs of the
> > > > > > > +      HDMI multiplexer. Each port shall have a single endpoint.
> > > > > > > +
> > > > > > > +    properties:
> > > > > > > +      port@0:
> > > > > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > +        unevaluatedProperties: false
> > > > > > > +        description: First input of the HDMI multiplexer
> > > > > > > +
> > > > > > > +      port@1:
> > > > > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > +        unevaluatedProperties: false
> > > > > > > +        description: Second input of the HDMI multiplexer
> > > > > > > +
> > > > > > > +      port@2:
> > > > > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > +        unevaluatedProperties: false
> > > > > > > +        description: Third input of the HDMI multiplexer
> > > > > > > +
> > > > > > > +      port@3:
> > > > > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > > > > +        unevaluatedProperties: false
> > > > > > > +        description: Fourth input of the HDMI multiplexer
> > > > > > > +
> > > > > > > +    anyOf:
> > > > > > > +      - required:
> > > > > > > +          - port@0
> > > > > > > +      - required:
> > > > > > > +          - port@1
> > > > > > > +      - required:
> > > > > > > +          - port@2
> > > > > > > +      - required:
> > > > > > > +          - port@3
> > > > > > > +
> > > > > > > +required:
> > > > > > > +  - compatible
> > > > > > > +  - reg
> > > > > > > +  - clocks
> > > > > > > +  - clock-names
> > > > > > > +  - gpr
> > > > > > > +  - interrupts
> > > > > > > +  - ports
> > > >
> > > > The binding marks the "ports" container node as required.
> > > >
> > > > > > Won't this break validation of current i.MX6 DTs, which don't use the
> > > > > > ports node (in imx6q(dl).dtsi)?
> > > > >
> > > > > I may be missing something, but in imx6qdl.dtsi, we have
> > > >
> > > > [...]
> > > >
> > > > > and in imx6q.dtsi,
> > > > >
> > > > > &hdmi {
> > > > >         compatible = "fsl,imx6q-hdmi";
> > > > >
> > > > >         port@2 {
> > > > >                 reg = <2>;
> > > > >
> > > > >                 hdmi_mux_2: endpoint {
> > > > >                         remote-endpoint = <&ipu2_di0_hdmi>;
> > > > >                 };
> > > > >         };
> > > > >
> > > > >         port@3 {
> > > > >                 reg = <3>;
> > > > >
> > > > >                 hdmi_mux_3: endpoint {
> > > > >                         remote-endpoint = <&ipu2_di1_hdmi>;
> > > > >                 };
> > > > >         };
> > > > > };
> > > > >
> > > > > There are no other occurrences of "fsl,imx6q-hdmi" than in imx6q.dtsi
> > > > > (and no occurrences of "fsl,imx6qdl-hdmi" at all).
> > > >
> > > > The port@[0-3] nodes are currently direct children of the &hdmi node,
> > > > without the "ports" container node.
> > >
> > > Of course. Sorry, I've missed that that was the point.
> > >
> > > I can include a patch to update imx6q(dl).dtsi in the series. Would that
> > > work for you ?
> >
> > Yes, that would work, thank you. Is the goal to slowly phase out all
> > uses of multi-port bindings without the ports node?
>
> I'm not sure there's an explicit effort in that direction, but I think
> it would make sense as otherwise DT bindings would be too cumbersome to
> express in YAML.

There's no requirement for 'ports'. The device's node can be the
container. If there's not 'ports', we simply don't have any $ref to
graph.yaml#/properties/ports. There was at least one case in the
conversions I did. What we don't want is a given binding doing both
ways.

Though generally for new bindings, I'd recommend having 'ports' if
there's more than one.

Rob
