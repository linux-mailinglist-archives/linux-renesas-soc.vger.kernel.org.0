Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9624D3C6094
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 18:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234619AbhGLQbJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 12:31:09 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:36619 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234515AbhGLQbJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 12:31:09 -0400
Received: by mail-io1-f51.google.com with SMTP id u7so23393941ion.3;
        Mon, 12 Jul 2021 09:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vtNA/NB6LmO/HpICnchTMvKV6NLDa7WSvyUr9ghzAGw=;
        b=U3jm6VjEtC9v+coXt+FzCAqAV3VtHzaEIftAnDzICSCShCC70/64hB0dsiLyqkaCiU
         ZMW0ueLt+w0Pb3xAuxNwaFYZJKgMataHpjZ+W3CDTkj9tw/rvaC7u/nmQoX7+RTqIF42
         96MBhg+XqK0gqXGKhOy/DYnuY7ZqbCiXxPLxNLVRyTuxb9xDF2QXR9hgtXgrbiXjfaDJ
         eqNuYfiTTBtQfY5rq+DF2x1uqIHd5Y1YFZ0zs7KaCgatbmuhzKnB+vNFc8eZ81Bn5NoL
         eMbuLs2YPnz5H/n3Ru9LhKrfzQa1wfk03T7UYXmCXb67BAZtxLEPssDtXiGP7pmgeQPi
         ittA==
X-Gm-Message-State: AOAM531x4B/LYAQTbJKjGX/GqO0Z4TUQS5/82EzFA320qHqmMOD6j1Gx
        B6TkJEStf/ywsCYdgaOIxQ==
X-Google-Smtp-Source: ABdhPJzNQ7OrUXjoJbtZO9uUa3yYVt3uS4vQdxhkvDXfG8KztNvdfvkDCFhF4vwBgaGRxQyEMbIxig==
X-Received: by 2002:a02:620a:: with SMTP id d10mr46166061jac.22.1626107299526;
        Mon, 12 Jul 2021 09:28:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m26sm7910221ioo.23.2021.07.12.09.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 09:28:18 -0700 (PDT)
Received: (nullmailer pid 2059719 invoked by uid 1000);
        Mon, 12 Jul 2021 16:28:16 -0000
Date:   Mon, 12 Jul 2021 10:28:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, geert+renesas@glider.be,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: Re: [PATCH v3 1/2] dt-bindings: Add binding for Renesas 8T49N241
Message-ID: <20210712162816.GA2050345@robh.at.kernel.org>
References: <20210707182659.20548-1-alexander.helms.jy@renesas.com>
 <20210707182659.20548-2-alexander.helms.jy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707182659.20548-2-alexander.helms.jy@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 07, 2021 at 11:26:58AM -0700, Alex Helms wrote:
> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> The 8T49N241 accepts up to two differential or single-ended input clocks
> and a fundamental-mode crystal input. The internal PLL can lock to either
> of the input reference clocks or to the crystal to behave as a frequency
> synthesizer.
> 
> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> ---
>  .../bindings/clock/renesas,8t49n241.yaml      | 188 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> new file mode 100644
> index 000000000..4e26b3f11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,8t49n241.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binding for Renesas 8T49N241 Universal Frequency Translator
> +
> +description: |
> +  The 8T49N241 has one fractional-feedback PLL that can be used as a
> +  jitter attenuator and frequency translator. It is equipped with one
> +  integer and three fractional output dividers, allowing the generation
> +  of up to four different output frequencies, ranging from 8kHz to 1GHz.
> +  These frequencies are completely independent of each other, the input
> +  reference frequencies and the crystal reference frequency. The device
> +  places virtually no constraints on input to output frequency conversion,
> +  supporting all FEC rates, including the new revision of ITU-T
> +  Recommendation G.709 (2009), most with 0ppm conversion error.
> +  The outputs may select among LVPECL, LVDS, HCSL or LVCMOS output levels.
> +
> +  The driver can read a full register map from the DT, and will use that
> +  register map to initialize the attached part (via I2C) when the system
> +  boots. Any configuration not supported by the common clock framework
> +  must be done via the full register map, including optimized settings.
> +
> +  The 8T49N241 accepts up to two differential or single-ended input clocks
> +  and a fundamental-mode crystal input. The internal PLL can lock to either
> +  of the input reference clocks or just to the crystal to behave as a
> +  frequency synthesizer. The PLL can use the second input for redundant
> +  backup of the primary input reference, but in this case, both input clock
> +  references must be related in frequency.
> +
> +  All outputs are currently assumed to be LVDS, unless overridden in the
> +  full register map in the DT.
> +
> +maintainers:
> +  - Alex Helms <alexander.helms.jy@renesas.com>
> +  - David Cater <david.cater.jc@renesas.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - 8t49n241

