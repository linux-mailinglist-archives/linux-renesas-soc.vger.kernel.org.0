Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5B63B7FF7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 11:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbhF3JcR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 05:32:17 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:39817 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233541AbhF3JcR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 05:32:17 -0400
Received: by mail-ua1-f42.google.com with SMTP id k9so771551uaq.6;
        Wed, 30 Jun 2021 02:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I0DU43SVWZn+SOkoLNZ84J8luwY/ZlxJfuH0H4d14i4=;
        b=eVxkaoiHbIOtwdwCUmMpezKVpygl1Wg6Z6Fsqn2kKeoMFoXI5bv8sElIxMr5F+xfEn
         upSJi7CKe2Wqs8eeCzMEoWttTGYI00GeQBMaYMfqhKDkAsX8qOizBwMbQXj6F9FcnGV6
         +p7iI+JX1UUJjReOQOGeJGRAz6qkWD3FoDl9Q45VrLDKixRcWPEL9CPiIE8Yi1a7/L0L
         HC0krmyZdNxlDgWeICnbZ+HQ3XwqzDa6rgkhd3+zZVAxSGSLsGZYoL+WQ8RhoDMdrVV7
         bHogdQbug7U23kJRZpvwLpbY+/ikLR7N+qN1eKyx/CmQUeKuJOoQeS5cd6/sjeZxbFWB
         NSlg==
X-Gm-Message-State: AOAM53060q8EBJTLVcfEGWHZSPrTPgbbxYI8FbwL/OukBujUzAU/cgGy
        yxQXn8RsyTlGBdfwY0LjqGl2DK1M2thlDw66Vz9bmB2w+5E=
X-Google-Smtp-Source: ABdhPJytiVG3ezpA2xgfdSxGL51grHSv4XgTD5FuC9yFwlYUBojMLqL9CRVX+IIbr0aw/sn1FrEaT837Ay4C3Wczfco=
X-Received: by 2002:ab0:484b:: with SMTP id c11mr32041601uad.100.1625045387432;
 Wed, 30 Jun 2021 02:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com> <20210630073013.22415-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210630073013.22415-8-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 30 Jun 2021 11:29:36 +0200
Message-ID: <CAMuHMdWbhY9i+WvV77LVNYhLBLQBVCojgEwM93A-pvFf9Eab1g@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thanks for your patch!

On Wed, Jun 30, 2021 at 9:31 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document USB phy bindings for RZ/G2L SoC.
>
> RZ/G2L USB2.0 phy uses line ctrl register for OTG_ID pin changes. Apart
> from this it uses a different OTG-BC interrupt bit for device recognition.

Nothing about resets? But see below...

>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
>  * Created a new compatible for RZ/G2L as per Geert's suggestion.
>  * Added resets required properties for RZ/G2L SoC.
> ---
>  .../bindings/phy/renesas,usb2-phy.yaml         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> index d5dc5a3cdceb..a7e585ff28dc 100644
> --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> @@ -30,6 +30,9 @@ properties:
>                - renesas,usb2-phy-r8a77995 # R-Car D3
>            - const: renesas,rcar-gen3-usb2-phy
>
> +      - items:
> +          - const: renesas,usb2-phy-r9a07g044 # RZ/G2{L,LC}
> +
>    reg:
>      maxItems: 1
>
> @@ -91,6 +94,21 @@ required:
>    - clocks
>    - '#phy-cells'
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,usb2-phy-r9a07g044
> +    then:
> +      properties:
> +        resets:
> +          items:
> +            - description: USB phy reset
> +            - description: reset of USB 2.0 host side

Do you need the second reset?
Looking at your .dtsi patch, the second reset is shared with ehci/ohci,
so perhaps it makes sense to drop it from the phy node?

> +      required:
> +        - resets
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
