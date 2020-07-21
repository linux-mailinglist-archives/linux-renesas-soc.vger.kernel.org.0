Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41C722806A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jul 2020 14:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgGUM7N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Jul 2020 08:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbgGUM7M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jul 2020 08:59:12 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B460C061794
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jul 2020 05:59:12 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 140so1222897lfi.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jul 2020 05:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D/VfADr9Dc4CizmTbEXh+Zjq4M/bzfmDBA6N1o/I0nk=;
        b=r3XFJj4ge6eNTcM4tl0x5EDh2caMgdqsSw4pTwnGuCoXmIVVlD5cO1LRoi5C+zhqsq
         Zy07hhMv38Vi1/b2IOOAB80MxtaIS05A9BSE3TytYzVOLaDmucE49cxru0R49R2S9/hy
         SXcuXgxb/h6Ms8jYRAkCiir1fTbAq787eE9Sk7qbVuJVqlK898qW7i5x/UMm+PwuXw6I
         3TAHx+IrTI6N6L7Rv8YWRkHNRk1H6SQuu4R42vwj+/0afEh1RavRha0kYp2wk0VNM6rD
         6y8d4D5qo27ojbvpZ8JHAkmn5ZZTKl7ONOfdoBE2JtyGMfFP8BYsdIJH6IrBVlfBkZ/r
         UzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D/VfADr9Dc4CizmTbEXh+Zjq4M/bzfmDBA6N1o/I0nk=;
        b=qGMsiF5dyNp/jHPeGLuyI8h2eGrXtgbt8dnNWeVvYS4ceP6cF1oHwETmkk9cU6iEwq
         XSkk5IAKT+em5GmNhs1Rh/PjE0i0gshjT4vXLmS29/yj4+2WHE4I3qy+uKMj1Ut5PK9W
         b0wJ2zKG2CktrP6LSfFp04Vkeq8SjnFjtwkRgyNwdpctiOfprWml3gDwLaqTNwh2xBtN
         LLIpJuMEedUKN1e6+fiYea8ejkBMUnpWnaOWRFoaYgPsj+IgPWqYWJ2sa+hpRdeWMrlQ
         6Xlt0AHBShbkRo8MMAfN4hdbsWTiWxfF6dYO5NwLrcF9QH+81VpcbT1/qOy8jGsA9eeo
         70aA==
X-Gm-Message-State: AOAM530dMW3x8zp828H8n6fM6Q/yBxG1BmGw0mJ/KBoy5FEs9oqPZZ6e
        qzyecXfVl+oU8JymsWv6CRLwQlbfq5NvucYJr/ELIA==
X-Google-Smtp-Source: ABdhPJzYpK5bIKiQx3FRFLKeKNO46qYN5hT7wSZrzXa5f0g2KrdfvVSefa7HYlmLRQJGo1IZp7X07UEnux6KUCFquE4=
X-Received: by 2002:ac2:5dc1:: with SMTP id x1mr3509636lfq.217.1595336350190;
 Tue, 21 Jul 2020 05:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200706150205.22053-1-geert+renesas@glider.be>
 <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com> <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com>
In-Reply-To: <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 21 Jul 2020 14:58:59 +0200
Message-ID: <CACRpkdbxQrmNtByZ1cHSROyX7rwwaa2Mb=GQLpVcDi4FsZ06FQ@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
To:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Laura Abbott <labbott@redhat.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kumar Gala <kumar.gala@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 20, 2020 at 11:53 AM Arnd Bergmann <arnd@arndb.de> wrote:

> No idea what /exactly/ is going wrong, but I would point out that this is one
> of the platforms that is handled as a special case in the Makefile when
> setting TEXT_OFFSET:
(...)
> textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
> textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
> textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000

But what on earth is this? I just deleted this and the platform
boots just as well.

It was originally added by Stephen in
commit 9e775ad19f52d70a53797b4d0eb740c52b0a9567
"ARM: 7012/1: Set proper TEXT_OFFSET for newer MSMs"
to patch around memblocks in the board files in
mach-msm/* These boardfile hacks that seem to relate to this
textofs are now *GONE* but this is still here!

Laura, Stephen, Bjorn: can't we just delete these QCOM
textofs things so as to clean out some confusion?

Or is my APQ8060 odd once again and the rest of the world
crashes if we remove this?

Yours,
Linus Walleij
