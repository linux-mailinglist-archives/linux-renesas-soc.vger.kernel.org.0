Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5B9519A3C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 10:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346558AbiEDIrv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 04:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbiEDIrr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:47:47 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C9223BCE;
        Wed,  4 May 2022 01:44:11 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id hh4so366619qtb.10;
        Wed, 04 May 2022 01:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aKHv/hFRaPesB5u+j5l9WpdF/n+xl8OpUTwAJzmQvWA=;
        b=0XLnPIVClY6wyvvPxJLRD9Xuck6YePHjVF0sdS7nbXs0AuUZcwd+7m4Y4N9rbpNTsq
         vtR7sffmb+9kP89DJ/i9wnBWA/6Aoui0iK2hKZR+mPRu439ohPpuhn+o9sOMBp9uO5v0
         uQLbbsmE717v/YsWwFvuhMqDNaqDE0ist1/ALrAWCes+E8UeIL1th9jlWC6kpYe8XaNH
         +vibx97Lby+0TBQheLWcGXD567KK8qToOUAqwo1dEHULp0f9pq0KINPx32fkiSFMIInN
         dZjKNwDwxRMCCSR/Wi9zV1SHvxNb9x7iFCPbl/NfI8RswqXIPomlUHsQ8BAb3K6zoKXZ
         Wfjw==
X-Gm-Message-State: AOAM530ilYPE3AY1LC6sKYzu1jk7q2y+xJ/rs0uOeJmyE2kPF9DF8w3B
        0+NN9wwdW5cFL0wMPPmM3MGaQKHoq3tzWQ==
X-Google-Smtp-Source: ABdhPJw84dsZRfM2ZqfNVnzQy7oZCqGWMY3OcecFTgyIpE044OwClnM9jhUlGlGZD/eFuKk+yDH0qg==
X-Received: by 2002:ac8:5994:0:b0:2e0:5d77:4b5c with SMTP id e20-20020ac85994000000b002e05d774b5cmr17933764qte.289.1651653850703;
        Wed, 04 May 2022 01:44:10 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id g23-20020ac84817000000b002f39b99f693sm7082046qtq.45.2022.05.04.01.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 01:44:10 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id e12so1205831ybc.11;
        Wed, 04 May 2022 01:44:09 -0700 (PDT)
X-Received: by 2002:a05:6902:352:b0:63e:94c:883c with SMTP id
 e18-20020a056902035200b0063e094c883cmr15870372ybs.365.1651653849481; Wed, 04
 May 2022 01:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com> <20220503115557.53370-4-phil.edworthy@renesas.com>
In-Reply-To: <20220503115557.53370-4-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 May 2022 10:43:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnTB8=zQZ2-iutUkVLx5BK_u0yfd7GY7fZBjSBFS8JEg@mail.gmail.com>
Message-ID: <CAMuHMdWnTB8=zQZ2-iutUkVLx5BK_u0yfd7GY7fZBjSBFS8JEg@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] dt-bindings: clock: renesas,rzg2l: Document
 RZ/V2M SoC
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
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

On Tue, May 3, 2022 at 2:01 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Document the device tree binding for the Renesas RZ/V2M (r9a09g011) SoC.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>  - Simplify reference to header files.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
