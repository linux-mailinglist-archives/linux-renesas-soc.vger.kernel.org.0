Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37A79782502
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 10:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233886AbjHUIAQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 04:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233883AbjHUIAP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 04:00:15 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304E2B9;
        Mon, 21 Aug 2023 01:00:14 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59205f26e47so10447137b3.2;
        Mon, 21 Aug 2023 01:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692604813; x=1693209613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Sr/u3uxtJtyWxrKenjm5U40+oHCcTags7xKF93pMO4=;
        b=exgzZmlMd8X+bSIrBn/Js2rQZQ9CZchNruWkVFriYstqhIAMeUkKiW9Luruc6a6k8Q
         uo91POhrLGe+sfxsrkLwg9ogyu7F23x8GbBlPgWb9xo+BIfHMyZQLYJ4F4v9o9Z67ELu
         90Q240JzEi6NtK0zZiWexIm26qzAUi1y67CgeVzlBag+qpKU+ncZaLs+jGkTi8jHqSTF
         xlhYCXJi6nkLQkIMhhTzgtJLxUQPLZoirtzw2jEkCxPcWTuw7vP4ooLwkrAbnsYPmrBV
         eplrezUau5r8J/s3dxyzCQSH6Oqo1dvuSaL4mYHYeRYhK34RUZUHXJ6xisiZhI6IF0kZ
         SLYw==
X-Gm-Message-State: AOJu0YxVv+cLejifiSDzyRmsf0Jmjf5KW+Oi/jf9AHoSj9Mbgb/DyCdZ
        PQEq+ARZn7jpD59sdea2/+Es+Qc4e+Wx4w==
X-Google-Smtp-Source: AGHT+IHTlImsG3R9ohqB3sDVNEknUMweUP/PfLnKSi5zkYLLnPJf8CDE8tWuUDFgUfr0fsV3sqp0zg==
X-Received: by 2002:a81:6243:0:b0:589:d942:5e8d with SMTP id w64-20020a816243000000b00589d9425e8dmr6683308ywb.9.1692604813038;
        Mon, 21 Aug 2023 01:00:13 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id m14-20020a819c0e000000b005773babc3cdsm2084705ywa.83.2023.08.21.01.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 01:00:12 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d7225259f52so3130522276.0;
        Mon, 21 Aug 2023 01:00:12 -0700 (PDT)
X-Received: by 2002:a25:3491:0:b0:d73:ea25:f17b with SMTP id
 b139-20020a253491000000b00d73ea25f17bmr5569168yba.1.1692604812147; Mon, 21
 Aug 2023 01:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230817090810.203900-1-biju.das.jz@bp.renesas.com> <20230817090810.203900-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230817090810.203900-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Aug 2023 10:00:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoOu2sGeWO0tQ89iU6rT=kWtpJ0qfhYvxnhQAfPwA7dg@mail.gmail.com>
Message-ID: <CAMuHMdUoOu2sGeWO0tQ89iU6rT=kWtpJ0qfhYvxnhQAfPwA7dg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: versaclock3: Document clock-output-names
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Aug 17, 2023 at 11:08 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document clock-output-names property and fix the "assigned-clock-rates"
> for each clock output in the example based on Table 3. ("Output Source")
> in the 5P35023 datasheet(ie: {REF,SE1,SE2,SE3,DIFF1,DIFF2}).
>
> While at it, replace clocks phandle in the example from x1_x2->x1 as
> X2 is a different 32768 kHz crystal.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/all/CAMuHMdUHD+bEco=WYTYWsTAyRt3dTQQt4Xpaejss0Y2ZpLCMNg@mail.gmail.com/
> Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock generator bindings")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description to make it clear it fixes
>    "assigned-clock-rates" in the example based on 5P35023 datasheet.

Thanks for your patch!
> ---
>  .../devicetree/bindings/clock/renesas,5p35023.yaml | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> index 839648e753d4..db8d01b291dd 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> @@ -49,6 +49,9 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint8-array
>      maxItems: 37
>
> +  clock-output-names:
> +    maxItems: 6
> +

Why do you need clock-output-names?
The clock output names should be created by the driver (taking into
account the instance number, so it works with multiple instances).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
