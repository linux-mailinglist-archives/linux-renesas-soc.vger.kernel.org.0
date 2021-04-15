Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6BA361075
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 18:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234209AbhDOQxf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 12:53:35 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:40462 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233583AbhDOQxf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 12:53:35 -0400
Received: by mail-ot1-f50.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so23170172otb.7;
        Thu, 15 Apr 2021 09:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BkPRrq2X8pI/PWJmFc2vGqD8uKorT4TSwv8nxW2F7tY=;
        b=mLM4E9i5RJbZ9q2A9jXK5SdM41xPUevZ88cip6A74u8QQp9uWQvfZIO1AtkvIurWbQ
         5DZWW/w3nvWTfGY4xQg0hU9RFosxRzB3jjgIGLtN72WRMjpdcj8Tp3GNRjPIyPO6wBjP
         M0Ofbdf72ZWPQT9sEpgYIsLremdhlHVsQUZEQGtcDkcUqNfopMF7pdq2mb7+Op0hLyWL
         N7yKhAhq1UK9HoIYeXhJaGKASINRvVYpNbhC93KqTut9cYooXGLJonIyb/PIyasXCX+f
         ovImRHd15kwBUr9EikQLnMpc8JHyYM6wrbIFG+mcz9nJZQ3oEsftsbiS2btow5UpkOYz
         VFjg==
X-Gm-Message-State: AOAM5324M9ksdDGrkM9+HYh1Ic4fKrEtS8P0vyyMzdYpmHTtGiTP2jCk
        ujlIPu7wnnpsKmRVH0uCEA==
X-Google-Smtp-Source: ABdhPJzA7edpjMrFZYgGmlpgqiNAm4TmvK2c2cIzF1IKc+l7PY5NsWG3cwQmqz49K5TQdDTwZW6aSQ==
X-Received: by 2002:a9d:a2a:: with SMTP id 39mr147491otg.371.1618505591354;
        Thu, 15 Apr 2021 09:53:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t19sm788585otm.40.2021.04.15.09.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 09:53:10 -0700 (PDT)
Received: (nullmailer pid 1551645 invoked by uid 1000);
        Thu, 15 Apr 2021 16:53:09 -0000
Date:   Thu, 15 Apr 2021 11:53:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: media: max9286: Define
 'maxim,gpio-poc'
Message-ID: <20210415165309.GA1535842@robh.at.kernel.org>
References: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
 <20210415122602.87697-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415122602.87697-3-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 15, 2021 at 02:25:57PM +0200, Jacopo Mondi wrote:
> Define a new vendor property in the maxim,max9286 binding schema.
> 
> The new property allows to declare that the remote camera
> power-over-coax is controlled by one of the MAX9286 gpio lines.
> 
> As it is currently not possible to establish a regulator as consumer
> of the MAX9286 gpio controller for this purpose, the property allows to
> declare that the camera power is controlled by the MAX9286 directly.
> 
> The property accepts a gpio-index (0 or 1) and one line polarity
> flag as defined by dt-bindings/gpio/gpio.h.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml     | 71 ++++++++++++++++++-
>  1 file changed, 70 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index 0e7162998b77..e2422241b7d0 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -70,6 +70,28 @@ properties:
>        a remote serializer whose high-threshold noise immunity is not enabled
>        is 100000 micro volts
>  
> +  maxim,gpio-poc:
> +    $ref: '/schemas/types.yaml#/definitions/uint32-array'
> +    minItems: 2
> +    maxItems: 2
> +    description: |
> +      Index of the MAX9286 gpio output line (0 or 1) that controls Power over
> +      Coax to the cameras and its associated polarity flag.
> +
> +      The property accepts an array of two unsigned integers, the first being
> +      the gpio line index (0 or 1) and the second being the gpio line polarity
> +      flag (GPIO_ACTIVE_HIGH or GPIO_ACTIVE_LOW) as defined in
> +      <include/dt-bindings/gpio/gpio.h>.
> +
> +      When the remote cameras power is controlled by one of the MAX9286 gpio
> +      lines, this property has to be used to specify which line among the two
> +      available ones controls the remote camera power enablement.
> +
> +      When this property is used it is not possible to register a gpio
> +      controller as the gpio lines are controlled directly by the MAX9286 and
> +      not available for consumers, nor the 'poc-supply' property should be
> +      specified.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -182,7 +204,20 @@ required:
>    - reg
>    - ports
>    - i2c-mux
> -  - gpio-controller
> +
> +# If 'maxim,gpio-poc' is present, then 'poc-supply' and 'gpio-controller'
> +# are not allowed.
> +if:
> +  required:
> +    - maxim,gpio-poc
> +then:
> +  allOf:
> +    - not:
> +        required:
> +          - poc-supply
> +    - not:
> +        required:
> +          - gpio-controller

I did tell you to do it this way on irc, but looking at it again, it's 
slightly more concise to do:

     properties:
       poc-supply: false
       gpio-controller: false

Note that 'properties' in the 'if' doesn't work because a schema 
for a property evaluates as true when the property is not present.

Either way,

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
