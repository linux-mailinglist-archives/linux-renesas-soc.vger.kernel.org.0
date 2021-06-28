Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BAC43B5DDE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jun 2021 14:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbhF1MVf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Jun 2021 08:21:35 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:34438 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbhF1MVe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jun 2021 08:21:34 -0400
Received: by mail-vs1-f50.google.com with SMTP id x1so9911849vsc.1;
        Mon, 28 Jun 2021 05:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OI9hMgOkRk9n8f6Ek46ec25HbterxvkEhKRWnunKyMw=;
        b=ED7oUCzOykdCKO2CD3L2GvQdqjfpcEU+wlmPYOPCJdh2ZG2FoI3zIEnayohdANj723
         v/XQeqV8PKvTPtdx77jCNfpjRx5wbBRbD9Ca2VFdrsScnZdD9HWvufxNyT78CcZleEYw
         B9HWM37xExd6mS3aXmgpr9Oefcz5/p72NIOAYCbKAnWdFkTUwfmBGxIi/iG2JHdpSu/Y
         2QjiJF8OKJsSxAjwdxI3cUhwTRaBD26PCW2xlz9QfPnH7MIDuP4obNj7hPMBztZc4iPa
         EcQZpAc76ig14lIRmVd7ZJrrV85ikV8oCsmkthmRLvH0Mm/FNB1LQYCLH775vrX/IQmz
         aGWQ==
X-Gm-Message-State: AOAM531ybkv3cIPzlhgHUf0lm5K+uzEuHTgtv3Bh+y1wmCazk5TytPri
        SMUODBN/EZbV69KSf61NWRjnwkLaJGLbZLbaKNU=
X-Google-Smtp-Source: ABdhPJyajj8csAdyY5BLkdE47ZFqbswNxBZe2r1SI3UdW0JFswAJNq8k/NVFgNuCXg5Ysu19hURObZnH8YgjLBViq1M=
X-Received: by 2002:a67:770d:: with SMTP id s13mr5098056vsc.40.1624882748819;
 Mon, 28 Jun 2021 05:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jun 2021 14:18:57 +0200
Message-ID: <CAMuHMdVohKYf9u6pXh5=FcD_A28F-DzjP_KUanH9W6ozZ-v-Xw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] Update clock definitions
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju, Mike, Stephen, Arnd, Olof,

On Sat, Jun 26, 2021 at 10:13 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch series aims to update clock and reset definitions as per
> RZ/G2L_clock_list_r02_02.xlsx and RZ/G2L HW(Rev.0.50) manual.
>
> As per this, we need to separate resets from module clocks in order to
> handle it efficiently.
>
> Added support for multi clock PM support and updated clock driver enties.
>
> This patch series is tested with USB Host, USB Device, I2C, DMAC and SSI.
>
> This patch series is based on [1] and [2]
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=renesas-clk-for-v5.15
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/
>
> v3->v4:
>  * Fixed the code comment onoff to bit.
> v2->v3
>  * Improved clk/reset code as per Geert's suggestion.
>  * Added Geert's Rb tag
>
> v1->v2
>  * Updated reset entries
>  * Added Geert's Rb tag for multi clock PM support.
>
> v1:
>  * https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=503135

Thanks for your series!

For those who missed the story behind this: after queuing the initial
support for the new Renesas RZ/G2{L,LC} SoCs for v5.14, we discovered
an issue with the way how clocks and resets are handled for modules
more complex than serial ports and i2c controllers.  Fixing that
required a redesign of the DT binding definitions, which are a hard
dependency for both the clock/reset driver and DTS.

Hence to avoid regressions and bisection issues, I plan to queue the
first 7 patches (with patches 5-7 squashed together) in renesas-fixes
for v5.14 after v5.14-rc1 has been released.  The last 3 patches
can be handled normally again, and are to be queued in renesas-devel
for v5.15.

Sorry for the mess, and thanks for your understanding!

> Biju Das (10):
>   drivers: clk: renesas: renesas-rzg2l-cpg: Add multi clock PM support
>   drivers: clk: renesas: r9a07g044-cpg: Rename divider table
>   drivers: clk: renesas: r9a07g044-cpg: Fix P1 Clock
>   drivers: clk: renesas: r9a07g044-cpg: Add P2 Clock support
>   dt-bindings: clk: r9a07g044-cpg: Update clock/reset definitions
>   drivers: clk: renesas: r9a07g044-cpg: Update {GIC,IA55,SCIF}
>     clock/reset entries
>   arm64: dts: renesas: r9a07g044: Update SCIF0 clock/reset
>   drivers: clk: renesas: r9a07g044-cpg: Add I2C clocks/resets
>   drivers: clk: renesas: r9a07g044-cpg: Add DMAC clocks/resets
>   arm64: dts: renesas: r9a07g044: Add I2C nodes
>
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi |  84 +++++++-
>  drivers/clk/renesas/r9a07g044-cpg.c        |  99 ++++++---
>  drivers/clk/renesas/renesas-rzg2l-cpg.c    | 110 +++++-----
>  drivers/clk/renesas/renesas-rzg2l-cpg.h    |  37 +++-
>  include/dt-bindings/clock/r9a07g044-cpg.h  | 236 ++++++++++++++++-----
>  5 files changed, 419 insertions(+), 147 deletions(-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
