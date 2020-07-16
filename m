Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F184F2226E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jul 2020 17:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbgGPPZY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jul 2020 11:25:24 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:33898 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbgGPPZX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 11:25:23 -0400
Received: by mail-il1-f194.google.com with SMTP id t4so5413282iln.1;
        Thu, 16 Jul 2020 08:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+8sCFotjHvcqhcaFqEJm3//tlFTHSiLL36jSVd2F5HE=;
        b=T5ijFrwRfyuwoDV13BZZHj+YhSREKzq1goicXuBjwBkBemzBjhNj9L9qck27Gkztb1
         dwmZlDbJLDA1G1qZci7+GISr/xYTXm356k0n5e41dYXXk6l6AMBRrHHGZgArVFUqSwfl
         0dAmxVlcM0qmTCeyGI/FFB+0BjxsBK2TnKf0idtBPNYXPVIwNcA7NWUCHgeJExX9Kec/
         SpRmb7e6KQMTZmFjcoEDZlF4RpyDSbQzGFSq49o8e/aNGtQNOySnxZ8XZEAkLR7tmDDt
         TRcOrFib6Lbkr+jCMPb87+8rMm00vzOEjDSsDT3348KN5H0vSOlm1nhEDhxFpmSfjpZA
         wCQg==
X-Gm-Message-State: AOAM531lN5/klnR+LKrXNrMdQqQrSLGW8ltwi2O4rJh9nDpUux4LyLtb
        YncfsQPLE/9O0QeOtd6OUw==
X-Google-Smtp-Source: ABdhPJwn6vFzj1XNYFeW1m4BKLuhwFnyytZX9Cw/iMShPrTEdtRLc4LiWXYdfH8C0ZpSgSVU5E/RaQ==
X-Received: by 2002:a92:41d2:: with SMTP id o201mr4910551ila.298.1594913121556;
        Thu, 16 Jul 2020 08:25:21 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a13sm2784409ilk.19.2020.07.16.08.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 08:25:21 -0700 (PDT)
Received: (nullmailer pid 2369449 invoked by uid 1000);
        Thu, 16 Jul 2020 15:25:20 -0000
Date:   Thu, 16 Jul 2020 09:25:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: adv7604: Convert bindings to
 json-schema
Message-ID: <20200716152520.GA2351503@bogus>
References: <20200715091455.1772470-1-niklas.soderlund+renesas@ragnatech.se>
 <20200715091455.1772470-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200715091455.1772470-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 15, 2020 at 11:14:54AM +0200, Niklas S�derlund wrote:
> Convert ADV7604 video decoder documentation to json-schema.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Simplify enum for reg-names.
> ---
>  .../devicetree/bindings/media/i2c/adv7604.txt |  87 ----------
>  .../bindings/media/i2c/adv7604.yaml           | 161 ++++++++++++++++++
>  2 files changed, 161 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> deleted file mode 100644
> index 8c7cdc7cd7aaebc8..0000000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -* Analog Devices ADV7604/11/12 video decoder with HDMI receiver
> -
> -The ADV7604 and ADV7611/12 are multiformat video decoders with an integrated
> -HDMI receiver. The ADV7604 has four multiplexed HDMI inputs and one analog
> -input, and the ADV7611 has one HDMI input and no analog input. The 7612 is
> -similar to the 7611 but has 2 HDMI inputs.
> -
> -These device tree bindings support the ADV7611/12 only at the moment.
> -
> -Required Properties:
> -
> -  - compatible: Must contain one of the following
> -    - "adi,adv7611" for the ADV7611
> -    - "adi,adv7612" for the ADV7612
> -
> -  - reg: I2C slave addresses
> -    The ADV76xx has up to thirteen 256-byte maps that can be accessed via the
> -    main I2C ports. Each map has it own I2C address and acts as a standard
> -    slave device on the I2C bus. The main address is mandatory, others are
> -    optional and revert to defaults if not specified.

You've lost this detail which either as a schema or freeform text seems 
important..

