Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC8F26E2F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 19:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgIQRxA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 13:53:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31815 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbgIQRw5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 13:52:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600365176; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=OsGJzh7AbAIFeAPQukAez6thOj5mT0cSe2xT4U55hI0=; b=sUM+x7whhRvdAK/LdJCi9/OG1v6qV+xAitosqBcsd7bd6qQg0B58TMAWzCY4WHr5e+eJwUUA
 U71g4BWQv4oukwkh0M8lRwTZPM3iTo6c/YocVM1UVJQNWjeX0b3PcAB74iQMJKCr8Vabh/lT
 57Rt9dfZdkk3So0Kxmk9onfzCiI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIyZjFhOCIsICJsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f639d5e6fe64d5a7f3747ff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 17:31:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5A7A4C433FE; Thu, 17 Sep 2020 17:31:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.125.142] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F3FBC433C8;
        Thu, 17 Sep 2020 17:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F3FBC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v3 1/5] dt-bindings: usb: convert ti,hd3ss3220 bindings to
 json-schema
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20200824141053.5062-1-biju.das.jz@bp.renesas.com>
 <20200824141053.5062-2-biju.das.jz@bp.renesas.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <da7b8ea3-8cc1-5590-2200-c495e6c733af@codeaurora.org>
Date:   Thu, 17 Sep 2020 10:31:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200824141053.5062-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 8/24/2020 7:10 AM, Biju Das wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Convert ti,hd3ss3220.txt to YAML. Updated the binding documentation
> as graph bindings of this device model Super Speed (SS) data bus to
> the Super Speed (SS) capable connector.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3: Replaced Tabs with spaces in the example section.
> v1->v2 : No change
> Ref: https://patchwork.kernel.org/patch/11669423/
> ---
>  .../devicetree/bindings/usb/ti,hd3ss3220.txt  | 38 ---------
>  .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> deleted file mode 100644
> index 2bd21b22ce95..000000000000
> --- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -TI HD3SS3220 TypeC DRP Port Controller.
> -
> -Required properties:
> - - compatible: Must be "ti,hd3ss3220".
> - - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> - - interrupts: An interrupt specifier.
> -
> -Required sub-node:
> - - connector: The "usb-c-connector" attached to the hd3ss3220 chip. The
> -   bindings of the connector node are specified in:
> -
> -	Documentation/devicetree/bindings/connector/usb-connector.yaml
> -
> -Example:
> -hd3ss3220@47 {
> -	compatible = "ti,hd3ss3220";
> -	reg = <0x47>;
> -	interrupt-parent = <&gpio6>;
> -	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> -
> -	connector {
> -		compatible = "usb-c-connector";
> -		label = "USB-C";
> -		data-role = "dual";
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@1 {
> -				reg = <1>;
> -				hd3ss3220_ep: endpoint {
> -					remote-endpoint = <&usb3_role_switch>;
> -				};
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> new file mode 100644
> index 000000000000..750a099529c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ti,hd3ss3220.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI HD3SS3220 TypeC DRP Port Controller
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |-
> +  HD3SS3220 is a USB SuperSpeed (SS) 2:1 mux with DRP port controller. The device provides Channel
> +  Configuration (CC) logic and 5V VCONN sourcing for ecosystems implementing USB Type-C. The
> +  HD3SS3220 can be configured as a Downstream Facing Port (DFP), Upstream Facing Port (UFP) or a
> +  Dual Role Port (DRP) making it ideal for any application.
> +
> +properties:
> +  compatible:
> +   const: ti,hd3ss3220
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ports:
> +    description: OF graph bindings (specified in bindings/graph.txt) that model
> +      SS data bus to the SS capable connector.
> +    type: object
> +    properties:
> +      port@0:
> +        type: object
> +        description: Super Speed (SS) capable connector.
> +
> +      port@1:
> +        type: object
> +        description: Super Speed (SS) data bus.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hd3ss3220@47 {
> +                compatible = "ti,hd3ss3220";
> +                reg = <0x47>;
> +                interrupt-parent = <&gpio6>;
> +                interrupts = <3>;
> +
> +                ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        port@0 {
> +                                reg = <0>;
> +                                hd3ss3220_in_ep: endpoint {
> +                                        remote-endpoint = <&ss_ep>;
> +                                };

Hi Biju,

I'm involved in a separate thread[1] and I just wanted to get your
inputs on how you understood the port and endpoint assignments for the
USB type C connectors in different designs.

Since the hd3ss3220 does the type C lane detect and has an integrated
lane select mux, what is the ss_ep being used for?

Thanks
Wesley

[1]
https://lore.kernel.org/linux-usb/0101017458361303-16620b87-c433-4c00-a061-b1e688363539-000000@us-west-2.amazonses.com/
> +                        };
> +                        port@1 {
> +                                reg = <1>;
> +                                hd3ss3220_out_ep: endpoint {
> +                                        remote-endpoint = <&usb3_role_switch>;
> +                                };
> +                        };
> +                };
> +        };
> +    };
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
