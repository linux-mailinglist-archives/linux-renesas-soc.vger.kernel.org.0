Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03245428812
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 09:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbhJKHvj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 03:51:39 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:33729 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233968AbhJKHvj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 03:51:39 -0400
Received: by mail-vs1-f51.google.com with SMTP id 188so18116202vsv.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Oct 2021 00:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lEm1aoPwR//thReIF6WsdRWDyfSphp+3ISVDJZPBa4E=;
        b=Fu3Wc+x+VJCToHNzaFz3AnSJhxnKmO4+UlL9MdqBWGMc0J7Rek9tP6fCgDRReN12Jo
         vWQhQj30OT8p6ucNLfPl4lSXVgNO9lUGG7xDmgAb3jc6gBWkOvVjNFDgnhOgWEndFbHs
         p4Na1Vmi+IeTKffQjLmLLd/ExopjbX3ILhCcupcqgBdl+uTIZcE5vy7a49abcwWBKDSo
         NKyp7N1INYOVK5FPIS8DMQR46UYTqt4nBMZS1goKDW0jnE0Oq8DNXK9Lk7Ys7+CYHhol
         LBM7qWpOAt/S1YSEpkqQ2ghaTsX1siIFV/E1EX5neK7rwzOtReW5zjBu3JNVFvQYORN6
         h4Zg==
X-Gm-Message-State: AOAM5309KWjNPOQbHY1EMv8cwVww/ZbiJvgE3Q7xBIPXlnnzahWlRnki
        01IKV9njibVqSbtwQd5lk/JoiU5He8n2uwq72NI=
X-Google-Smtp-Source: ABdhPJw6wsmsWMJaKEgfsTZf/wtjBM8uvDGyQu8Gp8YVIEOPqgq8sPnn+BPQ3qGCE/iTWb1fLh25amnbbpyDumZpyXo=
X-Received: by 2002:a67:d583:: with SMTP id m3mr21296988vsj.41.1633938579453;
 Mon, 11 Oct 2021 00:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <6160cc7c.1c69fb81.d8f9.1888@mx.google.com>
In-Reply-To: <6160cc7c.1c69fb81.d8f9.1888@mx.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 09:49:28 +0200
Message-ID: <CAMuHMdWkqYbAew_Aw-nuf6vC7zSToQE9_5prZ8ws+Pv2BwQNpA@mail.gmail.com>
Subject: Re: renesas/master baseline: 313 runs, 18 regressions (renesas-devel-2021-10-08-v5.15-rc4)
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        kernelci-results@groups.io
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Deer KernelCI bot,

On Sat, Oct 9, 2021 at 12:56 AM kernelci.org bot <bot@kernelci.org> wrote:
> renesas/master baseline: 313 runs, 18 regressions (renesas-devel-2021-10-08-v5.15-rc4)
>
> Regressions Summary
> -------------------
>
> platform             | arch  | lab           | compiler | defconfig                    | regressions
> ---------------------+-------+---------------+----------+------------------------------+------------
> beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...CONFIG_SMP=n | 1
> beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfig           | 1
> beagle-xm            | arm   | lab-baylibre  | gcc-8    | multi_v7_defconfig+ima       | 1
> beagle-xm            | arm   | lab-baylibre  | gcc-8    | omap2plus_defconfig          | 1
> hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig                    | 1
> hip07-d05            | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_BASE=y | 1
> imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconfig          | 1
> mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig                    | 2
> mt8173-elm-hana      | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_BASE=y | 2
> qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconfig          | 1
> qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconfig          | 1
> qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconfig          | 1
> rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig                    | 2
> rk3399-gru-kevin     | arm64 | lab-collabora | gcc-8    | defconfig+CON...OMIZE_BASE=y | 2

As usual, I expect all of these to fail with plain v5.15-rc4, too.
There are no reported regressions in Renesas SoCs and boards.

Thanks for improving the false positives!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
