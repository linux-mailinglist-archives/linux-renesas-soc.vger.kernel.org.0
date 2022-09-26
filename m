Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7985EB00B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 20:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiIZSgH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 14:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiIZSgC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 14:36:02 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB10252AD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 11:36:00 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id ay9so4709425qtb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 11:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XaHmYpyKM/hwMp0+4B1kg5RVXnsUP9arcGbixa625Zc=;
        b=vOga8IS+tftI2Oi+tGthjYA6GNG7oYCUlWN+xORfvCve6B8dheg4cPHx0IBd9jZ9j1
         Q6p0n2DBMaTvpWOyVraVh/DwZmi5CfJruH+PQ5O9U38lf98ywSWijkz1nudWIRVUDVay
         IXLxVJRQAWV4wpUP9h0FbVY1veUnZ2KiqQxZpeEgzxc3yNmGqU4DZ9At2Zw29wUDTm3n
         lG1wpdc/3Iy00T/kuLc6u/l596AJC+IW9+h0r1Yca7xAlRu6VmGF/qN7wNBvhZc1ha/Y
         geJAIf/W8XJk/7PVSOMz0piWDugfdMnwUE22ThIxvr2fCRSHQdpbP7HfRWb7YAoKjc3r
         QSBg==
X-Gm-Message-State: ACrzQf2Qox/Ccajmz9ybwfkEa6pKfock8Gah96J+WebHoabYc1JOtkBc
        cLBtXz8U7a6HGubu0pnga91ctxt03qT5DA==
X-Google-Smtp-Source: AMsMyM7LuRU/aQZOBdvMcsDEP+de45KS20lnpxH0tZQ5vYHJGwuigryZSpmIMGlPmPZ/7KFjvsGtlA==
X-Received: by 2002:a05:622a:d6:b0:35d:49f3:1f6f with SMTP id p22-20020a05622a00d600b0035d49f31f6fmr950176qtw.408.1664217358937;
        Mon, 26 Sep 2022 11:35:58 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id w4-20020ac86b04000000b00342fb07944fsm11241049qts.82.2022.09.26.11.35.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 11:35:58 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 135so9489425ybl.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 11:35:58 -0700 (PDT)
X-Received: by 2002:a5b:506:0:b0:6af:ffac:4459 with SMTP id
 o6-20020a5b0506000000b006afffac4459mr20434419ybp.365.1664217358041; Mon, 26
 Sep 2022 11:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <6331e5ad.170a0220.e0823.68b9@mx.google.com>
In-Reply-To: <6331e5ad.170a0220.e0823.68b9@mx.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Sep 2022 20:35:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUR5EBXpdpWqoG1hDQqEiuVK4MOeH77g0inL33Dyj3kYg@mail.gmail.com>
Message-ID: <CAMuHMdUR5EBXpdpWqoG1hDQqEiuVK4MOeH77g0inL33Dyj3kYg@mail.gmail.com>
Subject: Re: renesas/next baseline: 627 runs, 40 regressions (renesas-next-2022-09-26-v6.0-rc1)
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io,
        kernelci@groups.io
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear KernelCI,

On Mon, Sep 26, 2022 at 8:08 PM kernelci.org bot <bot@kernelci.org> wrote:
> renesas/next baseline: 627 runs, 40 regressions (renesas-next-2022-09-26-v6.0-rc1)
>
> Regressions Summary
> -------------------
>
> platform                     | arch  | lab           | compiler | defconfig                    | regressions
> -----------------------------+-------+---------------+----------+------------------------------+------------
> hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig                    | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig+crypto    | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig           | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig+ima       | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_defconfig              | 1
> kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig+ima                | 1
> kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig+CON...OMIZE_BASE=y | 1
> kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig+debug              | 1
> kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig+CON...OMIZE_BASE=y | 2
> kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig+crypto             | 2
> kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig                    | 2
> meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...OMIZE_BASE=y | 1
> mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig+arm...ook+videodec | 1
> mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 1
> panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
> panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig+crypto    | 1
> panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig           | 1
> panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
> panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig+ima       | 1
> panda                        | arm   | lab-baylibre  | gcc-10   | omap2plus_defconfig          | 1
> qemu_arm-vexpress-a15        | arm   | lab-baylibre  | gcc-10   | vexpress_defconfig           | 1
> qemu_arm-vexpress-a15        | arm   | lab-broonie   | gcc-10   | vexpress_defconfig           | 1
> qemu_arm-vexpress-a15        | arm   | lab-collabora | gcc-10   | vexpress_defconfig           | 1
> qemu_arm-vexpress-a9         | arm   | lab-baylibre  | gcc-10   | vexpress_defconfig           | 1
> qemu_arm-vexpress-a9         | arm   | lab-broonie   | gcc-10   | vexpress_defconfig           | 1
> qemu_arm-vexpress-a9         | arm   | lab-collabora | gcc-10   | vexpress_defconfig           | 1
> qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_defconfig+debug     | 1
> qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora | gcc-10   | multi_v7_defconfig+debug     | 1
> rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 4
> sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig+arm...ook+videodec | 1
> sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 1

Thanks for your report!

I believe none of the regressions listed above are introduced in
renesas-next-2022-09-26-v6.0-rc1, as renesas/next contains no
commits that affect the above platforms, except for those that are
already in v6.0-rc1.

Please improve your reporting.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
