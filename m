Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC0FB1A54
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2019 10:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387692AbfIMI7U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Sep 2019 04:59:20 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:44340 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387499AbfIMI7U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Sep 2019 04:59:20 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5B55625AEB1;
        Fri, 13 Sep 2019 18:59:18 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 545EF940513; Fri, 13 Sep 2019 10:59:16 +0200 (CEST)
Date:   Fri, 13 Sep 2019 10:59:16 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: arm: renesas: Convert 'renesas,prr' to
 json-schema
Message-ID: <20190913085915.jlsvhgmkmunsjxsy@verge.net.au>
References: <20190908120528.9392-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190908120528.9392-1-horms+renesas@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Sep 08, 2019 at 01:05:28PM +0100, Simon Horman wrote:
> Convert Renesas Product Register bindings documentation to json-schema.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Apologies Geert,

this patch was supposed to be addressed to you rather than myself.

> ---
> Based on v5.3-rc1
> Tested using:
>   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/renesas,prr.yaml
> 
> v2
> * Use simple enum for compat values
> * Drop "" from compat values
> * Only supply 'maxItems' property to 'reg'
> ---
>  .../devicetree/bindings/arm/renesas,prr.txt        | 20 -------------
>  .../devicetree/bindings/arm/renesas,prr.yaml       | 35 ++++++++++++++++++++++
>  2 files changed, 35 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.txt b/Documentation/devicetree/bindings/arm/renesas,prr.txt
> deleted file mode 100644
> index 08e482e953ca..000000000000
> --- a/Documentation/devicetree/bindings/arm/renesas,prr.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Renesas Product Register
> -
> -Most Renesas ARM SoCs have a Product Register or Boundary Scan ID Register that
> -allows to retrieve SoC product and revision information.  If present, a device
> -node for this register should be added.
> -
> -Required properties:
> -  - compatible: Must be one of:
> -    "renesas,prr"
> -    "renesas,bsid"
> -  - reg: Base address and length of the register block.
> -
> -
> -Examples
> ---------
> -
> -	prr: chipid@ff000044 {
> -		compatible = "renesas,prr";
> -		reg = <0 0xff000044 0 4>;
> -	};
> diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.yaml b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
> new file mode 100644
> index 000000000000..7f8d17f33983
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/renesas,prr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Product Register
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +  - Magnus Damm <magnus.damm@gmail.com>
> +
> +description: |
> +  Most Renesas ARM SoCs have a Product Register or Boundary Scan ID
> +  Register that allows to retrieve SoC product and revision information.
> +  If present, a device node for this register should be added.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,prr
> +      - renesas,bsid
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    prr: chipid@ff000044 {
> +        compatible = "renesas,prr";
> +        reg = <0 0xff000044 0 4>;
> +    };
> -- 
> 2.11.0
> 
