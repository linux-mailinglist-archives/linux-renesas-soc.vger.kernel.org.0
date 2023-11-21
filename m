Return-Path: <linux-renesas-soc+bounces-33-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C0A7F2C98
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 13:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8525B21728
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 12:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6CB3D38E;
	Tue, 21 Nov 2023 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="0DiQ63Zz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A56138
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 04:10:27 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c50906f941so73796281fa.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 04:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700568625; x=1701173425; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ntfKAqPU4aWm/LRHvi2okxLjB0lcvVe/EACDTzczDJs=;
        b=0DiQ63Zz74CrksngIF1HBqr87vwxJwnVx2Qtp7OJQq4CeQXzwqCsqVAqi/TBil6atT
         E4HSV9kzg3QKzEheQ68GCppZoiNGFHK9yDdN1EEyD4TVex7BJ9jf/8hYeM9YsmlYQ2oT
         ycxW/OQm1tv0Fz9CUPgijCoLQ5toCsdzqRTVKXqzdbGhgimeQEUppbJPy2Q6Gp92RIjX
         96XQ0y70s6nz9cJMMK2WuIe9UbfxuOa0HBUSi3XoWLpdG3BF3QOu7M1ZCPLJNycmSLKV
         olRx8nA8kwl3EnVK2Xyrsfk2w25Ntqr4Wt4FvDQasTyjSOGsL1HXWrqqnWnD3MGnZnMh
         h1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700568625; x=1701173425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ntfKAqPU4aWm/LRHvi2okxLjB0lcvVe/EACDTzczDJs=;
        b=VbXFgti2/mvtHnWQV2kEBV8GMQCZ6nlvsyogRfSmBwVHQOfrK4ccPo/x+LIuyM0MkU
         IKuiADS4iqcPs4Stxx+ljxWSWipzN+S6sO89jfJ6lsos3RCkzuR6ALBJgWlBWR465UBp
         nVZTOstTssd79WZ7T0Z9at3igW4OI9IM+yDzBBbjQQ1I0L3vGhIuE67MPlovCKVjy6Oe
         Z7UGA9JcJaVy/yCP9n8TRLd834U1T2vo6CI1gqtF5cHsRHR8aKaoCjdRbIIo4BtHbIY2
         g1GpUNuR/IjdKw/sUhIF+vUA4YVRvIjqtZtH6MMaQjO5foMrKH+6ogxDBX2VuC56WTHS
         1AKg==
X-Gm-Message-State: AOJu0YzVcL8G5slXq3wl7/jPPjGRyCAu3cPhaD4DU71Hue5t/b/rQmF0
	7fMLyRCTF2CUiCKj/QY8BSyRmw==
X-Google-Smtp-Source: AGHT+IHhSYP9Dskk4tqKl43Llz13m39cbu1sHHZcK1T7rMXZkD8zA2Zb+Mffaejw8iF64d9t4JIszg==
X-Received: by 2002:a2e:989a:0:b0:2c5:13e8:e6dc with SMTP id b26-20020a2e989a000000b002c513e8e6dcmr7123463ljj.31.1700568625337;
        Tue, 21 Nov 2023 04:10:25 -0800 (PST)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id bz14-20020a05651c0c8e00b002b9f4841913sm1315506ljb.1.2023.11.21.04.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 04:10:24 -0800 (PST)
Date: Tue, 21 Nov 2023 13:10:24 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: renesas,ethertsn: Add bindings for
 Ethernet TSN
Message-ID: <ZVyeMKjVhjW2F2e0@oden.dyn.berto.se>
References: <20231120160740.3532848-1-niklas.soderlund+renesas@ragnatech.se>
 <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ab74479-f1fb-4faf-b223-ae750b4c08ce@linaro.org>

Hi Krzysztof,

Thanks for your review.

On 2023-11-21 08:45:29 +0100, Krzysztof Kozlowski wrote:
> On 20/11/2023 17:07, Niklas Söderlund wrote:
> > Add bindings for Renesas R-Car Ethernet TSN End-station IP. The RTSN
> > device provides Ethernet network.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Why do you decide to skip some maintainers?

Sorry will do for v2.

> 
> > ---
> >  .../bindings/net/renesas,ethertsn.yaml        | 133 ++++++++++++++++++
> >  1 file changed, 133 insertions(+)
> 
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.

Ack.

> 
> >  create mode 100644 Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
> > new file mode 100644
> > index 000000000000..255c8f3a5a3b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
> > @@ -0,0 +1,133 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/renesas,ethertsn.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas Ethernet TSN End-station
> > +
> > +maintainers:
> > +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > +
> > +description:
> > +  The RTSN device provides Ethernet network using a 10 Mbps, 100 Mbps, or 1
> > +  Gbps full-duplex link via MII/GMII/RMII/RGMII. Depending on the connected PHY.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> 
> Drop items.

Ack.

> 
> I assume you have oneOf above because you predict this will grow with
> entries with fallbacks? If not, drop.

As Geert points out I will add a fallback here and somewhen add support 
for R-Car S4 could be added.

> 
> > +          - enum:
> > +              - renesas,ethertsn-r8a779g0      # R-Car V4H
> > +
> > +  reg:
> > +    items:
> > +      - description: TSN End Station target
> > +      - description: generalized Precision Time Protocol target
> > +
> > +  reg-names:
> > +    items:
> > +      - const: tsnes
> > +      - const: gptp
> > +
> > +  interrupts:
> > +    items:
> > +      - description: TX data interrupt
> > +      - description: RX data interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: tx_data
> 
> tx
> 
> > +      - const: rx_data
> 
> rx

Ack.

> 
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  phy-mode:
> > +    contains:
> > +      enum:
> > +        - mii
> > +        - rgmii
> > +
> > +  phy-handle:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Specifies a reference to a node representing a PHY device.
> 
> You miss top-level $ref to ethernet controller

Sorry I don't fully understand what you are asking here, there are a few 
things about bindings I still need to learn. Looking at other bindings 
some have a

maintainers:
  ..

allOf:
  - $ref: ethernet-controller.yaml#

properties:
 ..

Is it this all ollOff node I'm missing?

> 
> > +
> > +  renesas,rx-internal-delay:
> > +    type: boolean
> > +    description:
> > +      Enable internal Rx clock delay, typically 1.8ns.
> 
> Why this is bool, not delay in ns?

The TSN is only capable of enabling or disable internal delays, not set 
how long the delay is. The documentation states that the delay depends 
on the electronic characteristics of the particular board, but states 
that they typically are 1.8ns for Rx and 2.0ns for Tx.

I looked at the generic properties {rx,tx}-internal-delay-ps but they 
are of int type. So I opted for a vendor specific bool property. Do you 
think a better route is to use the generic property and force the value 
to be either 0 or the typical delay?

> Why this is property of a board (not SoC)?

I'm sorry I don't understand this question.

> 
> > +
> > +  renesas,tx-internal-delay:
> > +    type: boolean
> > +    description:
> > +      Enable internal Tx clock delay, typically 2.0ns.
> 
> Same questions.
> 
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^ethernet-phy@[0-9a-f]$":
> > +    type: object
> > +    $ref: ethernet-phy.yaml#
> 
> Missing unevaluatedProperties. Open existing bindings and look how it is
> done there. Don't create something different.

Ack.

> 
> 
> 
> Best regards,
> Krzysztof
> 

-- 
Kind Regards,
Niklas Söderlund

