Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 324DE5236A6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 May 2022 17:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241641AbiEKPED (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 May 2022 11:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237091AbiEKPEB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 May 2022 11:04:01 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FEC3B3D9;
        Wed, 11 May 2022 08:04:00 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id w130so3089476oig.0;
        Wed, 11 May 2022 08:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K2evvn9klzsMhwX82pTe24yAX2JmTp6isBMJsL/SQV4=;
        b=Bxr6JdHOJKJhSm+R5/84EJaSvHc6hFVkD39KOl33VzkUPhFt81fglWOHaPqn8jOrFJ
         EeLdjd1EeoljN97ghljC1g43yYgMFwzmPxVO7kDIwOzto971dTW4jo3MgDJCCVtflhL6
         aiG89d94N9fQWqOSKYxjSl6I/C7bQzkAqwKQHmKxOu0eYfWlRKZ+y18ZSbFa4ZXdJbtY
         alrBdBanybsfsmqIhRzemu0gJStP7I50rGWizS3VupTwTRTlatYbJzQDXCkfGtgMfFf9
         zagtsAhICL+emT5qIgB/VqDVKQypYy1l9CUrbkFPLvZqoKJCimOQEmpz/w3XQOtU6Sxo
         umxA==
X-Gm-Message-State: AOAM53271bMu1vcHp1/RE1KprColC1YnovLvXs3V7t9Tql7seD8Si2dd
        pBoNzb5HKGhtEPVueZ9BfOa7ljDXMg==
X-Google-Smtp-Source: ABdhPJznLUgFwcBWwKLcRWf+OH0tIjOA6OzYk0qvGxxrS32rYsM1faSHtN+DUWeRWazJRKVqpvGp1Q==
X-Received: by 2002:a05:6808:a93:b0:326:4a90:5e2a with SMTP id q19-20020a0568080a9300b003264a905e2amr2639437oij.211.1652281439654;
        Wed, 11 May 2022 08:03:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t142-20020acaaa94000000b0032647f4e437sm820644oie.45.2022.05.11.08.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 08:03:59 -0700 (PDT)
Received: (nullmailer pid 310552 invoked by uid 1000);
        Wed, 11 May 2022 15:03:58 -0000
Date:   Wed, 11 May 2022 10:03:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: serial: renesas,em-uart: Add RZ/V2M
 clock to access the registers
Message-ID: <20220511150358.GA305958-robh@kernel.org>
References: <20220504094456.24386-1-phil.edworthy@renesas.com>
 <20220504094456.24386-2-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504094456.24386-2-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 04, 2022 at 10:44:55AM +0100, Phil Edworthy wrote:
> The RZ/V2M SoC has an additional clock to access the registers. The HW
> manual says this clock should not be touched as it is used by the
> "ISP Firmware".
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>  - Removed "optional" from description of clock to access the registers
> v3:
>  - New patch added
> ---
>  .../bindings/serial/renesas,em-uart.yaml      | 32 +++++++++++++++----
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> index 332c385618e1..40a03f255666 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> @@ -9,9 +9,6 @@ title: Renesas EMMA Mobile UART Interface
>  maintainers:
>    - Magnus Damm <magnus.damm@gmail.com>
>  
> -allOf:
> -  - $ref: serial.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -29,11 +26,32 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  clocks:
> -    maxItems: 1
> +allOf:
> +  - $ref: serial.yaml#
>  
> -  clock-names:
> -    const: sclk
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g011-uart
> +    then:
> +      properties:

> +        clocks:
> +          items:
> +            - description: UART functional clock
> +            - description: Internal clock to access the registers
> +        clock-names:
> +          items:
> +            - const: sclk
> +            - const: pclk

Better to put all this at the top level with 'minItems: 1' and then use 
minItems/maxItems in the if/then schema to define which platforms have 1 
or 2 clocks.

> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: UART functional clock
> +        clock-names:
> +          items:
> +            - const: sclk
>  
>  required:
>    - compatible
> -- 
> 2.32.0
> 
> 
