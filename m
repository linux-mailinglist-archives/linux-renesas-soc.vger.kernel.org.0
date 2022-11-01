Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381C26145E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Nov 2022 09:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbiKAIoC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 04:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbiKAIoB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 04:44:01 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7789B183B3
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 01:44:00 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id hh9so8863549qtb.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 01:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OW5NQpROzo7oPbjT0qkDSpEA4IuEKxlB5hu1uVeIcig=;
        b=F/5G1bosf2+OqZtCriJ+JnaxqKwKYKYcmEq9tJLqES7Mjjc1f56Cigv0PBYGFazEa/
         ZuQbsU+X+bfG0g7dNuB1MX6nwqUnKdF58G9A936STtyDyFaALY66liwIz2kmgYBs+mug
         sBNFAoSa1vvbZwu4gAPIBdLwHqsWLi+eJg2vReS184V63z2VOllx6TccsvlVrNwe8Awf
         s4MNfKHIwIuz2teJC1JtpkabcTZrkLx9ILqWLjp984zOl6XrNTQHKS/ih09cUsjrYdf+
         FDSX94KLPQRrJ3X20/0tFEs9Ay/yvmorUSGgsYM6a/f/o83Nut9qCTMjjIW93XvzIqnb
         AhZg==
X-Gm-Message-State: ACrzQf3ajMkuWOlpR8HglABcL52xGZumAlCunp4EVDCrRcMGlnAiV0RP
        TxbYqwBhb9q3IGW+WcjrUu7QWPDBAuW/Ow==
X-Google-Smtp-Source: AMsMyM4fv4H7l0CWU42xWe/Lw4yggu+wSt8Twj/Roktlg2DV0yxEtCfW0a8mc40SYKuTXa2r24m0fg==
X-Received: by 2002:ac8:5cca:0:b0:39d:952:1b41 with SMTP id s10-20020ac85cca000000b0039d09521b41mr13896698qta.602.1667292239366;
        Tue, 01 Nov 2022 01:43:59 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id e1-20020ac84b41000000b00398ed306034sm4808484qts.81.2022.11.01.01.43.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 01:43:59 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 63so16549906ybq.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Nov 2022 01:43:58 -0700 (PDT)
X-Received: by 2002:a05:6902:503:b0:6cf:c510:6a23 with SMTP id
 x3-20020a056902050300b006cfc5106a23mr304052ybs.380.1667292238702; Tue, 01 Nov
 2022 01:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <635c2176.170a0220.dc0ac.5f06@mx.google.com>
In-Reply-To: <635c2176.170a0220.dc0ac.5f06@mx.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Nov 2022 09:43:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVoguo5knqDKeSEdyYGFFgjMLHKGsZPLks845kOpiBT2g@mail.gmail.com>
Message-ID: <CAMuHMdVoguo5knqDKeSEdyYGFFgjMLHKGsZPLks845kOpiBT2g@mail.gmail.com>
Subject: Re: renesas/next baseline: 306 runs, 11 regressions (renesas-next-2022-10-28-v6.1-rc1)
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

On Fri, Oct 28, 2022 at 8:44 PM kernelci.org bot <bot@kernelci.org> wrote:
> renesas/next baseline: 306 runs, 11 regressions (renesas-next-2022-10-28-v6.1-rc1)
>
> Regressions Summary
> -------------------
>
> platform                     | arch  | lab           | compiler | defconfig                    | regressions
> -----------------------------+-------+---------------+----------+------------------------------+------------
> at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_defconfig            | 1
> jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
> kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig+CON...OMIZE_BASE=y | 1
> kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig+ima                | 1
> mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 1
> ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_defconfig           | 1
> rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 4
> sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chromebook   | 1
>
>   Details:  https://kernelci.org/test/job/renesas/branch/next/kernel/renesas-next-2022-10-28-v6.1-rc1/plan/baseline/

I believe none of these regressions are _introduced_ in renesas-next.
Please improve your reporting.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
