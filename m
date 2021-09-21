Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9B0413840
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 19:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhIUR1W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 13:27:22 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:38693 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbhIUR1V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 13:27:21 -0400
Received: by mail-vs1-f54.google.com with SMTP id y141so11630vsy.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 10:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DKcyxQwTTRL/A1iI97HuM1ApHSZ5t0KRUYO6O4wb+3U=;
        b=adMudHvz5PGCPvJsVP+HcEp6RmjDn3+qwfT8vxPzFaEwLliOZFrO88qbI4e+xBvyny
         Jks3qgchTAzxM8+083dZDmtkHnBHGXH4cM/Mfhzi7jDuS+KddGtQtfH/o8u7SnGNOVRD
         id25ti3ilyaiCN+K3sRgW5yauttIxE4EXe1m1YoyRriPs2OShDqT6QEnRc9yuYgzz37a
         JQEr7BfJ0M7AfoHPZat9ZNNH1jnNcwN6jTJQPF3Jf9KN5HMK+WuTKGg+ZZddDDOK/iZ0
         8RyIXmisUX14IsK/CM7wD+DkP7E4Ak2oI5K2kSM9ZbbHm8v1MF/c866airGR9U7lUKMh
         jRRg==
X-Gm-Message-State: AOAM531OuSMrbiXXKWQIVZOZuqLIwWYttGdKJpTW3CUYTO+C2QXQmXqn
        Tnvcp4sv2f+OzM0hd4OMZA7a03sf36Nv6nAZq3Y=
X-Google-Smtp-Source: ABdhPJyvhYSr4mEn4eVWJC7educ4MAsuy/bvkiWtWR3OhidHH9jrvC5ZuDC79LHCWu0aemoHN9OHzyf4r6j9+KL7ngM=
X-Received: by 2002:a67:2c58:: with SMTP id s85mr4880677vss.35.1632245149980;
 Tue, 21 Sep 2021 10:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210920093605.8906-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210920093605.8906-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Sep 2021 19:25:38 +0200
Message-ID: <CAMuHMdX0y6Kpm5=sgcV2VpVNsp7cP0=GwVufD+JFbpR7j0TrZw@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable RZ_DMAC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Michael Walle <michael@walle.cc>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 20, 2021 at 11:36 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable DMAC driver support for Renesas RZ/G2L based platforms.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
