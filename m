Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64BA1722F74
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jun 2023 21:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235064AbjFETPm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Jun 2023 15:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233882AbjFETPl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Jun 2023 15:15:41 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B29F1
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 12:15:39 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-565de553de1so78220237b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jun 2023 12:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685992538; x=1688584538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9bvan5VS7asbsbAR1sGc8ISgfaN/l9dg4H+UKTfXag=;
        b=Vm66vwe9Im2Ks8Gz4AJH5Ov+R5yTvEAJkMdhbiTRaWUROWxAEOhm9uig8aJDlqhCjE
         /g5JT5NX/lTVxiSSFTn1SfTzL7c17802aNWmF2+jl6FnoOqZWAeyoCC0AOZZL5vC9xRX
         o+m8FxaMCuTdicHhJVOofGDZdx67MjKXxzUedrkaLwEvYNi/U7Xid+MdD7gwKeYaTQXW
         OBXbYndm/Bg0iBXC5rQyhwXy7IPhE6iZUOS+fQfMRFQCvxtaJYtU8cO7zXDbtZv5nHTV
         z5Xhw1oIuF3gJ7mUTPoqF9xrDgj5Oqj48xYIBDBqAGH7XuwDYG9d3bbv52tbRZyhrDJ9
         fDUA==
X-Gm-Message-State: AC+VfDy9sfGa2EvqIfvsGPcJq2N1AQNzvVX92fDA/ORFzhJQhv0LmTnX
        W5rfqMWHsW3C4ahVDOeXfNtPRimceCCQuw==
X-Google-Smtp-Source: ACHHUZ47sJUrEnFFWs5s3+GQJoUOkIh/4Tw8OWGafnhJpJi72vS3EGV6rOpbSXemVvxULpwKDcY1Og==
X-Received: by 2002:a81:4e8b:0:b0:55a:416d:5202 with SMTP id c133-20020a814e8b000000b0055a416d5202mr8909683ywb.26.1685992538201;
        Mon, 05 Jun 2023 12:15:38 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id x128-20020a814a86000000b0056183cdb2d9sm3461661ywa.60.2023.06.05.12.15.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 12:15:37 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-bad0c4f6f50so7765184276.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jun 2023 12:15:37 -0700 (PDT)
X-Received: by 2002:a25:ce01:0:b0:bac:29:2bb9 with SMTP id x1-20020a25ce01000000b00bac00292bb9mr12904906ybe.14.1685992537073;
 Mon, 05 Jun 2023 12:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <647e23fe.170a0220.2075a.bcfb@mx.google.com>
In-Reply-To: <647e23fe.170a0220.2075a.bcfb@mx.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Jun 2023 21:15:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYb7e1PXP6L1Ssz1bmnFgQGFMmOj7n3Q9cgKivOH0oTA@mail.gmail.com>
Message-ID: <CAMuHMdXYb7e1PXP6L1Ssz1bmnFgQGFMmOj7n3Q9cgKivOH0oTA@mail.gmail.com>
Subject: Re: renesas/master baseline-nfs: 162 runs, 42 regressions (renesas-devel-2023-06-05-v6.4-rc5)
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 5, 2023 at 8:31 PM kernelci.org bot <bot@kernelci.org> wrote:
> renesas/master baseline-nfs: 162 runs, 42 regressions (renesas-devel-2023-06-05-v6.4-rc5)
>
> Regressions Summary
> -------------------
>
> platform                     | arch   | lab             | compiler | defconfig                    | regressions
> -----------------------------+--------+-----------------+----------+------------------------------+------------
> acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ok+kselftest | 1
> asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...6-chromebook | 1
> asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ebook+amdgpu | 1
> asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ok+kselftest | 1
> asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...6-chromebook | 1
> asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...6-chromebook | 1
> asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ebook+amdgpu | 1
> asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ok+kselftest | 2
> asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...6-chromebook | 1
> asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ok+kselftest | 1
> beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_v7_defconfig+ima       | 1
> beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_v7_defconfig+crypto    | 1
> beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
> hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...6-chromebook | 1
> hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ok+kselftest | 1
> hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ebook+amdgpu | 1
> hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ok+kselftest | 1
> hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...6-chromebook | 1
> hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ebook+amdgpu | 1
> hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ok+kselftest | 1
> imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
> imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_v7_defconfig           | 1
> imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_v7_defconfig+ima       | 1
> imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_v7_defconfig+crypto    | 1
> imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
> imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_v7_defconfig           | 1
> imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_v7_defconfig           | 2
> kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defconfig+videodec           | 2
> lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...6-chromebook | 1
> lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ebook+amdgpu | 1
> lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon...ok+kselftest | 1
> mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defconfig+arm...ook+videodec | 1
> mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
> mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defconfig+arm...ook+videodec | 1
> mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
> mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defconfig+arm...ook+videodec | 1
> rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defconfig+videodec           | 1
> sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
> sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defconfig+arm...ook+videodec | 1

As usual, I am (not) amazed by the number of non-Renesas regressions
that are being detected in the Renesas-specific renesas-devel tree.
Obviously all of these are present in plain v6.4-rc5, and should have
been detected in some other tree before?

Please correct me if I'm wrong, and thanks for fixing 8^)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
