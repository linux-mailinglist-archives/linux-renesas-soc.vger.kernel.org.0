Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19162542EFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 13:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237682AbiFHLQq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 07:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237780AbiFHLQp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 07:16:45 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7413739DE;
        Wed,  8 Jun 2022 04:16:44 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id z10so1224688qta.2;
        Wed, 08 Jun 2022 04:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QrKTc24aJUxfwS5ZLT4D6EbhdOHRFrkso98/RbnTqgw=;
        b=2hETDNIJGI88Wa0J45LfO4VMLr0MAbmPEoBIJRVX5on+/0uZuQEX1bXWtyYTtAHjca
         6eywzr2WQMuqCE6nPaxU50LgEYPpjR8sS1dAdQFa/wDQFA/Cp1zqEsT9yAnm++xjYnf6
         TPDbzsfaYKV+m7nqSh2vGl1p0WDBgpzPDZZ3KNrlffFp+zLkSAmbuxOv2Z4yKs4jR8Qi
         +wEzUf47mz7S6X5DTVP8y/DwvM9nLuO3cMrHJ6MS9Xf9dxko5x4e/ZZa6kHaUoO3rqs8
         7HCVYg9BylvHoK1CId1qdQyHWVQK26iz8YvUWRG1PS0CFp53/LlOEBpeRVf+BJUHdNiD
         vh6A==
X-Gm-Message-State: AOAM531CTZrEApmPAiPA/ZviS2oWUtMamqRJ3sl2dbwDbWpu+MjPJBVQ
        GVFkTYRkNr3tc3592OkfCHCq77KatIrWLQ==
X-Google-Smtp-Source: ABdhPJzjEgFddioXtt+KPUu10OYFkl7bcANT9YC1vaTBbXxDKymVzdlMMySVe1gjGrZfsNrRWwjxGw==
X-Received: by 2002:ac8:5b56:0:b0:2f3:f4a7:cd33 with SMTP id n22-20020ac85b56000000b002f3f4a7cd33mr26878928qtw.608.1654687003617;
        Wed, 08 Jun 2022 04:16:43 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id d8-20020ac85448000000b00304ef07ee7asm5065169qtq.83.2022.06.08.04.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 04:16:43 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-30c143c41e5so205284367b3.3;
        Wed, 08 Jun 2022 04:16:43 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr36784488ywg.316.1654687003046; Wed, 08
 Jun 2022 04:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220603233810.21972-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220603233810.21972-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jun 2022 13:16:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3U6PjGpB4m4jXC4UMjruqg1T66WtBSnuF68sKD48WTA@mail.gmail.com>
Message-ID: <CAMuHMdU3U6PjGpB4m4jXC4UMjruqg1T66WtBSnuF68sKD48WTA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car S4-8 and
 generic Gen4 support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Sun, Jun 5, 2022 at 2:34 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -61,6 +61,10 @@ properties:
>                - renesas,sdhi-r9a07g044 # RZ/G2{L,LC}
>                - renesas,sdhi-r9a07g054 # RZ/V2L
>            - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
> +      - items:
> +          - enum:
> +              - renesas,sdhi-r8a779f0  # R-Car S4-8
> +          - const: renesas,rcar-gen4-sdhi # R-Car Gen4

LGTM.

>
>    reg:
>      maxItems: 1

You forgot to add "renesas,rcar-gen4-sdhi" to the "if" block below, controlling
clocks and clock-names.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
