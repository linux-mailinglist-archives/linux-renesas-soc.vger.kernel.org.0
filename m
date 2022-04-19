Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA562506749
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 10:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245170AbiDSI7O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 04:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237640AbiDSI7N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 04:59:13 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966DF26131;
        Tue, 19 Apr 2022 01:56:31 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id s4so12996656qkh.0;
        Tue, 19 Apr 2022 01:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LjOeqfSZ1Rvs+3TDyOnSQqOYBJijn66+09FuaSFiHvE=;
        b=PCL8kYB+76UNj4OGyFlw7GzUg2FlKnTRxv4NMja8MWL9FE4lXQLkO2TEM5DMsrhB5c
         XAcKb00WLMXUjin5dzN7776jfPLwEC5NY6n2o8+84YljjxMn1Ers7XOz/6OQ6geLrEzI
         3AEMHurD1EPaQzl2SgE38/Qc4nhsxCVsF6wdNPu+yIgH87vhvduoNAWGSTUa6hbnqYVp
         x9TVA8QClw9Q+j5a0XEM9w2xfaOiwWEY7F5TBojojwv8R//WhoEwZjujiBOz5hwGIMHo
         VFGC3TQQjZJukx+KAp5jzTdW2V+I8w+o5Ay+VzoBlR9p2dE2zwtZFb7OYFB0W8GV+6ON
         AkhQ==
X-Gm-Message-State: AOAM531DSTTNYfim2nouNMuuyYy0472qkiTQKCp6mLTGWLuc/+/o08ac
        FwZiChBQTPW0bkQfzaR7MysTl5yQg+XoeA==
X-Google-Smtp-Source: ABdhPJxsIcdkjefaIaP0LmluCuCeLfScqY8uGaGmdlqDNte9QTCQfS/4R4G1Txjpty1oeJkpt+3ZTg==
X-Received: by 2002:a05:620a:1431:b0:69e:59be:1ece with SMTP id k17-20020a05620a143100b0069e59be1ecemr8808830qkj.600.1650358590603;
        Tue, 19 Apr 2022 01:56:30 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id e15-20020ac8670f000000b002e22d9c756dsm8338587qtp.30.2022.04.19.01.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 01:56:30 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-2ef4a241cc5so157765727b3.2;
        Tue, 19 Apr 2022 01:56:30 -0700 (PDT)
X-Received: by 2002:a0d:e743:0:b0:2eb:3106:9b32 with SMTP id
 q64-20020a0de743000000b002eb31069b32mr14815567ywe.512.1650358590048; Tue, 19
 Apr 2022 01:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220328064931.11612-1-biju.das.jz@bp.renesas.com> <20220328064931.11612-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220328064931.11612-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Apr 2022 10:56:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcsJDbbVrh9Uoe7Fv4o55_T=yNKh_ZGxzRgLzwURmYrQ@mail.gmail.com>
Message-ID: <CAMuHMdWcsJDbbVrh9Uoe7Fv4o55_T=yNKh_ZGxzRgLzwURmYrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Mon, Mar 28, 2022 at 8:49 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's. It
> can operate in DSI mode, with up to four data lanes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L MIPI DSI Encoder
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  This binding describes the MIPI DSI encoder embedded in the Renesas
> +  RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
> +  up to four data lanes.
> +
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,rzg2l-mipi-dsi # RZ/G2L and RZ/V2L

Do you want to define SoC-specific compatible values, or can the
IP revision be read from the hardware?

The rest LGTM (I'm no MIPI-DSI expert), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