> -
> -The device node must contain one 'port' child node per device input and output
> -port, in accordance with the video interface bindings defined in
> -Documentation/devicetree/bindings/media/video-interfaces.txt. The port nodes
> -are numbered as follows.
> -
> -  Port			ADV7611    ADV7612
> -------------------------------------------------------------
> -  HDMI			0             0, 1
> -  Digital output	1                2
> -
> -The digital output port node must contain at least one endpoint.
> -
> -Optional Properties:
> -
> -  - hpd-gpios: References to the GPIOs that control the HDMI hot-plug
> -    detection pins, one per HDMI input. The active flag indicates the GPIO
> -    level that enables hot-plug detection.
> -  - reset-gpios: Reference to the GPIO connected to the device's reset pin.
> -  - default-input: Select which input is selected after reset.
> -  - reg-names : Names of maps with programmable addresses.
> -		It can contain any map needing a non-default address.
> -		Possible maps names are :
> -		  "main", "avlink", "cec", "infoframe", "esdp", "dpp", "afe",
> -		  "rep", "edid", "hdmi", "test", "cp", "vdp"
> -
> -Optional Endpoint Properties:
> -
> -  The following three properties are defined in video-interfaces.txt and are
> -  valid for source endpoints only.
> -
> -  - hsync-active: Horizontal synchronization polarity. Defaults to active low.
> -  - vsync-active: Vertical synchronization polarity. Defaults to active low.
> -  - pclk-sample: Pixel clock polarity. Defaults to output on the falling edge.
> -
> -  If none of hsync-active, vsync-active and pclk-sample is specified the
> -  endpoint will use embedded BT.656 synchronization.
> -
> -Example:
> -
> -	hdmi_receiver@4c {
> -		compatible = "adi,adv7611";
> -		/*
> -		 * The edid page will be accessible @ 0x66 on the I2C bus. All
> -		 * other maps will retain their default addresses.
> -		 */
> -		reg = <0x4c>, <0x66>;
> -		reg-names = "main", "edid";
> -
> -		reset-gpios = <&ioexp 0 GPIO_ACTIVE_LOW>;
> -		hpd-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
> -
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		default-input = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -		};
> -		port@1 {
> -			reg = <1>;
> -			hdmi_in: endpoint {
> -				remote-endpoint = <&ccdc_in>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> new file mode 100644
> index 0000000000000000..b585745b66d70ac9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> @@ -0,0 +1,161 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/adv7604.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADV7604/11/12 video decoder with HDMI receiver
> +
> +maintainers:
> +  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
> +
> +description:
> +  The ADV7604 and ADV7611/12 are multiformat video decoders with an integrated
> +  HDMI receiver. The ADV7604 has four multiplexed HDMI inputs and one analog
> +  input, and the ADV7611 has one HDMI input and no analog input. The 7612 is
> +  similar to the 7611 but has 2 HDMI inputs.
> +
> +  These device tree bindings support the ADV7611/12 only at the moment.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - adi,adv7611
> +        - adi,adv7612
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 13
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 13
> +    items:
> +      enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  hpd-gpios:
> +    minItems: 1
> +    description:
> +      References to the GPIOs that control the HDMI hot-plug detection pins,
> +      one per HDMI input. The active flag indicates the GPIO level that
> +      enables hot-plug detection.
> +
> +  default-input:
> +    maxItems: 1
> +    description:
> +      Select which input is selected after reset.
> +
> +  ports:
> +    type: object
> +    description:
> +      A node containing input and output port nodes with endpoint definitions
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +required:
> +  - compatible
> +  - reg

Add:

additionalProperties: false

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: adi,adv7611
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            '#address-cells':
> +              const: 1
> +            '#size-cells':
> +              const: 0
> +            port@0:
> +              type: object
> +              description: Input port
> +            port@1:
> +              type: object
> +              description: Output port
> +
> +          required:
> +            - port@1
> +
> +          additionalProperties: false
> +
> +      required:
> +        - ports
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: adi,adv7612
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            '#address-cells':
> +              const: 1
> +            '#size-cells':
> +              const: 0
> +            port@2:
> +              type: object
> +              description: Output port
> +
> +          patternProperties:
> +            "^port@[0-1]$":
> +              type: object
> +              description: Input port
> +
> +          required:
> +            - port@2
> +
> +          additionalProperties: false
> +
> +      required:
> +        - ports
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            hdmi_receiver@4c {
> +                    compatible = "adi,adv7611";
> +                    /*
> +                     * The edid page will be accessible @ 0x66 on the I2C bus. All
> +                     * other maps will retain their default addresses.
> +                     */
> +                    reg = <0x4c>, <0x66>;
> +                    reg-names = "main", "edid";
> +
> +                    reset-gpios = <&ioexp 0 GPIO_ACTIVE_LOW>;
> +                    hpd-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
> +                    default-input = <0>;
> +
> +                    ports {
> +                            #address-cells = <1>;
> +                            #size-cells = <0>;
> +
> +                            port@0 {
> +                                    reg = <0>;
> +                            };
> +
> +                            port@1 {
> +                                    reg = <1>;
> +                                    hdmi_in: endpoint {
> +                                            remote-endpoint = <&ccdc_in>;
> +                                    };
> +                            };
> +                    };
> +
> +
> +            };
> +    };
> -- 
> 2.27.0
> 
