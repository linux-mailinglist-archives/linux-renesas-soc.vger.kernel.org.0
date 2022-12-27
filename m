Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA436568B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Dec 2022 10:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbiL0JHr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Dec 2022 04:07:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiL0JHq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2022 04:07:46 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E376545
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:07:45 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id x11so9993602qtv.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEBXmIW1ApQlTzdO5j+bw0V/9xOcwiIjHerpn+2yG2c=;
        b=oYiqe6II5ZCLO+OiviXrfdB6azV5c0DexWsgI5VAKCtElNgVws329FOWuXOCcgkn9Q
         D87eSXrPGpGeP/9n4JJ2V004wzlS7ybsFgXVDFse+fLYs3+FNWI59TdFzLW8IYJ6W3cF
         Q62+TR+NGmdNZL9jX46fCUpqB3gQflWqFW2KzueTiZjl3+Cj0Wc2Ik9INtUmzjHtaLl3
         m2n0pOXA24wJjkElpWk80rCggEtz4m1aTXC1/dIV9I7TnriewXO8a5GIvXvv2TLaET/s
         AqddjrNxSmm+o7BwBJKPuikC++9vyHML7f3fO4EMIKcN8lHBhQSwjeIKZAuduRbQm/qi
         Z5AA==
X-Gm-Message-State: AFqh2koZv69gZmrtXdZxV6lGheqmmeAnWACoiA25MNSmb4A0FZEjXiep
        tXIaNfkVl+bBTtuavOIK4HhiNBFkoyWRLA==
X-Google-Smtp-Source: AMrXdXse8X7dNSLk7/wkw2j+EHp0srYzcCTvKyLPHx3t2tgZtfv5p1xvTxpstPPwkfXDbLgvsCMj+Q==
X-Received: by 2002:a05:622a:5144:b0:3a5:ad81:8aff with SMTP id ew4-20020a05622a514400b003a5ad818affmr29737325qtb.55.1672132064459;
        Tue, 27 Dec 2022 01:07:44 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id d18-20020ac847d2000000b0039cc82a319asm7965590qtr.76.2022.12.27.01.07.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 01:07:44 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-47fc4e98550so34287427b3.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:07:44 -0800 (PST)
X-Received: by 2002:a81:1e4a:0:b0:460:13cf:fc95 with SMTP id
 e71-20020a811e4a000000b0046013cffc95mr2472139ywe.316.1672132063836; Tue, 27
 Dec 2022 01:07:43 -0800 (PST)
MIME-Version: 1.0
References: <63a9b8cc.170a0220.636c5.d0a6@mx.google.com>
In-Reply-To: <63a9b8cc.170a0220.636c5.d0a6@mx.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Dec 2022 10:07:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDa8vEMsfYWXUEgq8CaT_P6=xUho=TRgwRc7POXgrG1w@mail.gmail.com>
Message-ID: <CAMuHMdXDa8vEMsfYWXUEgq8CaT_P6=xUho=TRgwRc7POXgrG1w@mail.gmail.com>
Subject: Re: renesas/next baseline-nfs: 137 runs, 7 regressions (renesas-next-2022-12-26-v6.2-rc1)
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 26, 2022 at 4:11 PM kernelci.org bot <bot@kernelci.org> wrote:
> renesas/next baseline-nfs: 137 runs, 7 regressions (renesas-next-2022-12-26-v6.2-rc1)
>
> Regressions Summary
> -------------------
>
> platform                     | arch  | lab          | compiler | defconfig                    | regressions
> -----------------------------+-------+--------------+----------+------------------------------+------------
> at91sam9g20ek                | arm   | lab-broonie  | gcc-10   | at91_dt_defconfig            | 1
> kontron-pitx-imx8m           | arm64 | lab-kontron  | gcc-10   | defconfig+crypto             | 1
> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+crypto             | 1
> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMIZE_BASE=y | 1
> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+ima                | 1
> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig                    | 1
> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+videodec           | 1
>
>   Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesas-next-2022-12-26-v6.2-rc1/plan/baseline-nfs/

More regressions in v6.2-rc1 not introduced in renesas/next.

$ git diff --stat v6.2-rc1..renesas-next-2022-12-26-v6.2-rc1
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  62 ++++++++++
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |  94 +++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 130 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi  |   4 -
 drivers/soc/renesas/r8a779g0-sysc.c                |   1 +
 include/dt-bindings/power/r8a779g0-sysc.h          |   1 +
 7 files changed, 289 insertions(+), 4 deletions(-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
