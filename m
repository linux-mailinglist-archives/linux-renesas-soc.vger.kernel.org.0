Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 268D44ED73A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 11:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234276AbiCaJsA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 05:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234278AbiCaJr7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 05:47:59 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AAA1DEC1C;
        Thu, 31 Mar 2022 02:46:12 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id q200so6011833qke.7;
        Thu, 31 Mar 2022 02:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QS1S2tOrDhz/TSgr2td/3/wN4yGeGUIvppMqnCIff6Q=;
        b=3bN2QGEsp2bsu7i3QWBSpOLeM/3/anOw7wESUaCxAeRgKW2O+Z5KXTazqWcH8XMQAp
         2jtuA57BNXad8uDkNUpD7T9ac2szCFADpX+/gA5qxtmtk/iICRPQa2Cn8qmbu8WELn7s
         8Y5gbhQwXFyCMUjCGGQAjlTqYIl05yim6s5KyhoWXZcvcbeAqC1W60PCWeR3MMHVykS2
         SP/OcIyf3TUF1WUqUjMbIu9YBsTbsNt4SQJr950S54HA7XCxwxD2Xjg+7GRF9XISxr4d
         5VhiNTrFO30juzj1t3kn8CGVb2y1xQWwybYw1k7b6tvwFoKmXU+veb6PWqbVAORuegX6
         KAbA==
X-Gm-Message-State: AOAM531f+d7utShKtTgAJKVYKu2v+VCMireR8vQcj7AyZQ8vNABkYMaC
        WTt7XNhJWDFagHAIgXktt9thNWx1LjXPTg==
X-Google-Smtp-Source: ABdhPJywOifNEUaUJK9X3N8H5rY/LHUuL1x8xOcbUcGJVk5KuDD6ptEoJMaXR9Y+Qy8amIrLbf7e9g==
X-Received: by 2002:a37:a305:0:b0:67d:43fc:a393 with SMTP id m5-20020a37a305000000b0067d43fca393mr2676820qke.699.1648719971700;
        Thu, 31 Mar 2022 02:46:11 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id r64-20020a37a843000000b0067b0cf40b18sm12485566qke.69.2022.03.31.02.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 02:46:11 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2e6ceb45174so208288207b3.8;
        Thu, 31 Mar 2022 02:46:11 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr3932933ywi.449.1648719970882; Thu, 31
 Mar 2022 02:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220315142915.17764-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315142915.17764-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 11:45:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUsgoaBpG4B6O4qwT+jR0zpS_qnPyktMzyNyvm0PGT8kw@mail.gmail.com>
Message-ID: <CAMuHMdUsgoaBpG4B6O4qwT+jR0zpS_qnPyktMzyNyvm0PGT8kw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: clock: renesas: Document RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
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

On Tue, Mar 15, 2022 at 3:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document the device tree binding for the Renesas RZ/G2UL Type-1
> and Type-2 SoC. RZ/G2UL Type-2 has fewer clocks than RZ/G2UL Type-1
> SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v2->v3:
>  * Changed the compatible from r9a07g043u-cpg->r9a07g043-cpg
>  * Retained the Rb tag from Rob as it is trivial change.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> @@ -23,8 +23,9 @@ description: |
>  properties:
>    compatible:
>      enum:
> -      - renesas,r9a07g044-cpg  # RZ/G2{L,LC}
> -      - renesas,r9a07g054-cpg  # RZ/V2L
> +      - renesas,r9a07g043-cpg   # RZ/G2UL{Type-1,Type-2}
> +      - renesas,r9a07g044-cpg   # RZ/G2{L,LC}
> +      - renesas,r9a07g054-cpg   # RZ/V2L

No need to increase the number of spaces before the hashmark.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
