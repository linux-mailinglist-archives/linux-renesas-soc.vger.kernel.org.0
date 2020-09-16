Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1FE26BF1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 10:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgIPIY2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 04:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgIPIYZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 04:24:25 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA9DC06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2020 01:24:24 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x69so6034951lff.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2020 01:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OFjISGIagwR4SeKw+6zIGknT6qC0zhtZaREwxAbFdCo=;
        b=SoiC50HCmAj0ah/NoVfXO9B030PtiUyJJTACUw8il+Ewy1mOLRZFH5Dh525k4k7B/A
         SQBxYzmEjiu1m5Cwynqr7XMddp/oUnT8at3nrfVFF8zlBSkfgIOJ3MPOqWqYX+bqwmZJ
         yyiNgW4dGU1AJGq110Sva+MqQnapGkbqqcpyVInr3JBZztHHn7Y/qE8E7w/c0aBOhz8G
         KZ6AM6MXaDDm3YFFMXpcojQdi837g6Tv0RTq3AhRq7kzxPYXF6ylS4timkXS8vMrZjm/
         GTYvArTgSPb16VWpAaYiD0TtEwUF8YZA4lYSL+trm0EZGAYImvat5/lcwBKD/HtBUy6t
         +n3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OFjISGIagwR4SeKw+6zIGknT6qC0zhtZaREwxAbFdCo=;
        b=Nt/1KNISWf/+QJJxR1YfzH2SSBHTIVrdeRpN8DVOA6dofAo11FbU3uyNsYSuULiZtO
         sbLgu16gpyyDenElxvv3pwHNpJc6RUIJe2M6hEvTyChfXpj3FznAridyh/savmsNsUFf
         GYwfTyqUlxN0WIztvgJUiCVZ5L+zmXgaS+sQk7OIPJa/iAPZGePcVgWW6jGffYAwOrQy
         GrkHzokD8b1fTMeomkFNIoD2Z/XBxCi+zRbP9jonYu2Kt4/oXGAVMNaUUiaYitUzfL++
         56wp3CKhWPYEqjqLN/78QYYPKQTz2xXUZzGISvihoYsAmysR4mt3HVWzpleEsysfY5Vx
         ECxA==
X-Gm-Message-State: AOAM533jLfolt3YY4j2LTiKzSUVpZTciZm1ZfruV6W8kZOUZXwPoSbR6
        aOqaBo68q/7EI6+tRlWrrDW9Rp5wSUy5intTEu/llA==
X-Google-Smtp-Source: ABdhPJwjwaA/obULeIssaKAdJsSzCJcfp1L3ZsUhY6AoGdTANgaQkhAmgXhAxtdJmFYd0wy/onLNNgpNOurTT7lg2MQ=
X-Received: by 2002:a05:6512:370b:: with SMTP id z11mr6753834lfr.571.1600244663107;
 Wed, 16 Sep 2020 01:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200902153606.13652-1-geert+renesas@glider.be>
 <CACRpkdZ44wuYp1aWZ-mYkJJAZUXfAZ9XVYf0rDKT8GH_JE8ezQ@mail.gmail.com> <CAMuHMdXBpLSdRiVkfpO-F7HpJLDqFW1LKfZnCS8nzH_ncq8ZQA@mail.gmail.com>
In-Reply-To: <CAMuHMdXBpLSdRiVkfpO-F7HpJLDqFW1LKfZnCS8nzH_ncq8ZQA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Sep 2020 10:24:12 +0200
Message-ID: <CACRpkdaUgatCxQvZdPbc+HvxCVF2=O71T5XjrW=0jsTR7j+_ZQ@mail.gmail.com>
Subject: Re: [PATCH v9] ARM: boot: Validate start of physical memory against DTB
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 8, 2020 at 8:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> I agree there are plenty of opportunities to improve of head.S.
> Unfortunately there are also plenty of opportunities to break someone's
> boot process ;-(
>
> Nicolas' patch to reshuffle the registers looks like a good first step...

I must have missed this patch! I'll try to find it.

Yours,
Linus Walleij
