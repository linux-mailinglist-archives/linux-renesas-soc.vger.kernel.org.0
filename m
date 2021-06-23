Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24853B1A86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 14:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhFWM4D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 08:56:03 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:43757 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhFWM4D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 08:56:03 -0400
Received: by mail-vs1-f49.google.com with SMTP id v12so1348047vsg.10;
        Wed, 23 Jun 2021 05:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P76n6RiaHARTNJx4hBu1PTQcMcnpO5X4D5Pt6jdXVrM=;
        b=eDBklfAVBLqKexaYWEmmuFD2OtT1H9r5A3Okg4gP9Zov2k33ovQyvKgyK0paZ5uO1F
         Qqzb7DxIXZ/hUkZ068qd/qvo9vRlONzTnUY0uAkx8RP/qdmrE1fiw6sLQb+FR/EXtNcZ
         2N74pyu6bwZPyss4/s6RhkCK+OccS5H/EUYy+2YKXoUaEulj/Mg+VFS7BN6fZDR++I2i
         HF4pGhQ7ptrxllxSTSRRx5QjK98FPSKLUcQRSYXH4avwrai0htexj5jI79Y1FL/wnyHe
         ybEpV10vHXVCkHJDTuP8VQ6KHpES7vOgX9YMSSAvi0DDQQYD4xJfQPKu+/TLf3VpMdoS
         KYag==
X-Gm-Message-State: AOAM531RAl91xu3vqPC4HUKcSR1cCCqcW0VJk0Q+x4zHpkQnr4s8koPx
        qyCGbl6MVurW5HEpCv7JdKxmqDyMW4nxt7tY2qg=
X-Google-Smtp-Source: ABdhPJzQtwkx6Vol4T8y0aFn6deUBrbclNdnvtkKHC32EZvJE81p6+UAva6S9Ij1VyIOK4AEw4OeUADP2euokpub3lI=
X-Received: by 2002:a67:ba0c:: with SMTP id l12mr1120114vsn.40.1624452824812;
 Wed, 23 Jun 2021 05:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210622231146.3208404-1-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210622231146.3208404-1-kieran.bingham@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 14:53:33 +0200
Message-ID: <CAMuHMdW8vYC3+gVCv5eG_vkX79vU8RQL-6fSJd9McetDzikzSA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Provide bindings for r8a779a0
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Jun 23, 2021 at 1:11 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> Extend the Renesas DU display bindings to support the r8a779a0 V3U.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks for your patch!

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
> @@ -774,6 +775,57 @@ allOf:
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
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1
> +
> +        clock-names:
> +          items:
> +            - const: du.0
> +            - const: du.1

The hardware block has only a single function clock for both channels,
like on R-Car H1.

And what about DU_DOTCLKIN?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
