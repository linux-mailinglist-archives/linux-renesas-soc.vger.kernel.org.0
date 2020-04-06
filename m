Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D658319F489
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 13:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgDFL3H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Apr 2020 07:29:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43886 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbgDFL3H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Apr 2020 07:29:07 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 331C080E;
        Mon,  6 Apr 2020 13:29:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586172545;
        bh=ItQjziW4f31binqQFfRgDtYi4pIxtnBBDvQ+3Y1Mw3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZdBixX5gCelVYbCOMG9KOzA6VgCz151/VaFNZPY1biC02JWGXY6fugURrqMVP+QMg
         f4E6L108nTL87yi1c7oQARguVCBtTHcz3LGSjiDDcwFMJcEZuZrfk6cq+dVNsmYO2U
         FdfsFpeU83LnTTuQ8uJOSELbqzGwqhTCvvO6KNPA=
Date:   Mon, 6 Apr 2020 14:28:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <mark.yao@rock-chips.com>,
        Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH/RFC 2/6] dt-bindings: display: bridge: renesas,dw-hdmi:
 Convert binding to YAML
Message-ID: <20200406112856.GE4757@pendragon.ideasonboard.com>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-3-laurent.pinchart+renesas@ideasonboard.com>
 <20200406075705.a67tjx7jamdvqpl3@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200406075705.a67tjx7jamdvqpl3@gilmour.lan>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Maxime,

On Mon, Apr 06, 2020 at 09:57:05AM +0200, Maxime Ripard wrote:
> On Mon, Apr 06, 2020 at 02:39:31AM +0300, Laurent Pinchart wrote:
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> > new file mode 100644
> > index 000000000000..9a543740c81d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> > @@ -0,0 +1,142 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/renesas,dw-hdmi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car DWC HDMI TX Encoder
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > +
> > +description: |
> > +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> > +  with a companion PHY IP.
> > +
> > +allOf:
> > +  - $ref: synopsys,dw-hdmi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - renesas,r8a774a1-hdmi # for R8A774A1 (RZ/G2M) compatible HDMI TX
> > +        - renesas,r8a774b1-hdmi # for R8A774B1 (RZ/G2N) compatible HDMI TX
> > +        - renesas,r8a7795-hdmi # for R8A7795 (R-Car H3) compatible HDMI TX
> > +        - renesas,r8a7796-hdmi # for R8A7796 (R-Car M3-W) compatible HDMI TX
> > +        - renesas,r8a77965-hdmi # for R8A77965 (R-Car M3-N) compatible HDMI TX
> > +      - const: renesas,rcar-gen3-hdmi
> > +
> > +  reg: true
> > +
> > +  reg-io-width:
> > +    const: 1
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 2
> 
> You don't need both, if one is missing the other will be filled by the
> dt-schema tools. In this particular case, I guess maxItems would make
> more sense.

Fixed.

> > +
> > +  clock-names:
> > +    items:
> > +      - const: iahb
> > +      - const: isfr
> > +
> > +  interrupts: true
> > +
> > +  ports:
> > +    type: object
> > +    description: |
> > +      This device has three video ports. Their connections are modelled using the
> > +      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> > +      Each port shall have a single endpoint.
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +      port@0:
> > +        type: object
> > +        description: Parallel RGB input port
> > +
> > +      port@1:
> > +        type: object
> > +        description: HDMI output port
> > +
> > +      port@2:
> > +        type: object
> > +        description: Sound input port
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +      - port@2
> > +
> > +    additionalProperties: false
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - ports
> > +
> > +additionalProperties: false
> 
> In the case where you have some kind of generic schema and then a more
> specific one like you have here, unevaluatedProperties make more sense
> that additionalProperties.
> 
> additionalProperties checks that there are no extra properties on the
> current schema, which is a problem here since you have to duplicate
> the entire list of properties found in the generic schema, while
> unevaluatedProperties checks that there are no extra properties in the
> entire set of all schemas that apply to this node.
> 
> This way, you can just put what is different from the generic schema,
> and you don't have to keep it in sync.
> 
> It's a feature that has been added in the spec of the schemas that
> went on right after the one we support in the tools, so for now the
> kernel meta-schemas only allows that property to be there (just like
> deprecated) but won't do anything.
> 
> This should be fixed quite soon however, the library we depend on
> has started to work on that spec apparently.

Should I postpone this series until support for unevaluatedProperties is
available, to be able to test this ?

-- 
Regards,

Laurent Pinchart
