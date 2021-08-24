Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6903F58DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Aug 2021 09:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbhHXHWa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Aug 2021 03:22:30 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:39578 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234705AbhHXHW3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Aug 2021 03:22:29 -0400
Received: by mail-ua1-f50.google.com with SMTP id a4so10192815uae.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Aug 2021 00:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qg2rH31ksHHx1vzHxL2k4VmL87olvBJb2Ne/0vkYads=;
        b=HVnPf8SlDXvnQfI4MxAajiDE0DQcTgolpwALIrWVbWHKPhaeiBkNyBNo9kUaqmYYNT
         DWWQQdYiatbT3zcWltxcjuah1Bv92eDyJJvU6YLa1ZMWE3LHHm4hMC8LToFckq4+gjmy
         c8/hfXab45S0X+dMbMQzuJ5rosM8DI2ZzradMGDIW944+M6U3JkE2AVgCwjlqrIIdaQb
         fWAbGoPW1go6BLuA/ZJ5xrGbDxGHE0tVKMOKwLC+ZoVdI/rlRr3BbvUjFK71Y/5ElSHP
         Byg2VHGa3GbvhBmzFXPSyZCUg1w7jehkzDAXOAlnDMmoFbjow0rUeeK4ZhapS9FpahY2
         +h1g==
X-Gm-Message-State: AOAM533kMJq2isz4Kx6hNN4oAXzcSplIhhxqlIvKwqVD6cdVthjnngao
        k+PQEQ52XAWBCjtAOZwSBGXsj1Jb7PqWq425+uY=
X-Google-Smtp-Source: ABdhPJz6KoZet3/cuDD7y1a8GfiJeXG9ZGmH2uO5ZWd2hhnY/DLhi/AJ0lscOZyjhzo+CuXLoz6dDBlSDYv8Ps4TSiQ=
X-Received: by 2002:ab0:209a:: with SMTP id r26mr4026428uak.14.1629789705102;
 Tue, 24 Aug 2021 00:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <61241cca.1c69fb81.84e82.123e@mx.google.com>
In-Reply-To: <61241cca.1c69fb81.84e82.123e@mx.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Aug 2021 09:21:33 +0200
Message-ID: <CAMuHMdX+=n57VOYPrCtu1GZc5YP0YZm0BN62VBEyYNcKAtEjXQ@mail.gmail.com>
Subject: Re: renesas/master baseline-nfs: 80 runs, 9 regressions (renesas-devel-2021-08-23-v5.14-rc7)
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        kernelci-results@groups.io
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 24, 2021 at 12:10 AM kernelci.org bot <bot@kernelci.org> wrote:
> renesas/master baseline-nfs: 80 runs, 9 regressions (renesas-devel-2021-08-23-v5.14-rc7)
>
> Regressions Summary
> -------------------
>
> platform                     | arch  | lab             | compiler | defconfig                    | regressions
> -----------------------------+-------+-----------------+----------+------------------------------+------------
> dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v7_defconfig           | 1
> hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconfig                    | 1
> hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconfig+CON...OMIZE_BASE=y | 1
> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconfig+crypto             | 1
> r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconfig+CON...OMIZE_BASE=y | 1
> rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconfig                    | 2
> rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconfig+CON...OMIZE_BASE=y | 2
>
>   Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/renesas-devel-2021-08-23-v5.14-rc7/plan/baseline-nfs/
>
>   Test:     baseline-nfs
>   Tree:     renesas
>   Branch:   master
>   Describe: renesas-devel-2021-08-23-v5.14-rc7
>   URL:      https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
>   SHA:      a8378ef28a200358f247cc997a8c3db868b1e917

I'm looking in the failure on r8a77950-salvator-x:

https://linux.kernelci.org/test/case/id/6123e9a7baa20236888e2cdf/

Looking at the failing job log, it's not immediately clear to me what exactly
is wrong.
The job log for the last successful run (renesas-devel-2021-07-13-v5.14-rc1)
is 404, so I cannot compare to that.

Salvator-X with R8A77950 (R-Car H3 ES1.0) is working fine for me locally.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
