Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3055054D009
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jun 2022 19:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347123AbiFOReC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jun 2022 13:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357090AbiFORdO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 13:33:14 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F0513D57
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 10:33:13 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id l18so14050030lje.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 10:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GMuSLekSSDNOzbBz7Sbh7aqqxzs5y3shIYxAO3doGSk=;
        b=qvNZCeQMqQVpGhWZVY1GQ9GhteXrum7Z/JNalb/nIm5KhnAocVP4gi0+DxyR3MR63n
         UmZIfu0pU/TIeTMsTpbN7Ydq6blBXmXDVGT2Y0capm9K5XQhyW6O3h8m7xln4GMM2CU5
         fGdE3ZR8qQn6UD37LoVrYAdNa6pA+rZAzfCIIkBmFCHbKMuYbCRXF9+F/aXy8Yhwxhn7
         rQBV+5Zry8CveXJadLalCVj/8IwUBOMLRmyTwbHMW28T1uPUIwiztqBVQcG6G8zcaILy
         Q8grg+u5Ok3EfrBkqWYp0o/uGZBgBcNCWsPiXpUZ418Z9sX0/zuLNsUP1mELbPVd6bMR
         hUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GMuSLekSSDNOzbBz7Sbh7aqqxzs5y3shIYxAO3doGSk=;
        b=TM5D1vQ7i4xjGTPAsO6imYr3SHv4XKwtZDPDuUfBRmyMWqVb6L72AUS8ta1lvZniV/
         uDGlUvtdfBuhc66fag8YXPXZYmOKJ3cE4yrDIQUn+iS1qiucRtL/3EbLlXJRIOJQ/WF3
         burtlZEimNe+MC3F2Cq2FEdP4IKUjQHlBy0SNdixboneyvS6s8pGCHr7clkz28DO1oad
         9y1hPqLELfg8TzraDKV0GEIErn08JaE1NXXN9tYXs1T7BwyY91cc6B12IGZHGS2WwOQq
         w5vqn3V9LL/a7kKlwDwl5FhxUxRRNIJ0QjNouv1iHDMoxn/mYsqADkejf/b9+d5YhaKv
         +2vw==
X-Gm-Message-State: AJIora+U1ABBx1hRi3iyQL13aXgeUEMuTtlTqNa+kpNbMg2Kt2dJ/79W
        T4l2fY3gtIXkSDQffPGw64UGANHyR13btWiuP+GAVyMXBsApWg==
X-Google-Smtp-Source: AGRyM1tXDcwLXpmyoF8KuRCfA3Zr0Dlo6AshMRMmzjWQrYEcisjdOEoi9nssJs916SBnFZG36WvXq8GTGAvI8aPu0l8=
X-Received: by 2002:a05:651c:12c5:b0:255:9384:b385 with SMTP id
 5-20020a05651c12c500b002559384b385mr444680lje.229.1655314392197; Wed, 15 Jun
 2022 10:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220608122344.3431-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220608122344.3431-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 15 Jun 2022 10:32:35 -0700
Message-ID: <CAPDyKFqTkrGrQTzjO0PR9MD0VOetmQb+fKdEt563oAcORq9x6A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Add R-Car Gen4 clock requirements
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 8 Jun 2022 at 10:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The patch enabling generic Gen4 support forgot to add the clock
> requirements which are the same as for Gen3. Update the binding.
>
> Fixes: 6aa26be14d2a ("dt-bindings: mmc: renesas,sdhi: Document R-Car S4-8 and generic Gen4 support")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index d5b29728704b..14945ebc31d2 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -145,6 +145,7 @@ allOf:
>                enum:
>                  - renesas,rcar-gen2-sdhi
>                  - renesas,rcar-gen3-sdhi
> +                - renesas,rcar-gen4-sdhi
>        then:
>          properties:
>            clocks:
> --
> 2.35.1
>
