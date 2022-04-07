Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4514F7D7B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 13:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbiDGLHa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 07:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiDGLH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 07:07:28 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48EB205F5
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 04:05:26 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2eba37104a2so57995887b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Apr 2022 04:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fSP6AAmyR0ZiYLvNFPE8NyyyoqvYJ/MDeCQX86beajI=;
        b=SEafHZmeaYPBvZULjju02t/u4FRxSrICxclogmiN4WrmCVj493LquwMFjvc0s/iecj
         J4P8ZyOuI+ZKnonXWHV8cDIMI3AyHiaioZQrNtzkjXu1ltFUDqPuXECl+ZzVKkJ/4StI
         jm+1AIZ+0684IJtrEMEOSqg7jK8haxLPJ9GJsyH0XzZCTBlH4zK47w3pEVXku60U3dAo
         CNPKbM7S/0dqwHwx2AwGQugo5y+YiReZ9dT/FjMG+VnjHhir+IjvLF+HGXyacVc1SWEE
         SfR6ikEz11/IocRAtgQFZ8sa7wBnOOrHuvO3Dv+hx2wiM+ui9tEvfCDyjI9aEs/3nPlq
         lFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fSP6AAmyR0ZiYLvNFPE8NyyyoqvYJ/MDeCQX86beajI=;
        b=Q52vo7iWBX0DTxJweObN9C55Ckf4sX0D4+yKBGDpmVBKjrAAlKZIUKgP/e/3E38U3f
         QyO3B+Ee/mnJbGwIo/FRgB9kzEkgM/joGJ05CN5RewsCao/lPW+ajHc2wZLPr1TpF1Ce
         zJHHKoq+mdMY7ude6b6bkriRZ6A1fw99tE6GwFqyFUmpCrHWQ9/vygwt3J7T0M0B+T9o
         mJvYLjHXKD/5WvNdhCtkDXYQkDXMSvAO/o9qDDEzjgrgOBEGSiG3QJc5uoo4/bABCZ4j
         xjFf6dssNcVAKyPXvTGR/KXuUAEDTJiFj3Y0aWtB3nv+aj2EnX6Ow+NVxkQa+2M3BCjp
         +GDA==
X-Gm-Message-State: AOAM531DX+f8hZfL0xcY/VdagxJRGy0rQluVu0pUlct6LPhZn1RiWHWS
        Ah42xZtpSFaW1L1Db8J2fGkCu1HHXkszFj09b4Qh6w==
X-Google-Smtp-Source: ABdhPJwryex94cQSOe72bBas8zkUw7SOuk03C+8wO5vIQd8rhieZT4LRXhQlD21wNhSPR5zwAabojuiiYGlwaOwCyz0=
X-Received: by 2002:a0d:e216:0:b0:2eb:5da4:5d65 with SMTP id
 l22-20020a0de216000000b002eb5da45d65mr11088210ywe.376.1649329526140; Thu, 07
 Apr 2022 04:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220404130551.20209-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220404130551.20209-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 7 Apr 2022 13:04:49 +0200
Message-ID: <CAPDyKFrrMDF+LA8dzQ2EGBrTnWxCT5SPGV355DA_4Zz_hxx43A@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: remove superfluous specific M3W entry
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 4 Apr 2022 at 15:06, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> We don't need to specify the Gen3 compatible entry for M3W because it
> will be provided by the generic Gen3 fallback.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> This should be the final of_device_id fix. Builds fine. But I can't test
> because my HW is currently at a different location. Reviews from Geert
> and/or Shimoda-san would be much appreciated.
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index c9585c4fd812..3084b15ae2cb 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -262,7 +262,6 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
>         { .compatible = "renesas,sdhi-r7s9210", .data = &of_rza2_compatible, },
>         { .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
>         { .compatible = "renesas,sdhi-r8a7795", .data = &of_r8a7795_compatible, },
> -       { .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
>         { .compatible = "renesas,sdhi-r8a77961", .data = &of_r8a77961_compatible, },
>         { .compatible = "renesas,sdhi-r8a77965", .data = &of_r8a77965_compatible, },
>         { .compatible = "renesas,sdhi-r8a77970", .data = &of_r8a77970_compatible, },
> --
> 2.30.2
>
