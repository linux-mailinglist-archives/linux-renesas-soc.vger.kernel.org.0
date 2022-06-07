Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2D7D53FBAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jun 2022 12:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241434AbiFGKoX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jun 2022 06:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241435AbiFGKoU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 06:44:20 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8842F3A2
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jun 2022 03:44:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id be31so27662703lfb.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jun 2022 03:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oldIK4x+0l/Bv7OoKE6IDpTyHYosL/5Va89KOtvyPN0=;
        b=sdSbJGbW1OUJvXPvD8Q9Hy5IA42Qek4A5YuRNjE8ookhoq+Z2IAwImXwP49rWgD9SU
         Hqsj+WzN80ZUlUVCvYiTLy84llXtk+/Aho3Re7A88Vzpw96Wv2fMCFp+iCC0JMTd5snp
         9cmBizKTETYF+QSAQ97VqAE1Rjr3r8bT4R2AZvAcQdSfZl0WzvxI9JtzNqX5ePIc8gxj
         ShaCHsx22gOPo67BpDkIiKCD4nmLzFTsAtc9q5D6+5hwZJ/fW8hz8CvquGsZamyANBfG
         Kn6QAf7oI9jlGmRubPGC9ThRM0EGIzsoQsLgPeO1TTJatbrqihzY50UTKV5djIboTX/t
         UFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oldIK4x+0l/Bv7OoKE6IDpTyHYosL/5Va89KOtvyPN0=;
        b=Kvh6xaG76zLK6r9hb3i5vx3CSA81PXqJSqX+eU0fUvzsi0K0nJfrCnNNJHKrxZRi72
         t053I7sIffwryLXmDUbDWt7akZG/EwBELKpOnMNJuy+VJ2qRVUYIuHVBAOQUe7np5v7R
         Hki8/ngpt6Z9b1IqbuRRAkVy0Xw3wqa0ZKIv0aih+Xyu4piiy89wT/wOCR5wGIkPLSnc
         TNq08vqEiDjCG1vqrXd2hBHu6rWFY8fSbxjEM/iaicALf44bggjXNfOQuDiKgWKTifeR
         OVYNJfyDG9hOf8REgdRxqrDxRKjOBbJj2vSu/pCTF0uyrQGm7OHqwKU3s07XepiLCLGx
         MwSg==
X-Gm-Message-State: AOAM533co5H+Uhn8C1X3SiThsynsYK9pwOfGgR2Tbegbm5vFbyW/qrBr
        94GGGUXvoTKfV/UyW/Maj4SUvOIjxa35hbRNAuyHIw==
X-Google-Smtp-Source: ABdhPJw8xKe/6musFxtIt/kptw9pdvrPuaN8AtcTfG6jYGUVqCbiWhCGQ5tX61Q3upwDXaY7xQ+Bq9LVDyiHzOqOGeE=
X-Received: by 2002:a19:ac42:0:b0:478:593c:e6fe with SMTP id
 r2-20020a19ac42000000b00478593ce6femr17809585lfc.254.1654598653115; Tue, 07
 Jun 2022 03:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220603233810.21972-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220603233810.21972-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 7 Jun 2022 12:43:36 +0200
Message-ID: <CAPDyKFpr_XYj7R=ofgh00jyKi__3k_m8zmFMJYfcfnM5Z_nLGw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car S4-8 and
 generic Gen4 support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
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

On Sat, 4 Jun 2022 at 01:38, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 9ac4986988c5..b46a90eb2063 100644
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
>
>    reg:
>      maxItems: 1
> --
> 2.35.1
>
