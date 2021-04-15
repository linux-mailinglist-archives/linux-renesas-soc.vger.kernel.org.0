Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABB9360C0D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 16:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbhDOOm7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 10:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233201AbhDOOm6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 10:42:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F33BC061574;
        Thu, 15 Apr 2021 07:42:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DD6989A;
        Thu, 15 Apr 2021 16:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618497751;
        bh=k+IQUeSEYm1M3FFyJ2PXsEYwB8+VDm1H6a7nr/uK4Bs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GI2XyNCZXM9QT6cYE4wKtBBgpjxWlnf+46yux+Bl8X6OTHU+ERIQau2ZVIAV50AVW
         dGSmh+hkw9jwvhGckd61GrigbYhXswNKzR1IQ2gkG47lk+LjO5liUBlDwWHf1SuAi/
         LmSJLlVbDz58Sv+Y7HncWMqGOe+8TiHS4stq0tjc=
Date:   Thu, 15 Apr 2021 17:42:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: media: max9286: Re-indent example
Message-ID: <YHhQ1fIicHoDKB0L@pendragon.ideasonboard.com>
References: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
 <20210415122602.87697-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210415122602.87697-2-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Apr 15, 2021 at 02:25:56PM +0200, Jacopo Mondi wrote:
> The dt-bindings examples are usually indented with 4 spaces.
> 
> The maxim,max9286 schema has the example indented with only
> 2 spaces, re-indent it.
> 
> Cosmetic change only.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Tested by applying and verifying that `git show -b` shows an empty diff.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bindings/media/i2c/maxim,max9286.yaml     | 214 +++++++++---------
>  1 file changed, 107 insertions(+), 107 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index ee16102fdfe7..0e7162998b77 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -191,140 +191,140 @@ examples:
>      #include <dt-bindings/gpio/gpio.h>
>  
>      i2c@e66d8000 {
> -      #address-cells = <1>;
> -      #size-cells = <0>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
>  
> -      reg = <0 0xe66d8000>;
> +        reg = <0 0xe66d8000>;
>  
> -      gmsl-deserializer@2c {
> -        compatible = "maxim,max9286";
> -        reg = <0x2c>;
> -        poc-supply = <&camera_poc_12v>;
> -        enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
> +        gmsl-deserializer@2c {
> +            compatible = "maxim,max9286";
> +            reg = <0x2c>;
> +            poc-supply = <&camera_poc_12v>;
> +            enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
>  
> -        gpio-controller;
> -        #gpio-cells = <2>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
>  
> -        maxim,reverse-channel-microvolt = <170000>;
> +            maxim,reverse-channel-microvolt = <170000>;
>  
> -        ports {
> -          #address-cells = <1>;
> -          #size-cells = <0>;
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
>  
> -          port@0 {
> -            reg = <0>;
> +                port@0 {
> +                    reg = <0>;
>  
> -            max9286_in0: endpoint {
> -              remote-endpoint = <&rdacm20_out0>;
> -            };
> -          };
> -
> -          port@1 {
> -            reg = <1>;
> -
> -            max9286_in1: endpoint {
> -              remote-endpoint = <&rdacm20_out1>;
> -            };
> -          };
> -
> -          port@2 {
> -            reg = <2>;
> -
> -            max9286_in2: endpoint {
> -              remote-endpoint = <&rdacm20_out2>;
> -            };
> -          };
> +                    max9286_in0: endpoint {
> +                        remote-endpoint = <&rdacm20_out0>;
> +                    };
> +                };
>  
> -          port@3 {
> -            reg = <3>;
> +                port@1 {
> +                    reg = <1>;
>  
> -            max9286_in3: endpoint {
> -              remote-endpoint = <&rdacm20_out3>;
> -            };
> -          };
> +                    max9286_in1: endpoint {
> +                        remote-endpoint = <&rdacm20_out1>;
> +                    };
> +                };
>  
> -          port@4 {
> -            reg = <4>;
> +                port@2 {
> +                    reg = <2>;
>  
> -            max9286_out: endpoint {
> -              data-lanes = <1 2 3 4>;
> -              remote-endpoint = <&csi40_in>;
> -            };
> -          };
> -        };
> +                    max9286_in2: endpoint {
> +                        remote-endpoint = <&rdacm20_out2>;
> +                    };
> +                };
>  
> -        i2c-mux {
> -          #address-cells = <1>;
> -          #size-cells = <0>;
> +                port@3 {
> +                    reg = <3>;
>  
> -          i2c@0 {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -            reg = <0>;
> +                    max9286_in3: endpoint {
> +                        remote-endpoint = <&rdacm20_out3>;
> +                    };
> +                };
>  
> -            camera@51 {
> -              compatible = "imi,rdacm20";
> -              reg = <0x51>, <0x61>;
> +                port@4 {
> +                    reg = <4>;
>  
> -              port {
> -                rdacm20_out0: endpoint {
> -                  remote-endpoint = <&max9286_in0>;
> +                    max9286_out: endpoint {
> +                        data-lanes = <1 2 3 4>;
> +                        remote-endpoint = <&csi40_in>;
> +                    };
>                  };
> -              };
> -
>              };
> -          };
> -
> -          i2c@1 {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -            reg = <1>;
>  
> -            camera@52 {
> -              compatible = "imi,rdacm20";
> -              reg = <0x52>, <0x62>;
> +            i2c-mux {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
>  
> -              port {
> -                rdacm20_out1: endpoint {
> -                  remote-endpoint = <&max9286_in1>;
> -                };
> -              };
> -            };
> -          };
> +                i2c@0 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <0>;
>  
> -          i2c@2 {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -            reg = <2>;
> +                    camera@51 {
> +                        compatible = "imi,rdacm20";
> +                        reg = <0x51>, <0x61>;
>  
> -            camera@53 {
> -              compatible = "imi,rdacm20";
> -              reg = <0x53>, <0x63>;
> +                        port {
> +                            rdacm20_out0: endpoint {
> +                                remote-endpoint = <&max9286_in0>;
> +                            };
> +                        };
>  
> -              port {
> -                rdacm20_out2: endpoint {
> -                  remote-endpoint = <&max9286_in2>;
> +                    };
>                  };
> -              };
> -            };
> -          };
>  
> -          i2c@3 {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -            reg = <3>;
> +                i2c@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <1>;
> +
> +                    camera@52 {
> +                        compatible = "imi,rdacm20";
> +                        reg = <0x52>, <0x62>;
> +
> +                        port {
> +                            rdacm20_out1: endpoint {
> +                                remote-endpoint = <&max9286_in1>;
> +                            };
> +                        };
> +                    };
> +                };
>  
> -            camera@54 {
> -              compatible = "imi,rdacm20";
> -              reg = <0x54>, <0x64>;
> +                i2c@2 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <2>;
> +
> +                    camera@53 {
> +                        compatible = "imi,rdacm20";
> +                        reg = <0x53>, <0x63>;
> +
> +                        port {
> +                            rdacm20_out2: endpoint {
> +                                remote-endpoint = <&max9286_in2>;
> +                            };
> +                        };
> +                    };
> +                };
>  
> -              port {
> -                rdacm20_out3: endpoint {
> -                  remote-endpoint = <&max9286_in3>;
> +                i2c@3 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <3>;
> +
> +                    camera@54 {
> +                        compatible = "imi,rdacm20";
> +                        reg = <0x54>, <0x64>;
> +
> +                        port {
> +                            rdacm20_out3: endpoint {
> +                                remote-endpoint = <&max9286_in3>;
> +                            };
> +                        };
> +                    };
>                  };
> -              };
>              };
> -          };
>          };
> -      };
>      };

-- 
Regards,

Laurent Pinchart
