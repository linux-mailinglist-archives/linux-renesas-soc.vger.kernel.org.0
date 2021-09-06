Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F72C40179F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 10:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240260AbhIFIOY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 04:14:24 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:35572 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239780AbhIFIOX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 04:14:23 -0400
Received: by mail-ua1-f41.google.com with SMTP id r20so3387595uat.2;
        Mon, 06 Sep 2021 01:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=El6II9rB5uKfaEROETT00Ms0bZLQwJYXTBT5qb9haVU=;
        b=TGFFEvB/x299FZo4TGJtQf4R5BOB6qlxRR0zTDGhd7X9NFrfFsgqM6fwdhuCuXgyFq
         JmIBIYfo9/mvqyZzK4HLabflgPHnzhMN34/O+maVDOBf4GBlXbTB1xgAuC0fJX83vBh5
         LwGiJCVBUUeqaACEF61P6m80LUszSCb/hOSjUiyakA83ZVuyA/lmSfTYv0eefHB8ZCyG
         Syb4tV6CkOtoBvNpPo4sn3NRt9taksx2Cd7/ggCF1CO48JeGgetJUuA71XnXrClI+SXH
         Bb+eVbFsOEU0x0/7gL8JKf2Qs+480amld+52mHjywqUkTVHhacS4ILTPHLSOZIMCLqaH
         KKbQ==
X-Gm-Message-State: AOAM532x//l7ZgwklPwdaL6kGeZ4N9CUZu9jS3AwpmICmSzLkhvLPRrY
        dZwOEsV69n4T1SOXdqQp/p2E4Rl4bimTuG5GIsxI6eg4
X-Google-Smtp-Source: ABdhPJzUfUN15fPzya4j7EGBZro+j88bO5jSNOlVlnA4bbS5/lIkX5ZUZqZnJB3cZOGBvwDoAjATKNco4f4YLMu+fbg=
X-Received: by 2002:ab0:2989:: with SMTP id u9mr4677806uap.122.1630915998555;
 Mon, 06 Sep 2021 01:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210901233655.1602308-1-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210901233655.1602308-1-kieran.bingham@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 10:13:07 +0200
Message-ID: <CAMuHMdXHAfg3_VoeXUBT2-QceLR9KQ3pWjz+5=-wK1QRxK14bw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: renesas,du: Provide bindings for r8a779a0
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

On Thu, Sep 2, 2021 at 1:39 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Extend the Renesas DU display bindings to support the r8a779a0 V3U.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - Collected Laurent's tag
>  - Remove clock-names requirement
>  - Specify only a single clock

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
> +            - const: du
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

This is now inconsistent with clock-names, which doesn't use a suffix.

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

Same here, as clock-names is not required anymore.

> +        - renesas,vsps
> +
>  additionalProperties: false
>
>  examples:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
