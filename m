Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC073706CD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 May 2021 12:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbhEAKWi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 May 2021 06:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbhEAKWi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 May 2021 06:22:38 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C3BC06138B
        for <linux-renesas-soc@vger.kernel.org>; Sat,  1 May 2021 03:21:47 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id l22so1098458ljc.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 May 2021 03:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RJf3R/6ORYmECKFTMOWMQeQMxCL0/BK87cJjMH8iXV0=;
        b=Er7O6AwduUekdWIO2v/YMO1AZAz8UhK+HeoY9jjd/J9OEe+0enUt3rs4OMTwN4aS2V
         pGfYcdRsLcOu1/7T+rmNJAmJiMRW6NYbtBMnqkHNEbZXhllM2nFqOhhmjErhx8ureygb
         B0YTccpcUiiAPsIyIS1vfsY3hqZp1AKv6h21weJO7FIjmv+8N4w5VM0xOB7VfPW7ykz7
         3t8Cwd+4MDrStQXhz2TM4KHYMDYmRJfUtRNO10Wrjm8l7OMHlCwMbpXAU5U89zsToIJQ
         5Ugdfslpw41K25I1vas5T/N5p9WZkxjQRnF3c4x4usGKIF+zjAUmWx0Qs2g+M/F00y9j
         DtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RJf3R/6ORYmECKFTMOWMQeQMxCL0/BK87cJjMH8iXV0=;
        b=f5yN1B6pVwolpw7q7OO+64CPgpGzXot03fF+7Hn1B7GZejoB6vM6cOkLoD7hvZ8mke
         I+HoT3Pz02hZbVUjiaudvpvgEe8CzWjpakr2AiOXsrYhU2lQgnt/ftZAL9BT5rW0MYLD
         H0Tjoxeurhaau/N3QEfY8cCEDzrTpxMPaS7hv0JkrXkQKntgaxAqIux8lfyOc6meCD3j
         zA2dSSrvYz0Uf+0ICmiC7dHBjeZaBvLg4+UPXYFX+vfeIDd0Lv3fH3C5hD0lODKNz1rY
         oqZAmfaWjW40+itHcnmNu9gXrlFsfopFktmssKLKl8Vrk29GyrRkzrv5DdTh4WEMD/tN
         Gu0w==
X-Gm-Message-State: AOAM532ptw6wuzHXAoZ0thAWc96+a9hoyFzEZowfGOPjugDUrD8Er7Au
        jwmhq/n4NXPnfJbvszf67wDIWw==
X-Google-Smtp-Source: ABdhPJxH+DxGUlCkv7Ot3x6EzyDm1Dq8tkOi7DwswaYpQ5ZIeVEg1Tc/5lLmdfY3EvKd6EbgbBN5sg==
X-Received: by 2002:a2e:85cb:: with SMTP id h11mr6547231ljj.12.1619864505879;
        Sat, 01 May 2021 03:21:45 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id x62sm536251lff.295.2021.05.01.03.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 03:21:43 -0700 (PDT)
Date:   Sat, 1 May 2021 12:21:42 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,vin: Make resets optional on
 R-Car Gen1
Message-ID: <YI0rtsG7nbRsrI6d@oden.dyn.berto.se>
References: <217c8197efaee7d803b22d433abb0ea8e33b84c6.1619700314.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <217c8197efaee7d803b22d433abb0ea8e33b84c6.1619700314.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2021-04-29 14:45:52 +0200, Geert Uytterhoeven wrote:
> The "resets" property is not present on R-Car Gen1 SoCs.
> Supporting it would require migrating from renesas,cpg-clocks to
> renesas,cpg-mssr.
> 
> Fixes: 905fc6b1bfb4a631 ("dt-bindings: rcar-vin: Convert bindings to json-schema")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Note that VIN is not yet enabled in r8a777[89].dtsi.
> ---
>  .../bindings/media/renesas,vin.yaml           | 46 ++++++++++++-------
>  1 file changed, 29 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> index 79c936b313ea91ae..19fccc2fd8ece120 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -194,23 +194,35 @@ required:
>    - interrupts
>    - clocks
>    - power-domains
> -  - resets
> -
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - renesas,vin-r8a7778
> -          - renesas,vin-r8a7779
> -          - renesas,rcar-gen2-vin
> -then:
> -  required:
> -    - port
> -else:
> -  required:
> -    - renesas,id
> -    - ports
> +
> +allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - renesas,vin-r8a7778
> +                - renesas,vin-r8a7779
> +    then:
> +      required:
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,vin-r8a7778
> +              - renesas,vin-r8a7779
> +              - renesas,rcar-gen2-vin
> +    then:
> +      required:
> +        - port
> +    else:
> +      required:
> +        - renesas,id
> +        - ports
>  
>  additionalProperties: false
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas S�derlund
