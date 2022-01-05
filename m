Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814FF484FFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jan 2022 10:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238854AbiAEJYu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jan 2022 04:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238851AbiAEJYu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jan 2022 04:24:50 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06ADCC061785
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jan 2022 01:24:50 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id q14so151570323edi.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jan 2022 01:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x/Nken2odV4gckkQ8V6N90O1oM6oc/RLFuu7U65G9ng=;
        b=enCDi3X3u8T4D6TrBkYLVSCRvi7Icbz9yjgOi3UoOeRpka+U4Gzd/Wxd25C5Gdb3G/
         GMSeKDHw8db7ACPAcG2Aqn9Sq2unMNk+UMKtgNKp6BFmS51332wsfG9ZeSFny/AuA2YJ
         OUNBBcZ5QRdV4F4jXwWu7NTBc12LeuAlzABmgudthJ5gITvkLudYukB1uFE16vRBEipH
         oL+EZ5p1iJ+qI3BMIXPSGA1K+6gdfjB4MqqAjDIVzC2kog9gVgLX6Pp2sFfEQPpNFuFt
         jiKSPVN9qKQL0V+cFOOf0MOuJfOTFWka5pWca6b3wvfICtv70eMtIYxL4IcRJqaScicU
         OZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x/Nken2odV4gckkQ8V6N90O1oM6oc/RLFuu7U65G9ng=;
        b=rzNZnQpmRKS3/YvT5u76TAaABr05Kg/KkfZXycGWbEq7MhRdnSrSAMnuBT21xBK0CQ
         7pdNYMS2wqRJvAqSkcoTNacd1dFgd15N45M/n48aMrAzTPkI0+iIcLJthQy5n1rJEMN2
         kEbbdrEkAbpNw0UvAqs1sEprDKPpnicWgDN0DsgJ6fB19vLvzRF/C3Sqn41ZUYjtoP2F
         LBo38GbV1uOEY+ronOGN9GQPk/N/TvhaEk+pTDiwRORfpD3mFHK1hCK8Syi/Qy2YH8jw
         Rx0kwatLyvaNeSuIa/kbUQxMNjPBVPYsdUrtQ7+o2MAjSssmkaS5+NglkKVfmU4+lOfQ
         d8yw==
X-Gm-Message-State: AOAM5333LWl2Lyx9zLa18YLQlCWtdb+nWH9g5ESBHOH2dEYWgcxeEzQU
        JAlZTwjY1rkVynDJftmb4TZXaZpPUsqWg0px3aWGXMsdMENBvA==
X-Google-Smtp-Source: ABdhPJyATT38VL55Ws94nS9wqslEGbupCfSKXrv3FU/7Gb1aF9isr5j8LAZacVQJUds8OKc2Sb7KlPo5Gnes2znyX9k=
X-Received: by 2002:a17:907:62a8:: with SMTP id nd40mr7909363ejc.101.1641374688581;
 Wed, 05 Jan 2022 01:24:48 -0800 (PST)
MIME-Version: 1.0
References: <20211222171915.9053-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211222171915.9053-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211222171915.9053-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 5 Jan 2022 10:24:38 +0100
Message-ID: <CAMRc=MfYuu_mBe2Ym=izAe942UzvoTSuGpsEVHvuBHkO48pnuw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Use platform_get_irq() to get the interrupt
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 22, 2021 at 6:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypassed the hierarchical setup and messed up the
> irq chaining.
>
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

Applied, thanks!

Bart
