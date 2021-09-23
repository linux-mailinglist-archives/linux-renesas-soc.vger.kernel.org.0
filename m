Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E083B41593A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 09:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239647AbhIWHov (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 03:44:51 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:38615 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239619AbhIWHou (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 03:44:50 -0400
Received: by mail-vs1-f48.google.com with SMTP id y141so5631437vsy.5;
        Thu, 23 Sep 2021 00:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Ha/wlFhpE3wzhxqsYVFhc8UhMgQgIXbZ52hSCO/LZU=;
        b=m4IFBW2LxqIWtnTecaw+YIqcsGQdwAVme+7Twydb5eax83BSXgMt8qyCupNcLKfFjX
         UquFvnsKgcRuapXSpUETG2Xj2B0gI7c0c4eBLwlkTpoY8g5Yzb3FbL0P4jWPFIlErPs8
         M2qhu81e5l9W/uXen7p6lHSGYBk7BW5TS9Qh4+4xIm8WcSyKm7Empmrvk3Cb4+Z/fbih
         pYpumLEK+Mks07eJgmxG5H2TGeawbTJJWook3Wpuj+1WGos6SizzxoD9JyfGJYL7+hqp
         M/OrXDFh/836dpeXctIBw1FIcllPH5iMISi+x4L90t3xlfJW3hToygPt8FSPlckehlkz
         gq3Q==
X-Gm-Message-State: AOAM530b3xwAUgPOCFqTOAvOXcIwygqz2M+ZHVHSF5WmPSer4kt0vtsr
        5nKHON7ye2aHS/oMmt1i5a9ITtlKuJ0WgBq4QjAOmBT3
X-Google-Smtp-Source: ABdhPJzKQLsa6lAVIiUAQaqshZfD+cCmfuMpwO2GNU/H/yzPZqKWK1YyaY9bVHDLIhvsPRJM5ycaxYEJFPxbKcq0wx4=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr3048824vsl.9.1632382998923;
 Thu, 23 Sep 2021 00:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210922234726.3337265-1-kieran.bingham@ideasonboard.com> <20210922234726.3337265-2-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210922234726.3337265-2-kieran.bingham@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 09:43:07 +0200
Message-ID: <CAMuHMdWfcxb+5uOnPMiB2Z9rUfnRAg2Pzz--H16fOoVoASP=Kw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: display: renesas,du: Provide bindings
 for r8a779a0
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Sep 23, 2021 at 1:47 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Extend the Renesas DU display bindings to support the r8a779a0 V3U.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> ---
> v2:
>  - Collected Laurent's tag
>  - Remove clock-names requirement
>  - Specify only a single clock
>
> v3:
>  - Use clocknames: 'du.0' instead of 'du' to remain consistent

Thanks for the update!

> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -39,6 +39,7 @@ properties:
>        - renesas,du-r8a77980 # for R-Car V3H compatible DU
>        - renesas,du-r8a77990 # for R-Car E3 compatible DU
>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> +      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
>
>    reg:
>      maxItems: 1
> @@ -773,6 +774,55 @@ allOf:
>          - reset-names
>          - renesas,vsps
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a779a0
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Functional clock
> +
> +        clock-names:
> +          maxItems: 1
> +          items:
> +            - const: du.0
> +
> +        interrupts:
> +          maxItems: 2
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI 0
> +            port@1:
> +              description: DSI 1
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@1
> +
> +        renesas,vsps:
> +          minItems: 2
> +
> +      required:
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps

clock-names, for consistency?

> +
>  additionalProperties: false
>
>  examples:

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
