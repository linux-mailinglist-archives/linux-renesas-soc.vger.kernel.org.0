Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307436568B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Dec 2022 10:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiL0JIy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Dec 2022 04:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiL0JIx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2022 04:08:53 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B741E0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:08:52 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id j16so10032756qtv.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FxIkVK46AufmvAoX2hmoZS5sVC2q0YXhqyW0ueAed4=;
        b=WJoUkEmoTKbo7jKKX+rTr8QlTD3t9BeRCgSfA10WnAA/Ky49s06Q/TgtCls8uPzKzF
         HqQ6JcGBbUenDJaa2WtXv1j/1EL2x2alFu+MBR0n7A86JZdiQMasuxUI21Hr8QzB6VxI
         h5xZn7H+sAs2r9wPjEZQjhY+TYnV7NAHwF7tjAVQ1rW4+ZbpfSbcMb821yoqRd9OabKP
         33M4CBZiHzyh1r9LNxITp/BOhMb5I0NWIvYf2s+aqdVR5EI20N6wjww82usXkR52vzQ+
         2JR1tMzhQej+3TftTeALebC2AlHyZWY0WwKshTZXQJhUzVQEqdfqFaGpKRXwbkhMe/UJ
         etsw==
X-Gm-Message-State: AFqh2koFKoJZR7zklTQVpIKGrdvUXqIk4e+wJ8lczdZdSx+0rIhqBAe/
        LTKe+tF6iryX5IE+6mhofuiAL9XPevXkPw==
X-Google-Smtp-Source: AMrXdXujsOyehohEO2L099cvw+QbrWsXgbohHRniIrhqEtRBbpBNJD79wsc8UPr/9T2LH43jUnq9pw==
X-Received: by 2002:ac8:4a07:0:b0:3a5:8084:9f60 with SMTP id x7-20020ac84a07000000b003a580849f60mr27667060qtq.64.1672132131347;
        Tue, 27 Dec 2022 01:08:51 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id y4-20020a05620a44c400b006fc7302cf89sm9187314qkp.28.2022.12.27.01.08.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 01:08:51 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id i186so13756818ybc.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:08:50 -0800 (PST)
X-Received: by 2002:a25:d103:0:b0:75d:3ecb:1967 with SMTP id
 i3-20020a25d103000000b0075d3ecb1967mr1782542ybg.604.1672132130656; Tue, 27
 Dec 2022 01:08:50 -0800 (PST)
MIME-Version: 1.0
References: <63a9bc8c.a70a0220.7cd88.c530@mx.google.com>
In-Reply-To: <63a9bc8c.a70a0220.7cd88.c530@mx.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Dec 2022 10:08:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9NorMheSh30gSBw2iaMneffWqOifs1wNmbv+vO2ca=w@mail.gmail.com>
Message-ID: <CAMuHMdX9NorMheSh30gSBw2iaMneffWqOifs1wNmbv+vO2ca=w@mail.gmail.com>
Subject: Re: renesas/master baseline-nfs: 136 runs, 6 regressions (renesas-devel-2022-12-26-v6.2-rc1)
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

On Mon, Dec 26, 2022 at 4:41 PM kernelci.org bot <bot@kernelci.org> wrote:
> renesas/master baseline-nfs: 136 runs, 6 regressions (renesas-devel-2022-12-26-v6.2-rc1)
>
> Regressions Summary
> -------------------
>
> platform                     | arch  | lab          | compiler | defconfig                    | regressions
> -----------------------------+-------+--------------+----------+------------------------------+------------
> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMIZE_BASE=y | 1
> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig                    | 1
> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+ima                | 1
> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-10   | defconfig+videodec           | 1
> sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-10   | defconfig+debug              | 1
> sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie  | gcc-10   | defconfig+debug              | 1
>
>   Details:  https://kernelci.org/test/job/renesas/branch/master/kernel/renesas-devel-2022-12-26-v6.2-rc1/plan/baseline-nfs/

More regressions in v6.2-rc1 not introduced in renesas/next.

$ git diff --stat v6.2-rc1..renesas-devel-2022-12-26-v6.2-rc1
 MAINTAINERS                                        |   3 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  62 +++
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |  94 +++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 130 +++++++
 arch/arm64/configs/defconfig                       |   1 +
 arch/arm64/configs/renesas_defconfig               | 419 +++++++++++++++++++++
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi  |   4 -
 drivers/soc/renesas/r8a779g0-sysc.c                |   1 +
 include/dt-bindings/power/r8a779g0-sysc.h          |   1 +
 9 files changed, 711 insertions(+), 4 deletions(-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
