Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B658550B230
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 09:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381163AbiDVH5J convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 03:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445182AbiDVH5E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 03:57:04 -0400
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AFF522D1;
        Fri, 22 Apr 2022 00:53:54 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id e17so5467458qvj.11;
        Fri, 22 Apr 2022 00:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tggspirRgaeR4RvyIWiBijycx+/HqfnmFSxlQfeFHJc=;
        b=lEJAnJddX3wpQLAEplU40Hdxsp1ZnqA0LYE72ZNNJlWnJ52GxEpXFjPb++3QROPL7c
         XhRjQ2UTN62nooKJMDNuX3ayLkZ/ewNMsatutu+6cIZYAKcdG5vjkZRDJ09udEs7MaSP
         JdD76PcTqQoqZmZZZlp6qGK+xR2NFv4vo9UkTAC3N9LkNCvbectdU3p71F0d9SJ/6NKW
         887TueGcny8eQ0057vvsbzsYT7zYasG0HsoXN3rVvUbdYuZ9rBiTrnvTF5xz0MdhCy5i
         yobEVp6bt9C6jBUYIZ13RNAP3xDGRX8EGS4s93Hr2YB5C9UzrS9FPeNQh2kPpRoXpOdR
         EnAg==
X-Gm-Message-State: AOAM533fyPqBWyY4SYx12XCNSrOCqH5d/Zfqygwlp2uLpmLX/EA9s58N
        +5TcV+uaEa4L0RpXekUJx4lBj+KKDY+2NQ==
X-Google-Smtp-Source: ABdhPJyuAEEHFnEEY+HBvugxgQ4rtKfWFUDmG9ji9rQAN3I06hLpT/3dnZ5UDIhKDKi4Bb+7GtT4Ag==
X-Received: by 2002:a05:6214:d02:b0:441:824a:a99a with SMTP id 2-20020a0562140d0200b00441824aa99amr2349431qvh.69.1650614033849;
        Fri, 22 Apr 2022 00:53:53 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id a23-20020a05620a103700b00699d49c511dsm591586qkk.104.2022.04.22.00.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 00:53:53 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2ec04a2ebadso76931447b3.12;
        Fri, 22 Apr 2022 00:53:53 -0700 (PDT)
X-Received: by 2002:a81:4f0d:0:b0:2ec:1556:815 with SMTP id
 d13-20020a814f0d000000b002ec15560815mr3603625ywb.256.1650614033040; Fri, 22
 Apr 2022 00:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com> <20220421163128.101520-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220421163128.101520-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Apr 2022 09:53:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMmkY+_O_oyKeumuOqNvw_KJaDxuiwrETc3W-kCV2MCg@mail.gmail.com>
Message-ID: <CAMuHMdWMmkY+_O_oyKeumuOqNvw_KJaDxuiwrETc3W-kCV2MCg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: Document Renesas RZ/G2L DU bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Apr 21, 2022 at 6:31 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The RZ/G2L LCD controller is composed of Frame Compression Processor
> (FCPVD), Video Signal Processor (VSPD), and Display Unit (DU).
>
> The DU module supports the following hardware features
> − Display Parallel Interface (DPI) and MIPI LINK Video Interface
> − Display timing master
> − Generates video timings
> − Selecting the polarity of output DCLK, HSYNC, VSYNC, and DE
> − Supports Progressive
> − Input data format (from VSPD): RGB888, RGB666
> − Output data format: same as Input data format
> − Supporting Full HD (1920 pixels x 1080 lines) for MIPI-DSI Output
> − Supporting WXGA (1280 pixels x 800 lines) for Parallel Output
>
> This patch document DU module found on RZ/G2L LCDC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/renesas,rzg2l-du.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L Display Unit (DU)
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  These DT bindings describe the Display Unit embedded in the Renesas RZ/G2L
> +  and RZ/V2L SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,du-r9a07g044c # for RZ/G2LC compatible DU
> +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU

Please use the format "<manuf>,<soc>-<modulo>" for new bindings.

I thought there was no need to differentiate RZ/G2LC and RZ/G2L, as
the only difference is a wiring difference due to the limited number
of pins on the RZ/G2LC package, as per your confirmation[1]?
Hence please just use "renesas,r9a07g044-du".

Do you want a family-specific compatible value ("rzg2l-"), as this
IP block is shared by (at least) RZ/GL(C), RZ/V2L, and RZ/G2UL?

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r9a07g044c
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI 0
> +          required:
> +            - port@0
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r9a07g044l
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: DSI 0
> +          required:
> +            - port@0
> +            - port@1

Having different port numbers for the common DSI0 output indeed
complicates matters ;-)

[1] https://lore.kernel.org/r/OS0PR01MB5922C4C58329F538A418547886ED9@OS0PR01MB5922.jpnprd01.prod.outlook.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
