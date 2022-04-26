Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3E2851003E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 16:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237465AbiDZOVo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 10:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347988AbiDZOVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 10:21:44 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBE41BE89;
        Tue, 26 Apr 2022 07:18:36 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id jt15so8182758qvb.13;
        Tue, 26 Apr 2022 07:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IotXuTVQnASWXXY0Z2NxAB80U3Yq4KNzgBzYDHnnReM=;
        b=e+5IgqmXgonXbZXwhcvWTpr/hJg6mG6H/b9WjsjOqyJoBpymXTlnEZOP1tZ1XEJ3zM
         SVCQG5rT0sDRUnpHt28SmEkt4OLR88Mip5GO0oc2lA5Ac5AIZChByV9MIgnZk0XMO+Vg
         J8LuRA/6bOpH4mJdnuGVgqgBzuLCQl+8T+4iQFIbRbwNqfr8jeBJVFh2besy+4FKfem6
         Pj9MF7Liw9ZIK9CdyfDNwSMgE9WFBTccf/HQcBp5F+cL/Q6dc3KEksYFZX1f/OusU45m
         5riRcaayYnEYFVxF032FVbu/q+S/9uycRCibZWKr5bN0ClLe5SrbSgUjWrjxjjhUe5Jt
         OyMA==
X-Gm-Message-State: AOAM530hs05NuJl/uFxQk31xHozvsQkMtNrv9CJ/4srLMhQ4CJkoc+vv
        Xj77gdDUMUmRVjhgP1+FbUjvZj8Ywzo0mQ==
X-Google-Smtp-Source: ABdhPJwiWjMnBa/2aooSZA1ZeRFo6XP5oOeeoaCvGC0wnNxrHg3nNS1zHisepw8wvHCjBOzA73aIHg==
X-Received: by 2002:a05:6214:27e9:b0:456:2f4f:c80 with SMTP id jt9-20020a05621427e900b004562f4f0c80mr10886402qvb.108.1650982714903;
        Tue, 26 Apr 2022 07:18:34 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id b21-20020a05620a271500b0069ed3222674sm5999838qkp.98.2022.04.26.07.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 07:18:34 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2ef5380669cso183741297b3.9;
        Tue, 26 Apr 2022 07:18:34 -0700 (PDT)
X-Received: by 2002:a81:4782:0:b0:2eb:1cb1:5441 with SMTP id
 u124-20020a814782000000b002eb1cb15441mr20874829ywa.479.1650982714234; Tue, 26
 Apr 2022 07:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com> <20220330154024.112270-2-phil.edworthy@renesas.com>
In-Reply-To: <20220330154024.112270-2-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 16:18:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyWBoR=0zHBGKVYOw5p4fOJ_zAh5N07tCiM8L78SDXcw@mail.gmail.com>
Message-ID: <CAMuHMdWyWBoR=0zHBGKVYOw5p4fOJ_zAh5N07tCiM8L78SDXcw@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] dt-bindings: arm: renesas: Document Renesas
 RZ/V2M SoC and EVK board
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 30, 2022 at 5:40 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Details of the SoC can be found here:
> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-cortex-a-mpus/rzv2m-dual-cortex-a53-lpddr4x32bit-ai-accelerator-isp-4k-video-codec-4k-camera-input-fhd-display-output
>
> The RZ/V2M Evaluation Kit (V2MEVK) consists of the RZ/V2M Main Board,
> RZ/V2M Base Board, and CIS IMX415 Board (CIS).
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
