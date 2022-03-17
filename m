Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5532F4DC3CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Mar 2022 11:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbiCQKQ7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Mar 2022 06:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbiCQKQ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Mar 2022 06:16:58 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91687DFF89
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Mar 2022 03:15:41 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id y17so6516926ljd.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Mar 2022 03:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BBJNQVwMyLBs8lLLZ+phXdIS1BZRlnyigKaYZzIPGus=;
        b=ZrFqjnS8CKuQDGyyWGOZxHY0dGaUnHUw9IrhHx+mGdrVp9Z/v5mQOg4A/OmMPxsD9+
         gQbMkSOAZTYsrKOxBBcT1OFivH9Qu8cr/eScxhBZB6FsY0Nugc+3Fy0sPIZTWUHg9zGy
         T2eFPO8ju7YBrDfOwhUZqPDQluCD5HcNRftCCYIBLKibbgSPObkpQtx61uZYb31vceUd
         Tr8Ah6tvAhRcrzhAmYmqPbMlC3McRihY8SgCMMf97Sy0skRr9ZDLQIW6ycO7InxovhaY
         yeFqHg2wY4brCSvwZPUbAEeKOF4bDZsmVInJVGhZzsp1lvINlMPckA0vyNxer+0N879q
         vWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BBJNQVwMyLBs8lLLZ+phXdIS1BZRlnyigKaYZzIPGus=;
        b=DwMl6eF3AjYCcLG4elrRCQh89J9scxCXdF2W2TJfS+H//Oy8mYOP6IponHTyzbBtHb
         4Sdez40vzo4cmUFDoW4hI+TawR08UxyZ7K+ocf9y44cJ0Tsy1EHp/xU9RC6Ue1tm810b
         I7ljj5MQ19yc9xr2rf4cznSCIe4c49ilikX3aDRFQaQEjuh5M+WckwgBvuQnQ5WWb/9Z
         OOH+DprkX8vcNxf7aAKkKlofRIe/mTgtgS/PifhGcRdyu71QfBDmYC96MS4ofXDIUVHL
         J+Oc2ODS6ODoMnMVDcEkMHo4WIOmmqHKn/bnZL2mmI09OPGtxElnFnQ8/G62gmaPbWIV
         6fYQ==
X-Gm-Message-State: AOAM531wzJLXIhJjEsdcyvpTJBLo5L2WvgWzInEYNG6a3Clc6G1PiVhO
        8zkco1UPVAAQf7Rxo2vnjT4PZywopLrPSVWHcVFvB7R0RPY=
X-Google-Smtp-Source: ABdhPJzMAlFb6clniGiYBXS5RvYGVXflZX6StQiwUqd7rEWmCRagcg/bgKr+R6rvw17Siwuf39WjLbMxfMx2e9HTTg0=
X-Received: by 2002:a2e:890e:0:b0:249:295a:eb40 with SMTP id
 d14-20020a2e890e000000b00249295aeb40mr2376622lji.463.1647512139862; Thu, 17
 Mar 2022 03:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220315153258.21097-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315153258.21097-1-biju.das.jz@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 17 Mar 2022 11:15:03 +0100
Message-ID: <CAPDyKFpLVsNjuWX-5sketEw-j4nbgVpUY8qvWKBjDSXPG4Sfwg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 15 Mar 2022 at 16:33, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Document RZ/G2UL SDHI bindings. RZ/G2UL SDHI is almost identical to one
> found on the R-Car Gen3. No driver changes are required as generic
> compatible string "renesas,rcar-gen3-sdhi" will be used as a fallback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 3b191fb89cf1..9ac4986988c5 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -57,6 +57,7 @@ properties:
>                - renesas,sdhi-r8a77990  # R-Car E3
>                - renesas,sdhi-r8a77995  # R-Car D3
>                - renesas,sdhi-r8a779a0  # R-Car V3U
> +              - renesas,sdhi-r9a07g043 # RZ/G2UL
>                - renesas,sdhi-r9a07g044 # RZ/G2{L,LC}
>                - renesas,sdhi-r9a07g054 # RZ/V2L
>            - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
> @@ -109,6 +110,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - renesas,sdhi-r9a07g043
>                - renesas,sdhi-r9a07g044
>                - renesas,sdhi-r9a07g054
>      then:
> --
> 2.17.1
>
