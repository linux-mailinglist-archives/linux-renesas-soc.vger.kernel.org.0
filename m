Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84952401B2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 14:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242173AbhIFM2A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 08:28:00 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:40770 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242100AbhIFM17 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 08:27:59 -0400
Received: by mail-vs1-f53.google.com with SMTP id d6so5433092vsr.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Sep 2021 05:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XZ2SwCMR7xY3+ubiM4RIhLgQUAxmfsYw7ZwqEEPziFY=;
        b=I5ShbJlO9hyaGwZjDcKFS+7QSk//0ZSzoIgLWylPt8cKPsXsRT6zi/Wp2gZXzRR12L
         UBV6LH6XP7MdV/sozjolqzCSPO84JKlgTjpnN9oJFk8JuxV+rIMHBAKds28tMHfs40oY
         MK2ELUY2Awv9HLxci/bDffra5qvO5nIxNqq40evj24J2ILDPdHq+tK0Vi+OrvOgAOUYU
         K75CovzMWNQKUpycCG24LN/BqVL8kn/zI9sUvgQsCy6aqPQ/D4pxduzXUth+Na1pBlrx
         3QMoezWrCLm+W1W3nnN9wo2XXOacMo12o04RMnNHJw7GzGUFLqlbYXJMJjduLSuOQK37
         FEYQ==
X-Gm-Message-State: AOAM532gnAr20ZygzKsE5Zn/6z+NkslqF00MJdOQLrSF2U9ZJxauDWE7
        h/x9GV5npmalkDNbDLlqsPIjpMOwNxSe6KBm7GU=
X-Google-Smtp-Source: ABdhPJxBIrF1KSvF1uz5OLGHLYlmssGEL18ymc/AAcYbk8eYYZzjm7kv1loCtGrDmXyJdAoWGJtkQGKerE4+ARYLYvg=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr5528879vsl.9.1630931214676;
 Mon, 06 Sep 2021 05:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210812151808.7916-1-biju.das.jz@bp.renesas.com> <20210812151808.7916-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210812151808.7916-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 14:26:43 +0200
Message-ID: <CAMuHMdWoToYKWQJG0-wsFJiMNFJLggbaTXyb=pzFnPff8LL1vg@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] arm64: defconfig: Enable RZ/G2L USBPHY control driver
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Nishanth Menon <nm@ti.com>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
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

On Thu, Aug 12, 2021 at 5:18 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L SoC supports USBPHY control,so enable it in ARM64 defconfig.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
