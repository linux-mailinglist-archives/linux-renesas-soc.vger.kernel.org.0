Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873782DDC3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 01:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730700AbgLRAAD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 19:00:03 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:33457 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbgLRAAC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 19:00:02 -0500
Received: by mail-ot1-f53.google.com with SMTP id b24so376472otj.0;
        Thu, 17 Dec 2020 15:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dZKU/N2rDiGepmdHI+QIgWAOTCpJLi/HFXnkkGcjIQU=;
        b=eJ0ohjnarKDZS+MdT9phKSiYfT140OqlpQSVnliJS5NIOqEU7xV4sFQPL/JPKCkAFq
         PwlbIjGPTRwduXoniNFkUbcZsjT3bgBSgBGHgjd9Io8ivGCMOdVkPO/ZWu+ExR8K4XPy
         DZ70ljMqo4rp+a1znne4egQC4SD4tLUbIhiOARcme1O7RA9WncdUkkPeVg80ND5oDVmi
         0KSwg9NErUiX9XlVNnc811d+t92gs/vdd7+sb5QszUnFi5+UA4jhO02qouFVy0/n6ZVl
         bHzf39nr5D73s/4Ocx08i9q0l+Oiq+W7PaT8TeNDbbyv9J3MYJykWES0aM7zItneQOlj
         NbxQ==
X-Gm-Message-State: AOAM531fZe9au4B5MvuTEQTjKFTFYFerkWkwCXy6Ow5Fbk8Zott23o11
        h7vVGz+1LCxNVsgPmGufgQ==
X-Google-Smtp-Source: ABdhPJx4mqUeErTL5zMTBG9YHJaYCyB14MvsYiFFvSs7b9kRlnfDD+EsJoTB3qoU6UXWgac5Fd2V3A==
X-Received: by 2002:a05:6830:22d3:: with SMTP id q19mr1007264otc.115.1608249561757;
        Thu, 17 Dec 2020 15:59:21 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r14sm1571010ote.28.2020.12.17.15.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 15:59:20 -0800 (PST)
Received: (nullmailer pid 467139 invoked by uid 1000);
        Thu, 17 Dec 2020 23:59:19 -0000
Date:   Thu, 17 Dec 2020 17:59:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Adam Ford <aford173@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clk: versaclock5: Miscellaneous fixes and
 improvements:
Message-ID: <20201217235919.GA456454@robh.at.kernel.org>
References: <20201216145231.1344317-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216145231.1344317-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 16, 2020 at 03:52:31PM +0100, Geert Uytterhoeven wrote:
>   - Add reference to clock.yaml, and switch to unevaluatedProperties, to
>     stop complaining about the presence of "assigned-clock-rates" and
>     "assigned-clocks" in board DTS files,
>   - Fix typo in "idt,voltage-microvolts" property name, to match example
>     and driver code,
>   - Add missing reference for "idt,voltage-microvolts",
>   - Add missing "additionalProperties: false" for subnodes, to catch
>     typos in properties,
>   - There is no reason to wrap the (single) if condition in an allOf
>     block,

True, but more future proof with it and unnecessary churn IMO.

>   - Fix obsolete property names in example.
> 
> Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Notes:
>   1. The use of "idt,voltage-microvolts" (with trailing S) is a bit
>      unfortunate, as Documentation/devicetree/bindings/property-units.txt
>      suggests to not have the trailing edge.
>      Can we still fix the driver and bindings?  While this entered
>      uptstream in v5.9, there are no users in next-20201216.
> 
>   2. Due to "clock-output-names" being part of
>      dt-schema/schemas/clock/clock.yaml, the presence of this property
>      does not trigger an error.  Adding "clock-output-names: false"
>      can fix that.  But given this property is deprecated, except for
>      very specific use cases, explicitly allowing it for those few use
>      cases would be better.
> ---
>  .../bindings/clock/idt,versaclock5.yaml       | 53 ++++++++++---------
>  1 file changed, 29 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> index 2ac1131fd9222a86..14851e76f6342095 100644
> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> @@ -33,6 +33,9 @@ description: |
>  maintainers:
>    - Luca Ceresoli <luca@lucaceresoli.net>
>  
> +allOf:
> +  - $ref: clock.yaml#

No, that's not right. clock.yaml is already applied unconditionally.

You need to define assigned-clocks, etc. here just like 'clocks' and 
define how many entries. Or convince me they should be allowed on any 
node.

> +
>  properties:
>    compatible:
>      enum:
> @@ -73,40 +76,42 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          minimum: 0
>          maximum: 6
> -      idt,voltage-microvolt:
> +      idt,voltage-microvolts:

Can we fix the driver? No in tree users...

>          description: The output drive voltage.
> +        $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [ 1800000, 2500000, 3300000 ]
>        idt,slew-percent:
>          description: The Slew rate control for CMOS single-ended.
>          $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [ 80, 85, 90, 100 ]
>  
> +    additionalProperties: false
> +
>  required:
>    - compatible
>    - reg
>    - '#clock-cells'
>  
> -allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          enum:
> -            - idt,5p49v5933
> -            - idt,5p49v5935
> -    then:
> -      # Devices with builtin crystal + optional external input
> -      properties:
> -        clock-names:
> -          const: clkin
> -        clocks:
> -          maxItems: 1
> -    else:
> -      # Devices without builtin crystal
> -      required:
> -        - clock-names
> -        - clocks
> -
> -additionalProperties: false
> +if:
> +  properties:
> +    compatible:
> +      enum:
> +        - idt,5p49v5933
> +        - idt,5p49v5935
> +then:
> +  # Devices with builtin crystal + optional external input
> +  properties:
> +    clock-names:
> +      const: clkin
> +    clocks:
> +      maxItems: 1
> +else:
> +  # Devices without builtin crystal
> +  required:
> +    - clock-names
> +    - clocks
> +
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> @@ -135,13 +140,13 @@ examples:
>              clock-names = "xin";
>  
>              OUT1 {
> -                idt,drive-mode = <VC5_CMOSD>;
> +                idt,mode = <VC5_CMOSD>;
>                  idt,voltage-microvolts = <1800000>;
>                  idt,slew-percent = <80>;
>              };
>  
>              OUT4 {
> -                idt,drive-mode = <VC5_LVDS>;
> +                idt,mode = <VC5_LVDS>;
>              };
>          };
>      };
> -- 
> 2.25.1
> 