Needs a vendor prefix.

> +
> +  reg:
> +    description: I2C device address
> +    enum: [ 0x7c, 0x6c, 0x7d, 0x6d, 0x7e, 0x6e, 0x7f, 0x6f ]
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clock-names:
> +    description: Name of the input clock

Drop. That's every 'clock-names'.

> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      enum: [ input-xtal, input-clk0, input-clk1 ]

'input-' is redundant.

> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  settings:
> +    description: Optional, list of space separated ASCII numbers in hex.

Huh?

> +      This list is the entire register map of the product and must contain
> +      791 items.

What is this for?

Seems suspect, but would need a vendor prefix and type at a minimum.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* 25MHz reference clock */
> +    input_clk0: input_clk0 {
> +      compatible = "fixed-clock";
> +      #clock-cells = <0>;
> +      clock-frequency = <25000000>;
> +    };
> +
> +    i2c@0 {
> +        reg = <0x0 0x100>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        renesas8t49n241_1: clock-generator@6c {
> +            compatible = "renesas,8t49n241";
> +            reg = <0x6c>;
> +            #clock-cells = <1>;
> +
> +            clocks = <&input_clk0>;
> +            clock-names = "input-clk0";
> +        };
> +    };
> +
> +    /* Consumer referencing the 8T49N241 Q1 */
> +    consumer {
> +        /* ... */
> +        clocks = <&renesas8t49n241_1 1>;
> +        /* ... */
> +    };
> +  - |
> +    /* 40MHz crystal */
> +    input_xtal: input_xtal {
> +      compatible = "fixed-clock";
> +      #clock-cells = <0>;
> +      clock-frequency = <40000000>;
> +    };
> +
> +    i2c@0 {
> +        reg = <0x0 0x100>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        renesas8t49n241_2: clock-generator@6c {
> +            compatible = "renesas,8t49n241";
> +            reg = <0x6c>;
> +            #clock-cells = <1>;
> +
> +            clocks = <&input_xtal>;
> +            clock-names = "input-xtal";
> +
> +            settings=[
> +                09 50 00 60 67 C5 6C FF 03 00 30 00 00 01 00 00
> +                01 07 00 00 07 00 00 77 6D 06 00 00 00 00 00 FF
> +                FF FF FF 00 3F 00 2A 00 16 33 33 00 01 00 00 D0
> +                00 00 00 00 00 00 00 00 00 04 00 00 00 02 00 00
> +                00 00 00 00 00 00 00 17 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 D7 0A 2B 20 00 00 00 0B
> +                00 00 00 00 00 00 00 00 00 00 27 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                C3 00 08 01 00 00 00 00 00 00 00 00 00 30 00 00
> +                00 0A 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 85 00 00 9C 01 D4 02 71 07 00 00 00
> +                00 83 00 10 02 08 8C
> +            ];
> +        };
> +    };
> +
> +    /* Consumer referencing the 8T49N241 Q1 */
> +    consumer {
> +        /* ... */
> +        clocks = <&renesas8t49n241_2 1>;
> +        /* ... */
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0cce91cd5..882d79ead 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15575,6 +15575,12 @@ F:	include/linux/rpmsg/
>  F:	include/uapi/linux/rpmsg.h
>  F:	samples/rpmsg/
>  
> +RENESAS 8T49N24X DRIVER
> +M:	Alex Helms <alexander.helms.jy@renesas.com>
> +M:	David Cater <david.cater.jc@renesas.com>
> +S:	Odd Fixes
> +F:	Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> +
>  RENESAS CLOCK DRIVERS
>  M:	Geert Uytterhoeven <geert+renesas@glider.be>
>  L:	linux-renesas-soc@vger.kernel.org
> -- 
> 2.30.2
> 
> 
