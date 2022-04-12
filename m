Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA7524FDDBC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 13:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234602AbiDLLPf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 07:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240236AbiDLLLw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 07:11:52 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DB89155A;
        Tue, 12 Apr 2022 03:02:02 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id j6so13283723qkp.9;
        Tue, 12 Apr 2022 03:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/GJevxi4v3BdwCsfHixr17F9OepLpLQ7iEJJh8wLkyU=;
        b=AO3J8urHttTtYA06r0gJPGTDVpsOI3Oj00U9aeawm0601Myw91bbD7wKFqkeHBk0ZC
         /vHO+6MIXPrIYu3Kxa49spgbzXsn+c2xaS7dVdJMtPmCOmi2AYTd1Nn9t0Q5NzO5EfXu
         1YHauhctxcK5okdOqKeSrPGGfW/0bQkYb8roc+I6wiWt1dG9819fpErmsk41vkW16uS1
         WKNwP1HZiUQcQPQ6DdrhzWUoB5A5tWjJq0qH6QrfehCaxR7AXcedqnZdj3yElnB+kKMN
         EXGwq5HUAFV/SVzxorylnA+DY6D0d/4EDkbDD8CGeYSyibYu/8hlFOOWRVUSUKfcHpQB
         4Ymw==
X-Gm-Message-State: AOAM531rwcxa9eFK1o21qtzTQb8BSGVQs1wYZgcUYVIKpxT4yCi+3sQq
        yoeUaFXBxfln1B4UbixClpG2YmX9pD7G0qYM
X-Google-Smtp-Source: ABdhPJyGS1evhRrwEhEAPSbX6U3zazbBr5lUiGQJhy5JDfL6dpXIO40l65ocb2Ez0L3ujwFR6jewZw==
X-Received: by 2002:a05:620a:21cb:b0:69c:34ad:3298 with SMTP id h11-20020a05620a21cb00b0069c34ad3298mr2395956qka.660.1649757720641;
        Tue, 12 Apr 2022 03:02:00 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id f19-20020a05620a409300b00680c933fb1csm24420578qko.20.2022.04.12.03.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 03:02:00 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2ebebe631ccso110752487b3.4;
        Tue, 12 Apr 2022 03:01:59 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr29214841ywi.449.1649757719734; Tue, 12
 Apr 2022 03:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com> <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 12:01:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKDn3tAS01vm7be9SF0=rsWLMD1vxmNtdTyhHHBJHrtw@mail.gmail.com>
Message-ID: <CAMuHMdUKDn3tAS01vm7be9SF0=rsWLMD1vxmNtdTyhHHBJHrtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Mar 16, 2022 at 2:11 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Extend the Renesas DU display bindings to support the r9a07g044l
> DU module found on RZ/G2L LCDC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -40,6 +40,7 @@ properties:
>        - renesas,du-r8a77990 # for R-Car E3 compatible DU
>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU

"renesas,du-r9a07g044"? Both RZ/G2L and RZ/G2LC have an LCDC.
I believe the lack of parallel data support on RZ/G2LC is just a
limitation of the package?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
