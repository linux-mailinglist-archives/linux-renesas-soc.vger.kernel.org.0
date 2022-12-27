Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB9F6568AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Dec 2022 10:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiL0JGF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Dec 2022 04:06:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiL0JFz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2022 04:05:55 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F24A1E0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:05:54 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id i20so10001497qtw.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBYBa+SBXPJ3WHwG/42BM/Pn54u2QKBv21p0XhkSuOk=;
        b=56aE/QJFBe6Q5ZWVZiW+A+3bB4PIu+q1Gyg9kXeOMSj+N/wTgasyLxU0WFTMmsOV4/
         xn04TfAO/N5gH0WK0zC5nrnDDnGnNxdeSzjSnksD9pOLYeKTQSOl31qxRUrOEbUr5zSA
         MhFRR8tB8/1nOv8FWf6XRmK9tyanVVq7rA8s5AhRDEyqf9w3HGQpY1OaZilzHwskjhF2
         jJ+VlKTECq4JhUMlz+mpbStfsFwbFDAS8L68v9KYdn4poOiuCy3Jvgqul7jYJJDelwAo
         CizkjV13tZBr+krUpFArtSTROJilRROsdHMBjFdLnaS4I4kGYV8wUt7R7iYosBZZqPh6
         Fyag==
X-Gm-Message-State: AFqh2koSmQisX0B7UaAKn/F1T8wPR5wc+3G215YkUjwmNcmP30XG2mHA
        qoAQ/lDZVGpCDVqlr7eeP0LNNZ9oXAtpOA==
X-Google-Smtp-Source: AMrXdXuqiehER1y+SaDG7R/ekhussWcM38456G/XMU8NayfPDX6pk8cjKbFSi1tAJqRlQZP9mQ4SvA==
X-Received: by 2002:a05:622a:580c:b0:3a8:2b87:9fd8 with SMTP id fg12-20020a05622a580c00b003a82b879fd8mr30932327qtb.48.1672131952613;
        Tue, 27 Dec 2022 01:05:52 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id he9-20020a05622a600900b003a816011d51sm8102494qtb.38.2022.12.27.01.05.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 01:05:52 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id b16so13826613yba.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:05:52 -0800 (PST)
X-Received: by 2002:a25:e656:0:b0:6f9:29ef:a5ee with SMTP id
 d83-20020a25e656000000b006f929efa5eemr1644324ybh.380.1672131951798; Tue, 27
 Dec 2022 01:05:51 -0800 (PST)
MIME-Version: 1.0
References: <63a9bc8c.170a0220.36d08.ce0d@mx.google.com>
In-Reply-To: <63a9bc8c.170a0220.36d08.ce0d@mx.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Dec 2022 10:05:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXLbsyyJWDrFz1REr+Lsa7NXsSmX2L0-TP-Su=XE2Kq=w@mail.gmail.com>
Message-ID: <CAMuHMdXLbsyyJWDrFz1REr+Lsa7NXsSmX2L0-TP-Su=XE2Kq=w@mail.gmail.com>
Subject: Re: renesas/master baseline: 506 runs, 22 regressions (renesas-devel-2022-12-26-v6.2-rc1)
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

On Mon, Dec 26, 2022 at 4:41 PM kernelci.org bot <bot@kernelci.org> wrote:
> renesas/master baseline: 506 runs, 22 regressions (renesas-devel-2022-12-26-v6.2-rc1)
>
> Regressions Summary
> -------------------
>
> platform                     | arch   | lab             | compiler | defconfig                    | regressions
> -----------------------------+--------+-----------------+----------+------------------------------+------------
> imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_v7_defconfig+debug     | 1
> imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_v7_defconfig+debug     | 1
> imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | imx_v6_v7_defconfig          | 1
> imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | imx_v6_v7_defconfig          | 1
> imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | imx_v6_v7_defconfig          | 1
> kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defconfig+ima                | 1
> odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
> ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_v6_defconfig           | 1
> qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_v7_defconfig+debug     | 1
> qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_v7_defconfig+debug     | 1
> qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_v7_defconfig+debug     | 1
> qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_v7_defconfig+debug     | 1
> qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_v7_defconfig+debug     | 1
> qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_v7_defconfig+debug     | 1
> qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_v7_defconfig+debug     | 1
> qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_v7_defconfig+debug     | 1
> qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_v7_defconfig+debug     | 1
> qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_v7_defconfig+debug     | 1
> qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64_defconfig+debug       | 1
> qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64_defconfig+debug       | 1

Obviously all of the above are regressions in plain v6.2-rc1, so there
is not much point in reporting them here.

Looking at e.g. https://lore.kernel.org/all/?q=qemu_arm-virt-gicv3-uefi,
these regressions don't seem to be ever reported against the repository
that actually introduced the issue?

> r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobile_defconfig           | 1

first fail: renesas-devel-2022-11-10-v6.1-rc4: no idea
last pass: renesas-devel-2022-11-01-v6.1-rc3: last pass log is 404
https://storage.kernelci.org/renesas/master/renesas-devel-2022-11-01-v6.1-rc3/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html

> r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | renesas_defconfig            | 1

No idea what's wrong with the USB interrupt.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
