Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2837D18681D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2020 10:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730364AbgCPJnD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Mar 2020 05:43:03 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35401 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730088AbgCPJnD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Mar 2020 05:43:03 -0400
Received: by mail-wm1-f68.google.com with SMTP id m3so17193124wmi.0;
        Mon, 16 Mar 2020 02:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fz8EN64pj84JLJF6IiW4kTKA37f7PztgaV9fgn5vMk8=;
        b=FN5EHE4XPhdQAP09ZkKtWFdSWVN4YruepvXwZ538DMiJdncBMDG2uYIrVmI1Q10N6t
         DvsbjF+3h11kNvuwuXiyq6160CHGVGVKuaoKHKfG/rXlxPUy6Q6Eprp2JIFf7Q9kBlry
         lZODF9m9PENaxqBlK5bISc5NCTTRSjFRKXu0WupUadhYNhqfNwc56AYvEM07zKNBVzUm
         cyuHqKJHT/cxZTUUrJQgQ+4NJHPWuMYa5ucJT1Tyz1tQNHw5qHfaBnMIRg1L1r5jnAqj
         uDv/VtoC/v7uFKqGNCPBWX+Eb/vtUflXBhVGRmzEFhy+b0MG23c0CN2b6ZMwsqJTWTMJ
         P+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fz8EN64pj84JLJF6IiW4kTKA37f7PztgaV9fgn5vMk8=;
        b=Le40gDhPx2Rcv3R7hBfIGKumV1aPZ2WMpy9crwSHCR9BonstSwP69ZUPW0fSEkTB5S
         6o3bFUceZmssamjvBuwmiBTreQlzhYabs8P/as6C9lLf1CdUbQytqmOzKCr8BKd96MHH
         1YT0Lbh1zbn9Enb+oMJIHhjJN4PiUThEovNg9sKfYVHPQ6Q4DcSZdTUevRVFZXkKQ1OO
         1wHUTO9EXUMDs/WCrWB3l8wYZFV/fFMOXTk3GkfCaK87xnbk/ub8mUziAMLZIrP2Ow29
         wo5Himmo//mTYnQm8MLwEOm5P38Oo1uxbghunxZ9qXAyX+8VdE4Yn3Z4h7cfiBeQOjCM
         4fvQ==
X-Gm-Message-State: ANhLgQ3Ya4vjMMR0QooVUgG5izAI2lfWcnNOOy6iabHf3MJQu+Sz+eiW
        /5rSicxAlfVmuEHfURUYpGbMiKQucIU=
X-Google-Smtp-Source: ADFU+vtMsCCW6lv1Tr+mg9+KZSXDjzh9lg49uId11NtK1TwWwH6m9jLcrrTxxCX7+SsdTEoUV1WYEw==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr26307927wmc.18.1584351777192;
        Mon, 16 Mar 2020 02:42:57 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.243])
        by smtp.gmail.com with ESMTPSA id a73sm13273756wme.47.2020.03.16.02.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 02:42:56 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] dt-bindings: serial: Convert slave-device bindings
 to json-schema
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sean Wang <sean.wang@mediatek.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20200306090046.8890-1-geert+renesas@glider.be>
 <20200306090046.8890-3-geert+renesas@glider.be>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <403644bf-2ffc-fab8-1f5e-8a4b4df3bd23@gmail.com>
