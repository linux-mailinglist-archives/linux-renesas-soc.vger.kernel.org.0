Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 589DD511A50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 16:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235243AbiD0NFZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 09:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235236AbiD0NFX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 09:05:23 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FB31CFD1;
        Wed, 27 Apr 2022 06:02:10 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id ke5so977460qvb.5;
        Wed, 27 Apr 2022 06:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mmxxwu2hv4yDhUBhV6wvYa5ilUKbOwj8YpY73vElIL4=;
        b=rE1r4FY0GQMCvpcTRMM8da4MLmf+Hb7o6DR5pqPS05+SsTiueYgz9Q2eE8iVAcWyZ9
         rE3EFXzeZo7ylnRp9Rk3uw590z3A/m+RT7BmaOgd74nOX6wkEAqy7XDLX/T5i29N2N6W
         c/QuKTcoVKS7PfNCDQhkQEc+nWgkb1NVrAmbQEz8DXjicq748BJv3yhZortSW3yyAJ6R
         P5G5xI1wm3To9D+gkmRK6P3AICcZxXtkghU6Hzt06TUnMTUrviJZsNofJGM4rS/lDYGU
         C48pnAyYqkhH9HuZT0szHNhVu8pORWeN9Xp+V7kEOZRMYnEuDfskmoTX5zhh6ywKUMTh
         ifXA==
X-Gm-Message-State: AOAM533qK9i+LCM8iV21yotDJL6JsTvdM+elD6GHe9Sgi58rL8qtSe+m
        Ixe1KttN/bxyh7NpV2hlvhx89qxnnq4oJw==
X-Google-Smtp-Source: ABdhPJyV9o9o+0PUWnnTXktTDa6038+ifVqZzyyBUVzN7RyoUgGBouFFYUKRLfJhmCPZ9GzJuU3sZA==
X-Received: by 2002:a05:6214:ace:b0:446:4c74:749b with SMTP id g14-20020a0562140ace00b004464c74749bmr19607967qvi.3.1651064528079;
        Wed, 27 Apr 2022 06:02:08 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id c125-20020a37b383000000b0069f96112563sm354751qkf.16.2022.04.27.06.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 06:02:07 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id y2so3214504ybi.7;
        Wed, 27 Apr 2022 06:02:07 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr26709791yba.546.1651064527024; Wed, 27
 Apr 2022 06:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220420025450.289578-1-yoshihiro.shimoda.uh@renesas.com> <20220420025450.289578-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420025450.289578-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 15:01:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGbfaNXvy-0ArsE8VDC6ju-6KTeKcz9rziY9ReBGRkyg@mail.gmail.com>
Message-ID: <CAMuHMdVGbfaNXvy-0ArsE8VDC6ju-6KTeKcz9rziY9ReBGRkyg@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: ufs: Document Renesas R-Car UFS host controller
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, avri.altman@wdc.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Hi Shimoda-san,

On Wed, Apr 20, 2022 at 3:11 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Document Renesas R-Car UFS host controller for R-Car S4-8 (r8a779f0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ufs/renesas,ufs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car UFS Host Controller
> +
> +maintainers:
> +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +
> +allOf:
> +  - $ref: ufs-common.yaml

ufs-common.yaml says just one interrupt, while Renesas UFS has
two interrupts?

The rest LGTM, so with the above resolved:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
