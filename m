Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B021E54D00D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jun 2022 19:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242586AbiFOReA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jun 2022 13:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356209AbiFORdM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 13:33:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C562E035
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 10:33:08 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id s6so19953856lfo.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 10:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BUgb1Pe+Veiyc1nTiM+3RHjRjGi5/SPESrYXTvlvRXM=;
        b=lpR1a6RXGTDYt15+E4r+yT/00L0A4FILcJrq9e4gJPPiJGz8QAfETf2g5D6di8fvHn
         J7GYA5sGsmbXV1u5SNJL5nWEPhzVX9ZXAjWr5VcvJQ0QBm3w638+rgeLfqMyuZUP5CRT
         r9SPqKoElpgdab66HMhgghETs7CMYZtopX0XmpOttnoAR0blC+IH5taRCOCMo4iB/KoE
         qUUzUvsG3ufiyzwVJK6NnhM84AON/2kpAlzWNHC3BSqlk7afGRPSo17RXmbHzkXIoRYt
         7XYKtBjLhYjNOkRgR2MCdY7hGcXJabBbejZpsZgZMup2oxjIiJOlOwjYl5DnMbmO/jBX
         kHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BUgb1Pe+Veiyc1nTiM+3RHjRjGi5/SPESrYXTvlvRXM=;
        b=QMphAToEYhLsjjPMt0pi/W4eMoa4vIkHWV5j7Gm6DLsd1IzoUNCAZe+YIopWNgAcDU
         UObjN+fcXR4S8L1v88e250GlNTaWxZOhfsrBm+VK8ObMA5LnO73JYl2q8PQ7qQ1MYcQw
         8FL4sdxAFRha+noPt7qOTf2HwX048gpCVPkJ+Y6qTQG4oR9EFyfkKYEkkREWT6Nk7y0u
         esDttZa6LbukxZElK7MWd+HKl/uggVKPn5JWSC+Bi5um1T05JZErqGAFJKjJEWkQoRT2
         qWLfbpz7GNMF+skMlETWU/S8qPKoswOFbRCRm6nr9M4FqQvdPo9lDnXwv6yvexxyH1xX
         wTtg==
X-Gm-Message-State: AJIora/2Imy7lnBWlSv4+f1QuooG7GKYclU1kZseQxbOCW7Q+nFq/jY/
        BS5l2I2ocEqzZkNhjI7Gv90R4qTPH9hBCVeXRRNrmyIlPsmrxw==
X-Google-Smtp-Source: AGRyM1uzZT5qbrIVqoqKo8NrzQAAiEbammbNVYH24ado8DrBIjHZ7ZONn86vPSD9rtjZsUL6eGAog6NNERQEcawmriM=
X-Received: by 2002:a05:6512:303:b0:479:1baf:7e5b with SMTP id
 t3-20020a056512030300b004791baf7e5bmr348682lfp.184.1655314386647; Wed, 15 Jun
 2022 10:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220608094831.8242-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220608094831.8242-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 15 Jun 2022 10:32:29 -0700
Message-ID: <CAPDyKFqFuZxeGcrBQFL3KM4o4rTSqEQkmW_9YuQ6Fm5pUZtvHQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: R-Car V3U is R-Car Gen4
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

On Wed, 8 Jun 2022 at 10:22, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Depends on "[PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car S4-8
> and generic Gen4 support" which is already in mmc/next.
>
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index b46a90eb2063..d5b29728704b 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -56,13 +56,13 @@ properties:
>                - renesas,sdhi-r8a77980  # R-Car V3H
>                - renesas,sdhi-r8a77990  # R-Car E3
>                - renesas,sdhi-r8a77995  # R-Car D3
> -              - renesas,sdhi-r8a779a0  # R-Car V3U
>                - renesas,sdhi-r9a07g043 # RZ/G2UL
>                - renesas,sdhi-r9a07g044 # RZ/G2{L,LC}
>                - renesas,sdhi-r9a07g054 # RZ/V2L
>            - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
>        - items:
>            - enum:
> +              - renesas,sdhi-r8a779a0  # R-Car V3U
>                - renesas,sdhi-r8a779f0  # R-Car S4-8
>            - const: renesas,rcar-gen4-sdhi # R-Car Gen4
>
> --
> 2.35.1
>