Date:   Mon, 16 Mar 2020 10:42:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306090046.8890-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 06/03/2020 10:00, Geert Uytterhoeven wrote:
> Convert the serial slave-device Device Tree binding documentation to
> json-schema, and incorporate it into the generic serial bindings.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
> v2:
>   - Update references to slave-device.txt,
>   - Allow any child node names,
>   - Typo s/connnected/connected/.
> ---
>  .../devicetree/bindings/gnss/gnss.txt         |  2 +-
>  .../bindings/net/broadcom-bluetooth.txt       |  2 +-
>  .../bindings/net/mediatek-bluetooth.txt       |  2 +-
>  .../devicetree/bindings/net/qca,qca7000.txt   |  2 +-
>  .../bindings/net/qualcomm-bluetooth.txt       |  2 +-
>  .../devicetree/bindings/net/ti-bluetooth.txt  |  3 +-
>  .../devicetree/bindings/serial/serial.yaml    | 56 +++++++++++++++++++
>  .../bindings/serial/slave-device.txt          | 45 ---------------
>  MAINTAINERS                                   |  2 +-
>  9 files changed, 63 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/slave-device.txt
> 
> diff --git a/Documentation/devicetree/bindings/gnss/gnss.txt b/Documentation/devicetree/bindings/gnss/gnss.txt
> index f547bd4549fe4655..d6dc9c0d82499dd5 100644
> --- a/Documentation/devicetree/bindings/gnss/gnss.txt
> +++ b/Documentation/devicetree/bindings/gnss/gnss.txt
> @@ -8,7 +8,7 @@ bus (e.g. UART, I2C or SPI).
>  
>  Please refer to the following documents for generic properties:
>  
> -	Documentation/devicetree/bindings/serial/slave-device.txt
> +	Documentation/devicetree/bindings/serial/serial.yaml
>  	Documentation/devicetree/bindings/spi/spi-bus.txt
>  
>  Required properties:
> diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> index dd258674633ca84e..a7d57ba5f2ac39bd 100644
> --- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> @@ -20,7 +20,7 @@ Required properties:
>  
>  Optional properties:
>  
> - - max-speed: see Documentation/devicetree/bindings/serial/slave-device.txt
> + - max-speed: see Documentation/devicetree/bindings/serial/serial.yaml
>   - shutdown-gpios: GPIO specifier, used to enable the BT module
>   - device-wakeup-gpios: GPIO specifier, used to wakeup the controller
>   - host-wakeup-gpios: GPIO specifier, used to wakeup the host processor.
> diff --git a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
> index 112011c51d5e3c1e..219bcbd0d34478ba 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
> @@ -42,7 +42,7 @@ child node of the serial node with UART.
>  
>  Please refer to the following documents for generic properties:
>  
> -	Documentation/devicetree/bindings/serial/slave-device.txt
> +	Documentation/devicetree/bindings/serial/serial.yaml
>  
>  Required properties:
>  
> diff --git a/Documentation/devicetree/bindings/net/qca,qca7000.txt b/Documentation/devicetree/bindings/net/qca,qca7000.txt
> index 21c36e5249936c4c..8f5ae0b84eec2646 100644
> --- a/Documentation/devicetree/bindings/net/qca,qca7000.txt
> +++ b/Documentation/devicetree/bindings/net/qca,qca7000.txt
> @@ -68,7 +68,7 @@ Required properties:
>  Optional properties:
>  - local-mac-address : see ./ethernet.txt
>  - current-speed     : current baud rate of QCA7000 which defaults to 115200
> -		      if absent, see also ../serial/slave-device.txt
> +		      if absent, see also ../serial/serial.yaml
>  
>  UART Example:
>  
> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> index beca6466d59a9d7d..d2202791c1d4c0c5 100644
> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> @@ -29,7 +29,7 @@ Required properties for compatible string qcom,wcn399x-bt:
>  
>  Optional properties for compatible string qcom,wcn399x-bt:
>  
> - - max-speed: see Documentation/devicetree/bindings/serial/slave-device.txt
> + - max-speed: see Documentation/devicetree/bindings/serial/serial.yaml
>   - firmware-name: specify the name of nvm firmware to load
>   - clocks: clock provided to the controller
>  
> diff --git a/Documentation/devicetree/bindings/net/ti-bluetooth.txt b/Documentation/devicetree/bindings/net/ti-bluetooth.txt
> index 6d03ff8c7068135e..f48c17b38f5851de 100644
> --- a/Documentation/devicetree/bindings/net/ti-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/ti-bluetooth.txt
> @@ -15,8 +15,7 @@ standard BT HCI protocol with additional channels for the other functions.
>  TI WiLink devices also have a separate WiFi interface as described in
>  wireless/ti,wlcore.txt.
>  
> -This bindings follows the UART slave device binding in
> -../serial/slave-device.txt.
> +This bindings follows the UART slave device binding in ../serial/serial.yaml.
>  
>  Required properties:
>   - compatible: should be one of the following:
> diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
> index ca2ae755b560141c..dd97ecd1a7fe8ddd 100644
> --- a/Documentation/devicetree/bindings/serial/serial.yaml
> +++ b/Documentation/devicetree/bindings/serial/serial.yaml
> @@ -7,6 +7,7 @@ $schema: "http://devicetree.org/meta-schemas/core.yaml#"
>  title: Serial Interface Generic DT Bindings
>  
>  maintainers:
> +  - Rob Herring <robh@kernel.org>
>    - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>  
>  description:
> @@ -69,3 +70,58 @@ then:
>    properties:
>      cts-gpios: false
>      rts-gpios: false
> +
> +patternProperties:
> +  ".*":
> +    if:
> +      type: object
> +    then:
> +      description:
> +        Serial attached devices shall be a child node of the host UART device
> +        the slave device is attached to. It is expected that the attached
> +        device is the only child node of the UART device. The slave device node
> +        name shall reflect the generic type of device for the node.
> +
> +      properties:
> +        compatible:
> +          description:
> +            Compatible of the device connected to the serial port.
> +
> +        max-speed:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          description:
> +            The maximum baud rate the device operates at.
> +            This should only be present if the maximum is less than the slave
> +            device can support.  For example, a particular board has some
> +            signal quality issue or the host processor can't support higher
> +            baud rates.
> +
> +        current-speed:
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          description: |
> +            The current baud rate the device operates at.
> +            This should only be present in case a driver has no chance to know
> +            the baud rate of the slave device.
> +            Examples:
> +              * device supports auto-baud
> +              * the rate is setup by a bootloader and there is no way to reset
> +                the device
> +              * device baud rate is configured by its firmware but there is no
> +                way to request the actual settings
> +
> +      required:
> +        - compatible
> +
> +examples:
> +  - |
> +    serial@1234 {
> +            compatible = "ns16550a";
> +            reg = <0x1234 0x20>;
> +            interrupts = <1>;
> +
> +            bluetooth {
> +                    compatible = "brcm,bcm43341-bt";
> +                    interrupt-parent = <&gpio>;
> +                    interrupts = <10>;
> +            };
> +    };
> diff --git a/Documentation/devicetree/bindings/serial/slave-device.txt b/Documentation/devicetree/bindings/serial/slave-device.txt
> deleted file mode 100644
> index 40110e0196209fde..0000000000000000
> --- a/Documentation/devicetree/bindings/serial/slave-device.txt
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Serial Slave Device DT binding
> -
> -This documents the binding structure and common properties for serial
> -attached devices. Common examples include Bluetooth, WiFi, NFC and GPS
> -devices.
> -
> -Serial attached devices shall be a child node of the host UART device the
> -slave device is attached to. It is expected that the attached device is
> -the only child node of the UART device. The slave device node name shall
> -reflect the generic type of device for the node.
> -
> -Required Properties:
> -
> -- compatible 	: A string reflecting the vendor and specific device the node
> -		  represents.
> -
> -Optional Properties:
> -
> -- max-speed	: The maximum baud rate the device operates at. This should
> -		  only be present if the maximum is less than the slave device
> -		  can support. For example, a particular board has some signal
> -		  quality issue or the host processor can't support higher
> -		  baud rates.
> -- current-speed	: The current baud rate the device operates at. This should
> -		  only be present in case a driver has no chance to know
> -		  the baud rate of the slave device.
> -		  Examples:
> -		    * device supports auto-baud
> -		    * the rate is setup by a bootloader and there is no
> -		      way to reset the device
> -		    * device baud rate is configured by its firmware but
> -		      there is no way to request the actual settings
> -
> -Example:
> -
> -serial@1234 {
> -	compatible = "ns16550a";
> -	interrupts = <1>;
> -
> -	bluetooth {
> -		compatible = "brcm,bcm43341-bt";
> -		interrupt-parent = <&gpio>;
> -		interrupts = <10>;
> -	};
> -};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 59c14ee9a917a794..5f5d074c7b3927a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15034,7 +15034,7 @@ SERIAL DEVICE BUS
>  M:	Rob Herring <robh@kernel.org>
>  L:	linux-serial@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/serial/slave-device.txt
> +F:	Documentation/devicetree/bindings/serial/serial.yaml
>  F:	drivers/tty/serdev/
>  F:	include/linux/serdev.h
>  
> 
