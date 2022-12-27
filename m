Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD2E6568B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Dec 2022 10:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiL0JGw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Dec 2022 04:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiL0JGt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2022 04:06:49 -0500
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0606547
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:06:45 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id m12so2326113qvq.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:06:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6q9MAx9F5sahkLd72ie+LMKumpHRvFPGpkPXDhm6g04=;
        b=dqPhk4STnhSzy1q/RNurniEZpsYjkm9JtFTKopDoiYP7nEgy6tjLE9RLsAiA/kK9ZM
         znS2gaQdfPpX0kbjUFJ8F8MaJpF6WBkfQ60hFnWleIglwhohn6RX3j2tjOC4sQTewNJE
         6ZHrU5PaMrsZ61No73a6/CI7g17EnOVgc+SuItlJtJe4vPvuD0GvlvfcKvb7cqZOadAc
         c6nYItPsbBbwdvrEK94b038MUrFG3+2Ai5Exsfqs4GKhQhnyUkVWsiZJEsUNjOiEouIZ
         m75RJkv4JOzkkD97HCtfEH2H3s3hEby4FmFqMsv4j0xJqEgI2FlqoCT5K12uP6gV0pZT
         LMsg==
X-Gm-Message-State: AFqh2koHtHx60gKITHx+Sw9uW1G+EFHy2f31NB0zBhlN1CnTo/u/LEUb
        1Z9UR48aRQX8bDB7VViJr49WCJblUObj6w==
X-Google-Smtp-Source: AMrXdXugOzeCQWH4u1Gb7KCGxcFd78SpD507TafW68RgoibLK7vSU8q6hvvFf3mYmb1rOGEF+lPK8w==
X-Received: by 2002:a05:6214:5907:b0:52e:ec9c:b668 with SMTP id lp7-20020a056214590700b0052eec9cb668mr20413190qvb.5.1672132004899;
        Tue, 27 Dec 2022 01:06:44 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id w22-20020a05620a0e9600b00704a2a40cf2sm9016934qkm.38.2022.12.27.01.06.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 01:06:44 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-47fc4e98550so34260267b3.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:06:44 -0800 (PST)
X-Received: by 2002:a05:690c:c02:b0:370:202b:f085 with SMTP id
 cl2-20020a05690c0c0200b00370202bf085mr1582063ywb.502.1672132004228; Tue, 27
 Dec 2022 01:06:44 -0800 (PST)
MIME-Version: 1.0
References: <63a9b8cc.620a0220.7b0be.d8b4@mx.google.com>
In-Reply-To: <63a9b8cc.620a0220.7b0be.d8b4@mx.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Dec 2022 10:06:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUspDQzNYDhqQJjMebt19wCtQuVPc=+JFKxA=SFx34=fA@mail.gmail.com>
Message-ID: <CAMuHMdUspDQzNYDhqQJjMebt19wCtQuVPc=+JFKxA=SFx34=fA@mail.gmail.com>
Subject: Re: renesas/next baseline: 517 runs, 16 regressions (renesas-next-2022-12-26-v6.2-rc1)
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-renesas-soc@vger.kernel.org, kernelci-results@groups.io
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 26, 2022 at 4:11 PM kernelci.org bot <bot@kernelci.org> wrote:
> renesas/next baseline: 517 runs, 16 regressions (renesas-next-2022-12-26-v6.2-rc1)
>
> Regressions Summary
> -------------------
>
> platform                     | arch   | lab             | compiler | defconfig                | regressions
> -----------------------------+--------+-----------------+----------+--------------------------+------------
> imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_v7_defconfig+debug | 1
> imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_v7_defconfig+debug | 1
> imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | imx_v6_v7_defconfig      | 1
> imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | imx_v6_v7_defconfig      | 1
> ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_v6_defconfig       | 1
> qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_v7_defconfig+debug | 1
> qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_v7_defconfig+debug | 1
> qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_v7_defconfig+debug | 1
> qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_v7_defconfig+debug | 1
> qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_v7_defconfig+debug | 1
> qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_v7_defconfig+debug | 1
> qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_v7_defconfig+debug | 1
> qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_v7_defconfig+debug | 1
> qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_v7_defconfig+debug | 1
> qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64_defconfig+debug   | 1
> qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64_defconfig+debug   | 1
>
>   Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesas-next-2022-12-26-v6.2-rc1/plan/baseline/

More regressions in v6.2-rc1 not introduced in renesas/next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
